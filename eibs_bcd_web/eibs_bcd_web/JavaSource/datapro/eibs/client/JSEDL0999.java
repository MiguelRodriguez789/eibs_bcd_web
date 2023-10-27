package datapro.eibs.client;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.sql.SQLException;
import java.io.IOException;
import java.io.InputStream;
import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.sql.ResultSet;
import java.util.Calendar;


import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import datapro.eibs.beans.EDL099901Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0999 extends JSEIBSServlet {

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
				procReadTxTFile(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReadTxTFile(
			ESS0030DSMessage user, 
			HttpServletRequest req, 
			HttpServletResponse res, 
			HttpSession ses) 
			throws ServletException, IOException {

		    MessageProcessor mp = null;
		    MessageRecord newmessage = null;
		    EDL099901Message msg = null;
		    UserPos userPO = null;
		    userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			String criterio = req.getParameter("CRITERIO")==null?"":req.getParameter("CRITERIO");
		
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("ENTER");
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
					mp = new MessageProcessor("EDL099901");
					msg = (EDL099901Message) mp.getMessageRecord("EDL099901", user.getH01USR(), "0005");
					
					while (true) {
						line = lnr.readLine();
						// EOF
						if (line == null) {
							break;
						}
						linetosend = line;
						if (line.length() > 0 ) {
							msg.setH01USERID(user.getH01USR());
							msg.setH01PROGRM("EDL0999");
							msg.setH01TIMSYS(getTimeStamp());  
							msg.setH01SCRCOD("01");
							msg.setH01OPECOD("0001");
							msg.setE01DATALI(linetosend);		
							msg.setH01FLGWK1("");
							msg.setH01FLGWK2(criterio);		

							// Send Message
							mp.sendMessage(msg);

							//msg.send();
						}
					}
					lnr.close();
					sr.close();
					// Send message indicating end of process	
					msg.setH01USERID(user.getH01USR());
					msg.setH01PROGRM("EDL0999");
					msg.setH01TIMSYS(getTimeStamp());  
					msg.setH01SCRCOD("01");
                    msg.setH01OPECOD("0001");
					msg.setH01FLGWK1("*");  // End of List
					msg.setH01FLGWK2(criterio);		
					mp.sendMessage(msg);
					
					// Receive Error Message or Data Message (Optional)
					ses.setAttribute("userPO", userPO);
					newmessage = mp.receiveMessageRecord();
					if (mp.hasError(newmessage)) {
						ses.setAttribute("error", newmessage);
						forward("EDL0999_transfer_file.jsp?CRITERIO=" + criterio , req, res);
					} else {
						forward("EDL0999_transfer_file_confirm.jsp", req, res);
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
	
	private void procReqImport(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(session);
		ELEERRMessage msgError = new ELEERRMessage();
		
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		String criterio = req.getParameter("CRITERIO")==null?"":req.getParameter("CRITERIO");

		flexLog("SOLO CRITERIO " + criterio);
		
		forward("EDL0999_transfer_file.jsp?CRITERIO=" + criterio , req, res);
	}

}
