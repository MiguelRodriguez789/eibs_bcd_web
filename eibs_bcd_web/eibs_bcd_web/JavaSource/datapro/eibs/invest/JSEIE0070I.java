package datapro.eibs.invest;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;
import datapro.eibs.master.Util;
 
import datapro.eibs.sockets.*;

public class JSEIE0070I extends datapro.eibs.master.SuperServlet {

	// Action 
	protected static final  int A_NEW				= 2;
	protected static final  int A_MAINTENANCE		= 4;
		
	protected static final  int A_ENTER_NEW	 	= 200;
	protected static final  int A_ENTER_MAINT	 	= 400;
	protected static final  int A_ENTER_DELETE	 	= 600;
	protected static final  int A_ENTER_INQUIRY 	= 800;
	
	protected static final  int R_LIST		 		= 900;
	protected static final  int A_LIST		 		= 1000;
	
	protected static final  int R_AUT_CALC			= 1200;

	
	protected String LangPath = "S";

/**
 * JSEIE00000 constructor comment.
 */
public JSEIE0070I() {
	super();
}

/**
 * This method was created by Orestes Garcia.
 */
public void destroy() {

	flexLog("free resources used by JSEIE00000");
	
}
/**
 * This method was created by David Mavilla.
 */
public void init(ServletConfig config) throws ServletException {
	super.init(config);
}
protected  void procActionEnterInquiry(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {


	MessageRecord newmessage = null;
	EIE007001Message msgInst = null;
	ELEERRMessage msgError = null;
	UserPos	userPO = null;	
	boolean IsNotError = false;

	try {
		msgError = new ELEERRMessage();
	  	} 
	catch (Exception ex) {
		flexLog("Error: " + ex); 
  	}

	userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");

	String opCode = null;
	String CODE = "";
	
	
	// Send Initial data
	try
	{
		msgInst = (EIE007001Message)mc.getMessageRecord("EIE007001");
	 	msgInst.setH01USERID(user.getH01USR());
	 	msgInst.setH01PROGRM("EIE0000");
	 	msgInst.setH01TIMSYS(getTimeStamp());
	 	msgInst.setH01SCRCOD("01");
	 	msgInst.setH01OPECOD("0003");
	 	
	 	try{
	 	 msgInst.setE01SCHIIC(req.getParameter("CODE"));
	 	}		
	    catch (Exception e)	{	
	    }
		
		try{
	 	 msgInst.setE01SCHTYP(req.getParameter("PAYMENT"));
	 	}		
	    catch (Exception e)	{
	    }
	    
	    try{
	 	 msgInst.setE01SCHPA1(req.getParameter("DATE1"));
	 	}		
	    catch (Exception e)	{
	    }
	    try{
	 	 msgInst.setE01SCHPA2(req.getParameter("DATE2"));
	 	}		
	    catch (Exception e)	{
	    }
	    try{
	 	 msgInst.setE01SCHPA3(req.getParameter("DATE3"));
	 	}		
	    catch (Exception e)	{
	    }
	    
	 	msgInst.send();
	 	msgInst.destroy();
	 	flexLog("EIE007001 Message Sent");
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
		flexLog("IsNotError = " + IsNotError);
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


		if (newmessage.getFormatName().equals("EIE007001")) {
			try {
				msgInst = new EIE007001Message();
		  	} catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}


			msgInst = (EIE007001Message)newmessage;
			
			userPO.setPurpose("I");		
			CODE = msgInst.getE01SCHIIC();
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("invTrade", msgInst);
			ses.setAttribute("userPO", userPO);
 
			if (IsNotError) {  // There are no errors
								
					try {
						flexLog("About to call Page: " + LangPath + "EIE0070I_inv_payment_inq.jsp");
						callPage(LangPath + "EIE0070I_inv_payment_inq.jsp", req, res);	
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
			}
			else {  // There are errors
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.invest.JSEIE0070I?SCREEN=900"+ "&CODE=" + CODE);		
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

	protected  void procReqListMultiple(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {


	MessageRecord newmessage = null;
	EIE007001Message msgInst = null;
	ELEERRMessage msgError = null;
	UserPos	userPO = null;	
	JBList beanList = null;
	boolean IsNotError = false;

	try {
		msgError = new ELEERRMessage();
	  	} 
	catch (Exception ex) {
		flexLog("Error: " + ex); 
  	}


	userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");


	String opCode = null;
	
	
	
	// Send Initial data
	try
	{
		msgInst = (EIE007001Message)mc.getMessageRecord("EIE007001");
	 	msgInst.setH01USERID(user.getH01USR());
	 	msgInst.setH01PROGRM("EIE0000");
	 	msgInst.setH01TIMSYS(getTimeStamp());
	 	msgInst.setH01SCRCOD("01");
	 	msgInst.setH01OPECOD("0015");


		try {
		 	  msgInst.setE01SCHIIC(req.getParameter("CODE"));
		}
		catch (Exception e)	{
	 		  msgInst.setE01SCHIIC(userPO.getIdentifier()); 
		}
		
	 	msgInst.send();
	 	msgInst.destroy();
	 	flexLog("EIE007001 Message Sent");
	}		
	catch (Exception e)	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();


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


				// showERROR(msgError);
				beanList.setNoResult(true);


				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);


				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.invest.JSEWD0308S?SCREEN=100");


			} else
				if (newmessage.getFormatName().equals("EIE007001")) {


					try {
						beanList = new JBList();
					} catch (Exception ex) {
						flexLog("Error: " + ex);
					}


					boolean firstTime;
					String marker = "";
					String myFlag = "";
					StringBuffer myRow = null;
					String chk = "";
					String TableTyp = "";
					//var for ofac status
					//var for Warning status
					String chkOfac = "";
					String chkWarn = "";
					
					int indexRow = 0;
					while (true) {


						msgInst = (EIE007001Message) newmessage;


						marker = msgInst.getH01FLGMAS();
						
						userPO.setIdentifier(msgInst.getE01SCHIIC());
						userPO.setHeader1(msgInst.getD01ISIDSC());
						userPO.setHeader2(msgInst.getE01SCHTYP());
						userPO.setHeader3(msgInst.getD01ISICCY());

						if (marker.equals("*")) {
							beanList.setShowNext(false);
							break;
						} else {
							
							
							myRow = new StringBuffer("<TR>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER><input type=\"radio\" name=\"index\" value=\""
								+ msgInst.getE01SCHIIC()
								+ "\" "
								+ chk
								+ " onclick=\"getParams('"
								+ msgInst.getE01SCHIIC()
								+ "', '"
								+ msgInst.getE01SCHPA1()
								+ "', '"
								+ msgInst.getE01SCHPA2()
								+ "', '"
								+ msgInst.getE01SCHPA3()
								+ "', '"
								+ msgInst.getE01SCHTYP()
								+ "')\"></TD>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER>" + msgInst.getE01SCHTYP() + "</td>");				
							myRow.append("<TD NOWRAP  ALIGN=RIGHT>" + Util.fcolorCCY(msgInst.getE01SCHAM1()) + msgInst.getE01SCHPFO() + "</td>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER>" + Util.formatDate(msgInst.getE01SCHDE1(),msgInst.getE01SCHDE2(),msgInst.getE01SCHDE3()) + "</td>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER>" + Util.formatDate(msgInst.getE01SCHRE1(),msgInst.getE01SCHRE2(),msgInst.getE01SCHRE3()) + "</td>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER>" + Util.formatDate(msgInst.getE01SCHPA1(),msgInst.getE01SCHPA2(),msgInst.getE01SCHPA3()) + "</td>");	
							myRow.append("<TD NOWRAP  ALIGN=CENTER>" + msgInst.getE01SCHSTS() + "</td>");															
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


					flexLog("Putting java beans into the session");
					ses.setAttribute("invList", beanList);
					ses.setAttribute("userPO", userPO);


					try {
						flexLog("About to call Page: " + LangPath + "EIE0070I_sel_list_payments.jsp");
						callPage(LangPath + "EIE0070I_sel_list_payments.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}


				} else
					flexLog("Message " + newmessage.getFormatName() + " received.");


		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}


	}

	protected  void procActionListMultiple(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {


		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;


		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");


		int inptOPT = 0;


		inptOPT = Integer.parseInt(req.getParameter("opt"));


		String CODE = req.getParameter("CODE");
		String DATE1 = req.getParameter("DATE1");
		String DATE2 = req.getParameter("DATE2");
		String DATE3 = req.getParameter("DATE3");
		String PAYMENT = req.getParameter("PAYMENT");
		
		//Automatic Calculation
		String FRECPER = req.getParameter("FRECPER");
		String FRECCOD = req.getParameter("FRECCOD");
		String DATES1 = req.getParameter("DATES1");
		String DATES2 = req.getParameter("DATES2");
		String DATES3 = req.getParameter("DATES3");
		String PTYPE = req.getParameter("PTYPE");
		String PAMOUNT = req.getParameter("PAMOUNT");
		String PAYTYPE = req.getParameter("PAYTYPE");
				
		switch (inptOPT) {
			case 4 : //Inquiry
			    res.sendRedirect(super.srctx + 
					"/servlet/datapro.eibs.invest.JSEIE0070I?SCREEN=800" + "&CODE=" + CODE + "&DATE1=" + DATE1
					+ "&DATE2=" + DATE2 + "&DATE3=" + DATE3 + "&PAYMENT=" + PAYMENT);
				break;	
			
			case 10 : //Action Main List
				res.sendRedirect(super.srctx + 
					"/servlet/datapro.eibs.invest.JSEIE0050?SCREEN=400" + "&CODE=" + userPO.getIdentifier());		    
				break;				
			default :
				res.sendRedirect(super.srctx + 
					"/servlet/datapro.eibs.invest.JSEIE0070?SCREEN=200" + "&CODE=" + CODE);	
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

		int screen = A_ENTER_INQUIRY;
		
		try {

			msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getAttribute("currUser");

			// Here we should get the path from the user profile
			LangPath = super.rootPath + msgUser.getE01LAN() + "/";

			try
			{
				flexLog("Opennig Socket Connection");
				mc = new MessageContext(super.getMessageHandler("EIE0070", req));
			
			
			try {
				screen = Integer.parseInt(req.getParameter("SCREEN"));
			}
			catch (Exception e) {
				flexLog("Screen set to default value");
			}
		
			switch (screen) {

				// Action

				case A_ENTER_INQUIRY : 
					procActionEnterInquiry(mc, msgUser, req, res, session);
					break;
									
				case R_LIST :
					procReqListMultiple(mc, msgUser, req, res, session);
					break;
				case A_LIST :
					procActionListMultiple(mc, msgUser, req, res, session);
					break;						
				// END Entering

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
