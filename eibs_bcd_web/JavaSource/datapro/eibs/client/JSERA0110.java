package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDP018301Message;
import datapro.eibs.beans.ERA011001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageContext;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSERA0110 extends JSEIBSServlet {
	
	protected static final int A_ENTER = 1;	
	protected static final int A_PROCESS = 2;
	protected String LangPath = "S";

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
	}

	protected void procReqList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0183", req);
			EDP018301Message msgHelp = (EDP018301Message) mp.getMessageRecord("EDP018301");
			msgHelp.setH01USERID(user.getH01USR());
			msgHelp.setH01PROGRM("EDP0183");
			msgHelp.setH01TIMSYS(getTimeStamp());
			msgHelp.setH01SCRCOD("91");
			msgHelp.setH01OPECOD("0015");
			try {
				msgHelp.setE01TABCFL(req.getParameter("codtbl").trim());
			} catch (Exception e) {
				msgHelp.setE01TABCFL("");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("EDP0183HELP", list);
				
				pageName = "ERA0110_select_coll_report.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	protected void procActionList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses) {

			JBObjList bl = (JBObjList) ses.getAttribute("EDP0183HELP");

			String pageName = "";
			int numrec = 0;
			String codTab = "";
			String headerChecked = "";
			String recordChecked = "";
			String recTab= "";
			if(req.getParameter("RECNUM")!=null){
				   numrec = Integer.parseInt(req.getParameter("RECNUM"));
			   }

			// record with general parameters
			MessageProcessor mp = null;

			try {
			mp = getMessageProcessor("ERA0110", req);
			ERA011001Message msgRT = (ERA011001Message) mp.getMessageRecord("ERA011001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("ERA011001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0005");
			setMessageRecord(req, msgRT);
			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
			
			// first record to clear file
			try {
				mp = getMessageProcessor("EDP0183", req);
				EDP018301Message msgHelp = (EDP018301Message) mp.getMessageRecord("EDP018301");
				msgHelp.setH01USERID(user.getH01USR());
				msgHelp.setH01PROGRM("EDP0183");
				msgHelp.setH01TIMSYS(getTimeStamp());
				msgHelp.setH01SCRCOD("91");
				msgHelp.setH01OPECOD("0004");
				mp.sendMessage(msgHelp);
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
			
			try {
			for (int i = 0; i <= numrec; i++) {

				bl.setCurrentRow(i);
	
				// read table header 
				headerChecked = "";
				if (req.getParameter("TAB" + i) != null) {
					codTab = req.getParameter("TAB" + i);
					if (req.getParameter("CHKH" + i) != null) {
						// IS HEADER CHECKED
						headerChecked = req.getParameter("CHKH" + i);
						if (!headerChecked.equals("on")) {
							headerChecked = "";
						} 
					} 
					recordChecked = "";
					recTab = "";
					if (req.getParameter("CHK" + codTab + i) != null) {
						// IS RECORD CHECKED
						recordChecked = req.getParameter("CHK" + codTab + i);
						if (!recordChecked.equals("on")) {
							recordChecked = "";
						} else{
							recTab = req.getParameter("RECTAB" + i);
						}
					} 
	
					if (headerChecked.equals("on")||(recordChecked.equals("on"))) {
						try {
							mp = getMessageProcessor("EDP0183", req);
							EDP018301Message msgHelp = (EDP018301Message) mp.getMessageRecord("EDP018301");
							msgHelp.setH01USERID(user.getH01USR());
							msgHelp.setH01PROGRM("EDP0183");
							msgHelp.setH01TIMSYS(getTimeStamp());
							msgHelp.setH01SCRCOD("91");
							msgHelp.setH01OPECOD("0005");
							  if (headerChecked.equals("on")) {
								  msgHelp.setE01TABSEL("1");
								  msgHelp.setE01TABLVL("1");
								  msgHelp.setE01TABCFL(codTab);
							  } 
							  
							  if (recordChecked.equals("on")) {
								  msgHelp.setE01TABSEL("1");
								  msgHelp.setE01TABLVL("2");
								  msgHelp.setE01TABCFL(codTab);
								  msgHelp.setE01TABRCD(recTab);
							  } 
							
							mp.sendMessage(msgHelp);
							ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
						} catch (Exception e) {
							e.printStackTrace();
							flexLog("Error: " + e);
							throw new RuntimeException("Socket Communication Error");
						}
	
					}
			   	}
		   	}
			// CREATE THE EXCEL FILE
			try {
			mp = getMessageProcessor("ERA0110", req);
			ERA011001Message msgRT = (ERA011001Message) mp.getMessageRecord("ERA011001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("ERA011001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0006");
			setMessageRecord(req, msgRT);
			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
				
			pageName = "ERA0110_selection_confirm.jsp";
			forward(pageName, req, res);

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

				int screen = A_ENTER;

				try {

					msgUser =
						(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
							"currUser");

					// Here we should get the path from the user profile
					LangPath = super.rootPath + msgUser.getE01LAN() + "/";

					try {
						flexLog("Opennig Socket Connection");
						mc = new MessageContext(super.getMessageHandler("ERA0110", req));

						try {
							screen = Integer.parseInt(req.getParameter("SCREEN"));
						} catch (Exception e) {
							flexLog("Screen set to default value");
						}

						switch (screen) {
						// Request
						case A_ENTER :
							procReqList(msgUser, req, res, session);
							break;
						case A_PROCESS :
							procActionList(msgUser, req, res, session);
							break;
						default :
							forward(devPage, req, res);
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
