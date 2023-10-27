package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV030001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEPV0300 extends JSEIBSServlet {

	protected static final int R_PARAMS  = 1;
	protected static final int A_PARAMS  = 2;
	//
	protected static final int R_ENTER   = 100;
	protected static final int R_LIST    = 101;
	protected static final int R_NEW     = 200;
	protected static final int R_MAINT   = 201;
	protected static final int R_DELETE  = 202;
	protected static final int R_INQUIRY = 203;
	protected static final int A_MAINT   = 600;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_PARAMS:
				procReqPrm(user, req, res, session);
				break;
			case A_PARAMS:
				procActPrm(user, req, res, session);
				break;
			case R_ENTER:
				procReqEnt(user, req, res, session);
				break;
			case R_LIST:
				procReqLst(user, req, res, session);
				break;
			case R_NEW:
				procReqNew(user, req, res, session);
				break;
			case R_MAINT:
				procReqMnt(user, req, res, session);
				break;
			case R_DELETE:
				procReqDel(user, req, res, session);
				break;
			case R_INQUIRY:
				procReqInq(user, req, res, session);
				break;
			case A_MAINT:
				procActMnt(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	private void procReqPrm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = new UserPos();
		userPO.setPurpose("MAINTENANCE");
		//Others Parameters
		userPO.setHeader1("E01UNCACC");
		userPO.setHeader2("H01FLGWK2");
		
		session.setAttribute("userPO", userPO);
		
		forward("EPV0300_cheques_avalados_enter_params.jsp", req, res);
	
	}
		
	protected void procActPrm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("EPV0300", req);
			EPV030001Message msg = (EPV030001Message) mp.getMessageRecord("EPV030001");
			
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0016");
			msg.setH01TIMSYS(getTimeStamp());
	
			setMessageRecord(req, msg);
			
			if (session.getAttribute("parmrec") != null ) {
				EPV030001Message parmrec = (EPV030001Message) session.getAttribute("parmrec");
				msg.setE01FRMDTM(parmrec.getE01FRMDTM());
				msg.setE01FRMDTD(parmrec.getE01FRMDTD());
				msg.setE01FRMDTY(parmrec.getE01FRMDTY());
				msg.setE01TODTEM(parmrec.getE01TODTEM());
				msg.setE01TODTED(parmrec.getE01TODTED());
				msg.setE01TODTEY(parmrec.getE01TODTEY());
			}
			
			mp.sendMessage(msg);
		
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
	
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EPV030001List", list);
			session.setAttribute("parmrec", msg);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			forward("EPV0300_cheques_avalados_list.jsp", req, res);
				
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnt(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CAVL");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("2");
		userPO.setRedirect("/servlet/datapro.eibs.salesplatform.JSEPV0300?SCREEN=101");
		userPO.setProdCode("10");
		//Others Parameters
		userPO.setHeader1("E01UNCACC");
		userPO.setHeader2("H01FLGWK2");
		
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
		
	}

	protected void procReqLst(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("EPV0300", req);
			EPV030001Message msg = (EPV030001Message) mp.getMessageRecord("EPV030001");
			
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());

			try {
				msg.setE01UNCACC(req.getParameter("E01UNCACC").trim());
				userPO.setAccNum(req.getParameter("E01UNCACC").trim());
			} catch (Exception e) {
				msg.setE01UNCACC(userPO.getAccNum());
			}
			
			mp.sendMessage(msg);
		
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EPV030001Message) mp.receiveMessageRecord();
	
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				procReqEnt(user, req, res, session);
			} else {

				userPO.setAccNum(msg.getE01UNCACC().trim());
		 		userPO.setCusNum(msg.getE01UNCCUN().trim());
		 		userPO.setCusName(msg.getE01UNCNA1().trim());
		 		userPO.setCurrency(msg.getE01UNCCCY().trim());
		 		userPO.setProdCode(msg.getE01UNCPRO().trim());
		 		userPO.setBank(msg.getE01UNCBNK().trim());
		 		userPO.setBranch(msg.getE01UNCBRN().trim());
		 		
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
		
				session.setAttribute("userpPO", userPO);
				session.setAttribute("EPV030001List", list);
				req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
				forward("EPV0300_cheques_avalados_list.jsp", req, res);
				
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			
			mp = getMessageProcessor("EPV0300", req);
			EPV030001Message msg = (EPV030001Message) mp.getMessageRecord("EPV030001");
			
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0300");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			
	 		msg.setE01UNCBNK(userPO.getBank());
	 		msg.setE01UNCBRN(userPO.getBranch());
	 		msg.setE01UNCACC(userPO.getAccNum());
	 		msg.setE01UNCCKN("0");
			
	 		userPO.setPurpose("NEW");

	 		mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV030001Message) mp.receiveMessageRecord("EPV030001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV0300_cheques_avalados_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msg);
				session.setAttribute("error", msgError);
				forward("EPV0300_cheques_avalados_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null) mp.close();
		}

	}

	protected void procReqMnt(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV030001Message lstMsg = null;
		
		try {
		
			mp = getMessageProcessor("EPV0300", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV030001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				lstMsg = (EPV030001Message)list.get(index);
			}

			EPV030001Message msg = (EPV030001Message) mp.getMessageRecord("EPV030001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0300");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			
			userPO.setPurpose("MAINTENANCE");
			
			if (lstMsg != null) {
				msg.setE01UNCBNK(lstMsg.getE01UNCBNK());
				msg.setE01UNCBRN(lstMsg.getE01UNCBRN());
				msg.setE01UNCACC(lstMsg.getE01UNCACC());
				msg.setE01UNCCKN(lstMsg.getE01UNCCKN());
			}

			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV030001Message) mp.receiveMessageRecord("EPV030001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV0300_cheques_avalados_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msg);
				session.setAttribute("error", msgError);
				forward("EPV0300_cheques_avalados_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null) mp.close();
		}

	}

	protected void procReqDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EPV0300", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV030001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EPV030001Message lstMsg = (EPV030001Message)list.get(index);
			
			EPV030001Message msg = (EPV030001Message) mp.getMessageRecord("EPV030001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0300");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0009");
			
			msg.setE01UNCBNK(lstMsg.getE01UNCBNK());
			msg.setE01UNCBRN(lstMsg.getE01UNCBRN());
			msg.setE01UNCACC(lstMsg.getE01UNCACC());
			msg.setE01UNCCKN(lstMsg.getE01UNCCKN());

			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				if (!userPO.getAccNum().equals("")) {
					procReqLst(user, req, res, session);
				} else {
					procActPrm(user, req, res, session);
				}
			} else {
				session.setAttribute("error", msgError);
				forward("EPV0300_cheques_avalados_list.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}

	}
		
	protected void procReqInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV030001Message lstMsg = null;
		
		try {
			mp = getMessageProcessor("EPV0300", req);
		
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV030001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				lstMsg = (EPV030001Message)list.get(index);
			}
			
			EPV030001Message msg = (EPV030001Message) mp.getMessageRecord("EPV030001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0300");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0004");
		
			if (lstMsg != null) {
				msg.setE01UNCBNK(lstMsg.getE01UNCBNK());
				msg.setE01UNCBRN(lstMsg.getE01UNCBRN());
				msg.setE01UNCACC(lstMsg.getE01UNCACC());
				msg.setE01UNCCKN(lstMsg.getE01UNCCKN());
			}

			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV030001Message) mp.receiveMessageRecord("EPV030001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV0300_cheques_avalados_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msg);
				session.setAttribute("error", msgError);
				forward("EPV0300_cheques_avalados_maintenance.jsp?readOnly=true", req, res);
			}
		
		} finally {
			if (mp != null) mp.close();
		}

	}

	protected void procActMnt(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EPV0300", req);
			EPV030001Message msg = (EPV030001Message) mp.getMessageRecord("EPV030001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0300");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			msg.setH01FLGWK1(userPO.getPurpose().equals("NEW") ? "Y" : "N");
			
			setMessageRecord(req, msg);

	 		msg.setE01UNCBNK(req.getParameter("E01UNCBNK") == null ? "" : req.getParameter("E01UNCBNK").trim());
	 		msg.setE01UNCBRN(req.getParameter("E01UNCBRN") == null ? "" : req.getParameter("E01UNCBRN").trim());
	 		msg.setE01UNCACC(req.getParameter("E01UNCACC") == null ? "" : req.getParameter("E01UNCACC").trim());
	 		msg.setE01UNCCKN(req.getParameter("E01UNCCKN") == null ? "" : req.getParameter("E01UNCCKN").trim());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV030001Message) mp.receiveMessageRecord("EPV030001");

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV0300_cheques_avalados_maintenance.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV0300_cheques_avalados_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}

	}

}
