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

public class JSERA0088 extends datapro.eibs.master.SuperServlet {


	// Action 
	// first screen
	protected static final int R_GET_YEAR = 100;
	final int A_TRANSACTION = 2;
	// second screen. list of deals 
	protected static final int R_GET_LIST = 200;

	protected String LangPath = "s";

	/**
	 * JSERA0088 constructor comment.
	 */
	public JSERA0088() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSERA0088");

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
					+ "ERA0088_cities_by_fund_enter.jsp");
			callPage(LangPath + "ERA0088_cities_by_fund_enter.jsp", req, res);
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
	ERA008801Message mL0088 = null;
	ELEERRMessage msgError = null;
	JBListRec grpAccList = null;
	UserPos userPO = null;
	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	DataTransaction transData = new DataTransaction();

	boolean IsNotError = false;	
	flexLog("Opennig Socket Connection Branch");
	MessageContext mc820;
	mc820 = mc;

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

		mL0088 = (ERA008801Message) mc820.getMessageRecord("ERA008801");
		mL0088.setH01USERID(user.getH01USR());
		mL0088.setH01PROGRM("ERA0088");
		mL0088.setH01TIMSYS(getTimeStamp());
		mL0088.setH01SCRCOD("01");
		mL0088.setH01OPECOD("0025");
		if(req.getParameter("E01TB5CFG")!=null){
			   mL0088.setE01TB5CFG(req.getParameter("E01TB5CFG"));
				userPO.setHeader20(req.getParameter("E01TB5CFG"));
		   }
		if(req.getParameter("E01TB5MXD")!=null){
			   mL0088.setE01TB5MXD(req.getParameter("E01TB5MXD"));
				userPO.setHeader22(req.getParameter("E01TB5MXD"));
		   }
		mL0088.send();
		mL0088.destroy();


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

	  if (newmessage.getFormatName().equals("ERA008801")) {

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
					mL0088 = (ERA008801Message) newmessage;
					marker = mL0088.getE01OPECDE();
					if (marker.equals("*")) {
						break;
					} else {
						userPO.setHeader21(mL0088.getD01TB5CFG());

							myFlag = "" + idxOpt + "" + idxGrp;
							idxAcc++;
							myGrpAcc[0] = mL0088.getE01TB5DPT();
							myGrpAcc[1] = mL0088.getD01TB5DPT();
							myGrpAcc[2] = mL0088.getE01TB5CTY();
							myGrpAcc[3] = mL0088.getD01TB5CTY();
							myGrpAcc[4] = mL0088.getE01TB5MCC();
							myGrpAcc[5] = mL0088.getE01TB5MUC();
							grpAccList.addRow(myFlag, myGrpAcc);
							newmessage = mc820.receiveMessage();

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
									+ "ERA0088_cities_by_fund_list.jsp");
							callPage(LangPath + "ERA0088_cities_by_fund_list.jsp?ROW=" + idxAcc, req, res);
					} else {
						//By error
						flexLog(
						"About to call Page: "
						+ LangPath
						+ "ERA0088_cities_by_fund_enter.jsp");
						 callPage(
						LangPath + "ERA0088_cities_by_fund_enter.jsp",
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
	ERA008801Message mL0088 = null;
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
  				if(!req.getParameter("E01TB5DPT_"+i).equals("")){
				try {
				iw++;
				mL0088 = (ERA008801Message) mc820.getMessageRecord("ERA008801");
				mL0088.setH01USERID(user.getH01USR());
				mL0088.setH01PROGRM("ERA0088");
				mL0088.setH01TIMSYS(getTimeStamp());
				mL0088.setH01OPECOD("0004");
				mL0088.setH01FLGWK1(req.getParameter("H01FLGWK1"));
				mL0088.setE01TB5CFG(req.getParameter("E01TB5CFG"));
				mL0088.setE01TB5MXD(req.getParameter("E01TB5MXD"));
				mL0088.setE01TB5DPT(req.getParameter("E01TB5DPT_" + i));
				mL0088.setE01TB5CTY(req.getParameter("E01TB5CTY_" + i));
				
//				mL0088.setE01TB5MCC(req.getParameter("E01TB5MCC_" + i));
//				mL0088.setE01TB5MUC(req.getParameter("E01TB5MUC_" + i));
			mL0088.send();
				mL0088.destroy();
			  flexLog("ERA008801 Message Sent");
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
								+ "ERA0088_cities_by_fund_list.jsp");

						flexLog("About to call Page: " + LangPath + "ERA0088_cities_by_fund_list.jsp");
						callPage(LangPath + "ERA0088_cities_by_fund_list.jsp?ROW=" + iw, req, res);

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
				   + "/servlet/datapro.eibs.client.JSERA0088?SCREEN=200&E01TB5CFG="+userPO.getHeader20()+"&H01FLGWK1="+req.getParameter("H01FLGWK1")+"&E01TB5DPT="+req.getParameter("E01TB5DPT")+"&D01TB5DPT="+req.getParameter("D01TB5DPT")+"&CONFIRM=Y");

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
					mc = new MessageContext(super.getMessageHandler("ERA0088", req));

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
