package datapro.eibs.products;

import java.io.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.EDL195001Message;
import datapro.eibs.beans.EDL195002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL1950 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -590742220086331563L;

	private ServletConfig config = null;
	
	protected static final int R_ENTER_FILE = 1;
	protected static final int A_ENTER_FILE = 2;
	protected static final int A_LIST       = 101;
	protected static final int R_APPROVAL   = 201;
	protected static final int R_DELETE     = 202;
	protected static final int R_INQUIRY    = 203;
	protected static final int R_FILE_LIST  = 301;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		switch (screen) {
			case R_ENTER_FILE:
				procReqEnterFileName(user, req, res, session);
				break;
			case A_ENTER_FILE :
				procActionFileName(user, req, res, session);
				break;
			case A_LIST:
				procActList(user, req, res, session);
				break;
			case R_APPROVAL:
				procReqApproval(user, req, res, session);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			case R_INQUIRY:
				procReqInquiry(user, req, res, session);
				break;
			case R_FILE_LIST:
				procReqFileList(user, req, res, session);
				break;
			default:
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqEnterFileName(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		
		session.setAttribute("userPO", userPO);
		
		forward("EDL1950_ln_mass_payments_interface.jsp", req, res);
		
	}

	private void procActionFileName(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		try {
			
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			com.jspsmart.upload.File file =  mySmartUpload.getFiles().getFile(0);
			
			StringReader sr = new StringReader(file.getContentString());
			LineNumberReader lnr = new LineNumberReader(sr);
			String line = "";			
			
			UserPos userPO = getUserPos(session);
			MessageProcessor mp = null;
			
			mp = new MessageProcessor("EDL1950");
			EDL195001Message msg = (EDL195001Message) mp.getMessageRecord("EDL195001");

			// Read text file		
			line = lnr.readLine();
			
			while (line != null) {
				
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDL1950");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01SCRCOD("01");
				msg.setH01OPECOD("0001");
				msg.setH01FLGMAS("");
				
				msg.setE01DPHFIL(file.getFileName());	// File Name
				msg.setE01DPHLNE(line);					// Text Line
				
				mp.sendMessage(msg);
				
				line = lnr.readLine();

				if (line == null) {
					break;
				}				
				
			}

			lnr.close();
			sr.close();
			
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL1950");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			msg.setH01FLGMAS("*");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL195001Message) mp.receiveMessageRecord("EDL195001");

			session.setAttribute("userPO", userPO);
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL1950_ln_mass_payments_interface.jsp", req, res);
			} else {
				forward("EDL1950_ln_mass_payments_interface_confirm.jsp", req, res);
			}
			
			if (mp != null) mp.close();
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			
		}

	}

	private void procActList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL1950", req);
			EDL195001Message msg = (EDL195001Message) mp.getMessageRecord("EDL195001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0002");
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("EDL195001List", list);
			
			forward("EDL1950_ln_mass_payments_list.jsp", req, res);

		} finally {
			if (mp != null) mp.close();
		}
	
	}

	protected void procReqApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL1950", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL195001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EDL195001Message listMessage = (EDL195001Message)list.get(index);
			
			EDL195001Message msgApp = (EDL195001Message) mp.getMessageRecord("EDL195001");
			msgApp.setH01USERID(user.getH01USR());
			msgApp.setH01PROGRM("EDL1950");
			msgApp.setH01TIMSYS(getTimeStamp());
			msgApp.setH01SCRCOD("01");
			msgApp.setH01OPECOD("0003");
			
			msgApp.setE01DPHFIL(listMessage.getE01DPHFIL());
			msgApp.setE01DPHDTM(listMessage.getE01DPHDTM());
			msgApp.setE01DPHDTD(listMessage.getE01DPHDTD());
			msgApp.setE01DPHDTY(listMessage.getE01DPHDTY());
			msgApp.setE01DPHREF(listMessage.getE01DPHREF());
			msgApp.setE01DPHPRC(listMessage.getE01DPHPRC());
		
			mp.sendMessage(msgApp);
		
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EDL1950_ln_mass_payments_list.jsp", req, res);
			}
		
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL1950", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL195001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EDL195001Message listMessage = (EDL195001Message)list.get(index);
			
			EDL195001Message msgDlt = (EDL195001Message) mp.getMessageRecord("EDL195001");
			msgDlt.setH01USERID(user.getH01USR());
			msgDlt.setH01PROGRM("EDL1950");
			msgDlt.setH01TIMSYS(getTimeStamp());
			msgDlt.setH01SCRCOD("01");
			msgDlt.setH01OPECOD("0009");
			
			msgDlt.setE01DPHFIL(listMessage.getE01DPHFIL());
			msgDlt.setE01DPHDTM(listMessage.getE01DPHDTM());
			msgDlt.setE01DPHDTD(listMessage.getE01DPHDTD());
			msgDlt.setE01DPHDTY(listMessage.getE01DPHDTY());
			msgDlt.setE01DPHREF(listMessage.getE01DPHREF());
		
			mp.sendMessage(msgDlt);
		
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EDL1950_ln_mass_payments_list.jsp", req, res);
			}
		
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		EDL195001Message listMessage = null;
		
		try {
			mp = getMessageProcessor("EDL1950", req);
		
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EDL195001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL195001Message)list.get(index);
			}
			
			EDL195001Message msgMnt = (EDL195001Message) mp.getMessageRecord("EDL195001");
			msgMnt.setH01USERID(user.getH01USR());
			msgMnt.setH01PROGRM("EDL1950");
			msgMnt.setH01TIMSYS(getTimeStamp());
			msgMnt.setH01SCRCOD("01");
			msgMnt.setH01OPECOD("0004");
		
			if (listMessage != null) {
				msgMnt.setE01DPHREF(listMessage.getE01DPHREF());
			}
	
			mp.sendMessage(msgMnt);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMnt = (EDL195001Message) mp.receiveMessageRecord("EDL195001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL1950_ln_mass_payments_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMnt);
				session.setAttribute("error", msgError);
				forward("EDL1950_ln_mass_payments_inquiry.jsp?readOnly=true", req, res);
			}
		
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqFileList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		EDL195001Message lstMsg = null;
		
		try {
			mp = getMessageProcessor("EDL1950", req);
			
			if (req.getParameter("key") != null) {
				JBObjList lst = (JBObjList)session.getAttribute("EDL195001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				lstMsg = (EDL195001Message)lst.get(index);
			}
			
			EDL195002Message msg = (EDL195002Message) mp.getMessageRecord("EDL195002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02OPECOD("0002");
			
			if (lstMsg != null) {
				msg.setE02DPMREF(lstMsg.getE01DPHREF());
			}
			
			mp.sendMessage(msg);
	
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
	
			session.setAttribute("userPO", userPO);
			session.setAttribute("EDL195002List", list);
			
			forward("EDL1950_ln_mass_payments_detail.jsp", req, res);
	
		} finally {
			if (mp != null) mp.close();
		}
	
	}
	
}
