package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECH056501Message;
import datapro.eibs.beans.ECH056502Message;
import datapro.eibs.beans.ECH056503Message;
import datapro.eibs.beans.ECH058001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSECH0580 extends JSEIBSServlet {
	
	protected static final int R_ENTER = 100;
	protected static final int R_CHECK_BOOK_LIST = 200;
	protected static final int R_ANULAR_CHEQUERA = 1;
	protected static final int R_ANULAR_CHEQUES = 2;
	protected static final int A_ANULAR = 300;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_ENTER:
				processReqEnter(user, req, res, session, screen);
				break;
			case R_CHECK_BOOK_LIST:
				processReqCheckBookList(user, req, res, session, screen);
				break;
			case R_ANULAR_CHEQUERA:
				processReqAnularChequera(user, req, res, session, screen);
				break;
			case R_ANULAR_CHEQUES:
				processReqAnularCheques(user, req, res, session, screen);
				break;
			case A_ANULAR:
				processActionAnular(user, req, res, session, screen);
				break;
			default :
				forward(devPage, req, res);
				break;
		}

	}

	private void processReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {  

		forward("ECH0580_chb_enter_anul.jsp", req, res);
		
	}

	private void processReqCheckBookList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECH0565", req);
			ECH056501Message msgList = (ECH056501Message) mp.getMessageRecord("ECH056501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECH0565");
			msgList.setH01TIMSYS(SuperServlet.getTimeStamp());
			msgList.setH01SCRCOD("01");

		 	if(req.getParameter("E01CHMACC") == null){
		 		msgList.setE01CHMACC(userPO.getAccNum());
		 	} else {
		 		msgList.setE01CHMACC(req.getParameter("E01CHMACC"));
		 		userPO.setAccNum(req.getParameter("E01CHMACC"));
		 	}

			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp	.receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ECH0580_chb_enter_anul.jsp", req, res);
			} else {
				ECH056503Message msgHeader = (ECH056503Message) mp.receiveMessageRecord("ECH056503");
				
				userPO.setCusNum(msgHeader.getE03ACMCUN());
				userPO.setCusName(msgHeader.getE03CUSNA1());
				userPO.setAccNum(msgHeader.getE03ACMACC());
				userPO.setCurrency(msgHeader.getE03ACMCCY());
				userPO.setProdCode(msgHeader.getE03ACMPRO());

				JBObjList checkBooks = mp.receiveMessageRecordList("H01FLGMAS");

				session.setAttribute("rtBasic", msgHeader);
				session.setAttribute("userPO", userPO);
				session.setAttribute("checkBooks", checkBooks);

				forward("ECH0580_check_books_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void processReqAnularChequera(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECH0565", req);
			
			userPO.setPurpose("CHEQUERA");
			
			JBObjList list = (JBObjList)session.getAttribute("checkBooks");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ECH056501Message listMessage = (ECH056501Message)list.get(index);

			ECH056502Message check = (ECH056502Message) mp.getMessageRecord("ECH056502");
			check.setH02USERID(user.getH01USR());
			check.setH02PROGRM("ECH0565");
			check.setH02TIMSYS(SuperServlet.getTimeStamp());
			check.setH02SCRCOD("01");
			check.setE02CHMACC(userPO.getAccNum());
			check.setE02CHMNCB(listMessage.getE01CHMNCB());
			userPO.setHeader9(listMessage.getE01CHMNCB());

			mp.sendMessage(check);

			JBObjList checks = mp.receiveMessageRecordList("H02FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("checks", checks);

			forward("ECH0580_checks_status.jsp", req, res);

 		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void processReqAnularCheques(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECH0565", req);
			
			userPO.setPurpose("CHEQUES");
			
			JBObjList list = (JBObjList)session.getAttribute("checkBooks");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ECH056501Message listMessage = (ECH056501Message)list.get(index);

			ECH056502Message check = (ECH056502Message) mp.getMessageRecord("ECH056502");
			check.setH02USERID(user.getH01USR());
			check.setH02PROGRM("ECH0565");
			check.setH02TIMSYS(SuperServlet.getTimeStamp());
			check.setH02SCRCOD("01");
			check.setE02CHMACC(userPO.getAccNum());
			check.setE02CHMNCB(listMessage.getE01CHMNCB());
			userPO.setHeader9(listMessage.getE01CHMNCB());

			mp.sendMessage(check);

			JBObjList checks = mp.receiveMessageRecordList("H02FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("checks", checks);

			forward("ECH0580_checks_status.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}

	}
	
	private void processActionAnular(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECH0580", req);
			ECH058001Message list = (ECH058001Message) mp.getMessageRecord("ECH058001");
			list.setH01USERID(user.getH01USR());
			list.setH01PROGRM("ECH0580");
			list.setH01TIMSYS(SuperServlet.getTimeStamp());
			list.setH01SCRCOD("01");
			list.setE01CHMACC(userPO.getAccNum());
			list.setE01CHMNCB(userPO.getHeader9());
			
			if(userPO.getPurpose().equals("CHEQUERA")){
				list.setH01OPECOD("01");
			} else {
				list.setH01OPECOD("02");
				list.setE01CHMICK(req.getParameter("E01CHMICK"));
				list.setE01CHMFCK(req.getParameter("E01CHMFCK"));
				list.setE01CHMSTS(req.getParameter("E01CHMSTS"));
			}

			mp.sendMessage(list);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ECH0580_checks_status.jsp", req, res);
			} else {
				processReqCheckBookList(user, req, res, session, screen);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}


}
