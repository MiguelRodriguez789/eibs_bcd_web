package datapro.eibs.ach;
/**
 * ACH Incoming  
 * Creation date: (06/10/08)
 * @author: Carlos Castillo
 *                   
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Request ACH File Name          
 *	// SCREEN =    2    Validate ACH Incoming File 
 **	// SCREEN =    5    Process  ACH Incoming File 
 */
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

import datapro.eibs.beans.EACH400DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.services.FTPStdWrapper;
import datapro.eibs.sockets.MessageRecord;

public class JSEACH400 extends JSEIBSServlet { 
	
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
				//procActionFile(user, req, res, session, screen);
				procActionFile2(user, req, res, session, screen);
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

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("ENTER");
		ses.setAttribute("userPO", userPO);
		forwardOnSuccess("EACH400_incoming_file.jsp", req, res);
		
	}

	// SCREEN = 2,5
	// Validate and/or Process File  
	//
	protected void procActionFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EACH400DSMessage msg = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("ENTER");
		int achLen = 94;
		if (user.getE01INT().equals("05")) achLen = 106;
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
				mp = new MessageProcessor("EACH400");
				msg = (EACH400DSMessage) mp.getMessageRecord("EACH400DS");
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
							if (line.substring(posIni, posIni + achLen).length() > achLen) {
								System.out.println(""+contador);
								linetosend = line.substring(posIni, posIni + achLen);
								posIni = posIni + 94;	
								System.out.println("" + contador +", > acjLen "+linetosend);
							} else {
								linetosend = line.substring(posIni, line.length() );
								System.out.println("" + contador +", <=94 "+linetosend);
								find = false;
							}		
							//
							msg.setH01USERID(user.getH01USR());
							msg.setH01PROGRM("EACH400");
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
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EACH400");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01SCRCOD("01");
				if (screen == 5 ) {
					msg.setH01OPECOD("0005");
				} else {
					msg.setH01OPECOD("0002");
				}
				msg.setE01FILE(myFile.getFileName());
				msg.setH01FLGWK1("S");  // End of List
				mp.sendMessage(msg);
				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forward("EACH400_incoming_file.jsp", req, res);
				} else {
					redirectToPage("/servlet/datapro.eibs.ach.JSEACH400?SCREEN=1", res);
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
	
	protected void procActionFile2(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(ses);
		userPO.setPurpose("ENTER");
		MessageProcessor mp = null;
		try {
			// Carga archivo desde el browser
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			com.jspsmart.upload.File myFile =  mySmartUpload.getFiles().getFile(0);
			
			FTPStdWrapper ftp = new FTPStdWrapper(JSEIBSProp.getHostIP(), JSEIBSProp.getftpACHUser(), JSEIBSProp.getftpACHPassword(), user.getH01USR().substring(0, 2) + "CYFILES");
			if (ftp.open()) {
				ftp.upload(Util.getStreamFromFile(myFile), "ACHINF");
				ftp.close();
				mp = new MessageProcessor("EACH400");
				EACH400DSMessage msg = (EACH400DSMessage) mp.getMessageRecord("EACH400DS");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EACH400");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01OPECOD("0007");
				 
				mp.sendMessage(msg);
				MessageRecord newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forward("EACH400_incoming_file.jsp", req, res);
				} else {
					procReqFile(user, req, res, ses);
				}			
			} else {
				ELEERRMessage err = new ELEERRMessage();
				err.setERRNUM("1");
				err.setERDF01("FILENAME");
				err.setERDR01("0707");
				err.setERDS01("Archivo no pudo ser procesado por error en Carga");
				err.setERNU01("9999");
				forward("EACH400_incoming_file.jsp", req, res);
			}
		} catch (SmartUploadException e) {
			ELEERRMessage err = new ELEERRMessage();
			err.setERRNUM("1");
			err.setERDF01("FILENAME");
			err.setERDR01("0404");
			err.setERDS01("Archivo no pudo ser cargado");
			err.setERNU01("9999");
			ses.setAttribute("error", err);
			forward("EACH400_incoming_file.jsp", req, res);
		} finally {
			if (mp != null) mp.close();
		}
		
	}

}