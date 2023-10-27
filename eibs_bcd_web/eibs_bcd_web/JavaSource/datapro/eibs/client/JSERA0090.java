package datapro.eibs.client;

/** 
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla???????????????????????????
 */
import java.io.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;

import com.datapro.exception.ServiceLocatorException;

import datapro.eibs.beans.*;
import datapro.eibs.sockets.*;

import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

import datapro.eibs.beans.ELEERRMessage;

public class JSERA0090 extends datapro.eibs.master.SuperServlet {


	// Action 
	// first screen
	protected static final int R_GET_LIST = 100;
	protected static final int R_GET_LIST_1 = 101;
	protected static final int A_TRANSACTION1 = 102;
	protected static final int R_GET_LIST_2 = 103;
	protected static final int A_TRANSACTION2 = 104;
	protected static final int R_GET_LIST_3 = 105;
	protected static final int A_TRANSACTION3 = 106;
	protected static final int R_GET_LIST_4 = 107;
	protected static final int A_TRANSACTION4 = 108;
	protected static final int R_GET_LIST_8 = 109;
	protected static final int A_TRANSACTION8 = 110;
	protected static final int A_GENFILES = 200;

	protected String LangPath = "s";

	/**
	 * JSERA0090 constructor comment.
	 */
	public JSERA0090() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSERA0090");

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
	ERA009001Message mL0090 = null;
	ELEERRMessage msgError = null;
	JBListRec grpAccList = null;
	UserPos userPO = null;
	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	DataTransaction transData = new DataTransaction();

	String H01FLGWK1 = req.getParameter("H01FLGWK1") == null || req.getParameter("H01FLGWK1").equals("") ? "F" : req.getParameter("H01FLGWK1").trim();

	flexLog("Opennig Socket Connection Branch");
	MessageContext mc820;
	mc820 = mc;
	// Send Initial data
	try {
		flexLog("Send Initial Data");

		mL0090 = (ERA009001Message) mc820.getMessageRecord("ERA009001");
		mL0090.setH01USERID(user.getH01USR());
		mL0090.setH01PROGRM("ERA0090");
		mL0090.setH01TIMSYS(getTimeStamp());
		mL0090.setH01SCRCOD("01");
		mL0090.setH01OPECOD("0015");
	    mL0090.setH01FLGWK1(H01FLGWK1);
		mL0090.send();
		mL0090.destroy();


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

	  if (newmessage.getFormatName().equals("ERA009001")) {

				String marker = "";
				String myFlag = "";
				int idxOpt = -1;
				int idxGrp = -1;
				int colNum = 5;
				int colNumAcc = 15;
				try {
					grpAccList = new datapro.eibs.beans.JBListRec();
					grpAccList.init(colNumAcc);
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}
				String myGrp[] = new String[colNum];
				String myGrpAcc[] = new String[colNumAcc];
				String myOption[] = new String[colNum];
				for (int i = 0; i < colNum; i++) {
					myGrp[i] = "";
					myOption[i] = "";
				}
				for (int i = 0; i < colNumAcc; i++) {
					myGrpAcc[i] = "";
				}
				transData.clear();

				while (true) {
					mL0090 = (ERA009001Message) newmessage;
					marker = mL0090.getE01OPECDE();
					if (marker.equals("*")) {
						break;
					} else {
							myFlag = "" + idxOpt + "" + idxGrp;
							idxAcc++;
							myGrpAcc[0] = mL0090.getE01CODFIL();
							myGrpAcc[1] = mL0090.getE01NOMFIL();
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
									+ "ERA0090_modules_list.jsp");
							callPage(LangPath + "ERA0090_file_list.jsp?ROW=" + idxAcc, req, res);
					} else {
						//By error
						flexLog(
								"About to call Page: "
								+ LangPath
								+ "ERA0090_modules_list.jsp");
						callPage(LangPath + "ERA0090_file_list.jsp?ROW=" + idxAcc, req, res);

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
	
	protected void procGetList1(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	ELEERRMessage msgError = null;
	ERA009002Message msgList = null;
	JBList beanList = null;
	UserPos	userPO = null;

	try {
		msgError = new datapro.eibs.beans.ELEERRMessage();
	} 
	catch (Exception ex) {
		flexLog("Error: " + ex); 
  	}

	// Send Initial data
	try
	{
		flexLog("Send Initial Data");
		msgList = (ERA009002Message)mc.getMessageRecord("ERA009002");
		msgList.setH02USERID(user.getH01USR());
	 	msgList.setH02PROGRM("ERA0090");
	 	msgList.setH02TIMSYS(getTimeStamp());
	 	msgList.setH02OPECOD("0015");
		try {
			msgList.setE02NUMREG(req.getParameter("Pos"));
		} catch (Exception e) {
			msgList.setE02NUMREG("0");
		}
	 	msgList.send();	
	 	msgList.destroy();
	}		
	catch (Exception e)	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}
		
	// Receive Message
	try
	{
	  	newmessage = mc.receiveMessage();
	  
	  	if (newmessage.getFormatName().equals("ELEERR")) {

			msgError = (ELEERRMessage)newmessage;
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);

			try {
				 flexLog("About to call Page: " + LangPath + "error_viewer.jsp");
				 callPage(LangPath + "error_viewer.jsp", req, res);
			}
			catch (Exception e) {
				flexLog("Exception calling page " + e);
			}


	  	}
	  	else if (newmessage.getFormatName().equals("ERA009002")) {

			try {
				beanList = new datapro.eibs.beans.JBList();
		  	} 
			catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			boolean firstTime;
			String marker = "";
			String myFlag = "";
			StringBuffer myRow = null;
			String chk = "";
			String refNum = req.getParameter("REFNUM");

			if (refNum == null) 
				firstTime = true;
			else				
				firstTime = false;
			int indexRow = 0;
			while (true) {

				msgList = (ERA009002Message)newmessage;

				marker = msgList.getE02OPECDE();

				if (marker.equals("*")) {
					beanList.setShowNext(false);
					break;
				}
				else {
					if (firstTime) {
						beanList.setFirstRec(Integer.parseInt(msgList.getE02NUMREG()));
						firstTime = false;
						chk = "checked";
					}else{
						chk = "";
					}
					
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP><input type=\"radio\" name=\"REFNUM\" value=\"" + msgList.getE02RW1REF() + "\" " + chk + " onclick=\"showAddInfo("+msgList.getE02RW1REF()+")\"></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1REF()) + "</A></TD>");;
					myRow.append("<TD NOWRAP>                  <A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1CER()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1ITG()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCCY(msgList.getE02RW1MON()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1VAL()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1VEN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1FVE()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1IDO()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1ADM()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1TEN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1PGA()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1ESG()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1EGT()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1BAN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1RES()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1VAN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1TRM()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1SIN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1CUN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1EOD()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1HIP()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW1('" + msgList.getE02RW1REF() + "')\">" + Util.formatCell(msgList.getE02RW1TGR()) + "</A></TD>");
					beanList.setLastRec(Integer.parseInt(msgList.getE02NUMREG()));				
					if (marker.equals("+")) {
						myRow.append("<TD NOWRAP><input type=\"hidden\" name=\"E02NUMREG\" value=\"" + msgList.getE02NUMREG() + "\" </TD>");
					}
					myRow.append("</TR>");
					beanList.addRow(myFlag, myRow.toString());
					indexRow ++;				
					if (marker.equals("+")) {
						beanList.setShowNext(true);
						break;
					}
				}
				newmessage = mc.receiveMessage();
			}
					
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setPurpose("MAINTENANCE");
			userPO.setOption("CO");
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("appList", beanList);
			ses.setAttribute("error", msgError);

			if (beanList.getNoResult()){
			try {
					flexLog("About to call Page: " + LangPath + "MISC_no_result.jsp");
				 	res.sendRedirect(super.srctx + LangPath + "MISC_no_result.jsp");
			   	}
			    catch (Exception e) {
				    flexLog("Exception calling page " + e);
			    }
			}    
		 	else {

				try {
					flexLog("About to call Page: " + LangPath + "ERA0090_fileW1_list.jsp");
				 	callPage(LangPath + "ERA0090_fileW1_list.jsp", req, res);
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
		 	}	
		       
	  	}
	}
	catch (Exception e)	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}
}	

	//process FILE W1
	protected void procUpdW1(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		try {
			userPO = (datapro.eibs.beans.UserPos) Beans.instantiate(getClass()
					.getClassLoader(), "datapro.eibs.beans.UserPos");
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		boolean IsNotError = false;

		String opecode = req.getParameter("OPECOD") == null || req.getParameter("OPECOD").equals("") ? "0004" : req.getParameter("OPECOD").trim();
		String refere = req.getParameter("E02RW1REF") == null || req.getParameter("E02RW1REF").equals("") ? "" : req.getParameter("E02RW1REF").trim();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0090", req);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		ERA009002Message msgL02 = (ERA009002Message) mp.getMessageRecord("ERA009002");
		msgL02.setH02USERID(user.getH01USR());
		msgL02.setH02PROGRM("ERA0090");
		msgL02.setH02TIMSYS(getTimeStamp());
		msgL02.setH02SCRCOD("01");
		msgL02.setH02OPECOD(opecode);
		msgL02.setE02RW1REF(refere);

        // all the fields here

		if (opecode.equals("0002")) {
			try {
				// all the fields here
				java.util.Enumeration enu = msgL02.fieldEnumeration();
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
		}
		
		mp.sendMessage(msgL02);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		IsNotError = msgError.getERRNUM().equals("0");
		msgL02 = (ERA009002Message) mp.receiveMessageRecord("ERA009002");
		userPO.setPurpose("MAINTENANCE");
		try {
			userPO.setPurpose(req.getParameter("PURPOSE"));
		} catch (Exception e) {
		}
		
		ses.setAttribute("error", msgError);
		ses.setAttribute("recW1", msgL02);
		ses.setAttribute("userPO", userPO);

		if (IsNotError && opecode.equals("0002")||opecode.equals("0003")) { // There are no errors
			try {
				
				PrintWriter  out = res.getWriter();
				out.println("<HTML>");
				out.println("<HEAD>");
				out.println("<TITLE>Close</TITLE>");
				out.println("</HEAD>");
				out.println("<BODY>");
				out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
				out.println(" var myOpener= top.opener;");
				out.println("top.opener.goRefresh();");
				out.println("		top.close();");
				out.println("</SCRIPT>");
				out.println("<P>Close it!!!</P>");
				out.println("</BODY>");
				out.println("</HTML>");
				out.close();
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} else {
			if (IsNotError && opecode.equals("0005")||IsNotError==false && opecode.equals("0002")) { // There are no errors
				try {
					flexLog("About to call Page: " + LangPath
						+ "ERA0090_fileW1_record.jsp.jsp");
					callPage(LangPath + "ERA0090_fileW1_record.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}else{
				try {
					flexLog("About to call Page: " + LangPath
							+ "error_viewer.jsp.jsp");
					callPage(LangPath + "error_viewer.jsp", req,
							res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
		}
	}

	protected void procGetList3(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ERA009003Message msgList = null;
		JBList beanList = null;
		UserPos userPO = null;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgList = (ERA009003Message) mc.getMessageRecord("ERA009003");
			msgList.setH03USERID(user.getH01USR());
			msgList.setH03PROGRM("ERA0090");
			msgList.setH03TIMSYS(getTimeStamp());
			msgList.setH03OPECOD("0015");
			try {
				msgList.setE03NUMREG(req.getParameter("Pos"));
			} catch (Exception e) {
				msgList.setE03NUMREG("0");
			}
			msgList.send();
			msgList.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {

				msgError = (ELEERRMessage) newmessage;
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);

				try {
					flexLog("About to call Page: " + LangPath
							+ "error_viewer.jsp");
					callPage(LangPath + "error_viewer.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}

			} else if (newmessage.getFormatName().equals("ERA009003")) {

				try {
					beanList = new datapro.eibs.beans.JBList();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				boolean firstTime;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				String refNum = req.getParameter("REFNUM");

				if (refNum == null)
					firstTime = true;
				else
					firstTime = false;
				int indexRow = 0;
				while (true) {

					msgList = (ERA009003Message) newmessage;

					marker = msgList.getE03OPECDE();

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {
						if (firstTime) {
							beanList.setFirstRec(Integer.parseInt(msgList
									.getE03NUMREG()));
							firstTime = false;
							chk = "checked";
						} else {
							chk = "";
						}

						myRow = new StringBuffer("<TR>");
						myRow
								.append("<TD NOWRAP><input type=\"radio\" name=\"REFNUM\" value=\""
										+ msgList.getE03RW3REF()
										+ "\" "
										+ chk
										+ " onclick=\"showAddInfo("
										+ msgList.getE03RW3REF() + ")\"></TD>");
						myRow
								.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW3('"
										+ msgList.getE03RW3REF()
										+ "')\">"
										+ Util.formatCell(msgList
												.getE03RW3REF()) + "</A></TD>");
						myRow
								.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW3('"
										+ msgList.getE03RW3REF()
										+ "')\">"
										+ Util.formatCell(msgList
												.getE03RW3NIT()) + "</A></TD>");
						myRow
								.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW3('"
										+ msgList.getE03RW3REF()
										+ "')\">"
										+ Util.formatCell(msgList
												.getE03RW3TIP()) + "</A></TD>");
						myRow
								.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW3('"
										+ msgList.getE03RW3REF()
										+ "')\">"
										+ Util.formatCell(msgList
												.getE03RW3RCN()) + "</A></TD>");
						myRow
								.append("<TD NOWRAP ALIGN=\"RIGHT\"> <A HREF=\"javascript:showMntW3('"
										+ msgList.getE03RW3REF()
										+ "')\">"
										+ Util
												.formatCCY(msgList
														.getE03RW3EMP())
										+ "</A></TD>");
						myRow
								.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW3('"
										+ msgList.getE03RW3REF()
										+ "')\">"
										+ Util.formatCell(msgList
												.getE03RW3PAR()) + "</A></TD>");
						myRow
								.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW3('"
										+ msgList.getE03RW3REF()
										+ "')\">"
										+ Util.formatCell(msgList
												.getE03RW3CEN()) + "</A></TD>");
						myRow
								.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW3('"
										+ msgList.getE03RW3REF()
										+ "')\">"
										+ Util.formatCell(msgList
												.getE03RW3PAL()) + "</A></TD>");
						myRow
								.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW3('"
										+ msgList.getE03RW3REF()
										+ "')\">"
										+ Util.formatCell(msgList
												.getE03RW3EOD()) + "</A></TD>");
						myRow
								.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW3('"
										+ msgList.getE03RW3REF()
										+ "')\">"
										+ Util.formatCell(msgList
												.getE03RW3DEU()) + "</A></TD>");
						beanList.setLastRec(Integer.parseInt(msgList
								.getE03NUMREG()));
						if (marker.equals("+")) {
							myRow
									.append("<TD NOWRAP><input type=\"hidden\" name=\"E03NUMREG\" value=\""
											+ msgList.getE03NUMREG()
											+ "\" </TD>");
						}
						myRow.append("</TR>");
						beanList.addRow(myFlag, myRow.toString());
						indexRow++;
						if (marker.equals("+")) {
							beanList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}

				userPO = new datapro.eibs.beans.UserPos();
				userPO.setPurpose("MAINTENANCE");
				userPO.setOption("CO");

				flexLog("Putting java beans into the session");
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("appList", beanList);
				ses.setAttribute("error", msgError);

				if (beanList.getNoResult()) {
					try {
						flexLog("About to call Page: " + LangPath
								+ "MISC_no_result.jsp");
						res.sendRedirect(super.srctx + LangPath
								+ "MISC_no_result.jsp");
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else {

					try {
						flexLog("About to call Page: " + LangPath
								+ "ERA0090_fileW3_list.jsp");
						callPage(LangPath + "ERA0090_fileW3_list.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}

			}
}
catch (Exception e)	{
e.printStackTrace();
flexLog("Error: " + e);
	throw new RuntimeException("Socket Communication Error");
}
}	

//process FILE W3
protected void procUpdW3(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
throws ServletException, IOException {

UserPos userPO = null;
try {
	userPO = (datapro.eibs.beans.UserPos) Beans.instantiate(getClass()
			.getClassLoader(), "datapro.eibs.beans.UserPos");
} catch (Exception ex) {
	flexLog("Error: " + ex);
}
boolean IsNotError = false;

String opecode = req.getParameter("OPECOD") == null || req.getParameter("OPECOD").equals("") ? "0004" : req.getParameter("OPECOD").trim();
String refere = req.getParameter("E03RW3REF") == null || req.getParameter("E03RW3REF").equals("") ? "" : req.getParameter("E03RW3REF").trim();
MessageProcessor mp = null;
try {
	mp = getMessageProcessor("ERA0090", req);
} catch (Exception e) {
	e.printStackTrace();
	flexLog("Error: " + e);
	throw new RuntimeException("Socket Communication Error");
}

ERA009003Message msgL02 = (ERA009003Message) mp.getMessageRecord("ERA009003");
msgL02.setH03USERID(user.getH01USR());
msgL02.setH03PROGRM("ERA0090");
msgL02.setH03TIMSYS(getTimeStamp());
msgL02.setH03SCRCOD("01");
msgL02.setH03OPECOD(opecode);
msgL02.setE03RW3REF(refere);

// all the fields here

if (opecode.equals("0002")) {
	try {
		// all the fields here
		java.util.Enumeration enu = msgL02.fieldEnumeration();
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
}

mp.sendMessage(msgL02);
ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
IsNotError = msgError.getERRNUM().equals("0");
msgL02 = (ERA009003Message) mp.receiveMessageRecord("ERA009003");
userPO.setPurpose("MAINTENANCE");
try {
	userPO.setPurpose(req.getParameter("PURPOSE"));
} catch (Exception e) {
}

ses.setAttribute("error", msgError);
ses.setAttribute("recW3", msgL02);
ses.setAttribute("userPO", userPO);

if (IsNotError && opecode.equals("0002")||opecode.equals("0003")) { // There are no errors
	try {
		
		PrintWriter  out = res.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>Close</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
		out.println(" var myOpener= top.opener;");
		out.println("top.opener.goRefresh();");
		out.println("		top.close();");
		out.println("</SCRIPT>");
		out.println("<P>Close it!!!</P>");
		out.println("</BODY>");
		out.println("</HTML>");
		out.close();
	} catch (Exception e) {
		flexLog("Exception calling page " + e);
	}

} else {
	if (IsNotError && opecode.equals("0005")||IsNotError==false && opecode.equals("0002")) { // There are no errors
		try {
			flexLog("About to call Page: " + LangPath
				+ "ERA0090_fileW3_record.jsp.jsp");
			callPage(LangPath + "ERA0090_fileW3_record.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
	}else{
		try {
			flexLog("About to call Page: " + LangPath
					+ "error_viewer.jsp.jsp");
			callPage(LangPath + "error_viewer.jsp", req,
					res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
	}
}
}

protected void procGetList2(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
throws ServletException, IOException {

	MessageRecord newmessage = null;
	ELEERRMessage msgError = null;
	ERA009004Message msgList = null;
	JBList beanList = null;
	UserPos userPO = null;

	try {
		msgError = new datapro.eibs.beans.ELEERRMessage();
	} catch (Exception ex) {
		flexLog("Error: " + ex);
	}

	// Send Initial data
	try {
		flexLog("Send Initial Data");
		msgList = (ERA009004Message) mc.getMessageRecord("ERA009004");
		msgList.setH04USERID(user.getH01USR());
		msgList.setH04PROGRM("ERA0090");
		msgList.setH04TIMSYS(getTimeStamp());
		msgList.setH04OPECOD("0015");
		try {
			msgList.setE04NUMREG(req.getParameter("Pos"));
		} catch (Exception e) {
			msgList.setE04NUMREG("0");
		}
		msgList.send();
		msgList.destroy();
	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
		throw new RuntimeException("Socket Communication Error");
	}

	// Receive Message
	try {
		newmessage = mc.receiveMessage();

		if (newmessage.getFormatName().equals("ELEERR")) {

			msgError = (ELEERRMessage) newmessage;
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);

			try {
				flexLog("About to call Page: " + LangPath
						+ "error_viewer.jsp");
				callPage(LangPath + "error_viewer.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} else if (newmessage.getFormatName().equals("ERA009004")) {

			try {
				beanList = new datapro.eibs.beans.JBList();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			boolean firstTime;
			String marker = "";
			String myFlag = "";
			StringBuffer myRow = null;
			String chk = "";
			String refNum = req.getParameter("REFNUM");

			if (refNum == null)
				firstTime = true;
			else
				firstTime = false;
			int indexRow = 0;
			while (true) {

				msgList = (ERA009004Message) newmessage;

				marker = msgList.getE04OPECDE();

				if (marker.equals("*")) {
					beanList.setShowNext(false);
					break;
				} else {
					if (firstTime) {
						beanList.setFirstRec(Integer.parseInt(msgList
								.getE04NUMREG()));
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}

					myRow = new StringBuffer("<TR>");
					myRow
							.append("<TD NOWRAP><input type=\"radio\" name=\"REFNUM\" value=\""
									+ msgList.getE04RW2REF()
									+ "\" "
									+ chk
									+ " onclick=\"showAddInfo("
									+ msgList.getE04RW2REF() + ")\"> </TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW4('"
									+ msgList.getE04RW2REF()
									+ "')\">"
									+ Util.formatCell(msgList
											.getE04RW2REF()) + "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW4('"
									+ msgList.getE04RW2REF()
									+ "')\">"
									+ Util.formatCell(msgList
											.getE04RW2ACC()) + "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW4('"
									+ msgList.getE04RW2REF()
									+ "')\">"
									+ Util.formatCell(msgList
											.getE04RW2CUN()) + "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW4('"
									+ msgList.getE04RW2REF()
									+ "')\">"
									+ Util.formatCell(msgList
											.getE04RW2TID()) + "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"RIGHT\"> <A HREF=\"javascript:showMntW4('"
									+ msgList.getE04RW2REF()
									+ "')\">"
									+ Util
											.formatCell(msgList
													.getE04RW2IDN())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showMntW4('"
									+ msgList.getE04RW2REF()
									+ "')\">"
									+ Util.formatCell(msgList
											.getD04RW2NM1()) + "</A></TD>");
					beanList.setLastRec(Integer.parseInt(msgList
							.getE04NUMREG()));
					if (marker.equals("+")) {
						myRow
								.append("<TD NOWRAP><input type=\"hidden\" name=\"E04NUMREG\" value=\""
										+ msgList.getE04NUMREG()
										+ "\" </TD>");
					}
					myRow.append("</TR>");
					beanList.addRow(myFlag, myRow.toString());
					indexRow++;
					if (marker.equals("+")) {
						beanList.setShowNext(true);
						break;
					}
				}
				newmessage = mc.receiveMessage();
			}

			userPO = new datapro.eibs.beans.UserPos();
			userPO.setPurpose("MAINTENANCE");
			userPO.setOption("CO");

			flexLog("Putting java beans into the session");
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("appList", beanList);
			ses.setAttribute("error", msgError);

			if (beanList.getNoResult()) {
				try {
					flexLog("About to call Page: " + LangPath
							+ "MISC_no_result.jsp");
					res.sendRedirect(super.srctx + LangPath
							+ "MISC_no_result.jsp");
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else {

				try {
					flexLog("About to call Page: " + LangPath
							+ "ERA0090_fileW4_list.jsp");
					callPage(LangPath + "ERA0090_fileW4_list.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}

		}
}
catch (Exception e)	{
e.printStackTrace();
flexLog("Error: " + e);
throw new RuntimeException("Socket Communication Error");
}
}	

//process FILE W4
protected void procUpdW2(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
throws ServletException, IOException {

UserPos userPO = null;
try {
userPO = (datapro.eibs.beans.UserPos) Beans.instantiate(getClass()
		.getClassLoader(), "datapro.eibs.beans.UserPos");
} catch (Exception ex) {
flexLog("Error: " + ex);
}
boolean IsNotError = false;

String opecode = req.getParameter("OPECOD") == null || req.getParameter("OPECOD").equals("") ? "0004" : req.getParameter("OPECOD").trim();
String refere = req.getParameter("E04RW2REF") == null || req.getParameter("E04RW2REF").equals("") ? "" : req.getParameter("E04RW2REF").trim();
MessageProcessor mp = null;
try {
mp = getMessageProcessor("ERA0090", req);
} catch (Exception e) {
e.printStackTrace();
flexLog("Error: " + e);
throw new RuntimeException("Socket Communication Error");
}

ERA009004Message msgL02 = (ERA009004Message) mp.getMessageRecord("ERA009004");
msgL02.setH04USERID(user.getH01USR());
msgL02.setH04PROGRM("ERA0090");
msgL02.setH04TIMSYS(getTimeStamp());
msgL02.setH04SCRCOD("01");
msgL02.setH04OPECOD(opecode);
msgL02.setE04RW2REF(refere);

//all the fields here

if (opecode.equals("0002")) {
try {
	// all the fields here
	java.util.Enumeration enu = msgL02.fieldEnumeration();
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
}

mp.sendMessage(msgL02);
ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
IsNotError = msgError.getERRNUM().equals("0");
msgL02 = (ERA009004Message) mp.receiveMessageRecord("ERA009004");
userPO.setPurpose("MAINTENANCE");
try {
userPO.setPurpose(req.getParameter("PURPOSE"));
} catch (Exception e) {
}

ses.setAttribute("error", msgError);
ses.setAttribute("recW4", msgL02);
ses.setAttribute("userPO", userPO);

if (IsNotError && opecode.equals("0002")||opecode.equals("0003")) { // There are no errors
try {
	
	PrintWriter  out = res.getWriter();
	out.println("<HTML>");
	out.println("<HEAD>");
	out.println("<TITLE>Close</TITLE>");
	out.println("</HEAD>");
	out.println("<BODY>");
	out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
	out.println(" var myOpener= top.opener;");
	out.println("top.opener.goRefresh();");
	out.println("		top.close();");
	out.println("</SCRIPT>");
	out.println("<P>Close it!!!</P>");
	out.println("</BODY>");
	out.println("</HTML>");
	out.close();
} catch (Exception e) {
	flexLog("Exception calling page " + e);
}

} else {
if (IsNotError && opecode.equals("0005")||IsNotError==false && opecode.equals("0002")) { // There are no errors
	try {
		flexLog("About to call Page: " + LangPath
			+ "ERA0090_fileW4_record.jsp.jsp");
		callPage(LangPath + "ERA0090_fileW4_record.jsp", req, res);
	} catch (Exception e) {
		flexLog("Exception calling page " + e);
	}
}else{
	try {
		flexLog("About to call Page: " + LangPath
				+ "error_viewer.jsp.jsp");
		callPage(LangPath + "error_viewer.jsp", req,
				res);
	} catch (Exception e) {
		flexLog("Exception calling page " + e);
	}
}
}
}

protected void procGetList4(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
throws ServletException, IOException {

	MessageRecord newmessage = null;
	ELEERRMessage msgError = null;
	ERA009005Message msgList = null;
	JBList beanList = null;
	UserPos userPO = null;

	try {
		msgError = new datapro.eibs.beans.ELEERRMessage();
	} catch (Exception ex) {
		flexLog("Error: " + ex);
	}

	// Send Initial data
	try {
		flexLog("Send Initial Data");
		msgList = (ERA009005Message) mc.getMessageRecord("ERA009005");
		msgList.setH05USERID(user.getH01USR());
		msgList.setH05PROGRM("ERA0090");
		msgList.setH05TIMSYS(getTimeStamp());
		msgList.setH05OPECOD("0015");
		try {
			msgList.setE05NUMREG(req.getParameter("Pos"));
		} catch (Exception e) {
			msgList.setE05NUMREG("0");
		}
		msgList.send();
		msgList.destroy();
	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
		throw new RuntimeException("Socket Communication Error");
	}

	// Receive Message
	try {
		newmessage = mc.receiveMessage();

		if (newmessage.getFormatName().equals("ELEERR")) {

			msgError = (ELEERRMessage) newmessage;
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);

			try {
				flexLog("About to call Page: " + LangPath
						+ "error_viewer.jsp");
				callPage(LangPath + "error_viewer.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} else if (newmessage.getFormatName().equals("ERA009005")) {

			try {
				beanList = new datapro.eibs.beans.JBList();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			boolean firstTime;
			String marker = "";
			String myFlag = "";
			StringBuffer myRow = null;
			String chk = "";
			String refNum = req.getParameter("REFNUM");

			if (refNum == null)
				firstTime = true;
			else
				firstTime = false;
			int indexRow = 0;
			while (true) {

				msgList = (ERA009005Message) newmessage;

				marker = msgList.getE05OPECDE();

				if (marker.equals("*")) {
					beanList.setShowNext(false);
					break;
				} else {
					if (firstTime) {
						beanList.setFirstRec(Integer.parseInt(msgList
								.getE05NUMREG()));
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}

					myRow = new StringBuffer("<TR>");
					myRow
							.append("<TD NOWRAP><input type=\"radio\" name=\"REFNUM\" value=\""
									+ msgList.getE05RW4REF()
									+ "\" "
									+ chk
									+ " onclick=\"showAddInfo("
									+ msgList.getE05RW4REF() + ")\"></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW5('"
									+ msgList.getE05RW4REF()
									+ "')\">"
									+ Util.formatCell(msgList
											.getE05RW4REF()) + "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW5('"
									+ msgList.getE05RW4REF()
									+ "')\">"
									+ Util.formatCell(msgList
											.getE05RW4OPE()) + "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW5('"
									+ msgList.getE05RW4REF()
									+ "')\">"
									+ Util.formatCell(msgList
											.getE05RW4FNG()) + "</A></TD>");
					beanList.setLastRec(Integer.parseInt(msgList
							.getE05NUMREG()));
					if (marker.equals("+")) {
						myRow
								.append("<TD NOWRAP><input type=\"hidden\" name=\"E05NUMREG\" value=\""
										+ msgList.getE05NUMREG()
										+ "\" </TD>");
					}
					myRow.append("</TR>");
					beanList.addRow(myFlag, myRow.toString());
					indexRow++;
					if (marker.equals("+")) {
						beanList.setShowNext(true);
						break;
					}
				}
				newmessage = mc.receiveMessage();
			}

			userPO = new datapro.eibs.beans.UserPos();
			userPO.setPurpose("MAINTENANCE");
			userPO.setOption("CO");

			flexLog("Putting java beans into the session");
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("appList", beanList);
			ses.setAttribute("error", msgError);

			if (beanList.getNoResult()) {
				try {
					flexLog("About to call Page: " + LangPath
							+ "MISC_no_result.jsp");
					res.sendRedirect(super.srctx + LangPath
							+ "MISC_no_result.jsp");
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else {

				try {
					flexLog("About to call Page: " + LangPath
							+ "ERA0090_fileW5_list.jsp");
					callPage(LangPath + "ERA0090_fileW5_list.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}

		}
}
catch (Exception e)	{
e.printStackTrace();
flexLog("Error: " + e);
throw new RuntimeException("Socket Communication Error");
}
}	

//process FILE W3
protected void procUpdW4(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
throws ServletException, IOException {

UserPos userPO = null;
try {
userPO = (datapro.eibs.beans.UserPos) Beans.instantiate(getClass()
		.getClassLoader(), "datapro.eibs.beans.UserPos");
} catch (Exception ex) {
flexLog("Error: " + ex);
}
boolean IsNotError = false;

String opecode = req.getParameter("OPECOD") == null || req.getParameter("OPECOD").equals("") ? "0004" : req.getParameter("OPECOD").trim();
String refere = req.getParameter("E05RW4REF") == null || req.getParameter("E05RW4REF").equals("") ? "" : req.getParameter("E05RW4REF").trim();
MessageProcessor mp = null;
try {
mp = getMessageProcessor("ERA0090", req);
} catch (Exception e) {
e.printStackTrace();
flexLog("Error: " + e);
throw new RuntimeException("Socket Communication Error");
}

ERA009005Message msgL02 = (ERA009005Message) mp.getMessageRecord("ERA009005");
msgL02.setH05USERID(user.getH01USR());
msgL02.setH05PROGRM("ERA0090");
msgL02.setH05TIMSYS(getTimeStamp());
msgL02.setH05SCRCOD("01");
msgL02.setH05OPECOD(opecode);
msgL02.setE05RW4REF(refere);

//all the fields here

if (opecode.equals("0002")) {
try {
	// all the fields here
	java.util.Enumeration enu = msgL02.fieldEnumeration();
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
}

mp.sendMessage(msgL02);
ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
IsNotError = msgError.getERRNUM().equals("0");
msgL02 = (ERA009005Message) mp.receiveMessageRecord("ERA009005");
userPO.setPurpose("MAINTENANCE");
try {
userPO.setPurpose(req.getParameter("PURPOSE"));
} catch (Exception e) {
}

ses.setAttribute("error", msgError);
ses.setAttribute("recW5", msgL02);
ses.setAttribute("userPO", userPO);

if (IsNotError && opecode.equals("0002")||opecode.equals("0003")) { // There are no errors
try {
	
	PrintWriter  out = res.getWriter();
	out.println("<HTML>");
	out.println("<HEAD>");
	out.println("<TITLE>Close</TITLE>");
	out.println("</HEAD>");
	out.println("<BODY>");
	out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
	out.println(" var myOpener= top.opener;");
	out.println("top.opener.goRefresh();");
	out.println("		top.close();");
	out.println("</SCRIPT>");
	out.println("<P>Close it!!!</P>");
	out.println("</BODY>");
	out.println("</HTML>");
	out.close();
} catch (Exception e) {
	flexLog("Exception calling page " + e);
}

} else {
if (IsNotError && opecode.equals("0005")||IsNotError==false && opecode.equals("0002")) { // There are no errors
	try {
		flexLog("About to call Page: " + LangPath
			+ "ERA0090_fileW5_record.jsp.jsp");
		callPage(LangPath + "ERA0090_fileW5_record.jsp", req, res);
	} catch (Exception e) {
		flexLog("Exception calling page " + e);
	}
}else{
	try {
		flexLog("About to call Page: " + LangPath
				+ "error_viewer.jsp.jsp");
		callPage(LangPath + "error_viewer.jsp", req,
				res);
	} catch (Exception e) {
		flexLog("Exception calling page " + e);
	}
}
}
}

protected void procGetList8(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
throws ServletException, IOException {

	MessageRecord newmessage = null;
	ELEERRMessage msgError = null;
	ERA009006Message msgList = null;
	JBList beanList = null;
	UserPos userPO = null;

	try {
		msgError = new datapro.eibs.beans.ELEERRMessage();
	} catch (Exception ex) {
		flexLog("Error: " + ex);
	}

	// Send Initial data
	try {
		flexLog("Send Initial Data");
		msgList = (ERA009006Message) mc.getMessageRecord("ERA009006");
		msgList.setH06USERID(user.getH01USR());
		msgList.setH06PROGRM("ERA0090");
		msgList.setH06TIMSYS(getTimeStamp());
		msgList.setH06OPECOD("0015");
		try {
			msgList.setE06NUMREG(req.getParameter("Pos"));
		} catch (Exception e) {
			msgList.setE06NUMREG("0");
		}
		msgList.send();
		msgList.destroy();
	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
		throw new RuntimeException("Socket Communication Error");
	}

	// Receive Message
	try {
		newmessage = mc.receiveMessage();

		if (newmessage.getFormatName().equals("ELEERR")) {

			msgError = (ELEERRMessage) newmessage;
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);

			try {
				flexLog("About to call Page: " + LangPath
						+ "error_viewer.jsp");
				callPage(LangPath + "error_viewer.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} else if (newmessage.getFormatName().equals("ERA009006")) {

			try {
				beanList = new datapro.eibs.beans.JBList();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			boolean firstTime;
			String marker = "";
			String myFlag = "";
			StringBuffer myRow = null;
			String chk = "";
			String refNum = req.getParameter("REFNUM");

			if (refNum == null)
				firstTime = true;
			else
				firstTime = false;
			int indexRow = 0;
			while (true) {

				msgList = (ERA009006Message) newmessage;

				marker = msgList.getE06OPECDE();

				if (marker.equals("*")) {
					beanList.setShowNext(false);
					break;
				} else {
					if (firstTime) {
						beanList.setFirstRec(Integer.parseInt(msgList
								.getE06NUMREG()));
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}

					myRow = new StringBuffer("<TR>");
					myRow
							.append("<TD NOWRAP><input type=\"radio\" name=\"REFNUM\" value=\""
									+ msgList.getE06RW8ITE()
									+ "\" "
									+ chk
									+ " onclick=\"showAddInfo("
									+ msgList.getE06RW8ITE() + ")\"></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW8('"
									+ msgList.getE06RW8ITE()
									+ "')\">"
									+ Util.formatCell(msgList
											.getE06RW8ITE()) + "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW8('"
									+ msgList.getE06RW8ITE()
									+ "')\">"
									+ Util.formatCell(msgList
											.getE06RW8FCO()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW8('"+ msgList.getE06RW8ITE()+ "')\">"+ Util.formatCell(msgList.getE06RW8TIP()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW8('"+ msgList.getE06RW8ITE()+ "')\">"+ Util.formatCell(msgList.getE06RW8SUB()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW8('"+ msgList.getE06RW8ITE()+ "')\">"+ Util.formatCell(msgList.getE06RW8EST()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW8('"+ msgList.getE06RW8ITE()+ "')\">"+ Util.formatCell(msgList.getE06RW8CLA()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW8('"+ msgList.getE06RW8ITE()+ "')\">"+ Util.formatCell(msgList.getE06RW8CER()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW8('"+ msgList.getE06RW8ITE()+ "')\">"+ Util.formatCell(msgList.getE06RW8MON()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"> <A HREF=\"javascript:showMntW8('"+ msgList.getE06RW8ITE()+ "')\">"+ Util.formatCell(msgList.getE06RW8VOR()) + "</A></TD>");
					beanList.setLastRec(Integer.parseInt(msgList
							.getE06NUMREG()));
					if (marker.equals("+")) {
						myRow
								.append("<TD NOWRAP><input type=\"hidden\" name=\"E06NUMREG\" value=\""
										+ msgList.getE06NUMREG()
										+ "\" </TD>");
					}
					myRow.append("</TR>");
					beanList.addRow(myFlag, myRow.toString());
					indexRow++;
					if (marker.equals("+")) {
						beanList.setShowNext(true);
						break;
					}
				}
				newmessage = mc.receiveMessage();
			}

			userPO = new datapro.eibs.beans.UserPos();
			userPO.setPurpose("MAINTENANCE");
			userPO.setOption("CO");

			flexLog("Putting java beans into the session");
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("appList", beanList);
			ses.setAttribute("error", msgError);

			if (beanList.getNoResult()) {
				try {
					flexLog("About to call Page: " + LangPath
							+ "MISC_no_result.jsp");
					res.sendRedirect(super.srctx + LangPath
							+ "MISC_no_result.jsp");
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else {

				try {
					flexLog("About to call Page: " + LangPath
							+ "ERA0090_fileW8_list.jsp");
					callPage(LangPath + "ERA0090_fileW8_list.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}

		}
}
catch (Exception e)	{
e.printStackTrace();
flexLog("Error: " + e);
throw new RuntimeException("Socket Communication Error");
}
}	

//process FILE W8
protected void procUpdW8(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
throws ServletException, IOException {

UserPos userPO = null;
try {
userPO = (datapro.eibs.beans.UserPos) Beans.instantiate(getClass()
		.getClassLoader(), "datapro.eibs.beans.UserPos");
} catch (Exception ex) {
flexLog("Error: " + ex);
}
boolean IsNotError = false;

String opecode = req.getParameter("OPECOD") == null || req.getParameter("OPECOD").equals("") ? "0004" : req.getParameter("OPECOD").trim();
String refere = req.getParameter("E06RW8ITE") == null || req.getParameter("E06RW8ITE").equals("") ? "" : req.getParameter("E06RW8ITE").trim();
MessageProcessor mp = null;
try {
mp = getMessageProcessor("ERA0090", req);
} catch (Exception e) {
e.printStackTrace();
flexLog("Error: " + e);
throw new RuntimeException("Socket Communication Error");
}

ERA009006Message msgL02 = (ERA009006Message) mp.getMessageRecord("ERA009006");
msgL02.setH06USERID(user.getH01USR());
msgL02.setH06PROGRM("ERA0090");
msgL02.setH06TIMSYS(getTimeStamp());
msgL02.setH06SCRCOD("01");
msgL02.setH06OPECOD(opecode);
msgL02.setE06RW8ITE(refere);

//all the fields here

if (opecode.equals("0002")) {
try {
	// all the fields here
	java.util.Enumeration enu = msgL02.fieldEnumeration();
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
}

mp.sendMessage(msgL02);
ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
IsNotError = msgError.getERRNUM().equals("0");
msgL02 = (ERA009006Message) mp.receiveMessageRecord("ERA009006");
userPO.setPurpose("MAINTENANCE");
try {
userPO.setPurpose(req.getParameter("PURPOSE"));
} catch (Exception e) {
}

ses.setAttribute("error", msgError);
ses.setAttribute("recW8", msgL02);
ses.setAttribute("userPO", userPO);

if (IsNotError && opecode.equals("0002")||opecode.equals("0003")) { // There are no errors
try {
	
	PrintWriter  out = res.getWriter();
	out.println("<HTML>");
	out.println("<HEAD>");
	out.println("<TITLE>Close</TITLE>");
	out.println("</HEAD>");
	out.println("<BODY>");
	out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
	out.println(" var myOpener= top.opener;");
	out.println("top.opener.goRefresh();");
	out.println("		top.close();");
	out.println("</SCRIPT>");
	out.println("<P>Close it!!!</P>");
	out.println("</BODY>");
	out.println("</HTML>");
	out.close();
} catch (Exception e) {
	flexLog("Exception calling page " + e);
}

} else {
if (IsNotError && opecode.equals("0005")||IsNotError==false && opecode.equals("0002")) { // There are no errors
	try {
		flexLog("About to call Page: " + LangPath
			+ "ERA0090_fileW8_record.jsp.jsp");
		callPage(LangPath + "ERA0090_fileW8_record.jsp", req, res);
	} catch (Exception e) {
		flexLog("Exception calling page " + e);
	}
}else{
	try {
		flexLog("About to call Page: " + LangPath
				+ "error_viewer.jsp.jsp");
		callPage(LangPath + "error_viewer.jsp", req,
				res);
	} catch (Exception e) {
		flexLog("Exception calling page " + e);
	}
}
}
}

	private MessageProcessor getMessageProcessor(String targetProgram,
			HttpServletRequest request) throws IOException {
		try {
			return new MessageProcessor(getMessageHandler(targetProgram,
					request));
		} catch (ServiceLocatorException e) {
			throw new IOException(e.getMessage());
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

			int screen = R_GET_LIST;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("ERA0090", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
					
						//Request
						// First screen, file list
						case R_GET_LIST :
							procGetList(mc, msgUser, req, res, session);
							break;
							// file list W1
						case R_GET_LIST_1 :
							procGetList1(mc, msgUser, req, res, session);
							break;
						// Update records W1
						case A_TRANSACTION1 :
							procUpdW1(mc, msgUser, req, res, session);
							break;
							// file list W2
						case R_GET_LIST_2 :
							procGetList2(mc, msgUser, req, res, session);
							break;
						// Update records W2
						case A_TRANSACTION2 :
							procUpdW2(mc, msgUser, req, res, session);
							break;
							// file list W3
						case R_GET_LIST_3 :
							procGetList3(mc, msgUser, req, res, session);
							break;
						// Update records W3
						case A_TRANSACTION3 :
							procUpdW3(mc, msgUser, req, res, session);
							break;
							// file list W4
						case R_GET_LIST_4 :
							procGetList4(mc, msgUser, req, res, session);
							break;
						// Update records W4
						case A_TRANSACTION4 :
							procUpdW4(mc, msgUser, req, res, session);
							break;
							// file list W8
						case R_GET_LIST_8 :
							procGetList8(mc, msgUser, req, res, session);
							break;
						// Update records W8
						case A_TRANSACTION8 :
							procUpdW8(mc, msgUser, req, res, session);
							break;
							// Generate FILES 
						case A_GENFILES :
							procUpdW8(mc, msgUser, req, res, session);
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
