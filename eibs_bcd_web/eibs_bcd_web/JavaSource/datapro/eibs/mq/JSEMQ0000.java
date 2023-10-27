package datapro.eibs.mq;
/**
 * MQ Incoming  
 * Creation date: (01/02/18)
 * @author: Carlos Castillo
 *                   
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Request MQ File Name          
 *	// SCREEN =    2    Validate MQ Incoming File 
 **	// SCREEN =    5    Process  MQ Incoming File 
 */
import java.io.IOException;
import java.io.LineNumberReader;
import java.io.StringReader;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.math.*;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import datapro.eibs.beans.EMQ0000DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEMQ0000 extends JSEIBSServlet { 
	
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
			screen = 5;
		}
		
		switch (screen) {
			//  
			case 1 : // Request File Name 
				procReqFile(user, req, res, session);
				break;
			case 2 : // Valide ACH File
			case 5 : // Proccess ACH File
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

	// SCREEN = 1 
	// Send Request for File Name  
	//
	protected void procReqFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EMQ0000DSMessage msg = null;
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("ENTER");
		ses.setAttribute("userPO", userPO);
		
		mp = new MessageProcessor("EMQ0000");
		msg = (EMQ0000DSMessage) mp.getMessageRecord("EMQ0000DS");
		msg.setHDRSTART("{H}");
		msg.setHDRSERVICE("SER001");
		msg.setHDRSEQ("0");
		int mm = user.getBigDecimalE01RDM().intValue();
		int dd = user.getBigDecimalE01RDD().intValue();
		msg.setHDRDATE(user.getBigDecimalE01RDY().toString() + String.format ("%02d", mm) + String.format ("%02d", dd));
		dd = getHour();
		mm = getMinute();
		msg.setHDRTIME(String.format ("%02d", dd) + String.format ("%02d", mm));
		msg.setHDREND("{F}");
		ses.setAttribute("msgRcd", msg);
		
		forwardOnSuccess("EMQ0000_incoming_file.jsp", req, res);
	}

	// SCREEN = 2,5
	// Validate and/or Process File  
	//
	protected void procActionFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EMQ0000DSMessage msg = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("ENTER");
		int msgLen = 20481;
		try {
			// Read file
			String st = "";
			StringBuffer buf = new StringBuffer();
			try {
				SmartUpload mySmartUpload = new SmartUpload();
				mySmartUpload.initialize(config, req, res);
				mySmartUpload.upload();
				com.jspsmart.upload.File myFile =  mySmartUpload.getFiles().getFile(0);
				
				StringReader sr = new StringReader(myFile.getContentString());
				LineNumberReader lnr = new LineNumberReader(sr);
				
				String line = "";
				String linetosend = "";
				mp = new MessageProcessor("EMQ0000");
				msg = (EMQ0000DSMessage) mp.getMessageRecord("EMQ0000DS");
				msg.setHDRSTART(mySmartUpload.getRequest().getParameter("HDRSTART"));
				msg.setHDRSERVICE(mySmartUpload.getRequest().getParameter("HDRSERVICE"));
				msg.setHDRSEQ(mySmartUpload.getRequest().getParameter("HDRSEQ"));
				msg.setHDRDATE(mySmartUpload.getRequest().getParameter("HDRDATE"));
				msg.setHDRTIME(mySmartUpload.getRequest().getParameter("HDRTIME"));
				msg.setHDRVENDOR(mySmartUpload.getRequest().getParameter("HDRVENDOR"));
				msg.setHDRCHANNEL(mySmartUpload.getRequest().getParameter("HDRCHANNEL"));
				msg.setHDRTERMINA(mySmartUpload.getRequest().getParameter("HDRTERMINA"));
				msg.setHDRIP(mySmartUpload.getRequest().getParameter("HDRIP"));
				msg.setHDRNUMREC(mySmartUpload.getRequest().getParameter("HDRNUMREC"));
				msg.setHDREND(mySmartUpload.getRequest().getParameter("HDREND"));
				int contador= 0;

				while (true) {
					line = lnr.readLine();
					  contador++;
					  
					// EOF
					if (line == null) {
						break;
					}
					linetosend = line;
					if (line.length() > 0 ) {
						int posIni = 0;
						boolean find = true;
						while (find == true) {
							linetosend = line.substring(posIni, line.length() );
							System.out.println("" + contador +", vs msg: "+linetosend);
							find = false;
							//
							msg.setH01USERID(user.getH01USR());
							msg.setH01PROGRM("EMQ0000");
							msg.setH01TIMSYS(getTimeStamp());  
							msg.setH01SCRCOD("01");
							if (screen == 5 ) {
								msg.setH01OPECOD("0005");
							} else {
								msg.setH01OPECOD("0002");
							}
							msg.setE01FILE(myFile.getFileName());
							msg.setE01DATA(linetosend);		
							msg.setH01FLGWK1("");
							// Send Message
							mp.sendMessage(msg);
						}					
					}else{
						System.out.println(""+contador);
						break;
					}
				}
				lnr.close();
				sr.close();
				// Send message indicating end of process	
				msg.setHDRSTART(mySmartUpload.getRequest().getParameter("HDRSTART"));
				msg.setHDRSERVICE(mySmartUpload.getRequest().getParameter("HDRSERVICE"));
				msg.setHDRSEQ(mySmartUpload.getRequest().getParameter("HDRSEQ"));
				msg.setHDRDATE(mySmartUpload.getRequest().getParameter("HDRDATE"));
				msg.setHDRTIME(mySmartUpload.getRequest().getParameter("HDRTIME"));
				msg.setHDRVENDOR(mySmartUpload.getRequest().getParameter("HDRVENDOR"));
				msg.setHDRCHANNEL(mySmartUpload.getRequest().getParameter("HDRCHANNEL"));
				msg.setHDRTERMINA(mySmartUpload.getRequest().getParameter("HDRTERMINA"));
				msg.setHDRIP(mySmartUpload.getRequest().getParameter("HDRIP"));
				msg.setHDRNUMREC(mySmartUpload.getRequest().getParameter("HDRNUMREC"));
				msg.setHDREND(mySmartUpload.getRequest().getParameter("HDREND"));
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EMQ0000");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01SCRCOD("01");
				if (screen == 5 ) {
					msg.setH01OPECOD("0005");
				} else {
					msg.setH01OPECOD("0002");
				}
				msg.setE01FILE(myFile.getFileName());
				msg.setE01DATA("");	
				msg.setH01FLGWK1("S");  // End of List
				mp.sendMessage(msg);
				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("error", newmessage);
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("msgRcd", newmessage);
				forward("EMQ0000_incoming_file.jsp", req, res);
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