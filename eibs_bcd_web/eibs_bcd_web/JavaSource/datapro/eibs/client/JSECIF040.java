package datapro.eibs.client;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.*;
import java.net.*;
import java.math.BigDecimal;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;
 
import datapro.eibs.sockets.*;

public class JSECIF040 extends datapro.eibs.master.SuperServlet {

	// CIF options
	protected static final int R_AVERAGE 			= 1;
	protected static final int A_AVERAGE 			= 2;

	// entering options
	protected static final int R_ENTER 				= 100;
	protected static final int A_ENTER	 			= 200;

	protected String LangPath = "S";
	
/**
 * JSECLI001 constructor comment.
 */
public JSECIF040() {
	super();
}
/**
 * This method was created by Orestes Garcia.
 */
public void destroy() {
	
}
/**
 * This method was created by Orestes Garcia.
 */
public void init(ServletConfig config) throws ServletException {
	super.init(config);
}
/**
 * This method was created in VisualAge.
 * by David Mavilla.
 * on 5/17/00.
 */
protected void procActionEnter(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	UserPos	userPO = null;	

	userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");

	String accNum = "";

	try {

		try {
			accNum = req.getParameter("E01ACCNUM");
		}
		catch (Exception e)	{
	 		accNum = "0";
		}

		userPO.setIdentifier(accNum);
		flexLog("Putting java beans into the session");
		ses.setAttribute("userPO", userPO);

		procReqAverage(mc, user, req, res, ses);

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
protected void procReqAverage(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	ECIF04001Message msgList = null;
	ECIF04002Message msgHeader = null;
	ELEERRMessage msgError = null;
	UserPos	userPO = null;	
	boolean IsNotError = false;

	userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");

	int type = 0;
 	String num = "";

	// Send Initial data
	try
	{
		flexLog("Send Initial Data");
		msgList = (ECIF04001Message)mc.getMessageRecord("ECIF04001");
		msgList.setH01USERID(user.getH01USR());
	 	msgList.setH01PROGRM("ECIF040");
	 	msgList.setH01TIMSYS(getTimeStamp());
	 	msgList.setH01SCRCOD("01");
	 	msgList.setH01OPECOD("0004");
	 	
	 	msgList.setE01ACCNUM(userPO.getIdentifier());

	 	msgList.send();	
	 	msgList.destroy();
	 	flexLog("ECIF040 Message Sent");
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
			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} 
			catch (Exception ex) {
				flexLog("Error: " + ex); 
			}

			msgError = (ELEERRMessage)newmessage;
			showERROR(msgError);
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);

			newmessage = mc.receiveMessage();
			try {
				flexLog("About to call Page: " + LangPath + "ECIF040_averages_enter.jsp");
				callPage(LangPath + "ECIF040_averages_enter.jsp", req, res);

			}
			catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		}
		else if (newmessage.getFormatName().equals("ECIF04002")) {
			try {
				msgHeader = new datapro.eibs.beans.ECIF04002Message();
		  	} 
			catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			msgHeader = (ECIF04002Message)newmessage;

			boolean firstTime = true;
			String marker = "";

			java.math.BigDecimal aveN[] = new java.math.BigDecimal[24];
			java.math.BigDecimal ave[] = new java.math.BigDecimal[24];
			int year[] = new int[24];
			int month[] = new int[24];
			for ( int i = 0; i < 24; i++ ) {
				aveN[i] = new java.math.BigDecimal("0");
				ave[i] = new java.math.BigDecimal("0");
				year[i] = -1;
				month[i] = -1;
			}
			
			String aGraph[] = new String[]{"",""};
			int col = 0;
			
			while (true) {

				newmessage = mc.receiveMessage();
				msgList = (ECIF04001Message)newmessage;

				marker = msgList.getE01INDOPE();
				flexLog("marker = " + marker);
				
				if (marker.equals("*")) {
					break;
				}
				else {
					String graph = aGraph[0];
					// totalAssets = totalAssets.add(msgList.getBigDecimalE04BSETOT());
					col ++;
					month[col-1] = Integer.parseInt(msgList.getE01MTHNUM());
					year[col-1] = Integer.parseInt(msgList.getE01YEARNU());
					
					ave[col-1] = msgList.getBigDecimalE01AVERAG();
					aGraph[0] = aGraph[0] + getColumnParams(col, msgList.getE01AVERAG(), 
							msgList.getE01MTHLET() + " " + Util.formatYear(msgList.getE01YEARNU()));
					
					aveN[col-1] = msgList.getBigDecimalE01BALANC();
					aGraph[1] = aGraph[1] + getColumnParams(col, msgList.getE01BALANC(), 
							msgList.getE01MTHLET() + " " + Util.formatYear(msgList.getE01YEARNU()));
						
				}
			}
				
			flexLog("Putting java beans into the session");
			ses.setAttribute("aveBean", getAverage(user, col, aGraph[0], ave, year, month));
			ses.setAttribute("netBean", getAverage(user, col, aGraph[1], aveN, year, month));
			ses.setAttribute("header", msgHeader);
			ses.setAttribute("userPO", userPO);

			try {
				flexLog("About to call Page: " + LangPath + "ECIF040_averages_rt.jsp");
				callPage(LangPath + "ECIF040_averages_rt.jsp", req, res);

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

/**
 * This method was created in VisualAge.
 */
protected void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	ECIF04001Message msgAverage = null;
	ELEERRMessage msgError = null;
	UserPos	userPO = null;	

	try {

		msgAverage = new datapro.eibs.beans.ECIF04001Message();
		msgError = new datapro.eibs.beans.ELEERRMessage();
		userPO = new datapro.eibs.beans.UserPos();
		userPO.setOption("AVERAGE");
		userPO.setPurpose("");
		ses.setAttribute("average", msgAverage);
		ses.setAttribute("error", msgError);
		ses.setAttribute("userPO", userPO);

  	} catch (Exception ex) {
		flexLog("Error: " + ex); 
  	}

	try {
		flexLog("About to call Page: " + LangPath + "ECIF040_averages_enter.jsp");
		callPage(LangPath + "ECIF040_averages_enter.jsp", req, res);	
	}
	catch (Exception e) {
		flexLog("Exception calling page " + e);
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
				mc = new MessageContext(super.getMessageHandler("ECIF040", req));
			
			
			try {
				screen = Integer.parseInt(req.getParameter("SCREEN"));
			}
			catch (Exception e) {
				flexLog("Screen set to default value");
			}
		
			switch (	screen) {
				case R_AVERAGE :
					procReqAverage(mc, msgUser, req, res, session);
					break;
				case A_AVERAGE :
					break;
				//entering options
				case R_ENTER :
					procReqEnter(msgUser, req, res, session);
					break;
				case A_ENTER :
					procActionEnter(mc, msgUser, req, res, session);
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

private String getColor(int color){
	String myColor = "red";
	
	switch (color) {
		case 1:
			myColor = "red";
			break;
		case 2:
			myColor = "green";
			break;
		case 3:
			myColor = "blue";
			break;
		case 4:
			myColor = "pink";
			break;
		case 5:
			myColor = "orange";
			break;
		case 6:
			myColor = "magenta";
			break;
		case 7:
			myColor = "cyan";
			break;
		case 8:
			myColor = "white";
			break;
		case 9:
			myColor = "yellow";
			break;
		case 10:
			myColor = "gray";
			break;
		case 11:
			myColor = "darkGray";
			break;		
		case 12:
			myColor = "red";
			break;
	}
		
	return myColor;
}


private String getColumnParams(int col, String average, String value){
	String graph = "";
	graph += "<param name=c" + col + "_label value=\"" + value + "\">";
	graph += "<param name=c" + col + " value=\"" + Util.parseCCYtoDouble(average) + "\">";
	graph += "<param name=c" + col + "_valab value=\"" + average + "\">";					
	graph += "<param name=c" + col + "_color value=\"" + getColor(col) + "\">";
	graph += "<param name=c" + col + "_style value=\"solid\">";
	return graph;
}

private JBAverage getAverage(ESS0030DSMessage user, int col, String graph, BigDecimal ave[], int year[], int month[]){
		JBAverage beanAve = new datapro.eibs.beans.JBAverage();
		
		java.math.BigDecimal factor_3 = new java.math.BigDecimal("3");
		java.math.BigDecimal factor_12 = new java.math.BigDecimal("12");
		java.math.BigDecimal aveTrimestral = new java.math.BigDecimal("0");
		java.math.BigDecimal currAnnualAve = new java.math.BigDecimal("0");
		java.math.BigDecimal prevAnnualAve = new java.math.BigDecimal("0");
		int currYear = user.getBigDecimalE01RDY().intValue();
		int prevYear = currYear - 1;
		
		if (col > 0) {
			beanAve.setNoRecord(false);
			currYear = year[col-1];
			if (currYear == 0) {
				prevYear = 1999;
			} else {
				prevYear = currYear - 1;
			}
			beanAve.setCurrYear(Util.formatYear(currYear));
			beanAve.setPrevYear(Util.formatYear(prevYear));

			try {
				for (int i = (col - 1); i > -1; i-- ) {
					if ( year[i] == currYear ) {
						beanAve.setCurrYearMAve(ave[i].toString(), (month[i] - 1));
						currAnnualAve = currAnnualAve.add(ave[i]);
						if ( (month[i] % 3) == 0) {
							aveTrimestral = aveTrimestral.add(ave[i]);
							if (i == 0) {
								aveTrimestral = aveTrimestral.divide(factor_3, BigDecimal.ROUND_UP);
								beanAve.setCurrYear3MAve(aveTrimestral.toString(), ((month[i] + 2)/3) - 1);
							}
						}
						else if ( ((month[i] + 1) % 3) == 0) {
							aveTrimestral = aveTrimestral.add(ave[i]);
							if (i == 0) {
								aveTrimestral = aveTrimestral.divide(factor_3, BigDecimal.ROUND_UP);
								beanAve.setCurrYear3MAve(aveTrimestral.toString(), ((month[i] + 2)/3) - 1);
							}
						}
						else if ( ((month[i] + 2) % 3) == 0) {
							aveTrimestral = aveTrimestral.add(ave[i]);
							aveTrimestral = aveTrimestral.divide(factor_3, BigDecimal.ROUND_UP);
							beanAve.setCurrYear3MAve(aveTrimestral.toString(), ((month[i] + 2)/3) - 1);
							aveTrimestral = new java.math.BigDecimal("0");
						}
					}
					else if ( year[i] == prevYear ) {
						beanAve.setPrevYearMAve(ave[i].toString(), (month[i] - 1));
						prevAnnualAve = prevAnnualAve.add(ave[i]);
						if ( (month[i] % 3) == 0) {
							aveTrimestral = aveTrimestral.add(ave[i]);
							if (i == 0) {
								aveTrimestral = aveTrimestral.divide(factor_3, BigDecimal.ROUND_UP);
								beanAve.setPrevYear3MAve(aveTrimestral.toString(), ((month[i] + 2)/3) - 1);
							}
						}
						else if ( ((month[i] + 1) % 3) == 0) {
							aveTrimestral = aveTrimestral.add(ave[i]);
							if (i == 0) {
								aveTrimestral = aveTrimestral.divide(factor_3, BigDecimal.ROUND_UP);
								beanAve.setPrevYear3MAve(aveTrimestral.toString(), ((month[i] + 2)/3) - 1);
							}
						}
						else if ( ((month[i] + 2) % 3) == 0) {
							aveTrimestral = aveTrimestral.add(ave[i]);
							aveTrimestral = aveTrimestral.divide(factor_3, BigDecimal.ROUND_UP);
							beanAve.setPrevYear3MAve(aveTrimestral.toString(), ((month[i] + 2)/3) - 1);
							aveTrimestral = new java.math.BigDecimal("0");
						}
					}
					else {
						break;
					}	
				}
			}
			catch (Exception e) {
				flexLog("Read error " + e);
			}
		} else {
			beanAve.setCurrYear(Util.formatYear(currYear));
			beanAve.setPrevYear(Util.formatYear(prevYear));
		}
			
		currAnnualAve = currAnnualAve.divide(factor_12, BigDecimal.ROUND_UP);
		prevAnnualAve = prevAnnualAve.divide(factor_12, BigDecimal.ROUND_UP);
		if ( !graph.equals("")) {
	    	String appHeader = "<applet archive=\"eibs_applets.zip\" code=\"datapro.eibs.applets.graph.Chart.class\" width=100% height=350 align=\"absmiddle\"  codebase=\"" + super.webAppPath + LangPath + "\">";
			//String appHeader = "<applet code=\"datapro/eibs/applets/graph/Chart.class\" width=100% height=350 align=\"absmiddle\" >";   
	    	graph = appHeader + "<param name=title value=\"\">" +
	    		"<param name=columns value=" + col + ">" +
	    		"<param name=orientation value=\"vertical\">" +
	    		"<param name=scale value=\"1\">" + 
	    		graph + "</applet>";
		}
	
		beanAve.setCurrYearAve(currAnnualAve.toString());
		beanAve.setPrevYearAve(prevAnnualAve.toString());
		beanAve.setGraph(graph);
		
	return beanAve;
}

}