package datapro.eibs.client;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.ECO100301Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.services.ExcelXLSXResultSet;

public class JSECO1003 extends JSEIBSServlet {

	private ServletConfig config = null;
	
	protected static final int R_ENTER_FILE = 2;
	protected static final int A_ENTER_FILE = 1;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Request
			case R_ENTER_FILE :
				procReqImport(user, req, res, session);
				break;
			case A_ENTER_FILE :
				procReadExcelFile(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqImport(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		
		forward("ECO1003_transfer_file.jsp", req, res);
	}

	private void procReadExcelFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		String PageToCall = "";
		int rows = 0;

		try {
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			com.jspsmart.upload.File file =  mySmartUpload.getFiles().getFile(0);
			
			InputStream xls = Util.getStreamFromFile(file);													
			
			ResultSet rs = null;
			
			if (ExcelUtils.isXLSXVersion(file.getFilePathName())) {
				rs = new ExcelXLSXResultSet(xls, 0);
				((ExcelXLSXResultSet)rs).init();
			} else {
				rs = new ExcelResultSet(xls, 0);
				((ExcelResultSet)rs).init();
			}
			
			mp = getMessageProcessor("ECO1003", req);
			
			boolean error = false;

			while (rs.next()) {
				ECO100301Message msg = (ECO100301Message) mp.getMessageRecord("ECO100301");
	            msg.setH01USERID(user.getH01USR());
				ExcelUtils.populate(rs, msg);
				mp.sendMessage(msg);
				ELEERRMessage msgErr = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				rows++;
			}
			
			if (!error) {
				ECO100301Message msg = (ECO100301Message) mp.getMessageRecord("ECO100301");
	            msg.setH01USERID(user.getH01USR());
				msg.setH01FLGMAS("*"); 
				mp.sendMessage(msg);
				msgError = (ELEERRMessage) mp.receiveMessageRecord();
				if (mp.hasError(msgError)) {
					PageToCall = "ECO1003_transfer_file.jsp";
				} else {
					req.setAttribute("rows", String.valueOf(rows));
					PageToCall = "ECO1003_transfer_file_confirm.jsp";
				}
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			forward(PageToCall, req, res);
			
		} catch (Exception e) {
			e.printStackTrace();
			msgError = new ELEERRMessage();
			msgError.setERRNUM("3");
			msgError.setERNU01("0001");		//4		                
			msgError.setERDS01("Error en Record: " + (rows + 1)); //70
			msgError.setERNU02("0002");		//4		                
			msgError.setERDS02(e.getClass().getName());//70
			msgError.setERNU02("0003");		//4		                
			msgError.setERDS02(e.getMessage().trim().length() > 70 ? e.getMessage().substring(0, 69) : e.getMessage().trim());//70
			session.setAttribute("error", msgError);						
			forward("ECO1003_transfer_file.jsp", req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
}
