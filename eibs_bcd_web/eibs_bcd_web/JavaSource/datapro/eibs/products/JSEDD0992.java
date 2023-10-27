package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;
import datapro.eibs.master.Util;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.sockets.*;

public class JSEDD0992 extends datapro.eibs.master.SuperServlet {

	protected static final int R_FILTER = 100; //
	// entering options
	protected static final int A_ENTER = 200;
	// ACTUALIZAR REGISTRO MARCA 'P' y balance
	protected static final int A_UPDATE = 300;
	
	protected String LangPath = "S";

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSEDD0992() {
		super();
	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSESD0080");

	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	/** Filtro */
	/************************************************************************************************/
	/************************************************************************************************/
	/************************************************************************************************/
	protected void procReqFilter(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;

		UserPos userPO = new UserPos();
		msgError = new ELEERRMessage();

		ses.setAttribute("userPO", userPO);
		ses.setAttribute("error", msgError);
		/***********************************************/
		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDD0992_print_books_inquiry.jsp");
			callPage(LangPath + "EDD0992_print_books_inquiry.jsp", req, res);
		} catch (Exception ex) {
			flexLog("Exception calling page " + ex);
		}
		/***********************************************/
	}


	protected void procList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;

		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError =
				(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
					getClass().getClassLoader(),
					"datapro.eibs.beans.ELEERRMessage");
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");


		EDD0992DSMessage l0992 = null;
		// Send Initial data
		try {
			l0992 = (EDD0992DSMessage) mc.getMessageRecord("EDD0992DS");
			l0992.setH01USERID(user.getH01USR());
			l0992.setH01PROGRM("EDD0992DS");
			l0992.setH01TIMSYS(getTimeStamp());
			l0992.setH01SCRCOD("01");
			l0992.setH01OPECOD("0015");
				
			if(req.getParameter("E01ACMACC")!=null){
				userPO.setAccNum(req.getParameter("E01ACMACC"));
				}

			try {
				try {
					l0992.setE01PBTACC(userPO.getAccNum());
				} catch (Exception e) {
				}
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Input data error " + e);
			}
			if(req.getParameter("Pos")!=null){
				l0992.setE01RECPOS(req.getParameter("Pos"));
				}
				
			l0992.send();
			l0992.destroy();
			flexLog("EDD0992DS Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {

				try {
					msgError =
						(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
							getClass().getClassLoader(),
							"datapro.eibs.beans.ELEERRMessage");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgError = (ELEERRMessage) newmessage;

				showERROR(msgError);

				//beanList.setNoResult(true);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDD0992DS")) {

				JBObjList beanList = new JBObjList();
				JBObjList beanListD = new JBObjList();

				boolean firstTime = true;
				String marker = "";
				StringBuffer myRow = null;
				String chk = "";
				String TableTyp = "";
				//var for ofac status
				//var for Warning status
				String chkOfac = "";
				String chkWarn = "";
				int compar = 0;
				int indexRow = 0;
				int numrec = 0;
				int ct = 0;
				while (ct++ < datapro.eibs.master.JSEIBSProp.getMaxIterations()) {
					if (ct >= datapro.eibs.master.JSEIBSProp.getMaxIterations()) {
						System.out.println("MAX_ITERATION_REACHED_ERROR class:"	+ this.getClass().getName());
					}

					l0992 = (EDD0992DSMessage) newmessage;

					marker = l0992.getH01FLGMAS();

					if (firstTime) {
						firstTime = false;
						chk = "checked";

					} else {
						chk = "";
					}

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {

						beanList.addRow(l0992);

						if (marker.equals("+")) {
						   beanList.setShowNext(true);
						   beanList.setLastRec(
						   Integer.parseInt(l0992.getE01RECPOS()));

							break;
						}

						numrec = Integer.parseInt(l0992.getE01RECPOS());
						
						if (numrec >= 20) {
							beanList.setShowPrev(true);
						}

					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("EDD0992DSHelp", beanList);
				ses.setAttribute("userPO", userPO);


				try {

						if (msgError.getERRNUM().equals("0")) {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDD0992_print_books_mnt.jsp");
							callPage(
								LangPath + "EDD0992_print_books_mnt.jsp",
								req,
								res);
						} else {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDD0992_print_books_mnt.jsp");

							callPage(
								LangPath + "EDD0992_print_books_mnt.jsp",
								req,
								res);

						}
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}

			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Data Receiving");
		}
	}

	protected void procUpdate(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;

		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError =
				(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
					getClass().getClassLoader(),
					"datapro.eibs.beans.ELEERRMessage");
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");


		EDD0992DSMessage l0992 = null;
		// Send Initial data
		try {
			l0992 = (EDD0992DSMessage) mc.getMessageRecord("EDD0992DS");
			l0992.setH01USERID(user.getH01USR());
			l0992.setH01PROGRM("EDD0992DS");
			l0992.setH01TIMSYS(getTimeStamp());
			l0992.setH01SCRCOD("01");
			if(req.getParameter("H01OPECOD")!=null){
				l0992.setH01OPECOD(req.getParameter("H01OPECOD"));
				}
			if(req.getParameter("E01ACMACC")!=null){
				l0992.setE01PBTACC(req.getParameter("E01ACMACC"));
				}
			if(req.getParameter("E01PBTDTM")!=null){
				l0992.setE01PBTDTM(req.getParameter("E01PBTDTM"));
				}
			if(req.getParameter("E01PBTDTD")!=null){
				l0992.setE01PBTDTD(req.getParameter("E01PBTDTD"));
				}
			if(req.getParameter("E01PBTDTY")!=null){
				l0992.setE01PBTDTY(req.getParameter("E01PBTDTY"));
				}
			if(req.getParameter("E01PBTTIM")!=null){
				l0992.setE01PBTTIM(req.getParameter("E01PBTTIM"));
				}
			if(req.getParameter("E01BOKBAL")!=null){
				l0992.setE01BOKBAL(req.getParameter("E01BOKBAL"));
				}

			try {
				try {
					l0992.setE01PBTACC(userPO.getAccNum());
				} catch (Exception e) {
				}
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Input data error " + e);
			}
			if(req.getParameter("Pos")!=null){
				l0992.setE01RECPOS(req.getParameter("Pos"));
				}
				
			l0992.send();
			l0992.destroy();
			flexLog("EDD0992DS Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {

				try {
					msgError =
						(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
							getClass().getClassLoader(),
							"datapro.eibs.beans.ELEERRMessage");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgError = (ELEERRMessage) newmessage;

				showERROR(msgError);

				//beanList.setNoResult(true);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDD0992DS")) {

				JBObjList beanList = new JBObjList();
				JBObjList beanListD = new JBObjList();

				boolean firstTime = true;
				String marker = "";
				StringBuffer myRow = null;
				String chk = "";
				String TableTyp = "";
				//var for ofac status
				//var for Warning status
				String chkOfac = "";
				String chkWarn = "";
				int compar = 0;
				int indexRow = 0;
				int numrec = 0;
				int ct = 0;
				while (ct++ < datapro.eibs.master.JSEIBSProp.getMaxIterations()) {
					if (ct >= datapro.eibs.master.JSEIBSProp.getMaxIterations()) {
						System.out.println("MAX_ITERATION_REACHED_ERROR class:"	+ this.getClass().getName());
					}

					l0992 = (EDD0992DSMessage) newmessage;

					marker = l0992.getH01FLGMAS();

					if (firstTime) {
						firstTime = false;
						chk = "checked";

					} else {
						chk = "";
					}

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {

						beanList.addRow(l0992);

						if (marker.equals("+")) {
						   beanList.setShowNext(true);
						   beanList.setLastRec(
						   Integer.parseInt(l0992.getE01RECPOS()));

							break;
						}

						numrec = Integer.parseInt(l0992.getE01RECPOS());
						
						if (numrec >= 20) {
							beanList.setShowPrev(true);
						}

					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("EDD0992DSHelp", beanList);
				ses.setAttribute("userPO", userPO);


				try {

						if (msgError.getERRNUM().equals("0")) {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDD0992_print_books_mnt.jsp");
							callPage(
								LangPath + "EDD0992_print_books_mnt.jsp",
								req,
								res);
						} else {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDD0992_print_books_mnt.jsp");

							callPage(
								LangPath + "EDD0992_print_books_mnt.jsp",
								req,
								res);

						}
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}

			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Data Receiving");
		}
	}


	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {

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

			int screen = A_ENTER;
			String parametro;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EDD0992", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
						parametro = req.getParameter("RETORNO");
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						case R_FILTER :
							procReqFilter(mc, msgUser, req, res, session);
							break;
							// Actions
						case A_ENTER :
							procList(mc, msgUser, req, res, session);
							break;
						case A_UPDATE :
							procUpdate(mc, msgUser, req, res, session);
							break;
						
						default :
							res.sendRedirect(super.srctx + LangPath + super.devPage);
							break;
					}

				} catch (Exception e) {
					e.printStackTrace();
					int sck = super.iniSocket + 1;
					flexLog("Socket not Open(Port " + sck + "). Error: " + e);
					res.sendRedirect(super.srctx + LangPath + super.sckNotOpenPage);
					//return;
				} finally {
					mc.close();
				}

			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			}

		}

	}

	protected void showERROR(ELEERRMessage m) {
		if (logType != NONE) {

			flexLog("ERROR received.");

			flexLog("ERROR number:" + m.getERRNUM());
			flexLog("ERR001 = " + m.getERNU01() + " desc: " + m.getERDS01());
			flexLog("ERR002 = " + m.getERNU02() + " desc: " + m.getERDS02());
			flexLog("ERR003 = " + m.getERNU03() + " desc: " + m.getERDS03());
			flexLog("ERR004 = " + m.getERNU04() + " desc: " + m.getERDS04());
			flexLog("ERR005 = " + m.getERNU05() + " desc: " + m.getERDS05());
			flexLog("ERR006 = " + m.getERNU06() + " desc: " + m.getERDS06());
			flexLog("ERR007 = " + m.getERNU07() + " desc: " + m.getERDS07());
			flexLog("ERR008 = " + m.getERNU08() + " desc: " + m.getERDS08());
			flexLog("ERR009 = " + m.getERNU09() + " desc: " + m.getERDS09());
			flexLog("ERR010 = " + m.getERNU10() + " desc: " + m.getERDS10());

		}
	}

}