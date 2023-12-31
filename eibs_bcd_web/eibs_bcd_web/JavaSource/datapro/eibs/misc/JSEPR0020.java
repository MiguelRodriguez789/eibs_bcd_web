package datapro.eibs.misc;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Ramses Amaro
 */

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.LineNumberReader;
import java.io.StringReader;
import java.net.Socket;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPR0020DSMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSEPR0020 extends datapro.eibs.master.SuperServlet {

	private ServletConfig config = null;

	// entering options
	protected static final int R_IMPORT = 200;
	protected static final int A_IMPORT = 100;
	protected static final int R_EXPORT = 300;
	protected static final int A_EXPORT = 400;
	

	protected String LangPath = "S";
	protected String loanNumber = "";
	protected byte loanType = 0;

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSEPR0020() {
		super();
	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSEDL0130");

	}
	/**
	 * This method was created by David Mavilla.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}
	/**
	 * This method was created in VisualAge.
	 */

	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqExport(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();

			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		try {
			flexLog(
				"About to call Page: " + LangPath + "EPR0020_enter_file.jsp");
			callPage(LangPath + "EPR0020_enter_file.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
	}

	protected void procActionExport(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EPR0020DSMessage msgEPR = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		String st = "";
		StringBuffer buf = new StringBuffer();

		//read file
		try {
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			com.jspsmart.upload.File myFile =  mySmartUpload.getFiles().getFile(0);
				
			StringReader sr = new StringReader(myFile.getContentString());
			LineNumberReader lnr = new LineNumberReader(sr);
			String line = "";
			String linetosend = "";
			String iniLine = "{1100}";
			boolean firstTime = true;

			while (true) {
				line = lnr.readLine();
				// detection of eof
				if (line == null) {
					break;
				}
				linetosend = line;
				if (line.length() > 0 ) {
					int i = 0;
					int posIni = linetosend.indexOf(iniLine,i);
					int posFin = 0;
					while (posIni != -1) {
						posFin = linetosend.indexOf(iniLine, posIni + 1);
						if (posFin == -1) {
							msgEPR = new EPR0020DSMessage();
							msgEPR.setH01USERID(user.getH01USR());
							msgEPR.setH01PROGRM("EPR0020");
							msgEPR.setH01TIMSYS(getTimeStamp());
							msgEPR.setH01OPECOD("0001");							
							msgEPR.setH01FLGWK1("");
							msgEPR.setE01DATA(linetosend.substring(posIni));
							//msgEPR.send();
							mc.sendMessage(msgEPR);
							//	Receive Error Message
							 try
							 {
							   newmessage = mc.receiveMessage();
		  
							   if (newmessage.getFormatName().equals("ELEERR")) {
								 msgError = (ELEERRMessage)newmessage;
								 IsNotError = msgError.getERRNUM().equals("0");
								 flexLog("IsNotError = " + IsNotError);
								 showERROR(msgError);
							   }
							   else
								 flexLog("Message " + newmessage.getFormatName() + " received.");
							 }
							 catch (Exception e)
							 {
								 e.printStackTrace();
								 flexLog("Error: " + e);
								 throw new RuntimeException("Socket Communication Error");
							 }	
							if (!IsNotError) {
							   flexLog("Putting java beans into the session");
							   ses.setAttribute("error", msgError);	
							   try {
								   flexLog("About to call Page: " + LangPath + "EPR0020_enter_file.jsp");
								   callPage(LangPath + "EPR0020_enter_file.jsp", req, res);	
							   }
							   catch (Exception e) {
								   flexLog("Exception calling page " + e);
							   }				
							}			
							msgEPR = null;							
							break;	
						} else {
							msgEPR = new EPR0020DSMessage();
							msgEPR.setH01USERID(user.getH01USR());
							msgEPR.setH01PROGRM("EPR0020");
							msgEPR.setH01TIMSYS(getTimeStamp());
							msgEPR.setH01OPECOD("0001");							
							msgEPR.setH01FLGWK1("");
							msgEPR.setE01DATA(linetosend.substring(posIni, posFin));
							//msgEPR.send();
							mc.sendMessage(msgEPR);
							//	Receive Error Message
							 try
							 {
							   newmessage = mc.receiveMessage();
		  
							   if (newmessage.getFormatName().equals("ELEERR")) {
								 msgError = (ELEERRMessage)newmessage;
								 IsNotError = msgError.getERRNUM().equals("0");
								 flexLog("IsNotError = " + IsNotError);
								 showERROR(msgError);
							   }
							   else
								 flexLog("Message " + newmessage.getFormatName() + " received.");
							 }
							 catch (Exception e)
							 {
								 e.printStackTrace();
								 flexLog("Error: " + e);
								 throw new RuntimeException("Socket Communication Error");
							 }	
							if (!IsNotError) {
							   flexLog("Putting java beans into the session");
							   ses.setAttribute("error", msgError);	
							   try {
								   flexLog("About to call Page: " + LangPath + "EPR0020_enter_file.jsp");
								   callPage(LangPath + "EPR0020_enter_file.jsp", req, res);	
							   }
							   catch (Exception e) {
								   flexLog("Exception calling page " + e);
							   }				
							}			
							msgEPR = null;								
							posIni = posFin;
						}
					}
				}
			}

			lnr.close();
			sr.close();

			msgEPR = new EPR0020DSMessage();
			msgEPR.setH01USERID(user.getH01USR());
			msgEPR.setH01PROGRM("EPR0020");
			msgEPR.setH01TIMSYS(getTimeStamp());
			msgEPR.setH01OPECOD("0001");
			msgEPR.setH01FLGWK1("9");
			msgEPR.setE01DATA("");
			//msgEPR.send();
			mc.sendMessage(msgEPR);
			msgEPR.destroy();

			// Receive Error Message
			try {
				newmessage = mc.receiveMessage();

				if (newmessage.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage) newmessage;
					IsNotError = msgError.getERRNUM().equals("0");
					flexLog("IsNotError = " + IsNotError);
					if (!IsNotError) { //There are errors
						try {
							flexLog("Putting java beans into the session");
							ses.setAttribute("error", msgError);

							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EPR0020_enter_file.jsp");
							callPage(
								LangPath + "EPR0020_enter_file.jsp",
								req,
								res);

						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EPR0020_enter_file_confirm.jsp");
							callPage(
								LangPath + "EPR0020_enter_file_confirm.jsp",
								req,
								res);

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
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}

	protected void procReqImport(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();

			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		try {
			flexLog(
				"About to call Page: " + LangPath + "EPR0020_enter_import.jsp");
			callPage(LangPath + "EPR0020_enter_import.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
	}

	protected void procActionImport(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EPR0020DSMessage msgEPR = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgEPR = (EPR0020DSMessage) mc.getMessageRecord("EPR0020DS");
			msgEPR.setH01USERID(user.getH01USR());
			msgEPR.setH01PROGRM("EPR0020");
			msgEPR.setH01TIMSYS(getTimeStamp());
			msgEPR.setH01SCRCOD("01");
			msgEPR.setH01OPECOD("0002"); // Import

			msgEPR.send();
			msgEPR.destroy();

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
					msgError = new datapro.eibs.beans.ELEERRMessage();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgError = (ELEERRMessage) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EPR0020_enter_import.jsp");
					callPage(LangPath + "EPR0020_enter_import.jsp", req, res);

				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
				
			} else if (newmessage.getFormatName().equals("EPR0020DS")) {

				String marker = "";
				StringBuffer buf = new StringBuffer();

				while (true) {

					msgEPR = (EPR0020DSMessage) newmessage;
					marker = msgEPR.getH01FLGWK1();

					if (marker.equals("9")) {
						break;
					} else {

						buf.append(Util.unformatHTML(msgEPR.getE01DATA()));

					}

					newmessage = mc.receiveMessage();
				}

				try {

					res.setContentType("fedi/fede");
					res.addHeader("content-disposition","attachment; filename=IMPORT");

					ServletOutputStream out = (ServletOutputStream) res.getOutputStream();
					out.print(buf.toString());
					out.close();
					
				} catch (Exception e) {
					flexLog("Exception ServletOutputStream " + e);
				}

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

			int screen = A_EXPORT;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EPR0020", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						// BEGIN Entering
						// Request
						case R_IMPORT :
							procReqImport(msgUser, req, res, session);
							break;
						case R_EXPORT :
							procReqExport(msgUser, req, res, session);
							break;
						
							// Action 
						case A_IMPORT :
							procActionImport(mc, msgUser, req, res, session);
							break;
						case A_EXPORT :
							procActionExport(mc, msgUser, req, res, session);
							break;

						default :
							res.sendRedirect(
								super.srctx + LangPath + super.devPage);
							break;
					}

				} catch (Exception e) {
					e.printStackTrace();
					int sck = getInitSocket(req) + 1;
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