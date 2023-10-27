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

public class JSECL0000 extends datapro.eibs.master.SuperServlet {

	protected static final int R_IVR_REGISTRY			= 1;
	protected static final int A_IVR_REGISTRY			= 2;
	protected static final int R_IVR_PIN_CHANGE			= 3;
	protected static final int A_IVR_PIN_CHANGE			= 4;
	
	protected static final int R_ENTER					= 100;
	protected static final int A_ENTER					= 200;
	protected static final int R_CUST_OPERATIONS		= 300;
	protected static final int A_CUST_BLOCKED			= 400;
	
	protected static final int R_ACTIVATION_ENTER		= 500;
	protected static final int A_ACTIVATION_ENTER		= 600;
	protected static final int R_ACTIVATION_OPERATIONS	= 700;
	
	protected static final int A_POSITION				= 800;
	
	protected static final int R_SUSPENSION_ENTER		= 900;
	protected static final int A_SUSPENSION_ENTER		= 1000;
	protected static final int R_SUSPENSION_OPERATIONS	= 1100;

	protected String LangPath = "S";

	/**
	 * JSECL0000 constructor comment.
	 */
	public JSECL0000() {
		super();
	}
	/**
	 * This method was created by Gustavo Adolfo Villarroel.
	 */
	public void destroy() {

		flexLog("free resources used by JSECL0000");

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
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0000_generic_cust_id_enter.jsp");
			callPage(LangPath + "ECL0000_generic_cust_id_enter.jsp", req, res);

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionEnter(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
				throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ECL0000DSMessage msgCust = null;
		ECL000001Message msgProd = null;
		ELEERRMessage msgError = null;
		JBObjList msgList = null;
		JBObjList prodList = null;
		UserPos	userPO = null;
		boolean IsNotError = true;
		String pin = "";
		String idt = "";
		String idn = "";
		String opecod = "";
	
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		  	} 
		catch (Exception ex) {
			flexLog("Error: " + ex); 
	  	}
	
		userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
		
		if (req.getParameter("E01CCLPIN") != null) {
			pin = req.getParameter("E01CCLPIN");
		}
		else {
			pin = "";
		}
		idt = req.getParameter("E01CCLIDT");
		idn = req.getParameter("E01CCLIDN");
		if (pin.equals("")) opecod = "0002";
		else opecod = "0003";
	
		// Send Initial data for customer products
		try
		{
			msgProd = (ECL000001Message) mc.getMessageRecord("ECL000001");
		 	msgProd.setH02USERID(user.getH01USR());
		 	msgProd.setH02PROGRM("ECL0000");
		 	msgProd.setH02TIMSYS(getTimeStamp());
		 	msgProd.setH02SCRCOD("01");
		 	msgProd.setH02OPECOD("0004");
	
		 	msgProd.setE02USRCUN(idt + idn);
	
			msgProd.send();	
		 	msgProd.destroy();
		 	flexLog("ECL000001 Message Sent");
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
	
			if (newmessage.getFormatName().equals("ECL000001")) {
				prodList = new JBObjList();
				boolean firstTime = true;
				String marker = "";
	
				while (true) {
					msgProd = (ECL000001Message) newmessage;
					marker = msgProd.getH02FLGMAS();
	
					if (marker.equals("*")) {
						prodList.setShowNext(false);
						break;
					}
					else {
						prodList.addRow(msgProd);
						if (firstTime) {
							firstTime = false;
						}
						if (marker.equals("+")) {
							prodList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}
	
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
			flexLog("Putting java beans into the session");
			ses.setAttribute("prodList", prodList);
		
		}
		catch (Exception e)	{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}	
	
		// Send Initial data
		try
		{
			msgCust = (ECL0000DSMessage)mc.getMessageRecord("ECL0000DS");
		 	msgCust.setH01USERID(user.getH01USR());
		 	msgCust.setH01PROGRM("ECL0000");
		 	msgCust.setH01TIMSYS(getTimeStamp());
		 	msgCust.setH01SCRCOD("01");
		 	msgCust.setH01OPECOD(opecod);

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
			userPO.setHeader4(msgCust.getE01CCLCUN());
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msgList", msgList);
			ses.setAttribute("msgCust", msgCust);
			ses.setAttribute("userPO", userPO);

			if (IsNotError) {  // There are no errors
				if (opecod.equals("0003")) {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_generic_cust_operations.jsp");
						callPage(LangPath + "ECL0000_generic_cust_operations.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_generic_cust_validate.jsp");
						callPage(LangPath + "ECL0000_generic_cust_validate.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}
			else {  // There are errors
				if (msgError.getERNU01().equals("1231") || msgError.getERNU02().equals("1231")) {
					try {
						flexLog("About to call Page: " + super.srctx + "/servlet/datapro.eibs.misc.JSECL0000?SCREEN=200&E01CCLIDT=" + idt + "&E01CCLIDN=" + idn + "&E01CCLPIN=");
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0000?SCREEN=200&E01CCLIDT=" + idt + "&E01CCLIDN=" + idn + "&E01CCLPIN=");
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_generic_cust_id_enter.jsp");
						callPage(LangPath + "ECL0000_generic_cust_id_enter.jsp", req, res);	
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
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqCustomerOperations(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		JBObjList prodList = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		prodList = (datapro.eibs.beans.JBObjList) ses.getAttribute("prodList");
		
		ses.setAttribute("userPO", userPO);
		ses.setAttribute("prodList", prodList);
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0000_generic_cust_operations.jsp");
			callPage(LangPath + "ECL0000_generic_cust_operations.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
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
			msgCust = (ECL0000DSMessage)mc.getMessageRecord("ECL0000DS");
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
				  	msgCust = (ECL0000DSMessage)newmessage;
					
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
					flexLog("About to call Page: " + LangPath + "ECL0000_generic_cust_id_enter.jsp");
					callPage(LangPath + "ECL0000_generic_cust_id_enter.jsp", req, res);	
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
	protected void procReqIVRRegistry(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECL0000DSMessage msgIVR = null;
		UserPos userPO = new UserPos();
		
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		msgIVR = (ECL0000DSMessage) ses.getAttribute("msgCust");

		ses.setAttribute("error", msgError);
		ses.setAttribute("msgIVR", msgIVR);
		ses.setAttribute("userPO", userPO);
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0000_ivr_registry.jsp");
			callPage(LangPath + "ECL0000_ivr_registry.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionIVRRegistry(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
				throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ECL0000DSMessage msgIVR = null;
		ELEERRMessage msgError = null;
		UserPos	userPO = null;
		boolean IsNotError = false;
	
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
			msgIVR = (ECL0000DSMessage)mc.getMessageRecord("ECL0000DS");
		 	msgIVR.setH01USERID(user.getH01USR());
		 	msgIVR.setH01PROGRM("ECL0000");
		 	msgIVR.setH01TIMSYS(getTimeStamp());
		 	msgIVR.setH01SCRCOD("01");
		 	msgIVR.setH01OPECOD("0001");
			try {
				msgIVR.setE01CCLCUN(req.getParameter("E01CCLCUN"));
				msgIVR.setE01CCLNEW(req.getParameter("E01CCLNEW"));
			}
			catch (Exception e)
			{
			    flexLog("Input data error " + e);
			}
	
			msgIVR.send();	
		 	msgIVR.destroy();
		 	flexLog("ECL0000DS Message Sent");
		}		
		catch (Exception e)
		{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}
			
		// Receive Error Message
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
				try {
					msgIVR = new datapro.eibs.beans.ECL0000DSMessage();
					flexLog("ECL0000DS Message Received");
			  	} catch (Exception ex) {
					flexLog("Error: " + ex); 
			  	}
	
				msgIVR = (ECL0000DSMessage)newmessage;
	
				userPO.setCusNum(msgIVR.getE01CCLCUN());
				
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("msgIVR", msgIVR);
				ses.setAttribute("userPO", userPO);
	
				if (IsNotError) {  // There are no errors
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_ivr_registry_confirm.jsp");
						callPage(LangPath + "ECL0000_ivr_registry_confirm.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else {  // There are errors
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_ivr_registry.jsp");
						callPage(LangPath + "ECL0000_ivr_registry.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
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
	protected void procReqIVRPinChange(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECL0000DSMessage msgIVR = new ECL0000DSMessage();
		UserPos userPO = new UserPos();
		
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		msgIVR = (ECL0000DSMessage) ses.getAttribute("msgCust");
		
		ses.setAttribute("error", msgError);
		ses.setAttribute("msgIVR", msgIVR);
		ses.setAttribute("userPO", userPO);
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0000_ivr_pin_change.jsp");
			callPage(LangPath + "ECL0000_ivr_pin_change.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionIVRPinChange(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
				throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ECL0000DSMessage msgIVR = null;
		ELEERRMessage msgError = null;
		UserPos	userPO = null;
		boolean IsNotError = false;
	
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
			msgIVR = (ECL0000DSMessage)mc.getMessageRecord("ECL0000DS");
		 	msgIVR.setH01USERID(user.getH01USR());
		 	msgIVR.setH01PROGRM("ECL0000");
		 	msgIVR.setH01TIMSYS(getTimeStamp());
		 	msgIVR.setH01SCRCOD("01");
		 	msgIVR.setH01OPECOD("0005");
			try {
				msgIVR.setE01CCLCUN(req.getParameter("E01CCLCUN"));
				msgIVR.setE01CCLPIN(req.getParameter("E01CCLPIN"));
				msgIVR.setE01CCLNEW(req.getParameter("E01CCLNEW"));
			}
			catch (Exception e)
			{
			    flexLog("Input data error " + e);
			}
	
			msgIVR.send();	
		 	msgIVR.destroy();
		 	flexLog("ECL0000DS Message Sent");
		}		
		catch (Exception e)
		{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}
			
		// Receive Error Message
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
				try {
					msgIVR = new datapro.eibs.beans.ECL0000DSMessage();
					flexLog("ECL0000DS Message Received");
			  	} catch (Exception ex) {
					flexLog("Error: " + ex); 
			  	}
	
				msgIVR = (ECL0000DSMessage)newmessage;
	
				userPO.setCusNum(msgIVR.getE01CCLCUN());
				
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("msgIVR", msgIVR);
				ses.setAttribute("userPO", userPO);
	
				if (IsNotError) {  // There are no errors
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_ivr_pin_change_confirm.jsp");
						callPage(LangPath + "ECL0000_ivr_pin_change_confirm.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else {  // There are errors
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_ivr_pin_change.jsp");
						callPage(LangPath + "ECL0000_ivr_pin_change.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
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
	protected void procReqActivationEnter(
		MessageContext mc, 
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0000_activation_cust_id_enter.jsp");
			callPage(LangPath + "ECL0000_activation_cust_id_enter.jsp", req, res);
	
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionActivationEnter(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
				throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ECL0000DSMessage msgCust = null;
		ECL000001Message msgProd = null;
		ELEERRMessage msgError = null;
		JBObjList msgList = null;
		JBObjList prodList = null;
		UserPos	userPO = null;
		boolean IsNotError = true;
		String pin = "";
		String idt = "";
		String idn = "";
		String opecod = "";
	
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		  	} 
		catch (Exception ex) {
			flexLog("Error: " + ex); 
	  	}
	
		userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
		
		idt = req.getParameter("E01CCLIDT");
		idn = req.getParameter("E01CCLIDN");
		if (pin.equals("")) opecod = "0002";
		else opecod = "0003";
	
		// Send Initial data for customer products
		try
		{
			msgProd = (ECL000001Message) mc.getMessageRecord("ECL000001");
		 	msgProd.setH02USERID(user.getH01USR());
		 	msgProd.setH02PROGRM("ECL0000");
		 	msgProd.setH02TIMSYS(getTimeStamp());
		 	msgProd.setH02SCRCOD("01");
		 	msgProd.setH02OPECOD("0004");
	
		 	msgProd.setE02USRCUN(idt + idn);
	
			msgProd.send();	
		 	msgProd.destroy();
		 	flexLog("ECL000001 Message Sent");
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
	
			if (newmessage.getFormatName().equals("ECL000001")) {
				prodList = new JBObjList();
				boolean firstTime = true;
				String marker = "";
	
				while (true) {
					msgProd = (ECL000001Message) newmessage;
					marker = msgProd.getH02FLGMAS();
	
					if (marker.equals("*")) {
						prodList.setShowNext(false);
						break;
					}
					else {
						prodList.addRow(msgProd);
						if (firstTime) {
							firstTime = false;
						}
						if (marker.equals("+")) {
							prodList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}
	
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
			flexLog("Putting java beans into the session");
			ses.setAttribute("prodList", prodList);
		
		}
		catch (Exception e)	{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}	
	
		// Send Initial data
		try
		{
			msgCust = (ECL0000DSMessage)mc.getMessageRecord("ECL0000DS");
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
			userPO.setHeader4(msgCust.getE01CCLCUN());
			userPO.setHeader5(msgCust.getE01CCLBDD());
			userPO.setHeader6(msgCust.getE01CCLBDM());
			userPO.setHeader7(msgCust.getE01CCLBDY());
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msgList", msgList);
			ses.setAttribute("msgCust", msgCust);
			ses.setAttribute("userPO", userPO);
	
			if (IsNotError) {  // There are no errors
				if (opecod.equals("0003")) {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_activation_cust_operations.jsp");
						callPage(LangPath + "ECL0000_activation_cust_operations.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_activation_cust_validate.jsp");
						callPage(LangPath + "ECL0000_activation_cust_validate.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}
			else {  // There are errors
				if (msgError.getERNU01().equals("1231") || msgError.getERNU02().equals("1231")) {
					try {
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0000?SCREEN=600&E01CCLIDT=" + idt + "&E01CCLIDN=" + idn + "&E01CCLPIN=");
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_activation_cust_id_enter.jsp");
						callPage(LangPath + "ECL0000_activation_cust_id_enter.jsp", req, res);	
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
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqActivationOperations(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		JBObjList prodList = null;

		userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
		prodList = (datapro.eibs.beans.JBObjList) ses.getAttribute("prodList");
		
		ses.setAttribute("userPO", userPO);
		ses.setAttribute("prodList", prodList);
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0000_activation_cust_operations.jsp");
			callPage(LangPath + "ECL0000_activation_cust_operations.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqSuspensionEnter(
		MessageContext mc, 
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0000_suspension_cust_id_enter.jsp");
			callPage(LangPath + "ECL0000_suspension_cust_id_enter.jsp", req, res);
	
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionSuspensionEnter(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
				throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ECL0000DSMessage msgCust = null;
		ECL000001Message msgProd = null;
		ELEERRMessage msgError = null;
		JBObjList msgList = null;
		JBObjList prodList = null;
		UserPos	userPO = null;
		boolean IsNotError = true;
		String pin = "";
		String idt = "";
		String idn = "";
		String opecod = "";
	
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		  	} 
		catch (Exception ex) {
			flexLog("Error: " + ex); 
	  	}
	
		userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
		
		if (req.getParameter("E01CCLPIN") != null) {
			pin = req.getParameter("E01CCLPIN");
		}
		else {
			pin = "";
		}
		idt = req.getParameter("E01CCLIDT");
		idn = req.getParameter("E01CCLIDN");
		if (pin.equals("")) opecod = "0002";
		else opecod = "0003";
	
		// Send Initial data for customer products
		try
		{
			msgProd = (ECL000001Message) mc.getMessageRecord("ECL000001");
		 	msgProd.setH02USERID(user.getH01USR());
		 	msgProd.setH02PROGRM("ECL0000");
		 	msgProd.setH02TIMSYS(getTimeStamp());
		 	msgProd.setH02SCRCOD("01");
		 	msgProd.setH02OPECOD("0004");
	
		 	msgProd.setE02USRCUN(idt + idn);
	
			msgProd.send();	
		 	msgProd.destroy();
		 	flexLog("ECL000001 Message Sent");
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
	
			if (newmessage.getFormatName().equals("ECL000001")) {
				prodList = new JBObjList();
				boolean firstTime = true;
				String marker = "";
	
				while (true) {
					msgProd = (ECL000001Message) newmessage;
					marker = msgProd.getH02FLGMAS();
	
					if (marker.equals("*")) {
						prodList.setShowNext(false);
						break;
					}
					else {
						prodList.addRow(msgProd);
						if (firstTime) {
							firstTime = false;
						}
						if (marker.equals("+")) {
							prodList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}
	
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
			flexLog("Putting java beans into the session");
			ses.setAttribute("prodList", prodList);
		
		}
		catch (Exception e)	{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}	
	
		// Send Initial data
		try
		{
			msgCust = (ECL0000DSMessage)mc.getMessageRecord("ECL0000DS");
		 	msgCust.setH01USERID(user.getH01USR());
		 	msgCust.setH01PROGRM("ECL0000");
		 	msgCust.setH01TIMSYS(getTimeStamp());
		 	msgCust.setH01SCRCOD("01");
		 	msgCust.setH01OPECOD(opecod);
	
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
			userPO.setHeader4(msgCust.getE01CCLCUN());
			userPO.setHeader5(msgCust.getE01CCLBDD());
			userPO.setHeader6(msgCust.getE01CCLBDM());
			userPO.setHeader7(msgCust.getE01CCLBDY());
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msgList", msgList);
			ses.setAttribute("msgCust", msgCust);
			ses.setAttribute("userPO", userPO);
	
			if (IsNotError) {  // There are no errors
				if (opecod.equals("0003")) {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_suspension_cust_operations.jsp");
						callPage(LangPath + "ECL0000_suspension_cust_operations.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_suspension_cust_validate.jsp");
						callPage(LangPath + "ECL0000_suspension_cust_validate.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}
			else {  // There are errors
				if (msgError.getERNU01().equals("1231") || msgError.getERNU02().equals("1231")) {
					try {
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0000?SCREEN=1000&E01CCLIDT=" + idt + "&E01CCLIDN=" + idn + "&E01CCLPIN=");
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else {
					try {
						flexLog("About to call Page: " + LangPath + "ECL0000_suspension_cust_id_enter.jsp");
						callPage(LangPath + "ECL0000_suspension_cust_id_enter.jsp", req, res);	
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
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqSuspensionOperations(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		JBObjList prodList = null;
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		prodList = (datapro.eibs.beans.JBObjList) ses.getAttribute("prodList");
		
		ses.setAttribute("userPO", userPO);
		ses.setAttribute("prodList", prodList);
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0000_suspension_cust_operations.jsp");
			callPage(LangPath + "ECL0000_suspension_cust_operations.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	
	}
	protected void procActionPosition(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ELEERRMessage msgError = new ELEERRMessage();
		UserPos userPO = null;
		ESS0030DSMessage msgUser = null;
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
		ses.setAttribute("error", msgError);

		try {
			int option = Integer.parseInt(req.getParameter("option"));
	
			switch (option) {
				case 130 : // Balance Inquiry
					ESD080001Message currClient = (ESD080001Message) mc.getMessageRecord("ESD080001");
					currClient.setE01CUSCUN(userPO.getHeader4());
					ses.setAttribute("currClient", currClient);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0130?SCREEN=1");
					break;
				case 140 : // Credit Card Balance Inquiry
					ECL0140DSMessage msgBal2 = (ECL0140DSMessage) mc.getMessageRecord("ECL0140DS");
					msgBal2.setE01IDETIP(userPO.getHeader1());
					msgBal2.setE01IDECLI(userPO.getHeader2());
					msgBal2.setE01NOMCLI(userPO.getHeader3());
					msgBal2.setE01CODCLI(userPO.getHeader4());
					ses.setAttribute("msgBal", msgBal2);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0140?SCREEN=1");
					break;
				case 150 : // Account Transfers
					ECL0150DSMessage msgCC = (ECL0150DSMessage) mc.getMessageRecord("ECL0150DS");
					msgCC.setE01TICLDE(userPO.getHeader1());
					msgCC.setE01COCLDE(userPO.getHeader2());
					msgCC.setE01NOCLDE(userPO.getHeader3());
					msgCC.setE01CODCLI(userPO.getHeader4());
					ses.setAttribute("msgCC", msgCC);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0150?SCREEN=1");
					break;
				case 160 : // Credit Card Payment
					ECL0160DSMessage msgCC2 = (ECL0160DSMessage) mc.getMessageRecord("ECL0160DS");
					msgCC2.setE01TIIDCL(userPO.getHeader1());
					msgCC2.setE01IDNCLI(userPO.getHeader2());
					msgCC2.setE01NOMCLI(userPO.getHeader3());
					msgCC2.setE01CODCLI(userPO.getHeader4());
					ses.setAttribute("msgCC", msgCC2);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0160?SCREEN=1");
					break;
				case 170 : // Credit Card Cash Advance
					ECL0170DSMessage msgCC3 = (ECL0170DSMessage) mc.getMessageRecord("ECL0170DS");
					msgCC3.setE01TIIDCL(userPO.getHeader1());
					msgCC3.setE01IDNCLI(userPO.getHeader2());
					msgCC3.setE01NOMCLI(userPO.getHeader3());
					msgCC3.setE01CODCLI(userPO.getHeader4());
					ses.setAttribute("msgCC", msgCC3);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0170?SCREEN=1");
					break;
				case 180 : // Statement Reissue
					ECL018001Message stBalances = (ECL018001Message) mc.getMessageRecord("ECL018001");
					stBalances.setE01STBTID(userPO.getHeader1());
					stBalances.setE01STBIDN(userPO.getHeader2());
					stBalances.setE01STBNA1(userPO.getHeader3());
					stBalances.setE01STBUSR(userPO.getHeader4());
					ses.setAttribute("stBalances", stBalances);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0180?SCREEN=1");
					break;
				case 190 : // Debit Card Suspension
					ECL0190DSMessage msgCard = (ECL0190DSMessage) mc.getMessageRecord("ECL0190DS");
					msgCard.setE01TIPIDE(userPO.getHeader1());
					msgCard.setE01USRIDN(userPO.getHeader2());
					msgCard.setE01STBNA1(userPO.getHeader3());
					ses.setAttribute("msgCD", msgCard);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0190?SCREEN=1");
					break;
				case 191 : // Debit Card Activation
					ECL0190DSMessage msgCard2 = (ECL0190DSMessage) mc.getMessageRecord("ECL0190DS");
					msgCard2.setE01TIPIDE(userPO.getHeader1());
					msgCard2.setE01USRIDN(userPO.getHeader2());
					msgCard2.setE01STBNA1(userPO.getHeader3());
					ses.setAttribute("msgCD", msgCard2);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0190?SCREEN=3");
					break;
				case 192 : // Debit Card Unblock
					ECL0190DSMessage msgCard3 = (ECL0190DSMessage) mc.getMessageRecord("ECL0190DS");
					msgCard3.setE01TIPIDE(userPO.getHeader1());
					msgCard3.setE01USRIDN(userPO.getHeader2());
					msgCard3.setE01STBNA1(userPO.getHeader3());
					ses.setAttribute("msgCD", msgCard3);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0190?SCREEN=5");
					break;
				case 200 : // Checkbooks Inquiry
					ECL0200DSMessage msgChb = (ECL0200DSMessage) mc.getMessageRecord("ECL0200DS");
					msgChb.setE01TIIDCL(userPO.getHeader1());
					msgChb.setE01NRIDCL(userPO.getHeader2());
					msgChb.setE01NOMCLI(userPO.getHeader3());
					ses.setAttribute("msgChb", msgChb);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0200?SCREEN=1");
					break;
				case 201 : // Checkbooks Detail
					ECL0201DSMessage msgChb2 = (ECL0201DSMessage) mc.getMessageRecord("ECL0201DS");
					msgChb2.setE01TIIDCL(userPO.getHeader1());
					msgChb2.setE01NRIDCL(userPO.getHeader2());
					msgChb2.setE01NOMCLI(userPO.getHeader3());
					ses.setAttribute("msgChb", msgChb2);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0201?SCREEN=1");
					break;
				case 202 : // Checkbooks Suspension
					ECL0202DSMessage msgChb3 = (ECL0202DSMessage) mc.getMessageRecord("ECL0202DS");
					msgChb3.setE01TIIDCL(userPO.getHeader1());
					msgChb3.setE01NRIDCL(userPO.getHeader2());
					msgChb3.setE01NOMCLI(userPO.getHeader3());
					ses.setAttribute("msgChb", msgChb3);
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.misc.JSECL0202?SCREEN=1");
					break;
			}
	
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

			int screen = R_ENTER;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opening Socket Connection");
					mc = new MessageContext(getMessageHandler("ECL0000", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						case R_ENTER :
							procReqEnter(mc, msgUser, req, res, session);
							break;					
						case A_ENTER :							
							procActionEnter(mc, msgUser, req, res, session);
							break;	
						case R_CUST_OPERATIONS :							
							procReqCustomerOperations(mc, msgUser, req, res, session);
							break;
						case A_CUST_BLOCKED :
							procActionCustomerBlocked(mc, msgUser, req, res, session);
							break;

						case R_IVR_REGISTRY :							
							procReqIVRRegistry(mc, msgUser, req, res, session);
							break;	
						case A_IVR_REGISTRY :							
							procActionIVRRegistry(mc, msgUser, req, res, session);
							break;	
						case R_IVR_PIN_CHANGE :							
							procReqIVRPinChange(mc, msgUser, req, res, session);
							break;	
						case A_IVR_PIN_CHANGE :							
							procActionIVRPinChange(mc, msgUser, req, res, session);
							break;
						
						case A_POSITION :
							procActionPosition(mc, msgUser, req, res, session);
							break;
							
						case R_ACTIVATION_ENTER :
							procReqActivationEnter(mc, msgUser, req, res, session);
							break;					
						case A_ACTIVATION_ENTER :							
							procActionActivationEnter(mc, msgUser, req, res, session);
							break;
						case R_ACTIVATION_OPERATIONS :							
							procReqActivationOperations(mc, msgUser, req, res, session);
							break;

						case R_SUSPENSION_ENTER :
							procReqSuspensionEnter(mc, msgUser, req, res, session);
							break;					
						case A_SUSPENSION_ENTER :							
							procActionSuspensionEnter(mc, msgUser, req, res, session);
							break;
						case R_SUSPENSION_OPERATIONS :							
							procReqSuspensionOperations(mc, msgUser, req, res, session);
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