package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD000001Message;
import datapro.eibs.beans.EDD000002Message;
import datapro.eibs.beans.EDD000003Message;
import datapro.eibs.beans.EDD000004Message;
import datapro.eibs.beans.EDD000005Message;
import datapro.eibs.beans.EDD000010Message;
import datapro.eibs.beans.ELD000001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000004Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD000006Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;

public class JSEDD0000A extends JSEDD0000 {

	protected void procReqRTMaintenance(ESS0030DSMessage user,
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
			msgRT.setH01OPECOD("0002");
			msgRT.setE01ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");
			
			userPO.setApplicationCode(msgRT.getE01ACMACD());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_enter_maint.jsp";
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else {
					pageName = "EDD1000_sv_ap_basic.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqRTOverdraft(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000003Message msgRT = (EDD000003Message) mp.getMessageRecord("EDD000003");

			msgRT.setH03USERID(user.getH01USR());
			msgRT.setH03PROGRM("EDD0000");
			msgRT.setH03TIMSYS(getTimeStamp());
			msgRT.setH03SCRCOD("01");
			msgRT.setH03OPECOD("0002");
			msgRT.setE03ACMACC(userPO.getAccNum());
			
			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000003Message) mp.receiveMessageRecord("EDD000003");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD1000_rt_ap_overdraft.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtOverdraft", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqRTOvernight(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000005Message msgRT = (EDD000005Message) mp.getMessageRecord("EDD000005");
			msgRT.setH05USERID(user.getH01USR());
			msgRT.setH05PROGRM("EDD0000");
			msgRT.setH05TIMSYS(getTimeStamp());
			msgRT.setH05SCRCOD("01");
			msgRT.setH05OPECOD("0002");
			msgRT.setE05ACMACC(userPO.getAccNum());
			msgRT.setE05ACMACD(userPO.getApplicationCode());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000005Message) mp.receiveMessageRecord("EDD000005");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_basic.jsp";
			} else {
				pageName = "EDD1000_rt_ap_overnight.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtOvernight", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqRTCredit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000004Message msgRT = (EDD000004Message) mp.getMessageRecord("EDD000004");
			msgRT.setH04USERID(user.getH01USR());
			msgRT.setH04PROGRM("EDD0000");
			msgRT.setH04TIMSYS(getTimeStamp());
			msgRT.setH04SCRCOD("01");
			msgRT.setH04OPECOD("0002");
			msgRT.setE04ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000004Message) mp.receiveMessageRecord("EDD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD1000_rt_ap_credit.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtCredit", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqRTMoney(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ELD000001Message msgRT = (ELD000001Message) mp.getMessageRecord("ELD000001");
			msgRT.setH06USERID(user.getH01USR());
			msgRT.setH06PROGRM("EDD0000");
			msgRT.setH06TIMSYS(getTimeStamp());
			msgRT.setH06SCRCOD("05");
			msgRT.setH06OPECOD("0002");
			msgRT.setE06LDMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ELD000001Message) mp.receiveMessageRecord("ELD000001");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD1000_rt_ap_money.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtMoney", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqStatus(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000002Message msgRT = (EDD000002Message) mp.getMessageRecord("EDD000002");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EDD0000");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02SCRCOD("01");
			msgRT.setH02OPECOD("0002");
			msgRT.setE02ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000002Message) mp.receiveMessageRecord("EDD000002");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD1000_rt_ap_chg_status.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtStatus", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqSpecialCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "MAINTENANCE".equals(userPO.getPurpose()) ? "0002" : "0004";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000002Message msgRT = (ESD000002Message) mp.getMessageRecord("ESD000002");
			msgRT.setH02USR(user.getH01USR());
			msgRT.setH02PGM("EDD0000");
			msgRT.setH02TIM(getTimeStamp());
			msgRT.setH02SCR("01");
			msgRT.setH02OPE(opCode);
			msgRT.setE02ACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD000002Message) mp.receiveMessageRecord("ESD000002");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD1000_rt_ap_codes.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtCodes", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqAccountAnalysis(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000010Message msgRT = (EDD000010Message) mp.getMessageRecord("EDD000010");
			msgRT.setH10USERID(user.getH01USR());
			msgRT.setH10PROGRM("EDD0000");
			msgRT.setH10TIMSYS(getTimeStamp());
			msgRT.setH10SCRCOD("01");
			msgRT.setH10OPECOD("0002");
			msgRT.setE10ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000010Message) mp.receiveMessageRecord("EDD000010");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD1000_rt_ap_account_analysis.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("accAnalysis", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0002";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgMailA = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgMailA.setH04USR(user.getH01USR());
			msgMailA.setH04PGM("ESD0080");
			msgMailA.setH04TIM(getTimeStamp());
			msgMailA.setH04SCR("01");
			msgMailA.setH04OPE(opCode);
			msgMailA.setE04CUN(userPO.getAccNum());
			msgMailA.setE04RTP("1");
			msgMailA.setH04WK1("T");
			msgMailA.setH04WK3("1");

			mp.sendMessage(msgMailA);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailA = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_account_title.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_account_title.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("mailA", msgMailA);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000006Message msgRT = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgRT.setH06USR(user.getH01USR());
			msgRT.setH06PGM("EDD0000");
			msgRT.setH06TIM(getTimeStamp());
			msgRT.setH06SCR("01");
			msgRT.setH06OPE("0002");
			msgRT.setE06ACC(userPO.getAccNum());
			msgRT.setE06RTP("H");

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD000006Message) mp.receiveMessageRecord("ESD000006");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				JBObjList list = getTitularsDescription(user, req, res, session);
				if (mp.hasError(list)) {
					msgError = (ELEERRMessage) mp.getError(list);
					if ("RT".equals(userPO.getOption())) {
						pageName = "EDD1000_rt_ap_basic.jsp";
					} else if ("SV".equals(userPO.getOption())) {
						pageName = "EDD1000_sv_ap_basic.jsp";
					} else {
						pageName = "error_viewer.jsp";
					}
				} else {
					session.setAttribute("cnofcList", list);
					pageName = "EDD1000_rt_ap_tit.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtTit", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqFirm(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		//String country = req.getParameter("COUNTRY") == null ? "" : req.getParameter("COUNTRY").toLowerCase().trim();
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(getTimeStamp());
			try{
				msgBene.setH04SCR(req.getParameter("H04SCR").trim());
			}catch (Exception e){
				msgBene.setH04SCR("07");
			}
			msgBene.setH04OPE("0002");
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP("S");

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD1000_rt_ap_firm.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtFirm", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqSpcInst(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "MAINTENANCE".equals(userPO.getPurpose()) ? "0002" : "0004";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000005Message msgRT = (ESD000005Message) mp.getMessageRecord("ESD000005");
			msgRT.setH05USR(user.getH01USR());
			msgRT.setH05PGM("EDD0000");
			msgRT.setH05TIM(getTimeStamp());
			msgRT.setH05SCR("01");
			msgRT.setH05WK1("M");
			msgRT.setH05OPE(opCode);
			msgRT.setE05ACC(userPO.getAccNum());
			msgRT.setE05ACD(userPO.getApplicationCode());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD000005Message) mp.receiveMessageRecord("ESD000005");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD1000_rt_ap_special_inst.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtInst", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqRTBene(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0002";
		userPO.setAccOpt("BENE");
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE(opCode);
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP("J");

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD1000_rt_ap_bene.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("bene", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqRTLegalRep(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0002";
		userPO.setHeader10("I");
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE(opCode);
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP(userPO.getHeader10());

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD1000_rt_ap_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD1000_sv_ap_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD1000_rt_ap_legal_rep.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("legalRep", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqSVMaintenance(ESS0030DSMessage user,
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
			msgRT.setH01SCRCOD("04");
			msgRT.setH01OPECOD("0002");
			msgRT.setE01ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_sv_enter_maint.jsp";
			} else {
				pageName = "EDD1000_sv_ap_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("svBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqRTEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_rt_enter_maint.jsp", req, res);
	}

	protected void procReqSVEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("SV");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_sv_enter_maint.jsp", req, res);
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
			msgRT.setH01OPECOD("0002");
			msgRT.setH01FLGWK1("A");
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_enter_maint.jsp";
			} else {
				userPO.setOption("RT");
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setProdCode(msgRT.getE01ACMPRO());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setType(msgRT.getE01ACMATY());
					
				session.setAttribute("rtBasic", msgRT);
				pageName = "EDD1000_rt_ap_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procActionEnterSVMaint(ESS0030DSMessage user,
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
			msgRT.setH01SCRCOD("04");
			msgRT.setH01OPECOD("0002");
			msgRT.setH01FLGWK1("A");
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_sv_enter_maint.jsp";
			} else {
				userPO.setOption("SV");
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setProdCode(msgRT.getE01ACMPRO());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setCusType(msgRT.getH01FLGWK3());
				userPO.setType(msgRT.getE01ACMATY());
				
				pageName = "EDD1000_sv_ap_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("svBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procActionEnterCPMaint(ESS0030DSMessage user,
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
			msgRT.setH01SCRCOD("06");
			msgRT.setH01OPECOD("0002");
			msgRT.setH01FLGWK1("A");
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_cp_enter_maint.jsp";
			} else {
				userPO.setOption("CP");
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setProdCode(msgRT.getE01ACMPRO());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setType(msgRT.getE01ACMATY());
				
				pageName = "EDD1000_cp_ap_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cpBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCPEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CP");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_cp_enter_maint.jsp", req, res);
	}

	protected void procReqCPMaintenance(ESS0030DSMessage user,
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
			msgRT.setH01SCRCOD("06");
			msgRT.setH01OPECOD("0002");
			msgRT.setE01ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_cp_enter_maint.jsp";
			} else {
				pageName = "EDD1000_cp_ap_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cpBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


}
