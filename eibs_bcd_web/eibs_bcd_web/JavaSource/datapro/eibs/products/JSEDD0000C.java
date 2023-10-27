package datapro.eibs.products;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.facade.FAImage;
import com.datapro.eibs.images.vo.SCNSIGRULES;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.DataSignRule;
import datapro.eibs.beans.EDD550001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0002DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageContext;

public class JSEDD0000C extends JSEIBSServlet {

	protected static final int R_RT_SIGN_RULES 	= 1;
	protected static final int A_RT_SIGN_RULES 	= 2;
	protected static final int I_RT_SIGN_RULES 	= 3;
	protected static final int R_RT_SIGNERS 	= 19;
	protected static final int A_RT_SIGNERS 	= 20;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_RT_SIGN_RULES:
				getSignCategories(user, req, res, session);
				break;
			case A_RT_SIGN_RULES:
				procActSignRules(user, req, res, session);
				break;
			case I_RT_SIGN_RULES :
				procReqSignRules(user, req, res, session);
				break;
			case R_RT_SIGNERS:
				procReqSignerList(user, req, res, session);
				break;
			case A_RT_SIGNERS:
				procActionSigners(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionSigners(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		UserPos userPO = getUserPos(req);
		JBObjList signersList = (JBObjList) session.getAttribute("signersList");
		String opt = req.getParameter("OPTION") == null ? "0" : req.getParameter("OPTION").trim();
		String opecode = "000" + opt;
		// Send Initial data
		// 0009 - Delete
		// 0001 - New
		// 0002 - Maintenance
		String prevStatus = "";
		int row = 0;

		String mod = req.getParameter("mod") == null ? "XX" : req.getParameter("mod");
		
		try {
			row = Integer.parseInt(req.getParameter("ROW"));
		} catch (Exception e) {
			row = 0;
		}
		
		EDD550001Message msgRT = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD5500", req);
			if (opecode.equals("0009")) {
				signersList.setCurrentRow(row);
				msgRT = (EDD550001Message) signersList.getRecord();
				msgRT.setH01USR(user.getH01USR());
				msgRT.setH01PGM("EDD5500");
				msgRT.setH01TIM(getTimeStamp());
				msgRT.setH01SCR("01");
				msgRT.setH01OPE(opecode);
				msgRT.setE01RTP("S");
				prevStatus = msgRT.getE01RTY();
				msgRT.setE01RTY("D"); // Delete
			} else {
				msgRT = (EDD550001Message) mp.getMessageRecord("EDD550001", user.getH01USR(), "");
				msgRT.setH01USR(user.getH01USR());
				msgRT.setH01PGM("EDD5500");
				msgRT.setH01TIM(getTimeStamp());
				msgRT.setH01SCR("01");
				msgRT.setH01OPE(opecode);
				msgRT.setE01RTP("S");
				prevStatus = "N".equals(req.getParameter("E01RTY")) ? "N" : "M"; // Default is Maintenance
				
				setMessageRecord(req, msgRT);
				msgRT.setE01RTY(prevStatus); 
			}
			
			mp.sendMessage(msgRT);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD550001Message) mp.receiveMessageRecord("EDD550001");
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
			if (opecode.equals("0009")) {
				if (!mp.hasError(msgError)) {
					signersList.setRecord(msgRT, row);
					session.setAttribute("signersList", signersList);
				}
				forward("EDD0000_rt_signers_list.jsp", req, res);
			} else {
				if (!mp.hasError(msgError)) {
					if (opecode.equals("0001")) {
						signersList.addRow(msgRT);
					} else {
						signersList.setRecord(msgRT, row);
					}
					session.setAttribute("signersList", signersList);

					res.setContentType("text/html");
					String url = req.getContextPath()
							+ "/servlet/datapro.eibs.products.JSEDD5500?SCREEN=19&opt=MAINT&mod="+mod.trim();
					PrintWriter out = res.getWriter();
					out.println("<HTML>");
					out.println("<HEAD>");
					out.println("<TITLE>Close</TITLE>");
					out.println("</HEAD>");
					out.println("<BODY>");
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println("		top.opener.document.location = '" + url
							+ "'");
					out.println("		top.close();");
					out.println("</SCRIPT>");
					out.println("<P>Close it!!!</P>");
					out.println("</BODY>");
					out.println("</HTML>");
					out.close();
				} else {
					session.setAttribute("rtFirm", msgRT);
					req.setAttribute("OPTION", opt);
					forward("EDD0000_rt_signers.jsp", req, res);
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqSignerList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		String opt = ""; // MAINT=Maintenance, VIEW=Inquiry
		
		opt = req.getParameter("opt") == null ? "MANT" : req.getParameter("opt");
		userPO.setHeader5(opt);

		if (req.getParameter("E01ACMACC") != null) {
			userPO.setAccNum(req.getParameter("E01ACMACC"));
		}

		if (userPO.getAccNum().equals("0")) {
			if (req.getParameter("NameSearch") != null) {
				userPO.setAccNum(req.getParameter("NameSearch"));
			}
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD5500", req);
			EDD550001Message msgRT = (EDD550001Message) mp.getMessageRecord("EDD550001", user.getH01USR(), "");
			msgRT.setH01USR(user.getH01USR());
			msgRT.setH01PGM("EDD5500");
			msgRT.setH01TIM(getTimeStamp());
			msgRT.setH01SCR("01");
			msgRT.setH01OPE("0004");
			msgRT.setE01CUN(userPO.getAccNum());
			msgRT.setE01RTP("S");
			
			mp.sendMessage(msgRT);
			
			JBObjList list = mp.receiveMessageRecordList("H01MAS");
			ELEERRMessage msgError = new ELEERRMessage(); 
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				if (userPO.getOption().equals("RT")) {
					PageToCall = "EDD0000_rt_basic.jsp";
				} else if (userPO.getOption().equals("SV")) {	
					PageToCall = "EDD0000_sv_basic.jsp";
				} else {
					PageToCall = "error_viewer.jsp";
				}
			} else {
				if (!list.isEmpty()) {
					msgRT = (EDD550001Message) list.get(0);
					userPO.setHeader2(msgRT.getE01CUS());
					userPO.setHeader3(msgRT.getE01NA1());
					userPO.setCurrency(msgRT.getE01CCY());
					userPO.setHeader1(msgRT.getE01PRD());
					userPO.setPurpose(msgRT.getH01WK1());
				}
				session.setAttribute("signersList", list);
				PageToCall = "EDD0000_rt_signers_list.jsp";
			}

			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActSignRules(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String acc = "";
		String rule = "";
		String ccycode = "";
		String amount = "";
		String dayto = "";
		String monthto = "";
		String yearto = "";
		String yearfrom = "";
		String monthfrom = "";
		String dayfrom = "";
		String status = "";
		String branch = "";
		String docnum = "";
		JBObjList rulesList = (JBObjList) session.getAttribute("rulesList");
		FAImage facade = new FAImage();
		try {
			int accion = 0;
			try {
				accion = Integer.parseInt(req.getParameter("accion"));
			} catch (Exception e) {
				accion = 0;
			}
			int idx = 0;
			try {
				idx = Integer.parseInt(req.getParameter("ROW"));
			} catch (Exception e) {
				idx = 0;
			}
			SCNSIGRULES vo = null;
			if (accion != 3) {
				acc = req.getParameter("ACCUID");
				rule = req.getParameter("SIGRULE");
				amount = req.getParameter("AMOUNT");
				ccycode = req.getParameter("CCYCODE");
				yearto = Util.formatYear(req.getParameter("YEARTO"));
				monthto = "" + Integer.parseInt(req.getParameter("MONTHTO"));
				dayto = "" + Integer.parseInt(req.getParameter("DAYTO"));
				yearfrom = Util.formatYear(req.getParameter("YEARFROM"));
				monthfrom = "" + Integer.parseInt(req.getParameter("MONTHFROM"));
				dayfrom = "" + Integer.parseInt(req.getParameter("DAYFROM"));
				branch = req.getParameter("BRANCH");
				status = req.getParameter("STATUS");
				docnum = req.getParameter("DOCNUM");

				double damt = Util.parseCCYtoDouble(amount);
				amount = new BigDecimal(damt).setScale(2, BigDecimal.ROUND_CEILING).toString();
				
				vo = new SCNSIGRULES();
				vo.setACCUID(new BigDecimal(acc));
				vo.setSIGRULE(rule);
				vo.setCCYCODE(ccycode);
				vo.setAMOUNT(new BigDecimal(damt).setScale(2, BigDecimal.ROUND_CEILING));
				vo.setDAYFROM(new BigDecimal(dayfrom));
				vo.setMONTHFROM(new BigDecimal(monthfrom));
				vo.setYEARFROM(new BigDecimal(yearfrom));
				vo.setDAYTO(new BigDecimal(dayto));
				vo.setMONTHTO(new BigDecimal(monthto));
				vo.setYEARTO(new BigDecimal(yearto));
				if (status != null) vo.setSTATUS(status);
				if (branch != null)	vo.setBRANCH(branch);
				if (docnum != null)	vo.setDOCNUM(new BigDecimal(docnum));
			}
			
			DataSignRule dsr;
			int error = 0;
			switch (accion) {
				case 1: // New
					if (facade.existRule(acc, rule, ccycode)) {
						error = 1;
					} else {
						facade.insertSignRule(vo);
					}
					break;
				case 2: // Maintenance
					rulesList.setCurrentRow(idx - 1);
					dsr = (DataSignRule) rulesList.getRecord();
					if (dsr.getSigRule().equals(rule) && dsr.getCCYCode().equals(ccycode)) { // Update rule
						facade.updateSignRule(vo);
					} else { // Modify rule
						facade.deleteSignRule(acc, dsr.getSigRule(), dsr.getCCYCode());
						facade.insertSignRule(vo);
					}
					break;
				case 3: // Delete
					rulesList.setCurrentRow(idx);
					dsr = (DataSignRule) rulesList.getRecord();
					facade.deleteSignRule(dsr.getAccUid().trim(), dsr.getSigRule().trim(), dsr.getCCYCode().trim());
					break;
				default:
					forward(devPage, req, res);
					break;
			}
			
			String urlpage = "";
			switch (accion) {
				case 1:
				case 2:
					if (error == 0) {
						res.setContentType("text/html");
						PrintWriter out = res.getWriter();
						out.println("<HTML>");
						out.println("<HEAD>");
						out.println("<TITLE>Close</TITLE>");
						out.println("</HEAD>");
						out.println("<BODY>");
						out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
						out.println("		top.opener.document.forms[0].SCREEN.value = '3';");
						out.println("		top.opener.document.forms[0].submit();");
						out.println("		top.close();");
						out.println("</SCRIPT>");
						out.println("<P>Close it!!!</P>");
						out.println("</BODY>");
						out.println("</HTML>");
						out.close();
					} else {
						urlpage = "EDD0000_rt_sign_rules_maint.jsp?ERROR=" + error + "&RULE=" + rule + "&AMOUNT=" + amount;
						if (accion == 2)
							urlpage += "&ROW=" + idx;
						forward(urlpage, req, res);
					}
					break;
				case 3:
					if (error != 0) {
						urlpage = "EDD0000_rt_sign_rules_list.jsp?ERROR=" + error;
						forward(urlpage, req, res);
					} else {
						procReqSignRules(user, req, res, session);
					}	
					break;
			}
			
		} catch (Exception e) {
			flexLog(e.getClass().getName() + " ocurred, Error: " + e.getMessage());
			throw new ServletException(e);
		}
	}

	private void getSignCategories(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String codeflag = req.getParameter("Type") == null ? "FI" : req.getParameter("Type");
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0002", req);
			EWD0002DSMessage msgHelp = (EWD0002DSMessage)  mp.getMessageRecord("EWD0002DS", user.getH01USR(), "");
			msgHelp.setEWDTBL(codeflag);
			msgHelp.setEWDSHO("");
			msgHelp.setEWDSHN("");
			msgHelp.setEWDREC("0");
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
			} else {
				session.setAttribute("categList", list);
			}
			procReqSignRules(user, req, res, session);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqSignRules(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
		
		UserPos userPO = getUserPos(req);
		FAImage facade = new FAImage();
		try {
			JBObjList beanList = new JBObjList();
			BeanList list = facade.getSignRuleList(userPO.getAccNum());
			list.initRow();
			while (list.getNextRow()) {
				SCNSIGRULES vo = (SCNSIGRULES) list.getRecord();
				DataSignRule dsr = new DataSignRule();
				dsr.setAccUid(vo.getACCUID().toString());
				dsr.setSigRule(vo.getSIGRULE().trim());
				String amount = vo.getAMOUNT() == null ? "0.00" : vo.getAMOUNT().toString();
				dsr.setAmount(amount);
				dsr.setCCYCode(vo.getCCYCODE());
				String dayto = vo.getDAYTO() == null ? "0" : vo.getDAYTO().toString();
				dsr.setDayTo(dayto);
				String monthto = vo.getMONTHTO() == null ? "0" : vo.getMONTHTO().toString();
				dsr.setMonthTo(monthto);
				String yearto = vo.getYEARTO() == null ? "0" : vo.getYEARTO().toString();
				dsr.setYearTo(yearto);
				String dayfrom = vo.getDAYFROM() == null ? "0" : vo.getDAYFROM().toString();
				dsr.setDayFrom(dayfrom);
				String monthfrom = vo.getMONTHFROM() == null ? "0" : vo.getMONTHFROM().toString();
				dsr.setMonthFrom(monthfrom);
				String yearfrom = vo.getYEARFROM() == null ? "0" : vo.getYEARFROM().toString();
				dsr.setYearFrom(yearfrom);
				dsr.setStatus(vo.getSTATUS());
				dsr.setModApproved(vo.getMODAPPROVED());
				dsr.setTypeMaint(vo.getTYPEMAINT());
				dsr.setBranch(vo.getBRANCH());
				String docnum = vo.getDOCNUM() == null ? "0" : vo.getDOCNUM().toString();
				dsr.setDocNum(docnum);

				beanList.addRow(dsr);
			}
			
			session.setAttribute("rulesList", beanList);
			forward("EDD0000_rt_sign_rules_list.jsp", req, res);
			
		} catch (Exception e) {
			flexLog(e.getClass().getName() + " ocurred, Error: " + e.getMessage());
			throw new ServletException(e);
		}
	}

}
