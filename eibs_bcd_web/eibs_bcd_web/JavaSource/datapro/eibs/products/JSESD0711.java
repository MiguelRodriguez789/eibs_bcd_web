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
import datapro.eibs.beans.ESD071103Message;
import datapro.eibs.beans.ESD071104Message;
import datapro.eibs.beans.ESD071105Message;
import datapro.eibs.beans.ESD071106Message;
import datapro.eibs.beans.ESD071110Message;
import datapro.eibs.beans.ESD071111Message;
import datapro.eibs.beans.ESD071113Message;
import datapro.eibs.beans.ESD071119Message;
import datapro.eibs.beans.ESD071150Message;
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
public class JSESD0711 extends JSEIBSServlet {

	protected static final int R_P_AUDIO = 2;
	protected static final int R_P_VIDEO = 4;
	protected static final int R_P_HTML = 6;
	protected static final int R_P_INQUIRY = 8;
	protected static final int R_P_NEW = 10;
	protected static final int R_P_SHOW = 100;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		screen = req.getParameter("SCREEN") == null ? R_P_SHOW : screen;

		switch (screen)	{
			case R_P_SHOW :
				procReqProducts(user, req, res, session);
				break;
			case R_P_NEW :
				procReqNew(user, req, res, session);
				break;
			case R_P_INQUIRY :
				procReqInq(user, req, res, session);
				break;
			case R_P_AUDIO :
			case R_P_VIDEO :
			case R_P_HTML :
				procReqMedia(user, req, res, session, screen);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqMedia(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		String bank = req.getParameter("bank") == null ? "01" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");
		String typeCode = req.getParameter("typecode") == null ? "" : req.getParameter("typecode");
		//String appCode = req.getParameter("appcode") == null ? "" : req.getParameter("appcode");
		//String generic = req.getParameter("generic") == null ? "" : req.getParameter("generic");
		//String title = req.getParameter("title") == null ? "" : req.getParameter("title");
		//String opCode = "0004";

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071150Message msgMedia = (ESD071150Message) mp.getMessageRecord("ESD071150");
			msgMedia.setE50USERID(user.getH01USR());
			try {
				msgMedia.setE50APECDE(prodCode);
			} catch (Exception e) {
				msgMedia.setE50APECDE("");
			}
			try {
				msgMedia.setE50APETYP(typeCode);
			} catch (Exception e) {
				msgMedia.setE50APETYP("");
			}
			try {
				msgMedia.setE50APEBNK(bank);
			} catch (Exception e) {
				msgMedia.setE50APEBNK("01");
			}
			
			mp.sendMessage(msgMedia);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				//ELEERRMessage msgError = (ELEERRMessage) msg;
				procReqProductDetails(req, res);
			} else {
				msgMedia = (ESD071150Message) msg;
				String fileName = null;
				switch (screen)	{
					case R_P_AUDIO :
						fileName = msgMedia.getE50APEAUD().trim(); // "phrase_01.au"; //msgMedia.getE50APEAUD().trim();
						break;
					case R_P_VIDEO :
						fileName = msgMedia.getE50APEVID().trim();
						break;
					case R_P_HTML :
						fileName = msgMedia.getE50APEHTM().trim();
						if (!fileName.equals("")) {
							userPO.setHeader2("DO_HTML");
							userPO.setHeader3(webAppPath + getLangPath(user) + "media/" + fileName);
							session.setAttribute("userPO", userPO);
							fileName = "";
						}
						break;
					default :
						break;
				}
				
				//URL url = new URL(getServerRoot(req) + webAppPath + getLangPath(user) + "media/" + fileName);
				//InputStream inputstream = url.openStream();
				if ("".equals(fileName)) {
					procReqProductDetails(req, res);
				} else {
					res.sendRedirect(srctx + getLangPath(user) + "media/" + fileName);
				}
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqInq(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException {
		
		UserPos userPO = getUserPos(req);
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("appcode"));
			userPO.setOption("PRODUCTS");
			userPO.setPurpose("");
			session.setAttribute("userPO", userPO);
			
			switch (appCode) {
				case 1 : // DDA Accounts
				case 2 :
				case 3 :
				case 4 :
				case 5 :
					procReqProductDDA(user, req, res, session);
					break;
				case 6 : // Accounts Cuotas de Participacion     PCL01
					procReqProductCP(user, req, res, session);
					break;
				case 10 :
					procReqProductLN(user, req, res, session);
					break;
				case 11 :
				case 12 :
				case 14 :
				case 15 : // CD
					procReqProductCD(user, req, res, session);
					break;
				case 13 : // Inv 
					procReqProductINV(user, req, res, session);
					break;
				case 19 : // Proy 
					procReqProductPRY(user, req, res, session);
					break;
				case 40 :
				case 41 : // LC
				case 42 :
				case 43 :
					procReqProductLC(user, req, res, session);
					break;
				case 50 :
				case 51 : // Collections
					procReqProductCOL(user, req, res, session);
					break;
				case 91 : // Collaterals 
					procReqProductCollaterals(user, req, res, session);
					break;
				default :
					procReqProductDetails(req, res);
					break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
	}

	private void procReqProductCollaterals(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071119Message msgProdPRY = (ESD071119Message) mp.getMessageRecord("ESD071119");
			msgProdPRY.setH19USERID(user.getH01USR());
			msgProdPRY.setH19PROGRM("ESD0711");
			msgProdPRY.setH19TIMSYS(getTimeStamp());
			msgProdPRY.setH19SCRCOD("01");
			msgProdPRY.setH19OPECOD("0004");
			msgProdPRY.setE19APCCDE(prodCode);
			msgProdPRY.setE19APCBNK(bank);
			
			mp.sendMessage(msgProdPRY);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else if (msg.getFormatName().equals("ESD071119")) {
				session.setAttribute("pryProdInq", msg);
				userPO.setHeader2("DO_INQ");
				userPO.setHeader3(webAppPath + getLangPath(user) + "ESD0711_products_inq_collaterals.jsp");
				session.setAttribute("userPO", userPO);
			} else {
				throw new ServletException(msg.getFormatName() + " is a bad message format for this option.");
			}
			procReqProductDetails(req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqProductCOL(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071105Message msgProdCOL = (ESD071105Message) mp.getMessageRecord("ESD071105");
			msgProdCOL.setH05USERID(user.getH01USR());
			msgProdCOL.setH05PROGRM("ESD0711");
			msgProdCOL.setH05TIMSYS(getTimeStamp());
			msgProdCOL.setH05SCRCOD("01");
			msgProdCOL.setH05OPECOD("0004");
			msgProdCOL.setE05APCCDE(prodCode);
			msgProdCOL.setE05APCBNK(bank);
			
			mp.sendMessage(msgProdCOL);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else if (msg.getFormatName().equals("ESD071105")) {
				session.setAttribute("colProdInq", msg);
				userPO.setHeader2("DO_INQ");
				userPO.setHeader3(webAppPath + getLangPath(user) + "ESD0711_products_inq_col.jsp");
				session.setAttribute("userPO", userPO);
			} else {
				throw new ServletException(msg.getFormatName() + " is a bad message format for this option.");
			}
			procReqProductDetails(req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqProductLC(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071104Message msgProdLC = (ESD071104Message) mp.getMessageRecord("ESD071104");
			msgProdLC.setH04USERID(user.getH01USR());
			msgProdLC.setH04PROGRM("ESD0711");
			msgProdLC.setH04TIMSYS(getTimeStamp());
			msgProdLC.setH04SCRCOD("01");
			msgProdLC.setH04OPECOD("0004");
			msgProdLC.setE04APCCDE(prodCode);
			msgProdLC.setE04APCBNK(bank);
			
			mp.sendMessage(msgProdLC);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else if (msg.getFormatName().equals("ESD071104")) {
				session.setAttribute("lcProdInq", msg);
				userPO.setHeader2("DO_INQ");
				userPO.setHeader3(webAppPath + getLangPath(user) + "ESD0711_products_inq_lc.jsp");
				session.setAttribute("userPO", userPO);
			} else {
				throw new ServletException(msg.getFormatName() + " is a bad message format for this option.");
			}
			procReqProductDetails(req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqProductPRY(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071119Message msgProdPRY = (ESD071119Message) mp.getMessageRecord("ESD071119");
			msgProdPRY.setH19USERID(user.getH01USR());
			msgProdPRY.setH19PROGRM("ESD0711");
			msgProdPRY.setH19TIMSYS(getTimeStamp());
			msgProdPRY.setH19SCRCOD("01");
			msgProdPRY.setH19OPECOD("0004");
			msgProdPRY.setE19APCCDE(prodCode);
			msgProdPRY.setE19APCBNK(bank);
			
			mp.sendMessage(msgProdPRY);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else if (msg.getFormatName().equals("ESD071119")) {
				session.setAttribute("pryProdInq", msg);
				userPO.setHeader2("DO_INQ");
				userPO.setHeader3(webAppPath + getLangPath(user) + "ESD0711_products_inq_proy.jsp");
				session.setAttribute("userPO", userPO);
			} else {
				throw new ServletException(msg.getFormatName() + " is a bad message format for this option.");
			}
			procReqProductDetails(req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqProductINV(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071113Message msgProdINV = (ESD071113Message) mp.getMessageRecord("ESD071113");
			msgProdINV.setH13USERID(user.getH01USR());
			msgProdINV.setH13PROGRM("ESD0711");
			msgProdINV.setH13TIMSYS(getTimeStamp());
			msgProdINV.setH13SCRCOD("01");
			msgProdINV.setH13OPECOD("0004");
			msgProdINV.setE13APCCDE(prodCode);
			msgProdINV.setE13APCBNK(bank);
			
			mp.sendMessage(msgProdINV);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else if (msg.getFormatName().equals("ESD071113")) {
				session.setAttribute("invProdInq", msg);
				userPO.setHeader2("DO_INQ");
				userPO.setHeader3(webAppPath + getLangPath(user) + "ESD0711_products_inq_inv.jsp");
				session.setAttribute("userPO", userPO);
			} else {
				throw new ServletException(msg.getFormatName() + " is a bad message format for this option.");
			}
			procReqProductDetails(req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqProductCD(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071111Message msgProdCD = (ESD071111Message) mp.getMessageRecord("ESD071111");
			msgProdCD.setH11USERID(user.getH01USR());
			msgProdCD.setH11PROGRM("ESD0711");
			msgProdCD.setH11TIMSYS(getTimeStamp());
			msgProdCD.setH11SCRCOD("01");
			msgProdCD.setH11OPECOD("0004");
			msgProdCD.setE11APCCDE(prodCode);
			msgProdCD.setE11APCBNK(bank);
			
			mp.sendMessage(msgProdCD);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else if (msg.getFormatName().equals("ESD071111")) {
				session.setAttribute("cdProdInq", msg);
				userPO.setHeader2("DO_INQ");
				userPO.setHeader3(webAppPath + getLangPath(user) + "ESD0711_products_inq_cd.jsp");
				session.setAttribute("userPO", userPO);
			} else {
				throw new ServletException(msg.getFormatName() + " is a bad message format for this option.");
			}
			procReqProductDetails(req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqProductLN(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0700", req);
			ESD070001Message msgProd = (ESD070001Message) mp.getMessageRecord("ESD070001");
			msgProd.setH01USERID(user.getH01USR());
			msgProd.setH01PROGRM("ESD0700");
			msgProd.setH01TIMSYS(getTimeStamp());
			msgProd.setH01SCRCOD("01");
			msgProd.setH01OPECOD("0002");
			msgProd.setE01APCBNK(bank);
			msgProd.setE01APCCDE(prodCode);			
			
			mp.sendMessage(msgProd);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else if (msg.getFormatName().equals("ESD070001")) {
				session.setAttribute("prd", msg);
				userPO.setHeader2("DO_INQ");
				userPO.setHeader3(webAppPath + getLangPath(user) + "ESD0700_products_loans.jsp?readOnly=true");
				userPO.setHeader23("NO_MENU");
				session.setAttribute("userPO", userPO);
			} else {
				throw new ServletException(msg.getFormatName() + " is a bad message format for this option.");
			}
			procReqProductDetails(req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqProductCP(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071106Message msgProdCP = (ESD071106Message) mp.getMessageRecord("ESD071106");
			msgProdCP.setH06USERID(user.getH01USR());
			msgProdCP.setH06PROGRM("ESD0711");
			msgProdCP.setH06TIMSYS(getTimeStamp());
			msgProdCP.setH06SCRCOD("01");
			msgProdCP.setH06OPECOD("0004");
			msgProdCP.setE06APCCDE(prodCode);
			msgProdCP.setE06APCBNK(bank);
			
			mp.sendMessage(msgProdCP);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else if (msg.getFormatName().equals("ESD071106")) {
				session.setAttribute("cpProdInq", msg);
				userPO.setHeader2("DO_INQ");
				userPO.setHeader3(webAppPath + getLangPath(user) + "ESD0711_products_inq_cp.jsp");
				session.setAttribute("userPO", userPO);
			} else {
				throw new ServletException(msg.getFormatName() + " is a bad message format for this option.");
			}
			procReqProductDetails(req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqProductDDA(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071103Message msgProdDDA = (ESD071103Message) mp.getMessageRecord("ESD071103");
			msgProdDDA.setH03USERID(user.getH01USR());
			msgProdDDA.setH03PROGRM("ESD0711");
			msgProdDDA.setH03TIMSYS(getTimeStamp());
			msgProdDDA.setH03SCRCOD("01");
			msgProdDDA.setH03OPECOD("0004");
			msgProdDDA.setE03APCCDE(prodCode);
			msgProdDDA.setE03APCBNK(bank);
			
			mp.sendMessage(msgProdDDA);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else if (msg.getFormatName().equals("ESD071103")) {
				session.setAttribute("ddaProdInq", msg);
				userPO.setHeader2("DO_INQ");
				userPO.setHeader3(webAppPath + getLangPath(user) + "ESD0711_products_inq_dda.jsp");
				session.setAttribute("userPO", userPO);
			} else {
				throw new ServletException(msg.getFormatName() + " is a bad message format for this option.");
			}
			procReqProductDetails(req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("appcode"));
		} catch (Exception e) {
			if ("B1".equals(req.getParameter("appcode"))) {
				appCode = 999;
			}
		}
		String bank = req.getParameter("bank") == null ? "" : req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE") == null ? "" : req.getParameter("PROD_CODE");
		String typeCode = req.getParameter("typecode") == null ? "" : req.getParameter("typecode");
		String generic = req.getParameter("generic") == null ? "" : req.getParameter("generic");
		String title = req.getParameter("title") == null ? "" : req.getParameter("title");
		String accnum = req.getParameter("accnum") == null ? "" : req.getParameter("accnum");
		String deapac = req.getParameter("deapac") == null ? "" : req.getParameter("deapac");
		String deaoam = req.getParameter("deaoam") == null ? "" : req.getParameter("deaoam");
		String deacnv = req.getParameter("deacnv") == null ? "" : req.getParameter("deacnv");
		String refnum = userPO.getHeader15();
		String amount = userPO.getHeader16();
		String CUSNUM = userPO.getCusNum();
		String REFERE = userPO.getHeader18();
		
		switch (appCode) {
			case 13 :
				userPO.setOption("CP");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath
						+ "/servlet/datapro.eibs.products.JSEDL0105?SCREEN=200&E01DEAPRO="
						+ prodCode
						+ "&E01DEAACC="
						+ accnum
						+ "&appcode="
						+ appCode
						+ "&typecode="
						+ typeCode
						+ "&generic="
						+ generic
						+ "&title="
						+ title
						+ "&E01OFFAC1="
						+ refnum
						+ "&E01DEAAMT="
						+ amount
						+ "&bank="
						+ bank);
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 11 :
			case 12 :
			case 14 : // CD
				userPO.setOption("CD");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath
						+ "/servlet/datapro.eibs.products.JSEDL0130?SCREEN=400&E01DEAPRO="
						+ prodCode
						+ "&E01DEAACC="
						+ accnum
						+ "&appcode="
						+ appCode
						+ "&typecode="
						+ typeCode
						+ "&generic="
						+ generic
						+ "&title="
						+ title
						+ "&E01OFFAC1="
						+ refnum
						+ "&E01DEAAMT="
						+ amount
						+ "&bank="
						+ bank);
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 1 : // Retail Accounts
			case 2 :
			case 3 :
			case 5 :
				userPO.setOption("RT");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath
						+ "/servlet/datapro.eibs.products.JSEDD0000?SCREEN=200&E01ACMPRO="
						+ prodCode
						+ "&E01ACMACC="
						+ accnum
						+ "&appcode="
						+ appCode
						+ "&typecode="
						+ typeCode
						+ "&generic="
						+ generic
						+ "&title="
						+ title
						+ "&bank="
						+ bank
						+ "&E01OFFAC1="
						+ refnum
						+ "&E01ACMAMT="
						+ amount);
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 4 : // Saving Accounts
				userPO.setOption("SV");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath
						+ "/servlet/datapro.eibs.products.JSEDD0000?SCREEN=600&E01ACMPRO="
						+ prodCode
						+ "&E01ACMACC="
						+ accnum
						+ "&appcode="
						+ appCode
						+ "&typecode="
						+ typeCode
						+ "&generic="
						+ generic
						+ "&title="
						+ title
						+ "&bank="
						+ bank
						+ "&E01OFFAC1="
						+ refnum
						+ "&E01ACMAMT="
						+ amount);
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 6 : // Accounts Cuotas de Participacion PCL01
				userPO.setOption("CP");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath
						+ "/servlet/datapro.eibs.products.JSEDD0000?SCREEN=4600&E01ACMPRO="
						+ prodCode
						+ "&E01ACMACC="
						+ accnum
						+ "&appcode="
						+ appCode
						+ "&typecode="
						+ typeCode
						+ "&generic="
						+ generic
						+ "&title="
						+ title
						+ "&bank="
						+ bank
						+ "&E01OFFAC1="
						+ refnum
						+ "&E01ACMAMT="
						+ amount);
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 10 : // Loan Accounts
				userPO.setOption("LN");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				if (userPO.getHeader9().equals("PV")  && !generic.equals("G") && !generic.equals("V") && !generic.equals("I")  ){
					userPO.setHeader9("");
					userPO.setHeader3(webAppPath
							+ "/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=300&E01DEAPRO="
							+ prodCode
							+ "&E01DEAACC="
							+ accnum
							+ "&E01DEAPAC="
							+ deapac
							+ "&appcode="
							+ appCode
							+ "&typecode="
							+ typeCode
							+ "&generic="
							+ generic
							+ "&title="
							+ title
							+ "&E01DEABNK="
							+ bank
							+ "&E01PAGACC="
							+ refnum
							+ "&E01DEAOAM="
							+ deaoam 
							+ "&E01DEACNV="
							+ deacnv);
				} else { 
						//mod EMAT (5/12/2001)
						//redirect to Drafts Servlet if generic = 'G' // valores al cobro 'V'
						if (generic.equals("G")) {
							userPO.setHeader3(webAppPath
									+ "/servlet/datapro.eibs.products.JSEDL0800?SCREEN=200&E01DEAPRO="
									+ prodCode
									+ "&E01DEAACC="
									+ accnum
									+ "&appcode="
									+ appCode
									+ "&typecode="
									+ typeCode
									+ "&generic="
									+ generic
									+ "&title="
									+ title
									+ "&bank="
									+ bank
									+ "&E01OFFAC1="
									+ refnum
									+ "&E01ACMAMT="
									+ amount);
						} else if (generic.equals("V")) {
							userPO.setHeader3(webAppPath
									+ "/servlet/datapro.eibs.products.JSEDL0810?SCREEN=200&E01DLHPRD="
									+ prodCode
									+ "&E01DLHNRO="
									+ accnum
									+ "&appcode="
									+ appCode
									+ "&typecode="
									+ typeCode
									+ "&generic="
									+ generic
									+ "&title="
									+ title
									+ "&bank="
									+ bank);
						} else if (generic.equals("I")) {
							userPO.setHeader3(webAppPath
									+ "/servlet/datapro.eibs.salesplatform.JSEPV0154?SCREEN=800&E01DEAPRO="
									+ prodCode
									+ "&opt=1&E01DEAOAM="
									+ deaoam);									

						} else {
							userPO.setHeader3(webAppPath
									+ "/servlet/datapro.eibs.products.JSEDL0150?SCREEN=200&E01DEAPRO="
									+ prodCode
									+ "&E01DEAACC="
									+ accnum
									+ "&E01DEAPAC="
									+ deapac
									+ "&appcode="
									+ appCode
									+ "&typecode="
									+ typeCode
									+ "&generic="
									+ generic
									+ "&title="
									+ title
									+ "&E01DEABNK="
									+ bank
									+ "&E01PAGACC="
									+ refnum
									+ "&E01DEAOAM="
									+ amount);
						}
				}
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 40 : // LC
			case 41 :
			case 42 :
				if (userPO.getOption().equals("SB")) {
					userPO.setPurpose("NEW");
					userPO.setHeader2("DO_NEW");
					userPO.setHeader3(webAppPath
							+ "/servlet/datapro.eibs.products.JSELC0400?SCREEN=1&E01LCMPRO="
							+ prodCode
							+ "&E01LCMACC="
							+ accnum
							+ "&appcode="
							+ appCode
							+ "&typecode="
							+ typeCode
							+ "&generic="
							+ generic
							+ "&title="
							+ title
							+ "&bank="
							+ bank);
					session.setAttribute("userPO", userPO);
					procReqProductDetails(req, res);
				} else {
					userPO.setOption("LC");
					userPO.setPurpose("NEW");
					userPO.setHeader2("DO_NEW");
					userPO.setHeader3(webAppPath
							+ "/servlet/datapro.eibs.products.JSELC0500?SCREEN=1&E01LCMPRO="
							+ prodCode
							+ "&E01LCMACC="
							+ accnum
							+ "&appcode="
							+ appCode
							+ "&typecode="
							+ typeCode
							+ "&generic="
							+ generic
							+ "&title="
							+ title
							+ "&bank="
							+ bank);
					session.setAttribute("userPO", userPO);
					procReqProductDetails(req, res);
				}
				break;
			case 43 : // Boleta Garantia
				userPO.setOption("BG");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				if (userPO.getHeader9().equals("PV")) {
					userPO.setHeader9("");
					userPO.setHeader3(webAppPath
							+ "/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=300&E01LCMPRO="
							+ prodCode
							+ "&E01LCMACC="
							+ accnum
							+ "&appcode="
							+ appCode
							+ "&typecode="
							+ typeCode
							+ "&generic="
							+ generic
							+ "&title="
							+ title
							+ "&bank="
							+ bank);
				} else { 
					userPO.setHeader3(webAppPath
							+ "/servlet/datapro.eibs.bolgaran.JSELC5000?SCREEN=100&E01LCMPRO="
							+ prodCode
							+ "&E01LCMACC="
							+ accnum
							+ "&appcode="
							+ appCode
							+ "&typecode="
							+ typeCode
							+ "&generic="
							+ generic
							+ "&title="
							+ title
							+ "&bank="
							+ bank);
				}
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 50 : // Cobranzas Simples
				userPO.setOption("DC");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath
						+ "/servlet/datapro.eibs.products.JSEDC0010?SCREEN=1&E01DCMPRO="
						+ prodCode
						+ "&appcode="
						+ appCode
						+ "&typecode="
						+ typeCode
						+ "&generic="
						+ generic
						+ "&title="
						+ title
						+ "&bank="
						+ bank);
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 51 : // Cobranzas Documentarias
				userPO.setOption("DC");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath
						+ "/servlet/datapro.eibs.products.JSEDC0000?SCREEN=1&E01DCMPRO="
						+ prodCode
						+ "&appcode="
						+ appCode
						+ "&typecode="
						+ typeCode
						+ "&generic="
						+ generic
						+ "&title="
						+ title
						+ "&bank="
						+ bank);
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 91 : // Collaterals
				userPO.setOption("91");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath
						+ "/servlet/datapro.eibs.client.JSERA0050?SCREEN=400&PRODUCT="
						+ prodCode
						+ "&accnum="
						+ accnum
						+ "&appcode="
						+ appCode
						+ "&typecode="
						+ typeCode
						+ "&generic="
						+ generic
						+ "&title="
						+ title
						+ "&E01OFFAC1="
						+ refnum
						+ "&E01DEAAMT="
						+ amount
						+ "&bank="
						+ bank
						+ "&REFERE="
						+ REFERE
						+ "&CUSNUM="
						+ CUSNUM );
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 94 : // Credit Card
				userPO.setOption("CC");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath
						+ "/servlet/datapro.eibs.products.JSECC0010?SCREEN=1&E01CCMPRO="
						+ prodCode
						+ "&E01CCMACC="
						+ accnum
						+ "&appcode="
						+ appCode
						+ "&typecode="
						+ typeCode
						+ "&generic="
						+ generic
						+ "&title="
						+ title
						+ "&E01OFFAC1="
						+ refnum
						+ "&E01DEAAMT="
						+ amount
						+ "&bank="
						+ bank);
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;
			case 95 : // MMP 
			case 999 : // FRA
				procMessageError(req, res, session);
				break;
			case 19 :
				userPO.setOption("PC");
				userPO.setPurpose("NEW");
				userPO.setHeader2("DO_NEW");
				userPO.setHeader3(webAppPath
						+ "/servlet/datapro.eibs.products.JSEPC0000?SCREEN=200&E01PCMPRO="
						+ prodCode
						+ "&E01PCMACC="
						+ accnum
						+ "&appcode="
						+ appCode
						+ "&typecode="
						+ typeCode
						+ "&generic="
						+ generic
						+ "&title="
						+ title
						+ "&E01OFFAC1="
						+ refnum
						+ "&E01DEAAMT="
						+ amount
						+ "&bank="
						+ bank);
				session.setAttribute("userPO", userPO);
				procReqProductDetails(req, res);
				break;

			case 97 : // Remanentes
				try
				{
					userPO.setOption("97");
					userPO.setPurpose("NEW");
					userPO.setHeader2("DO_NEW");
					userPO.setHeader3(webAppPath
							+ "/servlet/datapro.eibs.products.JSERM0000?SCREEN=100&E01RMMPRD="
							+ prodCode
							+ "&E01RMMACC="
							+ accnum
							+ "&appcode="
							+ appCode
							+ "&typecode="
							+ typeCode
							+ "&generic="
							+ generic
							+ "&title="
							+ title
							+ "&bank="
							+ bank);
					session.setAttribute("userPO", userPO);
					procReqProductDetails(req, res);
					flexLog("Product Remanentes Requested");
				}
				catch (Exception ex)
				{
					flexLog("Error: " + ex);
				}
				break;

			default :
				procReqProductDetails(req, res);
				break;
		}
	}

	private void procMessageError(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		ELEERRMessage msgError = new ELEERRMessage();
		msgError.setERRNUM("1");
		msgError.setERNU01("");
		msgError.setERWF01("Y");
		msgError.setERDS01("Este producto debe agregarse utilizando el Modulo de Tesoreria.");

		session.setAttribute("error", msgError);
		
		procReqProductDetails(req, res);
	}

	private void procReqProductDetails(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException {
		
		String appCode = req.getParameter("appcode");
		String bank = req.getParameter("bank");
		String prodCode = req.getParameter("PROD_CODE");
		String typeCode = req.getParameter("typecode");
		String generic = req.getParameter("generic");
		String title = req.getParameter("title");
		
		String firstLink = getLangPath(req) 
				+ "ESD0711_products_detail.jsp?bank="
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
		
			ESD071101Message msgTree = null;
			ELEERRMessage msgError = (datapro.eibs.beans.ELEERRMessage) session.getAttribute("error");
			msgError = msgError == null ? new ELEERRMessage() : msgError;
			UserPos userPO = getUserPos(req);
			userPO.setPurpose("NEW");
			//JBParseTree dataTree = new JBParseTree();
			JBObjList prodList = null;
			JBObjList subProdList = null;
			JBObjList elemList = null;

			String firstLink = "";
			String appCode = "";
			String genCode = "";

			try {
				String code = req.getParameter("TYPE").trim();
				userPO.setOption(code);
				appCode = code.equals("ALL") ? "" : code;
				//mod EMAT 11/16/2001
				//parameter GENERIC = 'U' debts
				genCode = req.getParameter("GENERIC") == null ? "" : req.getParameter("GENERIC");
			} catch (Exception e) {
			}

			try {
				userPO.setHeader15(req.getParameter("REFNUM").trim());
			} catch (Exception e) {
				userPO.setHeader15(" ");
			}

			try	{
				userPO.setHeader16(req.getParameter("AMOUNT").trim());
			} catch (Exception e) {
				userPO.setHeader16(" ");
			}

			try {
				userPO.setCusNum(req.getParameter("CUSNUM").trim());
			} catch (Exception e) {
				userPO.setCusNum("0");
			}
			try {
				userPO.setHeader18(req.getParameter("REFERE").trim());
			} catch (Exception e) {
				userPO.setHeader18("");
			}
			
			// Send Request
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ESD0711", req);
				msgTree = (ESD071101Message) mp.getMessageRecord("ESD071101");

				msgTree.setE01USERID(user.getH01USR());
				msgTree.setE01SELACD(appCode);
				//mod EMAT 11/16/2001
				//parameter GENERIC = 'U' debts
				msgTree.setE01GENERI(genCode);
				
				mp.sendMessage(msgTree);
				JBObjList list = mp.receiveMessageRecordList("E01RECTYP");
				
				if (mp.hasError(list)) {
					msgError = (ELEERRMessage) mp.getError(list);
				} else if (!list.isEmpty()) {
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
										+ "ESD0711_products_detail.jsp?appcode="
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
						}
					}
					subProdList.addRow(elemList);
				}	
				//msgError.setERRNUM("0");
				userPO.setHeader2("");
				userPO.setType(genCode);
				
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
