package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (1/8/06 8:05:47 AM)
 * @author: Gustavo Adolfo Villarroel
 * fixed: Eloy Roodriguez
 */
import java.beans.Beans;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSECC0090 extends JSEIBSServlet {
	// Entering
	static final int R_CARD_ASSIGN_ENTER = 100;
	static final int R_CARD_ASSIGN_LIST = 200;

	// Holder Card
	static final int R_CARD_ASSIGN_NEW = 1;
	static final int A_CARD_ASSIGN_NEW = 2;
	static final int A_CARD_ASSIGN_MAINT = 3;
	static final int R_CARD_ASSIGN_INQ_MAINT = 4;

	// Additional Card
	static final int R_CARD_ASSIGN_ADDITIONAL_NEW = 5;
	static final int A_CARD_ASSIGN_ADDITIONAL_NEW = 6;
	static final int A_CARD_ASSIGN_ADDITIONAL_MAINT = 7;
	static final int R_CARD_ASSIGN_ADDITIONAL_INQ_MAINT = 8;
	
	// Status Change
	static final int R_CARD_STATUS_ENTER = 300;
	static final int R_CARD_STATUS_ENTER_INQ = 400;
	static final int A_CARD_STATUS = 500;

	// Card Replace
	static final int R_CARD_ASSIGN_REPLACE = 9;
	static final int A_CARD_ASSIGN_REPLACE = 10;

	// Card Print
	static final int R_CARD_ASSIGN_PRINT = 600;

	// Assignment Inquiry
	static final int R_ASSIGNMENT_INQ_ENTER = 1000;
	static final int A_ASSIGNMENT_INQ_ID = 1100;
	static final int A_ASSIGNMENT_INQ_CARD = 1200;
	static final int A_ASSIGNMENT_INQ_CARD_ADDITIONAL = 1300;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
			case R_CARD_ASSIGN_ENTER :
				procReqCardAssignEnter(user, req, res, session);
				break;
			case R_CARD_ASSIGN_LIST :
				procReqCardAssignList(user, req, res, session);
				break;

			case R_CARD_ASSIGN_NEW :
				procReqCardAssignNew(user, req, res, session);
				break;
			case A_CARD_ASSIGN_NEW :
				procActionCardAssignNew(user, req, res, session);
				break;
			case A_CARD_ASSIGN_MAINT :
				procActionCardAssignMaint(user, req, res, session);
				break;
			case R_CARD_ASSIGN_INQ_MAINT :
				procReqCardAssignInquiryMaint(user, req, res, session);
				break;

			case R_CARD_ASSIGN_ADDITIONAL_NEW :
				procReqCardAssignAdditionalNew(user, req, res, session);
				break;
			case A_CARD_ASSIGN_ADDITIONAL_NEW :
				procActionCardAssignAdditionalNew(user, req, res, session);
				break;
			case A_CARD_ASSIGN_ADDITIONAL_MAINT :
				procActionCardAssignAdditionalMaint(user, req, res, session);
				break;
			case R_CARD_ASSIGN_ADDITIONAL_INQ_MAINT :
				procReqCardAssignAdditionalInquiryMaint(user, req, res, session);
				break;
				
			case R_CARD_STATUS_ENTER :
				procReqCardStatusEnter(user, req, res, session);
				break;
			case R_CARD_STATUS_ENTER_INQ :
				procReqCardStatusEnterInq(user, req, res, session);
				break;
			case A_CARD_STATUS :
				procActionCardStatus(user, req, res, session);
				break;

			case R_CARD_ASSIGN_REPLACE :
				procReqCardAssignReplace(user, req, res, session);
				break;
			case A_CARD_ASSIGN_REPLACE :
				procActionCardAssignReplace(user, req, res, session);
				break;

			case R_CARD_ASSIGN_PRINT :
				procReqCardAssignPrint(user, req, res, session);
				break;

			case R_ASSIGNMENT_INQ_ENTER :
				procReqAssignmentInquiryEnter(user, req, res, session);
				break;
			case A_ASSIGNMENT_INQ_ID :
				procActionAssignmentInquiryID(user, req, res, session);
				break;
			case A_ASSIGNMENT_INQ_CARD :
				procActionAssignmentInquiryCard(user, req, res, session);
				break;
			case A_ASSIGNMENT_INQ_CARD_ADDITIONAL :
				procActionAssignmentInquiryCardAdditional(user, req, res, session);
				break;

			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionAssignmentInquiryCardAdditional(
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			ECC009003Message msgCD = (ECC009003Message) mp.getMessageRecord("ECC009003");
			msgCD.setH03USERID(user.getH01USR());
			msgCD.setH03PROGRM("ECC0090");
			msgCD.setH03TIMSYS(getTimeStamp());
			msgCD.setH03SCRCOD("01");
			msgCD.setH03OPECOD("0002");
			try {
				msgCD.setE03CCRNUMA(req.getParameter("E03CCRNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ECC009003Message) mp.receiveMessageRecord("ECC009003");

			session.setAttribute("msgCD", msgCD);
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "ECC0090_assignment_inq_enter.jsp";
			} else {
				ECC009004Message msgAcc = (ECC009004Message) mp.getMessageRecord("ECC009004");
				msgAcc.setH04USERID(user.getH01USR());
				msgAcc.setH04PROGRM("ECC0090");
				msgAcc.setH04TIMSYS(getTimeStamp());
				msgAcc.setH04SCRCOD("01");
				msgAcc.setH04OPECOD("0016");
				try {
					msgAcc.setE04CCRCID(req.getParameter("E03CCRCID").trim());
				} catch (Exception e) {
					msgAcc.setE04CCRCID(msgCD.getE03CCRCID());
				}
				try {
					msgAcc.setE04PRICUN(req.getParameter("E03PRICUN").trim());
				} catch (Exception e) {
					msgAcc.setE04PRICUN(msgCD.getE03PRICUN());
				}
				try	{
					msgAcc.setE04CCRNUM(req.getParameter("E03CCRNUM").trim());
				} catch (Exception e) {
					msgAcc.setE04CCRNUM(msgCD.getE03CCRNUM());
				}
				try {
					msgAcc.setE04CCRCIDA(req.getParameter("E03CCRCIDA").trim());
				} catch (Exception e) {
					msgAcc.setE04CCRCIDA(msgCD.getE03CCRCIDA());
				}
				try {
					msgAcc.setE04PRICUNA(req.getParameter("E03PRICUNA").trim());
				} catch (Exception e) {
					msgAcc.setE04PRICUNA(msgCD.getE03PRICUNA());
				}
				try	{
					msgAcc.setE04CCRNUMA(req.getParameter("E03CCRNUMA").trim());
				} catch (Exception e) {
					msgAcc.setE04CCRNUMA(msgCD.getE03CCRNUMA());
				}
				
				mp.sendMessage(msgAcc);
				JBObjList list = mp.receiveMessageRecordList("H04FLGMAS");
				
				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					pageName = "ECC0090_assignment_inq_enter.jsp";
				} else {
					if (!list.isEmpty()) {
						msgAcc = (ECC009004Message) list.get(0);
						
						userPO.setIdentifier(msgAcc.getE04CCRCIDA());
						userPO.setAccNum(msgAcc.getE04CCRCRA());
						userPO.setCusNum(msgAcc.getE04PRICUNA());
						userPO.setHeader1(msgAcc.getE04CCRNUMA());
						userPO.setHeader2(msgAcc.getE04TARTYP());
						userPO.setHeader3(msgAcc.getE04CCRBRN());
						userPO.setHeader4(msgAcc.getE04CCRSTS());
						userPO.setHeader5(msgAcc.getE04CCRDSC());
						userPO.setHeader6(msgAcc.getE04CCRSTD());
						userPO.setHeader7(msgAcc.getE04CCRSTM());
						userPO.setHeader8(msgAcc.getE04CCRSTY());
						userPO.setHeader20("");
						userPO.setHeader21("");
					}
					session.setAttribute("accList", list);
					pageName = "ECC0090_assignment_inq_card_add.jsp";
				}
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionAssignmentInquiryCard(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			ECC009001Message msgCD = (ECC009001Message) mp.getMessageRecord("ECC009001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("ECC0090");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0003");
			try {
				msgCD.setE01CCRNUM(req.getParameter("E01CCRNUM").trim());
			} catch (Exception e) {
				msgCD.setE01CCRNUM("0");
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ECC009001Message) mp.receiveMessageRecord("ECC009001");

			session.setAttribute("msgCD", msgCD);
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ECC0090_assignment_inq_enter.jsp", req, res);
			} else {
				if (msgCD.getE01CCRTPI().equals("T")) {
					
					ECC009002Message msgAcc = (ECC009002Message) mp.getMessageRecord("ECC009002");
					msgAcc.setH02USERID(user.getH01USR());
					msgAcc.setH02PROGRM("ECC0090");
					msgAcc.setH02TIMSYS(getTimeStamp());
					msgAcc.setH02SCRCOD("01");
					msgAcc.setH02OPECOD("0002");
					try {
						msgAcc.setE02CCRNUM(req.getParameter("E01CCRNUM").trim());
					} catch (Exception e) {
						msgAcc.setE02CCRNUM("0");
					}

					mp.sendMessage(msgAcc);
					JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
					
					if (mp.hasError(list)) {
						session.setAttribute("error", mp.getError(list));
						forward("ECC0090_assignment_inq_enter.jsp", req, res);
					} else {
						if (!list.isEmpty()) {
							msgAcc = (ECC009002Message) list.get(0);
							
							userPO.setIdentifier(msgAcc.getE02CCRCID());
							userPO.setAccNum(msgAcc.getE02CCRCRA());
							userPO.setCusNum(msgAcc.getE02PRICUN());
							userPO.setHeader1(msgAcc.getE02CCRNUM());
							userPO.setHeader2(msgAcc.getE02TARTYP());
							userPO.setHeader3(msgAcc.getE02CCRBRN());
							userPO.setHeader4(msgAcc.getE02CCRSTS());
							userPO.setHeader5(msgAcc.getE02CCRDSC());
							userPO.setHeader6(msgAcc.getE02CCRSTD());
							userPO.setHeader7(msgAcc.getE02CCRSTM());
							userPO.setHeader8(msgAcc.getE02CCRSTY());
							userPO.setHeader20("");
							userPO.setHeader21("");
						}
						session.setAttribute("accList", list);
						
						forward("ECC0090_assignment_inq_card.jsp", req, res);
					}
				} else { // Additional Card
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSECC0090?SCREEN=1300&E03CCRNUM=" + req.getParameter("E01CCRNUM"));
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionAssignmentInquiryID(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			ECC009001Message msgCD = (ECC009001Message) mp.getMessageRecord("ECC009001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("ECC0090");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0003");
			try {
				msgCD.setE01PRICUN(req.getParameter("E01PRICUN").trim());
			} catch (Exception e) {
				msgCD.setE01PRICUN("0");
			}
			try {
				msgCD.setE01CCRCID(req.getParameter("E01CCRCID").trim());
			} catch (Exception e) {
				msgCD.setE01CCRCID("0");
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ECC009001Message) mp.receiveMessageRecord("ECC009001");

			session.setAttribute("msgCD", msgCD);
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				ECC009002Message msgAcc = (ECC009002Message) mp.getMessageRecord("ECC009002");
				msgAcc.setH02USERID(user.getH01USR());
				msgAcc.setH02PROGRM("ECC0090");
				msgAcc.setH02TIMSYS(getTimeStamp());
				msgAcc.setH02SCRCOD("01");
				msgAcc.setH02OPECOD("0002");
				try {
					msgAcc.setE02PRICUN(req.getParameter("E01PRICUN").trim());
				} catch (Exception e) {
					msgAcc.setE02PRICUN("0");
				}

				mp.sendMessage(msgAcc);
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
				
				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					pageName = "error_viewer.jsp";
				} else {
					if (!list.isEmpty()) {
						msgAcc = (ECC009002Message) list.get(0);
						
						userPO.setIdentifier(msgAcc.getE02CCRCID());
						userPO.setAccNum(msgAcc.getE02CCRCRA());
						userPO.setCusNum(msgAcc.getE02PRICUN());
						userPO.setHeader1(msgAcc.getE02CCRNUM());
						userPO.setHeader2(msgAcc.getE02TARTYP());
						userPO.setHeader3(msgAcc.getE02CCRBRN());
						userPO.setHeader4(msgAcc.getE02CCRSTS());
						userPO.setHeader5(msgAcc.getE02CCRDSC());
						userPO.setHeader6(msgAcc.getE02CCRSTD());
						userPO.setHeader7(msgAcc.getE02CCRSTM());
						userPO.setHeader8(msgAcc.getE02CCRSTY());
						userPO.setHeader20("");
						userPO.setHeader21("");
					}
					session.setAttribute("cardList", list);
					
					pageName = "ECC0090_assignment_inq_id.jsp";
				}
			}

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqAssignmentInquiryEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", new UserPos());
		
		forward("ECC0090_assignment_inq_enter.jsp", req, res);
	}

	private void procReqCardAssignPrint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setType(req.getParameter("E01CCRTPI").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (userPO.getType().equals("T")) {
			try {
				userPO.setHeader1(req.getParameter("E01CCRNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
		} else {
			try {
				userPO.setHeader13(req.getParameter("E01CCRNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("ECC0090_card_print.jsp", req, res);
	}

	private void procActionCardAssignReplace(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			if (userPO.getType().equals("T")) {
				ECC009001Message msgCD = (ECC009001Message) mp.getMessageRecord("ECC009001");
				msgCD.setH01USERID(user.getH01USR());
				msgCD.setH01PROGRM("ECC0090");
				msgCD.setH01TIMSYS(getTimeStamp());
				msgCD.setH01SCRCOD("01");
				msgCD.setH01OPECOD("0007");
				try {
					msgCD.setE01CCRCID(req.getParameter("E01CCRCID").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD.setE01PRICUN(req.getParameter("E01PRICUN").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD.setE01PRINA1(req.getParameter("E01PRINA1").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD.setE01CCRTYP(req.getParameter("E01CCRTYP").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD.setE01CCRNUM(req.getParameter("E01CCRNUM").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD.setE01CCRNEW(req.getParameter("E01CCRNEW").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD.setE01CCRSTS(req.getParameter("E01CCRSTS").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD.setE01CCRDSC(req.getParameter("E01CCRDSC").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}

				mp.sendMessage(msgCD);
				ELEERRMessage msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				msgCD = (ECC009001Message) mp.receiveMessageRecord("ECC009001");

				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("msgCD", msgCD);
				
				if (mp.hasError(msgError)) {
					forward("ECC0090_card_assign_replace.jsp", req, res);
				} else {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSECC0090?SCREEN=100");
				}
			} else {
				ECC009003Message msgCD2 = (ECC009003Message) mp.getMessageRecord("ECC009003");
				msgCD2.setH03USERID(user.getH01USR());
				msgCD2.setH03PROGRM("ECC0090");
				msgCD2.setH03TIMSYS(getTimeStamp());
				msgCD2.setH03SCRCOD("01");
				msgCD2.setH03OPECOD("0007");
				try {
					msgCD2.setE03CCRCID(req.getParameter("E01CCRCID").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD2.setE03PRICUN(req.getParameter("E01PRICUN").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD2.setE03PRINA1(req.getParameter("E01PRINA1").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD2.setE03CCRTYP(req.getParameter("E01CCRTYP").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD2.setE03CCRNUM(req.getParameter("E01CCRNUM").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD2.setE03CCRNUMA(req.getParameter("E01CCRNUMA").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD2.setE03CCRNEW(req.getParameter("E01CCRNEW").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD2.setE03CCRSTS(req.getParameter("E01CCRSTS").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCD2.setE03CCRDSC(req.getParameter("E01CCRDSC").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}

				mp.sendMessage(msgCD2);
				ELEERRMessage msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				msgCD2 = (ECC009003Message) mp.receiveMessageRecord("ECC009003");

				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);

				if (mp.hasError(msgError)) {
					forward("ECC0090_card_assign_replace_add.jsp", req, res);
				} else {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSECC0090?SCREEN=100");
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqCardAssignReplace(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setType(req.getParameter("E01CCRTPI").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (userPO.getType().equals("T")) {
			try {
				userPO.setHeader1(req.getParameter("E01CCRNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
		} else {
			try {
				userPO.setHeader13(req.getParameter("E01CCRNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("ECC0090_card_assign_replace.jsp", req, res);
	}

	private void procActionCardStatus(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			ECC009001Message msgCD = (ECC009001Message) mp.getMessageRecord("ECC009001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("ECC0090");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0009");
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ECC009001Message) mp.receiveMessageRecord("ECC009001");

			session.setAttribute("error", msgError);
			session.setAttribute("msgCD", msgCD);
			
			if (mp.hasError(msgError)) {
				forward("ECC0090_card_status_info.jsp", req, res);
			} else {
				if ("S".equals(req.getParameter("opt"))) {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSECC0090?SCREEN=300");
				} else {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSECC0090?SCREEN=100");
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqCardStatusEnterInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setOption(req.getParameter("opt").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			ECC009001Message msgCD = (ECC009001Message) mp.getMessageRecord("ECC009001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("ECC0090");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0002");
			try {
				msgCD.setE01PRICUN(req.getParameter("E01PRICUN").trim());
			} catch (Exception e) {
				try {
					msgCD.setE01PRICUN(req.getParameter("E02PRICUN").trim());
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			try {
				msgCD.setE01CCRNUM(req.getParameter("E01CCRNUM"));
			} catch (Exception e) {
				try {
					msgCD.setE01CCRNUM(req.getParameter("E02CCRNUM"));
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ECC009001Message) mp.receiveMessageRecord("ECC009001");

			if (mp.hasError(msgError)) {
				pageName = "ECC0090_card_status_enter.jsp";
			} else {
				pageName = "ECC0090_card_status_info.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msgCD", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqCardStatusEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", new UserPos());
		
		forward("ECC0090_card_status_enter.jsp", req, res);
	}

	private void procReqCardAssignAdditionalInquiryMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			ECC009003Message msgCD = (ECC009003Message) mp.getMessageRecord("ECC009003");
			msgCD.setH03USERID(user.getH01USR());
			msgCD.setH03PROGRM("ECC0090");
			msgCD.setH03TIMSYS(getTimeStamp());
			msgCD.setH03SCRCOD("01");
			try {
				if (req.getParameter("new").equals("true"))	msgCD.setH03OPECOD("0010");
			} catch (Exception e) {
				msgCD.setH03OPECOD("0002");
			}
			
			try {
				msgCD.setE03CCRCID(req.getParameter("E03CCRCID").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgCD.setE03PRICUN(req.getParameter("E03PRICUN").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgCD.setE03CCRNUM(req.getParameter("E03CCRNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgCD.setE03CCRCIDA(req.getParameter("E03CCRCIDA").trim());
			} catch (Exception e) {
				msgCD.setE03CCRCIDA(userPO.getHeader9());
			}
			try {
				msgCD.setE03PRICUNA(req.getParameter("E03PRICUNA").trim());
			} catch (Exception e) {
				msgCD.setE03PRICUNA(userPO.getHeader10());
			}
			try {
				msgCD.setE03CCRNUMA(req.getParameter("E03CCRNUMA").trim());
			} catch (Exception e) {
				msgCD.setE03CCRNUMA(userPO.getHeader13());
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ECC009003Message) mp.receiveMessageRecord("ECC009003");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				ECC009004Message msgAcc = (ECC009004Message) mp.getMessageRecord("ECC009004");
				msgAcc.setH04USERID(user.getH01USR());
				msgAcc.setH04PROGRM("ECC0090");
				msgAcc.setH04TIMSYS(getTimeStamp());
				msgAcc.setH04SCRCOD("01");
				try {
					if (req.getParameter("new").equals("true")) msgAcc.setH04OPECOD("0015");
				} catch (Exception e) {
					msgAcc.setH04OPECOD("0016");
				}
				try {
					msgAcc.setE04CCRCID(req.getParameter("E03CCRCID").trim());
				} catch (Exception e) {
					msgAcc.setE04CCRCID(msgCD.getE03CCRCID());
				}
				try {
					msgAcc.setE04PRICUN(req.getParameter("E03PRICUN").trim());
				} catch (Exception e) {
					msgAcc.setE04PRICUN(msgCD.getE03PRICUN());
				}
				try {
					msgAcc.setE04CCRNUM(req.getParameter("E03CCRNUM").trim());
				} catch (Exception e) {
					msgAcc.setE04CCRNUM(msgCD.getE03CCRNUM());
				}
				try {
					msgAcc.setE04CCRCIDA(req.getParameter("E03CCRCIDA").trim());
				} catch (Exception e) {
					msgAcc.setE04CCRCIDA(userPO.getHeader9());
				}
				try {
					msgAcc.setE04PRICUNA(req.getParameter("E03PRICUNA").trim());
				} catch (Exception e) {
					msgAcc.setE04PRICUNA(userPO.getHeader10());
				}
				try {
					msgAcc.setE04CCRNUMA(req.getParameter("E03CCRNUMA").trim());
				} catch (Exception e) {
					msgAcc.setE04CCRNUMA(userPO.getHeader13());
				}
				
				mp.sendMessage(msgAcc);
				JBObjList list = mp.receiveMessageRecordList("H04FLGMAS");

				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					pageName = "error_viewer.jsp";
				} else {
					if (!list.isEmpty()) {
						msgAcc = (ECC009004Message) list.get(0);
						userPO.setIdentifier(msgAcc.getE04CCRCIDA());
						userPO.setAccNum(msgAcc.getE04CCRCRA());
						userPO.setCusNum(msgAcc.getE04PRICUNA());
						userPO.setHeader1(msgAcc.getE04CCRNUMA());
						userPO.setHeader2(msgAcc.getE04TARTYP());
						userPO.setHeader3(msgAcc.getE04CCRBRN());
						userPO.setHeader4(msgAcc.getE04CCRSTS());
						userPO.setHeader5(msgAcc.getE04CCRDSC());
						userPO.setHeader6(msgAcc.getE04CCRASD());
						userPO.setHeader7(msgAcc.getE04CCRASM());
						userPO.setHeader8(msgAcc.getE04CCRASY());
						userPO.setHeader20("");
						userPO.setHeader21("");
					}
					session.setAttribute("accList", list);
					
					String option = "";
					try {
						option = req.getParameter("opt").trim();
					} catch (Exception e) {
						// TODO: handle exception
					}
					
					if (option.equals("2")) {
						pageName = "ECC0090_card_assign_inq_add.jsp";
					} else {
						pageName = "ECC0090_card_assign_maint_add.jsp";
					}
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msgCD", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionCardAssignAdditionalMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opecode = "true".equalsIgnoreCase(req.getParameter("new")) ? "0001" : "0005";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			
			String[] accounts = req.getParameterValues("AccList");
			if (accounts != null) {
				for (int i = 0; i < accounts.length; i++) {
					StringTokenizer acc = new StringTokenizer(accounts[i], "-");
					ECC009004Message msgAcc = (ECC009004Message) mp.getMessageRecord("ECC009004");
					msgAcc.setH04USERID(user.getH01USR());
					msgAcc.setH04PROGRM("ECC0090");
					msgAcc.setH04TIMSYS(getTimeStamp());
					msgAcc.setH04SCRCOD("01");
					msgAcc.setH04OPECOD(opecode);
					msgAcc.setE04TARTYP(req.getParameter("E04TARTYP"));
					msgAcc.setE04CCRNUM(req.getParameter("E03CCRNUM"));
					msgAcc.setE04CCRNUMA(req.getParameter("E04CCRNUMA"));
					msgAcc.setE04PRICUN(req.getParameter("E03PRICUN"));
					msgAcc.setE04PRICUNA(req.getParameter("E03PRICUNA"));
					msgAcc.setE04CCRCID(req.getParameter("E03CCRCID"));
					msgAcc.setE04CCRCIDA(req.getParameter("E03CCRCIDA"));
					msgAcc.setE04CCRBRN(req.getParameter("E04CCRBRN"));
					msgAcc.setE04CCRCRA(acc.nextToken());
					msgAcc.setE04CCRASG("");
					msgAcc.setE04CCRASD(Util.getDay());
					msgAcc.setE04CCRASM(Util.getMonth());
					msgAcc.setE04CCRASY(Util.getYear());
					
					mp.sendMessage(msgAcc);
				}
			}
			// Send Main Accounts
			try {
				if (req.getParameter("CCP").trim().length() > 0) {
					ECC009004Message msgAcc = (ECC009004Message) mp.getMessageRecord("ECC009004");
					msgAcc.setH04USERID(user.getH01USR());
					msgAcc.setH04PROGRM("ECC0090");
					msgAcc.setH04TIMSYS(getTimeStamp());
					msgAcc.setH04SCRCOD("01");
					msgAcc.setH04OPECOD(opecode);
					msgAcc.setE04TARTYP(req.getParameter("E04TARTYP"));
					msgAcc.setE04CCRNUM(req.getParameter("E03CCRNUM"));
					msgAcc.setE04CCRNUMA(req.getParameter("E04CCRNUMA"));
					msgAcc.setE04PRICUN(req.getParameter("E03PRICUN"));
					msgAcc.setE04PRICUNA(req.getParameter("E03PRICUNA"));
					msgAcc.setE04CCRCID(req.getParameter("E03CCRCID"));
					msgAcc.setE04CCRCIDA(req.getParameter("E03CCRCIDA"));
					msgAcc.setE04CCRBRN(req.getParameter("E04CCRBRN"));
					msgAcc.setE04CCRCRA(req.getParameter("CCP"));
					msgAcc.setE04CCRASD(Util.getDay());
					msgAcc.setE04CCRASM(Util.getMonth());
					msgAcc.setE04CCRASY(Util.getYear());
					msgAcc.setE04CCRASG("P");
					if (req.getParameter("CCP").trim().equals(req.getParameter("CC_Main").trim())) {
						msgAcc.setE04CCRPRI("*");
					}	
					mp.sendMessage(msgAcc);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				if (req.getParameter("CAP").trim().length() > 0) {
					ECC009004Message msgAcc = (ECC009004Message) mp.getMessageRecord("ECC009004");
					msgAcc.setH04USERID(user.getH01USR());
					msgAcc.setH04PROGRM("ECC0090");
					msgAcc.setH04TIMSYS(getTimeStamp());
					msgAcc.setH04SCRCOD("01");
					msgAcc.setH04OPECOD(opecode);
					msgAcc.setE04TARTYP(req.getParameter("E04TARTYP"));
					msgAcc.setE04CCRNUM(req.getParameter("E03CCRNUM"));
					msgAcc.setE04CCRNUMA(req.getParameter("E04CCRNUMA"));
					msgAcc.setE04PRICUN(req.getParameter("E03PRICUN"));
					msgAcc.setE04PRICUNA(req.getParameter("E03PRICUNA"));
					msgAcc.setE04CCRCID(req.getParameter("E03CCRCID"));
					msgAcc.setE04CCRCIDA(req.getParameter("E03CCRCIDA"));
					msgAcc.setE04CCRBRN(req.getParameter("E04CCRBRN"));
					msgAcc.setE04CCRCRA(req.getParameter("CAP"));
					msgAcc.setE04CCRASD(Util.getDay());
					msgAcc.setE04CCRASM(Util.getMonth());
					msgAcc.setE04CCRASY(Util.getYear());
					msgAcc.setE04CCRASG("P");
					if (req.getParameter("CAP").trim().equals(req.getParameter("CC_Main").trim())) {
						msgAcc.setE04CCRPRI("*");
					}	
					mp.sendMessage(msgAcc);
				}	
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			try {
				if (req.getParameter("CFP").trim().length() > 0) {
					ECC009004Message msgAcc = (ECC009004Message) mp.getMessageRecord("ECC009004");
					msgAcc.setH04USERID(user.getH01USR());
					msgAcc.setH04PROGRM("ECC0090");
					msgAcc.setH04TIMSYS(getTimeStamp());
					msgAcc.setH04SCRCOD("01");
					msgAcc.setH04OPECOD(opecode);
					msgAcc.setE04TARTYP(req.getParameter("E04TARTYP"));
					msgAcc.setE04CCRNUM(req.getParameter("E03CCRNUM"));
					msgAcc.setE04CCRNUMA(req.getParameter("E04CCRNUMA"));
					msgAcc.setE04PRICUN(req.getParameter("E03PRICUN"));
					msgAcc.setE04PRICUNA(req.getParameter("E03PRICUNA"));
					msgAcc.setE04CCRCID(req.getParameter("E03CCRCID"));
					msgAcc.setE04CCRCIDA(req.getParameter("E03CCRCIDA"));
					msgAcc.setE04CCRBRN(req.getParameter("E04CCRBRN"));
					msgAcc.setE04CCRCRA(req.getParameter("CFP"));
					msgAcc.setE04CCRASD(Util.getDay());
					msgAcc.setE04CCRASM(Util.getMonth());
					msgAcc.setE04CCRASY(Util.getYear());
					msgAcc.setE04CCRASG("P");
					if (req.getParameter("CFP").trim().equals(req.getParameter("CC_Main").trim())) {
						msgAcc.setE04CCRPRI("*");
					}	
					mp.sendMessage(msgAcc);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			// Send Secondary Accounts
			String[] accounts2 = req.getParameterValues("AccSList");
			if (accounts2 != null) {
				for (int j = 0; j < accounts2.length; j++) {
					StringTokenizer accs = new StringTokenizer(accounts2[j], "-");
					ECC009004Message msgAcc = (ECC009004Message) mp.getMessageRecord("ECC009004");
					msgAcc.setH04USERID(user.getH01USR());
					msgAcc.setH04PROGRM("ECC0090");
					msgAcc.setH04TIMSYS(getTimeStamp());
					msgAcc.setH04SCRCOD("01");
					msgAcc.setH04OPECOD(opecode);
					msgAcc.setE04TARTYP(req.getParameter("E04TARTYP"));
					msgAcc.setE04CCRNUM(req.getParameter("E03CCRNUM"));
					msgAcc.setE04CCRNUMA(req.getParameter("E04CCRNUMA"));
					msgAcc.setE04PRICUN(req.getParameter("E03PRICUN"));
					msgAcc.setE04PRICUNA(req.getParameter("E03PRICUNA"));
					msgAcc.setE04CCRCID(req.getParameter("E03CCRCID"));
					msgAcc.setE04CCRCIDA(req.getParameter("E03CCRCIDA"));
					msgAcc.setE04CCRBRN(req.getParameter("E04CCRBRN"));
					msgAcc.setE04CCRCRA(accs.nextToken());
					msgAcc.setE04CCRASG("S");
					msgAcc.setE04CCRPRI("");
					msgAcc.setE04CCRASD(Util.getDay());
					msgAcc.setE04CCRASM(Util.getMonth());
					msgAcc.setE04CCRASY(Util.getYear());
					mp.sendMessage(msgAcc);
				}
			}
			// Send Final Flag
			ECC009004Message msgAcc = (ECC009004Message) mp.getMessageRecord("ECC009004");
			msgAcc.setH04USERID(user.getH01USR());
			msgAcc.setH04PROGRM("ECC0090");
			msgAcc.setH04TIMSYS(getTimeStamp());
			msgAcc.setH04SCRCOD("01");
			msgAcc.setH04OPECOD(opecode);
			msgAcc.setH04FLGMAS("*");
			
			mp.sendMessage(msgAcc);
			MessageRecord message = mp.receiveMessageRecord();

			if (mp.hasError(message)) {
				session.setAttribute("error", message);
				forward("ECC0090_card_assign_maint_add.jsp", req, res);
			} else {
				if (userPO.getOption().equals("T")) {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSECC0090?SCREEN=200&E03PRICUN=" + userPO.getCusNum());
				} else {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSECC0090?SCREEN=200&E03PRICUNA=" + userPO.getHeader10());
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionCardAssignAdditionalNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			ECC009003Message msgCD = (ECC009003Message) mp.getMessageRecord("ECC009003");
			msgCD.setH03USERID(user.getH01USR());
			msgCD.setH03PROGRM("ECC0090");
			msgCD.setH03TIMSYS(getTimeStamp());
			msgCD.setH03SCRCOD("01");
			msgCD.setH03OPECOD("0010");
			try {
				msgCD.setE03CCRCID(req.getParameter("E03CCRCID").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgCD.setE03PRICUN(req.getParameter("E03PRICUN").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgCD.setE03CCRNUM(req.getParameter("E03CCRNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgCD.setE03PRICUNA(req.getParameter("E03PRICUNA").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgCD.setE03CCRNUMA(req.getParameter("E03CCRNUMA").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ECC009003Message) mp.receiveMessageRecord("ECC009003");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				ECC009004Message msgAcc = (ECC009004Message) mp.getMessageRecord("ECC009004");
				msgAcc.setH04USERID(user.getH01USR());
				msgAcc.setH04PROGRM("ECC0090");
				msgAcc.setH04TIMSYS(getTimeStamp());
				msgAcc.setH04SCRCOD("01");
				msgAcc.setH04OPECOD("0015");
				try {
					msgAcc.setE04CCRCID(req.getParameter("E03CCRCID").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgAcc.setE04PRICUN(req.getParameter("E03PRICUN").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgAcc.setE04CCRNUM(req.getParameter("E03CCRNUM").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgAcc.setE04PRICUNA(req.getParameter("E03PRICUNA").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgAcc.setE04CCRNUMA(req.getParameter("E03CCRNUMA").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				mp.sendMessage(msgAcc);
				JBObjList list = mp.receiveMessageRecordList("H04FLGMAS");

				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					pageName = "error_viewer.jsp";
				} else {
					if (!list.isEmpty()) {
						msgAcc = (ECC009004Message) list.get(0);
						userPO.setAccNum(msgAcc.getE04CCRCRA());
						userPO.setHeader1(msgAcc.getE04CCRNUM());
						userPO.setHeader2(msgAcc.getE04TARTYP());
						userPO.setHeader3(msgAcc.getE04CCRBRN());
						userPO.setHeader4(msgAcc.getE04CCRSTS());
						userPO.setHeader5(msgAcc.getE04CCRDSC());
						userPO.setHeader6(msgAcc.getE04CCRSTD());
						userPO.setHeader7(msgAcc.getE04CCRSTM());
						userPO.setHeader8(msgAcc.getE04CCRSTY());
						userPO.setHeader21("true");
					}
					session.setAttribute("accList", list);
					
					pageName = "ECC0090_card_assign_maint_add.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msgCD", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqCardAssignAdditionalNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		ECC009001Message msgCD = new ECC009001Message();
		try {
			msgCD.setE01CCRCID(req.getParameter("E01CCRCID").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			msgCD.setE01PRINA1(req.getParameter("E01PRINA1").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			msgCD.setE01PRICUN(req.getParameter("E01PRICUN").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			msgCD.setE01CCRNUM(req.getParameter("E01CCRNUM").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		session.setAttribute("msgCD", msgCD);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("ECC0090_card_assign_new_add.jsp", req, res);
	}

	private void procReqCardAssignInquiryMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String option = "";
		try {
			option = req.getParameter("opt").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			ECC009002Message msgAcc = (ECC009002Message) mp.getMessageRecord("ECC009002");
			msgAcc.setH02USERID(user.getH01USR());
			msgAcc.setH02PROGRM("ECC0090");
			msgAcc.setH02TIMSYS(getTimeStamp());
			msgAcc.setH02SCRCOD("01");
			msgAcc.setH02OPECOD("0015");
			try {
				msgAcc.setE02CCRCID(req.getParameter("E01CCRCID").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgAcc.setE02PRICUN(req.getParameter("E01PRICUN").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgAcc.setE02CCRTYP(req.getParameter("E01CCRTYP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgAcc.setE02CCRNUM(req.getParameter("E01CCRNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgAcc.setE02TARTYP(req.getParameter("E01TARTYP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgAcc);
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				if (!list.isEmpty()) {
					msgAcc = (ECC009002Message) list.get(0);
					userPO.setAccNum(msgAcc.getE02CCRCRA());
					userPO.setHeader2(msgAcc.getE02TARTYP());
					userPO.setHeader3(msgAcc.getE02CCRBRN());
					userPO.setHeader4(msgAcc.getE02CCRSTS());
					userPO.setHeader5(msgAcc.getE02CCRDSC());
					userPO.setHeader6(msgAcc.getE02CCRASD());
					userPO.setHeader7(msgAcc.getE02CCRASM());
					userPO.setHeader8(msgAcc.getE02CCRASY());
					userPO.setHeader20("");
					userPO.setHeader21("");
				}
				session.setAttribute("accList", list);
				
				if (option.equals("2")) { // Inquiry
					pageName = "ECC0090_card_assign_inq.jsp";
				} else { // Maintenance
					pageName = "ECC0090_card_assign_maint.jsp";
				}
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionCardAssignMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opecode = "true".equalsIgnoreCase(req.getParameter("new")) ? "0001" : "0005";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			
			String[] accounts = req.getParameterValues("AccList");
			if (accounts != null) {
				for (int i = 0; i < accounts.length; i++) {
					StringTokenizer acc = new StringTokenizer(accounts[i], "-");
					ECC009002Message msgAcc = (ECC009002Message) mp.getMessageRecord("ECC009002");
					msgAcc.setH02USERID(user.getH01USR());
					msgAcc.setH02PROGRM("ECC0090");
					msgAcc.setH02TIMSYS(getTimeStamp());
					msgAcc.setH02SCRCOD("01");
					msgAcc.setH02OPECOD(opecode);
					msgAcc.setE02TARTYP(req.getParameter("E02TARTYP"));
					msgAcc.setE02CCRNUM(req.getParameter("E02CCRNUM"));
					msgAcc.setE02CCRBRN(req.getParameter("E02CCRBRN"));
					msgAcc.setE02PRICUN(req.getParameter("E02PRICUN"));
					msgAcc.setE02CCRCID(req.getParameter("E02CCRCID"));
					msgAcc.setE02CCRBRN(req.getParameter("E02CCRBRN"));
					msgAcc.setE02CCRCRA(acc.nextToken());
					msgAcc.setE02CCRASG("");
					msgAcc.setE02CCRASD(Util.getDay());
					msgAcc.setE02CCRASM(Util.getMonth());
					msgAcc.setE02CCRASY(Util.getYear());
					
					mp.sendMessage(msgAcc);
				}
			}
			// Send Main Accounts
			try {
				if (req.getParameter("CCP").trim().length() > 0) {
					ECC009002Message msgAcc = (ECC009002Message) mp.getMessageRecord("ECC009002");
					msgAcc.setH02USERID(user.getH01USR());
					msgAcc.setH02PROGRM("ECC0090");
					msgAcc.setH02TIMSYS(getTimeStamp());
					msgAcc.setH02SCRCOD("01");
					msgAcc.setH02OPECOD(opecode);
					msgAcc.setE02TARTYP(req.getParameter("E02TARTYP"));
					msgAcc.setE02CCRNUM(req.getParameter("E02CCRNUM"));
					msgAcc.setE02CCRBRN(req.getParameter("E02CCRBRN"));
					msgAcc.setE02PRICUN(req.getParameter("E02PRICUN"));
					msgAcc.setE02CCRCID(req.getParameter("E02CCRCID"));
					msgAcc.setE02CCRBRN(req.getParameter("E02CCRBRN"));
					msgAcc.setE02CCRCRA(req.getParameter("CCP").trim());
					msgAcc.setE02CCRASG("P");
					if (req.getParameter("CCP").trim().equals(req.getParameter("CC_Main").trim())) {
						msgAcc.setE02CCRPRI("*");
					}	
					mp.sendMessage(msgAcc);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				if (req.getParameter("CAP").trim().length() > 0) {
					ECC009002Message msgAcc = (ECC009002Message) mp.getMessageRecord("ECC009002");
					msgAcc.setH02USERID(user.getH01USR());
					msgAcc.setH02PROGRM("ECC0090");
					msgAcc.setH02TIMSYS(getTimeStamp());
					msgAcc.setH02SCRCOD("01");
					msgAcc.setH02OPECOD(opecode);
					msgAcc.setE02TARTYP(req.getParameter("E02TARTYP"));
					msgAcc.setE02CCRNUM(req.getParameter("E02CCRNUM"));
					msgAcc.setE02CCRBRN(req.getParameter("E02CCRBRN"));
					msgAcc.setE02PRICUN(req.getParameter("E02PRICUN"));
					msgAcc.setE02CCRCID(req.getParameter("E02CCRCID"));
					msgAcc.setE02CCRBRN(req.getParameter("E02CCRBRN"));
					msgAcc.setE02CCRCRA(req.getParameter("CAP").trim());
					msgAcc.setE02CCRASD(Util.getDay());
					msgAcc.setE02CCRASM(Util.getMonth());
					msgAcc.setE02CCRASY(Util.getYear());
					msgAcc.setE02CCRASG("P");
					if (req.getParameter("CAP").trim().equals(req.getParameter("CC_Main").trim())) {
						msgAcc.setE02CCRPRI("*");
					}	
					mp.sendMessage(msgAcc);
				}	
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			try {
				if (req.getParameter("CFP").trim().length() > 0) {
					ECC009002Message msgAcc = (ECC009002Message) mp.getMessageRecord("ECC009002");
					msgAcc.setH02USERID(user.getH01USR());
					msgAcc.setH02PROGRM("ECC0090");
					msgAcc.setH02TIMSYS(getTimeStamp());
					msgAcc.setH02SCRCOD("01");
					msgAcc.setH02OPECOD(opecode);
					msgAcc.setE02TARTYP(req.getParameter("E02TARTYP"));
					msgAcc.setE02CCRNUM(req.getParameter("E02CCRNUM"));
					msgAcc.setE02CCRBRN(req.getParameter("E02CCRBRN"));
					msgAcc.setE02PRICUN(req.getParameter("E02PRICUN"));
					msgAcc.setE02CCRCID(req.getParameter("E02CCRCID"));
					msgAcc.setE02CCRBRN(req.getParameter("E02CCRBRN"));
					msgAcc.setE02CCRCRA(req.getParameter("CFP"));
					msgAcc.setE02CCRASD(Util.getDay());
					msgAcc.setE02CCRASM(Util.getMonth());
					msgAcc.setE02CCRASY(Util.getYear());
					msgAcc.setE02CCRASG("P");
					if (req.getParameter("CFP").trim().equals(req.getParameter("CC_Main").trim())) {
						msgAcc.setE02CCRPRI("*");
					}	
					mp.sendMessage(msgAcc);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			// Send Secondary Accounts
			String[] accounts2 = req.getParameterValues("AccSList");
			if (accounts2 != null) {
				for (int j = 0; j < accounts2.length; j++) {
					StringTokenizer accs = new StringTokenizer(accounts2[j], "-");
					ECC009002Message msgAcc = (ECC009002Message) mp.getMessageRecord("ECC009002");
					msgAcc.setH02USERID(user.getH01USR());
					msgAcc.setH02PROGRM("ECC0090");
					msgAcc.setH02TIMSYS(getTimeStamp());
					msgAcc.setH02SCRCOD("01");
					msgAcc.setH02OPECOD(opecode);
					msgAcc.setE02TARTYP(req.getParameter("E02TARTYP"));
					msgAcc.setE02CCRNUM(req.getParameter("E02CCRNUM"));
					msgAcc.setE02CCRBRN(req.getParameter("E02CCRBRN"));
					msgAcc.setE02PRICUN(req.getParameter("E02PRICUN"));
					msgAcc.setE02CCRCID(req.getParameter("E02CCRCID"));
					msgAcc.setE02CCRBRN(req.getParameter("E02CCRBRN"));
					msgAcc.setE02CCRCRA(accs.nextToken());
					msgAcc.setE02CCRASG("S");
					msgAcc.setE02CCRPRI("");
					msgAcc.setE02CCRASD(Util.getDay());
					msgAcc.setE02CCRASM(Util.getMonth());
					msgAcc.setE02CCRASY(Util.getYear());
					mp.sendMessage(msgAcc);
				}
			}
			// Send Final Flag
			ECC009002Message msgAcc = (ECC009002Message) mp.getMessageRecord("ECC009002");
			msgAcc.setH02USERID(user.getH01USR());
			msgAcc.setH02PROGRM("ECC0090");
			msgAcc.setH02TIMSYS(getTimeStamp());
			msgAcc.setH02SCRCOD("01");
			msgAcc.setH02OPECOD(opecode);
			msgAcc.setH02FLGMAS("*");
			
			mp.sendMessage(msgAcc);
			MessageRecord message = mp.receiveMessageRecord();

			if (mp.hasError(message)) {
				session.setAttribute("error", message);
				forward("ECC0090_card_assign_maint.jsp", req, res);
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSECC0090?SCREEN=200&E01PRICUN=" + userPO.getCusNum());
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionCardAssignNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		ECC009001Message msgCD = (ECC009001Message) session.getAttribute("msgCD");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			ECC009002Message msgAcc = (ECC009002Message) mp.getMessageRecord("ECC009002");
			msgAcc.setH02USERID(user.getH01USR());
			msgAcc.setH02PROGRM("ECC0090");
			msgAcc.setH02TIMSYS(getTimeStamp());
			msgAcc.setH02SCRCOD("01");
			msgAcc.setH02OPECOD("0015");
			try {
				msgAcc.setE02CCRCID(req.getParameter("E01CCRCID").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgAcc.setE02PRICUN(req.getParameter("E01PRICUN").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgAcc.setE02CCRTYP(req.getParameter("E01CCRTYP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgAcc.setE02CCRNUM(req.getParameter("E01CCRNUM"));
				msgCD.setE01CCRNUM(req.getParameter("E01CCRNUM"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgAcc.setE02TARTYP(req.getParameter("E01TARTYP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgAcc);
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "ECC0090_card_assign_new.jsp";
			} else {
				if (!list.isEmpty()) {
					msgAcc = (ECC009002Message) list.get(0);
					userPO.setAccNum(msgAcc.getE02CCRCRA());
					userPO.setHeader1(msgAcc.getE02CCRNUM());
					userPO.setHeader2(msgAcc.getE02TARTYP());
					userPO.setHeader3(msgAcc.getE02CCRBRN());
					userPO.setHeader4(msgAcc.getE02CCRSTS());
					userPO.setHeader5(msgAcc.getE02CCRDSC());
					userPO.setHeader6(msgAcc.getE02CCRASD());
					userPO.setHeader7(msgAcc.getE02CCRASM());
					userPO.setHeader8(msgAcc.getE02CCRASY());
					userPO.setHeader20("");
					userPO.setHeader21("true");
				}
				
				
				session.setAttribute("msgCD", msgCD);
				session.setAttribute("accList", list);
				pageName = "ECC0090_card_assign_maint.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqCardAssignNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		
		forward("ECC0090_card_assign_new.jsp", req, res);
	}
	private void procReqCardAssignList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECC0090", req);
			ECC009001Message msgCD = (ECC009001Message) mp.getMessageRecord("ECC009001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("ECC0090");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0002");
			if (userPO.getOption().equals("T")) {
				try {
					msgCD.setE01PRICUN(req.getParameter("E03PRICUN").trim());
				} catch (Exception e2) {
					// TODO: handle exception
				}
			} else if (userPO.getOption().equals("A")) {
				try {
					msgCD.setE01PRICUN(req.getParameter("E03PRICUNA").trim());	
				} catch (Exception e2) {
					// TODO: handle exception
				}
			} else {
				try {
					msgCD.setE01PRICUN(req.getParameter("E01PRICUN").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "ECC0090_card_assign_enter.jsp";
			} else {
				if (!list.isEmpty()) {
					msgCD = (ECC009001Message) list.get(0);
					if (msgCD.getE01CCRTPI().equals("T")) {
						userPO.setOption("T");
						userPO.setIdentifier(msgCD.getE01CCRCID());
						userPO.setCusNum(msgCD.getE01PRICUN());
						userPO.setCusName(msgCD.getE01PRINA1());
						userPO.setCusType(msgCD.getE01CCRTYP());
						userPO.setHeader1(msgCD.getE01CCRNUM());
					} else if (msgCD.getE01CCRTPI().equals("A")) {
						userPO.setOption("A");
						userPO.setHeader9(msgCD.getE01CCRCID());
						userPO.setHeader10(msgCD.getE01PRICUN());
						userPO.setHeader11(msgCD.getE01PRINA1());
						userPO.setHeader12(msgCD.getE01CCRTYP());
						userPO.setHeader13(msgCD.getE01CCRNUM());
						userPO.setHeader14(msgCD.getE01CCRNEW());
					} else {
						userPO.setIdentifier(msgCD.getE01CCRCID());
						userPO.setCusNum(msgCD.getE01PRICUN());		
						userPO.setCusName(msgCD.getE01PRINA1());
						userPO.setCusType(msgCD.getE01CCRTYP());
						userPO.setHeader14(msgCD.getE01CCRNEW());
					}
				}
				session.setAttribute("cardList", list);
				pageName = "ECC0090_card_assign_list.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqCardAssignEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", new UserPos());
		
		forward("ECC0090_card_assign_enter.jsp", req, res);
	}

}