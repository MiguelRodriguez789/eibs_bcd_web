package datapro.eibs.products;  

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import datapro.eibs.beans.EDL095001Message;
import datapro.eibs.beans.EDL095002Message;
import datapro.eibs.beans.EDL095003Message;
import datapro.eibs.beans.EDL095004Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0950 extends datapro.eibs.master.SuperServlet {

	// certificate of deposit 
	protected static final int R_PRECANCEL		= 9;
	protected static final int A_PRECANCEL		= 10;
	protected static final int A_PRECANCEL_ROT	= 11;
	protected static final int R_CANCEL_DET		= 21;
	protected static final int A_CANCEL_DET		= 22;
	protected static final int A_CANCEL_DET_ROT	= 23;
	
	protected static final int R_PAYMENT_INQ		= 27;
	protected static final int R_PAYMENT_CON 	= 28;

	protected static final int R_ENTER_RELEASE 	= 30;
	protected static final int A_ENTER_RELEASE  = 31;
	protected static final int A_RELEASE  		= 32;
	
	
	// entering options
	protected static final int R_ENTER_CANCEL		= 500;
	protected static final int R_ENTER_CANCEL_ROT	= 510;
	protected static final int R_ENTER_PREPAID		= 550;
	protected static final int R_ENTER_PREPAID_FV	= 560;
	
	
	protected static final int A_ENTER_CANCEL		= 600;
	protected static final int A_ENTER_CANCEL_ROT	= 610;
	
	protected String LangPath = "S";

/**
 * JSECLI001 constructor comment.
 */
public JSEDL0950() {
	super();
}
/**
 * This method was created by Orestes Garcia.
 */
public void destroy() {

	flexLog("free resources used by JSEDL0130");
	
}
/**
 * This method was created by David Mavilla.
 */
public void init(ServletConfig config) throws ServletException {
	super.init(config);
}
/**
 * This method was created in VisualAge.
 */
protected void procActionCancelation(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL095001Message msgLN = null;
	EDL095002Message msgLNDet = null;
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
	userPO.setHeader20(Util.getReqParameter("E01PAGFLG", req)); //Flag for Type of Payment
	userPO.setHeader23("");

	// Send Initial data
	try
	{
		flexLog("Send Initial Data");
		msgLNDet = (EDL095002Message)mc.getMessageRecord("EDL095002");
		msgLNDet.setH02USERID(user.getH01USR());
	 	msgLNDet.setH02PROGRM("EDL0950");
	 	msgLNDet.setH02TIMSYS(getTimeStamp());
	 	msgLNDet.setH02SCRCOD("01");
	 	msgLNDet.setH02OPECOD("0005");
	 	
		msgLNDet.setH02FLGWK1(Util.getReqParameter("H01FLGWK1", req));
		msgLNDet.setH02FLGWK3(Util.getReqParameter("H01FLGWK3", req));
		msgLNDet.setE02DEAACC(Util.getReqParameter("E01DEAACC", req));
		msgLNDet.setE02PAGFLG(Util.getReqParameter("E01PAGFLG", req));
		
		try{
			msgLNDet.setE02PAGOAC(userPO.getHeader15());
		}catch(Exception e){
		}		

	 	//Particulary Fields
	 	if(msgLNDet.getE02PAGFLG().equals("PC") && req.getParameter("E01PAGFLG1") != null){
		  msgLNDet.setE02PAGFLG(Util.addLeftChar('0', 2, req.getParameter("E01PAGFLG1")));
	 	} else if ( msgLNDet.getE02PAGFLG().equals("PM")) {
	 		try {
				msgLNDet.setE02PAGQAM( req.getParameter("E01PAGQAM") );
			} catch (Exception e) {
			}
	 	} else if ( msgLNDet.getE02PAGFLG().equals("DS")) {
	 		try {
		 		msgLNDet.setE02PAGTOT(req.getParameter("E01PAGTOT"));
			} catch (Exception e) {
			}
	 	} else if ( msgLNDet.getE02PAGFLG().equals("TP")) {
	 		try {
	 			msgLNDet.setE02PAGABO(req.getParameter("E01PAGDIS"));
			} catch (Exception e) {
			}
			
			if (req.getParameter("E01DEASEL") != null){
			    userPO.setHeader23(req.getParameter("E01DEASEL"));
				msgLNDet.setH02FLGWK2(req.getParameter("E01DEASEL"));
			} else {
			    userPO.setHeader23("");
				msgLNDet.setH02FLGWK2("");
				
			}
				
	 	}	
	 	
		// all the fields here
	 	java.util.Enumeration enu = msgLNDet.fieldEnumeration();
		MessageField field = null;
		String value = null;
		while (enu.hasMoreElements()) {
			field = (MessageField)enu.nextElement();
			try {
				value = req.getParameter(field.getTag()).toUpperCase();
				if (value != null) {
					field.setString(value);
				}
			}
			catch (Exception e) {
			}	
		}

		msgLNDet.setE02PAGVDM(Util.getReqParameter("E01PAGVDM", req,"00"));
		msgLNDet.setE02PAGVDD(Util.getReqParameter("E01PAGVDD", req,"00"));
		msgLNDet.setE02PAGVDY(Util.getReqParameter("E01PAGVDY", req,"0000"));
		msgLNDet.setE02FPGFLG(Util.getReqParameter("E01FPGFLG", req));

	 	msgLNDet.send();	
	 	msgLNDet.destroy();

	 	flexLog("EDL095002 Message Sent");
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
		//showERROR(msgError);
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

		if (newmessage.getFormatName().equals("EDL095001")) { //there are errors
			try {
				msgLN = new datapro.eibs.beans.EDL095001Message();
				flexLog("EDL095001 Message Received");
		  	} catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			msgLN = (EDL095001Message)newmessage;
			// showESD008004(msgLN);

			userPO.setIdentifier(msgLN.getE01DEAACC());

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("lnCancel", msgLN);
			ses.setAttribute("userPO", userPO);

			if(("").equals(userPO.getHeader15())){
			  try {
				  flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment.jsp");
				  callPage(LangPath + "EDL0950_ln_payment.jsp", req, res);	
			  }
			  catch (Exception e) {
				  flexLog("Exception calling page " + e);
			  }
		  }
			  else{
			  try {
				  flexLog("About to call Page: " + LangPath + "EDL0950T_ln_payment.jsp");
				  callPage(LangPath + "EDL0950T_ln_payment.jsp", req, res);	
							  }
				  catch (Exception e) {
				  flexLog("Exception calling page " + e);
				  }
		  }
		}
		else if (newmessage.getFormatName().equals("EDL095002")) { //there are errors
			try {
				msgLNDet = new datapro.eibs.beans.EDL095002Message();
				flexLog("EDL095002 Message Received");
		  	} catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			msgLNDet = (EDL095002Message)newmessage;
			// showESD008004(msgLN);

			userPO.setIdentifier(msgLNDet.getE02DEAACC());

			setDescription(userPO,msgLNDet);
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("lnCancelDet", msgLNDet);
			ses.setAttribute("userPO", userPO);

			if (IsNotError) {  // There are no errors
				try {
					flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment_det.jsp");
					callPage(LangPath + "EDL0950_ln_payment_det.jsp", req, res);	
				}
					catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else {
				flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment_det.jsp");
				callPage(LangPath + "EDL0950_ln_payment.jsp", req, res);	
			}
		}


	}
	catch (Exception e)	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}	


}

protected void procActionCancelationRot(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

MessageRecord newmessage = null;
EDL095001Message msgLN = null;
EDL095002Message msgLNDet = null;
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
userPO.setHeader20(Util.getReqParameter("E01PAGFLG", req)); //Flag for Type of Payment
userPO.setHeader23("");

// Send Initial data
try
{
	flexLog("Send Initial Data");
	msgLNDet = (EDL095002Message)mc.getMessageRecord("EDL095002");
	msgLNDet.setH02USERID(user.getH01USR());
 	msgLNDet.setH02PROGRM("EDL0950");
 	msgLNDet.setH02TIMSYS(getTimeStamp());
 	msgLNDet.setH02SCRCOD("01");
 	msgLNDet.setH02OPECOD("0023");
 	
	msgLNDet.setH02FLGWK1(Util.getReqParameter("H01FLGWK1", req));
	msgLNDet.setH02FLGWK3(Util.getReqParameter("H01FLGWK3", req));
	msgLNDet.setE02DEAACC(Util.getReqParameter("E01DEAACC", req));
	msgLNDet.setE02PAGFLG(Util.getReqParameter("E01PAGFLG", req));
	
	try{
		msgLNDet.setE02PAGOAC(userPO.getHeader15());
	}catch(Exception e){
	}		

 	//Particulary Fields
 	if(msgLNDet.getE02PAGFLG().equals("PC") && req.getParameter("E01PAGFLG1") != null){
	  msgLNDet.setE02PAGFLG(Util.addLeftChar('0', 2, req.getParameter("E01PAGFLG1")));
 	} else if ( msgLNDet.getE02PAGFLG().equals("PM")) {
 		try {
			msgLNDet.setE02PAGQAM( req.getParameter("E01PAGQAM") );
		} catch (Exception e) {
		}
 	} else if ( msgLNDet.getE02PAGFLG().equals("DS")) {
 		try {
	 		msgLNDet.setE02PAGTOT(req.getParameter("E01PAGTOT"));
		} catch (Exception e) {
		}
 	} else if ( msgLNDet.getE02PAGFLG().equals("TP")) {
 		try {
 			msgLNDet.setE02PAGABO(req.getParameter("E01PAGDIS"));
		} catch (Exception e) {
		}
		
		if (req.getParameter("E01DEASEL") != null){
		    userPO.setHeader23(req.getParameter("E01DEASEL"));
			msgLNDet.setH02FLGWK2(req.getParameter("E01DEASEL"));
		} else {
		    userPO.setHeader23("");
			msgLNDet.setH02FLGWK2("");
			
		}
			
 	}	
 	
	// all the fields here
 	java.util.Enumeration enu = msgLNDet.fieldEnumeration();
	MessageField field = null;
	String value = null;
	while (enu.hasMoreElements()) {
		field = (MessageField)enu.nextElement();
		try {
			value = req.getParameter(field.getTag()).toUpperCase();
			if (value != null) {
				field.setString(value);
			}
		}
		catch (Exception e) {
		}	
	}

	msgLNDet.setE02PAGVDM(Util.getReqParameter("E01PAGVDM", req,"00"));
	msgLNDet.setE02PAGVDD(Util.getReqParameter("E01PAGVDD", req,"00"));
	msgLNDet.setE02PAGVDY(Util.getReqParameter("E01PAGVDY", req,"0000"));
	msgLNDet.setE02FPGFLG(Util.getReqParameter("E01FPGFLG", req));

 	msgLNDet.send();	
 	msgLNDet.destroy();

 	flexLog("EDL095002 Message Sent");
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
	//showERROR(msgError);
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

	if (newmessage.getFormatName().equals("EDL095001")) { //there are errors
		try {
			msgLN = new datapro.eibs.beans.EDL095001Message();
			flexLog("EDL095001 Message Received");
	  	} catch (Exception ex) {
			flexLog("Error: " + ex); 
	  	}

		msgLN = (EDL095001Message)newmessage;
		// showESD008004(msgLN);

		userPO.setIdentifier(msgLN.getE01DEAACC());

		flexLog("Putting java beans into the session");
		ses.setAttribute("error", msgError);
		ses.setAttribute("lnCancel", msgLN);
		ses.setAttribute("userPO", userPO);

		if(("").equals(userPO.getHeader15())){
		  try {
			  flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment_rot.jsp");
			  callPage(LangPath + "EDL0950_ln_payment_rot.jsp", req, res);	
		  }
		  catch (Exception e) {
			  flexLog("Exception calling page " + e);
		  }
	  }
		  else{
		  try {
			  flexLog("About to call Page: " + LangPath + "EDL0950T_ln_payment.jsp");
			  callPage(LangPath + "EDL0950T_ln_payment.jsp", req, res);	
						  }
			  catch (Exception e) {
			  flexLog("Exception calling page " + e);
			  }
	  }
	}
	else if (newmessage.getFormatName().equals("EDL095002")) { //there are errors
		try {
			msgLNDet = new datapro.eibs.beans.EDL095002Message();
			flexLog("EDL095002 Message Received");
	  	} catch (Exception ex) {
			flexLog("Error: " + ex); 
	  	}

		msgLNDet = (EDL095002Message)newmessage;
		// showESD008004(msgLN);

		userPO.setIdentifier(msgLNDet.getE02DEAACC());

		setDescription(userPO,msgLNDet);
		
		flexLog("Putting java beans into the session");
		ses.setAttribute("error", msgError);
		ses.setAttribute("lnCancelDet", msgLNDet);
		ses.setAttribute("userPO", userPO);

		if (IsNotError) {  // There are no errors
			try {
				flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment_det_rot.jsp");
				callPage(LangPath + "EDL0950_ln_payment_det_rot.jsp", req, res);	
			}
				catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
		} else {
			flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment_det_rot.jsp");
			callPage(LangPath + "EDL0950_ln_payment.jsp", req, res);	
		}
	}


}
catch (Exception e)	{
	e.printStackTrace();
	flexLog("Error: " + e);
  	throw new RuntimeException("Socket Communication Error");
}	


}


private void setDescription(UserPos userPO, EDL095002Message msgLNDet) {
	String description = "";
	if (msgLNDet.getE02DEANR1().trim().isEmpty()) {
	 	if (userPO.getHeader20().equals("MA")) {
	 		description = "Distribución Manual";
	 	}
	 	if (userPO.getHeader20().equals("TO")) {
	 		description = "Pago Total";
	 	}
	 	if (userPO.getHeader20().equals("TP")) {
	 		description = "Pago Parcial con Abono Capital";
		 	if (userPO.getHeader23().equals("1")) {
		 		description += " - Cuota";
		 	}
		 	if (userPO.getHeader23().equals("2")) {
		 		description += " - Plazo";
		 	}
	 	}
	 	if (userPO.getHeader20().equals("CV") || userPO.getHeader20().equals("PC") || userPO.getHeader20().equals("DS")) {
	 		description = "Pago por Cuotas";
	 	}
	}
	description += " " + msgLNDet.getE02DEANR1().trim(); 	  
	msgLNDet.setE02DEANR1(description);
}

/**
 * This method was created in VisualAge.
 */
protected void procActionCancelationDet(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL095002Message msgLN = null;
	ELEERRMessage msgError = null;
	UserPos	userPO = null;	
	boolean IsNotError = false;
	String pagflg = " ";

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
		flexLog("Send Initial Data");
	 	msgLN = (EDL095002Message)ses.getAttribute("lnCancelDet");
		//msgLN = (EDL095002Message)mc.getMessageRecord("EDL095002");
		msgLN.setH02USERID(user.getH01USR());
	 	msgLN.setH02PROGRM("EDL0950");
	 	msgLN.setH02TIMSYS(getTimeStamp());
	 	msgLN.setH02SCRCOD("01");
	 	msgLN.setH02OPECOD("0005");
		msgLN.setH02FLGWK2(userPO.getHeader23());
		// all the fields here
	 	java.util.Enumeration enu = msgLN.fieldEnumeration();
		MessageField field = null;
		String value = null;
		while (enu.hasMoreElements()) {
			field = (MessageField)enu.nextElement();
			try {
				value = req.getParameter(field.getTag()).toUpperCase();
				if (value != null) {
					field.setString(value);
				}
			}
			catch (Exception e) {
			}	
		}
		pagflg = msgLN.getE02PAGFLG(); 
		msgLN.setE02PAGFLG("CW");
		if (userPO.getOption().equals("CU")){;
		msgLN.setE02PENFLG("C");
		}
	 	mc.sendMessage(msgLN);	
	 	msgLN.destroy();
	 	
	 	flexLog("EDL095002 Message Sent");
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
		//showERROR(msgError);
		
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

		if (newmessage.getFormatName().equals("EDL095002")) { 
			try {
				msgLN = new datapro.eibs.beans.EDL095002Message();
				flexLog("EDL095002 Message Received");
		  	} catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			msgLN = (EDL095002Message)newmessage;
			// showESD008004(msgLN);

			userPO.setIdentifier(msgLN.getE02DEAACC());
			if (!IsNotError) {  
				msgLN.setE02PAGFLG(pagflg);
			}
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("lnCancelDet", msgLN);
			ses.setAttribute("userPO", userPO);

			if (IsNotError) {  // There are no errors
			try {
					flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment_print.jsp");
					callPage(LangPath + "EDL0950_ln_payment_print.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else {  // There are errors
		try {
				flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment_det.jsp");
				callPage(LangPath + "EDL0950_ln_payment_det.jsp", req, res);	
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
protected void procActionCancelationDetRot(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL095002Message msgLN = null;
	ELEERRMessage msgError = null;
	UserPos	userPO = null;	
	boolean IsNotError = false;
	String pagflg = " ";

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
		flexLog("Send Initial Data");
	 	msgLN = (EDL095002Message)ses.getAttribute("lnCancelDet");
		//msgLN = (EDL095002Message)mc.getMessageRecord("EDL095002");
		msgLN.setH02USERID(user.getH01USR());
	 	msgLN.setH02PROGRM("EDL0950");
	 	msgLN.setH02TIMSYS(getTimeStamp());
	 	msgLN.setH02SCRCOD("01");
	 	msgLN.setH02OPECOD("0024");
		msgLN.setH02FLGWK2(userPO.getHeader23());
		// all the fields here
	 	java.util.Enumeration enu = msgLN.fieldEnumeration();
		MessageField field = null;
		String value = null;
		while (enu.hasMoreElements()) {
			field = (MessageField)enu.nextElement();
			try {
				value = req.getParameter(field.getTag()).toUpperCase();
				if (value != null) {
					field.setString(value);
				}
			}
			catch (Exception e) {
			}	
		}
		pagflg = msgLN.getE02PAGFLG(); 
	//	msgLN.setE02PAGFLG("CW");
	 	mc.sendMessage(msgLN);	
	 	msgLN.destroy();

	 	flexLog("EDL095002 Message Sent");
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
		//showERROR(msgError);
		
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

		if (newmessage.getFormatName().equals("EDL095002")) { 
			try {
				msgLN = new datapro.eibs.beans.EDL095002Message();
				flexLog("EDL095002 Message Received");
		  	} catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			msgLN = (EDL095002Message)newmessage;
			// showESD008004(msgLN);

			userPO.setIdentifier(msgLN.getE02DEAACC());
			if (!IsNotError) {  
				msgLN.setE02PAGFLG(pagflg);
			}
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("lnCancelDet", msgLN);
			ses.setAttribute("userPO", userPO);

			if (IsNotError) {  // There are no errors
			try {
					flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment_print.jsp");
					callPage(LangPath + "EDL0950_ln_payment_print.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else {  // There are errors
		try {
				flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment_det_rot.jsp");
				callPage(LangPath + "EDL0950_ln_payment_det_rot.jsp", req, res);	
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
protected void procActionEnterCancel(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL095001Message msgLN = null;
	EDL095002Message msgLNDet = null;
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
		flexLog("Sending header");
	 	//msgLN = (EDL095001Message)ses.getAttribute("cdCancel");
	 	msgLN = (EDL095001Message)mc.getMessageRecord("EDL095001");
	 	msgLN.setH01USERID(user.getH01USR());
	 	msgLN.setH01PROGRM("EDL0150");
	 	msgLN.setH01TIMSYS(getTimeStamp());
	 	msgLN.setH01SCRCOD("01");
	 	msgLN.setH01OPECOD("0002");
	 	msgLN.setH01FLGWK2(Util.getReqParameter("H01FLGWK2", req));
	 	
		flexLog("Header has been sended");
		
		
		try {
		 	if (req.getParameter("E01DEAACC") != null)
		 	  msgLN.setE01DEAACC(req.getParameter("E01DEAACC"));
		 	  flexLog("Product Sent");
		}
		catch (Exception e)	{
	 	  msgLN.setE01DEAACC("0");
		  flexLog(" error " + e);
		  flexLog(" Error Sent");
		}
		
	
		try {
		 	if (req.getParameter("E01PAGVDD") != null)
		 	  msgLN.setE01PAGVDD(req.getParameter("E01PAGVDD"));
		}
		catch (Exception e)	{
	 	  msgLN.setE01PAGVDD("0");
		}
	
		try {
		 	if (req.getParameter("E01PAGVDM") != null)
		 	  msgLN.setE01PAGVDM(req.getParameter("E01PAGVDM"));
		}
		catch (Exception e)	{
	 	  msgLN.setE01PAGVDM("0");
		}
		
		try {
		 	if (req.getParameter("E01PAGVDY") != null)
		 	  msgLN.setE01PAGVDY(req.getParameter("E01PAGVDY"));
		}
		catch (Exception e)	{
	 	  msgLN.setE01PAGVDY("0");
		}

		
		
		try{
		  userPO.setHeader15(Util.getReqParameter("REFNUM", req));
		}
		catch (Exception e)	{
		}
		try{
		  msgLN.setE01PAGDIS(req.getParameter("AMOUNT"));	
		  userPO.setHeader16(req.getParameter("AMOUNT"));
		}
		catch (Exception e)	{
		}
		
		
		if (userPO.getOption().equals("PP_FV"))
		{
			msgLN.setH01FLGWK1("V");
		} else {
			msgLN.setH01FLGWK1(" ");
		}
		
		
		msgLN.send();	
	 	msgLN.destroy();

	 	flexLog("EDL095001 Message Sent");
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
		//showERROR(msgError);
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

		if (newmessage.getFormatName().equals("EDL095001")) {
			try {
				msgLN = new datapro.eibs.beans.EDL095001Message();
				flexLog("EDL095001 Message Received");
		  	} catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			msgLN = (EDL095001Message)newmessage;


			userPO.setIdentifier(msgLN.getE01DEAACC());
//			userPO.setHeader23(msgLN.getH01FLGWK3());

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("lnCancel", msgLN);
			ses.setAttribute("lnCancelDet", msgLNDet);

			if (IsNotError) {  // There are no errors
			  if(userPO.getHeader16().equals("")){
				try {
					flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment.jsp");
					callPage(LangPath + "EDL0950_ln_payment.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
				else{
				try {
					flexLog("About to call Page: " + LangPath + "EDL0950T_ln_payment.jsp");
					callPage(LangPath + "EDL0950T_ln_payment.jsp", req, res);	
								}
					catch (Exception e) {
					flexLog("Exception calling page " + e);
					}
			}
			}
			
			else {  // There are errors
				try {
					flexLog("About to call Page: " + LangPath + "EDL0950_ln_enter_payment.jsp");
					callPage(LangPath + "EDL0950_ln_enter_payment.jsp", req, res);	
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
protected void procActionEnterCancelRot(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL095001Message msgLN = null;
	EDL095002Message msgLNDet = null;
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
		flexLog("Sending header");
	 	//msgLN = (EDL095001Message)ses.getAttribute("cdCancel");
	 	msgLN = (EDL095001Message)mc.getMessageRecord("EDL095001");
	 	msgLN.setH01USERID(user.getH01USR());
	 	msgLN.setH01PROGRM("EDL0150");
	 	msgLN.setH01TIMSYS(getTimeStamp());
	 	msgLN.setH01SCRCOD("01");
	 	msgLN.setH01OPECOD("0002");
	 	msgLN.setH01FLGWK1(Util.getReqParameter("H01FLGWK1", req));
	 	msgLN.setH01FLGWK2(Util.getReqParameter("H01FLGWK2", req));
	 	if (msgLN.getH01FLGWK1().equals("1")) {
	 	msgLN.setH01OPECOD("0022");
	 	}
	 	
		flexLog("Header has been sended");
		
		
		try {
		 	if (req.getParameter("E01DEAACC") != null)
		 	  msgLN.setE01DEAACC(req.getParameter("E01DEAACC"));
		 	  flexLog("Product Sent");
		}
		catch (Exception e)	{
	 	  msgLN.setE01DEAACC("0");
		  flexLog(" error " + e);
		  flexLog(" Error Sent");
		}
		
	
		try {
		 	if (req.getParameter("E01PAGVDD") != null)
		 	  msgLN.setE01PAGVDD(req.getParameter("E01PAGVDD"));
		}
		catch (Exception e)	{
	 	  msgLN.setE01PAGVDD("0");
		}
	
		try {
		 	if (req.getParameter("E01PAGVDM") != null)
		 	  msgLN.setE01PAGVDM(req.getParameter("E01PAGVDM"));
		}
		catch (Exception e)	{
	 	  msgLN.setE01PAGVDM("0");
		}
		
		try {
		 	if (req.getParameter("E01PAGVDY") != null)
		 	  msgLN.setE01PAGVDY(req.getParameter("E01PAGVDY"));
		}
		catch (Exception e)	{
	 	  msgLN.setE01PAGVDY("0");
		}

		
		
		try{
		  userPO.setHeader15(Util.getReqParameter("REFNUM", req));
		}
		catch (Exception e)	{
		}
		try{
		  msgLN.setE01PAGDIS(req.getParameter("AMOUNT"));	
		  userPO.setHeader16(req.getParameter("AMOUNT"));
		}
		catch (Exception e)	{
		}
		
		
		if (userPO.getOption().equals("PP_FV"))
		{
			msgLN.setH01FLGWK1("V");
		} else {
			msgLN.setH01FLGWK1(" ");
		}
		
		
		msgLN.send();	
	 	msgLN.destroy();

	 	flexLog("EDL095001 Message Sent");
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
		//showERROR(msgError);
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

		if (newmessage.getFormatName().equals("EDL095001")) {
			try {
				msgLN = new datapro.eibs.beans.EDL095001Message();
				flexLog("EDL095001 Message Received");
		  	} catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			msgLN = (EDL095001Message)newmessage;


			userPO.setIdentifier(msgLN.getE01DEAACC());
//			userPO.setHeader23(msgLN.getH01FLGWK3());

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("lnCancel", msgLN);
			ses.setAttribute("lnCancelDet", msgLNDet);

			if (IsNotError) {  // There are no errors
			 
				try {
					flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment_rot.jsp");
					callPage(LangPath + "EDL0950_ln_payment_rot.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			
			}
			
			else {  // There are errors
				try {
					flexLog("About to call Page: " + LangPath + "EDL0950_ln_enter_payment_rot.jsp");
					callPage(LangPath + "EDL0950_ln_enter_payment_rot.jsp", req, res);	
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
protected void procReqCancelation(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL095001Message msgLN = null;
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

	String opCode = "0002";

	// Send Initial data
	try
	{
		msgLN = (EDL095001Message)mc.getMessageRecord("EDL095001");
	 	msgLN.setH01USERID(user.getH01USR());
	 	msgLN.setH01PROGRM("EDL0130");
	 	msgLN.setH01TIMSYS(getTimeStamp());
	 	msgLN.setH01SCRCOD("01");
	 	msgLN.setH01OPECOD(opCode);
	 	msgLN.setE01DEAACC(userPO.getIdentifier());
		msgLN.send();	
	 	msgLN.destroy();
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
		//showERROR(msgError);
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

		if (newmessage.getFormatName().equals("EDL095001")) {
			try {
				msgLN = new datapro.eibs.beans.EDL095001Message();
		  	} catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			msgLN = (EDL095001Message)newmessage;
			// showESD008004(msgLN);

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("lnCancel", msgLN);
 
			if (IsNotError) {  // There are no errors
				try {
					flexLog("About to call Page: " + LangPath + "EDL0950_ln_payment.jsp");
					callPage(LangPath + "EDL0950_ln_payment.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else {  // There are errors
				try {
					flexLog("About to call Page: " + LangPath + "EDL0950_ln_enter_payment.jsp");
					callPage(LangPath + "EDL0950_ln_enter_payment.jsp", req, res);	
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
protected void procReqEnterCancel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen)
			throws ServletException, IOException {

	ELEERRMessage msgError = null;
	UserPos	userPO = null;	

	try {

		msgError = new datapro.eibs.beans.ELEERRMessage();
		userPO = new datapro.eibs.beans.UserPos();
		if (screen == R_ENTER_PREPAID) {
			userPO.setOption("PP");
		}else if (screen == R_ENTER_PREPAID_FV){
			userPO.setOption("PP_FV");}
		else {
			userPO.setOption("LN");
		}
		userPO.setPurpose("MAINTENANCE");
		ses.setAttribute("error", msgError);
		ses.setAttribute("userPO", userPO);
		
  	} catch (Exception ex) {
		flexLog("Error: " + ex); 
  	}

	try {
		flexLog("About to call Page: " + LangPath + "EDL0950_ln_enter_payment.jsp");
		callPage(LangPath + "EDL0950_ln_enter_payment.jsp", req, res);	
	}
	catch (Exception e) {
		flexLog("Exception calling page " + e);
	}

}

protected void procReqEnterCancelRot(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen)
		throws ServletException, IOException {

ELEERRMessage msgError = null;
UserPos	userPO = null;	

try {

	msgError = new datapro.eibs.beans.ELEERRMessage();
	userPO = new datapro.eibs.beans.UserPos();
	
	userPO.setOption("CU");
	
	userPO.setPurpose("MAINTENANCE");
	ses.setAttribute("error", msgError);
	ses.setAttribute("userPO", userPO);
	
	} catch (Exception ex) {
	flexLog("Error: " + ex); 
	}

try {
	flexLog("About to call Page: " + LangPath + "EDL0950_ln_enter_payment_rot.jsp");
	callPage(LangPath + "EDL0950_ln_enter_payment_rot.jsp", req, res);	
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

		int screen = R_ENTER_CANCEL;
		
		try {

			msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getAttribute("currUser");

			// Here we should get the path from the user profile
			LangPath = super.rootPath + msgUser.getE01LAN() + "/";

			try
			{
				flexLog("Opennig Socket Connection ");
				mc = new MessageContext(super.getMessageHandler("EDL0950", req));
			

			try {
				screen = Integer.parseInt(req.getParameter("SCREEN"));
			}
			catch (Exception e) {
				flexLog("Screen set to default value");
			}
		
			switch (screen) {
				// BEGIN CD
				// Request
				case R_PRECANCEL :
					procReqCancelation(mc, msgUser, req, res, session);
					break;
				case R_PAYMENT_INQ :
					procReqPaymentInq(mc, msgUser, req, res, session);
					break;	
				case R_ENTER_RELEASE :
					procReqEnterRelease(msgUser, req, res, session);
						
				// Action
				case A_PRECANCEL :
					procActionCancelation(mc, msgUser, req, res, session);
					break;
				case A_PRECANCEL_ROT :
					procActionCancelationRot(mc, msgUser, req, res, session);
					break;
				case A_CANCEL_DET :
					procActionCancelationDet(mc, msgUser, req, res, session);
					break;
				case A_CANCEL_DET_ROT :
					procActionCancelationDetRot(mc, msgUser, req, res, session);
					break;
				case A_ENTER_RELEASE :
					procActionEnterRelease(mc, msgUser, req, res, session);
					break;
				case A_RELEASE :
					procActionRelease(mc, msgUser, req, res, session);
					break;
					
				// END CD

				// BEGIN Entering
				case R_PAYMENT_CON :
					procReqPrePayment(mc, msgUser, req, res, session);
					break;

				
				// Request
				case R_ENTER_CANCEL : 
				case R_ENTER_PREPAID :
				case R_ENTER_PREPAID_FV :
							
					procReqEnterCancel(msgUser, req, res, session, screen);
					break;
					
					// Request
				case R_ENTER_CANCEL_ROT : 
											
					procReqEnterCancelRot(msgUser, req, res, session, screen);
					break;
				// Action 
				case A_ENTER_CANCEL : 
					
					procActionEnterCancel(mc, msgUser, req, res, session);
					break;
					
				case A_ENTER_CANCEL_ROT :
					procActionEnterCancelRot(mc, msgUser, req, res, session);
					break;	
					
				// END Entering

				default :
					res.sendRedirect(super.srctx + LangPath + super.devPage);
					break;
			}

			} catch (Exception e) {
					e.printStackTrace();
					int sck = getInitSocket(req) + 1;
					flexLog("Socket not Open(Port " + sck + "). Error: " + e);
					res.sendRedirect(super.srctx + LangPath + super.sckNotOpenPage);
					//return;
			} finally {
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
/**
 * This method was created in VisualAge.
 */
protected void procReqPaymentInq(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
	MessageRecord newmessage = null;
	EDL095002Message msgLN = null;
	ELEERRMessage msgError = null;
	UserPos userPO = null;
	boolean IsNotError = false;
	try {
		msgError = new datapro.eibs.beans.ELEERRMessage();
	} catch (Exception ex) {
		flexLog("Error: " + ex);
	}
	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	String opCode = "0004";

	// Send Initial data
	try {
		msgLN = (EDL095002Message) mc.getMessageRecord("EDL095002");
		msgLN.setH02USERID(user.getH01USR());
		msgLN.setH02PROGRM("EDL0950");
		msgLN.setH02TIMSYS(getTimeStamp());
		msgLN.setH02SCRCOD("01");
		msgLN.setH02OPECOD(opCode);
		msgLN.setE02DEAACC(req.getParameter("E01DEAACC"));
		msgLN.setH02FLGWK1("A");
		msgLN.setE02PAGFLG("IQ");
		msgLN.send();
		msgLN.destroy();
	} 
	catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}

	// Receive Error Message
	try {
		newmessage = mc.receiveMessage();
		if (newmessage.getFormatName().equals("ELEERR")) {
			msgError = (ELEERRMessage) newmessage;
			IsNotError = msgError.getERRNUM().equals("0");
			flexLog("IsNotError = " + IsNotError);
			//showERROR(msgError);
		} else
			flexLog("Message " + newmessage.getFormatName() + " received.");
	} 
	catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}

	// Receive Data
	try {
		newmessage = mc.receiveMessage();
		if (newmessage.getFormatName().equals("EDL095002")) {
			try {
				msgLN = new datapro.eibs.beans.EDL095002Message();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}
			msgLN = (EDL095002Message) newmessage;
			// showESD008004(msgLN);

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("lnCancelDet", msgLN);
			ses.setAttribute("userPO", userPO);
			
			if (IsNotError) {
			try {
					flexLog("About to call Page: " + LangPath + "EDL0140_ln_ap_payment_det.jsp");
					callPage(LangPath + "EDL0140_ln_ap_payment_det.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
	       }
		    else { // There are errors
				try {
					flexLog("About to call Page: " + LangPath + "EDL0140_ln_ap_payment_det.jsp");
					callPage(LangPath + "EDL0140_ln_ap_payment_det.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
		}
		else
			flexLog("Message " + newmessage.getFormatName() + " received.");
	} 
	catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}
}

protected void procReqEnterRelease(
	ESS0030DSMessage user,
	HttpServletRequest req,
	HttpServletResponse res,
	HttpSession ses)
	throws ServletException, IOException {

	ELEERRMessage msgError = null;
	UserPos userPO = null;

	try {

		msgError = new datapro.eibs.beans.ELEERRMessage();
		userPO = new datapro.eibs.beans.UserPos();
		ses.setAttribute("error", msgError);
		ses.setAttribute("userPO", userPO);

	} catch (Exception ex) {
		flexLog("Error: " + ex);
	}

	try {
		flexLog("About to call Page: " + LangPath + "EDL0950_enter_account.jsp");
		callPage(LangPath + "EDL0950_enter_account.jsp", req, res);
	} catch (Exception e) {
		flexLog("Exception calling page " + e);
	}

}

protected void procActionEnterRelease(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL095004Message msgLN = null;
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
		flexLog("Sending header");
		//msgLN = (EDL095001Message)ses.getAttribute("cdCancel");
		msgLN = (EDL095004Message)mc.getMessageRecord("EDL095004");
		msgLN.setH04USERID(user.getH01USR());
		msgLN.setH04PROGRM("EDL0150");
		msgLN.setH04TIMSYS(getTimeStamp());
		msgLN.setH04SCRCOD("01");
		msgLN.setH04OPECOD("0002");
		flexLog("Header has been sended");
		
		try {
			  msgLN.setE04DEAACC(req.getParameter("E04DEAACC"));
		}
		catch (Exception e)	{
		  msgLN.setE04DEAACC("0");
		}
		
		msgLN.send();	
		msgLN.destroy();

		flexLog("EDL095004 Message Sent");
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
		//showERROR(msgError);
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

		if (newmessage.getFormatName().equals("EDL095004")) {
			try {
				msgLN = new datapro.eibs.beans.EDL095004Message();
				flexLog("EDL095004 Message Received");
			} catch (Exception ex) {
				flexLog("Error: " + ex); 
			}

			msgLN = (EDL095004Message)newmessage;

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("lnRelease", msgLN);

			if (IsNotError) {  // There are no errors
				try {
					flexLog("About to call Page: " + LangPath + "EDL0950_release_payment.jsp");
					callPage(LangPath + "EDL0950_release_payment.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else {  // There are errors
				try {
					flexLog("About to call Page: " + LangPath + "EDL0950_enter_account.jsp");
					callPage(LangPath + "EDL0950_enter_account.jsp", req, res);	
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

protected void procActionRelease(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL095004Message msgLN = null;
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
		flexLog("Send Initial Data");
		msgLN = (EDL095004Message)mc.getMessageRecord("EDL095004");
		msgLN.setH04USERID(user.getH01USR());
		msgLN.setH04PROGRM("EDL0950");
		msgLN.setH04TIMSYS(getTimeStamp());
		msgLN.setH04SCRCOD("01");
		msgLN.setH04OPECOD("0005");
   	
		// all the fields here
		java.util.Enumeration enu = msgLN.fieldEnumeration();
		MessageField field = null;
		String value = null;
		while (enu.hasMoreElements()) {
			field = (MessageField)enu.nextElement();
			try {
				value = req.getParameter(field.getTag()).toUpperCase();
				if (value != null) {
					field.setString(value);
				}
			}
			catch (Exception e) {
			}	
		}

		msgLN.send();	
		msgLN.destroy();

		flexLog("EDL095004 Message Sent");
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
		//showERROR(msgError);
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

		if (newmessage.getFormatName().equals("EDL095004")) { //there are errors
			try {
				msgLN = new datapro.eibs.beans.EDL095004Message();
				flexLog("EDL095004 Message Received");
			} catch (Exception ex) {
				flexLog("Error: " + ex); 
			}

			msgLN = (EDL095004Message)newmessage;
			// showESD008004(msgLN);

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("lnRelease", msgLN);
			ses.setAttribute("userPO", userPO);

			if(IsNotError){
			  try {
				  flexLog("About to call Page: " + LangPath + "EDL0950_enter_account.jsp");
				  callPage(LangPath + "EDL0950_enter_account.jsp", req, res);	
			  }
			  catch (Exception e) {
				  flexLog("Exception calling page " + e);
			  }
		  	} else{
			  try {
				  flexLog("About to call Page: " + LangPath + "EDL0950_release_payment.jsp");
				  callPage(LangPath + "EDL0950_release_payment.jsp", req, res);	
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



//new
protected void procReqPrePayment(
	MessageContext mc,
	ESS0030DSMessage user,
	HttpServletRequest req,
	HttpServletResponse res,
	HttpSession ses)
	throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL095003Message msgLN = null; 
	EDL095002Message msgLNDet = null;
	ELEERRMessage msgError = null;
	UserPos userPO = null;
	boolean IsNotError = false;

	try {
		msgError = new ELEERRMessage();
	} catch (Exception ex) {
		flexLog("Error: " + ex);
	}

	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	msgLNDet = (EDL095002Message) ses.getAttribute("lnCancelDet");
	// Send Initial data
 
	try {
		msgLN = (EDL095003Message) mc.getMessageRecord("EDL095003");
		msgLN.setH03USERID(user.getH01USR());
		msgLN.setH03PROGRM("EDL0950");
		msgLN.setH03TIMSYS(getTimeStamp());
		msgLN.setH03SCRCOD("01");
		msgLN.setH03OPECOD("0002");
		msgLN.setE03DEAACC(userPO.getIdentifier());
		msgLN.setE03SALPRI(msgLNDet.getE02AFTPRI());
		msgLN.setE03FLGTYP(userPO.getHeader23());
		
		if (userPO.getOption().equals("PP_FV"))
		{
			msgLN.setH03FLGWK1("V");
		} else {
			msgLN.setH03FLGWK1(" ");
		}

		msgLN.setE03PAGVDM(msgLNDet.getE02PAGVDM());
		msgLN.setE03PAGVDD(msgLNDet.getE02PAGVDD());
		msgLN.setE03PAGVDY(msgLNDet.getE02PAGVDY());
			
		
		msgLN.send();
		msgLN.destroy();

		// Receive Error Message
		newmessage = mc.receiveMessage();
		if (newmessage.getFormatName().equals("ELEERR")) {
			msgError = (ELEERRMessage) newmessage;
			IsNotError = msgError.getERRNUM().equals("0");
			flexLog("IsNotError = " + IsNotError);
			
		} else
			flexLog("Message " + newmessage.getFormatName() + " received.");

		// Receive Data
		newmessage = mc.receiveMessage();
		if (newmessage.getFormatName().equals("EDL095003")) {
			//there are errors
			msgLN = (EDL095003Message) newmessage;
			userPO.setIdentifier(msgLN.getE03DEAACC());

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("lnCancel", msgLN);
			ses.setAttribute("userPO", userPO);

			try {
				flexLog( 
					"About to call Page: "
						+ LangPath
						+ "EDL0950_ln_payment_con.jsp");
				callPage(
					LangPath + "EDL0950_ln_payment_con.jsp",
					req,
					res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
		} else {
			try {
				flexLog(
					"About to call Page: "
						+ LangPath
						+ "EDL0950_ln_payment_det.jsp");
				callPage(
					LangPath + "EDL0950_ln_payment_det.jsp",
					req,
					res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
		}

	} catch (Exception e) {
		e.printStackTrace();
		throw new RuntimeException("Socket Communication Error");
	}
}
}


