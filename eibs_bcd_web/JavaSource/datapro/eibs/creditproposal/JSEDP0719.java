package datapro.eibs.creditproposal;

/**
 * Insert the type's description here.
 * Creation date: (04/25/05 6:08:55 PM)
 * @author: John Andrade
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

public class JSEDP0719 extends datapro.eibs.master.SuperServlet {

	// entering options
	protected static final int R_FILTER = 100; //
	protected static final int R_LIST = 200; //
	protected static final int R_HEADER = 300;
	protected static final int R_HEADER_NEW = 310;
	protected static final int R_SAVE_HEADER = 350;
	protected static final int R_DETAIL_PRODUCT = 400;
	protected static final int R_NEXT_ACTIVITY = 500;
	protected static final int RCONTROLDOC = 550; //
	protected static final int RPRIORACTIV = 540; //
	protected static final int R_SAVE_NEXT_ACTIVITY = 600; //

	protected String LangPath = "S";

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSEDP0719() {
		super();
	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSEDP0719");

	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	/**
	 * This method was created by Orestes Garcia.
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 */

	/**************************************************************************/
	/**************************************************************************/
	/**************************************************************************/
	protected void procActionEnter(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageContext mc1;
		mc1 = mc;
		MessageRecord newmessage = null;
		EDP071901Message msgList = null;
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

		//RETRIEVE PARAMETERS---------------------------------------------------------
		if (req.getParameter("PRD") != null) {
			userPO.setProdCode(req.getParameter("PRD"));
		}

		if (req.getParameter("BNK") != null) {
			userPO.setBank(req.getParameter("BNK"));
		}

		if (req.getParameter("BRN") != null) {
			userPO.setBranch(req.getParameter("BRN"));
		}

		if (req.getParameter("RUT") != null) {
			userPO.setHeader15(req.getParameter("RUT"));
		}

		if (req.getParameter("CUS") != null) {
			userPO.setCusNum(req.getParameter("CUS"));
		}
		if (req.getParameter("CUN") != null) {
			userPO.setCusName(req.getParameter("CUN"));
		}

		//if (req.getParameter("opt") != null) {
		//	userPO.setHeader16(req.getParameter("opt"));
		//}

		//--------------------------------------------------------------------------------

		// Send Initial data--------------------------------------------------------------
		try {
			msgList = (EDP071901Message) mc.getMessageRecord("EDP071901");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDP071901");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			//msgList.setH01FLGWK3(req.getParameter("opt"));
			msgList.setE01PLPBNK(req.getParameter("BNK"));
			msgList.setE01PLPBRN(req.getParameter("BRN"));
			msgList.setE01PLPRUT(req.getParameter("RUT"));
			msgList.setE01CUSCUN(req.getParameter("CUS"));
			msgList.setE01PLTPR0(userPO.getProdCode());
			msgList.send();
			msgList.destroy();
			flexLog("EDP071901 Message Sent a.");
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

			if (newmessage.getFormatName().equals("EDP071901")) {

				JBObjList beanList = new JBObjList();

				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				String TableTyp = "";
				//var for ofac status
				//var for Warning status
				String chkOfac = "";
				String chkWarn = "";
				int compar = 0;
				int indexRow = 0;
				while (true) {

					msgList = (EDP071901Message) newmessage;

					marker = msgList.getH01FLGMAS();

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

						beanList.addRow(msgList);

						if (marker.equals("+")) {
							beanList.setShowNext(true);

							break;
						}
					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("EDP071901Help", beanList);
				ses.setAttribute("userPO", userPO);

				try {

					if (msgError.getERRNUM().equals("0")) {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDP0719_proposals_list.jsp");
						callPage(
							LangPath + "EDP0719_proposals_list.jsp",
							req,
							res);
					} else {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDP0719_proposals_filter.jsp");

						callPage(
							LangPath + "EDP071902_proposals_filter.jsp",
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

	protected void procHeader(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDP071901Message msgRT = null;
		EDP074501Message msgRTC = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		JBList beanList3 = null;
		JBObjList beanListC = new JBObjList();

		boolean IsNotError = false;
		int acctype = 0;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");


		//RETRIEVE PARAMETERS---------------------------------------------------------
		if (req.getParameter("BNK") != null) {
			userPO.setBank(req.getParameter("BNK"));
		}

		if (req.getParameter("BRN") != null) {
			userPO.setBranch(req.getParameter("BRN"));
		}

		if (req.getParameter("RUT") != null) {
			userPO.setHeader15(req.getParameter("RUT"));
		}

		if (req.getParameter("CUS") != null) {
			userPO.setCusNum(req.getParameter("CUS"));
		}

		if (req.getParameter("opt") != null) {
			userPO.setHeader16(req.getParameter("opt"));

			if (req.getParameter("opt").equals("8")) {
				userPO.setHeader16("1");
			}

		}

		// Send Initial data--------------------------------------------------------------
		try {
			msgRT = (EDP071901Message) mc.getMessageRecord("EDP071901");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDP071901");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0003");
			msgRT.setH01FLGWK3(req.getParameter("opt"));
			msgRT.setE01PLPBNK(req.getParameter("BNK"));
			msgRT.setE01PLPBRN(req.getParameter("BRN"));
			msgRT.setE01PLPRUT(req.getParameter("RUT"));
			msgRT.setE01CUSCUN(req.getParameter("CUS"));
			msgRT.setE01PLPRRE(req.getParameter("PROP"));
			msgRT.setE01PLTPR0(userPO.getProdCode());
			msgRT.send();
			msgRT.destroy();
			flexLog("EDP071901 Message Sent b");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error
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
				ses.setAttribute("optList3", beanList3);

			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDP071901")) {

				JBObjList beanList = new JBObjList();

				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				String TableTyp = "";
				//var for ofac status
				//var for Warning status
				String chkOfac = "";
				String chkWarn = "";
				int compar = 0;
				int indexRow = 0;
				beanList.setNoResult(true);
				while (true) {

					msgRT = (EDP071901Message) newmessage;

					marker = msgRT.getH01FLGMAS();
					//msgRT.getE01OPECDE();

					if (firstTime) {
						firstTime = false;
						chk = "checked";

					} else {
						beanList.setNoResult(false);

						chk = "";
					}

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {

						beanList.addRow(msgRT);

						if (marker.equals("+")) {
							beanList.setShowNext(true);

							break;
						}
					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("EDP071901Help", beanList);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("msgRT", msgRT);
				ses.setAttribute("msgRTC", msgRTC);

// TRAER COMENTARIOS
   if (req.getParameter("opt") != null) {

	   if (req.getParameter("opt").equals("8")) {
//		TRAER COMMENTARIOS
		MessageContext mc1;
		Socket s1 = null;
		flexLog("Opennig Socket Connection Branch");
		s1 = new Socket(super.hostIP, super.iniSocket + 1);
		s1.setSoTimeout(super.sckTimeOut);

		mc1 =
			new MessageContext(
				new DataInputStream(
					new BufferedInputStream(s1.getInputStream())),
				new DataOutputStream(
					new BufferedOutputStream(s1.getOutputStream())),
				"datapro.eibs.beans");

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		// Send Initial data--------------------------------------------------------------
		try {
			msgRTC = (EDP074501Message) mc1.getMessageRecord("EDP074501");
			msgRTC.setH02USERID(user.getH01USR());
			msgRTC.setH02PROGRM("EDP074501");
			msgRTC.setH02TIMSYS(getTimeStamp());
			msgRTC.setH02SCRCOD("01");
			msgRTC.setH02OPECOD("0015");
			msgRTC.setE02DPVNPR(req.getParameter("PROP"));
			msgRTC.send();
			msgRTC.destroy();
			flexLog("EDP074501 Message Sent b");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error
		try {
			newmessage = mc1.receiveMessage();

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

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);

			}

		// Receive Data
			newmessage = mc1.receiveMessage();

			if (newmessage.getFormatName().equals("EDP074501")) {

//				JBObjList beanListC = new JBObjList();

				firstTime = true;
				marker = "";
				myFlag = "";
				myRow = null;
				chk = "";
				TableTyp = "";
				//var for ofac status
				//var for Warning status
				chkOfac = "";
				chkWarn = "";
				compar = 0;
				indexRow = 0;
				beanListC.setNoResult(true);
				while (true) {

					msgRTC = (EDP074501Message) newmessage;

					marker = msgRTC.getH02FLGMAS();
					//msgRT.getE01OPECDE();

					if (firstTime) {
						firstTime = false;
						chk = "checked";

					} else {
						beanListC.setNoResult(false);

						chk = "";
					}

					if (marker.equals("*")) {
						beanListC.setShowNext(false);
						break;
					} else {

						beanListC.addRow(msgRTC);

						if (marker.equals("+")) {
							beanListC.setShowNext(true);

							break;
						}
					}
					newmessage = mc1.receiveMessage();
				}  //END WHILE
		   
			} // ENDIF

				flexLog("Putting java beans into the session");

				ses.setAttribute("EDP074501Help", beanListC);
				ses.setAttribute("msgRTC", msgRTC);

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e + newmessage);
				throw new RuntimeException("Socket Communication Error Receiving");
			}


//		FIN TRAER COMENTARIOS			




	   }

   }


				try {

					if (msgError.getERRNUM().equals("0")) {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDP0719_proposals_header_maintenance.jsp");
						callPage(
							LangPath + "EDP0719_proposals_header_maintenance.jsp",
							req,
							res);
					} else {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDP0719_proposals_filter.jsp");

						callPage(
							LangPath + "EDP0719_proposals_filter.jsp",
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

	protected void procSave400(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDP071901Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		int acctype = 0;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		if (req.getParameter("opt") != null) {
			userPO.setHeader16(req.getParameter("opt"));
		}

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgRT = (EDP071901Message) ses.getAttribute("brnDetails");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDP071901");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0099");
			msgRT.setH01FLGWK1(req.getParameter("opt"));
			// all the fields here
			java.util.Enumeration enu = msgRT.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			mc.sendMessage(msgRT);
			msgRT.destroy();
			flexLog("EDP071901 Message Sent c");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDP071901")) {
				try {
					msgRT = new datapro.eibs.beans.EDP071901Message();
					flexLog("EDP071901 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgRT = (EDP071901Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("brnDetails", msgRT);
				ses.setAttribute("userPO", userPO);

				//
				if (IsNotError) { // There are no errors
					res.sendRedirect(
						super.srctx
							+ "/servlet/datapro.eibs.creditproposal.JSEDP0719?SCREEN=400&opt="
							+ userPO.getHeader16());

				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDP0704_recaudos_maintenance.jsp");
						callPage(
							LangPath + "EDP0704_recaudos_maintenance.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}

				}

				//				
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}

	protected void procProductPos(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		//
		UserPos userPO = null;
		boolean IsNotError = false;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		MessageContext mc1;
		mc1 = mc;

		//	MessageRecord newmessage = null;
		//	ELEERRMessage msgError = null;

		int inptOPT = 0;
		//crear variable para que se pueda leer en las pantallas			
		userPO.setHeader16(req.getParameter("opt"));

		inptOPT = Integer.parseInt(req.getParameter("opt"));

		// inptOPT=1;

		switch (inptOPT) {
			case 1 : //new
				userPO.setHeader17("0");
				userPO.setHeader18("0");
				procReqNew(mc, user, req, res, ses);
				break;
			case 2 : //Maintenance
				userPO.setHeader17("1");
				userPO.setHeader18("0");
				//procReqMaintenance(mc, user, req, res, ses);
				break;
			case 3 : //Delete
				userPO.setHeader17("1");
				userPO.setHeader18("1");
				//procReqDelete(mc, user, req, res, ses);
				break;
			case 5 : //Consulta
				userPO.setHeader17("1");
				userPO.setHeader18("1");
				//procReqConsulta(mc, user, req, res, ses);
				break;
			default :
				//Consulta
				res.sendRedirect(
					super.srctx
						+ "/servlet/datapro.eibs.creditproposer.JSEDP0704?SCREEN=500");
				break;
		}
	}

	/********************************************************************************************/
	/********************************************************************************************/
	/********************************************************************************************/

	protected void procReqNew(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EDP071901Message msgRT = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("NEW");
		ses.setAttribute("userPO", userPO);

		msgRT = new datapro.eibs.beans.EDP071901Message();

		//	msgRT.setE01DPXCFO(userPO.getHeader9());
		//	msgRT.setE01DPXCLI(userPO.getHeader11());
		//	msgRT.setE01DPXGLN(userPO.getHeader12());

		ses.setAttribute("brnDetails", msgRT);
		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDP0719_proposals_producto_maintenance.jsp");
			callPage(
				LangPath + "EDP0719_proposals_producto_maintenance.jsp",
				req,
				res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}

	/************************************************************************************************/
	/************************************************************************************************/
	/************************************************************************************************/
	protected void procReqPGM(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EDP071901Message msgRT = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		int inptOPT = 0;

		inptOPT = Integer.parseInt(req.getParameter("opt"));
		if (req.getParameter("opt") != null) {
			userPO.setHeader16(req.getParameter("opt"));
		}

		switch (inptOPT) {
			case 1 : // Req. Header

				try {
					msgError = new ELEERRMessage();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				res.sendRedirect(
					super.srctx
						+ "/servlet/datapro.eibs.creditproposal.JSEDP0719?SCREEN=310");
				break;

			default :
				res.sendRedirect(
					super.srctx
						+ "/servlet/datapro.eibs.creditproposal.JSEDP0719?SCREEN=800");
				break;
		}
	}

	protected void procReqNewHeader(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EDP071901Message msgRT = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("NEW");
		ses.setAttribute("userPO", userPO);

		ses.setAttribute("msgRT", msgRT);

		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDP0719_proposals_header_maintenance.jsp");
			callPage(
				LangPath + "EDP0719_proposals_header_maintenance.jsp",
				req,
				res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}

	protected void procRControlDoc(
	  MessageContext mc,
	  ESS0030DSMessage user,
	  HttpServletRequest req,
	  HttpServletResponse res,
	  HttpSession ses)
	  throws ServletException, IOException {

	  MessageRecord newmessage = null;
	  EDP071901Message msgRT = null;
	  ELEERRMessage msgError = null;
	  UserPos userPO = null;
	  String strNextScreen = "";
	  boolean IsNotError = false;
	  int acctype = 0;
	  userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

	  try {
		  msgError = new datapro.eibs.beans.ELEERRMessage();
	  } catch (Exception ex) {
		  flexLog("Error: " + ex);
	  }

	  String strParameters = "";
	  if (req.getParameter("TASK") != null) {
		  strNextScreen = LangPath + req.getParameter("TASK");
	  }

	  //RETRIEVE PARAMETERS---------------------------------------------------------
	  if (req.getParameter("BNK") != null) {
		  userPO.setBank(req.getParameter("BNK"));
	  }

	  if (req.getParameter("BRN") != null) {
		  userPO.setBranch(req.getParameter("BRN"));
	  }

	  if (req.getParameter("RUT") != null) {
		  userPO.setHeader15(req.getParameter("RUT"));
	  }

	  if (req.getParameter("CUS") != null) {
		  userPO.setCusNum(req.getParameter("CUS"));
	  }

	  String strParam = req.getParameter("PARAM");

	  String strParam1 = strParam.substring(0, 1);
	  String strParam2 = strParam.substring(2, 3);
	  String strParam3 = strParam.substring(4, 5);

	  userPO.setHeader16(strParam1);
	  userPO.setHeader17(strParam2);
	  userPO.setHeader18(strParam3);
	  //----------------------------------------------------------------

	  // Send Initial data
	  try {
		  flexLog("Send Initial Data");
		  msgRT = (EDP071901Message) ses.getAttribute("msgRT");
		  msgRT.setH01USERID(user.getH01USR());
		  msgRT.setH01PROGRM("EDP071901");
		  msgRT.setH01TIMSYS(getTimeStamp());
		  msgRT.setH01SCRCOD("01");
		  msgRT.setH01OPECOD(req.getParameter("OPECOD")); //099
		  msgRT.setH01FLGWK3(strParam1);
		  msgRT.setE01DPPPXX(req.getParameter("E01DPPPXX"));
		  msgRT.setE01DPPDXX(req.getParameter("E01DPPDXX"));

//actualiza los campos de la pantalla en la clase all the fields here
		  java.util.Enumeration enu = msgRT.fieldEnumeration();
		  MessageField field = null;
		  String value = null;
		  while (enu.hasMoreElements()) {
			  field = (MessageField) enu.nextElement();
			  try {
				  value = req.getParameter(field.getTag()).toUpperCase();
				  if (value != null) {
					  field.setString(value);
				  }
			  } catch (Exception e) {
			  }
		  }
//importante! mueve clase a campos de la pantalla
		ses.setAttribute("msgRT", msgRT);

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		try {

			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDP0719_control_docum.jsp");
			callPage(LangPath + "EDP0719_control_docum.jsp?CUSW="+ msgRT.getE01DPPPXX()
      													+"&CUSNAW="
        													+ msgRT.getE01CUSNA1()
        													+"&NPRW="
        													+ msgRT.getE01PLPNPR()
        													+"&PACT="
        													+ msgRT.getE01DPPPXX()
        													+"&DPACT="
        													+ msgRT.getE01DPPDXX(), req, res);

		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}

	protected void procRPriorActiv(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDP071901Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		int acctype = 0;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Send Initial Data");


			msgRT = (EDP071901Message) ses.getAttribute("msgRT");

			// all the fields here
			java.util.Enumeration enu = msgRT.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			ses.setAttribute("msgRT", msgRT);

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		String strNextScreen = "";
		if (req.getParameter("TASK") != null) {
			strNextScreen = LangPath + req.getParameter("TASK");
		}

		try {
			flexLog("About to call Page: " + strNextScreen);
			callPage(strNextScreen, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}

	//	Next Activity
	protected void procReqNext_Activity(
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

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		int inptOPT = 0;
		String OPECOD = "";
		String PARAM = "";
		inptOPT = Integer.parseInt(req.getParameter("opt"));
		OPECOD = req.getParameter("OPECOD");
		PARAM = req.getParameter("PARAM");

		switch (inptOPT) {
			case 1 : // Apertura		
				procNext_Activity(mc, user, req, res, ses);
				break;
			case 2 : // Mext Activity		
				procNext_Activity(mc, user, req, res, ses);
				break;
			case 9 : // Mext Activity		
				procNext_Activity(mc, user, req, res, ses);
				break;
			default :
				res.sendRedirect(super.srctx + LangPath + super.devPage);
				break;
		}
	}

	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	protected void procNext_Activity(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EDP071901Message msgDoc = null;
		UserPos userPO = null;
		JBObjList beanListC = new JBObjList();

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("NEXT ACTIVITY");

		if (req.getParameter("OPECOD") != null) {
			userPO.setHeader22(req.getParameter("OPECOD"));
		}
		if (req.getParameter("TASK") != null) {
			userPO.setHeader23(req.getParameter("TASK"));
		}

		// --------------------------------------------------------------
		String strNextScreen = "";
		if (req.getParameter("TASK") != null) {
			strNextScreen = LangPath + req.getParameter("TASK");
		}
		//		String strParameters = ""; 
		//		if (req.getParameter("PARAM") != null) {
		//			 strParameters = LangPath+req.getParameter("PARAM");
		//		}		
		if (req.getParameter("PARAM") != null) {
			userPO.setHeader21(req.getParameter("PARAM"));
		}

		String strParam = req.getParameter("PARAM");

		String strParam1 = strParam.substring(0, 1);
		String strParam2 = strParam.substring(2, 3);
		String strParam3 = strParam.substring(4, 5);

		userPO.setHeader16(strParam1);
		userPO.setHeader17(strParam2);
		userPO.setHeader18(strParam3);
		//----------------------------------------------------------------
		// Receive Data
		try {

			if (req.getParameter("CURRCODE") != null) {

				JBObjList bl = (JBObjList) ses.getAttribute("EDP071901Help");
				int idx = Integer.parseInt(req.getParameter("CURRCODE"));
				bl.setCurrentRow(idx);
				msgDoc = (EDP071901Message) bl.getRecord();

				flexLog("Putting java beans into the session");
				ses.setAttribute("userPO", userPO);
			}

			//
				ses.setAttribute("msgRT", msgDoc);

			JBList beanLP4 = null;
			String myFlagP4 = "";
			String myOptionP4 = "";
			try {
				beanLP4 = new datapro.eibs.beans.JBList();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			if (msgDoc.getE01DPPD01() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP01()
						+ "\">"
						+ msgDoc.getE01DPPD01()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD02() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP02()
						+ "\">"
						+ msgDoc.getE01DPPD02()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD03() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP03()
						+ "\">"
						+ msgDoc.getE01DPPD03()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD04() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP04()
						+ "\">"
						+ msgDoc.getE01DPPD04()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD05() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP05()
						+ "\">"
						+ msgDoc.getE01DPPD05()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD06() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP06()
						+ "\">"
						+ msgDoc.getE01DPPD06()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD07() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP07()
						+ "\">"
						+ msgDoc.getE01DPPD07()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD08() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP08()
						+ "\">"
						+ msgDoc.getE01DPPD08()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD09() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP09()
						+ "\">"
						+ msgDoc.getE01DPPD09()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD10() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP10()
						+ "\">"
						+ msgDoc.getE01DPPD10()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD11() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP11()
						+ "\">"
						+ msgDoc.getE01DPPD11()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD12() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP12()
						+ "\">"
						+ msgDoc.getE01DPPD12()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD13() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP14()
						+ "\">"
						+ msgDoc.getE01DPPD14()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD14() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP15()
						+ "\">"
						+ msgDoc.getE01DPPD15()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD15() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP16()
						+ "\">"
						+ msgDoc.getE01DPPD16()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD16() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP17()
						+ "\">"
						+ msgDoc.getE01DPPD17()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD17() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP18()
						+ "\">"
						+ msgDoc.getE01DPPD18()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD18() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP19()
						+ "\">"
						+ msgDoc.getE01DPPD19()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD19() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP20()
						+ "\">"
						+ msgDoc.getE01DPPD20()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD20() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP21()
						+ "\">"
						+ msgDoc.getE01DPPD21()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD21() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP22()
						+ "\">"
						+ msgDoc.getE01DPPD22()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD22() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP23()
						+ "\">"
						+ msgDoc.getE01DPPD23()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}
			if (msgDoc.getE01DPPD23() != "") {
				myOptionP4 =
					"<option value=\""
						+ msgDoc.getE01DPPP24()
						+ "\">"
						+ msgDoc.getE01DPPD24()
						+ "</option>";
				beanLP4.addRow(myFlagP4, myOptionP4);
			}

			ses.setAttribute("optLP4", beanLP4);
			
			
// TRAER COMMENTARIOS
   MessageRecord newmessage = null;
   EDP074501Message msgRTC = null;
   ELEERRMessage msgError = null;
   boolean IsNotError = false;
   int acctype = 0;

   try {
	   msgError = new datapro.eibs.beans.ELEERRMessage();
   } catch (Exception ex) {
	   flexLog("Error: " + ex);
   }

   // Send Initial data--------------------------------------------------------------
   try {
	   msgRTC = (EDP074501Message) mc.getMessageRecord("EDP074501");
	   msgRTC.setH02USERID(user.getH01USR());
	   msgRTC.setH02PROGRM("EDP074501");
	   msgRTC.setH02TIMSYS(getTimeStamp());
	   msgRTC.setH02SCRCOD("01");
	   msgRTC.setH02OPECOD("0015");
	   msgRTC.setE02DPVNPR(msgDoc.getE01PLPNPR());
	   msgRTC.send();
	   msgRTC.destroy();
	   flexLog("EDP074501 Message Sent b");
   } catch (Exception e) {
	   e.printStackTrace();
	   flexLog("Error: " + e);
	   throw new RuntimeException("Socket Communication Error");
   }

   // Receive Error
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

		   flexLog("Putting java beans into the session");
		   ses.setAttribute("error", msgError);

	   }

   // Receive Data
	   newmessage = mc.receiveMessage();

	   if (newmessage.getFormatName().equals("EDP074501")) {

//		   JBObjList beanListC = new JBObjList();

		   boolean firstTime = true;
		   String marker = "";
		   String myFlag = "";
		   StringBuffer myRow = null;
		   String chk = "";
		   String TableTyp = "";
		   //var for ofac status
		   //var for Warning status
		   String chkOfac = "";
		   String chkWarn = "";
		   int compar = 0;
		   int indexRow = 0;
		   beanListC.setNoResult(true);
		   while (true) {

			   msgRTC = (EDP074501Message) newmessage;

			   marker = msgRTC.getH02FLGMAS();
			   //msgRT.getE01OPECDE();

			   if (firstTime) {
				   firstTime = false;
				   chk = "checked";

			   } else {
				   beanListC.setNoResult(false);

				   chk = "";
			   }

			   if (marker.equals("*")) {
				   beanListC.setShowNext(false);
				   break;
			   } else {

				   beanListC.addRow(msgRTC);

				   if (marker.equals("+")) {
					   beanListC.setShowNext(true);

					   break;
				   }
			   }
			   newmessage = mc.receiveMessage();
		   }  //END WHILE
		   
	   } // ENDIF

		   flexLog("Putting java beans into the session");

		   ses.setAttribute("EDP074501Help", beanListC);
		   ses.setAttribute("msgRTC", msgRTC);

	   } catch (Exception e) {
		   e.printStackTrace();
		   flexLog("Error: " + e + newmessage);
		   throw new RuntimeException("Socket Communication Error Receiving");
	   }


// FIN TRAER COMENTARIOS			
			

			//
			try {
				flexLog("About to call Page: " + strNextScreen);
				callPage(strNextScreen, req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	protected void procSave400Ruta(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDP071901Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		String strNextScreen = "";
		boolean IsNotError = false;
		int acctype = 0;
		MessageContext mcC = null;
		mcC = mc;
		
		Socket sC = null;
		flexLog("Opennig Socket Connection Bank");
		sC = new Socket(super.hostIP, super.iniSocket + 1);
		sC.setSoTimeout(super.sckTimeOut);
		
		mcC =
			new MessageContext(
				new DataInputStream(
					new BufferedInputStream(sC.getInputStream())),
				new DataOutputStream(
					new BufferedOutputStream(sC.getOutputStream())),
				"datapro.eibs.beans");

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		String strParameters = "";
		if (req.getParameter("TASK") != null) {
			strNextScreen = LangPath + req.getParameter("TASK");
		}

		//RETRIEVE PARAMETERS---------------------------------------------------------
		if (req.getParameter("BNK") != null) {
			userPO.setBank(req.getParameter("BNK"));
		}

		if (req.getParameter("BRN") != null) {
			userPO.setBranch(req.getParameter("BRN"));
		}

		if (req.getParameter("RUT") != null) {
			userPO.setHeader15(req.getParameter("RUT"));
		}

		if (req.getParameter("CUS") != null) {
			userPO.setCusNum(req.getParameter("CUS"));
		}

		String strParam = req.getParameter("PARAM");

		String strParam1 = strParam.substring(0, 1);
		String strParam2 = strParam.substring(2, 3);
		String strParam3 = strParam.substring(4, 5);

		userPO.setHeader16(strParam1);
		userPO.setHeader17(strParam2);
		userPO.setHeader18(strParam3);
		//----------------------------------------------------------------

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgRT = (EDP071901Message) ses.getAttribute("msgRT");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDP071901");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD(req.getParameter("OPECOD")); //099
			msgRT.setH01FLGWK3(strParam1);
			msgRT.setE01DPPPXX(req.getParameter("E01DPPPXX"));
			msgRT.setE01DPPDXX(req.getParameter("E01DPPDXX"));


//			BEGIN UPDATE COMM
			EDP074501Message msgRTC = null;

			// Send Initial data
			try {
				flexLog("Send Initial Data");
				msgRTC = (EDP074501Message) ses.getAttribute("msgRTC");
				msgRTC.setH02USERID(user.getH01USR());
				msgRTC.setH02PROGRM("EDP074501");
				msgRTC.setH02TIMSYS(getTimeStamp());
				msgRTC.setH02SCRCOD("01");
				msgRTC.setH02OPECOD("0002"); 
			   msgRTC.setE02DPVNPR(msgRT.getE01PLPNPR());

//		actualiza los campos de la pantalla en la clase all the fields here
				java.util.Enumeration enuC = msgRTC.fieldEnumeration();
				MessageField fieldC = null;
				String valueC = null;
				while (enuC.hasMoreElements()) {
					fieldC = (MessageField) enuC.nextElement();
					try {
						valueC = req.getParameter(fieldC.getTag()).toUpperCase();
						if (valueC != null) {
							fieldC.setString(valueC);
						}
					} catch (Exception e) {
					}
				}
//		envia
				mcC.sendMessage(msgRTC);
///			  msgRTC.destroy();

// prueba validacion desde multiples programas
   // Receive Error Message
   try {
	   newmessage = mcC.receiveMessage();

	   if (newmessage.getFormatName().equals("ELEERR")) {
		   msgError = (ELEERRMessage) newmessage;
		   IsNotError = msgError.getERRNUM().equals("0");
		   flexLog("IsNotError = " + IsNotError);
		   showERROR(msgError);
	   } else
		   flexLog("Message " + newmessage.getFormatName() + " received.");

   } catch (Exception e) {
	   e.printStackTrace();
	   flexLog("Error: " + e);
	   throw new RuntimeException("Socket Communication Error");
   }

// prueba validacion desde multiples programas

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}


// END UPDATE COMM


// actualiza los campos de la pantalla en la clase all the fields here
			java.util.Enumeration enu = msgRT.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}
//envia
			mc.sendMessage(msgRT);

// clean class
///		   msgRT.destroy();
		   flexLog("EDP071901 Message Sent c");


		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDP071901")) {
				try {
					msgRT = new datapro.eibs.beans.EDP071901Message();
					flexLog("EDP071901 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgRT = (EDP071901Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
//				ses.setAttribute("brnDetails", msgRT);
//				ses.setAttribute("userPO", userPO);

				//
				if (IsNotError) { // There are no errors
					res.sendRedirect(
						super.srctx
							+ "/servlet/datapro.eibs.creditproposal.JSEDP0719?SCREEN=200&BNK="
							+ userPO.getBank()
							+ "&BRN="
							+ userPO.getBranch()
							+ "&RUT="
							+ userPO.getHeader15()
							+ "&CUS="
							+ userPO.getCusNum());

				} else { // There are errors
					try {

						flexLog("About to call Page: " + strNextScreen);
						callPage(strNextScreen, req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}

				}

				//				
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
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

			int screen = R_FILTER;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EDP0719", req));
					

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						// Requests
						case R_FILTER :
							//TODO Implementar nuevamente
							//procReqFilter(mc, msgUser, req, res, session);
							break;
						case R_LIST :
							procActionEnter(mc, msgUser, req, res, session);
							break;
						case R_HEADER :
							procHeader(mc, msgUser, req, res, session);
							break;
						case R_HEADER_NEW :
							procHeader(mc, msgUser, req, res, session);
							break;
						case R_SAVE_HEADER :
							procSave400(mc, msgUser, req, res, session);
							break;
						case R_DETAIL_PRODUCT :
							procProductPos(mc, msgUser, req, res, session);
							break;
						case RCONTROLDOC :
							procRControlDoc(mc, msgUser, req, res, session);
							break;
						case RPRIORACTIV :
							procRPriorActiv(mc, msgUser, req, res, session);
							break;
						case R_NEXT_ACTIVITY :
							procReqNext_Activity(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
						case R_SAVE_NEXT_ACTIVITY :
							procSave400Ruta(mc, msgUser, req, res, session);
							break;
						default :
							res.sendRedirect(
								super.srctx + LangPath + super.devPage);
							break;
					}

				} catch (Exception e) {
					e.printStackTrace();
					int sck = super.iniSocket + 1;
					flexLog("Socket not Open(Port " + sck + "). Error: " + e);
					res.sendRedirect(
						super.srctx + LangPath + super.sckNotOpenPage);
					//return;
				} finally {
					mc.close();
				}

			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(
					super.srctx + LangPath + super.sckNotRespondPage);
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