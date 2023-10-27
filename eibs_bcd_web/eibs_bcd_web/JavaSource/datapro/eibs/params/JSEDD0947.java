package datapro.eibs.params;

/**================================================================================
 * Transfer File for checks breakdown
 * Creation date: 06/19/2012
 * @author: Catalina Sepulveda
 ==================================================================================*/
import java.io.IOException;
import java.io.LineNumberReader;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import datapro.eibs.beans.EDD094701Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEDD0947 extends JSEIBSServlet {

	// Action 
	protected static final int R_ENTER_FILE = 100;
	protected static final int A_ENTER_FILE = 1;
	protected static final int A_CONFIRM = 300;
	 
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
			throws ServletException ,IOException {
		switch (screen) {
			//Request
			case R_ENTER_FILE :
				procReqEnterFileName(user, req, res, session);
				break;
			case A_ENTER_FILE :
				procActionFileName(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
			}
	}
	
	

	protected void procReqEnterFileName( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {
			forward("EDD0947_checks_breakdown_file.jsp", req, res);
	}

	protected void procActionFileName( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		MessageProcessor mp = null;
		EDD094701Message msgFL = null;
		ELEERRMessage msgError =  new datapro.eibs.beans.ELEERRMessage();;

		try {
			mp = getMessageProcessor("EDD0947", req);
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(this.getServletConfig(), req, res);
			mySmartUpload.upload(); 
			com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);

			StringReader sr = new StringReader(myFile.getContentString());
			LineNumberReader lnr = new LineNumberReader(sr);
			String line = "";

			msgFL = (EDD094701Message)mp.getMessageRecord("EDD094701");

			// Read text file									
			line = lnr.readLine();
			while (line != null) {
				msgFL.setH01USERID(user.getH01USR());
				msgFL.setH01PROGRM("EDD0947");
				msgFL.setH01TIMSYS(getTimeStamp());
				msgFL.setH01OPECOD("0001");
				msgFL.setH01FLGWK1("");
				msgFL.setE01DATA(line);
				mp.sendMessage(msgFL);
				line = lnr.readLine();
			} // End Of Loop

			lnr.close();
			sr.close();

			//Send End of file
			msgFL = new EDD094701Message();
			msgFL.setH01USERID(user.getH01USR());
			msgFL.setH01PROGRM("EDD0947");
			msgFL.setH01TIMSYS(getTimeStamp());
			msgFL.setH01OPECOD("0001");
			msgFL.setH01FLGWK1("9");
			msgFL.setE01DATA("");
			mp.sendMessage(msgFL);
			
			
			flexLog("Record 3 : Last Record Indicator Sent= "+ msgFL.getH01FLGWK1());

			// Receive Error Message or data confirmation
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) { //There are errors
				flexLog("Putting java beans into the session");
				msgError = (ELEERRMessage)newmessage;
				ses.setAttribute("error", msgError);
				forward("EDD0947_checks_breakdown_file.jsp", req, res);				
			} else {
				ses.setAttribute("msgFL", msgFL);
				forward("EDD0947_checks_breakdown_confirm.jsp", req,	res);					
			}
		} catch (SmartUploadException e) {
			Logger.getLogger(this.getServletName()).log(Level.FINE, e.getMessage());
		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}
}
