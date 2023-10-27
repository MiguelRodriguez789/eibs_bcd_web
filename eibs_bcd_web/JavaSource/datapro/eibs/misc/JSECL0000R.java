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

public class JSECL0000R extends datapro.eibs.master.SuperServlet {

	protected static final int R_IVR_REGISTRY		= 1;
	protected static final int A_IVR_REGISTRY		= 2;

	protected String LangPath = "S";

	/**
	 * JSECL0000R constructor comment.
	 */
	public JSECL0000R() {
		super();
	}
	/**
	 * This method was created by Gustavo Adolfo Villarroel.
	 */
	public void destroy() {

		flexLog("free resources used by JSECL0000R");

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
	protected void procReqIVRRegistry(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		UserPos userPO = new UserPos();
		
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		ses.setAttribute("error", msgError);
		ses.setAttribute("userPO", userPO);
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0000R_ivr_registry.jsp");
			callPage(LangPath + "ECL0000R_ivr_registry.jsp", req, res);
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

			// all the fields here
			java.util.Enumeration enu = msgIVR.fieldEnumeration();
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
						flexLog("About to call Page: " + LangPath + "ECL0000R_ivr_registry.jsp");
						callPage(LangPath + "ECL0000R_ivr_registry.jsp", req, res);	
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

			int screen = R_IVR_REGISTRY;

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
						case R_IVR_REGISTRY :							
							procReqIVRRegistry(mc, msgUser, req, res, session);
							break;	
						case A_IVR_REGISTRY :							
							procActionIVRRegistry(mc, msgUser, req, res, session);
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