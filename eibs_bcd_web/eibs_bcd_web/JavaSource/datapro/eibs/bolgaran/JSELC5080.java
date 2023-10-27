package datapro.eibs.bolgaran;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ELC508001Message;
import datapro.eibs.beans.ELC508002Message;
import datapro.eibs.beans.ELC508003Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

@SuppressWarnings("serial")
public class JSELC5080 extends JSEIBSServlet {

	protected static final int R_NEW_LIST  = 100;
	protected static final int A_NEW_LIST  = 101;  // ELC508002 
	protected static final int R_NEW       = 200;
	protected static final int A_NEW       = 300;  // ELC508001 0001
	protected static final int A_DETAIL    = 301;  // ELC508001 0005
	protected static final int R_MAINT     = 400;   
	protected static final int A_MAINT     = 401;  // ELC508001 0002
	protected static final int R_INQ       = 500;
	protected static final int A_APP_INQ   = 501;  // ELC508001 0004
	protected static final int A_PLN_LIST  = 600;  // ELC508003 0015
	protected static final int A_PLN_MAINT = 601;  // ELC508003 0002
	protected static final int R_PRORROGA  = 700;   
	
	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		switch (screen) {
			case R_NEW_LIST:
				procReqNewList(user, req, res, session);
				break;
			case A_NEW_LIST:
				procActNewList(user, req, res, session);
				break;
			case R_NEW:
				procReqNew(user, req, res, session);
				break;
			case A_NEW:
				procActNew(user, req, res, session);
				break;
			case A_DETAIL:
				procActDetail(user, req, res, session);
				break;
			case R_MAINT:
				procReqMaint(user, req, res, session);
				break;
			case A_MAINT:
				procActMaint(user, req, res, session);
				break;
			case R_INQ:
				procReqInq(user, req, res, session);
				break;
			case A_APP_INQ:
				procActAppInq(user, req, res, session);
				break;
			case A_PLN_LIST:
				procActPlnList(user, req, res, session);
				break;
			case A_PLN_MAINT:
				procActPlnMaint(user, req, res, session);
				break;
			case R_PRORROGA:
				procReqProrroga(user, req, res, session);
				break;

			default:
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqNewList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setRedirect("/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=101");
		userPO.setHeader1("Ingreso Documentarias");
		session.setAttribute("userPO", userPO);
		forward("EPV0150_client_help_container.jsp", req, res);
		
	}

	private void procActNewList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ELC5080", req);
			ELC508002Message msgHeader = (ELC508002Message) mp.getMessageRecord("ELC508002");
			msgHeader.setH02USERID(user.getH01USR());
			msgHeader.setH02PROGRM("ELC5080");
			msgHeader.setH02TIMSYS(getTimeStamp());
			msgHeader.setH02SCRCOD("01");
			msgHeader.setH02OPECOD("0015");
			
			if (!(req.getParameter("E01CUN") == null)) {
				msgHeader.setE02CUSCUN(req.getParameter("E01CUN"));
			} else if(!(userPO.getCusNum() == null)) {
				msgHeader.setE02CUSCUN(userPO.getCusNum());
			}

			userPO.setCusNum(msgHeader.getE02CUSCUN());
			userPO.setPurpose("NEW");
			
			mp.sendMessage(msgHeader);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(error)) {
				userPO.setRedirect("/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=101");
				session.setAttribute("error", error);
				forward("EPV0150_client_help_container.jsp", req, res);
			} else {
				msgHeader = (ELC508002Message) mp.receiveMessageRecord();
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
				userPO.setRedirect("1");
				session.setAttribute("list", list);
				session.setAttribute("header", msgHeader);
				session.setAttribute("userPO", userPO);
				forward("ELC5080_bg_list.jsp", req, res);				
			}

		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException {

		UserPos userPO = getUserPos(req);
		userPO.setHeader9("PV");
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=43&CUSNUM=" +  userPO.getCusNum());

	}

	private void procActNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ELC5080", req);
			ELC508001Message msg = (ELC508001Message) mp.getMessageRecord("ELC508001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ELC5080");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			
		 	if (req.getParameter("E01LCMPRO")== null){
		 		msg.setE01LCMPRO(userPO.getProdCode());
		 	} else {
		 		msg.setE01LCMPRO(req.getParameter("E01LCMPRO"));
			 	userPO.setProdCode(req.getParameter("E01LCMPRO"));
		 	}
		 	
			msg.setE01LCMCUN(userPO.getCusNum());
		 	msg.setE01LCMOAM(req.getParameter("E01LCMOAM") == null ? "0" : req.getParameter("E01LCMOAM").trim());

			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ELC508001Message) mp.receiveMessageRecord("ELC508001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=101&E01CUN=" +  userPO.getCusNum());
			} else {
				userPO.setIdentifier(msg.getE01LCMACC());
				userPO.setAccNum(msg.getE01LCMACC());
				userPO.setCusNum(msg.getE01LCMCUN());
				userPO.setCusName(msg.getE01APLNME());
				userPO.setBank(msg.getE01LCMBNK());
				userPO.setBranch(msg.getE01LCMBRN());
				userPO.setCurrency(msg.getE01LCMCCY());
				userPO.setProdCode(msg.getE01LCMPRO());

				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msg);
				forward("ELC5080_bg_basic.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procActDetail(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String flgexi = req.getParameter("FLGEXI") == null ? "" : req.getParameter("FLGEXI").trim();;
		
		try {
			mp = getMessageProcessor("ELC5080", req);
			ELC508001Message msg = (ELC508001Message) mp.getMessageRecord("ELC508001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ELC5080");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			msg.setH01FLGWK1(userPO.getPurpose().trim().substring(0,1));
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
						
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ELC508001Message) mp.receiveMessageRecord("ELC508001");

			if (mp.hasError(msgError) || !flgexi.equals("Y")) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("ELC5080_bg_basic.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				if (userPO.getRedirect().equals("1")) {
					procActNewList(user, req, res, session);
				} else {
					procReqMaint(user, req, res, session);
				}
			}

		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("BG");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=401");
		userPO.setProdCode("43");
		//Others Parameters
		userPO.setHeader1("E01LCMACC");
		userPO.setHeader2("H01FLGWK2");
		
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
		
	}

	private void procActMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		String attIdentifier = ((String) session.getAttribute("Identifier") == null) ? "" : (String) session.getAttribute("Identifier");
		String attAccNum = ((String) session.getAttribute("AccNum") == null) ? "" : (String) session.getAttribute("AccNum");

		if (!attAccNum.trim().equals("")) {
			userPO.setAccNum(attAccNum.trim()); 
		}
		
		MessageProcessor mp = null;
		ELC508002Message listMessage = null;
		String accNum = "";
		
		try {
			mp = getMessageProcessor("ELC5080", req);
			
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("list");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (ELC508002Message)list.get(index);
			}

			userPO.setPurpose(userPO.getPurpose().equals("") ? "MAINTENANCE" : userPO.getPurpose());
			userPO.setOption("PV");
			
			ELC508001Message msg = (ELC508001Message) mp.getMessageRecord("ELC508001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ELC5080");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			msg.setH01FLGWK1(userPO.getPurpose().trim().substring(0,1));
			
			if (listMessage == null) {
				accNum = req.getParameter("E01LCMACC") == null ? "0" : req.getParameter("E01LCMACC").trim();
				if (!accNum.equals("0")) {
					userPO.setAccNum(accNum.trim());
				}
				msg.setE01LCMACC(userPO.getAccNum());
			} else {
				msg.setE01LCMACC(listMessage.getE02LCMACC());
			}
				
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ELC508001Message) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				if (listMessage == null) {
					if (userPO.getPurpose().equals("RENEWAL")) {
						procReqProrroga(user, req, res, session);
					} else if (userPO.getPurpose().equals("MAINTENANCE")) {
						procReqMaint(user, req, res, session);
					} else if (userPO.getPurpose().equals("INQUIRY")) {
						procReqInq(user, req, res, session);
					}
				} else {
					procActNewList(user, req, res, session);
				}
			} else {
				userPO.setIdentifier(msg.getE01LCMACC());
				userPO.setAccNum(msg.getE01LCMACC());
				userPO.setCusNum(msg.getE01LCMCUN());
				userPO.setCusName(msg.getE01APLNME());
				userPO.setBank(msg.getE01LCMBNK());
				userPO.setBranch(msg.getE01LCMBRN());
				userPO.setCurrency(msg.getE01LCMCCY());
				userPO.setProdCode(msg.getE01LCMPRO());

				attAccNum = userPO.getAccNum();
				attIdentifier = userPO.getIdentifier();
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("Identifier", attIdentifier);
				session.setAttribute("AccNum", attAccNum);
				session.setAttribute("datarec", msg);
				forward("ELC5080_bg_basic.jsp", req, res);
			}
						
		} finally {
			if (mp !=null) mp.close();
		}

	}

	private void procReqInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("BG");
		userPO.setPurpose("INQUIRY");
		userPO.setRedirect("/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=401");
		userPO.setProdCode("43");
		//Others Parameters
		userPO.setHeader1("E01LCMACC");
		userPO.setHeader2("H01FLGWK2");
		
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
		
	}

	private void procActAppInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("BG");
		userPO.setPurpose("APPROVAL");
		userPO.setProdCode("43");
		//Others Parameters
		userPO.setHeader1("E01LCMACC");
		userPO.setHeader2("H01FLGWK2");
		
		session.setAttribute("userPO", userPO);
		
		procActMaint(user, req, res, session);
		
	}

	private void procActPlnList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
	
		try {
			mp = getMessageProcessor("ELC5080", req);
			ELC508003Message msgHeader = (ELC508003Message) mp.getMessageRecord("ELC508003");
			msgHeader.setH03USERID(user.getH01USR());
			msgHeader.setH03PROGRM("ELC5080");
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

			msgHeader = (ELC508003Message) mp.receiveMessageRecord();
			JBObjList msgList = mp.receiveMessageRecordList("H03FLGMAS");
			session.setAttribute("list", msgList);
			session.setAttribute("header", msgHeader);
			session.setAttribute("userPO", userPO);
			forward("ELC5080_bg_pln.jsp", req, res);				
			
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

			mp = getMessageProcessor("ELC5080", req);
		   	ELC508003Message msgChg = (ELC508003Message) mp.getMessageRecord("ELC508003");
			
			for (int i = 1; i <= size; i++) {
					
				msgChg.setH03USERID(user.getH01USR());
				msgChg.setH03PROGRM("ELC5080");
				msgChg.setH03TIMSYS(getTimeStamp());
				msgChg.setH03SCRCOD("01");
				msgChg.setH03OPECOD("0002");
				msgChg.setH03FLGMAS("");
				msgChg.setE03DCCACC(userPO.getAccNum());

				msgChg.setE03DCCPDM(req.getParameter("E03DCCPDM_"+i).trim());
				msgChg.setE03DCCPDD(req.getParameter("E03DCCPDD_"+i).trim());
				msgChg.setE03DCCPDY(req.getParameter("E03DCCPDY_"+i).trim());
				msgChg.setE03DCCSEQ(req.getParameter("E03DCCSEQ_"+i).trim());
				msgChg.setE03DCCCDE(req.getParameter("E03DCCCDE").trim());
				msgChg.setE03DCCPVI(req.getParameter("E03DCCPVI").trim());
				msgChg.setE03DCCNAR(req.getParameter("E03DCCNAR").trim());
				msgChg.setE03DCCPFL(req.getParameter("E03DCCPFL_"+i).trim());
				msgChg.setE03DCCCAM(req.getParameter("E03DCCCAM_"+i).trim());
				msgChg.setE03DCCOBK(req.getParameter("E03DCCOBK").trim());
				msgChg.setE03DCCOBR(req.getParameter("E03DCCOBR").trim());
				msgChg.setE03DCCOCY(req.getParameter("E03DCCOCY").trim());
				msgChg.setE03DCCOGL(req.getParameter("E03DCCOGL").trim());
				msgChg.setE03DCCOAC(req.getParameter("E03DCCOAC").trim());
				msgChg.setE03DCCIVA(req.getParameter("E03DCCIVA").trim());
				msgChg.setE03DCCIVP(req.getParameter("E03DCCIVP").trim());
				msgChg.setE03DCCIVB(req.getParameter("E03DCCIVB").trim());
					
				mp.sendMessage(msgChg);
				
				@SuppressWarnings("unused")
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				
			}
			
			msgChg.setH03USERID(user.getH01USR());
			msgChg.setH03PROGRM("ELC5080");
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
				forward("ELC5080_bg_pln_maint.jsp", req, res);
			} else {
				req.setAttribute("ACT","S");
				forward("ELC5080_bg_pln_maint.jsp", req, res);
			}
		
		}finally{
			if (mp != null) mp.close();
		}
	
	}

	private void procReqProrroga(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = new UserPos();
		userPO.setOption("BG");
		userPO.setPurpose("RENEWAL");
		userPO.setRedirect("/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=401");
		userPO.setProdCode("43");
		//Others Parameters
		userPO.setHeader1("E01LCMACC");
		userPO.setHeader2("H01FLGWK2");
		
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
		
	}
	
}
