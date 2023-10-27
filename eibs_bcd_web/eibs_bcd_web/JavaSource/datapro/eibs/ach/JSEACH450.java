package datapro.eibs.ach;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.EACH450DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEACH450 extends JSEIBSServlet {

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
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}

	private void procReadExcelFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		File tmp = null;
		String PageToCall = "";
		//read file
		try {
			mp = getMessageProcessor("EACH450", req);
			
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			com.jspsmart.upload.File file =  mySmartUpload.getFiles().getFile(0);
			
			file.saveAs(JSEIBSProp.getImgTempPath() + "excel.tmp");
			
			tmp = new File(JSEIBSProp.getImgTempPath(), "excel.tmp");
			FileInputStream xls = new FileInputStream(tmp);
			
			ExcelResultSet rs = new ExcelResultSet(xls, 0);
			rs.init();
			boolean first = true;
			boolean error = false;
			int rows = 0;
			String opecode = "0001";
			String reference = "";
			while (rs.next()) {
				EACH450DSMessage msg = (EACH450DSMessage) mp.getMessageRecord("EACH450DS");
	            msg.setH01PROGRM("EACH450");
	            msg.setH01USERID(user.getH01USR());
	            msg.setH01TIMSYS(getTimeStamp());
	            msg.setH01SCRCOD("01");
	            msg.setH01OPECOD(opecode);
	            msg.setE01IBSREF(reference);
				if (first) {
					msg.setH01FLGMAS("F"); //First Element List
					first = false;
				} else {
					//msg.setH01FLGMAS("+");
					msg.setH01FLGWK1("S");
				}
				ExcelUtils.populate(rs, msg);
				mp.sendMessage(msg);
				//	Receive Error Message
				msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msg = (EACH450DSMessage) mp.receiveMessageRecord("EACH450DS");
				
				if ("0001".equals(opecode)) {
					reference = msg.getE01IBSREF();
					opecode = "0002";
				}
				error = mp.hasError(msgError); 
				if (error) {
					PageToCall = "EACH450_ach_transfer_file.jsp";
					break;
				}
				rows++;
			}
			if (!error) {
				EACH450DSMessage msg = (EACH450DSMessage) mp.getMessageRecord("EACH450DS");
	            msg.setH01PROGRM("EACH450");
	            msg.setH01USERID(user.getH01USR());
	            msg.setH01TIMSYS(getTimeStamp());
	            msg.setH01SCRCOD("01");
	            msg.setH01OPECOD("0002");
	            msg.setE01IBSREF(reference);
				msg.setH01FLGMAS("*"); //Last Element List
				msg.setH01FLGWK1("*");
				mp.sendMessage(msg);
				//	Receive Error Message
				msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msg = (EACH450DSMessage) mp.receiveMessageRecord("EACH450DS");
				
				if (mp.hasError(msgError)) {
					PageToCall = "EACH450_ach_transfer_file.jsp";
				} else {
					session.setAttribute("msg", msg);
					req.setAttribute("rows", String.valueOf(rows));
					PageToCall = "EACH450_ach_transfer_file_confirm.jsp";
				}
			}
			
			flexLog("Putting java beans into the session");
			req.setAttribute("rows", String.valueOf(rows));
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			forward(PageToCall, req, res);
			
		} catch (Exception e) {
			flexLog("Exception: " + e.getClass().getName() + " -- Error: " + e.getMessage());
			throw new ServletException(e);
		} finally {
			if (tmp != null) tmp.delete(); 
			if (mp != null)	mp.close();
		}
	}
	
	private void procReqImport(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		
		forward("EACH450_ach_transfer_file.jsp", req, res);
	}
}
