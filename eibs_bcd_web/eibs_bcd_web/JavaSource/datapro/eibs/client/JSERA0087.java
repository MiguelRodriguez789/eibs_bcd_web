package datapro.eibs.client;

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
import datapro.eibs.beans.DataTransaction;

public class JSERA0087 extends datapro.eibs.master.SuperServlet {


	// Action 
	// first screen
	protected static final int R_GET_YEAR = 100;
	final int A_TRANSACTION = 2;
	// second screen. list of deals 
	protected static final int R_GET_LIST = 200;

	protected String LangPath = "s";

	/**
	 * JSERA0082 constructor comment.
	 */
	public JSERA0087() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSERA0082");

	}
	/**
	 * This method was created by David Mavilla.
	 * 
	 */

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	// first screen list of formats
	protected void procGetYear(MessageContext mc, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		flexLog("Putting java beans into the session");
		ses.setAttribute("userPO", userPO);

		try {
			flexLog("About to call Page: " + LangPath
					+ "ERA0087_valuation_index_enter.jsp");
			callPage(LangPath + "ERA0087_valuation_index_enter.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
	}
	

	protected void procGetList(
	MessageContext mc,
	ESS0030DSMessage user,
	HttpServletRequest req,
	HttpServletResponse res,
	HttpSession ses)
	throws ServletException, IOException {

	MessageRecord newmessage = null;
	ERA008201Message mL0082 = null;
	ELEERRMessage msgError = null;
	JBListRec grpAccList = null;
	UserPos userPO = null;
	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	DataTransaction transData = new DataTransaction();

	boolean IsNotError = false;	
	flexLog("Opennig Socket Connection Branch");
	MessageContext mc820;
	mc820 = mc;

	userPO.setHeader20(req.getParameter("E01TB2YEA"));
	String typec = "";
	if(req.getParameter("H01FLGWK1")!=null){
		typec = req.getParameter("H01FLGWK1");
	}

	if(req.getParameter("CONFIRM")!=null){
		   userPO.setHeader16(req.getParameter("CONFIRM"));
	   }
	// Send Initial data
	try {
		flexLog("Send Initial Data");

		mL0082 = (ERA008201Message) mc820.getMessageRecord("ERA008201");
		mL0082.setH01USERID(user.getH01USR());
		mL0082.setH01PROGRM("ERA0082");
		mL0082.setH01TIMSYS(getTimeStamp());
		mL0082.setH01SCRCOD("01");
		mL0082.setH01OPECOD("0025");
		if(req.getParameter("E01TB2YEA")!=null){
			   mL0082.setE01TB2YEA(req.getParameter("E01TB2YEA"));
		   }
		mL0082.send();
		mL0082.destroy();


		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Message

	  try {
	  newmessage = mc820.receiveMessage();

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
	
	  // Receive Data
	try {
	  newmessage = mc820.receiveMessage();
	  int idxAcc = -1;

	  if (newmessage.getFormatName().equals("ERA008201")) {

		  		String dpto = "";
				String marker = "";
				String myFlag = "";
				int idxOpt = -1;
				int idxGrp = -1;
				int idxGrpAcc = -1;
				int colNum = 5;
				int colNumAcc = 35;
				try {
					grpAccList = new datapro.eibs.beans.JBListRec();
					grpAccList.init(colNumAcc);
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}
				String myGrp[] = new String[colNum];
				String myGrpAcc[] = new String[colNumAcc];
				String myOption[] = new String[colNum];
				boolean firstTime = true;
				for (int i = 0; i < colNum; i++) {
					myGrp[i] = "";
					myOption[i] = "";
				}
				for (int i = 0; i < colNumAcc; i++) {
					myGrpAcc[i] = "";
				}
				transData.clear();

				while (true) {
					mL0082 = (ERA008201Message) newmessage;
					marker = mL0082.getE01OPECDE();
					if (marker.equals("*")) {
						break;
					} else {
						if (firstTime) {
							userPO.setHeader1(mL0082.getE01TB2SE1());
							userPO.setHeader2(mL0082.getE01TB2SE2());
							userPO.setHeader3(mL0082.getE01TB2SE3());
							userPO.setHeader4(mL0082.getE01TB2SE4());
							userPO.setHeader5(mL0082.getE01TB2SE5());
							userPO.setHeader6(mL0082.getE01TB2SE6());
							userPO.setHeader7(mL0082.getE01TB2SE7());
							userPO.setHeader8(mL0082.getE01TB2SE8());
							userPO.setHeader9(mL0082.getE01TB2SE9());
							userPO.setHeader10(mL0082.getE01TB2SE0());
							userPO.setHeader11(mL0082.getE01TB2SEA());
							userPO.setHeader12(mL0082.getE01TB2SEB());
							userPO.setHeader13(mL0082.getE01TB2SEC());
							userPO.setHeader14(mL0082.getE01TB2SED());
							userPO.setHeader15(mL0082.getE01TB2SEE());
							newmessage = mc820.receiveMessage();
							firstTime = false;
						} else {
							myFlag = "" + idxOpt + "" + idxGrp;
							idxAcc++;
							myGrpAcc[0] = mL0082.getE01TB2YEA();
							myGrpAcc[1] = mL0082.getE01TB2DPT();
							myGrpAcc[2] = mL0082.getD01TB2DPT();
							myGrpAcc[3] = mL0082.getE01TB2IN1();
							myGrpAcc[4] = mL0082.getE01TB2IN2();
							myGrpAcc[5] = mL0082.getE01TB2IN3();
							myGrpAcc[6] = mL0082.getE01TB2IN4();
							myGrpAcc[7] = mL0082.getE01TB2IN5();
							myGrpAcc[8] = mL0082.getE01TB2IN6();
							myGrpAcc[9] = mL0082.getE01TB2IN7();
							myGrpAcc[10] = mL0082.getE01TB2IN8();
							myGrpAcc[11] = mL0082.getE01TB2IN9();
							myGrpAcc[12] = mL0082.getE01TB2IN0();
							myGrpAcc[13] = mL0082.getE01TB2INA();
							myGrpAcc[14] = mL0082.getE01TB2INB();
							myGrpAcc[15] = mL0082.getE01TB2INC();
							myGrpAcc[16] = mL0082.getE01TB2IND();
							myGrpAcc[17] = mL0082.getE01TB2INE();
							myGrpAcc[18] = mL0082.getE01TB2CTY();
							myGrpAcc[19] = mL0082.getD01TB2CTY();
							myGrpAcc[20] = mL0082.getE01TB2ST1();
							myGrpAcc[21] = mL0082.getE01TB2ST2();
							myGrpAcc[22] = mL0082.getE01TB2ST3();
							myGrpAcc[23] = mL0082.getE01TB2ST4();
							myGrpAcc[24] = mL0082.getE01TB2ST5();
							myGrpAcc[25] = mL0082.getE01TB2ST6();
							myGrpAcc[26] = mL0082.getE01TB2ST7();
							myGrpAcc[27] = mL0082.getE01TB2ST8();
							myGrpAcc[28] = mL0082.getE01TB2ST9();
							myGrpAcc[29] = mL0082.getE01TB2ST0();
							myGrpAcc[30] = mL0082.getE01TB2STA();
							myGrpAcc[31] = mL0082.getE01TB2STB();
							myGrpAcc[32] = mL0082.getE01TB2STC();
							myGrpAcc[33] = mL0082.getE01TB2STD();
							myGrpAcc[34] = mL0082.getE01TB2STE();
							grpAccList.addRow(myFlag, myGrpAcc);
							newmessage = mc820.receiveMessage();
						}
					}
				}

				if (grpAccList.getNoResult()) {
					transData.setTrNum("20");
				} else {
					transData.setTrNum("0");
				}

				} else
					flexLog("Message " + newmessage.getFormatName() + " received.");

				flexLog("Putting java beans into the session");
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("transData", transData);
				ses.setAttribute("trans", grpAccList);

				try {
					if (msgError.getERRNUM().equals("0")) {
							flexLog(
									"About to call Page: "
									+ LangPath
									+ "ERA0087_valuation_index_refere_list.jsp");
							callPage(LangPath + "ERA0087_valuation_index_refere_list.jsp?ROW=" + idxAcc, req, res);
					} else {
						//By error
						flexLog(
						"About to call Page: "
						+ LangPath
						+ "ERA0087_valuation_index_enter.jsp");
						 callPage(
						LangPath + "ERA0087_valuation_index_enter.jsp",
						req,
						 res);

					 }
				///**
				} catch (Exception e) {
					e.printStackTrace();
					flexLog("Error: " + e);
					throw new RuntimeException("Socket Communication Error");
				}

			} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
		finally
		{
		}
	}


protected void procUpdAcc(
	MessageContext mc,
	ESS0030DSMessage user,
	HttpServletRequest req,
	HttpServletResponse res,
	HttpSession ses) {
	JBListRec beanList = null;
	MessageRecord newmessage = null;
	ELEERRMessage msgError = null;
	ERA008201Message mL0082 = null;
	UserPos userPO = null;
	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	MessageContext mc820;
	mc820 = mc;

	int numrec = 0;
	int iw = 0;
	if(req.getParameter("RECNUM")!=null){
		   numrec = Integer.parseInt(req.getParameter("RECNUM"));
	   }

			try {
			for (int i = 0; i < numrec; i++) {
  				if(!req.getParameter("E01TB2DPT_"+i).equals("")){
				try {
				iw++;
				mL0082 = (ERA008201Message) mc820.getMessageRecord("ERA008201");
				mL0082.setH01USERID(user.getH01USR());
				mL0082.setH01PROGRM("ERA0082");
				mL0082.setH01TIMSYS(getTimeStamp());
				mL0082.setH01OPECOD("0004");
				mL0082.setH01FLGWK1(req.getParameter("H01FLGWK1"));
				mL0082.setE01TB2YEA(req.getParameter("E01TB2YEA"));
				mL0082.setE01TB2DPT(req.getParameter("E01TB2DPT_" + i));
				mL0082.setE01TB2CTY(req.getParameter("E01TB2CTY_" + i));
				mL0082.setE01TB2IN1(req.getParameter("E01TB2IN1_" + i));
				mL0082.setE01TB2IN2(req.getParameter("E01TB2IN2_" + i));
				mL0082.setE01TB2IN3(req.getParameter("E01TB2IN3_" + i));
				mL0082.setE01TB2IN4(req.getParameter("E01TB2IN4_" + i));
				mL0082.setE01TB2IN5(req.getParameter("E01TB2IN5_" + i));
				mL0082.setE01TB2IN6(req.getParameter("E01TB2IN6_" + i));
				mL0082.setE01TB2IN7(req.getParameter("E01TB2IN7_" + i));
				mL0082.setE01TB2IN8(req.getParameter("E01TB2IN8_" + i));
				mL0082.setE01TB2IN9(req.getParameter("E01TB2IN9_" + i));
				mL0082.setE01TB2IN0(req.getParameter("E01TB2IN0_" + i));
				mL0082.setE01TB2INA(req.getParameter("E01TB2INA_" + i));
				mL0082.setE01TB2INB(req.getParameter("E01TB2INB_" + i));
				mL0082.setE01TB2INC(req.getParameter("E01TB2INC_" + i));
				mL0082.setE01TB2IND(req.getParameter("E01TB2IND_" + i));
				mL0082.setE01TB2INE(req.getParameter("E01TB2INE_" + i));
				try {
					mL0082.setE01TB2ST1(req.getParameter("E01TB2ST1_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2ST1("N");
				}
				try {
					mL0082.setE01TB2ST2(req.getParameter("E01TB2ST2_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2ST2("N");
				}
				try {
					mL0082.setE01TB2ST3(req.getParameter("E01TB2ST3_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2ST3("N");
				}
				try {
					mL0082.setE01TB2ST4(req.getParameter("E01TB2ST4_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2ST4("N");
				}
				try {
					mL0082.setE01TB2ST5(req.getParameter("E01TB2ST5_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2ST5("N");
				}
				try {
					mL0082.setE01TB2ST6(req.getParameter("E01TB2ST6_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2ST6("N");
				}
				try {
					mL0082.setE01TB2ST7(req.getParameter("E01TB2ST7_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2ST7("N");
				}
				try {
					mL0082.setE01TB2ST8(req.getParameter("E01TB2ST8_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2ST8("N");
				}
				try {
					mL0082.setE01TB2ST9(req.getParameter("E01TB2ST9_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2ST9("N");
				}
				try {
					mL0082.setE01TB2ST0(req.getParameter("E01TB2ST0_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2ST0("N");
				}
				try {
					mL0082.setE01TB2STA(req.getParameter("E01TB2STA_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2STA("N");
				}
				try {
					mL0082.setE01TB2STB(req.getParameter("E01TB2STB_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2STB("N");
				}
				try {
					mL0082.setE01TB2STC(req.getParameter("E01TB2STC_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2STC("N");
				}
				try {
					mL0082.setE01TB2STD(req.getParameter("E01TB2STD_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2STD("N");
				}
				try {
					mL0082.setE01TB2STE(req.getParameter("E01TB2STE_"
							+ i));
				} catch (Exception e) {
					mL0082.setE01TB2STE("N");
				}

				mL0082.send();
				mL0082.destroy();
			  flexLog("ERA008201 Message Sent");
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
			// Receive Error
			try {
				newmessage = mc820.receiveMessage();

				if (newmessage.getFormatName().equals("ELEERR")) {


					msgError = (ELEERRMessage) newmessage;
					boolean IsNotError = msgError.getERRNUM().equals("0");
					if (IsNotError) {

					} else {
						msgError = (ELEERRMessage) newmessage;
						showERROR(msgError);
						flexLog("Putting java beans into the session");
						ses.setAttribute("error", msgError);

					try {

						flexLog(
							"About to call Page: "
								+ LangPath
								+ "ERA0082_valuation_index_depto_list.jsp");

						flexLog("About to call Page: " + LangPath + "ERA0087_valuation_index_refere_list.jsp");
						callPage(LangPath + "ERA0087_valuation_index_refere_list.jsp?ROW=" + iw, req, res);

					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
					return;
					}
				}
				} catch (Exception e) {
					e.printStackTrace();
					flexLog("Error: " + e);
					throw new RuntimeException("Socket Communication Error");
				}

			}
		   }

		   res.sendRedirect(
			   super.srctx
				   + "/servlet/datapro.eibs.client.JSERA0087?SCREEN=200&E01TB2YEA="+userPO.getHeader20()+"&H01FLGWK1="+req.getParameter("H01FLGWK1")+"&E01TB2DPT="+req.getParameter("E01TB2DPT")+"&D01TB2DPT="+req.getParameter("D01TB2DPT")+"&CONFIRM=Y");

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
		   }
			// END ADD RECORDS
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

			int screen = R_GET_YEAR;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("ERA0082", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {

						//Request
						// First screen, only list data
						case R_GET_YEAR :
							procGetYear(mc, msgUser, req, res, session);
							break;
						// Second screen, only list data
						case R_GET_LIST :
							procGetList(mc, msgUser, req, res, session);
							break;
						// Action
						case A_TRANSACTION :
							procUpdAcc(mc, msgUser, req, res, session);
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
