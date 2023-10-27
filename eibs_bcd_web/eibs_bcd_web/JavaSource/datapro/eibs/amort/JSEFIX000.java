package datapro.eibs.amort;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EFIX00001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEFIX000 extends JSEIBSServlet {

	// Action 
	
	protected static final  int A_DELETE			    = 2000; //1000;
	
	protected static final  int R_ENTER_NEW	 		    = 100;
	protected static final  int R_ENTER_MAINTENANCE	 	= 300;
	protected static final  int R_ENTER_TRANSACTION	    = 500;
	protected static final  int R_ENTER_INQUIRY		    = 1000;
	protected static final  int R_LEASING_LIST		    = 1200;
	
	protected static final  int A_ENTER_OPEN 		    = 200;	
	protected static final  int A_ENTER_MAINTENANCE		= 400;
	protected static final  int A_NEW					= 600;
	protected static final  int A_ENTER_TRANSACTION		= 700;
	protected static final  int A_MAINTENANCE			= 800;	
	protected static final  int A_TRANSACTION			= 900;
	protected static final  int A_ENTER_INQUIRY			= 1100;
	protected static final  int A_ENTER_INQUIRY_ALL		= 1110;
	protected static final  int A_LEASING_LIST		    = 1300;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {

		// Action
		
		case A_ENTER_MAINTENANCE :
			procActionEnterMaintenance(user, req, res, session);
			break;
		case A_ENTER_OPEN :
			procActionEnterOpen(user, req, res, session);
			break;
		case A_NEW :
			procActionNew(user, req, res, session);
			break;
		case A_MAINTENANCE :
			procActionMaintenance(user, req, res, session);
			break;
		case A_DELETE :   
			procActionDelete(user, req, res, session);
			break;
		case A_ENTER_TRANSACTION :
			procActionEnterTransaction(user, req, res, session);
			break;
		case A_TRANSACTION :
			procActionTransaction(user, req, res, session);
			break;
		//Request
		case R_ENTER_NEW :
			procReqNew(user, req, res, session);
			break;					
		case R_ENTER_MAINTENANCE :
			procReqEnterMaintenance(user, req, res, session);
			break;			
		case R_ENTER_TRANSACTION :
			procReqEnterTransaction(user, req, res, session);
			break;			
		// END Entering

		case R_ENTER_INQUIRY :
			procReqEnterInquiry(user, req, res, session);
			break;			
		case A_ENTER_INQUIRY :
		case A_ENTER_INQUIRY_ALL :
			procActionEnterInquiry(user, req, res, session, screen);
			break;
			
		case R_LEASING_LIST :
			procReqLeasingList(user, req, res, session);
			break;
		case A_LEASING_LIST :
			procActionLeasingList(user, req, res, session);
			break;
			
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionLeasingList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String action = "";
		try {
			action = req.getParameter("ACTION").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX000", req);
			
			if ("LIST".equals(action)) {
				JBObjList list = (JBObjList) session.getAttribute("List");
				for (Iterator iterator = list.listIterator(); iterator.hasNext();) {
					EFIX00001Message msgRT = (EFIX00001Message) mp.getMessageRecord("EFIX00001");
					msgRT = (EFIX00001Message) iterator.next();
					msgRT.setH01USERID(user.getH01USR());
					msgRT.setH01PROGRM("EFIX000");
					msgRT.setH01TIMSYS(getTimeStamp());
					msgRT.setH01SCRCOD("01");
					msgRT.setH01OPECOD("0008");
					msgRT.setE01FIXNLN(userPO.getAccNum());
					
					mp.sendMessage(msgRT);
				}
				
			} else if ("ADD".equals(action)) {
				EFIX00001Message msgRT = (EFIX00001Message) mp.getMessageRecord("EFIX00001");
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("EFIX00001");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0008");
				msgRT.setE01FIXOPE("10");
				msgRT.setE01FIXNLN(userPO.getAccNum());
				try {
					msgRT.setE01FIXASN(req.getParameter("FIXNUM").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				mp.sendMessage(msgRT);
			} else if ("DEL".equals(action)) {
				String[] fixes = req.getParameterValues("E01ACT");
				for (int i = 0; i < fixes.length; i++) {
					EFIX00001Message msgRT = (EFIX00001Message) mp.getMessageRecord("EFIX00001");
					msgRT.setH01USERID(user.getH01USR());
					msgRT.setH01PROGRM("EFIX00001");
					msgRT.setH01TIMSYS(getTimeStamp());
					msgRT.setH01SCRCOD("01");
					msgRT.setH01OPECOD("0008");
					msgRT.setE01FIXASN(fixes[i]);
					msgRT.setE01FIXOPE("20");
					msgRT.setE01FIXNLN(userPO.getAccNum());
					
					mp.sendMessage(msgRT);
				}
			}
			EFIX00001Message msgRT = (EFIX00001Message) mp.getMessageRecord("EFIX00001");
			msgRT = (EFIX00001Message) mp.getMessageRecord("EFIX00001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFIX00001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0008");
			msgRT.setE01FIXASN("0");
			msgRT.setE01INDOPE("*");
			msgRT.setE01FIXNLN(userPO.getAccNum());

			mp.sendMessage(msgRT);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
			}

			session.setAttribute("List", list);

			forward("EFIX000_leasing_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqLeasingList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX000", req);
			EFIX00001Message msgRT = (EFIX00001Message) mp.getMessageRecord("EFIX00001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFIX00001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0007");
			msgRT.setE01FIXNLN(userPO.getAccNum());

			mp.sendMessage(msgRT);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
			}

			session.setAttribute("List", list);

			forward("EFIX000_leasing_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX000", req);
			EFIX00001Message msgRT = (EFIX00001Message) mp.getMessageRecord("EFIX00001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFIX00001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("03");
			msgRT.setH01OPECOD("0002");
			if (screen == A_ENTER_INQUIRY_ALL) {
				msgRT.setH01FLGWK1("A");
			}
			
			try {
				msgRT.setE01FIXASN(req.getParameter("E01FIXASN").trim());
			} catch (Exception e) {
			}

			try {
				msgRT.setE01FIXBNK(req.getParameter("E01FIXBNK").trim());
			} catch (Exception e) {
			}

			try {
				msgRT.setE01FIXBRN(req.getParameter("E01FIXBRN").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EFIX00001Message) mp.receiveMessageRecord("EFIX00001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX000_fix_enter_inquiry.jsp";
			} else {
				pageName = "EFIX000_fix_inquiry.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fix", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("INQUIRY");
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);

		forward("EFIX000_fix_enter_inquiry.jsp", req, res);
	}

	private void procActionTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX000", req);
			EFIX00001Message msgInst = (EFIX00001Message) session.getAttribute("fix");
			msgInst.setH01USERID(user.getH01USR());
		 	msgInst.setH01PROGRM("EFIX00001");
		 	msgInst.setH01TIMSYS(getTimeStamp());
		 	msgInst.setH01SCRCOD("01");
		 	msgInst.setH01OPECOD("0006");
		 	
		 	setMessageRecord(req, msgInst);

			mp.sendMessage(msgInst);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgInst = (EFIX00001Message) mp.receiveMessageRecord("EFIX00001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX000_fix_transaction.jsp";
			} else {
				pageName = "EFIX000_fix_enter_transaction.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fix", msgInst);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX000", req);
			EFIX00001Message msgRT = (EFIX00001Message) mp.getMessageRecord("EFIX00001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFIX00001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("02");
			msgRT.setH01OPECOD("0002");
			
			try {
				msgRT.setE01FIXASN(req.getParameter("E01FIXASN").trim());
				userPO.setAccNum(msgRT.getE01FIXASN());
			} catch (Exception e) {
			}

			try {
				msgRT.setE01FIXBNK(req.getParameter("E01FIXBNK").trim());
				userPO.setBank(msgRT.getE01FIXBNK());
			} catch (Exception e) {
			}

			try {
				msgRT.setE01FIXBRN(req.getParameter("E01FIXBRN").trim());
				userPO.setBranch(msgRT.getE01FIXBRN());
			} catch (Exception e) {
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EFIX00001Message) mp.receiveMessageRecord("EFIX00001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX000_fix_enter_transaction.jsp";
			} else {
				pageName = "EFIX000_fix_transaction.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fix", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqEnterTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("TRANSACTIONS");
		userPO.setBank(user.getE01UBK());
		userPO.setBranch(user.getE01UBR());
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EFIX000_fix_enter_transaction.jsp", req, res);
	}

	private void procActionEnterOpen(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX000", req);
			EFIX00001Message msgRT = (EFIX00001Message) mp.getMessageRecord("EFIX00001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFIX00001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0001");
			try {
				msgRT.setE01FIXCLS(req.getParameter("E01FIXCLS").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE01FIXBNK(req.getParameter("E01FIXBNK").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE01FIXBRN(req.getParameter("E01FIXBRN").trim());
				msgRT.setE01CLSDSC(req.getParameter("E01CLSDSC").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EFIX00001Message) mp.receiveMessageRecord("EFIX00001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX000_fix_enter_new.jsp";
			} else {
				pageName = "EFIX000_fix_new.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fix", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqEnterMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		EFIX00001Message msgRT = new EFIX00001Message();
		msgRT.setH01USERID(user.getH01USR());
		msgRT.setH01PROGRM("EFIX000");
		msgRT.setH01TIMSYS(getTimeStamp());
		msgRT.setH01SCRCOD("01");
		msgRT.setE01FIXBNK(user.getE01UBK());
		msgRT.setE01FIXBRN(user.getE01UBR());
		session.setAttribute("fix", msgRT);
		
		forward("EFIX000_fix_enter_maintenance.jsp", req, res);
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("NEW");
		userPO.setBank(user.getE01UBK());
		userPO.setBranch(user.getE01UBR());
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);

		forward("EFIX000_fix_enter_new.jsp", req, res);
	}

	private void procActionDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX000", req);
			EFIX00001Message msgInst = (EFIX00001Message) session.getAttribute("fix");
			msgInst.setH01USERID(user.getH01USR());
			msgInst.setH01PROGRM("EFIX00001");
			msgInst.setH01TIMSYS(getTimeStamp());
			msgInst.setH01SCRCOD("01");
			msgInst.setH01OPECOD("0009");
		 	
		 	setMessageRecord(req, msgInst);

			mp.sendMessage(msgInst);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgInst = (EFIX00001Message) mp.receiveMessageRecord("EFIX00001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX000_fix_maintenance.jsp";
			} else {
				pageName = "EFIX000_fix_enter_maintenance.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fix", msgInst);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX000", req);
			EFIX00001Message msgInst = (EFIX00001Message) session.getAttribute("fix");
			msgInst.setH01USERID(user.getH01USR());
		 	msgInst.setH01PROGRM("EFIX00001");
		 	msgInst.setH01TIMSYS(getTimeStamp());
		 	msgInst.setH01SCRCOD("01");
		 	msgInst.setH01OPECOD("0005");
		 	
		 	setMessageRecord(req, msgInst);

			mp.sendMessage(msgInst);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgInst = (EFIX00001Message) mp.receiveMessageRecord("EFIX00001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX000_fix_maintenance.jsp";
			} else {
				pageName = "EFIX000_fix_enter_maintenance.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fix", msgInst);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX000", req);
			EFIX00001Message msgInst = (EFIX00001Message) session.getAttribute("fix");
			msgInst.setH01USERID(user.getH01USR());
		 	msgInst.setH01PROGRM("EFIX00001");
		 	msgInst.setH01TIMSYS(getTimeStamp());
		 	msgInst.setH01SCRCOD("01");
		 	msgInst.setH01OPECOD("0003");
		 	
		 	setMessageRecord(req, msgInst);

			mp.sendMessage(msgInst);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgInst = (EFIX00001Message) mp.receiveMessageRecord("EFIX00001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX000_fix_new.jsp";
			} else {
				pageName = "EFIX000_fix_enter_maintenance.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fix", msgInst);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX000", req);
			EFIX00001Message msgRT = (EFIX00001Message) mp.getMessageRecord("EFIX00001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFIX000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			
			try {
				msgRT.setE01FIXASN(req.getParameter("E01FIXASN").trim());
			} catch (Exception e) {
			}

			try {
				msgRT.setE01FIXBNK(req.getParameter("E01FIXBNK").trim());
			} catch (Exception e) {
			}

			try {
				msgRT.setE01FIXBRN(req.getParameter("E01FIXBRN").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EFIX00001Message) mp.receiveMessageRecord("EFIX00001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX000_fix_enter_maintenance.jsp";
			} else {
				pageName = "EFIX000_fix_maintenance.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fix", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	
}
