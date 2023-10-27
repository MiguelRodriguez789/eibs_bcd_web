package datapro.eibs.bolgaran;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import datapro.eibs.beans.ELC508501Message;
import datapro.eibs.beans.ELC508502Message;
import datapro.eibs.beans.ELC508503Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

@SuppressWarnings("serial")
public class JSELC5085 extends JSEIBSServlet{

	protected static final int R_TRAN_ENTER = 100;
	protected static final int R_NEW_TRAN   = 101;   
	protected static final int A_NEW_TRAN   = 200;
	protected static final int A_PLN_LIST   = 600;  // ELC508003 0015
	protected static final int A_PLN_MAINT  = 601;  // ELC508003 0002
	protected static final int R_APP_INQ    = 900;
	protected static final int R_COMM       = 1500;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
	
		switch (screen) {
		case R_TRAN_ENTER:
			procTransSearch(user, req, res, session);
			break;
		case R_NEW_TRAN:
			procNewTrans(user, req, res, session);
			break;
		case A_NEW_TRAN:
			actionNewTrans(user, req, res, session);
			break;
		case A_PLN_LIST:
			procActPlnList(user, req, res, session);
			break;
		case A_PLN_MAINT:
			procActPlnMaint(user, req, res, session);
			break;
		case R_APP_INQ:
			reqInq(user, req, res, session);
			break;
		case R_COMM:
			caculateCommision(user, req, res, session);
			break;
		default :
		procTransSearch(user, req, res, session);
			break;
		}
	}

	private void procTransSearch(ESS0030DSMessage user, HttpServletRequest req,HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			forward("ELC5085_enter_boleta.jsp", req, res);
	}
	
	private void reqInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ELC5085", req);
			
			ELC508501Message msgTran = (ELC508501Message) mp.getMessageRecord("ELC508501");
		 	msgTran.setH01USERID(user.getH01USR());
		 	msgTran.setH01PROGRM("ELC5085");
		 	msgTran.setH01TIMSYS(getTimeStamp());
			msgTran.setH01SCRCOD("01");
			msgTran.setH01OPECOD("0004");
		 	msgTran.setE01LCMACC(req.getParameter("E01LCMACC").trim());
		 	
			mp.sendMessage(msgTran);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgTran = (ELC508501Message) mp.receiveMessageRecord("ELC508501");
			
			if (mp.hasError(msgError)){
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			} else{
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("bolgaran", msgTran);
				forward("ELC5085_transaction_details_INQ.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	private void procNewTrans(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	throws ServletException, IOException {

	UserPos userPO = getUserPos(req);
	MessageProcessor mp = null;
	
	try {
		
		userPO.setPurpose("MAINTENANCE");
		mp = getMessageProcessor("ELC5085", req);
		
		ELC508501Message msgTran = (ELC508501Message) mp.getMessageRecord("ELC508501");
	 	msgTran.setH01USERID(user.getH01USR());
	 	msgTran.setH01PROGRM("ELC5085");
	 	msgTran.setH01TIMSYS(getTimeStamp());
		msgTran.setH01SCRCOD("01");
		msgTran.setH01OPECOD("0002");
	 	msgTran.setE01LCMACC(req.getParameter("E01LCMACC").trim());
	 	
		mp.sendMessage(msgTran);

		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		msgTran = (ELC508501Message) mp.receiveMessageRecord("ELC508501");
		
		if (mp.hasError(msgError)){
			session.setAttribute("error", msgError);
			forward("ELC5085_enter_boleta.jsp", req, res);
		} else{
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("bolgaran", msgTran);
			forward("ELC5085_transaction_details.jsp", req, res);
		}
		
	} finally {
		if (mp != null) mp.close();
	}
}
	
	
	
	private void actionNewTrans(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ELC5085", req);
			
			ELC508501Message msgData = (ELC508501Message) mp.getMessageRecord("ELC508501");
		 	msgData.setH01USERID(user.getH01USR());
		 	msgData.setH01PROGRM("ELC5085");
		 	msgData.setH01TIMSYS(getTimeStamp());
			msgData.setH01SCRCOD("01");
			setMessageRecord(req, msgData);
		 	
			mp.sendMessage(msgData);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgData = (ELC508501Message) mp.receiveMessageRecord("ELC508501");
			
			session.setAttribute("error", msgError);
			session.setAttribute("bolgaran", msgData);
			session.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)){
				forward("ELC5085_transaction_details.jsp", req, res);
			} else{
				procTransSearch(user, req, res, session); 
			}
			
		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procActPlnList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
	
		try {
			mp = getMessageProcessor("ELC5085", req);
			ELC508503Message msgHeader = (ELC508503Message) mp.getMessageRecord("ELC508503");
			msgHeader.setH03USERID(user.getH01USR());
			msgHeader.setH03PROGRM("ELC5085");
			msgHeader.setH03TIMSYS(getTimeStamp());
			msgHeader.setH03SCRCOD("01");
			msgHeader.setH03OPECOD("0015");
			
			req.setAttribute("IFRAME",req.getParameter("IFRAME") == null ? "" : req.getParameter("IFRAME").trim());
			msgHeader.setE03DCCACC(req.getParameter("E03DCCACC") == null ? "0" : req.getParameter("E03DCCACC").trim());
	
			mp.sendMessage(msgHeader);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
	
			if (mp.hasError(error)) {
				session.setAttribute("error", error);
			}
	
			msgHeader = (ELC508503Message) mp.receiveMessageRecord();
			JBObjList msgList = mp.receiveMessageRecordList("H03FLGMAS");
			session.setAttribute("list", msgList);
			session.setAttribute("header", msgHeader);
			session.setAttribute("userPO", userPO);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			forward("ELC5085_bg_pln.jsp", req, res);				
			
		} finally {
			if (mp != null) mp.close();
		}
	
	}

	private void procActPlnMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		int size = Integer.parseInt(req.getParameter("TABLESIZE"));
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
	
		try {
	
			mp = getMessageProcessor("ELC5085", req);
		   	ELC508503Message msgChg = (ELC508503Message) mp.getMessageRecord("ELC508503");
			
			for (int i = 1; i <= size; i++) {
					
				msgChg.setH03USERID(user.getH01USR());
				msgChg.setH03PROGRM("ELC5085");
				msgChg.setH03TIMSYS(getTimeStamp());
				msgChg.setH03SCRCOD("01");
				msgChg.setH03OPECOD("0002");
				msgChg.setH03FLGMAS("");
				
				msgChg.setE03DCCACC(req.getParameter("E03DCCACC") == null ? "0" : req.getParameter("E03DCCACC").trim());
				msgChg.setE03DCCPDY(req.getParameter("E03DCCPDY_"+i).trim());
				msgChg.setE03DCCPDM(req.getParameter("E03DCCPDM_"+i).trim());
				msgChg.setE03DCCPDD(req.getParameter("E03DCCPDD_"+i).trim());
				msgChg.setE03DCCSEQ(req.getParameter("E03DCCSEQ_"+i).trim());
				msgChg.setE03DCCCDE(req.getParameter("E03DCCCDE_"+i).trim());
				msgChg.setE03DCCPVI(req.getParameter("E03DCCPVI_"+i).trim());
				msgChg.setE03DCCNAR(req.getParameter("E03DCCNAR_"+i).trim());
				msgChg.setE03DCCPFL(req.getParameter("E03DCCPFL_"+i).trim());
				msgChg.setE03DCCCAM(req.getParameter("E03DCCCAM_"+i).trim());
				msgChg.setE03DCCIAM(req.getParameter("E03DCCIAM_"+i).trim());
				msgChg.setE03DCCGAM(req.getParameter("E03DCCGAM_"+i).trim());
				msgChg.setE03DCCRTY(req.getParameter("E03DCCRTY_"+i).trim());
					
				mp.sendMessage(msgChg);
				
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				
			}
			
			msgChg.setH03USERID(user.getH01USR());
			msgChg.setH03PROGRM("ELC5085");
			msgChg.setH03TIMSYS(getTimeStamp());
			msgChg.setH03SCRCOD("01");
			msgChg.setH03OPECOD("0002");
			msgChg.setH03FLGMAS("*");
			msgChg.setE03DCCACC(userPO.getAccNum());
	
			mp.sendMessage(msgChg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
			  	JBObjList list_wError = mp.receiveMessageRecordList("H03FLGMAS");
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("list", list_wError);
				forward("ELC5085_bg_pln_det.jsp", req, res);
			} else {
				req.setAttribute("ACT","S");
				forward("ELC5085_bg_pln_det.jsp", req, res);
			}
		
		}finally{
			if (mp != null) mp.close();
		}
	
	}

	private void caculateCommision(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	throws ServletException, IOException {
	
	UserPos userPO = getUserPos(req);
	MessageProcessor mp = null;
	try {
		mp = getMessageProcessor("ELC5085", req);
		ELC508502Message msgData = (ELC508502Message) mp.getMessageRecord("ELC508502");
		msgData.setH02USERID(user.getH01USR());
		msgData.setH02PROGRM("EPV0900");
		msgData.setH02TIMSYS(getTimeStamp());
		msgData.setH02SCRCOD("01");
		msgData.setE02LCMACC(req.getParameter("ACC").trim());
		msgData.setE02TRNCHG(req.getParameter("commisionTotAJAX").trim());
		msgData.setE02TRNCHF(req.getParameter("operativeFlagAJAX").trim());

		mp.sendMessage(msgData);

		msgData = (ELC508502Message) mp.receiveMessageRecord("ELC508502");

		session.setAttribute("userPO", userPO);
		JSONObject json = new JSONObject();
		json.put("type", "data");
		json.put("E02TRNCOM", msgData.getE02TRNCOM());
		json.put("E02TRNIVA", msgData.getE02TRNIVA());
		sendJSONResponse(res, json);

	} finally {
		if (mp != null)
			mp.close();
	}
	
}
	
	
	
	
}
