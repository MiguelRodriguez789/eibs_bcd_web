package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD018001Message;
import datapro.eibs.beans.ESD020601Message;
import datapro.eibs.beans.ESD020601Message;
import datapro.eibs.beans.ESD020601Message;
import datapro.eibs.beans.ESD020601Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSESD0206 extends JSEIBSServlet {
	
	protected static final int R_ENTER = 100;
	protected static final int R_FEES_LIST = 200;
	protected static final int R_FEES_NEW = 1;
	protected static final int R_FEES_MAINT = 2;
	protected static final int R_FEES_REVER = 3;
	protected static final int R_FEES_DELETE = 4;
	protected static final int A_APPROVAL = 6;
	protected static final int R_INQUIRY_APP = 7;

	protected static final int A_FEES_MAINT = 300;

	protected static final int R_PASSWORD = 10;	
	protected static final int R_APPROVAL = 50;	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
			case R_ENTER :
				procReqEnter(user, req, res, session, screen);
				break;			
			case R_FEES_LIST :
				procReqFeesList(user, req, res, session);
				break;				
			case R_FEES_NEW :
				procReqFeesNew(user, req, res, session);
				break;
			case R_FEES_MAINT :
				procReqFeesMaintenance(user, req, res, session);
				break;
			case R_FEES_REVER :
				procReqFeesReversal(user, req, res, session);
				break;
			case R_FEES_DELETE :
				procReqFeesDelete(user, req, res, session);
				break;
			case A_FEES_MAINT :
				procActionFeesMaintenance(user, req, res, session);
				break;

			case R_PASSWORD :
				procReqPassword(req, res, session);
				break;
			case R_APPROVAL :
				procReqApproval(user, req, res, session);
				break;
			case A_APPROVAL:
				procActionApproval(user, req, res, session);
				break;
			case R_INQUIRY_APP:
				procReqInquiryApp(user, req, res, session);
				break;
				
			
			default :
				forward(devPage, req, res);
				break;
		}

	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		
			forward("ESD0206_reversal_fees_enter.jsp", req, res);

	}
	
	private void procReqFeesList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ESD0206", req);
			ESD020601Message msgList = (ESD020601Message) mp.getMessageRecord("ESD020601");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("ESD0206");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0015");
		 	
		 	if (req.getParameter("E01CACACC") == null){
		 		msgList.setE01CACACC(userPO.getAccNum());
		 	} else {
		 		msgList.setE01CACACC(req.getParameter("E01CACACC"));
		 		userPO.setAccNum(req.getParameter("E01CACACC"));
		 	}
		 	
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ESD0206_reversal_fees_enter.jsp", req, res);
			} else {

				ESD020601Message msgHeader = (ESD020601Message) mp.receiveMessageRecord("ESD020601");

		 		userPO.setCusNum(msgHeader.getE01CACCUN());
		 		userPO.setCusName(msgHeader.getE01CUSNA1());
		 		userPO.setCurrency(msgHeader.getE01CACCCY());
		 		userPO.setProdCode(msgHeader.getE01CACPRO());
		 		userPO.setBank(msgHeader.getE01CACBNK());
		 		userPO.setBranch(msgHeader.getE01CACBRN());

		 		JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

				session.setAttribute("userPO", userPO);
				session.setAttribute("holduncoll", list);
	
				forward("ESD0206_reversal_fees_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqFeesNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0206", req);
			int seq = 0;

			JBObjList list = (JBObjList)session.getAttribute("holduncoll");
			int index = list.getLastRec();
			if (index >= 0){
				ESD020601Message listMessage = (ESD020601Message)list.get(index);
				seq = Integer.parseInt(listMessage.getE01CACSEQ().trim());
			} 
			seq++;
			
			ESD020601Message msgList = (ESD020601Message) mp.getMessageRecord("ESD020601");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("ESD0206");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0001");
		 	
		 	userPO.setPurpose("NEW");
		 	
		 	msgList.setE01CACACC(userPO.getAccNum());
		 	msgList.setE01CACSEQ(String.valueOf(seq));
		 	msgList.setE01CACRDM(user.getE01RDM());
		 	msgList.setE01CACRDD(user.getE01RDD());
		 	msgList.setE01CACRDY(user.getE01RDY());

		 	session.setAttribute("userPO", userPO);
			session.setAttribute("refCode", msgList);
				
			forward("ESD0206_reversal_fees_det.jsp", req, res);


		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqFeesMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0206", req);
			
			userPO.setPurpose("MAINTENANCE");
			
			JBObjList list = (JBObjList)session.getAttribute("holduncoll");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			ESD020601Message listMessage = (ESD020601Message)list.get(index);
						
			session.setAttribute("refCode", listMessage);
			session.setAttribute("userPO", userPO);
			
			forward("ESD0206_reversal_fees_det.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	
	private void procReqFeesReversal(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0206", req);
			
			userPO.setPurpose("REVERSAL");
			
			JBObjList list = (JBObjList)session.getAttribute("holduncoll");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			ESD020601Message listMessage = (ESD020601Message)list.get(index);
						
			session.setAttribute("refCode", listMessage);
			session.setAttribute("userPO", userPO);
			
			forward("ESD0206_reversal_fees_det.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	
	private void procReqFeesDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0206", req); 
			
			JBObjList list = (JBObjList)session.getAttribute("holduncoll");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			ESD020601Message listMessage = (ESD020601Message)list.get(index);
			
			ESD020601Message msgList = (ESD020601Message) mp.getMessageRecord("ESD020601");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("ESD0206");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0009");
		 	msgList.setE01CACACC(listMessage.getE01CACACC());
		 	msgList.setE01CACSEQ(listMessage.getE01CACSEQ());
		 	msgList.setE01CACRDY(listMessage.getE01CACRDY());
		 	msgList.setE01CACRDM(listMessage.getE01CACRDM());		 	
		 	msgList.setE01CACRDD(listMessage.getE01CACRDD());		 	
		 	msgList.setE01CACCDE(listMessage.getE01CACCDE());		 	
		 	
		 	
		 	
			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ESD0206_reversal_fees_list.jsp", req, res);
			} else {
				procReqFeesList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procActionFeesMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0206", req);
			ESD020601Message msgList = (ESD020601Message) mp.getMessageRecord("ESD020601");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("ESD0206");
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
			msgList = (ESD020601Message) mp.receiveMessageRecord("ESD020601");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("refCode", msgList);
				
				forward("ESD0206_reversal_fees_det.jsp", req, res);
				
			} else {
				procReqFeesList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
		
	}


	
	
	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
	
		userPO.setRedirect("/servlet/datapro.eibs.params.JSESD0206?SCREEN="
							+ R_APPROVAL);
		session.setAttribute("userPO", userPO);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}
	
	
	
	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0206", req);
			ESD020601Message msgList = (ESD020601Message) mp.getMessageRecord("ESD020601");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0206");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0025");
			msgList.setE01CACBNK("01");				
			userPO.setHeader1(msgList.getE01CACBNK());
			
			mp.sendMessage(msgList);
			
			//ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("ESD0206Help", list);

			forward("ESD0206_reversal_fees_approval.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	
	
	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0206", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD0206Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ESD020601Message listMessage = (ESD020601Message)list.get(index);
			
			
			ESD020601Message msgList = (ESD020601Message) mp.getMessageRecord("ESD020601");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0206");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0010");
			msgList.setH01FLGWK1(req.getParameter("action").trim());
		
		 	msgList.setE01CACACC(listMessage.getE01CACACC());
		 	msgList.setE01CACSEQ(listMessage.getE01CACSEQ());
		 	msgList.setE01CACRDY(listMessage.getE01CACRDY());
		 	msgList.setE01CACRDM(listMessage.getE01CACRDM());		 	
		 	msgList.setE01CACRDD(listMessage.getE01CACRDD());		 	
		 	msgList.setE01CACCDE(listMessage.getE01CACCDE());		 	
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020601Message) mp.receiveMessageRecord("ESD020601");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ESD0206_reversal_fees_approval.jsp", req, res);
			} else {
				
				procReqApproval(user, req, res, session);				
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	
	
	private void procReqInquiryApp(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0206", req);
			
			userPO.setPurpose("INQUIRY");
			
			JBObjList list = (JBObjList)session.getAttribute("ESD0206Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ESD020601Message listMessage = (ESD020601Message)list.get(index);
						
			session.setAttribute("refCode", listMessage);
			session.setAttribute("userPO", userPO);
			
			forward("ESD0206_reversal_fees_det_inq.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	
}
