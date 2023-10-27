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
import datapro.eibs.beans.DataTransaction;

public class JSEDP0788 extends datapro.eibs.master.SuperServlet {


	// Action 
	// first screen
	protected static final int R_GET_LIST = 100;
	final int A_TRANSACTION = 300;

	protected String LangPath = "s";

	/**
	 * JSEIE00000 constructor comment.
	 */
	public JSEDP0788() {
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

	protected void procGetList(
	MessageContext mc,
	ESS0030DSMessage user,
	HttpServletRequest req,
	HttpServletResponse res,
	HttpSession ses)
	throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDP078803Message msgPmnt = null;
	JBListRec pmntList = null;
	ELEERRMessage msgError = null;
	UserPos userPO = null;
	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	int colNum = 12;
	try {
		pmntList = new datapro.eibs.beans.JBListRec();
		pmntList.init(colNum);
	} catch (Exception ex) {
		flexLog("Error: " + ex);
	}
	String myRow[] = new String[colNum];
	// Send Initial data
	try {
		msgPmnt = (EDP078803Message) mc.getMessageRecord("EDP078803");
		msgPmnt.setH03USERID(user.getH01USR());
		msgPmnt.setH03PROGRM("EDP0788");
		msgPmnt.setH03TIMSYS(getTimeStamp());
		msgPmnt.setH03SCRCOD("01");
		msgPmnt.setH03OPECOD("0015");
		if(req.getParameter("DEAACC")!=null){
			msgPmnt.setE03DEAACC(req.getParameter("DEAACC"));
			userPO.setAccNum(req.getParameter("DEAACC"));
		};
		if(req.getParameter("E01PLTNPR")!=null){
			msgPmnt.setE03DLPNPR(req.getParameter("E01PLTNPR"));
			userPO.setIdentifier(req.getParameter("E01PLTNPR"));
		};
		if(req.getParameter("CRB")!=null){
			msgPmnt.setE03DLPCRB(req.getParameter("CRB"));
		};
		if(req.getParameter("CCY")!=null){
			msgPmnt.setE03DEACCY(req.getParameter("CCY"));
		};
		msgPmnt.send();
		msgPmnt.destroy();
		flexLog("EDP078803 Message Sent");

	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
		throw new RuntimeException("Socket Communication Error");
	}

	// Receive Error
	try {
		newmessage = mc.receiveMessage();

		if (newmessage.getFormatName().equals("ELEERR")) {
			msgError = (ELEERRMessage) newmessage;
			showERROR(msgError);

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);

		}
	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e + newmessage);
		throw new RuntimeException("Socket Communication Error Receiving");
	}

	// Receive Data
	try {
		newmessage = mc.receiveMessage();
	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e + newmessage);
		throw new RuntimeException("Socket Communication Error Receiving");
	}

	// Receive Data
	try {
//			newmessage = mc.receiveMessage();
		if (newmessage.getFormatName().equals("EDP078803")) {

//			JBObjList beanList = new JBObjList();

			boolean firstTime = true;

//		   beanList.setNoResult(true);

			char sel = ' ';
			String marker = "";
			String myFlag = "";
			myFlag = "";
			for (int i=0; i<colNum; i++) {
				myRow[i] = "";
			}

			while (true) {

				msgPmnt = (EDP078803Message)newmessage;

				marker = msgPmnt.getH03FLGMAS();

				if (marker.equals("*")) {
					break;
				}
				else {
					//Quote List
					myRow[0] =  Util.trim(msgPmnt.getE03DLPPNU());	// Quote Number
					myRow[1] =  Util.trim(msgPmnt.getE03DLPPDM());	// Date
					myRow[2] =  Util.trim(msgPmnt.getE03DLPPDD());	// Date
					myRow[3] =  Util.trim(msgPmnt.getE03DLPPDY());	// Date
					myRow[4] =  Util.trim(msgPmnt.getE03DLPPRI());	// Principal
					myRow[5] =  Util.trim(msgPmnt.getE03DLPINT());	// Interest
					myRow[6] =  Util.trim(msgPmnt.getE03DLPIIP());	// Interest Included
					myRow[7] =  Util.trim(msgPmnt.getH03FLGMAS());	// 
					myRow[8] =  Util.trim(msgPmnt.getE03DLPNPR());	// 
					myRow[9] =  ""+msgPmnt.getE03DLPCRB();	// 
					myRow[10] =  Util.trim(msgPmnt.getD03DLPCRB());	// 
					myRow[11] =  Util.trim(msgPmnt.getE03DEAACC());	// 
					pmntList.addRow(myFlag, myRow);
										
				}

				newmessage = mc.receiveMessage();

			}

			userPO.setHeader22("");

			if(req.getParameter("END")!=null){
				if(req.getParameter("END").equals("Y")){userPO.setHeader22("1");}
			}
			flexLog("Putting java beans into the session");
			ses.setAttribute("pmnt", pmntList);
			ses.setAttribute("userPO", userPO);
			try {
				 if (msgError.getERRNUM().equals("0")) {
					flexLog(
					"About to call Page: "
					+ LangPath
					+ "EDP0788_ln_pay_pln_det.jsp");
					callPage(LangPath + "EDP0788_ln_pay_pln_det.jsp", req, res);
				} else {
					//By error
					flexLog(
					"About to call Page: "
					+ LangPath
					+ "EDP0788_ln_pay_pln_det.jsp");
					 callPage(LangPath + "EDP0788_ln_pay_pln_det.jsp", req, res);
				 }

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}


		} else
			flexLog("Message " + newmessage.getFormatName() + " received.");

	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
		throw new RuntimeException("Socket Communication Data Receiving");
	}
	}


protected void procUpdAcc(
	MessageContext mc,
	ESS0030DSMessage user,
	HttpServletRequest req,
	HttpServletResponse res,
	HttpSession ses) {
	EDP078803Message msgPmnt = null;
	JBListRec pmntList = null;
	JBObjList beanList = null;
	MessageRecord newmessage = null;
	ELEERRMessage msgError = null;
	UserPos userPO = null;
	boolean IsNotError = true;
	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");



	int colNum = 12;

	try {
		pmntList = new JBListRec();
		pmntList.init(colNum);
	} catch (Exception ex) {
		flexLog("Error: " + ex);
	}

	String sel = " ";
	String myFlag = "";
	String myRow[] = new String[colNum];
	for (int i = 0; i < colNum; i++) {
		myRow[i] = "";
	}

	myRow[7] =  "1";	// 
	myRow[8] =  req.getParameter("E03DLPNPR");	// 
	myRow[9] =  req.getParameter("E03DLPCRB");	// 
	myRow[10] =  req.getParameter("D03DLPCRB");	// 
	myRow[11] =  req.getParameter("E03DEAACC");	// 
	pmntList.addRow(myFlag, myRow);

	for (int row = 1; row < 360; row++) {
		if (req.getParameter("DLPPNU_" + row) != null) {

		try {
			sel = req.getParameter("DLPPNU_" + row).toUpperCase();
			if (sel.equals(""))
				break;
		} catch (Exception e) {
			break;
		}

		myRow[0] = req.getParameter("DLPPNU_" + row);
		myRow[1] = req.getParameter("DLPPD1_" + row);
		myRow[2] = req.getParameter("DLPPD2_" + row);
		myRow[3] = req.getParameter("DLPPD3_" + row);
		myRow[4] = req.getParameter("DLPPRI_" + row);
		myRow[5] = req.getParameter("DLPINT_" + row);
		myRow[6] = req.getParameter("DLPIIP_" + row);
		myRow[7] = "";
		myRow[8] =  req.getParameter("E03DLPNPR");	// 
		myRow[9] =  req.getParameter("E03DLPCRB");	// 

		pmntList.addRow(myFlag, myRow);
		}
	}

		//Sending EDP078803
		try {

			msgPmnt = (EDP078803Message) mc.getMessageRecord("EDP078803");

			pmntList.initRow();
			while (pmntList.getNextRow()) {
				msgPmnt.setH03USERID(user.getH01USR());
				msgPmnt.setH03PROGRM("EDP0788");
				msgPmnt.setH03TIMSYS(getTimeStamp());
				msgPmnt.setH03SCRCOD("01");
				msgPmnt.setH03OPECOD("0005");

				try {
					msgPmnt.setE03DLPNPR(req.getParameter("E03DLPNPR"));
				} catch (Exception e) {
					flexLog("E03DLPNPR");
				}
				try {
					msgPmnt.setE03DEAACC(userPO.getAccNum());
				} catch (Exception e) {
					flexLog("E03DEAACC");
				}
				try {
					msgPmnt.setE03DLPCRB(req.getParameter("E03DLPCRB"));
				} catch (Exception e) {
					flexLog("E03DLPCRB");
				}

				try {
					msgPmnt.setE03DLPPNU(pmntList.getRecord(0)); //Quota
				} catch (Exception e) {
					flexLog("E03DLPPNU");
				}
				try {
					msgPmnt.setE03DLPPDM(pmntList.getRecord(1)); //Date
				} catch (Exception e) {
					flexLog("E03DLPPDM");
				}

				try {
					msgPmnt.setE03DLPPDD(pmntList.getRecord(2)); //Date
				} catch (Exception e) {
					flexLog("E03DLPPDD");
				}

				try {
					msgPmnt.setE03DLPPDY(pmntList.getRecord(3)); //Date
				} catch (Exception e) {
					flexLog("E03DLPPDY");
				}

				try {
					msgPmnt.setE03DLPPRI(pmntList.getRecord(4)); //Principal
				} catch (Exception e) {
					flexLog("E03DLPPRI");
				}
				try {
					msgPmnt.setE03DLPINT(pmntList.getRecord(5)); //Interest
				} catch (Exception e) {
					flexLog("E03DLPINT");
				}
				try {
					msgPmnt.setE03DLPIIP(pmntList.getRecord(6)); //Interest Included
				} catch (Exception e) {
					flexLog("E03DLPIIP");
				}
				try {
					msgPmnt.setH03FLGMAS(pmntList.getRecord(7));
				} catch (Exception e) {
					flexLog("H03FLGMAS");
				}

				msgPmnt.send();

				try {
					newmessage = mc.receiveMessage();

					if (newmessage.getFormatName().equals("ELEERR")) {


						msgError = (ELEERRMessage) newmessage;
						IsNotError = msgError.getERRNUM().equals("0");
					}
					} catch (Exception e) {
						e.printStackTrace();
						flexLog("Error: " + e);
						throw new RuntimeException("Socket Communication Error");
					}


			}

			msgPmnt.setH03FLGMAS("*");
			msgPmnt.send();
			// mc.sendMessage(msgDed);
			msgPmnt.destroy();
			try {
				newmessage = mc.receiveMessage();

				if (newmessage.getFormatName().equals("ELEERR")) {


					msgError = (ELEERRMessage) newmessage;
					IsNotError = msgError.getERRNUM().equals("0");
				}
				} catch (Exception e) {
					e.printStackTrace();
					flexLog("Error: " + e);
					throw new RuntimeException("Socket Communication Error");
				}

			flexLog("EDP078803 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	String PROD = "";
	if (msgPmnt.getH03FLGWK1().equals("")){
		PROD = "";
	}

	userPO.setHeader22("1");

	try {
			ses.setAttribute("userPO", userPO);
			res.sendRedirect(
				super.srctx
					+ "/servlet/datapro.eibs.creditproposal.JSEDP0788?SCREEN=100&E01PLTNPR="+userPO.getIdentifier()+"&H03FLGWK1="+msgPmnt.getH03FLGWK1()+"&END=Y");

	 } catch (Exception e) {
		 e.printStackTrace();
		 flexLog("Error: " + e);
		 throw new RuntimeException("Socket Communication Error");
	 }
//	END  EDP0788
		   	
}

	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {

		Socket s = null;
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

			int screen = R_GET_LIST;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					s = new Socket(super.hostIP, getInitSocket(req) + 1);
					s.setSoTimeout(super.sckTimeOut);
					mc =
						new MessageContext(
							new DataInputStream(
								new BufferedInputStream(s.getInputStream())),
							new DataOutputStream(
								new BufferedOutputStream(s.getOutputStream())),
							"datapro.eibs.beans");

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {

						//Request
						// First screen, only list data
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
					s.close();
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
