package datapro.eibs.client;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.ECO100001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.services.ExcelXLSXResultSet;

public class JSECO1000 extends JSEIBSServlet {

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

	private void procReadExcelFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		String PageToCall = "";
		int rows = 0;
		//read file
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
			
			mp = getMessageProcessor("ECO1000", req);
			
			boolean error = false;
			while (rs.next()) {
				ECO100001Message msg = (ECO100001Message) mp.getMessageRecord("ECO100001");
	            msg.setUSUARIO(user.getH01USR());
				ExcelUtils.populate(rs, msg);
				mp.sendMessage(msg);
				rows++;
			}
			if (!error) {
				ECO100001Message msg = (ECO100001Message) mp.getMessageRecord("ECO100001");
	            msg.setUSUARIO(user.getH01USR());
				msg.setFLAGMAS("*"); //Last Element List
				mp.sendMessage(msg);
				//	Receive Error Message
				msgError = (ELEERRMessage) mp.receiveMessageRecord();
				if (mp.hasError(msgError)) {
					PageToCall = "ECO1000_transfer_file.jsp";
				} else {
					req.setAttribute("rows", String.valueOf(rows));
					PageToCall = "ECO1000_transfer_file_confirm.jsp";
				}
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			forward(PageToCall, req, res);
			
		} catch (Exception e) {
			msgError = new ELEERRMessage();
			msgError.setERRNUM("2");
			msgError.setERNU01("0001");		//4		                
			msgError.setERDS01("Error en Record: " + (rows + 1));//70
			msgError.setERNU02("0002");		//4		                
			msgError.setERDS02(e.getMessage().trim().length() > 70 ? e.getMessage().substring(0, 69) : e.getMessage().trim());//70
			session.setAttribute("error", msgError);						
			forward("ECO1000_transfer_file.jsp", req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	private void procReqImport(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		
		forward("ECO1000_transfer_file.jsp", req, res);
	}

}
