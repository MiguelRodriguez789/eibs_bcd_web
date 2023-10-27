package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD000002Message;
import datapro.eibs.beans.EDD000005Message;
import datapro.eibs.beans.EDD000010Message;
import datapro.eibs.beans.EDD009001Message;
import datapro.eibs.beans.EDD009002Message;
import datapro.eibs.beans.EDD009099Message;
import datapro.eibs.beans.EDD009201Message;
import datapro.eibs.beans.ELD000001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000004Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD000006Message;
import datapro.eibs.beans.ESD070001Message;
import datapro.eibs.beans.ESD071103Message;
import datapro.eibs.beans.ESD0712DSMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEDD0000I extends JSEDD0000 {

	protected static final int R_COLL_LIABILITIES		= 43;
	protected static final int R_COLL_ASSETS			= 44;
	protected static final int R_INQ_SRV_CHARGES		= 46;
	protected static final int R_INQ_ACCOUNT_ANALYSIS	= 101;
	protected static final int R_INQ_CHG_STATUS = 317;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_INQ_BALANCES :
				procReqInqBalances(user, req, res, session);
				break;
			case R_INQ_BASIC :
				procReqInqBasic(user, req, res, session);
				break;
		 	case R_INQ_BENE  :
		 	    procReqInqBene(user, req, res, session);
				break;	
			case R_INQ_MONEY :
				procReqInqMoney(user, req, res, session);
				break;
			case R_INQ_CODES :
				procReqInqSpecialCodes(user, req, res, session);
				break;
			case R_INQ_SIGNERS :
				procReqInqFirm(user, req, res, session);
				break;
			case R_INQ_SP_INST :
				procReqInqSpcInst(user, req, res, session);
				break;
			case R_INQ_TIT :
				procReqInqTit(user, req, res, session);
				break;
			case R_RT_OVERNIGHT :
				procReqInqOvernight(user, req, res, session);
				break;	
			case R_PRODUCT :
				procReqProductInfo(user, req, res, session);
				break;
			case A_ACCOUNT_TITLE :
				procReqDisplayTitle(user, req, res, session);
				break;																							
			case R_DAILY_BAL :
				procReqDayBal(user, req, res, session);
				break;
			case R_COLL_LIABILITIES :
				procReqCollLiabilities(user, req, res, session);
				break;
			case R_COLL_ASSETS :
				procReqCollAssets(user, req, res, session);
				break;
			case R_INQ_SRV_CHARGES :
				procReqInqSrvCharges(user, req, res, session);
				break;
			case R_INQ_ACCOUNT_ANALYSIS :
				procReqInqAccountAnalysis(user, req, res, session);
				break;
			case R_INQ_CHG_STATUS : 
				procReqInqStatus(user, req, res, session);
		
			default :
				super.processRequest(user, req, res, session, screen);
				break;
		}
	}


	protected void procReqInqAccountAnalysis(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
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
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				pageName = "EDD0000_rt_inq_account_analysis.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("accAnalysis", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	private void procReqInqSrvCharges(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			ESD0712DSMessage msgDDAServCharge = (ESD0712DSMessage) mp.getMessageRecord("ESD0712DS");
		 	msgDDAServCharge.setH01USERID(user.getH01USR());
		 	msgDDAServCharge.setH01PROGRM("EDD0090");
		 	msgDDAServCharge.setH01TIMSYS(getTimeStamp());
		 	msgDDAServCharge.setH01SCRCOD("01");
		 	msgDDAServCharge.setH01OPECOD("0004");
		 	msgDDAServCharge.setE01SELBNK(userPO.getBank());
		 	msgDDAServCharge.setE01SELTBL(userPO.getHeader11());
		 	msgDDAServCharge.setE01SELTYP(userPO.getHeader10());

			mp.sendMessage(msgDDAServCharge);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgDDAServCharge = (ESD0712DSMessage) msg;
				pageName = "EDD0000_rt_inq_serv_charges.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("ddaServCharge", msgDDAServCharge);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqCollAssets(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0000?SCREEN=1");
	}


	private void procReqCollLiabilities(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0000?SCREEN=3");	
	}


	private void procReqDayBal(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			EDD009201Message msgSearch = (EDD009201Message) mp.getMessageRecord("EDD009201");
			msgSearch.setH01USERID(user.getH01USR());
		 	msgSearch.setH01PROGRM("EDD0090");
		 	msgSearch.setH01TIMSYS(getTimeStamp());
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setH01OPECOD("0004");
		 	msgSearch.setE01ACMACC(userPO.getAccNum());

			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					EDD009201Message msgList = (EDD009201Message) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCustomDate(user.getE01DTF(),
																		msgList.getBigDecimalE01BALDTM().intValue(),
																		msgList.getBigDecimalE01BALDTD().intValue(),
																		msgList.getBigDecimalE01BALDTY().intValue())	
								+ "</TD>");
					myRow.append("<TD NOWRAP width=\"20%\" ALIGN=\"CENTER\">" + Util.fcolorCCY(msgList.getE01GRSBAL()) + "</TD>");
					myRow.append("<TD NOWRAP width=\"20%\" ALIGN=\"CENTER\">" + Util.fcolorCCY(msgList.getE01UNCOLL()) + "</TD>");
					myRow.append("<TD NOWRAP width=\"20%\" ALIGN=\"CENTER\">" + Util.formatCell(msgList.getE01HOLDIN()) + "</TD>");				
					myRow.append("<TD NOWRAP width=\"20%\" ALIGN=\"CENTER\">" + Util.fcolorCCY(msgList.getE01DISPON()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
			beanList.setShowNext(list.getShowNext());
			beanList.setShowPrev(list.getShowPrev());
			
			session.setAttribute("cifList", beanList);
			
			pageName = "EDD0092_rt_inq_day_bal.jsp";
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqDisplayTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			EDD009099Message msgRT = (EDD009099Message) mp.getMessageRecord("EDD009099");
			msgRT.setH99USERID(user.getH01USR());
			msgRT.setH99PROGRM("EDD0090");
			msgRT.setH99TIMSYS("");//getTimeStamp()
			msgRT.setH99SCRCOD("01");
			msgRT.setH99OPECOD("0004");
			msgRT.setE99ACCNUM(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD009099Message) mp.receiveMessageRecord("EDD009099");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_inq_basic.jsp";
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_inq_display_title.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_inq_display_title.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdTitle", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0004";
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			ESD000004Message msgMailA = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgMailA.setH04USR(user.getH01USR());
			msgMailA.setH04PGM("EDD0090");
			msgMailA.setH04TIM(getTimeStamp());
			msgMailA.setH04SCR("01");
			msgMailA.setH04OPE(opCode);
			msgMailA.setE04CUN(userPO.getAccNum());
			msgMailA.setE04RTP("1");
			msgMailA.setH04WK1("T");
			msgMailA.setH04WK3("1");

			mp.sendMessage(msgMailA);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDD0000_rt_inq_basic.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgMailA = (ESD000004Message) msg;
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_inq_account_title.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_inq_account_title.jsp";
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

	private void procReqProductInfo(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			ESD070001Message msgProdDDA = (ESD070001Message) mp.getMessageRecord("ESD070001");
		 	msgProdDDA.setH01USERID(user.getH01USR());
		 	msgProdDDA.setH01PROGRM("ESD0700");
		 	msgProdDDA.setH01TIMSYS(getTimeStamp());
		 	msgProdDDA.setH01SCRCOD("01");
		 	msgProdDDA.setH01OPECOD("0002");
		 	msgProdDDA.setE01APCCDE(userPO.getHeader1());
		 	msgProdDDA.setE01APCBNK(userPO.getBank());

			mp.sendMessage(msgProdDDA);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				msgProdDDA = (ESD070001Message) msg;
				if(userPO.getOption().equals("SV"))
					pageName = "ESD0700_products_savingacct.jsp";
				else
					pageName = "ESD0700_products_dda.jsp";
			}

			session.setAttribute("userPO", userPO);
			session.setAttribute("prd", msgProdDDA);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqInqOvernight(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			EDD009002Message msgRT = (EDD009002Message) mp.getMessageRecord("EDD009002");
		 	msgRT.setH02USERID(user.getH01USR());
		 	msgRT.setH02PROGRM("EDD0090");
		 	msgRT.setH02TIMSYS("");//getTimeStamp()
		 	msgRT.setH02SCRCOD("01");
		 	msgRT.setH02OPECOD("0004");
		 	msgRT.setE02ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD009002Message) mp.receiveMessageRecord("EDD009002");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_inq_balance.jsp";
			} else {
				pageName = "EDD0000_rt_inq_overnight.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtOvernight", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqInqTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			ESD000006Message msgRT = (ESD000006Message) mp.getMessageRecord("ESD000006");
		 	msgRT.setH06USR(user.getH01USR());
		 	msgRT.setH06PGM("EDD0090");
		 	msgRT.setH06TIM(getTimeStamp());
		 	msgRT.setH06SCR("01");
		 	msgRT.setH06OPE("0004");
		 	msgRT.setE06ACC(userPO.getAccNum());
		 	msgRT.setE06RTP("H");

			mp.sendMessage(msgRT);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				JBObjList list = getTitularsDescription(user, req, res, session);
				if (mp.hasError(list)) {
					msgError = (ELEERRMessage) mp.getError(list);
					pageName = "EDD0000_rt_inq_balances.jsp";
				} else {
					msgError = new ELEERRMessage();
					msgRT = (ESD000006Message) msg;
					session.setAttribute("cnofcList", list);
					pageName = "EDD0000_rt_inq_tit.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtTit", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqInqSpcInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			ESD000005Message msgRT = (ESD000005Message) mp.getMessageRecord("ESD000005");
		 	msgRT.setH05USR(user.getH01USR());
		 	msgRT.setH05PGM("EDD0090");
		 	msgRT.setH05TIM(""); //getTimeStamp()
		 	msgRT.setH05SCR("01");
		 	msgRT.setH05OPE("0004");
		 	msgRT.setE05ACC(userPO.getAccNum());
		 	msgRT.setE05ACD(userPO.getApplicationCode());

			mp.sendMessage(msgRT);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgRT = (ESD000005Message) msg;
				pageName = "EDD0000_rt_inq_special_inst.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtInst", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqInqFirm(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String country = req.getParameter("COUNTRY") == null ? "" : req.getParameter("COUNTRY").trim().toLowerCase();
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0090");
			msgBene.setH04TIM(getTimeStamp());
			try {
				msgBene.setH04SCR(req.getParameter("H04SCR").trim());
			} catch (Exception e) {
				msgBene.setH04SCR("07");
			}
			msgBene.setH04OPE("0002");
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP("S");

			mp.sendMessage(msgBene);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgBene = (ESD000004Message) msg;
				if ("".equals(country)) {
					pageName = "EDD0000_rt_inq_firm_generic.jsp";
				} else {
					pageName = "EDD0000_rt_inq_firm_" + country + ".jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtFirm", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqInqSpecialCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		
		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			ESD000002Message msgRT = (ESD000002Message) mp.getMessageRecord("ESD000002");
		 	msgRT.setH02USR(user.getH01USR());
		 	msgRT.setH02PGM("EDD0090");
		 	msgRT.setH02TIM(""); //getTimeStamp()
		 	msgRT.setH02SCR("01");
		 	msgRT.setH02OPE("0004");
		 	msgRT.setE02ACC(userPO.getAccNum());
			
			mp.sendMessage(msgRT);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgRT = (ESD000002Message) msg;
				pageName = "EDD0000_rt_inq_codes.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtCodes", msgRT);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqInqMoney(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			ELD000001Message msgRT = (ELD000001Message) mp.getMessageRecord("ELD000001");
		 	msgRT.setH06USERID(user.getH01USR());
		 	msgRT.setH06PROGRM("EDD0090");
		 	msgRT.setH06TIMSYS("");//getTimeStamp()
		 	msgRT.setH06SCRCOD("01");
		 	msgRT.setH06OPECOD("0004");
		 	msgRT.setE06LDMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ELD000001Message) mp.receiveMessageRecord("ELD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				pageName = "EDD0000_rt_inq_money.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtMoney", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqInqRTLegalRep(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0002";
		String type = req.getParameter("Type") == null ? "I" : req.getParameter("Type").trim();
		userPO.setHeader10(type);
		String pageName = "";
		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgBene.setH04USR(user.getH01USR());
		 	msgBene.setH04PGM("EDD0090");
		 	msgBene.setH04TIM(""); //getTimeStamp()
		 	msgBene.setH04SCR("01");
		 	msgBene.setH04OPE(opCode);
		 	msgBene.setE04CUN(userPO.getAccNum());
		 	msgBene.setE04RTP(type);

			mp.sendMessage(msgBene);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgBene = (ESD000004Message) msg;
				pageName = "EDD0000_rt_inq_legal_rep.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("legalRep", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqInqBene(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		
		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgBene.setH04USR(user.getH01USR());
		 	msgBene.setH04PGM("EDD0000");
		 	msgBene.setH04TIM(""); //getTimeStamp()
		 	msgBene.setH04SCR("01");
		 	msgBene.setH04OPE("0006");
		 	msgBene.setE04CUN(userPO.getAccNum());
		 	msgBene.setE04RTP("J");
			
			mp.sendMessage(msgBene);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgBene = (ESD000004Message) msg;
				pageName = "EDD0000_rt_inq_bene.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("bene", msgBene);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqInqBasic(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			EDD009002Message msgRT = (EDD009002Message) mp.getMessageRecord("EDD009002");
		 	msgRT.setH02USERID(user.getH01USR());
		 	msgRT.setH02PROGRM("EDD0090");
		 	msgRT.setH02TIMSYS("");//getTimeStamp()
		 	msgRT.setH02SCRCOD("01");
		 	msgRT.setH02OPECOD("0004");
		 	msgRT.setE02ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD009002Message) mp.receiveMessageRecord("EDD009002");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_enter_inquiry.jsp";
			} else {
				pageName = "EDD0000_rt_inq_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqInqBalances(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			EDD009001Message msgRT = (EDD009001Message) mp.getMessageRecord("EDD009001");
		 	msgRT.setH01USERID(user.getH01USR());
		 	msgRT.setH01PROGRM("EDD0090");
		 	msgRT.setH01TIMSYS("");//getTimeStamp()
		 	msgRT.setH01SCRCOD("01");
		 	msgRT.setH01OPECOD("0004");
		 	msgRT.setE01ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD009001Message) mp.receiveMessageRecord("EDD009001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_enter_inquiry.jsp";
			} else {
				pageName = "EDD0000_rt_inq_balances.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtBalances", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null) mp.close();
		}
	}
	
	protected void procReqInqStatus(ESS0030DSMessage user, HttpServletRequest req,
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
			msgRT.setH02FLGWK1("A");
			try {
				msgRT.setE02ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE02ACMACC(userPO.getAccNum());
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000002Message) mp.receiveMessageRecord("EDD000002");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else if ("CP".equals(userPO.getOption())) {
					pageName = "EDD0000_cp_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_ap_chg_acc_status.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtStatus", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	
}
