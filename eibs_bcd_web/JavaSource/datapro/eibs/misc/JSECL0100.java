package datapro.eibs.misc; 

/**
 * Insert the type's description here.
 * Creation date: (22/7/09 12:04:18 PM)
 * @author: Gustavo Adolfo Villarroel
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSECL0100 extends datapro.eibs.master.SuperServlet {

	protected static final int R_CHECK_HOLDING		= 1;
	protected static final int A_CHECK_HOLDING		= 2;
	
	protected static final int R_CHECK_REVERSAL		= 3;
	protected static final int A_CHECK_REVERSAL		= 4;
	
	protected static final int R_ENTER				= 100;

	protected static final int R_VALIDATE			= 200;
	protected static final int A_VALIDATE			= 300;
	
	protected static final int A_CUST_BLOCKED		= 400;
	
	protected String LangPath = "S";

	/**
	 * JSECL0100 constructor comment.
	 */
	public JSECL0100() {
		super();
	}
	/**
	 * This method was created by Gustavo Adolfo Villarroel.
	 */
	public void destroy() {

		flexLog("free resources used by JSECL0100");

	}
	/**
	 * This method was created by Gustavo Adolfo Villarroel.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqEnter(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		UserPos userPO = null;
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		ses.setAttribute("userPO", userPO);
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_holding_enter.jsp");
			callPage(LangPath + "ECL0100_rt_check_holding_enter.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqCheckHolding(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECL0100DSMessage msgCheck = null;
		
		JBObjList beanList = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		String opecode = "";

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgCheck = (ECL0100DSMessage) mc.getMessageRecord("ECL0100DS");
			msgCheck.setH01USERID(user.getH01USR());
			msgCheck.setH01PROGRM("ECL0100");
			msgCheck.setH01TIMSYS(getTimeStamp());
			msgCheck.setH01SCRCOD("01");
			msgCheck.setH01OPECOD("0004");

			// all the fields here
			java.util.Enumeration enu = msgCheck.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {}
			}
			
			msgCheck.send();
			msgCheck.destroy();
			flexLog("ECL0100DS Message Sent");
		
			// Receive Message
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
		
			// Receive Data
			newmessage = mc.receiveMessage();
			msgCheck = (ECL0100DSMessage) newmessage;
			
			userPO.setIdentifier(msgCheck.getE01NROCHE());
			userPO.setHeader1(msgCheck.getE01AUTCCH());
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("msgCheck", msgCheck);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("error", msgError);
				
			if (IsNotError) {
				try {
					flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_holding.jsp");
					callPage(LangPath + "ECL0100_rt_check_holding.jsp", req, res);						
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else {
				try {
					flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_holding_enter.jsp");
					callPage(LangPath + "ECL0100_rt_check_holding_enter.jsp", req, res);						
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionCheckHolding(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECL0100DSMessage msgCheck = null;
		
		JBObjList beanList = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		String opecode = "";

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgCheck = (ECL0100DSMessage) mc.getMessageRecord("ECL0100DS");
			msgCheck.setH01USERID(user.getH01USR());
			msgCheck.setH01PROGRM("ECL0100");
			msgCheck.setH01TIMSYS(getTimeStamp());
			msgCheck.setH01SCRCOD("01");
			msgCheck.setH01OPECOD("0001");

			// all the fields here
			java.util.Enumeration enu = msgCheck.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {}
			}
			
			msgCheck.send();
			msgCheck.destroy();
			flexLog("ECL0100DS Message Sent");
		
			// Receive Message
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
		
			// Receive Data
			newmessage = mc.receiveMessage();
			msgCheck = (ECL0100DSMessage) newmessage;
			
			userPO.setIdentifier(msgCheck.getE01NROCHE());
			userPO.setHeader1(msgCheck.getE01AUTCCH());
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("msgCheck", msgCheck);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("error", msgError);
				
			if (IsNotError) {
				try {
					flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_holding_confirm.jsp");
					callPage(LangPath + "ECL0100_rt_check_holding_confirm.jsp", req, res);						
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else {
				if (msgError.getERNU01().equals("6515")) {
					try {
						flexLog("About to call Page: " + super.srctx + "/servlet/datapro.eibs.misc.JSECL0100?SCREEN=200&E01CCLIDT=" + msgCheck.getE01TIIDCL() + "&E01CCLIDN=" + msgCheck.getE01IDNCLI() + "&E01CCLPIN=");
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0100?SCREEN=200&E01CCLIDT=" + msgCheck.getE01TIIDCL() + "&E01CCLIDN=" + msgCheck.getE01IDNCLI() + "&E01CCLPIN=");
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_holding.jsp");
						callPage(LangPath + "ECL0100_rt_check_holding.jsp", req, res);						
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

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqCheckReversal(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		ECL0100DSMessage msgCheck = null;
		UserPos userPO = null;
	
		msgCheck = (ECL0100DSMessage) ses.getAttribute("msgCheck");
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		ses.setAttribute("msgCheck", msgCheck);
		ses.setAttribute("userPO", userPO);
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_reversal.jsp");
			callPage(LangPath + "ECL0100_rt_check_reversal.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionCheckReversal(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECL0100DSMessage msgCheck = null;
		
		JBObjList beanList = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		String opecode = "";
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgCheck = (ECL0100DSMessage) mc.getMessageRecord("ECL0100DS");
			msgCheck.setH01USERID(user.getH01USR());
			msgCheck.setH01PROGRM("ECL0100");
			msgCheck.setH01TIMSYS(getTimeStamp());
			msgCheck.setH01SCRCOD("01");
			msgCheck.setH01OPECOD("0010");
	
			// all the fields here
			java.util.Enumeration enu = msgCheck.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {}
			}
			
			msgCheck.setE01USUTRA(user.getH01USR());
			
			msgCheck.send();
			msgCheck.destroy();
			flexLog("ECL0100DS Message Sent");
		
			// Receive Error
			newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
		
			// Receive Data
			newmessage = mc.receiveMessage();
			msgCheck = (ECL0100DSMessage) newmessage;
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("msgCheck", msgCheck);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("error", msgError);

			if (IsNotError) {
				// Send Initial data
				msgCheck.setH01USERID(user.getH01USR());
				msgCheck.setH01PROGRM("ECL0100");
				msgCheck.setH01TIMSYS(getTimeStamp());
				msgCheck.setH01SCRCOD("01");
				msgCheck.setH01OPECOD("0009");
		
				msgCheck.send();
				msgCheck.destroy();
				flexLog("ECL0100DS Message Sent");
				
				// Receive Error
				newmessage = mc.receiveMessage();
		
				if (newmessage.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage)newmessage;
					IsNotError = msgError.getERRNUM().equals("0");
					flexLog("IsNotError = " + IsNotError);
					showERROR(msgError);
				}
				else
					flexLog("Message " + newmessage.getFormatName() + " received.");
			
				// Receive Data
				newmessage = mc.receiveMessage();
				msgCheck = (ECL0100DSMessage) newmessage;
				
				userPO.setIdentifier(msgCheck.getE01NROCHE());
				userPO.setHeader1(msgCheck.getE01AUTCCH());
				
				flexLog("Putting java beans into the session");
				ses.setAttribute("msgCheck", msgCheck);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("error", msgError);
					
				if (IsNotError) {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_reversal_confirm.jsp");
						callPage(LangPath + "ECL0100_rt_check_reversal_confirm.jsp", req, res);						
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_reversal.jsp");
						callPage(LangPath + "ECL0100_rt_check_reversal.jsp", req, res);						
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}
			else {
				try {
					flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_reversal.jsp");
					callPage(LangPath + "ECL0100_rt_check_reversal.jsp", req, res);						
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqValidate(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
				throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ECL0000DSMessage msgCust = null;
		ELEERRMessage msgError = null;
		JBObjList msgList = null;
		JBObjList prodList = null;
		UserPos	userPO = null;
		boolean IsNotError = true;
	
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		  	} 
		catch (Exception ex) {
			flexLog("Error: " + ex); 
	  	}
	
		userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
		
		// Send Initial data
		try
		{
			msgCust = (ECL0000DSMessage) mc.getMessageRecord("ECL0000DS");
		 	msgCust.setH01USERID(user.getH01USR());
		 	msgCust.setH01PROGRM("ECL0000");
		 	msgCust.setH01TIMSYS(getTimeStamp());
		 	msgCust.setH01SCRCOD("01");
		 	msgCust.setH01OPECOD("0002");
	
			// all the fields here
			java.util.Enumeration enu = msgCust.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {}
			}
	
			msgCust.send();	
		 	msgCust.destroy();
		 	flexLog("ECL0000DS Message Sent");
		}		
		catch (Exception e)
		{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}
			
		// Receive Error
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
		
		// Receive Data
		try
		{
		    newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("ECL0000DS")) {
				msgList = new JBObjList();
				boolean firstTime = true;
				String marker = "";
	
				while (true) {
					msgCust = (ECL0000DSMessage) newmessage;
					marker = msgCust.getH01FLGMAS();
	
					if (marker.equals("*")) {
						msgList.setShowNext(false);
						break;
					}
					else {
						msgList.addRow(msgCust);
						if (firstTime) {
							firstTime = false;
						}
						if (marker.equals("+")) {
							msgList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}
	
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
			userPO.setHeader1(msgCust.getE01CCLIDT());
			userPO.setHeader2(msgCust.getE01CCLIDN());
			userPO.setHeader3(msgCust.getE01CCLNA1());
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msgList", msgList);
			ses.setAttribute("msgCust", msgCust);
			ses.setAttribute("userPO", userPO);
	
			if (IsNotError) {  // There are no errors
				try {
					flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_holding_validate.jsp");
					callPage(LangPath + "ECL0100_rt_check_holding_validate.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else {  // There are errors
				try {
					flexLog("About to call Page: " + LangPath + "ECL0000_generic_cust_blocked.jsp");
					callPage(LangPath + "ECL0000_generic_cust_blocked.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
	
		}
		catch (Exception e)	{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}	
	
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionValidate(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECL0100DSMessage msgCheck = null;
		
		JBObjList beanList = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		String opecode = "";
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgCheck = (ECL0100DSMessage) mc.getMessageRecord("ECL0100DS");
			msgCheck.setH01USERID(user.getH01USR());
			msgCheck.setH01PROGRM("ECL0100");
			msgCheck.setH01TIMSYS(getTimeStamp());
			msgCheck.setH01SCRCOD("01");
			msgCheck.setH01OPECOD("0004");
	
			// all the fields here
			java.util.Enumeration enu = msgCheck.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {}
			}
			
			msgCheck.send();
			msgCheck.destroy();
			flexLog("ECL0100DS Message Sent");
		
			// Receive Message
			newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
		
			// Receive Data
			newmessage = mc.receiveMessage();
			msgCheck = (ECL0100DSMessage) newmessage;
			
			userPO.setIdentifier(msgCheck.getE01NROCHE());
			userPO.setHeader1(msgCheck.getE01AUTCCH());
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("msgCheck", msgCheck);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("error", msgError);
				
			if (IsNotError) {
				try {
					flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_holding_confirm.jsp");
					callPage(LangPath + "ECL0100_rt_check_holding_confirm.jsp", req, res);						
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else {
				try {
					flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_holding_enter.jsp");
					callPage(LangPath + "ECL0100_rt_check_holding_enter.jsp", req, res);						
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionCustomerBlocked(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
				throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ECL0000DSMessage msgCust = null;
		ELEERRMessage msgError = null;
		JBObjList msgList = null;
		UserPos	userPO = null;
		boolean IsNotError = true;
	
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		  	} 
		catch (Exception ex) {
			flexLog("Error: " + ex);
	  	}
	
		userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
	
		// Send Initial data
		try
		{
			msgCust = (ECL0000DSMessage) mc.getMessageRecord("ECL0000DS");
		 	msgCust.setH01USERID(user.getH01USR());
		 	msgCust.setH01PROGRM("ECL0000");
		 	msgCust.setH01TIMSYS(getTimeStamp());
		 	msgCust.setH01SCRCOD("01");
		 	msgCust.setH01OPECOD("0020");
	
			// all the fields here
			java.util.Enumeration enu = msgCust.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {}
			}
	
			msgCust.send();	
		 	msgCust.destroy();
		 	flexLog("ECL0000DS Message Sent");
		}		
		catch (Exception e)
		{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}
			
		// Receive Data
		try
		{
		  newmessage = mc.receiveMessage();
		  
		  if (newmessage.getFormatName().equals("ELEERR")) {
		  		msgError = (ELEERRMessage)newmessage;
		  		IsNotError = msgError.getERRNUM().equals("0");
		  		flexLog("IsNotError = " + IsNotError);
		  		showERROR(msgError);
		  }
		  else if (newmessage.getFormatName().equals("ECL0000DS")) {
				try {
					msgCust = new datapro.eibs.beans.ECL0000DSMessage();
				  	msgCust = (ECL0000DSMessage) newmessage;
					
					flexLog("ECL0000DS Message Received");
			  	} catch (Exception ex) {
					flexLog("Error: " + ex); 
			  	}
	
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msgCust", msgCust);
			ses.setAttribute("userPO", userPO);
	
			if (IsNotError) {  // There are no errors
				try {
					flexLog("About to call Page: " + LangPath + "ECL0000_generic_cust_blocked.jsp");
					callPage(LangPath + "ECL0000_generic_cust_blocked.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else {  // There are errors
				try {
					flexLog("About to call Page: " + LangPath + "ECL0100_rt_check_holding_enter.jsp");
					callPage(LangPath + "ECL0100_rt_check_holding_enter.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
	
		}
		catch (Exception e)	{
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

			int screen = R_ENTER;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opening Socket Connection");
					mc = new MessageContext(getMessageHandler("ECL0100", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						case R_ENTER :							
							procReqEnter(mc, msgUser, req, res, session);
							break;	
						case R_CHECK_HOLDING :							
							procReqCheckHolding(mc, msgUser, req, res, session);
							break;	
						case A_CHECK_HOLDING :							
							procActionCheckHolding(mc, msgUser, req, res, session);
							break;

						case R_CHECK_REVERSAL :							
							procReqCheckReversal(mc, msgUser, req, res, session);
							break;	
						case A_CHECK_REVERSAL :							
							procActionCheckReversal(mc, msgUser, req, res, session);
							break;

						case R_VALIDATE :
							procReqValidate(mc, msgUser, req, res, session);
							break;
						case A_VALIDATE :
							procActionValidate(mc, msgUser, req, res, session);
							break;
						
						case A_CUST_BLOCKED :
							procActionCustomerBlocked(mc, msgUser, req, res, session);
							break;
						default :
							res.sendRedirect(super.srctx + LangPath + super.devPage);
							break;
					}
				} catch (Exception e) {
			   		e.printStackTrace();
			   		flexLog("Error: " + e);
			   		res.sendRedirect(super.srctx +LangPath + super.sckNotOpenPage);
				} finally {
					mc.close();
				}

			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
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