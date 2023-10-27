package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECD0003DSMessage;
import datapro.eibs.beans.ECH020501Message;
import datapro.eibs.beans.ECH026501Message;
import datapro.eibs.beans.ECH026502Message;
import datapro.eibs.beans.ECH026503Message;
import datapro.eibs.beans.EDD030001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSECH0265 extends JSEIBSServlet {

	protected static final int R_ENTER_INQ 			= 100;
	protected static final int R_CHB_LIST_INQ		= 200;
	protected static final int R_CHECK_BOOK			= 1;
	protected static final int A_CHECK_BOOK			= 2;
	protected static final int R_CHECK				= 3;
	protected static final int A_CHECK				= 4;
	protected static final int W_INV_STOCK_LIST 	= 113;

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
			case W_INV_STOCK_LIST :
				procActionInvListStock(user, req, res, session);
				break;			
			default :
				forward(devPage, req, res);
				break;
		}

	}

	private void procReqEnterCheckInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		forward("ECH0265_checks_enter_inq.jsp", req, res);
		
	}
	
	private void procActionEnterCheckInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			
			mp = getMessageProcessor("ECH0205", req);
			ECH020501Message msgList0 = (ECH020501Message) mp.getMessageRecord("ECH020501");
			msgList0.setH01USERID(user.getH01USR());
		 	msgList0.setH01PROGRM("ECH0205");
		 	msgList0.setH01TIMSYS(getTimeStamp());
		 	msgList0.setH01SCRCOD("01");
		 	msgList0.setH01OPECOD("0005");
		 	
		 	if(req.getParameter("E01SELBNK") == null){
		 		msgList0.setE01CHLBNK(userPO.getBank());
		 	}else{
		 		msgList0.setE01CHLBNK(req.getParameter("E01SELBNK"));
		 	}
		 	if(req.getParameter("E01SELBRN") != null) {
		 		msgList0.setE01CHLBRN(req.getParameter("E01SELBRN"));
		 	}else{
		 		msgList0.setE01CHLBRN("0");
		 	}
		 	if(req.getParameter("E01SELTCB") != null) {
		 		msgList0.setE01CHLTCB(req.getParameter("E01SELTCB"));
		 	}else{
		 		msgList0.setE01CHLTCB("");
		 	}
		 	userPO.setHeader1(msgList0.getE01CHLTCB());
		 	
		 	mp.sendMessage(msgList0);
		 	JBObjList checkStocks = mp.receiveMessageRecordList("H01FLGMAS");
			
		 	
			//mp = getMessageProcessor("ECH0265", req);
			ECH026501Message msgList = (ECH026501Message) mp.getMessageRecord("ECH026501");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("ECH0265");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	
		 	if(req.getParameter("E01SELBNK") == null){
		 		msgList.setE01SELBNK(userPO.getBank());
		 	}else{
		 		msgList.setE01SELBNK(req.getParameter("E01SELBNK"));
		 	}
		 	if(req.getParameter("E01SELBRN") != null) {
		 		msgList.setE01SELBRN(req.getParameter("E01SELBRN"));
		 	}else{
		 		msgList.setE01SELBRN("0");
		 	}
		 	if(req.getParameter("E01SELTCB") != null) {
		 		msgList.setE01SELTCB(req.getParameter("E01SELTCB"));
		 	}else{
		 		msgList.setE01SELTCB("");
		 	}
			if(req.getParameter("SEARCHCDE") != null) {
		 		msgList.setE01SELACC(req.getParameter("SEARCHCDE"));
		 	}else{
		 		msgList.setE01SELACC("");
		 	}
		 	
		 	mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ECH0265_checks_enter_inq.jsp", req, res);
			} else {
				ECH026503Message msgHeader = (ECH026503Message) mp.receiveMessageRecord("ECH026503");
				
				userPO.setCusNum(msgHeader.getE03ACMCUN());
				userPO.setCusName(msgHeader.getE03CUSNA1());
				userPO.setAccNum(msgHeader.getE03ACMACC());
				userPO.setCurrency(msgHeader.getE03ACMCCY());
				userPO.setProdCode(msgHeader.getE03ACMPRO());
				
				

				JBObjList checkBooks = mp.receiveMessageRecordList("H01FLGMAS");
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("rtBasic", msgHeader);
				session.setAttribute("checkStocks", checkStocks);
				session.setAttribute("checkBooks", checkBooks);

				forward("ECH0265_chb_list_inq.jsp", req, res);

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
			mp = getMessageProcessor("ECH0265", req);
			ECH026502Message msgList = (ECH026502Message) mp.getMessageRecord("ECH026502");
			msgList.setH02USERID(user.getH01USR());
		 	msgList.setH02PROGRM("ECH0265");
		 	msgList.setH02TIMSYS(getTimeStamp());
		 	msgList.setH02SCRCOD("01");
		 	msgList.setE02CHUACC(userPO.getAccNum());
	 		msgList.setE02CHUNCB(req.getParameter("BOOKNUM").trim());
			userPO.setHeader9(req.getParameter("BOOKNUM").trim());
	
		 	mp.sendMessage(msgList);

			JBObjList checks = mp.receiveMessageRecordList("H02FLGMAS");
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("checks", checks);

			forward("ECH0265_checks_inq.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	protected void procActionInvListStock(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {
		
			UserPos userPO = null;
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			
			try {
			
				try {
					forward("ECH0265_stock_warning_viewer.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
		
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
		
		}


}
