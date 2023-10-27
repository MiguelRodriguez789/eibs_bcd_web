package datapro.eibs.products;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD070001Message;
import datapro.eibs.beans.ESD071101Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD0700 extends JSEIBSServlet {

	protected static final int R_P_NEW 			= 2;
	protected static final int R_P_MAINT 		= 4;
	protected static final int R_P_DEL 			= 6;
	protected static final int A_P_NEW_MAINT	= 1;
	protected static final int R_P_SHOW 		= 100;
	protected static final int R_PROD_INQUIRY	= 200;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		screen = req.getParameter("SCREEN") == null ? R_P_SHOW : screen;
		
		switch (screen) {
			case R_P_SHOW :
				procReqProducts(user, req, res, session);
				break;
			case R_P_NEW :
				procReqNew(user, req, res, session);
				break;
			case R_P_MAINT :
				procReqMaint(user, req, res, session);
				break;
			case R_P_DEL :
				procReqDel(user, req, res, session);
				break;
			case A_P_NEW_MAINT :
				procActionNewMaint(user, req, res, session);
				break;
			case R_PROD_INQUIRY :
				procReqProdInquiry(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionNewMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("E01APCACD"));
		} catch (Exception e) {
			appCode = 0;
		}
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD070001Message msgProd = (ESD070001Message) mp.getMessageRecord("ESD070001");
			msgProd.setH01USERID(user.getH01USR());
			msgProd.setH01PROGRM("ESD0711");
			msgProd.setH01TIMSYS(getTimeStamp());
			msgProd.setH01SCRCOD("01");
			msgProd.setH01OPECOD("0005");
			
			setMessageRecord(req, msgProd);
			
			mp.sendMessage(msgProd);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgProd = (ESD070001Message) mp.receiveMessageRecord("ESD070001");
			
			session.setAttribute("error", msgError);
			session.setAttribute("prd", msgProd);
			
			if (mp.hasError(msgError)) {
				
				forward(getPageName(appCode, msgProd.getH01FLGWK3()), req, res);

			} else {
				res.setContentType("text/html");
				printCloseAndRefreshOpener(res.getWriter());
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqDel(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String typeCode = req.getParameter("typecode") == null ? "" : req.getParameter("typecode");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD070001Message msgProd = (ESD070001Message) mp.getMessageRecord("ESD070001");
			
			setMessageRecord(req, msgProd);
			
			msgProd.setH01USERID(user.getH01USR());
			msgProd.setH01PROGRM("ESD0711");
			msgProd.setH01TIMSYS(getTimeStamp());
			msgProd.setH01SCRCOD("01");
			msgProd.setH01OPECOD("0009");
			msgProd.setE01APCTYP(typeCode);
			msgProd.setE01APCCDE(prodCode);
			msgProd.setE01APCBNK(bank);
			
			mp.sendMessage(msgProd);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			}
			
			procReqProductDetails(req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("appcode"));
		} catch (Exception e) {
			appCode = 0;		
		}
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");
		String typeCode = req.getParameter("typecode") == null ? "" : req.getParameter("typecode");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD070001Message msgProd = (ESD070001Message) mp.getMessageRecord("ESD070001");
			msgProd.setH01USERID(user.getH01USR());
			msgProd.setH01PROGRM("ESD0711");
			msgProd.setH01TIMSYS(getTimeStamp());
			msgProd.setH01SCRCOD("01");
			msgProd.setH01OPECOD("0002");
			msgProd.setE01APCTYP(typeCode);
			msgProd.setE01APCCDE(prodCode);
			msgProd.setE01APCBNK(bank);
			
			mp.sendMessage(msgProd);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				procReqProductDetails(req, res);
			} else {
				UserPos userPO = getUserPos(req);
				userPO.setOption("PRODUCT");
				userPO.setPurpose("MAINTENANCE");
				userPO.setHeader2("DO_MAINT");
				userPO.setHeader3(webAppPath + getLangPath(user) + getPageName(appCode, msgProd.getH01FLGWK3()));
				userPO.setBank(msgProd.getE01APCBNK());
				userPO.setHeader15(msgProd.getE01APCTYP());
				userPO.setHeader16(msgProd.getE01APCTLN());

				session.setAttribute("userPO", userPO);
				session.setAttribute("prd", msgProd);
				procReqProductDetails(req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	private void procReqProdInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0700", req);
			ESD070001Message msgProd = (ESD070001Message) mp.getMessageRecord("ESD070001");
			msgProd.setH01USERID(user.getH01USR());
			msgProd.setH01PROGRM("ESD0700");
			msgProd.setH01TIMSYS(getTimeStamp());
			msgProd.setH01SCRCOD("01");
			msgProd.setH01OPECOD("0002");
			msgProd.setE01APCBNK(userPO.getBank());
			msgProd.setE01APCCDE(userPO.getProdCode());
			
			mp.sendMessage(msgProd);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				session.setAttribute("userPO", userPO);
				if (msgProd.getH01FLGWK3().trim().equals("G") || msgProd.getH01FLGWK3().trim().equals("V")) {
					forward("ESD0700_products_factoring_inquiry.jsp", req, res);
				} else {
					forward("ESD0700_products_loans.jsp?readOnly=true", req, res);
				}
			} else {	
				session.setAttribute("userPO", userPO);
				session.setAttribute("prd", msgProd);
				if (msgProd.getH01FLGWK3().trim().equals("G") || msgProd.getH01FLGWK3().trim().equals("V")) {
					forward("ESD0700_products_factoring_inquiry.jsp", req, res);
				} else {
					forward("ESD0700_products_loans.jsp?readOnly=true", req, res);
				}
			}
		} finally {
			if (mp != null) mp.close();
		}
	}


	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("appcode"));
		} catch (Exception e) {
			appCode = 0;		
		}
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("newprod") == null ? "" : req.getParameter("newprod");
		String typeCode = req.getParameter("typecode") == null ? "" : req.getParameter("typecode");
		String generic = req.getParameter("generic") == null ? "" : req.getParameter("generic");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD070001Message msgProd = (ESD070001Message) mp.getMessageRecord("ESD070001");
			msgProd.setH01USERID(user.getH01USR());
			msgProd.setH01PROGRM("ESD0711");
			msgProd.setH01TIMSYS(getTimeStamp());
			msgProd.setH01SCRCOD("01");
			msgProd.setH01OPECOD("0001");
			msgProd.setE01APCTYP(typeCode);
			msgProd.setE01APCCDE(prodCode);
			msgProd.setE01APCBNK(bank);
			
			mp.sendMessage(msgProd);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				procReqProductDetails(req, res);
			} else {
				msgProd = (ESD070001Message) msg;
				UserPos userPO = getUserPos(req);
				userPO.setOption("PRODUCT");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath + getLangPath(user) + getPageName(appCode, msgProd.getH01FLGWK3()));

				session.setAttribute("userPO", userPO);
				session.setAttribute("prd", msgProd);
				procReqProductDetails(req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
	}
	

	private String getPageName(int appCode, String flag) {
		String pageName = "";
		switch (appCode) {
			case 1 : // DDA Accounts
			case 2 :
			case 3 :
			case 5 :
				pageName = "ESD0700_products_dda.jsp";
				break;
			case 4 : //Savings
				pageName = "ESD0700_products_savingacct.jsp";
				break;
			case 6 : //Cuotas de Participacion
				pageName = "ESD0700_products_cp.jsp";
				break;
			case 10 : // Loans/Factoring
				if (flag.trim().equals("G") || flag.trim().equals("V")) {
					pageName = "ESD0700_products_factoring.jsp";
				} else {
					pageName = "ESD0700_products_loans.jsp";
				}
				break;
			case 11 :
			case 12 : // CD
			case 14 :
			case 15 :
				pageName = "ESD0700_products_tds.jsp";
				break;
			case 13 : // Investment 
				pageName = "ESD0700_products_investments.jsp";
				break;
			case 19 : // Proyect 
				pageName = "ESD0700_products_controlproyects.jsp";
				break;
			case 40 :
			case 41 : // LC
			case 42 :
				pageName = "ESD0700_products_lettersofcredit.jsp";
				break;
			case 43 :
				pageName = "ESD0700_boletasdegarantia.jsp";
				break;
			case 50 :
			case 51 : // Collections
				pageName = "ESD0700_products_collections.jsp";
				break;
			case 65 : // Bonds
			case 66 : 
			case 67 : 
			case 68 : 
				pageName = "ESD0700_products_portfolio.jsp";
				break;
			case 91 : // collaterals
				pageName = "ESD0700_products_collaterals.jsp";
				break;	
			case 94 : // Credit Cards
				pageName = "ESD0700_products_creditcards.jsp";
				break;
			case 97 : // Remanentes 
				pageName = "ESD0700_products_remanentes.jsp";						
				break;
			default :
				pageName = "ESD0700_products_generic.jsp";						
			break;
		}
		return pageName;
	}

	private void procReqProductDetails(HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		
		String appCode = req.getParameter("appcode");
		String bank = req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE");
		String typeCode = req.getParameter("typecode");
		String generic = req.getParameter("generic");
		String title = req.getParameter("title");

		String firstLink =
				getLangPath(req)
				+ "ESD0700_products_detail.jsp?bank="
				+ bank
				+ "&appcode="
				+ appCode
				+ "&typecode="
				+ typeCode
				+ "&generic="
				+ generic
				+ "&title="
				+ title
				+ "&sel="
				+ prodCode;
		res.sendRedirect(srctx + firstLink);
	}

	private void procReqProducts(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		String code = req.getParameter("TYPE") == null ? "" : req.getParameter("TYPE");
		
		String appCode = "ALL".equals(code) ? "" : code;
		String genCode = req.getParameter("GENERIC") == null ? "" : req.getParameter("GENERIC");
		
		String firstLink = "";
		JBObjList prodList = null;
		JBObjList subProdList = null;
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071101Message msgTree = (ESD071101Message) mp.getMessageRecord("ESD071101");
		 	msgTree.setE01USERID(user.getH01USR());
		 	msgTree.setE01SELACD(appCode);
		 	//mod EMAT 11/16/2001
		 	//parameter GENERIC = 'U' debts
		 	msgTree.setE01GENERI(genCode);
		
			mp.sendMessage(msgTree);
			
			JBObjList list = mp.receiveMessageRecordList("E01RECTYP");
			
			if (!list.isEmpty()) {
				JBObjList elemList = null;
				boolean firstTime = false;
				boolean firstfolder = true;
				list.initRow();
				while (list.getNextRow()) {
					msgTree = (ESD071101Message) list.getRecord();
					
					if ("0".equals(msgTree.getE01RECTYP())) {
						String titleFolder = msgTree.getE01DESCRI().trim();
						prodList = new JBObjList();
						subProdList = new JBObjList();
						elemList = new JBObjList();
						
						session.setAttribute("title", titleFolder);
						firstTime = false;
						firstfolder = true;
					} else if ("1".equals(msgTree.getE01RECTYP())) {
						prodList.addRow(msgTree);
						if (!firstfolder) {
							subProdList.addRow(elemList);
						}
						elemList = new JBObjList();
						if (firstfolder) {
							firstTime = true;
							firstfolder = false;
						}
					} else if ("2".equals(msgTree.getE01RECTYP())) {
						if (firstTime) {
							firstLink =
								webAppPath
									+ getLangPath(user)
									+ "ESD0700_products_detail.jsp?appcode="
									+ msgTree.getE01APCACD().trim()
									+ "&typecode="
									+ msgTree.getE01APCTYP().trim()
									+ "&generic="
									+ msgTree.getE01GENERI().trim()
									+ "&title="
									+ msgTree.getE01DESCRI().trim()
									+ "&bank="
									+ msgTree.getE01APCBNK();
							firstTime = false;
						}
						elemList.addRow(msgTree);
					} else {
						/*
						if (!elemList.getNoResult()) {
							subProdList.addRow(elemList);
							elemList = new JBObjList();
						}
						*/
					}
				}
				subProdList.addRow(elemList);
			}
			
			ELEERRMessage msgError = new ELEERRMessage();
			msgError.setERRNUM("0");
			userPO.setHeader2("");
			userPO.setType(genCode);
			userPO.setPurpose("MAINTENANCE");
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("prodList", prodList);
			session.setAttribute("subProdList", subProdList);

			res.setContentType("text/html");
			res.setHeader("Pragma", "No-cache");
			res.setDateHeader("Expires", 0);
			res.setHeader("Cache-Control", "no-cache");
			PrintWriter out = res.getWriter();
			printProdFrame(out, firstLink, getLangPath(user));
		
		} finally {
			if (mp != null) mp.close();
		}
	}

}
