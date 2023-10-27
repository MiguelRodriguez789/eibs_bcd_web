package datapro.eibs.creditproposal;

/** 
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla???????????????????????????
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;


import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSEDP0725 extends datapro.eibs.master.SuperServlet {

	// Action 
	protected static final int R_BRANCH_LIST = 100;
	protected static final int R_BRANCH_LIST_GAR = 200;

	protected static final int A_UPDASIGN = 300;
	protected static final int RGARIBSCOPY = 510;

	protected static final int A_POSITION  = 800;

	protected static final int R_ENTER = 1;
	protected static final int R_NEW = 300;


	protected String LangPath = "S";

	/**
	 * JSEIE00000 constructor comment.
	 */
	public JSEDP0725() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSEIE00000");

	}
	/**
	 * This method was created by David Mavilla.
	 * 
	 */

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	protected void procReqEnterBranch(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		try {

			msgError = new ELEERRMessage();
			userPO = new UserPos();
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

			try {
				flexLog(
					"About to call Page: "
						+ LangPath
						+ "EDP0725_changeprod_enter.jsp");
				callPage(LangPath + "EDP0725_changeprod_enter.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
	
		}


	protected void procReqBranchList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDP072501Message l07251 = null;
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

		// Send Initial data
		try {
			l07251 = (EDP072501Message) mc.getMessageRecord("EDP072501");
			l07251.setH01USERID(user.getH01USR());
			l07251.setH01PROGRM("EDP072501");
			l07251.setH01TIMSYS(getTimeStamp());
			l07251.setH01SCRCOD("01");
			l07251.setH01OPECOD("0015");

			if(req.getParameter("Pos")!=null){
				l07251.setE01DPGLNU(req.getParameter("Pos"));
				}

			l07251.send();
			l07251.destroy();
			flexLog("EDP072501 Message Sent");
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

			if (newmessage.getFormatName().equals("EDP072501")) {

				JBObjList beanList = new JBObjList();
				JBObjList beanListD = new JBObjList();

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
				int numrec = 0;
				while (true) {

					l07251 = (EDP072501Message) newmessage;

					marker = l07251.getE01OPECDE();

					if (firstTime) {
						firstTime = false;
						chk = "checked";
						beanList.setFirstRec(
						Integer.parseInt(l07251.getE01DPGLNU()));

					} else {
						chk = "";
					}

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {

						beanList.addRow(l07251);

						if (marker.equals("+")) {
							beanList.setShowNext(true);
							beanList.setLastRec(
							Integer.parseInt(l07251.getE01DPGLNU()));
							break;
						}
						numrec = Integer.parseInt(l07251.getE01DPGLNU());
						if (numrec == 21) {
							beanList.setShowPrev(true);
						}

					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("EDP072501Help", beanList);
				ses.setAttribute("userPO", userPO);


				try {

						if (msgError.getERRNUM().equals("0")) {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDP0725_branch_list.jsp");
							callPage(
								LangPath + "EDP0725_branch_list.jsp",
								req,
								res);
						} else {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDP0725_branch_list.jsp");

							callPage(
								LangPath + "EDP0725_branch_list.jsp",
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


	protected void procReqBranchGar(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDP072501Message l07251 = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		JBListRec beanList = null;
		JBListRec gcodeList = null;	
		JBListRec gcodeListR = null;	
		
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
		if (req.getParameter("NPR") != null) {
			userPO.setHeader4(req.getParameter("NPR"));
		}
		if (req.getParameter("CUN") != null) {
			userPO.setCusNum(req.getParameter("CUN"));
		}
		if (req.getParameter("NAM") != null) {
			userPO.setCusName(req.getParameter("NAM"));
		}
//		if (req.getParameter("EST") != null) {
//			userPO.setType(req.getParameter("EST"));
//		}

		if (req.getParameter("opt") != null) {
			userPO.setHeader16(req.getParameter("opt"));
		}

		// Send Initial data. LISTA DE GARANTIAS
		try {
			l07251 = (EDP072501Message) mc.getMessageRecord("EDP072501");
			l07251.setH01USERID(user.getH01USR());
			l07251.setH01PROGRM("EDP072501");
			l07251.setH01TIMSYS(getTimeStamp());
			l07251.setH01SCRCOD("01");
			l07251.setH01OPECOD("0016");
			l07251.setE01DPCNPR(userPO.getHeader4());
			l07251.setE01DPCCUN(userPO.getCusNum());
			l07251.send();
			l07251.destroy();
			flexLog("EDP072501 Message Sent");
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

			if (newmessage.getFormatName().equals("EDP072501")) {

				JBObjList beanListM = new JBObjList();
				JBObjList beanListD = new JBObjList();
				JBObjList beanListR = new JBObjList();


				int colNum = 11;
				int gaColNum = 11;
						try {
							beanList = (datapro.eibs.beans.JBListRec) Beans.instantiate(getClass().getClassLoader(), "datapro.eibs.beans.JBListRec");
							beanList.init(colNum);
							gcodeList = (datapro.eibs.beans.JBListRec) Beans.instantiate(getClass().getClassLoader(), "datapro.eibs.beans.JBListRec");
							gcodeList.init(gaColNum);
							gcodeListR = (datapro.eibs.beans.JBListRec) Beans.instantiate(getClass().getClassLoader(), "datapro.eibs.beans.JBListRec");
							gcodeListR.init(gaColNum);

						} 
						catch (Exception ex) {
							flexLog("Error: " + ex); 
						}

						boolean firstTime = true;
						String marker = "";
						String myFlag = "";
						String myFlag1 = "";
						String myGaCode[] = new String[gaColNum];
						for (int i=0; i<gaColNum; i++) {
							myGaCode[i] = "";
						}
						String myRow[] = new String[colNum];
						for (int i=0; i<colNum; i++) {
							myRow[i] = "";
						}
			
						while (true) {

							l07251 = (EDP072501Message)newmessage;

							marker = l07251.getE01OPECDE();

							if (marker.equals("*")) {
								beanListM.setShowNext(false);
								beanListR.setShowNext(false);
								beanListD.setShowNext(false);
						
								break;
							}
							else {

								// REGISTROS DE GARANTIA PROPUESTA //
								 if (l07251.getH01FLGWK2().equals("")) { 
								 myGaCode[0] = l07251.getE01DPCTYP(); 
								 myGaCode[1] = l07251.getE01DPCIDN(); 
								 myGaCode[2] = l07251.getE01DPCSEQ(); 
								 myGaCode[3] = l07251.getE01DPCDES(); 
								 myGaCode[4] = l07251.getE01DPCAPA(); 
								 myGaCode[5] = l07251.getE01DPGDES(); 
								 myGaCode[9] = l07251.getE01DPCCOU(); 
 
								 gcodeList.addRow(myFlag1, myGaCode);

								 beanListM.addRow(l07251);

								}
								// REGISTROS DE GARANTIA IBS//
								 if (l07251.getH01FLGWK2().equals("R")) { 
								 myGaCode[0] = l07251.getE01ROCREF(); 
								 myGaCode[1] = l07251.getE01ROCTYP(); 
								 myGaCode[2] = l07251.getE01ROCFAA(); 
								 myGaCode[3] = l07251.getE01ROCOWN(); 
								 myGaCode[4] = l07251.getE01ROCNAM(); 
								 myGaCode[9] = l07251.getE01DPCCOU(); 
 
								 gcodeListR.addRow(myFlag1, myGaCode);

								 beanListR.addRow(l07251);

								}
								// REGISTROS DE GARANTES PROPUESTA //
								if (l07251.getH01FLGWK2().equals("D")){ 
								  try{
									myRow[0] = l07251.getE01DPGSGR(); // 0
//									myRow[1] = l07251.getE01DPGTIP(); // 1
									myRow[2] = l07251.getE01DPGDES(); // 2
									myRow[3] = l07251.getE01DPCSEQ(); // 3
									myRow[4] = l07251.getE01DPGIDN(); // 4
									myRow[5] = l07251.getE01DPGIPY(); // 5
									myRow[6] = l07251.getE01DPGIPM(); // 6
									myRow[7] = l07251.getE01DPGIPD(); // 7
									myRow[8] = l07251.getE01DPGRTE(); // 8
									myRow[9] = l07251.getE01DPCCOU(); 

									if (l07251.getE01DPGCRG().equals("1")){ 
										myRow[1] = "AVALISTA";
									}
									if (l07251.getE01DPGCRG().equals("2")){ 
										myRow[1] = "CO-SOLICITANTE";
									}
									if (l07251.getE01DPGCRG().equals("3")){ 
										myRow[1] = "FIADOR";
									}
									beanListD.addRow(l07251);

								  }
								  catch (Exception e){
								  }
								  //este es el campo de rompimiento por grupo
								  myFlag= l07251.getE01DPCSEQ();
								  beanList.addRow(myFlag, myRow);
								}
							}
							newmessage = mc.receiveMessage();

						}

				flexLog("Putting java beans into the session");
				ses.setAttribute("gaList", beanList); 			
				ses.setAttribute("gaCodeList", gcodeList);		
				ses.setAttribute("gaCodeListR", gcodeListR);
				ses.setAttribute("error", msgError);


				ses.setAttribute("EDP072501Help", beanListM);
				ses.setAttribute("EDP072501HelpD", beanListD);
				ses.setAttribute("EDP072501HelpR", beanListR);
				ses.setAttribute("userPO", userPO);
				try {

						if (msgError.getERRNUM().equals("0")) {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDP0725_branch_list1.jsp");
							callPage(
								LangPath + "EDP0725_branch_list1.jsp",
								req,
								res);
						} else {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDP0725_branch_list.jsp");

							callPage(
								LangPath + "EDP0725_branch_list.jsp",
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

	
	protected void procUpdAsign(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		MessageRecord newmessage = null;
		EDP072501Message msg725 = null;
		ELEERRMessage msgError = null;
		MessageContext mc725;
		mc725 = mc;

		int colNum = 2;
		String myRow[] = new String[colNum];
		JBListRec pmntList = new JBListRec();
		pmntList.init(colNum);
		for (int row = 0; row < 100; row++) {
			if (req.getParameter("E01ROCREFN" + row) != null) {
				myRow[0] = req.getParameter("E01ROCREFN" + row);
				myRow[1] = req.getParameter("E01DPCCOUN" + row);
				pmntList.addRow("", myRow);
			}
		}
		for (int row = 0; row < 100; row++) {
			if (req.getParameter("E01ROCREFP" + row) != null) {
				myRow[0] = req.getParameter("E01ROCREFP" + row);
				myRow[1] = req.getParameter("E01DPCCOUP" + row);
				pmntList.addRow("", myRow);
			}
		}
		

		pmntList.initRow();
		userPO.setIdentifier(userPO.getHeader4());
		while (pmntList.getNextRow()) {
			try {
			msg725 = (EDP072501Message) mc725.getMessageRecord("EDP072501");
			msg725.setH01USERID(user.getH01USR());
			msg725.setH01PROGRM("EDP0725");
			msg725.setH01TIMSYS(getTimeStamp());
			msg725.setH01SCRCOD("01");
			msg725.setH01OPECOD("0020");
			msg725.setE01DPCNPR(userPO.getHeader4());
			try {
				msg725.setE01ROCREF(pmntList.getRecord(0));
			} catch (Exception e) {
			}
			try {
				msg725.setE01DPCCOU(pmntList.getRecord(1));
			} catch (Exception e) {
			}

			msg725.send();
			msg725.destroy();
			flexLog("ERA008201 Message Sent");
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

				}
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e + newmessage);
				throw new RuntimeException("Socket Communication Error Receiving");
			}
		}

		try {
			res.sendRedirect(
			super.srctx
			   + "/servlet/datapro.eibs.creditproposal.JSEDP0725?SCREEN=200&NPR="+ userPO.getHeader4()+"&CUN=" + userPO.getCusNum() +"&NAM="+ userPO.getCusName()+"&opt=2");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		// fin actualizacion

	}
	
	protected void procRGARIBSCOPY(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDP072501Message l0725 = null;
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
			l0725 = (EDP072501Message) mc.getMessageRecord("EDP072501");
			l0725.setH01USERID(user.getH01USR());
			l0725.setH01PROGRM("EDP072501");
			l0725.setH01TIMSYS(getTimeStamp());
			l0725.setH01SCRCOD("01");
			l0725.setH01OPECOD("0022");
//			l0725.setH01FLGWK1(userPO.getHeader16());
			l0725.setE01DPCCUN(userPO.getCusNum());
			l0725.setE01DPCNPR(userPO.getHeader4());
			l0725.setE01ROCREF(req.getParameter("IDAVAL"));
 
			// all the fields here
			java.util.Enumeration enu = l0725.fieldEnumeration();
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

			mc.sendMessage(l0725);
			l0725.destroy();
			flexLog("EDP072501 Message Sent");
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

			if (newmessage.getFormatName().equals("EDP072501")) {
				try {
					l0725 = new datapro.eibs.beans.EDP072501Message();
					flexLog("EDP072501 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				l0725 = (EDP072501Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("l0725", l0725);
				ses.setAttribute("userPO", userPO);

				//
					if (IsNotError) { // There are no errors

						res.sendRedirect(
							super.srctx
								+ "/servlet/datapro.eibs.creditproposal.JSEDP0725?SCREEN=200");

					} else { // There are errors
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDP0725_branch_list1.jsp");
							callPage(
								LangPath + "EDP0725_branch_list1.jsp",
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

			int screen = A_POSITION;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc =  new MessageContext(super.getMessageHandler("EDP0725", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {

						//Request
						case R_ENTER :
							procReqEnterBranch(mc, msgUser, req, res, session);
							break;
						case R_BRANCH_LIST :
							procReqBranchList(mc, msgUser, req, res, session);
							break;
						case R_BRANCH_LIST_GAR :
							procReqBranchGar(mc, msgUser, req, res, session);
							break;
						case A_UPDASIGN :
							procUpdAsign(mc, msgUser, req, res, session);
							break;
						case RGARIBSCOPY :
							procRGARIBSCOPY(mc, msgUser, req, res, session);
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
