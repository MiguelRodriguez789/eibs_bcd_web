package datapro.eibs.products; 

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL015801Message;
import datapro.eibs.beans.EDL015802Message;
import datapro.eibs.beans.EDL090001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

@SuppressWarnings("serial")
public class JSEDL0158 extends JSEIBSServlet {

	protected static final int R_ENTER_EXTRA_CHG = 100;
	protected static final int R_ENTER_EXTRA_CHG_LIST = 200;
	protected static final int R_EXTRA_CHG_NEW = 1;
	protected static final int R_EXTRA_CHG_MAINT = 2;
	protected static final int R_EXTRA_CHG_DELETE = 3;
	protected static final int A_EXTRA_CHG_MAINT = 300;
	protected static final int A_EXTRA_CHG_DELETE = 400;
	protected static final int R_FECHA_PLAN_PAGO = 500;
	
	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_ENTER_EXTRA_CHG : 
				procReqEnterExtChg(user, req, res, session);
				break;
			case R_ENTER_EXTRA_CHG_LIST : 
				procActionEnterExtChgList(user, req, res, session);
				break;
			case R_EXTRA_CHG_NEW :
				procReqExtChgNew(user, req, res, session);
				break;			
			case R_EXTRA_CHG_MAINT :
				procReqExtChgMaintenance(user, req, res, session);
				break;
			case R_EXTRA_CHG_DELETE :
				procReqExtChgDelete(user, req, res, session);
				break;
			case A_EXTRA_CHG_DELETE :
				procActionExtChgDelete(user, req, res, session);
				break;
			case A_EXTRA_CHG_MAINT :
				procActionExtChgMaintenance(user, req, res, session);
				break;
			case R_FECHA_PLAN_PAGO :
				procReqPlanPago(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}

	}
	
	private void procReqPlanPago(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;

		try {
			mp = getMessageProcessor("EDL0900", req);
			EDL090001Message msgList = (EDL090001Message) mp.getMessageRecord("EDL090001");
		 	msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDL0900");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setE01DEAACC(userPO.getAccNum());
		 	
			msgList.setH01FLGWK3("C");

			mp.sendMessage(msgList);

			newmessage = mp.receiveMessageRecord();			
			
			if (newmessage.getFormatName().equals("ELEERR")){
				ELEERRMessage msgError = (ELEERRMessage) newmessage;
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0158_ln_list_extrachg.jsp", req, res);
			} else{
				msgList = (EDL090001Message) newmessage;
		 		JBObjList list = mp.receiveMessageRecordList("E02ENDFLD");
		 		JBObjList listUF = mp.receiveMessageRecordList("E03ENDFLD");

				session.setAttribute("userPO", userPO);
				session.setAttribute("header", msgList);
				session.setAttribute("list", list);
				session.setAttribute("listUF", listUF);
				
				forward("EDL0158_fechas_plan_pago.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqEnterExtChg(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		forward("EDL0158_ln_enter_extrachg.jsp", req, res);
		
	}

	private void procActionEnterExtChgList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("EDL0158", req);
			EDL015801Message msgList = (EDL015801Message) mp.getMessageRecord("EDL015801");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDL0158");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0015");
		 	
		 	if (req.getParameter("E01DLSACC")== null){
				msgList.setE01DLSACC(userPO.getAccNum());
			}else{
				msgList.setE01DLSACC(req.getParameter("E01DLSACC"));
				userPO.setAccNum(req.getParameter("E01DLSACC"));
			}
		 	
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0158_ln_enter_extrachg.jsp", req, res);
			} else {

				EDL015802Message msgHeader = (EDL015802Message) mp.receiveMessageRecord("EDL015802");

		 		userPO.setCusNum(msgHeader.getE02DEACUN());
		 		userPO.setCusName(msgHeader.getE02CUSNA1());
		 		userPO.setCurrency(msgHeader.getE02DEACCY());
		 		userPO.setProdCode(msgHeader.getE02DEAPRO());
		 		userPO.setBank(msgHeader.getE02DEABNK());
		 		userPO.setBranch(msgHeader.getE02DEABRN());
		 		userPO.setHeader3(msgHeader.getE02DEAPDM());
		 		userPO.setHeader4(msgHeader.getE02DEAPDD());
		 		userPO.setHeader5(msgHeader.getE02DEAPDY());

		 		JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0158code", msgHeader);
				session.setAttribute("EDL0158Help", list);
	
				forward("EDL0158_ln_list_extrachg.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqExtChgNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0158", req);
			
			int seq = 0;

			JBObjList list = (JBObjList)session.getAttribute("EDL0158Help");
			int index = list.getLastRec();
			if (index >= 0){
				// EDL015801Message listMessage = (EDL015801Message)list.get(index);
				EDL015801Message listMessage = (EDL015801Message)list.get(index-1);
				seq = Integer.parseInt(listMessage.getE01DLSSEQ().trim());
			} 
			seq++;
			
			EDL015801Message msgList = (EDL015801Message) mp.getMessageRecord("EDL015801");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDL0158");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0001");
		 	msgList.setE01DLSACC(userPO.getAccNum());
		 	msgList.setE01DLSPDM(userPO.getHeader3());
		 	msgList.setE01DLSPDD(userPO.getHeader4());
		 	msgList.setE01DLSPDY(userPO.getHeader5());
		 	msgList.setE01DLSSEQ(String.valueOf(seq));
		 	msgList.setE01DLSTYP("5");
		 	
		 	userPO.setPurpose("NEW");
		 	
		 	session.setAttribute("userPO", userPO);
			session.setAttribute("EDL0158code", msgList);
				
			forward("EDL0158_ln_det_extrachg.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procReqExtChgMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0158", req);
						
			JBObjList list = (JBObjList)session.getAttribute("EDL0158Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL015801Message listMessage = (EDL015801Message)list.get(index);
			
			userPO.setPurpose("MAINTENANCE");
			
			session.setAttribute("EDL0158code", listMessage);
			session.setAttribute("userPO", userPO);
			
			forward("EDL0158_ln_det_extrachg.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqExtChgDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0158", req);
						
			JBObjList list = (JBObjList)session.getAttribute("EDL0158Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL015801Message listMessage = (EDL015801Message)list.get(index);
			
			userPO.setPurpose("MAINTENANCE");
			
			session.setAttribute("EDL0158code", listMessage);
			session.setAttribute("userPO", userPO);
			
			forward("EDL0158_ln_det_delete_extrachg.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procActionExtChgDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0158", req);
			EDL015801Message msgList = (EDL015801Message) mp.getMessageRecord("EDL015801");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0158");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			setMessageRecord(req, msgList);

			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL015801Message) mp.receiveMessageRecord("EDL015801");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0158code", msgList);
				forward("EDL0158_ln_det_delete_extrachg.jsp", req, res);

			} else {
				procActionEnterExtChgList(user, req, res, session);
			}
				
	} finally {
		if (mp != null)	mp.close();
	}
		
}

	private void procActionExtChgMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0158", req);
			EDL015801Message msgList = (EDL015801Message) mp.getMessageRecord("EDL015801");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0158");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");

			setMessageRecord(req, msgList);

		 	if (userPO.getPurpose().equals("NEW")){
				msgList.setH01OPECOD("0001");
			 	if (msgList.getE01DLSTYP().equals("1")){
			 		msgList.setE01DLSCDE("@XTX");
			 	} else if (msgList.getE01DLSTYP().equals("2")) {
			 		msgList.setE01DLSCDE("@XCJ");
			 	} else if (msgList.getE01DLSTYP().equals("3")) {
			 		msgList.setE01DLSCDE("@XDE");
			 	} else if (msgList.getE01DLSTYP().equals("4")) {
			 		msgList.setE01DLSCDE("@XIV");			 		
			 	} else {
			 		msgList.setE01DLSCDE("@XCB");
			 	}
		 	} else {
		 		msgList.setH01OPECOD("0005");
		 	}

			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL015801Message) mp.receiveMessageRecord("EDL015801");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0158code", msgList);
				forward("EDL0158_ln_det_extrachg.jsp", req, res);

			} else {
				procActionEnterExtChgList(user, req, res, session);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
}
