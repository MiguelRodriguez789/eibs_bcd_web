package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD000001Message;
import datapro.eibs.beans.EDD000002Message;
import datapro.eibs.beans.EDD009001Message;
import datapro.eibs.beans.EFT000015Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEXEDD0000 extends JSEDD0000 {
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_CP_ENTER_INQUIRY :
				procReqCPEnterInquiry(user, req, res, session);
				break;
				// Cuotas de Participacion
			case A_CP_BASIC:
				procActionCPBasic(user, req, res, session);
				break;
			default :
				super.processRequest(user, req, res, session, screen);
				break;
		}
	}
	
	protected void procReqCPEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		UserPos userPO = new UserPos();
		userPO.setOption("CP");
		userPO.setPurpose("NEW");
		ses.setAttribute("error", new ELEERRMessage());
		ses.setAttribute("userPO", userPO);
		forward("EDD0000_cp_enter_new.jsp", req, res);
	}

	protected void procReqSVEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("SV");
		userPO.setPurpose("INQUIRY");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=1600");
		userPO.setProdCode("04");
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	protected void procReqRTEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("INQUIRY");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=1400");
		userPO.setProdCode("RA");
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	protected void procReqCPEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CP");
		userPO.setPurpose("INQUIRY");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=5600");
		userPO.setProdCode("06");
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	protected void procReqRTEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=400");
		userPO.setProdCode("RA");
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("GENERIC_account_enter.jsp", req, res);
	}
	
	protected void procReqRTEnterChange(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("STATUS");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=215");
		userPO.setProdCode("RA");
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("GENERIC_account_enter.jsp", req, res);
	}
	
	protected void procReqSVEnterChange(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("SV");
		userPO.setPurpose("STATUS");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=315");
		userPO.setProdCode("04");
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("GENERIC_account_enter.jsp", req, res);
	}
	
	
	private void procActionChgStatus(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000002Message msgRT = (EDD000002Message) session.getAttribute("rtStatus");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EDD0000");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02SCRCOD("01");
			msgRT.setH02OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000002Message) mp.receiveMessageRecord("EDD000002");
			
			userPO.setAccNum(msgRT.getE02ACMACC());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_chg_acc_status.jsp";
			} else {
				procReqRTEnterChange(user, req, res, session);
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtStatus", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqSVEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("SV");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=400");
		userPO.setProdCode("04");
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	protected void procReqCPEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CP");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=4800");
		userPO.setProdCode("06");
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	protected void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01FLGWK1("SV".equals(userPO.getOption()) ? "S" : "R");
			msgRT.setH01OPECOD("0002");
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "GENERIC_account_enter.jsp";
			} else {
				userPO.setPurpose("MAINTENANCE");
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setIdentifier(msgRT.getE01ACMACC());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setHeader2(msgRT.getE01ACMCUN());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setHeader1(msgRT.getE01ACMPRO());
				userPO.setProdCode(msgRT.getE01ACMPRO());
				userPO.setCusType(msgRT.getH01FLGWK3());
				userPO.setType(msgRT.getE01ACMATY());

				if ("04".equals(msgRT.getE01ACMACD())) {
					userPO.setOption("SV");
					session.setAttribute("svBasic", msgRT);
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					userPO.setOption("RT");
					session.setAttribute("rtBasic", msgRT);
					pageName = "EDD0000_rt_basic.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procActionEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD009001Message msgRT = (EDD009001Message) mp.getMessageRecord("EDD009001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			msgRT.setH01FLGWK1("SV".equals(userPO.getOption()) ? "S" : "R");
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}
		
			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD009001Message) mp.receiveMessageRecord("EDD009001");

			if (mp.hasError(msgError)) {
				pageName = "GENERIC_account_enter.jsp";
			} else {
				if ("04".equals(msgRT.getE01ACMACD())) {
					userPO.setOption("SV");
				} else {
					userPO.setOption("RT");
				}
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setIdentifier(msgRT.getE01ACMACC());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setHeader2(msgRT.getE01ACMCUN());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setOfficer(msgRT.getE01ACMOFC() + " - " + msgRT.getE01DSCOFC());
				userPO.setHeader1(msgRT.getE01ACMPRO());
				userPO.setProdCode(msgRT.getE01ACMPRO());
				userPO.setCusType(msgRT.getH01FLGWK3());
				userPO.setHeader10(msgRT.getE01ACMATY());
		   	 	userPO.setHeader11(msgRT.getE01ACMACL());
				userPO.setType(msgRT.getE01ACMATY());
				
				pageName = "EDD0000_rt_inq_balances.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtBalances", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procActionRTBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) session.getAttribute("rtBasic");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0005");
		 	if ("Y".equals(req.getParameter("APPROVAL"))) msgRT.setH01OPECOD("0006");
		 	
		 	setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			session.setAttribute("error", msgError);
			
			if (newmessage.getFormatName().equals("EFT000015")) {
				EFT000015Message msgFinish = (EFT000015Message) newmessage;
				userPO.setAccNum(msgFinish.getE15ACCNUM());
				
				session.setAttribute("rtFinish", msgFinish);
				session.setAttribute("userPO", userPO);
				
				forward("EDD0000_rt_confirm.jsp", req, res);
				
			} else if (newmessage.getFormatName().equals("EDD000001")) {
				msgRT = (EDD000001Message) newmessage;
				if ("NEW".equals(userPO.getPurpose())) {
					userPO.setApplicationCode(msgRT.getE01ACMACD());
					userPO.setBank(msgRT.getE01ACMBNK());
					userPO.setAccNum(msgRT.getE01ACMACC());
					userPO.setIdentifier(msgRT.getE01ACMACC());
					userPO.setCusNum(msgRT.getE01ACMCUN());
					userPO.setHeader2(msgRT.getE01ACMCUN());
					userPO.setHeader3(msgRT.getE01CUSNA1());
					userPO.setCusName(msgRT.getE01CUSNA1());
					userPO.setCurrency(msgRT.getE01ACMCCY());
					userPO.setHeader1(msgRT.getE01ACMPRO());
					userPO.setProdCode(msgRT.getE01ACMPRO());
					userPO.setType(msgRT.getE01ACMATY());
				}
				session.setAttribute("rtBasic", msgRT);
				session.setAttribute("userPO", userPO);
				
				if (mp.hasError(msgError)) {
					if ("NEW".equals(userPO.getPurpose())) {
						pageName = "EDD0000_rt_new.jsp";
					} else {
						pageName = "EDD0000_rt_basic.jsp";
					}
					forward(pageName, req, res);
				} else {
					if ("MAINTENANCE".equals(userPO.getPurpose())) {
						procReqRTEnterMaint(user, req, res, session);
					} else if ("NEW".equals(userPO.getPurpose())) {
						res.sendRedirect(srctx + bgPage);
					} else {
						forward("EDD0000_rt_enter_maint.jsp", req, res);
					}
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procActionSVBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) session.getAttribute("svBasic");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0005");
		 	if ("Y".equals(req.getParameter("APPROVAL"))) msgRT.setH01OPECOD("0006");
		 	
		 	setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			session.setAttribute("error", msgError);
			
			if (newmessage.getFormatName().equals("EFT000015")) {
				EFT000015Message msgFinish = (EFT000015Message) newmessage;
				userPO.setAccNum(msgFinish.getE15ACCNUM());
				
				session.setAttribute("rtFinish", msgFinish);
				session.setAttribute("userPO", userPO);
				
				forward("EDD0000_rt_confirm.jsp", req, res);
			} else if (newmessage.getFormatName().equals("EDD000001")) {
				msgRT = (EDD000001Message) newmessage;
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				
				session.setAttribute("svBasic", msgRT);
				session.setAttribute("userPO", userPO);
				
				if (mp.hasError(msgError)) {
					if ("NEW".equals(userPO.getPurpose())) {
						forward("EDD0000_sv_new.jsp", req, res);
					} else {
						forward("EDD0000_sv_basic.jsp", req, res);
					}
				} else {
					if ("MAINTENANCE".equals(userPO.getPurpose())) {
						procReqSVEnterMaint(user, req, res, session);
					} else if ("NEW".equals(userPO.getPurpose())) {
						res.sendRedirect(srctx + bgPage);
					}
				}
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	protected void procActionCPBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) session.getAttribute("cpBasic");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0005");
		 	if ("Y".equals(req.getParameter("APPROVAL"))) msgRT.setH01OPECOD("0006");
		 	
		 	setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			session.setAttribute("error", msgError);
			
			if (newmessage.getFormatName().equals("EFT000015")) {
				EFT000015Message msgFinish = (EFT000015Message) newmessage;
				userPO.setAccNum(msgFinish.getE15ACCNUM());
				
				session.setAttribute("rtFinish", msgFinish);
				session.setAttribute("userPO", userPO);
				
				forward("EDD0000_rt_confirm.jsp", req, res);
			} else if (newmessage.getFormatName().equals("EDD000001")) {
				msgRT = (EDD000001Message) newmessage;
				userPO.setAccNum(msgRT.getE01ACMACC());
				
				session.setAttribute("cpBasic", msgRT);
				session.setAttribute("userPO", userPO);
				
				if (mp.hasError(msgError)) {
					if ("NEW".equals(userPO.getPurpose())) {
						forward("EDD0000_cp_new.jsp", req, res);
					} else {
						forward("EDD0000_cp_basic.jsp", req, res);
					}
				} else {
					if ("MAINTENANCE".equals(userPO.getPurpose())) {
						procReqCPEnterMaint(user, req, res, session);
					} else if ("NEW".equals(userPO.getPurpose())) {
						res.sendRedirect(srctx + bgPage);
					}
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

}
