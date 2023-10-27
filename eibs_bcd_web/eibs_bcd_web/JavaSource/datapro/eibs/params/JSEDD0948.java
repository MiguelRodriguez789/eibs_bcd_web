package datapro.eibs.params;

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

import datapro.eibs.beans.EDD094801Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEDD0948 extends JSEIBSServlet {
	
	private ServletConfig config = null;

	protected static final int R_ENTER_FILE = 100;
	protected static final int A_ENTER_FILE = 200;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		if (screen == 1) screen = A_ENTER_FILE;

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
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionFileName(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		StringReader sr = null;
		LineNumberReader lnr = null;
		MessageProcessor mp = null;
		try {
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
	
			sr = new StringReader(myFile.getContentString());
			lnr = new LineNumberReader(sr);
			String line = "";
	
			// Read text file									
			line = lnr.readLine();
			boolean firstTime = true;
			mp = getMessageProcessor("EDD0948", req);
			while (line != null) {
				EDD094801Message msgFL = (EDD094801Message) mp.getMessageRecord("EDD094801");
				msgFL.setH01USERID(user.getH01USR());
				msgFL.setH01PROGRM("EDD0948");
				msgFL.setH01TIMSYS(getTimeStamp());
				msgFL.setH01OPECOD("0001");
				if (firstTime){
					msgFL.setH01FLGWK1("1");
					firstTime=false;
				}
				else{
				   msgFL.setH01FLGWK1("");
				}
				msgFL.setE01DATA(line);
				
				mp.sendMessage(msgFL);
	
				line = lnr.readLine();
			} // End Of Loop
	
			EDD094801Message msgFL = (EDD094801Message) mp.getMessageRecord("EDD094801");
			msgFL.setH01USERID(user.getH01USR());
			msgFL.setH01PROGRM("EDD0948");
			msgFL.setH01TIMSYS(getTimeStamp());
			msgFL.setH01OPECOD("0001");
			msgFL.setH01FLGWK1("9");
			msgFL.setE01DATA("");
			
			mp.sendMessage(msgFL);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EDD0948_camara_trans_sali_file.jsp";
			} else {
				session.setAttribute("msgFL", msg);
				pageName = "EDD0948_camara_trans_confirm_bco.jsp";
			}
			
			forward(pageName, req, res);
		} catch (SmartUploadException e) {
			throw new ServletException(e);
		} finally {
			if (mp != null) mp.close();
			if (lnr != null) lnr.close();
			if (sr != null) sr.close();
			
		}
	}

	private void procReqEnterFileName(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", new UserPos());
		
		forward("EDD0948_camara_trans_sali_file.jsp", req, res);
	}

}
