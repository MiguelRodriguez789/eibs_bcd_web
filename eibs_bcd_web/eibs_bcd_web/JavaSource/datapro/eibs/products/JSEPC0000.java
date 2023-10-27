package datapro.eibs.products;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EFT000010Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPC000001Message;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000006Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEPC0000 extends JSEIBSServlet {

	protected static final int R_NEW = 1;
	protected static final int A_NEW = 2;
	protected static final int R_MAINTENANCE = 3;
	protected static final int A_MAINTENANCE = 4;
	protected static final int R_TITULARES = 7;
	protected static final int A_TITULARES = 8;
	protected static final int R_TITULARES_INQ = 9;
	protected static final int R_CODES = 21;
	protected static final int A_CODES = 22;
	protected static final int R_CODES_INQ = 23;
	protected static final int A_PRINT_FIRST = 48;
	// entering options
	protected static final int R_ENTER_NEW = 100;
	protected static final int A_ENTER_NEW = 200;
	protected static final int R_ENTER_MAINT = 300;
	protected static final int A_ENTER_MAINT = 400;
	protected static final int R_ENTER_INQUIRY = 500;
	protected static final int A_ENTER_INQUIRY = 600;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Request
			case R_NEW :
				procReqNew(user, req, res, session);
				break;
			case R_MAINTENANCE :
				procReqMaintenance(user, req, res, session);
				break;
			case R_ENTER_MAINT :
				procReqEnterMaint(user, req, res, session);
				break;
			case R_ENTER_INQUIRY :
				procReqEnterInquiry(user, req, res, session);
				break;
			case R_CODES :
				procReqSpecialCodes(user, req, res, session);
				break;
			case R_TITULARES :
				procReqTit(user, req, res, session);
				break;
			case R_CODES_INQ :
				procReqSpecialCodesInq(user, req, res, session);
				break;
			case R_TITULARES_INQ :
				procReqTitInq(user, req, res, session);
				break;
				// Action
			case A_ENTER_NEW :
				procActionEnterNew(user, req, res, session);
				break;
			case A_NEW :
				procActionNew(user, req, res, session);
				break;
			case A_MAINTENANCE :
				procActionMaintenance(user, req, res, session);
				break;
			case A_ENTER_MAINT :
				procActionEnterMaint(user, req, res, session);
				break;
			case A_ENTER_INQUIRY :
				procActionEnterInquiry(user, req, res, session);
				break;
			case A_PRINT_FIRST :
				procActionPrintNew(user, req, res, session);
				break;
			case A_CODES :
				procActionSpecialCodes(user, req, res, session);
				break;
			case A_TITULARES :
				procActionTit(user, req, res, session);
				break;
				// END Entering
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0005";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			ESD000006Message msgCD = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgCD.setH06USR(user.getH01USR());
			msgCD.setH06PGM("EPC0000");
			msgCD.setH06TIM(getTimeStamp());
			msgCD.setH06WK1("M");
			msgCD.setH06SCR("01");
			msgCD.setH06OPE(opCode);
			msgCD.setE06ACC(userPO.getIdentifier());
			msgCD.setE06RTP("H");
			
			setMessageRecord(req, msgCD);
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (ESD000006Message) mp.receiveMessageRecord("ESD000006");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EPC0000_pc_tit.jsp";
			}
			userPO.setIdentifier(msgCD.getE06ACC());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			session.setAttribute("cdTit", msgCD);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionSpecialCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String opCode = "0005";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			ESD000002Message msgCD = (ESD000002Message) session.getAttribute("cdCodes");
			msgCD.setH02USR(user.getH01USR());
			msgCD.setH02PGM("EPC0000");
			msgCD.setH02TIM(getTimeStamp());
			msgCD.setH02SCR("01");
			msgCD.setH02OPE(opCode);
			
			setMessageRecord(req, msgCD);
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (ESD000002Message) mp.receiveMessageRecord("ESD000002");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EPC0000_pc_codes.jsp";
			}
			userPO.setIdentifier(msgCD.getE02ACC());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdCodes", msgCD);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionPrintNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String opCode = "0002";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			EPC000001Message msgPC = (EPC000001Message) session.getAttribute("pcMant");
			msgPC.setH01USERID(user.getH01USR());
			msgPC.setH01PROGRM("EPC0000");
			msgPC.setH01TIMSYS(getTimeStamp());
			msgPC.setH01SCRCOD("01");
			msgPC.setH01OPECOD(opCode);
			try {
				msgPC.setE01PCMACC(req.getParameter("E01PCMACC").trim());
			} catch (Exception e) {
				msgPC.setE01PCMACC(userPO.getIdentifier());
			}
			
			mp.sendMessage(msgPC);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPC = (EPC000001Message) mp.receiveMessageRecord("EPC000001");
			
			if (mp.hasError(msgError)) {
				pageName = "EPC0000_pc_enter_maint.jsp";
			} else {
				pageName = "EPC0000_pc_maint.jsp";
			}
			userPO.setIdentifier(msgPC.getE01PCMACC());
			userPO.setHeader1(msgPC.getE01PCMPRO());
			userPO.setHeader2(msgPC.getE01PCMCUN());
			userPO.setHeader3(msgPC.getD01PCMCUN());
			userPO.setCurrency(msgPC.getE01PCMCCY());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("pcMant", msgPC);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String opCode = "0004";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			EPC000001Message msgPC = null;
			if (session.getAttribute("pcMant") == null) {
				msgPC = (EPC000001Message) mp.getMessageRecord("EPC000001");
			} else {
				msgPC = (EPC000001Message) session.getAttribute("pcMant");
			}
			msgPC.setH01USERID(user.getH01USR());
			msgPC.setH01PROGRM("EPC0000");
			msgPC.setH01TIMSYS(getTimeStamp());
			msgPC.setH01SCRCOD("01");
			msgPC.setH01OPECOD(opCode);
			try {
				msgPC.setE01PCMACC(req.getParameter("E01PCMACC").trim());
			} catch (Exception e) {
				msgPC.setE01PCMACC(userPO.getIdentifier());
			}
			try {
				msgPC.setH01FLGWK2(req.getParameter("H01FLGWK2").trim());
			} catch (Exception e) {
				msgPC.setH01FLGWK2("");
			}
			
			mp.sendMessage(msgPC);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPC = (EPC000001Message) mp.receiveMessageRecord("EPC000001");
			
			if (mp.hasError(msgError)) {
				pageName = "EPC0000_pc_enter_inquiry.jsp";
			} else {
				pageName = "EPC0000_pc_inquiry.jsp";
			}
			userPO.setIdentifier(msgPC.getE01PCMACC());
			userPO.setHeader1(msgPC.getE01PCMPRO());
			userPO.setHeader2(msgPC.getE01PCMCUN());
			userPO.setHeader3(msgPC.getD01PCMCUN());
			userPO.setCurrency(msgPC.getE01PCMCCY());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("pcMant", msgPC);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String opCode = "0002";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			EPC000001Message msgPC = (EPC000001Message) mp.getMessageRecord("EPC000001");
			msgPC.setH01USERID(user.getH01USR());
			msgPC.setH01PROGRM("EPC0000");
			msgPC.setH01TIMSYS(getTimeStamp());
			msgPC.setH01SCRCOD("01");
			msgPC.setH01OPECOD(opCode);
			try {
				msgPC.setE01PCMACC(req.getParameter("E01PCMACC").trim());
			} catch (Exception e) {
				msgPC.setE01PCMACC(userPO.getIdentifier());
			}
			try {
				msgPC.setH01FLGWK2(req.getParameter("H01FLGWK2").trim());
			} catch (Exception e) {
				msgPC.setH01FLGWK2("");
			}
			
			mp.sendMessage(msgPC);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPC = (EPC000001Message) mp.receiveMessageRecord("EPC000001");
			
			if (mp.hasError(msgError)) {
				pageName = "EPC0000_pc_enter_maint.jsp";
			} else {
				pageName = "EPC0000_pc_maint.jsp";
			}
			userPO.setIdentifier(msgPC.getE01PCMACC());
			userPO.setHeader1(msgPC.getE01PCMPRO());
			userPO.setHeader2(msgPC.getE01PCMCUN());
			userPO.setHeader3(msgPC.getD01PCMCUN());
			userPO.setCurrency(msgPC.getE01PCMCCY());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("pcMant", msgPC);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String opCode = "0005";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			EPC000001Message msgPC = (EPC000001Message) session.getAttribute("pcMant");
			msgPC.setH01USERID(user.getH01USR());
			msgPC.setH01PROGRM("EPC0000");
			msgPC.setH01TIMSYS(getTimeStamp());
			msgPC.setH01SCRCOD("01");
			msgPC.setH01OPECOD(opCode);
			msgPC.setH01FLGWK3("U");
			
			setMessageRecord(req, msgPC);
			
			mp.sendMessage(msgPC);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPC = (EPC000001Message) mp.receiveMessageRecord("EPC000001");
			
			if (mp.hasError(msgError)) {
				pageName = "EPC0000_pc_maint.jsp";
			} else {
				pageName = "EPC0000_pc_enter_maint.jsp";
			}
			userPO.setIdentifier(msgPC.getE01PCMACC());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("pcMant", msgPC);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String opCode = "0005";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			EPC000001Message msgPC = (EPC000001Message) mp.getMessageRecord("EPC000001");
			msgPC.setH01USERID(user.getH01USR());
			msgPC.setH01PROGRM("EPC0000");
			msgPC.setH01TIMSYS(getTimeStamp());
			msgPC.setH01SCRCOD("01");
			msgPC.setH01OPECOD(opCode);
			msgPC.setH01FLGWK3("U");
			
			setMessageRecord(req, msgPC);
			
			mp.sendMessage(msgPC);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("pcNew", msg);
				pageName = "EPC0000_pc_opening.jsp";
			} else {
				if ("EPC000001".equals(msg.getFormatName())) {
					msgPC = (EPC000001Message) msg;
					
					userPO.setIdentifier(msgPC.getE01PCMACC());
					userPO.setCurrency(msgPC.getE01PCMCCY());
					userPO.setHeader3(msgPC.getD01PCMCUN());
					userPO.setHeader2(msgPC.getE01PCMCUN());
					userPO.setHeader1(msgPC.getE01PCMPRO());

					session.setAttribute("pcNew", msgPC);
					
					pageName = "EPC0000_pc_confirm.jsp";
				} else if ("EFT000010".equals(msg.getFormatName())) {
					EFT000010Message msgCD = (EFT000010Message) msg;
					userPO.setIdentifier(msgCD.getE10DEAACC());
					userPO.setHeader1(msgCD.getE10DEAPRO());
					userPO.setHeader2(msgCD.getE10DEACUN());
					userPO.setHeader3(msgCD.getE10CUSNA1());

					session.setAttribute("cdFinish", msgCD);
					
					pageName = "EPC0000_pc_confirm.jsp";
				}
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setIdentifier(req.getParameter("E01PCMACC") == null ? "" : req.getParameter("E01PCMACC"));
		userPO.setProdCode(req.getParameter("E01PCMPRO") == null ? "" : req.getParameter("E01PCMPRO"));
		session.setAttribute("userPO", userPO);
		
		procReqNew(user, req, res, session);
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0001";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			EPC000001Message msgPC = (EPC000001Message) mp.getMessageRecord("EPC000001");
			msgPC.setH01USERID(user.getH01USR());
			msgPC.setH01PROGRM("EPC0000");
			msgPC.setH01TIMSYS(getTimeStamp());
			msgPC.setH01SCRCOD("01");
			msgPC.setH01OPECOD(opCode);
			msgPC.setE01PCMPRO(userPO.getProdCode());

			try {
				msgPC.setE01PCMACC(userPO.getIdentifier());
			} catch (Exception e) {
				msgPC.setE01PCMACC("0");
			}
			
			mp.sendMessage(msgPC);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPC = (EPC000001Message) mp.receiveMessageRecord("EPC000001");
			
			if (mp.hasError(msgError)) {
				String appCode = req.getParameter("appcode") == null ? "?appcode=19" : "?appcode=" + req.getParameter("appcode").trim();
				String typecode = req.getParameter("typecode") == null ? "" : "&typecode=" + req.getParameter("typecode").trim();
				String generic = req.getParameter("generic") == null ? "" : "&generic=" + req.getParameter("generic").trim();
				String title = req.getParameter("title") == null ? "" : "&title=" + req.getParameter("title").trim();
				String bank = req.getParameter("bank") == null ? "" : "&bank=" + req.getParameter("bank").trim();
				
				String firstLink =
					webAppPath
						+ getLangPath(user)
						+ "ESD0711_products_detail.jsp"
						+ appCode
						+ typecode
						+ generic
						+ title
						+ bank;
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				printProdFrame(out, firstLink, getLangPath(user));
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("pcNew", msgPC);
				
				forward("EPC0000_pc_opening.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqTitInq(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0004";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			ESD000006Message msgCD = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgCD.setH06USR(user.getH01USR());
			msgCD.setH06PGM("EPC0000");
			msgCD.setH06TIM(getTimeStamp());
			msgCD.setH06WK1("M");
			msgCD.setH06SCR("01");
			msgCD.setH06OPE(opCode);
			msgCD.setE06ACC(userPO.getIdentifier());
			msgCD.setE06RTP("H");
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (ESD000006Message) mp.receiveMessageRecord("ESD000006");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EPC0000_pc_tit_inq.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			session.setAttribute("cdTit", msgCD);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqSpecialCodesInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0004";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			ESD000002Message msgCD = (ESD000002Message) mp.getMessageRecord("ESD000002");
			msgCD.setH02USR(user.getH01USR());
			msgCD.setH02PGM("EPC0000");
			msgCD.setH02TIM(getTimeStamp());
			msgCD.setH02WK1("M");
			msgCD.setH02SCR("01");
			msgCD.setH02OPE(opCode);
			msgCD.setE02ACC(userPO.getIdentifier());
			msgCD.setE02ACD("19");			
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (ESD000002Message) mp.receiveMessageRecord("ESD000002");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp"; 
			} else {
				pageName = "EPC0000_pc_codes_inq.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			session.setAttribute("cdCodes", msgCD);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			ESD000006Message msgCD = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgCD.setH06USR(user.getH01USR());
			msgCD.setH06PGM("EPC0000");
			msgCD.setH06TIM(getTimeStamp());
			msgCD.setH06WK1("M");
			msgCD.setH06SCR("01");
			msgCD.setH06OPE(opCode);
			msgCD.setE06ACC(userPO.getIdentifier());
			msgCD.setE06RTP("H");
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (ESD000006Message) mp.receiveMessageRecord("ESD000006");
			
			if (mp.hasError(msgError)) {
				pageName = "EPC0000_pc_enter_maint.jsp";
			} else {
				pageName = "EPC0000_pc_tit.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			session.setAttribute("cdTit", msgCD);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqSpecialCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			ESD000002Message msgCD = (ESD000002Message) mp.getMessageRecord("ESD000002");
			msgCD.setH02USR(user.getH01USR());
			msgCD.setH02PGM("EPC0000");
			msgCD.setH02TIM(getTimeStamp());
			msgCD.setH02WK1("M");
			msgCD.setH02SCR("01");
			msgCD.setH02OPE(opCode);
			msgCD.setE02ACC(userPO.getIdentifier());
			msgCD.setE02ACD("19");		
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (ESD000002Message) mp.receiveMessageRecord("ESD000002");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp"; 
			} else {
				pageName = "EPC0000_pc_codes.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			session.setAttribute("cdCodes", msgCD);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("INQUIRY");
		session.setAttribute("userPO", userPO);
		session.setAttribute("pcMant", new EPC000001Message());
		
		forward("EPC0000_pc_enter_inquiry.jsp", req, res);
	}

	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("pcMant", new EPC000001Message());
		
		forward("EPC0000_pc_enter_maint.jsp", req, res);
	}

	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setIdentifier(req.getParameter("E01PCMACC") == null ? "0" : req.getParameter("E01PCMACC"));
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPC0000", req);
			EPC000001Message msgPC = (EPC000001Message) mp.getMessageRecord("EPC000001");
			msgPC.setH01USERID(user.getH01USR());
			msgPC.setH01PROGRM("EPC0000");
			msgPC.setH01TIMSYS(getTimeStamp());
			msgPC.setH01SCRCOD("01");
			msgPC.setH01OPECOD("0002");
			try {
				msgPC.setE01PCMACC(userPO.getIdentifier());
			} catch (Exception e) {
				msgPC.setE01PCMACC("0");
			}
			
			mp.sendMessage(msgPC);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPC = (EPC000001Message) mp.receiveMessageRecord("EPC000001");
			
			if (mp.hasError(msgError)) {
				pageName = "EPC0000_pc_enter_maint.jsp";
			} else {
				pageName = "EPC0000_pc_maint.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			session.setAttribute("pcMant", msgPC);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}
