package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;
 
import datapro.eibs.sockets.*;

public class JSEDD0395 extends datapro.eibs.master.SuperServlet {

	// CIF options
	protected static final int R_DEFERRED				= 1;
	protected static final int A_DEFERRED				= 2;

	// entering options
	protected static final int R_ENTER 				= 100;
	protected static final int A_ENTER	 			= 200;

	protected String LangPath = "S";

/**
 * JSECLI001 constructor comment.
 */
public JSEDD0395() {
	super();
}
/**
 * This method was created by Orestes Garcia.
 */
public void destroy() {

	flexLog("free resources used by JSESD0080");
	
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
protected void procReqDeferred(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDD0395DSMessage msgList = null;
	ELEERRMessage msgError = null;
	JBList beanList = null;
	UserPos	userPO = null;	
	boolean IsNotError = false;

	try {
		msgError = new datapro.eibs.beans.ELEERRMessage();
  	} 
	catch (Exception ex) {
		flexLog("Error: " + ex); 
  	}

	userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");

	int type = 0;
 	String num = "";

	// Send Initial data
	try
	{
		flexLog("Send Initial Data");
		msgList = (EDD0395DSMessage)mc.getMessageRecord("EDD0395DS");
		msgList.setH01USERID(user.getH01USR());
	 	msgList.setH01PROGRM("EDD0395");
	 	msgList.setH01TIMSYS(getTimeStamp());
	 	msgList.setH01SCRCOD("01");
	 	msgList.setE01UNCACC(userPO.getIdentifier());

	 	msgList.send();	
	 	msgList.destroy();
	 	flexLog("EDD0395DS Message Sent");
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

		if (newmessage.getFormatName().equals("ELEERR")) {

			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} 
			catch (Exception ex) {
				flexLog("Error: " + ex); 
			  	}

			msgError = (ELEERRMessage)newmessage;

			// showERROR(msgError);

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);

			try {
				flexLog("About to call Page: " + LangPath + "EDD0000_rt_enter_inquiry.jsp");
				callPage(LangPath + "EDD0000_rt_enter_inquiry.jsp", req, res);

			}
			catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		}
		else if (newmessage.getFormatName().equals("EDD0395DS")) {
			try {
				beanList = new datapro.eibs.beans.JBList();
		  	} 
			catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			boolean firstTime = true;
			String marker = "";
			String myFlag = "";
			StringBuffer myRow = null;
			java.math.BigDecimal totalDeferred = new java.math.BigDecimal("0");
			java.math.BigDecimal totalRetention = new java.math.BigDecimal("0");
			java.math.BigDecimal netPosition = new java.math.BigDecimal("0");
			String ret = "";
			String def = "";
			
			while (true) {

				msgList = (EDD0395DSMessage)newmessage;

				marker = msgList.getH01FLGMAS();

				if (marker.equals("*")) {
					beanList.setShowNext(false);
					break;
				}
				else {

					if ( firstTime ) {
						firstTime = false;
					}
					
					myFlag = msgList.getE01UNCFLG().trim();
					if ( myFlag.equals("H") || myFlag.equals("C") ) {
						totalRetention = totalRetention.add(msgList.getBigDecimalE01UNCAMN());
						ret = Util.fcolorCCY(msgList.getE01UNCAMN());
						def = Util.formatCell("");
					}
					else {
						totalDeferred = totalDeferred.add(msgList.getBigDecimalE01UNCAMN());
						ret = Util.formatCell("");
						def = Util.fcolorCCY(msgList.getE01UNCAMN());
					}
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCell(msgList.getE01UNCCKN()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCell(msgList.getE01UNCRSN()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCell(msgList.getE01UNCHTY()) + "</TD>");
					myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCustomDate(user.getE01DTF(),
																		msgList.getBigDecimalE01UNCRDM().intValue(),
																		msgList.getBigDecimalE01UNCRDD().intValue(),
																		msgList.getBigDecimalE01UNCRDY().intValue())	
								+ "</TD>");
					myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCustomDate(user.getE01DTF(),
																		msgList.getBigDecimalE01UNCMDM().intValue(),
																		msgList.getBigDecimalE01UNCMDD().intValue(),
																		msgList.getBigDecimalE01UNCMDY().intValue())	
								+ "</TD>");
					myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCell(msgList.getE01UNCDYS()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + def + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + ret + "</TD>");
					myRow.append("</TR>");
					beanList.addRow(myFlag, myRow.toString());
									
				}

				newmessage = mc.receiveMessage();
			}
			
			netPosition = totalDeferred.subtract(totalRetention);
			userPO.setHeader4(Util.fcolorCCY(totalDeferred.toString()));
			userPO.setHeader5(Util.fcolorCCY(totalRetention.toString()));
			userPO.setHeader6(Util.fcolorCCY(netPosition.toString()));
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("def", beanList);
			ses.setAttribute("userPO", userPO);

			try {
				flexLog("About to call Page: " + LangPath + "EDD0395_deferred_inq.jsp");
				callPage(LangPath + "EDD0395_deferred_inq.jsp", req, res);

			}
			catch (Exception e) {
				flexLog("Exception calling page " + e);
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

		int screen = R_ENTER;
		
		try {
		
			msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getAttribute("currUser");

			// Here we should get the path from the user profile
			LangPath = super.rootPath + msgUser.getE01LAN() + "/";

			try
			{
				flexLog("Opennig Socket Connection");
				mc = new MessageContext(super.getMessageHandler("EDD0395", req));
			
			
			try {
				screen = Integer.parseInt(req.getParameter("SCREEN"));
			}
			catch (Exception e) {
				flexLog("Screen set to default value");
			}
		
			switch (	screen) {
				case R_DEFERRED :
					procReqDeferred(mc, msgUser, req, res, session);
					break;
				case A_DEFERRED :
					break;
				//entering options
				case R_ENTER :
					break;
				case A_ENTER :
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