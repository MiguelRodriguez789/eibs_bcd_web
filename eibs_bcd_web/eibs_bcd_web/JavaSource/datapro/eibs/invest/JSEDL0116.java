package datapro.eibs.invest;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import datapro.eibs.beans.EDL0116DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0116 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// Action 
	private ServletConfig config = null;

	protected static final int R_ENTER_FILE = 100;
	protected static final int A_ENTER_FILE = 1;

	/**
	 * This method was created by Author.
	 * 
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void procReqEnterFileName(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = new UserPos();
		MessageRecord newmessage = null;
		MessageProcessor mp = null;
	
		try {
			mp = getMessageProcessor("EDL0116", req);
			
			//Send first Record
			EDL0116DSMessage msg= (EDL0116DSMessage) mp.getMessageRecord("EDL0116DS", user.getH01USR(), "0001");
			msg.setH01PROGRM("EDL0116");
			msg.setH01USERID(user.getH01USR());
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001"); //Validate user
			mp.sendMessage(msg);
			
			// Receive Error Message
			newmessage =  mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				forward(sckNotRespondPage, req, res);
			} else {
				msg =  (EDL0116DSMessage)mp.receiveMessageRecord("EDL0116DS");
				userPO.setIdentifier(msg.getE01IBSREF());
				ses.setAttribute("userPO", userPO);
				forward("EDL0116_transfer_file.jsp", req, res);
			}

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		} finally {
			if (mp != null)mp.close();
		}
	}

	/**
	 * procActionFileName
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionFileName(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		//read file
		SmartUpload mySmartUpload = new SmartUpload();
		mySmartUpload.initialize(config, req, res);
		try {
			mySmartUpload.upload();
		
			File myFile = mySmartUpload.getFiles().getFile(0);
			//FileType = mySmartUpload.getRequest().getParameter("OPT");
				
			String extension = myFile.getFileExt();
			if (extension.equals("xls") || extension.equals("xlsx")) {
				sendExcelFile(user, req, res, ses, myFile);
			} else {
				ELEERRMessage msgError = new ELEERRMessage();
				msgError.setERRNUM("1");
				msgError.setERDS01("Este tipo de archivo no es soportado por esta opcion");
				ses.setAttribute("error", msgError);
				forward("EDL0116_transfer_file.jsp", req, res);
			}
		} catch (SmartUploadException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}

	}
	
	
	/**
	 * sendExcelFile
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @param myFile
	 * @throws IOException
	 * @throws ServletException
	 */
	private void sendExcelFile(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses, File myFile)
			throws IOException, ServletException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		java.io.File tmp = null;
		String pageToCall = "";
		UserPos userPO = (UserPos)ses.getAttribute("userPO");

		try {
			mp = getMessageProcessor("EDL0116", req);
			System.out.println(JSEIBSProp.getImgTempPath());
			myFile.saveAs(JSEIBSProp.getImgTempPath() + "excel.tmp");
			
			tmp = new java.io.File(JSEIBSProp.getImgTempPath(), "excel.tmp");
			FileInputStream xls = new FileInputStream(tmp);
			
			//Send first Record
			EDL0116DSMessage msg= (EDL0116DSMessage) mp.getMessageRecord("EDL0116DS");
			msg.setH01FLGWK1("S");
			msg.setE01IBSREF(userPO.getIdentifier());
			
			ExcelResultSet rs = new ExcelResultSet(xls, 0);
			rs.init();
			int rows = 0;
			while (rs.next()) {
				msg = (EDL0116DSMessage) mp.getMessageRecord("EDL0116DS");
				ExcelUtils.populate(rs, msg);
				msg.setH01OPECOD("0002");
				msg.setH01USERID(user.getH01USR());
				msg.setH01FLGWK1("S");
	            msg.setE01IBSREF(userPO.getIdentifier());	
				mp.sendMessage(msg);
				
				//Receive Error Message
				newmessage =  mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					msgError = (ELEERRMessage) newmessage;
					ses.setAttribute("error", msgError);
					pageToCall = "EDL0116_transfer_file.jsp";
					break;
				} else {
					newmessage =  mp.receiveMessageRecord();
					req.setAttribute("rows", String.valueOf(rows));
					pageToCall = "EDL0116_transfer_file_confirm.jsp";
				}
				rows++;
			}
			
			msg = (EDL0116DSMessage) mp.getMessageRecord("EDL0116DS");
			msg.setH01FLGWK1("*");
			msg.setE01IBSREF(userPO.getIdentifier());
			msg.setH01OPECOD("0002");
			msg.setH01USERID(user.getH01USR());
				
			mp.sendMessage(msg);
			
			//	Receive Error Message
			newmessage =  mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				pageToCall = "EDL0116_transfer_file.jsp";
			} else {
				newmessage =  mp.receiveMessageRecord();
				req.setAttribute("rows", String.valueOf(rows));
				pageToCall = "EDL0116_transfer_file_confirm.jsp";
			}
			
			forward(pageToCall, req, res);
		
		} catch (Exception e) {
			flexLog("Exception: " + e.getClass().getName() + " -- Error: " + e.getMessage());
			throw new ServletException(e);
		} finally {
			if (tmp != null) tmp.delete(); 
			if (mp != null)	mp.close();
		}

	}


	/**
	 * 
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {

		//Request
		case R_ENTER_FILE :
			procReqEnterFileName(user, req, res, session);
			break;
		case A_ENTER_FILE :
			procActionFileName(user, req, res, session);
			break;
			// END Entering

		default :
			forward(super.devPage, req, res);
			break;
	}
		
	}
}
