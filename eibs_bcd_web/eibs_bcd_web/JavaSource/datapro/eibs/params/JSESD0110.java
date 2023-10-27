package datapro.eibs.params;
 
/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.beans.Beans;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.*;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0110 extends datapro.eibs.master.SuperServlet {

	protected static final int R_ENTER = 1;
	protected static final int R_LIST = 2;
	protected static final int A_MAINT = 3;
	protected static final int A_PROCESS = 4;
	protected static final int A_DELETE = 5;

	protected String LangPath = "S";

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSESD0110() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSESD0110");

	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	/**
 * This method was created in VisualAge.
 */


	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqEnter(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		ESD011001Message holMsg = null;

		try {
			holMsg = new datapro.eibs.beans.ESD011001Message();
			holMsg.setE01SELCTR(user.getE01CTR());
			holMsg.setE01SELYEAR(user.getE01RDY());
			ses.setAttribute("holMsg", holMsg);
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "ESD0110_hollidays_enter.jsp");
			callPage(
				LangPath + "ESD0110_hollidays_enter.jsp",
				req,
				res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}

	}
	
	protected void procReqList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD011001Message holMsg = null;
		ELEERRMessage msgError = null;
		JBList beanList = null;
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
			holMsg = (ESD011001Message) mc.getMessageRecord("ESD011001");
			holMsg.setH01USERID(user.getH01USR());
			holMsg.setH01PROGRM("ESD011001");
			holMsg.setH01TIMSYS(getTimeStamp());
			holMsg.setH01SCRCOD("01");
			holMsg.setH01OPECOD("0015");

			try {
				holMsg.setE01SELCTR(req.getParameter("E01SELCTR"));
			}
			catch  (Exception ex) {
				holMsg.setE01SELCTR("");		
			}
			
			try {
				holMsg.setE01SELRGN(req.getParameter("E01SELRGN"));
			}
			catch  (Exception ex) {
				holMsg.setE01SELRGN("");		
			}
			
			try {
				holMsg.setE01SELYEAR(req.getParameter("E01SELYEAR"));
			}
			catch  (Exception ex) {
				holMsg.setE01SELYEAR("");		
			}
			try {
				holMsg.setE01HOF001(req.getParameter("E01HOF001"));
			}
			catch  (Exception ex) {
				holMsg.setE01HOF001("");		
			}
			try {
				holMsg.setE01HOF002(req.getParameter("E01HOF002"));
			}
			catch  (Exception ex) {
				holMsg.setE01HOF002("");		
			}

			
			holMsg.send();
			holMsg.destroy();
			flexLog("ESD011001 Message Sent");
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

				// showERROR(msgError);
				//beanList.setNoResult(true);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				IsNotError = msgError.getERRNUM().equals("0");

			} 
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		try {
			  newmessage = mc.receiveMessage();
								
				if (newmessage.getFormatName().equals("ESD011001")) {
					try {
						holMsg = new ESD011001Message();
						flexLog("ESD011001 Message Received");
						} catch (Exception ex) {
							flexLog("Error: " + ex);
						}
						
					holMsg = (ESD011001Message) newmessage;
						
					flexLog("Putting java beans into the session");
					ses.setAttribute("error", msgError);
					ses.setAttribute("holMsg", holMsg);
					ses.setAttribute("userPO", userPO);

					if (IsNotError) { // There are no errors
						try {
							flexLog("About to call Page: " + LangPath
									+ "ESD0110_hollidays_maint.jsp");
							callPage(LangPath + "ESD0110_hollidays_maint.jsp", req,	res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else { // There are errors
						try {
							flexLog("About to call Page: " + LangPath
									+ "ESD0590_branch_maintenance.jsp");
							callPage(LangPath + "ESD0110_hollidays_enter.jsp", req,	res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}

				} else
					flexLog("Message " + newmessage.getFormatName() + " received.");
					
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Data Receiving");
		}
	}
	
	protected void procActMaint(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD011001Message holMsg = null;
		ELEERRMessage msgError = null;
		JBList beanList = null;
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
			holMsg = (ESD011001Message) mc.getMessageRecord("ESD011001");
			holMsg.setH01USERID(user.getH01USR());
			holMsg.setH01PROGRM("ESD011001");
			holMsg.setH01TIMSYS(getTimeStamp());
			holMsg.setH01SCRCOD("01");
			holMsg.setH01OPECOD("0005");
			
//			all the fields here
			java.util.Enumeration enu = holMsg.fieldEnumeration();
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
			
			holMsg.send();
			holMsg.destroy();
			flexLog("ESD011001 Message Sent");
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

				// showERROR(msgError);
				//beanList.setNoResult(true);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				IsNotError = msgError.getERRNUM().equals("0");


			} 
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		try {
			  newmessage = mc.receiveMessage();
								
				if (newmessage.getFormatName().equals("ESD011001")) {
					try {
						holMsg = new ESD011001Message();
						flexLog("ESD011001 Message Received");
						} catch (Exception ex) {
							flexLog("Error: " + ex);
						}
						
						holMsg = (ESD011001Message) newmessage;
						
						flexLog("Putting java beans into the session");
						ses.setAttribute("error", msgError);
						ses.setAttribute("holMsg", holMsg);
						ses.setAttribute("userPO", userPO);


						if (IsNotError) { // There are no errors
							try {
								flexLog("About to call Page: " + LangPath
										+ "ESD0590_branch_maintenance.jsp");
								callPage(LangPath + "ESD0110_hollidays_enter.jsp", req,	res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						} else { // There are errors
							try {
								flexLog("About to call Page: " + LangPath
										+ "ESD0110_hollidays_maint.jsp");
								callPage(LangPath + "ESD0110_hollidays_maint.jsp", req, res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						}

				} else
					flexLog("Message " + newmessage.getFormatName() + " received.");
					
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Data Receiving");
		}
		}

	
/*
 * 
 * Borra el dia feriad
 * @see javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
 */	
	
	protected void procActDelete(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageRecord newmessage = null;
			ESD011001Message holMsg = null;
			ELEERRMessage msgError = null;
			JBList beanList = null;
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
				holMsg = (ESD011001Message) mc.getMessageRecord("ESD011001");
				holMsg.setH01USERID(user.getH01USR());
				holMsg.setH01PROGRM("ESD011001");
				holMsg.setH01TIMSYS(getTimeStamp());
				holMsg.setH01SCRCOD("01");
				holMsg.setH01OPECOD("0005");
				
//				all the fields here
				java.util.Enumeration enu = holMsg.fieldEnumeration();
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
				
				holMsg.send();
				holMsg.destroy();
				flexLog("ESD011001 Message Sent");
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

					// showERROR(msgError);
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
									
					if (newmessage.getFormatName().equals("ESD011001")) {
						try {
							holMsg = new ESD011001Message();
							flexLog("ESD011001 Message Received");
							} catch (Exception ex) {
								flexLog("Error: " + ex);
							}
							
							holMsg = (ESD011001Message) newmessage;
							
							flexLog("Putting java beans into the session");
							ses.setAttribute("error", msgError);
							ses.setAttribute("holMsg", holMsg);
							ses.setAttribute("userPO", userPO);

						try {
							flexLog("About to call Page: " + LangPath + "ESD0110_hollidays_enter.jsp");
							callPage(LangPath + "ESD0110_hollidays_enter.jsp", req, res);
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

			int screen = R_ENTER;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("ESD0110", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						case R_ENTER :
							procReqEnter(msgUser, req, res, session );
							break;
						case R_LIST :
							procReqList( mc, msgUser, req, res, session );
							break;
						case A_MAINT :
							procActMaint( mc, msgUser, req, res, session );
							break;
						case A_DELETE :
							procActDelete( mc, msgUser, req, res, session);
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
}