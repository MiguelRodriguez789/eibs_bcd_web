package datapro.eibs.forex;

/**
 * This type was created by Orestes Garcia.
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;
 
import datapro.eibs.sockets.*;

public class JSEWD0332S extends datapro.eibs.master.SuperServlet {
	
/**
 * Insert the method's description here.
 * Creation date: (1/14/00 12:29:44 PM)
 */
public JSEWD0332S() {
	super();	
}
/**
 * This method was created by David Mavilla
public void destroy() {

	flexLog("free resources used by JSESS00    40");
	
}
/**
 * This method was created by Orestes Garcia.
 */
public void init(ServletConfig config) throws ServletException {
	super.init(config);

}
/**
 * This method was created by Orestes Garcia.
 * @param request HttpServletRequest
 * @param response HttpServletResponse
 */
public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
	MessageContext mc = null;
  	HttpSession session;

	MessageRecord newmessage = null;
	EWD0332DSMessage msgHelp = null;
	ESS0030DSMessage msgUser = null;
	JBList beanList = null;

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

		msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getAttribute("currUser");
		String Language = msgUser.getE01LAN();
		String LangPath = super.rootPath + Language + "/";
		int posi = 0;
		try
		{
			flexLog("Opening Socket Connection");
			mc = new MessageContext(super.getMessageHandler("EWD0332", req));
		

	  	try {
			msgHelp = (EWD0332DSMessage)mc.getMessageRecord("EWD0332DS");
			msgHelp.setRWDUSR(msgUser.getH01USR());
			msgHelp.setSWDBNK(msgUser.getE01UBK());
			msgHelp.setRWDTYP("S");
			msgHelp.send();	
		 	msgHelp.destroy();
		 	flexLog("EWD0332DS Message Sent");
		 	
		 	try{
			 	posi= Integer.parseInt(req.getParameter("Pos"));
			}
			catch (Exception e){
			 	posi=0;	
			}

	
			try{
			 	msgHelp.setRWDFRC(req.getParameter("Pos"));
			}
			catch (Exception e){
			 	msgHelp.setRWDFRC("0");	
			}
			
			try{
			 	msgHelp.setSWDACC(req.getParameter("ACCOUNT"));
			}
			catch (Exception e){
			}
			
		}		
		catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			return;
		}
			
		// Receiving
		try
		{
	  		newmessage = mc.receiveMessage();
	  
	  		if (newmessage.getFormatName().equals("EWD0332DS")) {

				try {
					beanList = new datapro.eibs.beans.JBList();
					flexLog("EWD0332DS Message Received");
			  	} 
				catch (Exception ex) {
					flexLog("Error: " + ex); 
			  	}

				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String myDesc = "";
				boolean firstTime =true;
				while (true) {

					msgHelp = (EWD0332DSMessage)newmessage;

					marker = msgHelp.getSWDOPE();
					
					if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(
						Integer.parseInt(msgHelp.getSWDREC()));
									
						} 
					
					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					}
					else {
						myRow = new StringBuffer("<TR>");
						myRow.append("<td nowrap  ALIGN=CENTER><A HREF=\"javascript:showFRAAcc('"+ msgHelp.getSWDACC() + "')\">" + msgHelp.getSWDACC() + "</A></td>");
						myRow.append("<td nowrap  ALIGN=LEFT><A HREF=\"javascript:showFRAAcc('"+ msgHelp.getSWDACC() + "')\">" + msgHelp.getSWDCUN() + " - " + msgHelp.getSWDDSC() + "</A></td>");
						myRow.append("<td nowrap  ALIGN=CENTER><A HREF=\"javascript:showFRAAcc('"+ msgHelp.getSWDACC() + "')\">" + msgHelp.getSWDSBT() + "</A></td>");
						myRow.append("<td nowrap  ALIGN=CENTER><A HREF=\"javascript:showFRAAcc('"+ msgHelp.getSWDACC() + "')\">" + msgHelp.getSWDITP() + "</A></td>");
						myRow.append("<td nowrap  ALIGN=CENTER><A HREF=\"javascript:showFRAAcc('"+ msgHelp.getSWDACC() + "')\">" + msgHelp.getSWDCCY() + "</A></td>");	
						myRow.append("<td nowrap  ALIGN=CENTER><A HREF=\"javascript:showFRAAcc('"+ msgHelp.getSWDACC() + "')\">" + Util.fcolorCCY(msgHelp.getSWDPRI()) + "</A></td>");		
						myRow.append("<td nowrap  ALIGN=RIGHT><A HREF=\"javascript:showFRAAcc('"+ msgHelp.getSWDACC() + "')\">" + Util.fcolorCCY(msgHelp.getSWDOAM()) + "</A></td>");								
						myRow.append("<td nowrap  ALIGN=RIGHT><A HREF=\"javascript:showFRAAcc('"+ msgHelp.getSWDACC() + "')\">" + msgHelp.getSWDRTE() + "</A></td>");
						myRow.append("<td nowrap  ALIGN=CENTER><A HREF=\"javascript:showFRAAcc('"+ msgHelp.getSWDACC() + "')\">" + msgHelp.getSWDVAL() + "</A></td>");
						myRow.append("<td nowrap  ALIGN=CENTER><A HREF=\"javascript:showFRAAcc('"+ msgHelp.getSWDACC() + "')\">" + msgHelp.getSWDSTS() + "</A></td>");
						myRow.append( "</TR>");
						beanList.addRow(myFlag, myRow.toString());
										
						if (marker.equals("+")) {
							beanList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}
						
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0332Help", beanList);

				try {
					 flexLog("About to call Page: " + LangPath + "EWD0332S_fe_acc.jsp");
					 callPage(LangPath + "EWD0332S_fe_acc.jsp", req, res);
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
	  		}
		}
		catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
		}	
		}
		catch (Exception e)
		{
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

}
}