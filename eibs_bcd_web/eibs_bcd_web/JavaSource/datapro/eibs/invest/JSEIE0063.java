package datapro.eibs.invest;
import java.io.IOException;
import java.io.LineNumberReader;
import java.io.StringReader;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import datapro.eibs.beans.EIE006301Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

public class JSEIE0063 extends JSEIBSServlet { 
	
	private ServletConfig config = null;
	
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = getUserPos(req);
		
		if (userPO.getPurpose().equals("PROCESS")) {
			screen = 200;
		}
		
		switch (screen) {
			//  
			case 100 : // Request File Name 
				procReqFile(user, req, res, session);
				break;
			case 200 : // Process File
				procActionFile(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	// SCREEN = 100 
	// Send Request for File Name  
	//
	protected void procReqFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("ENTER");
		ses.setAttribute("userPO", userPO);
		forwardOnSuccess("EIE0063_prices_transfer_file.jsp", req, res);
		
	}

	// SCREEN = 200
	// Validate and/or Process File  
	//
	protected void procActionFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EIE006301Message msg = null;
		UserPos userPO = null;
		boolean FirstT = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("ENTER");
		
		try {
			mp = new MessageProcessor("EIE0063");
			msg = (EIE006301Message)ses.getAttribute("invInst");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EIE0063");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0005");
			try {
				SmartUpload mySmartUpload = new SmartUpload();
				mySmartUpload.initialize(config, req, res);
				mySmartUpload.upload();
				com.jspsmart.upload.File myFile =  mySmartUpload.getFiles().getFile(0);
		
				try {
			 	  msg.setE01QUOTEM(mySmartUpload.getRequest().getParameter("E01QUOTEM"));
				}
				catch (Exception e)	{
				}
				try {
			 	  msg.setE01QUOTED(mySmartUpload.getRequest().getParameter("E01QUOTED"));
				}
				catch (Exception e)	{
				}
				try {
			 	  msg.setE01QUOTEY(mySmartUpload.getRequest().getParameter("E01QUOTEY"));
				}
				catch (Exception e)	{
				}
				try {
			 	  msg.setE01QUOTET(mySmartUpload.getRequest().getParameter("E01QUOTET"));
				}
				catch (Exception e)	{
				}
				try {
			 	  msg.setH01FLGWK2(mySmartUpload.getRequest().getParameter("H01FLGWK2"));
				}
				catch (Exception e)	{
				}
			
				mp.sendMessage(msg);
			
				//read file
				StringReader sr = new StringReader(myFile.getContentString());
				LineNumberReader lnr = new LineNumberReader(sr);
				String line = "";			
				msg = new EIE006301Message();
				try {
			 	  msg.setE01QUOTEM(mySmartUpload.getRequest().getParameter("E01QUOTEM"));
				}
				catch (Exception e)	{
				}
				try {
			 	  msg.setE01QUOTED(mySmartUpload.getRequest().getParameter("E01QUOTED"));
				}
				catch (Exception e)	{
				}
				try {
			 	  msg.setE01QUOTEY(mySmartUpload.getRequest().getParameter("E01QUOTEY"));
				}
				catch (Exception e)	{
				}
				try {
			 	  msg.setE01QUOTET(mySmartUpload.getRequest().getParameter("E01QUOTET"));
				}
				catch (Exception e)	{
				}
				try {
			 	  msg.setH01FLGWK2(mySmartUpload.getRequest().getParameter("H01FLGWK2"));
				}
				catch (Exception e)	{
				}				
				
				// Read text file									
				line = lnr.readLine();
				while (line != null) {
					msg.setH01USERID(user.getH01USR());
					msg.setH01PROGRM("EIE0063");
					msg.setH01TIMSYS(getTimeStamp());
					msg.setH01OPECOD("0001");
					msg.setH01FLGWK3("");
					msg.setH01FLGWK2(" ");
					if (!FirstT) {
						msg.setH01FLGWK2("C");	// Clear File First Time
						FirstT = true;
					}				
					msg.setE01DATA(line);			// Text Line
					mp.sendMessage(msg);			// Send Information to host
					msg.destroy();
					line = lnr.readLine();
				} // End Of Loop

				lnr.close();
				sr.close();

				msg = new EIE006301Message();
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EIE0063");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01OPECOD("0001");
				msg.setH01FLGWK3("*");
				msg.setE01DATA("");
				// Send Second Information
				flexLog("Record 3 : Send Last Record Indicator = " + msg.getH01FLGWK1());
				mp.sendMessage(msg);
				
				// Receive Error Message or Data Message (Optional)
					ses.setAttribute("userPO", userPO);
					newmessage = mp.receiveMessageRecord();
					if (mp.hasError(newmessage)) {
						ses.setAttribute("error", newmessage);
						forward("EIE0063_prices_transfer_file.jsp", req, res);
					} else {
						forward("EIE0063_prices_transfer_cinfirm.jsp", req, res);
					}
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("File Upload Error");
				}
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
}
