package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD018001Message;
import datapro.eibs.beans.EDD018002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDD0180 extends JSEIBSServlet {

	protected static final int R_RT_ENTER = 100;
	protected static final int R_RT_STOP_LIST = 200;
	protected static final int R_RT_STOP_NEW = 1;
	protected static final int R_RT_STOP_MAINT = 2;
	protected static final int R_RT_STOP_DELETE = 3;
	protected static final int R_RT_STOP_ACLARAR = 5;
	protected static final int R_RT_STOP_IMPRIMIR = 4;
	protected static final int A_RT_STOP_MAINT = 800;
	
	protected static final int R_CD_ENTER = 500;
	protected static final int R_CD_MAINT = 400;
	protected static final int R_CD_DELETE = 13;
	protected static final int R_CD_ACLARAR = 15;
	protected static final int A_CD_MAINT = 600;
	
	protected static final int R_OF_ENTER = 300;
	protected static final int R_OF_MAINT = 700;
	protected static final int R_OF_DELETE = 113;
	protected static final int R_OF_ACLARAR = 114;
	protected static final int A_OF_MAINT = 115;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_RT_ENTER :
				procReqRTEnter(user, req, res, session);
				break;			
			case R_RT_STOP_LIST :
				procReqRTStopList(user, req, res, session);
				break;				
			case R_RT_STOP_NEW :
				procReqRTStopNew(user, req, res, session);
				break;
			case R_RT_STOP_MAINT :
				procReqRTStopMaintenance(user, req, res, session);
				break;
			case R_RT_STOP_DELETE :
				procReqRTStopDelete(user, req, res, session);
				break;
			case R_RT_STOP_ACLARAR :
				procReqRTStopAclarar(user, req, res, session);
				break;
			case R_RT_STOP_IMPRIMIR :
				procReqRTStopImprimir(user, req, res, session);
				break;
			case A_RT_STOP_MAINT :
				procActionRTStopMaintenance(user, req, res, session);
				break;
			case R_CD_ENTER :
				procReqCDEnter(user, req, res, session);
				break;
			case R_CD_MAINT :
				procReqCDMaintenance(user, req, res, session);
				break;	
			case R_CD_DELETE :
				procReqCDDelete(user, req, res, session);
				break;	
			case R_CD_ACLARAR :
				procReqCDAclarar(user, req, res, session);
				break;	
			case A_CD_MAINT :
				procActionCDMaintenance(user, req, res, session);
				break;
			case R_OF_ENTER :
				procReqOFEnter(user, req, res, session);
				break;
			case R_OF_MAINT :
				procReqOFMaintenance(user, req, res, session);
				break;	
			case R_OF_DELETE :
				procReqOFDelete(user, req, res, session);
				break;
			case R_OF_ACLARAR :
				procReqOFAclarar(user, req, res, session);
				break;
			case A_OF_MAINT :
				procActionOFMaintenance(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}
	

	private void procReqRTEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		forward("EDD0180_rt_enter_stop_pay.jsp", req, res);
		
	}
	
	private void procReqRTStopList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01FLGWK1("3");
		 	msgList.setH01OPECOD("0015");

		 	if (req.getParameter("E01STPACC") == null){
		 		msgList.setE01STPACC(userPO.getAccNum());
		 	} else {
		 		msgList.setE01STPACC(req.getParameter("E01STPACC"));
		 		userPO.setAccNum(req.getParameter("E01STPACC"));
		 	}

			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0180_rt_enter_stop_pay.jsp", req, res);
			} else {

				EDD018002Message msgHeader = (EDD018002Message) mp.receiveMessageRecord("EDD018002");

		 		userPO.setCusNum(msgHeader.getE02STPCUN());
		 		userPO.setCusName(msgHeader.getE02CUSNA1());
		 		userPO.setCurrency(msgHeader.getE02STPCCY());
		 		userPO.setProdCode(msgHeader.getE02STPPRO());
		 		userPO.setHeader10(msgHeader.getE02STPBNK());
		 		userPO.setHeader11(msgHeader.getE02STPBRN());
		 		userPO.setHeader12(msgHeader.getE02STPGLN());

		 		JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

				session.setAttribute("userPO", userPO);
				session.setAttribute("stop", list);
	
				forward("EDD0180_rt_stop_pay.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqRTStopNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			int seq = 0;

			JBObjList list = (JBObjList)session.getAttribute("stop");
			int index = list.getLastRec();
			if (index >0){
				index--;
			}
			if (index >= 0){
				EDD018001Message listMessage = (EDD018001Message)list.get(index);
				seq = Integer.parseInt(listMessage.getE01STPSEQ().trim());
			} 
			seq++;
			
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0001");
		 	msgList.setE01STPACC(userPO.getAccNum());
		 	msgList.setE01STPSEQ(String.valueOf(seq));
		 	
		 	userPO.setPurpose("NEW");
		 	
			session.setAttribute("userPO", userPO);
			session.setAttribute("refCode", msgList);

			forward("EDD0180_rt_stop_pay_det.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqRTStopMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			
			userPO.setPurpose("MAINTENANCE");
			
			JBObjList list = (JBObjList)session.getAttribute("stop");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EDD018001Message listMessage = (EDD018001Message)list.get(index);
			
			session.setAttribute("refCode", listMessage);
			session.setAttribute("userPO", userPO);

			forward("EDD0180_rt_stop_pay_det.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqRTStopDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			
			JBObjList list = (JBObjList)session.getAttribute("stop");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EDD018001Message listMessage = (EDD018001Message)list.get(index);
			
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01FLGWK1("3");
		 	msgList.setH01OPECOD("0009");
		 	msgList.setE01STPACC(listMessage.getE01STPACC());
		 	msgList.setE01STPSEQ(listMessage.getE01STPSEQ());
		 	msgList.setE01STPBNK(listMessage.getE01STPBNK());
		 	msgList.setE01STPBRN(listMessage.getE01STPBRN());
		 	msgList.setE01STPCCY(listMessage.getE01STPCCY());
		 	msgList.setE01STPGLN(listMessage.getE01STPGLN());

		 	
			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0180_rt_stop_pay.jsp", req, res);
			} else {
				procReqRTStopList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqRTStopAclarar(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			
			JBObjList list = (JBObjList)session.getAttribute("stop");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EDD018001Message listMessage = (EDD018001Message)list.get(index);
			
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01FLGWK1("3");
		 	msgList.setH01OPECOD("0020");
		 	msgList.setE01STPACC(listMessage.getE01STPACC());
		 	msgList.setE01STPSEQ(listMessage.getE01STPSEQ());
		 	msgList.setE01STPBNK(listMessage.getE01STPBNK());
		 	msgList.setE01STPBRN(listMessage.getE01STPBRN());
		 	msgList.setE01STPCCY(listMessage.getE01STPCCY());
		 	msgList.setE01STPGLN(listMessage.getE01STPGLN());

		 	
			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDD0180_rt_stop_pay_clear.jsp", req, res);
			} else {
				procReqRTStopList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqRTStopImprimir(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			
			userPO.setPurpose("PRINT");
			
			JBObjList list = (JBObjList)session.getAttribute("stop");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EDD018001Message listMessage = (EDD018001Message)list.get(index);
			
			session.setAttribute("refCode", listMessage);
			session.setAttribute("userPO", userPO);

			forward("EFRM000_forms_req_error.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}		
	}

	private void procActionRTStopMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	if (userPO.getPurpose().equals("NEW")){
				msgList.setH01OPECOD("0001");
			} else if(userPO.getPurpose().equals("MAINTENANCE")) {
				msgList.setH01OPECOD("0005");
			} else {
				msgList.setH01OPECOD("0020");
			}
		 	
		 	setMessageRecord(req, msgList);
		 	
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDD018001Message) mp.receiveMessageRecord("EDD018001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("refCode", msgList);
			 	
				if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			 		forward("EDD0180_rt_stop_pay_det.jsp", req, res);
				} else {
					forward("EDD0180_rt_stop_pay_clear.jsp", req, res);
				}
				
			} else {
				procReqRTStopList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}		
	}
	
	private void procReqCDEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO =new UserPos();
		if (req.getParameter("appcode") == null){
			userPO.setApplicationCode("11");
		}else{
			userPO.setApplicationCode(req.getParameter("appcode"));
		}
		session.setAttribute("userPO", userPO);
		forward("EDD0180_cd_enter_stop_pay.jsp", req, res);
		
	}
	
	private void procReqCDMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDD0180");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01FLGWK1("1");
			msgList.setH01OPECOD("0002");
			
			if (req.getParameter("E01STPACC") == null){
		 		msgList.setE01STPACC(userPO.getAccNum());
		 	} else {
		 		msgList.setE01STPACC(req.getParameter("E01STPACC"));
		 		userPO.setAccNum(req.getParameter("E01STPACC"));
		 	}
			
			userPO.setPurpose("MAINT");
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDD018001Message) mp.receiveMessageRecord("EDD018001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0180_cd_enter_stop_pay.jsp", req, res);
			} else {

		 		session.setAttribute("userPO", userPO);
				session.setAttribute("refCodeCD", msgList);
	
				forward("EDD0180_cd_stop_pay_det.jsp", req, res);
			}


		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqCDDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);			
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
			msgList.setH01FLGWK1("1");
		 	msgList.setH01OPECOD("0009");

		 	msgList.setE01STPACC(userPO.getAccNum());
		 	msgList.setE01STPBNK(req.getParameter("E01STPBNK"));
		 	msgList.setE01STPBRN(req.getParameter("E01STPBRN"));
		 	msgList.setE01STPCCY(req.getParameter("E01STPCCY"));
		 	msgList.setE01STPGLN(req.getParameter("E01STPGLN"));
		 	msgList.setE01STPSEQ(req.getParameter("E01STPSEQ"));

			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0180_cd_stop_pay_det.jsp", req, res);
			} else {
				forward("EDD0180_cd_enter_stop_pay.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}	
	}

	private void procReqCDAclarar(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
			msgList.setH01FLGWK1("1");
		 	msgList.setH01OPECOD("0020");

		 	msgList.setE01STPACC(userPO.getAccNum());
		 	msgList.setE01STPBNK(req.getParameter("E01STPBNK"));
		 	msgList.setE01STPBRN(req.getParameter("E01STPBRN"));
		 	msgList.setE01STPCCY(req.getParameter("E01STPCCY"));
		 	msgList.setE01STPGLN(req.getParameter("E01STPGLN"));
		 	msgList.setE01STPSEQ(req.getParameter("E01STPSEQ"));
		 	
		 	userPO.setPurpose("ACLARAR");
		 	
			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDD0180_cd_stop_pay_det.jsp", req, res);
			} else {
				forward("EDD0180_cd_enter_stop_pay.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}	
	}	
	
	private void procActionCDMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
			msgList.setH01FLGWK1("1");
		 	if (userPO.getPurpose().equals("MAINT")){
		 		msgList.setH01OPECOD("0005");
			} else {
				msgList.setH01OPECOD("0020");
			}
		 	
		 	setMessageRecord(req, msgList);
		 	
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDD018001Message) mp.receiveMessageRecord("EDD018001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("refCodeCD", msgList);
			 	
				forward("EDD0180_cd_stop_pay_det.jsp", req, res);
				
			} else {
				forward("EDD0180_cd_enter_stop_pay.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}
	
	private void procReqOFEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		forward("EDD0180_of_enter_stop.jsp", req, res);
		
	}

	private void procReqOFMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDD0180");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01FLGWK1("2");
			msgList.setH01OPECOD("0002");
	 		msgList.setE01STPCCY(req.getParameter("E01STPCCY"));
	 		msgList.setE01STPACC(req.getParameter("E01STPACC"));
			
			userPO.setPurpose("MAINT");
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDD018001Message) mp.receiveMessageRecord("EDD018001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0180_of_enter_stop.jsp", req, res);
			} else {

		 		session.setAttribute("userPO", userPO);
				session.setAttribute("refCodeOF", msgList);
	
				forward("EDD0180_of_stop_pay_maint.jsp", req, res);
			}


		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqOFDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);			
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
			msgList.setH01FLGWK1("2");
		 	msgList.setH01OPECOD("0009");

	 		msgList.setE01STPCCY(req.getParameter("E01STPCCY"));
	 		msgList.setE01STPACC(req.getParameter("E01STPACC"));
		 	msgList.setE01STPBNK(req.getParameter("E01STPBNK"));
		 	msgList.setE01STPBRN(req.getParameter("E01STPBRN"));
		 	msgList.setE01STPCCY(req.getParameter("E01STPCCY"));
		 	msgList.setE01STPGLN(req.getParameter("E01STPGLN"));
		 	msgList.setE01STPSEQ(req.getParameter("E01STPSEQ"));

			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0180_of_stop_pay_maint.jsp", req, res);
			} else {
				forward("EDD0180_of_enter_stop.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}	
	}
	
	private void procReqOFAclarar(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
			msgList.setH01FLGWK1("2");
		 	msgList.setH01OPECOD("0020");

	 		msgList.setE01STPCCY(req.getParameter("E01STPCCY"));
	 		msgList.setE01STPACC(req.getParameter("E01STPACC"));
		 	msgList.setE01STPBNK(req.getParameter("E01STPBNK"));
		 	msgList.setE01STPBRN(req.getParameter("E01STPBRN"));
		 	msgList.setE01STPCCY(req.getParameter("E01STPCCY"));
		 	msgList.setE01STPGLN(req.getParameter("E01STPGLN"));
		 	msgList.setE01STPSEQ(req.getParameter("E01STPSEQ"));
		 	
		 	userPO.setPurpose("ACLARAR");
		 	
			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDD0180_of_stop_pay_maint.jsp", req, res);
			} else {
				forward("EDD0180_of_enter_stop.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}	
	}	

	private void procActionOFMaintenance(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0180", req);
			EDD018001Message msgList = (EDD018001Message) mp.getMessageRecord("EDD018001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0180");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
			msgList.setH01FLGWK1("2");
		 	if (userPO.getPurpose().equals("MAINT")){
		 		msgList.setH01OPECOD("0005");
			} else {
				msgList.setH01OPECOD("0020");
			}
		 	
		 	setMessageRecord(req, msgList);
		 	
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDD018001Message) mp.receiveMessageRecord("EDD018001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("refCodeOF", msgList);
			 	
				forward("EDD0180_of_stop_pay_maint.jsp", req, res);
				
			} else {
				forward("EDD0180_of_enter_stop.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
}
