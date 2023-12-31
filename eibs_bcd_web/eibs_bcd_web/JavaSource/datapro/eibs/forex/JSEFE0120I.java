package datapro.eibs.forex;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

 
import datapro.eibs.sockets.*;

public class JSEFE0120I extends datapro.eibs.master.SuperServlet {

	// Foreign Exchange 
	protected static final int A_INQ_DEAL       = 40;
	protected String LangPath = "S";

/**
 * JSECLI001 constructor comment.
 */
public JSEFE0120I() {
	super();
}

/**
 * This method was created by Orestes Garcia.
 */
public void destroy() {

	flexLog("free resources used by JSFE0120I");
	
}
/**
 * This method was created by David Mavilla.
 */
public void init(ServletConfig config) throws ServletException {
	super.init(config);
}
protected void procActionInqDeal(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {


	MessageRecord newmessage = null;
	EFE0120DSMessage msgFex = null;
	ELEERRMessage msgError = null;
	TrOption trOption = null;	
	boolean IsNotError = false;

	msgError = new ELEERRMessage();
	trOption = (datapro.eibs.beans.TrOption)ses.getAttribute("trOption");
	String ACD= req.getParameter("ACD");
	
	// Send Initial data
	try
	{
		msgFex = (EFE0120DSMessage)mc.getMessageRecord("EFE0120DS");
	 	msgFex.setH01USERID(user.getH01USR());
	 	msgFex.setH01PROGRM("EFE0120P");
	 	msgFex.setH01TIMSYS(getTimeStamp());
	 	msgFex.setH01SCRCOD("01");
	 	msgFex.setH01OPECOD("0002");

		try {
		 	if (req.getParameter("E01FESREF") != null)
		 	  msgFex.setE01FESREF(req.getParameter("E01FESREF"));
		}
		catch (Exception e)	{
	 	  msgFex.setE01FESREF("0");
		}
		try {
		 	if (req.getParameter("E01FESDID") != null)
		 	  msgFex.setE01FESDID(req.getParameter("E01FESDID"));
		}
		catch (Exception e)	{
	 	  msgFex.setE01FESDID("");
		}
		

	 	msgFex.send();
	 	msgFex.destroy();
	 	flexLog("EFE0120DS Message Sent");
	}		
	catch (Exception e)	{
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
		showERROR(msgError);
	  }
	  else
		flexLog("Message " + newmessage.getFormatName() + " received.");
		
	}
	catch (Exception e)	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}	
	
	// Receive Data
	try
	{
	    newmessage = mc.receiveMessage();




		if (newmessage.getFormatName().equals("EFE0120DS")) {
			msgFex = (EFE0120DSMessage)newmessage;
			
				if(ACD.equals("34")){
					trOption.setHeader1("5");				
				}
				else if(ACD.equals("31")){
					trOption.setHeader1("2");				
				}
				else if(ACD.equals("32")){
					trOption.setHeader1("3");				
				}
				else if(ACD.equals("33")){	
					trOption.setHeader1("4");			
				}
				else if(ACD.trim().equals("FSP")){
					trOption.setHeader1("1");				
				}			
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("fex", msgFex);
			ses.setAttribute("trOption", trOption);
			
 
			if (IsNotError) {  // There are no errors
				if(ACD.equals("34")){
					callPage(LangPath + "EFE0120I_fe_basic_opt.jsp", req, res);
				}
				else if(ACD.equals("31")){
					callPage(LangPath + "EFE0120I_fe_basic_sf.jsp", req, res);
				}
				else if(ACD.equals("32")){
					callPage(LangPath + "EFE0120I_fe_basic_forward.jsp", req, res);
				}
				else if(ACD.equals("33")){	
					callPage(LangPath + "EFE0120I_fe_basic_swap.jsp", req, res);
				}
				else if(msgFex.getE01FESTYP().trim().equals("FSP")){
					callPage(LangPath + "EFE0120I_fe_basic_fast_spot.jsp", req, res);
				}
				
			}
			else {  // There are errors
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=300");
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


public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
   
	MessageContext mc = null;

	ESS0030DSMessage msgUser = null;
  	HttpSession session = null;

	session = (HttpSession)req.getSession(false); 
	
	if (session == null) {
		try {
			res.setContentType("text/html");
			printLogInAgain(res.getWriter());
		}
		catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception ocurred. Exception = " + e);
		}
	}
	else {

		int screen = 40;
		
		try {

			msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getAttribute("currUser");

			// Here we should get the path from the user profile
			LangPath = super.rootPath + msgUser.getE01LAN() + "/";

			try
			{
				flexLog("Opening Socket Connection");
				mc = new MessageContext(super.getMessageHandler("EFE0120", req));
			
			
			try {
				screen = Integer.parseInt(req.getParameter("SCREEN"));
			}
			catch (Exception e) {
				flexLog("Screen set to default value");
			}
		
			switch (screen) {
				// Action
				case A_INQ_DEAL : 
					procActionInqDeal(mc, msgUser, req, res, session);
					break;	
					
				default :
					res.sendRedirect(super.srctx + LangPath + super.devPage);
					break;
			}
			}
			catch (Exception e) {
				e.printStackTrace();
				int sck = getInitSocket(req) + 1;
				flexLog("Socket not Open(Port " + sck + "). Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotOpenPage);
				//return;
			}
			finally {
				mc.close();
			}
		}
		catch (Exception e) {
			flexLog("Error: " + e);
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
		}

	}
	
}
protected void showERROR(ELEERRMessage m)
{
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