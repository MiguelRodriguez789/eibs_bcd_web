package datapro.eibs.params;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSEFE0220 extends JSEIBSServlet {

	// Action 

	protected static final int A_POSITION = 800;

	protected static final int R_REFERENCE_LIST = 100;
	protected static final int R_CODES_LIST = 400;

	protected static final int R_ENTER = 1;
	protected static final int A_ENTER = 2;
	protected static final int R_NEW = 300;
	protected static final int R_MAINTENANCE = 500;
	protected static final int A_MAINTENANCE = 600;
	protected static final int R_MAINT_DETAIL = 1100;
	
	protected String LangPath = "S";

	
	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
					throws ServletException, IOException {
		// TODO Auto-generated method stub
		switch (screen) {
			//Request
			case R_REFERENCE_LIST :
				procReqRatesList( user, req, res, session);
				break;
			case R_NEW :
				procReqNew( user, req, res, session);
				break;
			case R_MAINT_DETAIL :
				procReqMaintenanceDetail( user, req, res, session);
				break;	
			case R_MAINTENANCE :
				procReqMaintenance( user, req, res, session);
				break;
			case R_ENTER :
				procReqEnterParameter(user, req, res, session);
				break;
				// Action
			case A_ENTER :
				procActionEnterRates( user, req, res, session);
				break;	
			case A_POSITION :
				procActionPos( user, req, res, session);
				break;
			case A_MAINTENANCE :
				procActionMaintenance(user, req, res, session);
				break;
				// END Entering
			default :
				forward(devPage, req, res);
		}
	}

	protected void procReqEnterParameter( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = new UserPos();
		ses.setAttribute("userPO", userPO);

		forwardOnSuccess("EFE0220_exchange_rate_enter.jsp", req, res);
	}

	protected void procActionPos( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		int inptOPT = Integer.parseInt( Util.getReqParameter("opt", req , "0"));

		switch (inptOPT) {
			case 1 : //New
				procReqNew(user, req, res, ses);				
				break;
			case 2 : //Maintenance
				procReqMaintenance(user, req, res, ses);
				break;
			default :
				procReqNew(user, req, res, ses);				
				break;
		}
	}


	protected void procActionEnterRates( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		int inptOPT = 0;

		String bank =  Util.getReqParameter("E01RATBNK", req);
		String currency = Util.getReqParameter("E01RATCCY", req);
		
		if(	currency.trim().equals("")){
			inptOPT = 1;
		} else {
			inptOPT = 2;
		}

		switch (inptOPT) {
			case 1 : //List
				procReqRatesList( user, req, res, ses);
				break;
			case 2 : //Maintenance
				procReqMaintenanceDetail( user, req, res, ses);
				break;
			default :
				procReqRatesList( user, req, res, ses);
				break;
		}
	}


	protected void procReqRatesList( ESS0030DSMessage user,  HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EFE022001Message msgList = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		MessageProcessor mp = null;
		
		userPO = (UserPos) getUserPos(req);

		// Send Initial data
		try {
			mp = getMessageProcessor("EFE0220", req);
			msgList = (EFE022001Message) mp.getMessageRecord("EFE022001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EFE022001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			msgList.setE01RATBNK(Util.getReqParameter("E01RATBNK", req, "01"));
			msgList.setE01RATCCY(Util.getReqParameter("E01RATCCY", req));

			mp.sendMessage(msgList);
			
			newmessage = mp.receiveMessageRecord();

			if (newmessage.getFormatName().equals("ELEERR")) {

				msgError = (ELEERRMessage) newmessage;

				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
			}
			
			newmessage = mp.receiveMessageRecord();

			if (newmessage.getFormatName().equals("EFE022001")) {

				JBObjList beanList = new JBObjList();

				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				String TableTyp = "";
				//var for ofac status
				//var for Warning status
				String chkOfac = "";
				String chkWarn = "";
				int compar = 0;
				int indexRow = 0;
				while (true) {

					msgList = (EFE022001Message) newmessage;

					marker = msgList.getE01OPECDE();

					if (firstTime) {
						firstTime = false;
						chk = "checked";

					} else {
						chk = "";
					}

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {

						beanList.addRow(msgList);

						if (marker.equals("+")) {
							beanList.setShowNext(true);

							break;
						}
					}
					newmessage = mp.receiveMessageRecord();
				}

				ses.setAttribute("EFE022001Help", beanList);
				ses.setAttribute("userPO", userPO);

				forward("EFE0220_exchange_rate_list.jsp", req, res);
			}

		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}


	protected void procReqMaintenanceDetail( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EFE022001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		MessageProcessor mp = null;
		userPO = getUserPos(req); 

		// Send Initial data
		try {
			mp = getMessageProcessor("EFE0220", req);
			msgRT = (EFE022001Message) mp.getMessageRecord("EFE022001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFE022001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			msgRT.setE01RATBNK(Util.getReqParameter("E01RATBNK", req, "01"));
			msgRT.setE01RATCCY(Util.getReqParameter("E01RATCCY", req));
			mp.sendMessage(msgRT);
			
		// Receive Data
			newmessage = mp.receiveMessageRecord();

			if (newmessage.getFormatName().equals("ELEERR")) {

				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			}
			
			newmessage = mp.receiveMessageRecord();

			if (newmessage.getFormatName().equals("EFE022001")) {
				msgRT = (EFE022001Message) newmessage;

				ses.setAttribute("error", msgError);
				ses.setAttribute("rates", msgRT);
				ses.setAttribute("userPO", userPO);

				if (mp.hasError(msgError)) {
					forward("EFE0220_exchange_rate_enter.jsp", req, res);
				} else { // There are errors
					forwardOnSuccess("EFE0220_exchange_rate_details.jsp", req, res);
				}
			} 

			
		} finally{
			if(null != mp){
				mp.close();
			}
		}
	}


	protected void procActionMaintenance( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EFE022001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		MessageProcessor mp = null;
		int acctype = 0;

		userPO = getUserPos(req);

		// Send Initial data
		try {
			mp = getMessageProcessor("EFE0220", req);
			msgRT = (EFE022001Message) ses.getAttribute("rates");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFE022001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01OPECOD("0005");
			setMessageRecord(req, msgRT);
				
			mp.sendMessage(msgRT);

			newmessage = mp.receiveMessageRecord();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
			}
			
			newmessage = mp.receiveMessageRecord();

			if (newmessage.getFormatName().equals("EFE022001")) {
				msgRT = (EFE022001Message) newmessage;
				ses.setAttribute("error", msgError);
				ses.setAttribute("rates", msgRT);
				ses.setAttribute("userPO", userPO);

				if (mp.hasError(msgError)) { 
					procReqEnterParameter(user, req, res, ses);

				} else { // There are errors
					forwardOnSuccess("EFE0220_exchange_rate_details.jsp", req, res);
				}
			}
		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}

	protected void procReqNew( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,  HttpSession ses)
		throws ServletException, IOException {
		
		MessageRecord newmessage = null;
		EFE022001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		MessageProcessor mp = null;
		userPO = getUserPos(req); 

		// Send Initial data
		try {
			mp = getMessageProcessor("EFE0220", req);
			msgRT = (EFE022001Message) mp.getMessageRecord("EFE022001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFE022001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			msgRT.setE01RATBNK(Util.getReqParameter("E01RATBNK", req, "01"));
			msgRT.setE01RATCCY(Util.getReqParameter("E01RATCCY", req));
			mp.sendMessage(msgRT);
			
		// Receive Data
			newmessage = mp.receiveMessageRecord();

			if (newmessage.getFormatName().equals("ELEERR")) {

				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			}
			
			newmessage = mp.receiveMessageRecord();

			if (newmessage.getFormatName().equals("EFE022001")) {
				msgRT = (EFE022001Message) newmessage;

				ses.setAttribute("userPO", userPO);

				if (mp.hasError(msgError)) {
					ses.setAttribute("error", msgError);
					forward("EFE0220_exchange_rate_list.jsp", req, res);
				} else { // There are errors
					ses.setAttribute("rates", msgRT);
					forwardOnSuccess("EFE0220_exchange_rate_details.jsp", req, res);
				}
			} 

			
		} finally{
			if(null != mp){
				mp.close();
			}
		}		
	}

	protected void procReqMaintenance( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		EFE022001Message msgDoc = null;
		UserPos userPO = null;

		userPO = getUserPos(req);

		// Receive Data
		JBObjList bl = (JBObjList) ses.getAttribute("EFE022001Help");
		int idx = Integer.parseInt(Util.getReqParameter("CURRCODE", req , "0"));
		bl.setCurrentRow(idx);

		msgDoc = (EFE022001Message) bl.getRecord();

		ses.setAttribute("rates", msgDoc);

		forwardOnSuccess("EFE0220_exchange_rate_details.jsp", req, res);
	}
	
}
