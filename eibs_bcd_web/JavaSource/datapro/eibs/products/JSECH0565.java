package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECH056501Message;
import datapro.eibs.beans.ECH056502Message;
import datapro.eibs.beans.ECH056503Message;
import datapro.eibs.beans.EDD030001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSECH0565 extends JSEIBSServlet {

	protected static final int R_ENTER_INQ 			= 100;
	protected static final int R_CHB_LIST_INQ		= 200;
	protected static final int R_CHECK_BOOK			= 1;
	protected static final int A_CHECK_BOOK			= 2;
	protected static final int R_CHECK				= 3;
	protected static final int A_CHECK				= 4;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen) {						
			case R_ENTER_INQ :
				procReqEnterCheckInq(user, req, res, session);
				break;
			case R_CHB_LIST_INQ :
				procActionEnterCheckInq(user, req, res, session);
				break;	
			case R_CHECK :
				procReqCheck(user, req, res, session);
				break;
			case A_CHECK :
				break;									
			default :
				forward(devPage, req, res);
				break;
		}

	}

	private void procReqEnterCheckInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		forward("ECH0565_chb_enter_inq.jsp", req, res);
		
	}
	
	private void procActionEnterCheckInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECH0565", req);
			ECH056501Message msgList = (ECH056501Message) mp.getMessageRecord("ECH056501");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("ECH0565");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	
		 	if(req.getParameter("E01CHMACC") == null){
		 		msgList.setE01CHMACC(userPO.getAccNum());
		 	} else {
		 		msgList.setE01CHMACC(req.getParameter("E01CHMACC"));
		 		userPO.setAccNum(req.getParameter("E01CHMACC"));
		 	}
		 	
		 	mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ECH0565_chb_enter_inq.jsp", req, res);
			} else {
				ECH056503Message msgHeader = (ECH056503Message) mp.receiveMessageRecord("ECH056503");
				
				userPO.setCusNum(msgHeader.getE03ACMCUN());
				userPO.setCusName(msgHeader.getE03CUSNA1());
				userPO.setAccNum(msgHeader.getE03ACMACC());
				userPO.setCurrency(msgHeader.getE03ACMCCY());
				userPO.setProdCode(msgHeader.getE03ACMPRO());

				JBObjList checkBooks = mp.receiveMessageRecordList("H01FLGMAS");
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("rtBasic", msgHeader);
				session.setAttribute("checkBooks", checkBooks);

				forward("ECH0565_chb_list_inq.jsp", req, res);

			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqCheck(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos	userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECH0565", req);
			ECH056502Message msgList = (ECH056502Message) mp.getMessageRecord("ECH056502");
			msgList.setH02USERID(user.getH01USR());
		 	msgList.setH02PROGRM("ECH0565");
		 	msgList.setH02TIMSYS(getTimeStamp());
		 	msgList.setH02SCRCOD("01");
		 	msgList.setE02CHMACC(userPO.getAccNum());
	 		msgList.setE02CHMNCB(req.getParameter("BOOKNUM").trim());
			userPO.setHeader9(req.getParameter("BOOKNUM").trim());
	
		 	mp.sendMessage(msgList);

			JBObjList checks = mp.receiveMessageRecordList("H02FLGMAS");
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("checks", checks);

			forward("ECH0565_checks_inq.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}



}
