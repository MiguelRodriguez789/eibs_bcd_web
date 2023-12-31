package datapro.eibs.client;

/**
 * Insert the type's description here.
  
 
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

 
import datapro.eibs.master.Util;
import datapro.eibs.sockets.*;

public class JSERA0005P extends datapro.eibs.master.SuperServlet {
	
	protected static final int R_PASSWORD 			= 1;	//procReqPassword
	protected static final int A_BASIC				= 2;	//procActionBasic  CONFIRMA OPERACION 
	protected static final int A_ENTER_SELECTION 	= 200;	//procActionEnterSelection 
	// entering options
	protected static final int R_ENTER_SELECTION	= 100;	//procReqEnterSelection

	
	protected String LangPath = "S";


  		// R_ENTER_SELECTION	= 100
protected void procReqEnterSelection(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

	ELEERRMessage msgError = null;
	UserPos	userPO = null; 	

	try {
		msgError = new datapro.eibs.beans.ELEERRMessage();
		userPO = new datapro.eibs.beans.UserPos();
		userPO.setOption("GA");
		userPO.setPurpose("NEW");
		ses.setAttribute("error", msgError);
		int appCode = Integer.parseInt(req.getParameter("appCode"));		
		userPO.setHeader23(req.getParameter("appCode"));
		
		//		System.out.println(
		//					"APPCODE 100 ::::" + req.getParameter("appCode"));		  
		//System.out.println(
		//				"HEADER 100 ::::" + userPO.getHeader23());	
		
		ses.setAttribute("userPO", userPO);		 
		
	} catch (Exception ex) {
		flexLog("Error: " + ex);  
	}

	try {
		flexLog("About to call Page: " + LangPath + "ERA0005_ga_selection_pigdes.jsp");
		callPage(LangPath + "ERA0005_ga_selection_pigdes.jsp", req, res);	
	}
	catch (Exception e) {
		flexLog("Exception calling page " + e);
	}

}

 
	//A_ENTER_SELECTION 	= 200 
protected void procActionEnterSelection(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	ERA000501Message msgColl = null;
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
		//msgColl = (ERA000501Message)ses.getAttribute("cdTransac");
		msgColl = (ERA000501Message)mc.getMessageRecord("ERA000501");
		msgColl.setH01USERID(user.getH01USR());
		msgColl.setH01PROGRM("ERA005");
		msgColl.setH01TIMSYS(getTimeStamp());
		msgColl.setH01SCRCOD("01");
		msgColl.setH01OPECOD("0002");		 
		msgColl.setH01FLGWK1(userPO.getHeader23());
		 	  
		//System.out.println(
		//				"HEADER23 200 ::::" + userPO.getHeader23());
		//System.out.println(
		//				"H01FLGWK1 200 ::::" + msgColl.getH01FLGWK1());	
		
		 
		if(!(req.getParameter("ACCOUNT1").trim().equals("")||req.getParameter("ACCOUNT1").trim().equals("0"))){
			try {
				msgColl.setE01RCLAACC(req.getParameter("ACCOUNT1"));
				msgColl.setE01RCLTIPO("1");
			}
			catch (Exception e)	{
				msgColl.setE01RCLAACC("0");
			}
		}
		if(!(req.getParameter("ACCOUNT2").trim().equals("")||req.getParameter("ACCOUNT2").trim().equals("0"))){
			try {
				msgColl.setE01RCLAACC(req.getParameter("ACCOUNT2"));
				msgColl.setE01RCLTIPO("4");
			}
			catch (Exception e)	{
				msgColl.setE01RCLAACC("0");
			}
		}
		if(!(req.getParameter("ACCOUNT3").trim().equals("")||req.getParameter("ACCOUNT3").trim().equals("0"))){
			try {
				msgColl.setE01RCLAACC(req.getParameter("ACCOUNT3"));
				msgColl.setE01RCLTIPO("");
			}
			catch (Exception e)	{
				msgColl.setE01RCLAACC("0");
			}
		}

		if(!(req.getParameter("NONEACC").trim().equals("")||req.getParameter("NONEACC").trim().equals("0"))){
			try {
				msgColl.setE01RCLBACC(req.getParameter("NONEACC"));
			}
			catch (Exception e)	{
				msgColl.setE01RCLBACC("0");
			}
		}
		if(!(req.getParameter("DEPOSITACC").trim().equals("")||req.getParameter("DEPOSITACC").trim().equals("0"))){
			try {
				msgColl.setE01RCLBACC(req.getParameter("DEPOSITACC"));
			}
			catch (Exception e)	{
				msgColl.setE01RCLBACC("0");
			}
		}
		
			try {
				msgColl.setE01RCLACUN(req.getParameter("CUSTOMER"));
			}
			catch (Exception e)	{
			}
		
			try {
				msgColl.setE01RCLBOPE(req.getParameter("AMOUNT"));
			}
			catch (Exception e)	{
				msgColl.setE01RCLBOPE("0");
			}

			try {
				msgColl.setE01RCLTIPO(req.getParameter("OPTION"));
			}
			catch (Exception e)	{
				msgColl.setE01RCLTIPO("1");
			}

			try {
				msgColl.setE01RCLINDE(req.getParameter("ACTION"));
			}
			catch (Exception e)	{
			}


		msgColl.send();	
		msgColl.destroy();

		flexLog("ERA000501 Message Sent");
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

		if (newmessage.getFormatName().equals("ERA000501")) {
			try {
				msgColl = new datapro.eibs.beans.ERA000501Message();
				flexLog("ERA000501 Message Received");
			} catch (Exception ex) {
				flexLog("Error: " + ex); 
			}

			msgColl = (ERA000501Message)newmessage;


			userPO.setIdentifier(msgColl.getE01RCLAACC());
			userPO.setHeader20(msgColl.getE01RCLBCUN());
			

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("gaBasic", msgColl);

			if (IsNotError) {  // There are no errors
				try {
					flexLog("About to call Page: " + LangPath + "ERA0005_ga_basic_pigdes.jsp");
					callPage(LangPath + "ERA0005_ga_basic_pigdes.jsp", req, res);
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				 }

			}
			else {  // There are errors
				try {
					flexLog("About to call Page: " + LangPath + "ERA0005_ga_selection_pigdes.jsp");
					callPage(LangPath + "ERA0005_ga_selection_pigdes.jsp", req, res);	
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
 * JSECLI001 constructor comment.
 */
public JSERA0005P() {
	super();
}
 
public void destroy() {

	flexLog("free resources used by JSEDL0130");
	
}
 
public void init(ServletConfig config) throws ServletException {
	super.init(config);
}


			// A_BASIC   	= 2
protected void procActionBasic(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	ERA000501Message msgColl = null;
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
		//msgColl = (ERA000501Message)ses.getAttribute("cdTransac");
		msgColl = (ERA000501Message)mc.getMessageRecord("ERA000501");
		msgColl.setH01USERID(user.getH01USR());
		msgColl.setH01PROGRM("ERA005");
	 	msgColl.setH01TIMSYS(getTimeStamp());
		msgColl.setH01SCRCOD("01");
		msgColl.setH01OPECOD("0005");

			try {
				msgColl.setE01RCLBACC(req.getParameter("E01RCLBACC"));
			}
			catch (Exception e)	{
		 	  	msgColl.setE01RCLBACC("0");
			}
		try {
				msgColl.setE01RCLAACC(req.getParameter("E01RCLAACC"));
			}
			catch (Exception e)	{
		 	  	msgColl.setE01RCLAACC("0");
			}
		// all the fields here
	 	java.util.Enumeration enu = msgColl.fieldEnumeration();
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
 	  
		//System.out.println(
		//				"HEADER23 200 ::::" + userPO.getHeader23());
		//System.out.println(
		//				"H01FLGWK1 200 ::::" + msgColl.getH01FLGWK1());	
		
		 

		msgColl.send();	
	 	msgColl.destroy();

	 	flexLog("ERA000501 Message Sent");
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

		if (newmessage.getFormatName().equals("ERA000501")) {
			try {
				msgColl = new datapro.eibs.beans.ERA000501Message();
				flexLog("ERA000501 Message Received");
		  	} catch (Exception ex) {
				flexLog("Error: " + ex); 
		  	}

			msgColl = (ERA000501Message)newmessage;


			userPO.setIdentifier(msgColl.getE01RCLAACC());

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("gaBasic", msgColl);

			if (IsNotError) {  // There are no errors
				try {
				    flexLog("About to call Page: " + LangPath + "ERA0005_ga_confirm_pigdes.jsp");
					callPage(LangPath + "ERA0005_ga_confirm_pigdes.jsp", req, res);
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				 }

			}
			else {  // There are errors
				try {
					flexLog("About to call Page: " + LangPath + "ERA0005_ga_basic_pigdes.jsp");
					callPage(LangPath + "ERA0005_ga_basic_pigdes.jsp", req, res);	
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



 
protected void procReqList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	ELEERRMessage msgError = null;
	ECIF03001Message msgSearch = null;
	ECIF03001Message msgList = null;
	ECIF03002Message msgHeader = null;
	JBList beanList = null;
	UserPos	userPO = null;
 
	userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");

	int posi = 0;
	// Send Initial data
	try
	{
		flexLog("Send Initial Data");
		msgSearch = (ECIF03001Message)mc.getMessageRecord("ECIF03001");
		msgSearch.setH01USERID(user.getH01USR());
	 	msgSearch.setH01PROGRM("ECIF030");
	 	msgSearch.setH01TIMSYS(getTimeStamp());
	 	msgSearch.setH01SCRCOD("01");
	 	msgSearch.setH01OPECOD("0004");
	 	
	 	
		try{
			try{
			 	posi= Integer.parseInt(req.getParameter("Pos"));
			}
			catch (Exception e){
			 	posi=0;	
				flexLog("E01NUMPOS");
			}

	
			try{
			 	msgSearch.setE01NUMREC(req.getParameter("Pos"));
			}
			catch (Exception e){
			 	msgSearch.setE01NUMREC("0");	
				flexLog("E01NUMPOS");
			}
			
		
			try{
			 	msgSearch.setE01NUMACC(userPO.getIdentifier());
			}
			catch (Exception e){
			 	flexLog("E01NUMACC");
			}
			msgSearch.setE01HISCYC(userPO.getHeader7());
			msgSearch.setE01VALBTH(userPO.getHeader8());

			try{
			 	msgSearch.setE01FRDTEM(userPO.getHeader9());
			 	msgSearch.setE01FRDTED(userPO.getHeader10());
			 	msgSearch.setE01FRDTEY(userPO.getHeader11());
			}
			catch (Exception e){
			 	flexLog("DATE 1");
			}
			try{
			 	msgSearch.setE01TODTEM(userPO.getHeader12());
			 	msgSearch.setE01TODTED(userPO.getHeader13());
			 	msgSearch.setE01TODTEY(userPO.getHeader14());
			}
			catch (Exception e){
			 	flexLog("DATE 2");
			}
			try{
			 	msgSearch.setE01FRCHKN(userPO.getHeader15());
			}
			catch (Exception e){
			 	flexLog("E01FRCHKN");
			}
			try{
			 	msgSearch.setE01TOCHKN(userPO.getHeader16());
			}
			catch (Exception e){
			 	flexLog("E01TOCHKN");
			}

			try{
			 	msgSearch.setE01FRAMNT(userPO.getHeader17());
			}
			catch (Exception e){
			 	flexLog("E01FRAMNT");
			}
			try{
			 	msgSearch.setE01TOAMNT(userPO.getHeader18());
			}
			catch (Exception e){
			 	flexLog("E01TOAMNT");
			}
			
			
		}
		catch (Exception e)
		{
		  e.printStackTrace();
		  flexLog("Input data error " + e);
		}

	 	msgSearch.send();	
	 	msgSearch.destroy();
	 	flexLog("ECIF03001 Message Sent");
	}		
	catch (Exception e)
	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}
		
	// Receive Message
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
			flexLog("About to call Page: " + LangPath + "ECIF030_st_selection.jsp");
			callPage(LangPath + "ECIF030_st_selection.jsp", req, res);

		}
		catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	  }
	  else if (newmessage.getFormatName().equals("ECIF03002")) {
		try {
		  msgHeader = new datapro.eibs.beans.ECIF03002Message();
		} catch (Exception ex) {
			flexLog("ECIF0302 Error: " + ex); 
		}

			msgHeader = (ECIF03002Message)newmessage;

			flexLog("Putting java beans into the session");
			ses.setAttribute("stBalances", msgHeader);
	   
	  newmessage = mc.receiveMessage();

	  if (newmessage.getFormatName().equals("ECIF03001")) {

		try {
			beanList = new datapro.eibs.beans.JBList();
	  	} 
		catch (Exception ex) {
			flexLog("ECIF03001 Error: " + ex); 
	  	}

		boolean firstTime = true;
		String marker = "";
		String myFlag = "";
		StringBuffer myRow = null;
		String chk = "";
		String grpData = "";
		String grpDate = "";

		String strDebit = "";
		String strCredit = "";
		java.math.BigDecimal debit = new java.math.BigDecimal("0");
		java.math.BigDecimal credit = new java.math.BigDecimal("0");
		
		while (true) {

			msgList = (ECIF03001Message)newmessage;

			marker = msgList.getE01INDOPE();

			if (marker.equals("*")) {
				beanList.setShowNext(false);
				break;
			}
			else {
				if (firstTime) {
					firstTime = false;
					beanList.setFirstRec(Integer.parseInt(msgList.getE01NUMREC()));
					grpData = msgList.getE01ENDBAL();
	 				grpDate = Util.formatCustomDate(user.getE01DTF(),
	 								msgList.getBigDecimalE01DATE2M().intValue(),
	 								msgList.getBigDecimalE01DATE2D().intValue(),
	 								msgList.getBigDecimalE01DATE2Y().intValue());
					if(posi==0){
						userPO.setHeader5(msgList.getE01BEGBAL());}
					chk = "checked";
				}
				else {
					chk = "";
				    grpData = grpData + "|" + msgList.getE01ENDBAL();
				    grpDate = grpDate + "|" + Util.formatCustomDate(user.getE01DTF(),
														msgList.getBigDecimalE01DATE2M().intValue(),
														msgList.getBigDecimalE01DATE2D().intValue(),
														msgList.getBigDecimalE01DATE2Y().intValue());   					
				}
				
				if(msgList.getE01TRADCC().equals("0")){
					debit = debit.add(msgList.getBigDecimalE01TRAAMT());
					strDebit = Util.fcolorCCY(msgList.getE01TRAAMT());
					strCredit = "&nbsp;";
				}
				else if(msgList.getE01TRADCC().equals("5")){
					credit = credit.add(msgList.getBigDecimalE01TRAAMT());
					strDebit = "&nbsp;";
					strCredit = Util.fcolorCCY(msgList.getE01TRAAMT());
				}

				myRow = new StringBuffer("<TR>");
				myRow.append("<TD NOWRAP ALIGN=\"CENTER\">" + Util.formatCustomDate(user.getE01DTF(),
																	msgList.getBigDecimalE01DATE1M().intValue(),
																	msgList.getBigDecimalE01DATE1D().intValue(),
																	msgList.getBigDecimalE01DATE1Y().intValue()) + "</TD>");
				
				if (msgList.getH01FLGWK3().equals(" ")) {
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TRACKN()) + "</TD>");
				}
				else {
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><a href=\"javascript:showTransfer('" + msgList.getH01FLGWK3() + Util.justifyRight(msgList.getE01TRACKN(), 6) + "')\">" + msgList.getH01FLGWK3() + " - " + msgList.getE01TRACKN() + "</a></TD>");
				}
				
				if (msgList.getE01TRACDE().equalsIgnoreCase("CK") || msgList.getE01TRACDE().equalsIgnoreCase("OF") || msgList.getE01TRACDE().equalsIgnoreCase("DP")) {
					String cod = msgList.getE01TRACDE() + "_" + userPO.getIdentifier() + "_" + msgList.getE01TRACKN();
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showTRImg('" + cod + "')\">" + Util.formatCell(msgList.getE01TRACDE()) + "</A></TD>");
				}
				else {
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\">" + Util.formatCell(msgList.getE01TRACDE()) + "</TD>");
				}
				if(msgList.getE01TRADRR().equals("0")){
					myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "</TD>");}
				else {
					myRow.append("<TD NOWRAP><A HREF=\"javascript:GetStatDesc('" + msgList.getE01TRADRR() + "','" + msgList.getE01TRANAR() 
						+ "','" + Util.formatCustomDate(user.getE01DTF(),
											msgList.getBigDecimalE01DATE1M().intValue(),
											msgList.getBigDecimalE01DATE1D().intValue(),
											msgList.getBigDecimalE01DATE1Y().intValue())
						
						+ "','" + Util.formatCell(msgList.getE01TRACDE()) + "')\">" + Util.formatCell(msgList.getE01TRANAR())
						
						+ "</A></TD>");
				}

				myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strDebit + "</TD>");
				myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strCredit + "</TD>");
				myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE01ENDBAL()) + "</TD>");
				myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE01TRABTH()) + "</TD>");
				myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCustomDate(user.getE01DTF(),
																msgList.getBigDecimalE01DATE2M().intValue(),
																msgList.getBigDecimalE01DATE2D().intValue(),
																msgList.getBigDecimalE01DATE2Y().intValue()) + "</TD>");
				myRow.append("<TD NOWRAP ALIGN=CENTER>" + msgList.getE01TRATMS() + "</TD>");				
				myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRAUSA()) + "</TD>");				
				myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCell(msgList.getE01TRAOBK()) + "</TD>");
				myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCell(msgList.getE01TRAOBR()) + "</TD>");
				myRow.append("</TR>");
				beanList.addRow(myFlag, myRow.toString());
				
								
				if (marker.equals("+")) {
					beanList.setShowNext(true);
					break;
				}
			}

			newmessage = mc.receiveMessage();
		}
		
		userPO.setHeader19(Util.fcolorCCY(debit.toString()));
		userPO.setHeader20(Util.fcolorCCY(credit.toString()));
		userPO.setHeader21(grpData);
		userPO.setHeader22(grpDate);
		
		flexLog("Putting java beans into the session");
		ses.setAttribute("cifList", beanList);

		try {
			if(msgList.getE01VALBTH().equals("V")){
			 flexLog("About to call Page: " + LangPath + "ECIF030_st_list_fv.jsp");
			 callPage(LangPath + "ECIF030_st_list_fv.jsp", req, res);
			}
			else if(msgList.getE01VALBTH().equals("B")){
			 flexLog("About to call Page: " + LangPath + "ECIF030_st_list_fp.jsp");
			 callPage(LangPath + "ECIF030_st_list_fp.jsp", req, res);
			}
		}
		catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
		
	  }
	  }
	}
	catch (Exception e)
	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}	
  }
  
  
  protected void procReqPassword(
		  HttpServletRequest req,
		  HttpServletResponse res,
		  HttpSession ses)
		  throws ServletException, IOException {

		  UserPos userPO = null;

		  try {
			  //mod emat 01/24/2002
			  //send draft parameter
			  String typCode = "";
			  flexLog("typCode: " + req.getParameter("typCode"));
			  if (req.getParameter("typCode") != null) {
				  typCode = req.getParameter("typCode");
			  }

			  userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			  userPO.setRedirect(
				  "/servlet/datapro.eibs.client.JSERA0005P?SCREEN="
					  + R_ENTER_SELECTION
					  + "&appCode="
					  + req.getParameter("appCode")
					  + "&typCode="
					  + req.getParameter("typCode")
					  + (req.getParameter("ACCNUM") == null
						  ? ""
						  : "&ACCNUM=" + req.getParameter("ACCNUM")));
			  ses.setAttribute("userPO", userPO);
			  //res.sendRedirect(super.srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");

		  } catch (Exception e) {
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

			int screen = R_ENTER_SELECTION;
		
			try {
		
				msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getAttribute("currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try
				{
					flexLog("Opennig Socket Connection ");
					mc = new MessageContext(super.getMessageHandler("ERA0005", req));
			
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
				}
				catch (Exception e) {
					flexLog("Screen set to default value");
				}
		
				switch (screen) {
				
					case R_PASSWORD :
						procReqPassword(req, res, session);
						break;					 
					// Action
					case A_BASIC :
						procActionBasic(mc, msgUser, req, res, session);
						break;
					// END CD

					// BEGIN Entering
					// Request
					case R_ENTER_SELECTION : 
						procReqEnterSelection(msgUser, req, res, session);
						break;
				
					// Action 
					case A_ENTER_SELECTION : 
						procActionEnterSelection(mc, msgUser, req, res, session);
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