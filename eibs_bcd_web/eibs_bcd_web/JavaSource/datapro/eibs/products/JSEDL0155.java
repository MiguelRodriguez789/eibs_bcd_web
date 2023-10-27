package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL015501Message;
import datapro.eibs.beans.EDL015502Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0155 extends JSEIBSServlet {

	protected static final int R_ENTER_ACCOUNT		= 1;
	protected static final int A_ENTER_ACCOUNT		= 2;	
	protected static final int A_MAINT_DELETE		= 3;
	protected static final int R_DETAIL				= 4;
	protected static final int A_NEW_PAYMENT		= 5;
	protected static final int R_UPD_PAYMENT		= 6;
	protected static final int A_UPD_PAYMENT		= 7;

	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		switch (screen) {
			case R_ENTER_ACCOUNT : 
				procReqEnterAccount(user, req, res, session);
				break;	
			case A_ENTER_ACCOUNT : 
				procActionEnterAccount(user, req, res, session);
				break;
			case A_MAINT_DELETE :
				procActionMaint(user, req, res, session);
				break;
			case A_NEW_PAYMENT :
				procActionNewPayment(user, req, res, session);
				break;
			case R_DETAIL :
				procReqDetail(user, req, res, session);
				break;
			case R_UPD_PAYMENT :
				procReqUpdPayment(user, req, res, session);
				break;
			case A_UPD_PAYMENT :
				procActionUpdPayment(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}


	private void procReqEnterAccount(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		userPO.setOption("LN");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.removeAttribute("list");
		forward("EDL0155_ln_enter_account.jsp", req, res);
	}


	private void procActionEnterAccount(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		
		try {
			mp = getMessageProcessor("EDL0155", req);
			EDL015501Message msgData = (EDL015501Message) mp.getMessageRecord("EDL015501");
			msgData.setH01USERID(user.getH01USR());
			msgData.setH01PROGRM("EDL0155");
			msgData.setH01TIMSYS(getTimeStamp());
			msgData.setH01SCRCOD("01");
			msgData.setH01OPECOD("0004");
			
			if(!(req.getParameter("E01DEAACC") == null)){
				msgData.setE01DEAACC(req.getParameter("E01DEAACC"));
			} else if(!(userPO.getAccNum() == null)){
				msgData.setE01DEAACC(userPO.getAccNum());
			}

			userPO.setCusNum(msgData.getE01DEAACC());

			mp.sendMessage(msgData);
			
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				session.setAttribute("error", newmessage);
				session.setAttribute("userPO", userPO);
				forward("EDL0155_ln_enter_account.jsp", req, res);
			} else {
				msgData = (EDL015501Message) newmessage;
				//Header
				userPO.setAccNum(msgData.getE01DEAACC());
				userPO.setProdCode(msgData.getE01DEAPRO());
				userPO.setCusNum(msgData.getE01DEACUN());
				userPO.setCusName(msgData.getE01CUSNA1());
				userPO.setCurrency(msgData.getE01DEACCY());
				userPO.setHeader2(Util.formatCell(msgData.getH01SCRCOD())); // Country
				userPO.setHeader3(Util.formatCell(msgData.getH01FLGWK3())); // Revaluation
				userPO.setHeader10(Util.formatCustomDate(user.getE01DTF(),
						                msgData.getBigDecimalE01OPENDM().intValue(),
						                msgData.getBigDecimalE01OPENDD().intValue(),
						                msgData.getBigDecimalE01OPENDY().intValue())); //Opening Date
				userPO.setHeader11(Util.formatCustomDate(user.getE01DTF(),
						                msgData.getBigDecimalE01MATURM().intValue(),
						                msgData.getBigDecimalE01MATURD().intValue(),
						                msgData.getBigDecimalE01MATURY().intValue())); //Maturity Date
				userPO.setHeader12(Util.formatCCY(msgData.getE01DEAOAM()));  // Original Amount
				userPO.setHeader13(Util.formatCell(msgData.getE01DEARTE())); // Rate
				userPO.setHeader14(Util.formatCell(msgData.getE01DEABAS())); //  Acrual Basis
				userPO.setHeader15(Util.formatCell(msgData.getE01DEAICT())); // Interest Type
				userPO.setHeader16(Util.formatCustomDate(user.getE01DTF(),
										msgData.getBigDecimalE01LSTCLM().intValue(),
										msgData.getBigDecimalE01LSTCLD().intValue(),
										msgData.getBigDecimalE01LSTCLY().intValue())); //Last Calc Date
				userPO.setHeader16(Util.formatCell(msgData.getE01DEAIFL())); // Interest Flag
				userPO.setHeader17(Util.formatCell(msgData.getE01DEAPCL())); // Interest Past Due
				userPO.setHeader18(Util.formatCell(msgData.getE01DEAPPD())); // 
				userPO.setHeader19(Util.formatCell(msgData.getE01DEAIPD())); // 
				
				JBObjList list = mp.receiveMessageRecordList("E02ENDFLD");
							
				session.setAttribute("list", list);
				session.setAttribute("header", msgData);
				session.setAttribute("userPO", userPO);
				forward("EDL0155_ln_crn_pay.jsp", req, res);				
				
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}


	private void procActionMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		String opcode="";
		
		try {
			mp = getMessageProcessor("EDL0155", req);
			EDL015502Message msgData = (EDL015502Message) mp.getMessageRecord("EDL015502");
			msgData.setH02USERID(user.getH01USR());
			msgData.setH02PROGRM("EDL0155");
			msgData.setH02TIMSYS(getTimeStamp());
			msgData.setH02SCRCOD("01");
			
			try {
				opcode = req.getParameter("OPTION");
			} catch (Exception e) {}
			if (opcode == null) opcode = "";
			
			msgData.setH02OPECOD(opcode);
			
			setMessageRecord(req, msgData);

			mp.sendMessage(msgData);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
			msgData = (EDL015502Message) mp.receiveMessageRecord();

			if (mp.hasError(error)) {
				session.setAttribute("error", error);
				session.setAttribute("userPO", userPO);
				session.setAttribute("record", msgData);
				forward("EDL0155_ln_crn_pay_det.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				res.sendRedirect( srctx + "/servlet/datapro.eibs.products.JSEDL0155?SCREEN=2&E01DEAACC="+userPO.getAccNum());
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	
	private void procActionNewPayment(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0155", req);
			EDL015502Message msgData = (EDL015502Message) mp.getMessageRecord("EDL015502");
			msgData.setH02USERID(user.getH01USR());
			msgData.setH02PROGRM("EDL0155");
			msgData.setH02TIMSYS(getTimeStamp());
			msgData.setH02SCRCOD("01");		
			msgData.setH02OPECOD("0001");
			
			msgData.setE02DLPACC(userPO.getAccNum());			

			mp.sendMessage(msgData);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(error)) {
				session.setAttribute("error", error);
				session.setAttribute("userPO", userPO);
				forward("EDL0155_ln_crn_pay_det.jsp", req, res);
			} else {
				msgData = (EDL015502Message) mp.receiveMessageRecord();
				
				session.setAttribute("header", msgData);
				session.setAttribute("userPO", userPO);
				forward("EDL0155_ln_crn_pay_det.jsp", req, res);				
				
			}

		} finally {
			if (mp != null)
				mp.close();
		}

		
	}


	private void procReqDetail(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0155", req);
			
			int rowNum = 0;
			try{
				rowNum = Integer.parseInt(req.getParameter("Row"));
			} catch (Exception e) {}
			
			JBObjList list = (JBObjList) session.getAttribute("list");
			list.setCurrentRow(rowNum);
			EDL015502Message record = (EDL015502Message) list.getRecord();
			session.setAttribute("record", record);
			session.setAttribute("userPO", userPO);
			forward("EDL0155_ln_crn_pay_det.jsp", req, res);				
		
		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procReqUpdPayment(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		
		try {
			mp = getMessageProcessor("EDL0155", req);
			EDL015501Message msgData = (EDL015501Message) mp.getMessageRecord("EDL015501");
			msgData.setH01USERID(user.getH01USR());
			msgData.setH01PROGRM("EDL0155");
			msgData.setH01TIMSYS(getTimeStamp());
			msgData.setH01SCRCOD("01");		
			msgData.setH01OPECOD("0002");
			
			msgData.setE01DEAACC(userPO.getAccNum());			
	
			mp.sendMessage(msgData);
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				session.setAttribute("error", newmessage);
				session.setAttribute("userPO", userPO);
				forward("EDL0155_ln_crn_pay_upd.jsp", req, res);
			} else {
				msgData = (EDL015501Message) newmessage;
				session.setAttribute("record", msgData);
				session.setAttribute("userPO", userPO);
				forward("EDL0155_ln_crn_pay_upd.jsp", req, res);				
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procActionUpdPayment(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		String opcode="";
		
		try {
			mp = getMessageProcessor("EDL0155", req);
			EDL015501Message msgData = (EDL015501Message) mp.getMessageRecord("EDL015501");
			msgData.setH01USERID(user.getH01USR());
			msgData.setH01PROGRM("EDL0155");
			msgData.setH01TIMSYS(getTimeStamp());
			msgData.setH01SCRCOD("01");
			msgData.setH01OPECOD("0003");
			
			msgData.setE01DEAACC(userPO.getAccNum());			
			
			setMessageRecord(req, msgData);

			mp.sendMessage(msgData);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
			msgData = (EDL015501Message) mp.receiveMessageRecord();

			if (mp.hasError(error)) {
				session.setAttribute("error", error);
				session.setAttribute("userPO", userPO);
				session.setAttribute("record", msgData);
				forward("EDL0155_ln_crn_pay_upd.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				res.sendRedirect( srctx + "/servlet/datapro.eibs.products.JSEDL0155?SCREEN=2&E01DEAACC="+userPO.getAccNum());
			}

		} finally {
			if (mp != null) mp.close();
		}
	
	}

}