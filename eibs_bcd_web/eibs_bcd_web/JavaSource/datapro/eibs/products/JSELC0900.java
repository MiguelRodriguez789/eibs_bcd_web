package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC010002Message;
import datapro.eibs.beans.ELC056002Message;
import datapro.eibs.beans.ELC090001Message;
import datapro.eibs.beans.ELC090002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageContextHandler;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author rreal
 *
 * 
 */
public class JSELC0900 extends SuperServlet {

	String LangPath = "s/";
	
	public JSELC0900() {
		super();
	}
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	public void destroy() {
		flexLog("free resources used by JSELC0100");
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		if (session == null) {
			try {
				res.setContentType("text/html");
				super.printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {
			int screen = -1;

			ESS0030DSMessage user = (datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");
			// Here we should get the path from the user profile
			LangPath = rootPath + user.getE01LAN() + "/";
			
			MessageContext mc = null;
			try {				
				mc = new MessageContext(super.getMessageHandler("ELC0900", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen) {
					case 1 : 
						requestEnterStats(mc, user, req, res);
						break;
					case 2 : 
						requestGraphicInfo(mc, user, req, res);
						break;
					case 3 : 
						requestEnterStatsCommissions(mc, user, req, res);
						break;
					case 4 :
						requestGraphicInfoCommissions(mc, user, req, res);
						break;
					case 5 : 
						requestEnterStatsTransfersColl(mc, user, req, res);
						break;
					case 6 :
						requestGraphicInfoTransfersColl(mc, user, req, res);
						break;	
					case 7 : 
						requestEnterStatsCommissionsColl(mc, user, req, res);
						break;
					case 8 : 
						requestGraphicInfoCommissionsColl(mc, user, req, res);
						break;	
					case 15 : 
						requestEnterStatsNav(mc, user, req, res);
						break;
					case 16 :
						requestGraphicInfoNav(mc, user, req, res);
						break;	
					case 17 : 
						requestEnterStatsCommissionsNav(mc, user, req, res);
						break;
					case 18 : 
						requestGraphicInfoCommissionsNav(mc, user, req, res);
						break;	
					default :
						PageToCall = "MISC_not_available.jsp";
						callPage(PageToCall, req, res);
						break;
				}

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				res.sendRedirect(srctx + LangPath + sckNotRespondPage);
			} finally {
				if (mc != null) mc.close();
				flexLog("Socket used by JSELC0100 closed.");
			}
		}	
	}			

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestAction(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC010002Message msg02 = (ELC010002Message) msgHandle.initMessage("ELC010002", user.getH01USR(), "0002");
			initTransaction(userPO, String.valueOf(screen), "");
			msgHandle.setFieldsFromPage(req, msg02);
			msgHandle.sendMessage(msg02);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean IsNotError = msgError.getERRNUM().equals("0");
			if (IsNotError) {
		//		requestList(mc, user, req, res, 3); //Request Approval List
			} else {
				putDataInSession(session, userPO, msgError, "", null, null);
				callPage("ELC0100_lc_nego_apr_list.jsp", req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestConfirmation(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC056002Message msgCon = (ELC056002Message) msgHandle.initMessage("ELC056002", user.getH01USR(), "0004");
			initTransaction(userPO, String.valueOf(screen), "");
			msgCon.setE02LCRNUM(userPO.getHeader1());
			msgCon.setE02DRWNUM(userPO.getHeader2());
			msgHandle.sendMessage(msgCon);
			//msgError = msgHandle.receiveErrorMessage();
			//boolean isNotError = msgError.getERRNUM().equals("0");
			//msgCon = (ELC056002Message) msgHandle.receiveMessage();
			MessageRecord newmsg = msgHandle.receiveMessage();
			ELEERRMessage msgError = new ELEERRMessage(); 
			if (newmsg.getFormatName().equals("ELEERRMessage")) {
				msgError = (ELEERRMessage) newmsg;
				PageToCall = "ELC0100_lc_nego_apr_list.jsp";
			} else {
				msgCon = (ELC056002Message) newmsg;
				PageToCall = "ELC0100_lc_nego_view_conf.jsp";
			}
			putDataInSession(session, userPO, msgError, "msg", msgCon, null);
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestGraphicInfo(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
	//	UserPos  userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC090001Message msgInq = (ELC090001Message) msgHandle.initMessage("ELC090001", user.getH01USR(), "0004");
			//initTransaction(userPO, String.valueOf(screen), "VIEW");

			msgInq.setE01LCYBNK(req.getParameter("E01LCYBNK"));
			msgInq.setE01LCYACD(req.getParameter("E01LCYACD"));
			msgInq.setE01LCYTYP(req.getParameter("E01LCYTYP"));
			msgInq.setE01SCHDTY(req.getParameter("E01SCHDTY"));
			
			msgHandle.sendMessage(msgInq);
			//msgError = msgHandle.receiveErrorMessage();
			//boolean isNotError = msgError.getERRNUM().equals("0");
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msgInq = (ELC090001Message) msgHandle.receiveMessage();

			boolean IsNotError = msgError.getERRNUM().equals("0");
			String PageToCall = "ELC0900_lc_graph.jsp";
			/*if (IsNotError) {
				PageToCall = "ELC0900_lc_graph.jsp";
			} else {
				PageToCall = "ELC0900_lc_stats.jsp";
			}*/

			putDataInSession(session, null, null, "msg01", msgInq, null);

			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void requestGraphicInfoCommissions(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
	//	UserPos  userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC090002Message msgInq = (ELC090002Message) msgHandle.initMessage("ELC090002", user.getH01USR(), "0004");
			//initTransaction(userPO, String.valueOf(screen), "VIEW");

			msgInq.setE02LCYBNK(req.getParameter("E02LCYBNK"));
			msgInq.setE02LCYACD(req.getParameter("E02LCYACD"));
			msgInq.setE02LCYTYP(req.getParameter("E02LCYTYP"));
			msgInq.setE02SCHDTY(req.getParameter("E02SCHDTY"));
			
			msgHandle.sendMessage(msgInq);
			//msgError = msgHandle.receiveErrorMessage();
			//boolean isNotError = msgError.getERRNUM().equals("0");
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msgInq = (ELC090002Message) msgHandle.receiveMessage();

			boolean IsNotError = msgError.getERRNUM().equals("0");
			String PageToCall = "ELC0900_lc_graph_commissions.jsp";
			/*if (IsNotError) {
				PageToCall = "ELC0900_lc_graph.jsp";
			} else {
				PageToCall = "ELC0900_lc_stats.jsp";
			}*/

			putDataInSession(session, null, null, "msg02", msgInq, null);

			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void requestGraphicInfoCommissionsColl(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
	//	UserPos  userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC090002Message msgInq = (ELC090002Message) msgHandle.initMessage("ELC090002", user.getH01USR(), "0004");
			//initTransaction(userPO, String.valueOf(screen), "VIEW");

			msgInq.setE02LCYBNK(req.getParameter("E02LCYBNK"));
			msgInq.setE02LCYACD(req.getParameter("E02LCYACD"));
			msgInq.setE02LCYTYP(req.getParameter("E02LCYTYP"));
			msgInq.setE02SCHDTY(req.getParameter("E02SCHDTY"));
			
			msgHandle.sendMessage(msgInq);
			//msgError = msgHandle.receiveErrorMessage();
			//boolean isNotError = msgError.getERRNUM().equals("0");
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msgInq = (ELC090002Message) msgHandle.receiveMessage();

			boolean IsNotError = msgError.getERRNUM().equals("0");
			String PageToCall = "ELC0900_lc_graph_commissions_coll.jsp";
			/*if (IsNotError) {
				PageToCall = "ELC0900_lc_graph.jsp";
			} else {
				PageToCall = "ELC0900_lc_stats.jsp";
			}*/

			putDataInSession(session, null, null, "msg02", msgInq, null);

			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void requestGraphicInfoTransfersColl(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
	//	UserPos  userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC090001Message msgInq = (ELC090001Message) msgHandle.initMessage("ELC090001", user.getH01USR(), "0004");
			//initTransaction(userPO, String.valueOf(screen), "VIEW");

			msgInq.setE01LCYBNK(req.getParameter("E01LCYBNK"));
			msgInq.setE01LCYACD(req.getParameter("E01LCYACD"));
			msgInq.setE01LCYTYP(req.getParameter("E01LCYTYP"));
			msgInq.setE01SCHDTY(req.getParameter("E01SCHDTY"));
			
			msgHandle.sendMessage(msgInq);
			//msgError = msgHandle.receiveErrorMessage();
			//boolean isNotError = msgError.getERRNUM().equals("0");
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msgInq = (ELC090001Message) msgHandle.receiveMessage();

			boolean IsNotError = msgError.getERRNUM().equals("0");
			String PageToCall = "ELC0900_lc_graph_transfers_coll.jsp";
			/*if (IsNotError) {
				PageToCall = "ELC0900_lc_graph.jsp";
			} else {
				PageToCall = "ELC0900_lc_stats.jsp";
			}*/

			putDataInSession(session, null, null, "msg01", msgInq, null);

			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	private void requestEnterStats(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "ELC0900_lc_stats.jsp";

		try {
		/*	MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC010001Message msg01 = (ELC010001Message) msgHandle.initMessage("ELC010001", user.getH01USR(), "0015");
			initTransaction(userPO, String.valueOf(screen), "");
			msgHandle.sendMessage(msg01);
			JBObjList jbList = msgHandle.receiveMessageList("H01FLGMAS");*/
		//	putDataInSession(session, userPO, null, "", null, jbList);
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void requestEnterStatsCommissions(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "ELC0900_lc_stats_commissions.jsp";

		try {
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void requestEnterStatsCommissionsColl(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "ELC0900_lc_stats_commissions_coll.jsp";

		try {
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void requestEnterStatsTransfersColl(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "ELC0900_lc_stats_transfers_coll.jsp";

		try {
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestStatsByAmount(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "ELC0900_lc_graph_list.jsp";

		try {
		/*	MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC010001Message msg01 = (ELC010001Message) msgHandle.initMessage("ELC010001", user.getH01USR(), "0015");
			initTransaction(userPO, String.valueOf(screen), "");
			msgHandle.sendMessage(msg01);
			JBObjList jbList = msgHandle.receiveMessageList("H01FLGMAS");*/
		//	putDataInSession(session, userPO, null, "", null, jbList);
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void requestStatsByNumberOfOperations(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "ELC0900_lc_graph_list.jsp";

		try {
		/*	MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC010001Message msg01 = (ELC010001Message) msgHandle.initMessage("ELC010001", user.getH01USR(), "0015");
			initTransaction(userPO, String.valueOf(screen), "");
			msgHandle.sendMessage(msg01);
			JBObjList jbList = msgHandle.receiveMessageList("H01FLGMAS");*/
		//	putDataInSession(session, userPO, null, "", null, jbList);
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	private void initTransaction(UserPos userPO, String optMenu, String purpose) {
		if (!optMenu.equals("")) userPO.setOption(optMenu);
		if (!purpose.equals("")) userPO.setPurpose(purpose);
	}
	
	public void callPage(String page, HttpServletRequest req, HttpServletResponse res) {
		try {
			super.callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e.toString() + e.getMessage());
		}
		return; 
	}
	
	private void putDataInSession(HttpSession session, UserPos userPO, ELEERRMessage msgError, String msg_name, MessageRecord msg, JBObjList jbList) {
			flexLog("Putting java beans into the session");
        
		if (msgError == null) {
			msgError = new ELEERRMessage(); 
		}
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		if (msg != null) session.setAttribute(msg_name, msg);
		if (jbList != null) session.setAttribute("jbList", jbList);
	}

	private void requestEnterStatsNav(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "ELC0900_nv_stats_nav.jsp";

		try {
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	private void requestGraphicInfoNav(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC090001Message msgInq = (ELC090001Message) msgHandle.initMessage("ELC090001", user.getH01USR(), "0004");
			//initTransaction(userPO, String.valueOf(screen), "VIEW");

			msgInq.setE01LCYBNK(req.getParameter("E01LCYBNK"));
			msgInq.setE01LCYACD(req.getParameter("E01LCYACD"));
			msgInq.setE01LCYTYP(req.getParameter("E01LCYTYP"));
			msgInq.setE01SCHDTY(req.getParameter("E01SCHDTY"));
			
			msgHandle.sendMessage(msgInq);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msgInq = (ELC090001Message) msgHandle.receiveMessage();

			boolean IsNotError = msgError.getERRNUM().equals("0");
			String PageToCall = "ELC0900_nv_graph_nav.jsp";

			putDataInSession(session, null, null, "msg01", msgInq, null);

			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void requestEnterStatsCommissionsNav(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "ELC0900_nv_stats_commissions_nav.jsp";

		try {
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void requestGraphicInfoCommissionsNav(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC090002Message msgInq = (ELC090002Message) msgHandle.initMessage("ELC090002", user.getH01USR(), "0004");

			msgInq.setE02LCYBNK(req.getParameter("E02LCYBNK"));
			msgInq.setE02LCYACD(req.getParameter("E02LCYACD"));
			msgInq.setE02LCYTYP(req.getParameter("E02LCYTYP"));
			msgInq.setE02SCHDTY(req.getParameter("E02SCHDTY"));
			
			msgHandle.sendMessage(msgInq);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msgInq = (ELC090002Message) msgHandle.receiveMessage();
			flexLog("msgInq "+msgInq);
			boolean IsNotError = msgError.getERRNUM().equals("0");
			String PageToCall = "ELC0900_nv_graph_commissions_nav.jsp";

			putDataInSession(session, null, null, "msg02", msgInq, null);

			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
}
