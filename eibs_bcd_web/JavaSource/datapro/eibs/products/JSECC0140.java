package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (8/28/2000 4:02:17 PM)
 * @author: Orestes Garcia
**/

import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSECC0140 extends datapro.eibs.master.SuperServlet {

	protected static final int R_PASSWORD = 1;
	protected static final int R_APPROVAL = 5;
	protected static final int A_APPROVAL = 2;
	protected static final int R_APPROVAL_INQ = 3;
	protected static final int R_APPROVAL_LIST = 4;
	protected String LangPath = "S";

	public JSECC0140() {
		super();
	}

	public JSECC0140(int logType) {
		super(logType);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) 
		throws javax.servlet.ServletException, java.io.IOException {
		
		MessageContext mc = null;
		ESS0030DSMessage msgUser = null;
		HttpSession session = null;
		session = (HttpSession) req.getSession(false);

		if (session == null) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {
			int screen = R_APPROVAL;
			try {
				msgUser = (datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");
				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";
				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("ECC0140", req));
					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}
					switch (screen) {
						case R_PASSWORD :
							procReqPassword(req, res, session);
							break;
						case R_APPROVAL :
							procReqApproval(mc, msgUser, req, res, session);
							break;
						case A_APPROVAL :
							procActionApproval(mc, msgUser, req, res, session);
							break;
						case R_APPROVAL_INQ :
							procReqApprovalInq(mc, msgUser, req, res, session);
							break;
						case R_APPROVAL_LIST :
							procReqApprovalList(mc, msgUser, req, res, session);
							break;
						default :
							res.sendRedirect(super.srctx + LangPath + super.devPage);
							break;
					}
				} catch (Exception e) {
					e.printStackTrace();
					int sck = getInitSocket(req) + 1;
					flexLog("Socket not Open(Port " + sck + "). Error: " + e);
					res.sendRedirect(super.srctx + LangPath + super.sckNotOpenPage);
				} finally {
					mc.close();
				}
			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			}
		}
	}

	protected void procReqPassword(HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;

		try {
			//mod emat 01/24/2002
			//send draft parameter
			String typCode = "";
			flexLog("typCode: " + req.getParameter("typCode"));
			if (req.getParameter("typCode") != null) {
				typCode = req.getParameter("typCode");
			}
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setRedirect("/servlet/datapro.eibs.products.JSECC0140?SCREEN="
				+ R_APPROVAL
				+ "&appCode="
				+ req.getParameter("appCode")
				+ "&typCode="
				+ req.getParameter("typCode")
				+ (req.getParameter("ACCNUM") == null
					? ""
					: "&ACCNUM=" + req.getParameter("ACCNUM")));
			ses.setAttribute("userPO", userPO);
			res.sendRedirect(super.srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
	}

	protected void procReqApproval(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECC014001Message msgList = null;
		JBObjList beanList = null;
		UserPos userPO = null;

		userPO = new UserPos();

		String appCode = req.getParameter("appCode");
		if (appCode.equals("94")) {
			userPO.setHeader2("C");
			userPO.setOption("CC");
		} else {
			userPO.setHeader2("D");
			userPO.setOption("RT");
		}
		userPO.setPurpose("APPROVAL");
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgList = (ECC014001Message) mc.getMessageRecord("ECC014001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECC0140");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("0015");
			msgList.setE01CCMACD(appCode);
			//mod: emat 02/24/2002
			//to extract drafts
			flexLog("typCode: " + req.getParameter("typCode"));
			if (req.getParameter("typCode") != null
				&& !req.getParameter("typCode").equalsIgnoreCase("null")) {
				msgList.setH01FLGWK1(req.getParameter("typCode").trim());
			}
			//
			msgList.send();
			msgList.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Message
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				try {
					flexLog(
						"About to call Page: " + LangPath + "error_viewer.jsp");
					callPage(LangPath + "error_viewer.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else if (newmessage.getFormatName().equals("ECC014001")) {
				try {
					beanList = new datapro.eibs.beans.JBObjList();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}
				boolean firstTime;
				String marker = "";
				userPO = new datapro.eibs.beans.UserPos();
				while (true) {
					msgList = (ECC014001Message) newmessage;
					flexLog("ECC014001 Message Received");					
					marker = msgList.getH01FLGMAS();
					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {
						beanList.addRow(msgList);
						if (marker.equals("+")) {
							beanList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}
				flexLog("setting title to Drafts : " + req.getParameter("typCode"));
				if (req.getParameter("typCode").equals("G")) {
					userPO.setOption("DF");
				}
				flexLog("Putting java beans into the session");
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("appList", beanList);
				ses.setAttribute("error", msgError);
				if (beanList.getNoResult()) {
					try {
						flexLog("About to call Page: " + LangPath + "MISC_no_result.jsp");
						res.sendRedirect(super.srctx + LangPath + "MISC_no_result.jsp");
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else {
					try {
						flexLog("About to call Page: " + LangPath + "ECC0140_approval_list.jsp");
						callPage(LangPath + "ECC0140_approval_list.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	protected void procActionApproval(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECC014002Message msgList = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		String acc = req.getParameter("ACCNUM");
		String act = req.getParameter("action");
		String rea = req.getParameter("reason");
		String bio = (req.getParameter("BIO") == null ? "N" : req.getParameter("BIO"));
		String typCode = req.getParameter("typCode") == null ? userPO.getType() : req.getParameter("typCode");
		String appCode = req.getParameter("appCode") == null ? userPO.getApplicationCode() : req.getParameter("appCode");

		userPO.setType(typCode);
		userPO.setApplicationCode(appCode);
		
		flexLog("bio: " + bio);
		flexLog("typCode: " + typCode);
		flexLog("appCode: " + appCode);

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			if (bio.equals("B")) {  // Biometric
				userPO.setRedirect("/servlet/datapro.eibs.products.JSECC0140?SCREEN=2&ACCNUM="+acc+"&action="+act+"&reason="+rea+"&BIO=N");
				ses.setAttribute("userPO", userPO);
				res.sendRedirect(super.srctx+"/servlet/datapro.eibs.client.JSEDD8000?SCREEN=2&E01ACMACC="+acc);
				return;
			} else {
				msgList = (ECC014002Message) mc.getMessageRecord("ECC014002");
				msgList.setH02USERID(user.getH01USR());
				msgList.setH02PROGRM("ECC0140");
				msgList.setH02TIMSYS(getTimeStamp());
				msgList.setE02CCMACC(acc);
				msgList.setE02ACTION(act);
				msgList.setE02MSGTXT(rea);
				msgList.send();
				msgList.destroy();
			}	
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
		
		flexLog("bio: " + bio);
		
		if (!bio.equals("B")) {  // Biometric
			// Receive Message
			try {
				newmessage = mc.receiveMessage();
				if (newmessage.getFormatName().equals("ELEERR")) {
					try {
						msgError = new datapro.eibs.beans.ELEERRMessage();
					} catch (Exception ex) {
						flexLog("Error: " + ex);
					}
					msgError = (ELEERRMessage) newmessage;
					IsNotError = msgError.getERRNUM().equals("0");
					flexLog("IsNotError = " + IsNotError);
					flexLog("Putting java beans into the session");
					ses.setAttribute("error", msgError);
					if (IsNotError) { // There is no error
						String rdir = "/servlet/datapro.eibs.products.JSECC0140?SCREEN=5&appCode="+appCode+"&typCode="+typCode;
						res.sendRedirect(super.srctx + rdir);
					} else {
						try {
							flexLog("About to call Page: "	+ LangPath	+ "ECC0140_approval_list.jsp");
							callPage(LangPath + "ECC0140_approval_list.jsp", req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
		}
		
	}
	
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqApprovalInq(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;

		try {
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			int appCode = 0;
			try {
				appCode = Integer.parseInt(req.getParameter("appCode"));				
			} catch (Exception e) {
				appCode = 1;
			}
			String accNum = req.getParameter("ACCNUM");
			String typeCode = req.getParameter("typeCode");
			String cardNum = req.getParameter("CARDNUM");
			if (cardNum != null) userPO.setIdentifier(cardNum); else userPO.setIdentifier("");

			datapro.eibs.products.JOActionRedirect red =
				new datapro.eibs.products.JOActionRedirect(
					typeCode,
					ACC_APPROVAL_INQ,
					appCode,
					accNum,
					LangPath,
					ses);
			res.sendRedirect(super.srctx + red.action());
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqApprovalList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECC014001Message msgList = null;
		JBObjList beanList = null;
		UserPos userPO = null;
	
		userPO = new UserPos();
	
		String appCode = req.getParameter("appCode");
		if (appCode.equals("94")) {
			userPO.setHeader2("C");
			userPO.setOption("CC");
		} else {
			userPO.setHeader2("D");
			userPO.setOption("RT");
		}
		userPO.setPurpose("APPROVAL");
		
		String find = req.getParameter("NUM");
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgList = (ECC014001Message) mc.getMessageRecord("ECC014001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECC0140");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("0002");
			msgList.setE01CCMACD(appCode);

			if (find.equals("A")){
				msgList.setE01CCMACC(req.getParameter("ACCTNUM"));
			}
			if (find.equals("D")){
				msgList.setE01CCMNUM(req.getParameter("CARDNUM"));
			}
			if (find.equals("C")){
				msgList.setE01CCMCUN(req.getParameter("CUSTNUM"));
			}
		
			//mod: emat 02/24/2002
			//to extract drafts
			flexLog("typCode: " + req.getParameter("typCode"));
			if (req.getParameter("typCode") != null
				&& !req.getParameter("typCode").equalsIgnoreCase("null")) {
				msgList.setH01FLGWK1(req.getParameter("typCode").trim());
			}
			//
			msgList.send();
			msgList.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
		// Receive Message
		try {
			newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("ELEERR")) {
	
				msgError = (ELEERRMessage) newmessage;
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
	
				try {
					flexLog(
						"About to call Page: " + LangPath + "error_viewer.jsp");
					callPage(LangPath + "error_viewer.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
	
			} else if (newmessage.getFormatName().equals("ECC014001")) {
	
				try {
					beanList = new datapro.eibs.beans.JBObjList();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}
	
				boolean firstTime;
				String marker = "";
	
				userPO = new datapro.eibs.beans.UserPos();
	
				while (true) {
					msgList = (ECC014001Message) newmessage;
					flexLog("ECC014001 Message Received");					
					marker = msgList.getH01FLGMAS();
	
					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {
						beanList.addRow(msgList);
						if (marker.equals("+")) {
							beanList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}
	
				/*flexLog(
					"setting title to Drafts : " + req.getParameter("typCode"));
				if (req.getParameter("typCode").equals("G")) {
					userPO.setOption("DF");
				}*/
				
				flexLog("Putting java beans into the session");
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("appList", beanList);
				ses.setAttribute("error", msgError);
	
				if (beanList.getNoResult()) {
					try {
						flexLog("About to call Page: " + LangPath + "MISC_no_result.jsp");
						res.sendRedirect(super.srctx + LangPath + "MISC_no_result.jsp");
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else {
	
					try {
						flexLog("About to call Page: " + LangPath + "ECC0140_approval_list.jsp");
						callPage(LangPath + "ECC0140_approval_list.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
	}


}