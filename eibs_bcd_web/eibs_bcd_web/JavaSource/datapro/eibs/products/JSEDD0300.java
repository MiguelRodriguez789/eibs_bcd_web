package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD018001Message;
import datapro.eibs.beans.EDD030001Message;
import datapro.eibs.beans.EDD030002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDD0300 extends JSEIBSServlet {
	
	protected static final int R_ENTER = 100;
	protected static final int R_HOLD_LIST = 200;
	protected static final int R_HOLD_NEW = 1;
	protected static final int R_HOLD_MAINT = 2;
	protected static final int R_HOLD_DELETE = 3;
	protected static final int A_HOLD_MAINT = 300;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
			case R_ENTER :
				procReqEnter(user, req, res, session);
				break;			
			case R_HOLD_LIST :
				procReqHoldList(user, req, res, session);
				break;				
			case R_HOLD_NEW :
				procReqHoldNew(user, req, res, session);
				break;
			case R_HOLD_MAINT :
				procReqHoldMaintenance(user, req, res, session);
				break;
			case R_HOLD_DELETE :
				procReqHoldDelete(user, req, res, session);
				break;
			case A_HOLD_MAINT :
				procActionHoldMaintenance(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}

	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		if ("04".equals(req.getParameter("AppCode"))) {
			forward("EDD0300_hold_uncollected_enter_sv.jsp", req, res);
		} else {
			forward("EDD0300_hold_uncollected_enter_rt.jsp", req, res);	
		}		
	}
	
	private void procReqHoldList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("EDD0300", req);
			EDD030001Message msgList = (EDD030001Message) mp.getMessageRecord("EDD030001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0300");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0015");
		 	
		 	if (req.getParameter("E01UNCACC") == null){
		 		msgList.setE01UNCACC(userPO.getAccNum());
		 	} else {
		 		msgList.setE01UNCACC(req.getParameter("E01UNCACC"));
		 		userPO.setAccNum(req.getParameter("E01UNCACC"));
		 	}
		 	
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0300_hold_uncollected_enter_rt.jsp", req, res);
			} else {

				EDD030002Message msgHeader = (EDD030002Message) mp.receiveMessageRecord("EDD030002");

		 		userPO.setCusNum(msgHeader.getE02UNCCUN());
		 		userPO.setCusName(msgHeader.getE02CUSNA1());
		 		userPO.setCurrency(msgHeader.getE02UNCCCY());
		 		userPO.setProdCode(msgHeader.getE02UNCPRO());
		 		userPO.setBank(msgHeader.getE02UNCBNK());
		 		userPO.setBranch(msgHeader.getE02UNCBRN());

		 		JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

				session.setAttribute("userPO", userPO);
				session.setAttribute("holduncoll", list);
	
				forward("EDD0300_hold_uncollected.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqHoldNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0300", req);
			int seq = 0;

			JBObjList list = (JBObjList)session.getAttribute("holduncoll");
			int index = list.getLastRec() -1;
			if (index >= 0){
				EDD030001Message listMessage = (EDD030001Message)list.get(index);
				seq = Integer.parseInt(listMessage.getE01UNCSEQ().trim());
			} 
			seq++;
			
			EDD030001Message msgList = (EDD030001Message) mp.getMessageRecord("EDD030001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0300");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0001");
		 	
		 	userPO.setPurpose("NEW");
		 	 
		 	msgList.setE01UNCACC(userPO.getAccNum());
		 	msgList.setE01UNCSEQ(String.valueOf(seq));
		 	
		 	session.setAttribute("userPO", userPO);
			session.setAttribute("refCode", msgList);
				
			forward("EDD0300_hold_uncollected_det.jsp", req, res);


		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqHoldMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0300", req);
			
			userPO.setPurpose("MAINTENANCE");
			
			JBObjList list = (JBObjList)session.getAttribute("holduncoll");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EDD030001Message listMessage = (EDD030001Message)list.get(index);
						
			session.setAttribute("refCode", listMessage);
			session.setAttribute("userPO", userPO);
			
			forward("EDD0300_hold_uncollected_det.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqHoldDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0300", req); 
			
			JBObjList list = (JBObjList)session.getAttribute("holduncoll");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EDD030001Message listMessage = (EDD030001Message)list.get(index);
			
			EDD030001Message msgList = (EDD030001Message) mp.getMessageRecord("EDD030001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0300");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0009");
		 	msgList.setE01UNCACC(listMessage.getE01UNCACC());
		 	msgList.setE01UNCSEQ(listMessage.getE01UNCSEQ());

			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0300_hold_uncollected.jsp", req, res);
			} else {
				procReqHoldList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procActionHoldMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0300", req);
			EDD030001Message msgList = (EDD030001Message) mp.getMessageRecord("EDD030001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD0300");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	if (userPO.getPurpose().equals("NEW")){
				msgList.setH01OPECOD("0001");
			} else {
				msgList.setH01OPECOD("0005");
			}
		 	
		 	setMessageRecord(req, msgList);
		 	
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDD030001Message) mp.receiveMessageRecord("EDD030001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("refCode", msgList);
				
				forward("EDD0300_hold_uncollected_det.jsp", req, res);
				
			} else {
				procReqHoldList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
		
	}
	
}
