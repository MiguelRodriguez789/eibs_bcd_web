package datapro.eibs.products;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import datapro.eibs.beans.EDL091401Message;
import datapro.eibs.beans.EDL091402Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

@SuppressWarnings("serial")
public class JSEDL0914 extends JSEIBSServlet {

	protected static final int R_ENTER 		 = 100;
	protected static final int R_ENTERSCHE	 = 150;
	protected static final int A_REVERSAL    = 200;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen) {
			case R_ENTER :
				procReqEnter(user, req, res, session);							
				break;
			case R_ENTERSCHE :
				procReqEnterPaymentSchedule(user, req, res, session);							
				break;		
			case A_REVERSAL :
				procActReversal(user, req, res, session);							
				break;		
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		forward("EDL0914_prorroga_reversal_enter.jsp", req, res);
		
	}

	private void procReqEnterPaymentSchedule(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;

		try {
			mp = getMessageProcessor("EDL0914", req);
			
			EDL091401Message msgList = (EDL091401Message) mp.getMessageRecord("EDL091401");
		 	msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDL0914");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setE01DEAACC(req.getParameter("E01DEAACC"));

			msgList.setH01FLGWK3(req.getParameter("H01FLGWK3") == null ? " " : req.getParameter("H01FLGWK3"));
			msgList.setH01FLGWK2(req.getParameter("H01FLGWK2") == null ? "Y" : req.getParameter("H01FLGWK2"));

			mp.sendMessage(msgList);
			userPO.setPurpose("INQUIRY");
		  	newmessage = mp.receiveMessageRecord();			
			
			if (newmessage.getFormatName().equals("ELEERR")){
				ELEERRMessage msgError = (ELEERRMessage) newmessage;
			  	newmessage = mp.receiveMessageRecord();			
				msgList = (EDL091401Message) newmessage;
				session.setAttribute("data", msgList);
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0914_prorroga_reversal_enter.jsp", req, res);
			} else{
				msgList = (EDL091401Message) newmessage;
		 		JBObjList list = mp.receiveMessageRecordList("E02ENDFLD");

				session.setAttribute("userPO", userPO);
				session.setAttribute("header", msgList);
				session.setAttribute("list", list);
				userPO.setHeader20(msgList.getH01FLGWK3());
				userPO.setHeader23(msgList.getH01FLGWK2());
				forward("EDL0914_prorroga_reversal.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}

	}
	
	private void procActReversal(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;

		try {
			mp = getMessageProcessor("EDL0914", req);
			
			EDL091402Message msg = (EDL091402Message) mp.getMessageRecord("EDL091402");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0914");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setE02DLPACC(req.getParameter("E01DEAACC"));

			msg.setH02FLGWK3(req.getParameter("H01FLGWK3") == null ? " " : req.getParameter("H01FLGWK3"));
			msg.setH02FLGWK2(req.getParameter("H01FLGWK2") == null ? "Y" : req.getParameter("H01FLGWK2"));

			mp.sendMessage(msg);
			userPO.setPurpose("INQUIRY");

			try {
				newmessage = mp.receiveMessageRecord();			
				ELEERRMessage msgError = null;
				if (newmessage.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage) newmessage;
				}
				if (msgError.getBigDecimalERRNUM().intValue() > 0) {
					session.setAttribute("error", msgError);
					forward("EDL0914_prorroga_reversal.jsp", req, res);
				} else {
					forward("EDL0914_prorroga_reversal_enter.jsp", req, res);
				}
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
			
		} finally {
			if (mp != null) mp.close();
		}

	}

}
