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

public class JSERA0083 extends datapro.eibs.master.SuperServlet {


	// Action 
	// first screen
	protected static final int R_GET_YEAR = 100;
	final int A_TRANSACTION = 2;
	// second screen. list of deals 
	protected static final int R_GET_LIST = 200;

	protected String LangPath = "s";

	/**
	 * JSERA0083 constructor comment.
	 */
	public JSERA0083() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSERA0083");

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
					+ "ERA0083_valuation_index_enter.jsp");
			callPage(LangPath + "ERA0083_valuation_index_enter.jsp", req, res);
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
	ERA008301Message mL0083 = null;
	ELEERRMessage msgError = null;
	UserPos userPO = null;
	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

	flexLog("Opennig Socket Connection Branch");
	MessageContext mc820;
	mc820 = mc;

	if(req.getParameter("CONFIRM")!=null){
		   userPO.setHeader12(req.getParameter("CONFIRM"));
	   }

	// Send Initial data
	try {
		flexLog("Send Initial Data");

		mL0083 = (ERA008301Message) mc820.getMessageRecord("ERA008301");
		mL0083.setH01USERID(user.getH01USR());
		mL0083.setH01PROGRM("ERA0083");
		mL0083.setH01TIMSYS(getTimeStamp());
		mL0083.setH01SCRCOD("01");
		mL0083.setH01OPECOD("0015");
		if(req.getParameter("E01TB3YEA")!=null){
			   mL0083.setE01TB3YEA(req.getParameter("E01TB3YEA"));
		   }
	    mL0083.setE01TB3DPT(req.getParameter("E01TB3DPT"));
	    mL0083.setE01TB3CTY(req.getParameter("E01TB3CTY"));
		mL0083.send();
		mL0083.destroy();


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

	  if (newmessage.getFormatName().equals("ERA008301")) {
		  mL0083 = (ERA008301Message) newmessage;

		} else
			flexLog("Message " + newmessage.getFormatName() + " received.");

				flexLog("Putting java beans into the session");
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("trans", mL0083);

				try {
					if (msgError.getERRNUM().equals("0")) {
						flexLog(
								"About to call Page: "
								+ LangPath
								+ "ERA0083_valuation_IVIUR_city_list.jsp");
						callPage(LangPath + "ERA0083_valuation_IVIUR_city_list.jsp", req, res);
					} else {
						//By error
						flexLog(
						"About to call Page: "
						+ LangPath
						+ "ERA0083_valuation_index_enter.jsp");
						 callPage(
						LangPath + "ERA0083_valuation_index_enter.jsp",
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
	ERA008301Message mL0083 = null;
	UserPos userPO = null;
	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	MessageContext mc820;
	mc820 = mc;
	try
	{
				mL0083 = (ERA008301Message) mc820.getMessageRecord("ERA008301");
				mL0083.setH01USERID(user.getH01USR());
				mL0083.setH01PROGRM("ERA0083");
				mL0083.setH01TIMSYS(getTimeStamp());
				mL0083.setH01OPECOD("0001");
				mL0083.setE01TB3YEA(req.getParameter("E01TB3YEA"));
				mL0083.setE01TB3DPT(req.getParameter("E01TB3DPT"));
				mL0083.setE01TB3CTY(req.getParameter("E01TB3CTY"));
/* 
				if(req.getParameter("E01TB3IN1")!=null){
					mL0083.setE01TB3IN1(req.getParameter("E01TB3IN1"));
				}
				if(req.getParameter("E01TB3IN2")!=null){
					mL0083.setE01TB3IN2(req.getParameter("E01TB3IN2"));
				}
				if(req.getParameter("E01TB3IN3")!=null){
					mL0083.setE01TB3IN3(req.getParameter("E01TB3IN3"));
				}
				if(req.getParameter("E01TB3IN4")!=null){
					mL0083.setE01TB3IN4(req.getParameter("E01TB3IN4"));
				}
				if(req.getParameter("E01TB3IN5")!=null){
					mL0083.setE01TB3IN5(req.getParameter("E01TB3IN5"));
				}
				if(req.getParameter("E01TB3IN6")!=null){
					mL0083.setE01TB3IN6(req.getParameter("E01TB3IN6"));
				}
				if(req.getParameter("E01TB3IN7")!=null){
					mL0083.setE01TB3IN7(req.getParameter("E01TB3IN7"));
				}
				if(req.getParameter("E01TB3IN8")!=null){
					mL0083.setE01TB3IN8(req.getParameter("E01TB3IN8"));
				}
				if(req.getParameter("E01TB3IN9")!=null){
					mL0083.setE01TB3IN9(req.getParameter("E01TB3IN9"));
				}
				if(req.getParameter("E01TB3IN0")!=null){
					mL0083.setE01TB3IN0(req.getParameter("E01TB3IN0"));
				}
*/
				try {
					// all the fields here
					java.util.Enumeration enu = mL0083.fieldEnumeration();
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
				} catch (Exception e) {
				}
				mL0083.send();
	}		
	catch (Exception e)	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}
			  flexLog("ERA008301 Message Sent");
			// Receive Error
			try {
				newmessage = mc820.receiveMessage();

				if (newmessage.getFormatName().equals("ELEERR")) {


					msgError = (ELEERRMessage) newmessage;
					boolean IsNotError = msgError.getERRNUM().equals("0");
					if (IsNotError) {
						msgError = (ELEERRMessage) newmessage;
						ses.setAttribute("error", msgError);
						ses.setAttribute("trans", mL0083);
					} else {
						msgError = (ELEERRMessage) newmessage;
						showERROR(msgError);
						flexLog("Putting java beans into the session");
						ses.setAttribute("error", msgError);
						ses.setAttribute("trans", mL0083);

					try {

						flexLog(
							"About to call Page: "
								+ LangPath
								+ "ERA0083_valuation_IVIUR_city_list.jsp");

						flexLog("About to call Page: " + LangPath + "ERA0083_valuation_IVIUR_city_list.jsp");
						callPage(LangPath + "ERA0083_valuation_IVIUR_city_list.jsp", req, res);

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

	
			try {

		   res.sendRedirect(
			   super.srctx
				   + "/servlet/datapro.eibs.client.JSERA0083?SCREEN=200&E01TB3YEA="+mL0083.getE01TB3YEA()+"&E01TB3DPT="+mL0083.getE01TB3DPT()+"&E01TB3CTY="+mL0083.getE01TB3CTY()+"&CONFIRM=Y");
			} catch (Exception e) {
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
					mc = new MessageContext(super.getMessageHandler("ERA0083", req));

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
