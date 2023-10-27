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
import com.datapro.eibs.images.vo.SCNSIGRULHI;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.DataSignRulHI;
import datapro.eibs.beans.DataSignRule;
import datapro.eibs.beans.EDD550001Message;
import datapro.eibs.beans.EDI001001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0002DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageEnumerator;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEDD5500 extends JSEIBSServlet {

	// RETAIL ACCOUNTS

	protected static final int ENTER_NEW = 40;
	protected static final int ENTER_MAINT = 41;
	protected static final int R_RT_SIGN_RULES = 1;
	protected static final int A_RT_SIGN_RULES = 2;
	protected static final int I_RT_SIGN_RULES = 3;
	protected static final int R_RT_SIGNER_VAL = 18;
	protected static final int R_RT_SIGNERS = 19;
	protected static final int A_RT_SIGNERS = 20;
	protected static final int A_RT_SIGNERS_IMAGES = 30;
	protected static final int A_SAVE_IMAGE	= 31;
	protected static final int R_DATE = 10;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case ENTER_NEW:
				enterNew(user, req, res, session);
				break;
			case ENTER_MAINT:
				enterMaint(user, req, res, session);
				break;
			case R_RT_SIGN_RULES:
				getSignCategories(user, req, res, session);
				break;
			case A_RT_SIGN_RULES:
				procActSignRules(user, req, res, session);
				break;
			case I_RT_SIGN_RULES:
				procReqSignRules(user, req, res, session);
				break;
			case R_RT_SIGNER_VAL:
				valSigners(user, req, res, session);
				break;
			case R_RT_SIGNERS:
				procReqSignerList(user, req, res, session);
				break;
			case A_RT_SIGNERS:
				procActionSigners(user, req, res, session);
				break;
			case A_RT_SIGNERS_IMAGES:
				procReqSignImages(user, req, res, session);
				break;
			case A_SAVE_IMAGE:
				saveSignImage(user, req, res, session);
				break;
			case R_DATE:
				procGetDates(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}


	private void saveSignImage(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		UserPos userPO = getUserPos(req);
		String url = "";
		String type = "";
		if (JSEIBSProp.getImageRemote()) {
			url = JSEIBSProp.getScanURL();
		} else {
			url = getServerRoot(req) + webAppPath + "/servlet/datapro.eibs.tools.JSScanDocDone";
		}
		
		int row = 0;
		try {
			row = Integer.parseInt(req.getParameter("ROW"));
		} catch (Exception e) {
			row = 0;
		}
		JBObjList signersList = (JBObjList) session.getAttribute("signersList");
		signersList.setCurrentRow(row);
		EDD550001Message rtFirm = (EDD550001Message) signersList.getRecord();
		
		//session.setAttribute("currentSigner",rtFirm);
		int colNum = 12;
		String myRow[] = new String[colNum];
 		for (int i = 0; i < colNum; i++) {
			myRow[i] = "";
		}
 		
		JBListRec jbList = new JBListRec();
		jbList.init(colNum);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD5500", req);
			EDD550001Message msgSend = (EDD550001Message) mp.getMessageRecord("EDD550001", user.getH01USR(), "");
			
			MessageEnumerator me = (MessageEnumerator) rtFirm.fieldEnumeration();
			while (me.hasMoreElements()){
				MessageField field = (MessageField) me.nextElement();
				msgSend.getField(field.getTag()).setString(field.getString());
			}
			
			msgSend.setH01USR(user.getH01USR());
		    msgSend.setH01OPE("0008");
		    msgSend.setE01TBLNUM(rtFirm.getE01TBLNUM());
			msgSend.setE01TBLSEQ(rtFirm.getE01TBLSEQ());
			msgSend.setH01USR(user.getH01USR());
			msgSend.setE01RCN(rtFirm.getE01RCN());
			
			mp.sendMessage(msgSend);
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if (mp.hasError(newmessage)) {
				ELEERRMessage msgError = (ELEERRMessage) newmessage;
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			} else {
				if (newmessage.getFormatName().equals("EDI001001")) {
					EDI001001Message msgDim = (EDI001001Message) newmessage;
					type = msgDim.getH01FLGWK2();
					myRow[0] = type + "_" + rtFirm.getE01RCN().trim()
							+ "_" + msgDim.getE01DCITNU().trim() 
							+ "_" + msgDim.getE01DCISEQ().trim();
					myRow[1]  = msgDim.getE01DCITNU();
					myRow[2]  = msgDim.getE01DCISEQ();
					myRow[3]  = msgDim.getE01DCIDES();
					myRow[4]  = msgDim.getE01DCIFRE();
					myRow[5]  = msgDim.getE01DCISTA();
					myRow[6]  = msgDim.getE01DCIPAG();
					myRow[7]  = msgDim.getE01DCITYP();
					myRow[8]  = msgDim.getE01DCIDSQ();
					myRow[9]  = msgDim.getE01DCIEXM();
					myRow[10] = msgDim.getE01DCIEXD();
					myRow[11] = msgDim.getE01DCIEXY();
					session.setAttribute("currentSigner",rtFirm);
					
					// put signer in maintenance
					msgSend = (EDD550001Message) mp.getMessageRecord("EDD550001", user.getH01USR(), "");
					me = (MessageEnumerator) rtFirm.fieldEnumeration();
					while (me.hasMoreElements()){
				       MessageField field = (MessageField) me.nextElement();
				       msgSend.getField(field.getTag()).setString(field.getString());
			        }
					msgSend.setH01USR(user.getH01USR());
					msgSend.setH01PGM("EDD5500");
					msgSend.setH01TIM(getTimeStamp());
					msgSend.setH01SCR("01");
					msgSend.setH01OPE("0002");
					msgSend.setE01RTP("S");
					msgSend.setE01RTY("I");
					
					mp.sendMessage(msgSend);
					
					ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
					msgSend = (EDD550001Message) mp.receiveMessageRecord("EDD550001");
					
					if (!mp.hasError(msgError)) {
						// save Image on eibsImage DB
						userPO.setRedirect("/servlet/datapro.eibs.products.JSEDD5500?SCREEN=19&opt=MAINT");
						session.setAttribute("userPO", userPO);
						
						res.sendRedirect(srctx + 
								"/servlet/datapro.eibs.tools.JSScan?Name="
									+ myRow[0]
									+ "&DSQ="
									+ myRow[8]
									+ "&URL="
									+ url
									+ "?USERID="
									+ user.getH01USR()
									+ "@NUMBER="
									+ rtFirm.getE01RCN()
									+ "@TYPE="
									+ type
									+ "@ADD="
									+ myRow[0]
									+ "@TNU="
									+ myRow[1]
									+ "@SEQ="
									+ myRow[2]
									+ "@DES="
									+ myRow[3].trim().replace(' ', '^')
									+ "@FRE="
									+ myRow[4]
									+ "@TYP="
									+ myRow[7]);
					} else {
						session.setAttribute("userPO", userPO);
						session.setAttribute("error", msgError);
						forward("EDD0000_rt_signers_list.jsp", req, res);
					}
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procGetDates(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		UserPos userPO = getUserPos(req);
		
		userPO.setHeader22(req.getParameter("dateF"));
		userPO.setHeader23(req.getParameter("dateT"));
		
		session.setAttribute("userPO", userPO);
		forward("EDD0000_rt_sign_rules_list_his.jsp", req, res);
			
	}


	private void procReqSignImages(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		UserPos userPO = getUserPos(req);
		if (userPO.getHeader5().equals("MAINT")) {
			userPO.setPurpose("MAINT");
		} else {
			userPO.setPurpose("INQUIRY");
		}
		session.setAttribute("userPO", userPO);
		int row = 0;
		try {
			row = Integer.parseInt(req.getParameter("ROW"));
		} catch (Exception e) {
			row = 0;
		}
		JBObjList signersList = (JBObjList) session.getAttribute("signersList");
		signersList.setCurrentRow(row);
		EDD550001Message rtFirm = (EDD550001Message) signersList.getRecord();
		String tbltyp=rtFirm.getE01TBLACT();
		String tblacc=rtFirm.getE01RCN();
		String tbltnu=rtFirm.getE01TBLNUM();
		String tblseq=rtFirm.getE01TBLSEQ();
		session.setAttribute("rtFirm", rtFirm);
		res.sendRedirect(srctx + "/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=6&tbltyp="+tbltyp+"&tblacc="+tblacc+"&tbltnu="+tbltnu+"&tblseq="+tblseq);
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
		userPO.setPurpose(req.getParameter("opt"));

		if (userPO.getAccNum() == null) {
			if (req.getParameter("E01ACMACC") != null) {
				userPO.setAccNum(req.getParameter("E01ACMACC"));
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
				}
			} else {
				if (!list.isEmpty()) {
					msgRT = (EDD550001Message) list.get(0);
					if (userPO.getCusNum() == null || userPO.getCusNum().equals("")) {
						userPO.setCusNum(msgRT.getE01CUS());
						userPO.setCusName(msgRT.getE01NA1());						
					}
					if (userPO.getCurrency() == null || userPO.getCurrency().equals("")) {
						userPO.setCurrency(msgRT.getE01CCY());						
					}
					if (userPO.getProdCode() == null || userPO.getProdCode().equals("")) {
						userPO.setProdCode(msgRT.getE01PRD());						
					}
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


	private void valSigners(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String prevStatus = req.getParameter("E01RTY") == null ? "" : req.getParameter("E01RTY");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD5500", req);
			EDD550001Message msgRT = (EDD550001Message) mp.getMessageRecord("EDD550001", user.getH01USR(), "");
			msgRT.setH01USR(user.getH01USR());
			msgRT.setH01SCR("01");
			msgRT.setH01OPE("0007");
			msgRT.setE01RTP("S");
			msgRT.setE01CUN(userPO.getAccNum());
			
			setMessageRecord(req, msgRT);
			
			if (!prevStatus.equals("N")) msgRT.setE01RTY("M"); // Maintenance
			msgRT.setE01BNI(msgRT.getE01BNI().replace('*', ' '));
			
			mp.sendMessage(msgRT);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD550001Message) mp.receiveMessageRecord("EDD550001");

			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			session.setAttribute("rtFirm", msgRT);
			
			if (mp.hasError(msgError)) {
				req.setAttribute("OPTION", "7");
			} else {
				req.setAttribute("OPTION", "1");
			}
			forward("EDD0000_rt_signers.jsp", req, res);
			
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


	private void procReqSignRules(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
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


	private void getSignCategories(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String codeflag = req.getParameter("Type") == null ? "FI" : req.getParameter("Type");
		String action = req.getParameter("ACTION") == null ? "" : req.getParameter("ACTION");
		String ope = req.getParameter("OPE") == null ? "" : req.getParameter("OPE");
		UserPos userPO = getUserPos(req);
		userPO.setHeader11(action);
		userPO.setHeader12(ope);
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
			if (!ope.equals("H")){
				procReqSignRules(user, req, res, session);
			}else{
				procReqSignRulesHis(user, req, res, session);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void enterMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		req.setAttribute("OPTION", "2");
		forward("EDD0000_rt_signers.jsp", req, res);
	}


	private void enterNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		req.setAttribute("OPTION", "7");
		forward("EDD0000_rt_signers.jsp", req, res);
	}
	
	private void procReqSignRulesHis(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		FAImage facade = new FAImage();
		try {
			JBObjList beanList = new JBObjList();
			BeanList list = facade.getSignRuleListHI(userPO.getAccNum().toString());
			list.initRow();
			while (list.getNextRow()) {
				SCNSIGRULHI vo = (SCNSIGRULHI) list.getRecord();
				DataSignRulHI dsr = new DataSignRulHI();
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
				dsr.setRulelmu(vo.getRULELMU());
				dsr.setRulelmm(vo.getRULELMM());
				dsr.setRulelmd(vo.getRULELMD());
				dsr.setRulelmy(vo.getRULELMY());
				dsr.setRulelmt(vo.getRULELMT());
				
				beanList.addRow(dsr);
			}
			
			session.setAttribute("rulesListH", beanList);
			forward("EDD0000_rt_sign_rules_list_his.jsp", req, res);
			
		} catch (Exception e) {
			flexLog(e.getClass().getName() + " ocurred, Error: " + e.getMessage());
			throw new ServletException(e);
		}
	}


}
