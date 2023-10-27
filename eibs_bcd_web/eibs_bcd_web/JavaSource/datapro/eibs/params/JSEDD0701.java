//Processed by NMI's Java Code Viewer 4.8.0 © 1997-1999 B. Lemaire
//Website: http://njcv.htmlplanet.com	E-mail: info@njcv.htmlplanet.com
//Copy registered to Evaluation Copy
//Source File Name:   JSEDD0660.java

package datapro.eibs.params;

import datapro.eibs.beans.*;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.*;

import java.beans.Beans;
import java.io.*;
import java.net.Socket;
import java.util.Enumeration;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDD0701 extends SuperServlet {

	static final int R_LIST = 1;
	static final int A_LIST = 2;
	static final int R_I_LIST = 3;
	static final int R_NEW = 100;
	static final int A_MAINT = 200;
	static final int R_MAINT = 300;
	static final int R_DELETE = 500;
	static final int R_INQUIRY = 700;
	static final int R_ENTER_NEW = 1000;
	static final int R_SIGNATURE = 1100;

	
 private String LangPath;

 public JSEDD0701() {
     LangPath = "S";
 }

 public void destroy() {
     flexLog("free resources used by JSEDD0701");
 }

 public void init(ServletConfig config) throws ServletException {
     super.init(config);
 }

 public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
     
	 MessageContext mc = null;
     ESS0030DSMessage msgUser = null;
     HttpSession session = null;
     session = req.getSession(false);
     if(session == null) {
         try {
             res.setContentType("text/html");
             printLogInAgain(res.getWriter());    
         }
         catch(Exception e) {
             e.printStackTrace();
             flexLog("Exception ocurred. Exception = " + e);
         }
     } else {
         int screen = 1;
         try {
             msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
             LangPath = SuperServlet.rootPath + msgUser.getE01LAN() + "/";
             try {
                 flexLog("Opennig Socket Connection");
                 mc = new MessageContext(super.getMessageHandler("EDD0701", req));
                 try {
                     screen = Integer.parseInt(req.getParameter("SCREEN"));
                 }
                 catch(Exception e) {
                     flexLog("Screen set to default value");
                 }
                 switch(screen) {
                 case R_LIST:
                     procReqList(mc, msgUser, req, res, session);
                     break;

                 case R_NEW:
                     procReqNew(mc, msgUser, req, res, session);
                     break;

                 case R_ENTER_NEW: 
                     procReqEnterNew(mc, msgUser, req, res, session);
                     break;

                 case R_MAINT: 
                     procReqMaint(mc, msgUser, req, res, session);
                     break;

                 case A_LIST:
                     procActionPos(mc, msgUser, req, res, session);
                     break;

                 case A_MAINT: 
                     procActionMaint(mc, msgUser, req, res, session);
                     break;

                 case R_DELETE: 
                    procReqDelete(mc, msgUser, req, res, session);
                    break;

                 case R_SIGNATURE: 
                	 procReqSignature(mc, msgUser, req, res, session);
                     break;


                 default:
                     res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.devPage);
                     break;

                 }
             }
             catch(Exception e) {
                 e.printStackTrace();
                 int sck = SuperServlet.getInitSocket(req) + 1;
                 flexLog("Socket not Open(Port " + sck + "). Error: " + e);
                 res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotOpenPage);
             }
             finally {
                 mc.close();
             }
         }
         catch(Exception e) {
             flexLog("Error: " + e);
             res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotRespondPage);
         }
     }
 }

 protected void showERROR(ELEERRMessage m) {
     if(SuperServlet.logType != 0) {
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

 protected void procReqEnterNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
     MessageRecord newmessage = null;
     ELEERRMessage msgError = null;
     UserPos userPO = null;
     boolean IsNotError = false;
     try {
         msgError = new ELEERRMessage();
     }
     catch(Exception ex) {
         flexLog("Error: " + ex);
     }
     userPO = (UserPos)ses.getAttribute("userPO");
     try {
         flexLog("About to call Page: " + LangPath + "EDD0701_enter_param.jsp");
         callPage(LangPath + "EDD0701_enter_param.jsp", req, res);
     }
     catch(Exception e) {
         flexLog("Exception calling page " + e);
     }
 }

 protected void procReqList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
     MessageRecord newmessage = null;
     EDD070101Message msgList = null;
     ELEERRMessage msgError = null;
     JBList beanList = null;
     UserPos userPO = null;
     boolean IsNotError = false;
     try {
         msgError = (ELEERRMessage)Beans.instantiate(getClass().getClassLoader(), "datapro.eibs.beans.ELEERRMessage");
     }
     catch(Exception ex) {
         flexLog("Error: " + ex);
     }
     userPO = (UserPos)ses.getAttribute("userPO");
     try {
         msgList = (EDD070101Message)mc.getMessageRecord("EDD070101");
         msgList.setH01USERID(user.getH01USR());
         msgList.setH01PROGRM("EDD0701");
         msgList.setH01TIMSYS(SuperServlet.getTimeStamp());
         msgList.setH01SCRCOD("01");
         msgList.setH01OPECOD("0015");
         try {
             msgList.setE01REMLOC(req.getParameter("E01REMLOC").toUpperCase());
         }
         catch(Exception exception) { }
         msgList.send();
         msgList.destroy();
         flexLog("EDD070101 Message Sent");
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
     try {
         newmessage = mc.receiveMessage();
         if(newmessage.getFormatName().equals("ELEERR")) {
             try {
                 msgError = (ELEERRMessage)Beans.instantiate(getClass().getClassLoader(), "datapro.eibs.beans.ELEERRMessage");
             }
             catch(Exception ex) {
                 flexLog("Error: " + ex);
             }
             msgError = (ELEERRMessage)newmessage;
             IsNotError = msgError.getERRNUM().equals("0");
             showERROR(msgError);
             flexLog("Putting java beans into the session");
             ses.setAttribute("error", msgError);
             ses.setAttribute("userPO", userPO);
         }
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e + newmessage);
         throw new RuntimeException("Socket Communication Error Receiving");
     }
     try {
         newmessage = mc.receiveMessage();
         if(newmessage.getFormatName().equals("EDD070101")) {
             try {
				 userPO.setHeader1(req.getParameter("E01REMLOC"));
                 userPO.setBank(req.getParameter("E01REMBAN"));
                 userPO.setHeader2(req.getParameter("E01REMSUC"));
                 userPO.setHeader3(req.getParameter("E01REMCCY"));
             }
             catch(Exception exception1) { }
             beanList = new JBList();
             boolean firstTime = true;
             String marker = "";
             String myFlag = "";
             StringBuffer myRow = null;
             String chk = "";
             String TableTyp = "";
             String chkOfac = "";
             String chkWarn = "";
             int compar = 0;
             int indexRow = 0;
             do {
                 msgList = (EDD070101Message)newmessage;
                 marker = msgList.getE01REMOPE();
                 if(marker.equals("*")) {
                     beanList.setShowNext(false);
                     break;
                 }
                 if(firstTime) {
                     firstTime = false;
                     chk = "checked";
                 } else {
                     chk = "";
                 }
                 myRow = new StringBuffer("<TR>");
                 myRow.append("<TD NOWRAP  ALIGN=CENTER width=\"10%\"><input type=\"radio\" name=\"ACCNUM\" value=\"" + msgList.getE01REMLOC() + "\" " + chk + " onclick=\"getParams('" + msgList.getE01REMLOC() + "','" + msgList.getE01REMBAN() + "','"+ msgList.getE01REMSUC() + "','"+ msgList.getE01REMCCY() + "')\"></TD>");
                 myRow.append("<TD NOWRAP  ALIGN=CENTER width=\"10%\">" + msgList.getE01REMLOC() + "</td>");
                 myRow.append("<TD NOWRAP  ALIGN=CENTER width=\"10%\">" + msgList.getE01REMBAN() + "</td>");
                 myRow.append("<TD NOWRAP  ALIGN=CENTER width=\"10%\">" + msgList.getE01REMSUC() + "</td>");
                 myRow.append("<TD NOWRAP  ALIGN=LEFT width=\"30%\">" + msgList.getE01REMNOM() + "</td>");
                 myRow.append("<TD NOWRAP  ALIGN=CENTER width=\"10%\">" + msgList.getE01REMCCY() + "</td>");
                 myRow.append("</TR>");
                 beanList.addRow(myFlag, myRow.toString());
                 indexRow++;
                 if(marker.equals("+")) {
                     beanList.setShowNext(true);
                     break;
                 }
                 newmessage = mc.receiveMessage();
             }
             while(true);
             flexLog("Putting java beans into the session");
             ses.setAttribute("EDD0701Help", beanList);
             ses.setAttribute("userPO", userPO);
             if(IsNotError)
                 try {
                     flexLog("About to call Page: " + LangPath + "EDD0701_remesas_list.jsp");
                     callPage(LangPath + "EDD0701_remesas_list.jsp", req, res);
                 }
                 catch(Exception e) {
                     flexLog("Exception calling page " + e);
                 }
             else
                 try {
                     flexLog("About to call Page: " + LangPath + "EDD0701_enter_param.jsp");
                     callPage(LangPath + "EDD0701_enter_param.jsp", req, res);
                 }
                 catch(Exception e) {
                     flexLog("Exception calling page " + e);
                 }
         } else {
             flexLog("Message " + newmessage.getFormatName() + " received.");
         }
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Data Receiving");
     }
 }

 protected void procActionPos(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
     MessageRecord newmessage = null;
     ELEERRMessage msgError = null;
     UserPos userPO = null;
     boolean IsNotError = false;
     userPO = (UserPos)ses.getAttribute("userPO");
     int inptOPT = 0;
     inptOPT = Integer.parseInt(req.getParameter("opt"));
	 String LOC = "";
     String BAN = "";
     String SUC = "";
     String CCY = "";
	try {
	     LOC = req.getParameter("LOC");
	 }
	 catch(Exception exception) { }
     try {
         BAN = req.getParameter("BAN");
     }
     catch(Exception exception) { }
     try {
         SUC = req.getParameter("SUC");
     }
     catch(Exception exception1) { }
     try {
        CCY = req.getParameter("CCY");
    }
    catch(Exception exception2) { }
         
     switch(inptOPT) {
     case 1: // '\001'
         res.sendRedirect(SuperServlet.srctx + "/servlet/datapro.eibs.params.JSEDD0701?SCREEN=100" + "&LOC=" + LOC + "&BAN=" + BAN + "&SUC=" + SUC + "&CCY=" + CCY);
         break;

     case 2: // '\002'
         res.sendRedirect(SuperServlet.srctx + "/servlet/datapro.eibs.params.JSEDD0701?SCREEN=300" + "&LOC=" + LOC + "&BAN=" + BAN + "&SUC=" + SUC + "&CCY=" + CCY);
         break;

     case 3: // '\003'
         res.sendRedirect(SuperServlet.srctx + "/servlet/datapro.eibs.params.JSEDD0701?SCREEN=500" + "&LOC=" + LOC + "&BAN=" + BAN + "&SUC=" + SUC + "&CCY=" + CCY);
         break;

     case 4: // '\004'
         res.sendRedirect(SuperServlet.srctx + "/servlet/datapro.eibs.params.JSEDD0701?SCREEN=700" + "&LOC=" + LOC + "&BAN=" + BAN + "&SUC=" + SUC + "&CCY=" + CCY);
         break;

     default:
         res.sendRedirect(SuperServlet.srctx + "/servlet/datapro.eibs.params.JSEDD0701?SCREEN=100" + "&LOC=" + LOC + "&BAN=" + BAN + "&SUC=" + SUC + "&CCY=" + CCY);
         break;

     }
 }

 protected void procReqNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
     MessageRecord newmessage = null;
     EDD070102Message msgDoc = null;
     ELEERRMessage msgError = null;
     UserPos userPO = null;
     boolean IsNotError = false;
     int acctype = 0;
     try {
         msgError = new ELEERRMessage();
     }
     catch(Exception ex) {
         flexLog("Error: " + ex);
     }
     userPO = (UserPos)ses.getAttribute("userPO");
     try {
         msgDoc = (EDD070102Message)mc.getMessageRecord("EDD070102");
         msgDoc.setH02USERID(user.getH01USR());
         msgDoc.setH02PROGRM("EDD0701");
         msgDoc.setH02TIMSYS(SuperServlet.getTimeStamp());
         msgDoc.setH02SCRCOD("01");
         msgDoc.setH02OPECOD("0001");
		 try {
			msgDoc.setE02REMLOC(req.getParameter("LOC"));
			}
		 catch(Exception exception) { }	
         try {
             msgDoc.setE02REMBAN(req.getParameter("BAN"));
         }
         catch(Exception exception) { }
         try {
             msgDoc.setE02REMSUC(req.getParameter("SUC"));
         }
         catch(Exception exception1) { }
         try {
            msgDoc.setE02REMCCY(req.getParameter("CCY"));
        }
        catch(Exception exception2) { }

         msgDoc.send();
         msgDoc.destroy();
         flexLog("EDD070102 Message Sent");
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
     try {
         newmessage = mc.receiveMessage();
         if(newmessage.getFormatName().equals("ELEERR")) {
             msgError = (ELEERRMessage)newmessage;
             IsNotError = msgError.getERRNUM().equals("0");
             flexLog("IsNotError = " + IsNotError);
             showERROR(msgError);
         } else {
             flexLog("Message " + newmessage.getFormatName() + " received.");
         }
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
     try {
         newmessage = mc.receiveMessage();
         if(newmessage.getFormatName().equals("EDD070102")) {
             try {
                 msgDoc = new EDD070102Message();
                 flexLog("EDD070102 Message Received");
             }
             catch(Exception ex) {
                 flexLog("Error: " + ex);
             }
             msgDoc = (EDD070102Message)newmessage;
             flexLog("Putting java beans into the session");
             ses.setAttribute("error", msgError);
             ses.setAttribute("userPO", userPO);
             ses.setAttribute("lnParam", msgDoc);
             if(IsNotError)
                 try {
                     flexLog("About to call Page: " + LangPath + "EDD0701_remesas_maint.jsp");
                     callPage(LangPath + "EDD0701_remesas_maint.jsp", req, res);
                 }
                 catch(Exception e) {
                     flexLog("Exception calling page " + e);
                 }
             else
                 try {
                     flexLog("About to call Page: " + LangPath + "EDD0701_remesas_list.jsp");
                     callPage(LangPath + "EDD0701_remesas_list.jsp", req, res);
                 }
                 catch(Exception e) {
                     flexLog("Exception calling page " + e);
                 }
         } else {
             flexLog("Message " + newmessage.getFormatName() + " received.");
         }
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
 }

 protected void procReqMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
     MessageRecord newmessage = null;
     EDD070102Message msgDoc = null;
     ELEERRMessage msgError = null;
     UserPos userPO = null;
     boolean IsNotError = false;
     int acctype = 0;
     try {
         msgError = new ELEERRMessage();
     }
     catch(Exception ex) {
         flexLog("Error: " + ex);
     }
     userPO = (UserPos)ses.getAttribute("userPO");
     try {
         msgDoc = (EDD070102Message)mc.getMessageRecord("EDD070102");
         msgDoc.setH02USERID(user.getH01USR());
         msgDoc.setH02PROGRM("EDD0701");
         msgDoc.setH02TIMSYS(SuperServlet.getTimeStamp());
         msgDoc.setH02SCRCOD("01");
         msgDoc.setH02OPECOD("0002");
		 try {
			 msgDoc.setE02REMLOC(req.getParameter("LOC"));
		 }
		 catch(Exception exception) { }
         try {
             msgDoc.setE02REMBAN(req.getParameter("BAN"));
         }
         catch(Exception exception) { }
         try {
             msgDoc.setE02REMSUC(req.getParameter("SUC"));
         }
         catch(Exception exception1) { }
         try {
            msgDoc.setE02REMCCY(req.getParameter("CCY"));
        }
        catch(Exception exception2) { }
         msgDoc.send();
         msgDoc.destroy();
         flexLog("EDD070102 Message Sent");
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
     try {
         newmessage = mc.receiveMessage();
         if(newmessage.getFormatName().equals("ELEERR")) {
             msgError = (ELEERRMessage)newmessage;
             IsNotError = msgError.getERRNUM().equals("0");
             flexLog("IsNotError = " + IsNotError);
             showERROR(msgError);
         } else {
             flexLog("Message " + newmessage.getFormatName() + " received.");
         }
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
     try {
         newmessage = mc.receiveMessage();
         if(newmessage.getFormatName().equals("EDD070102")) {
             try {
                 msgDoc = new EDD070102Message();
                 flexLog("EDD070102 Message Received");
             }
             catch(Exception ex) {
                 flexLog("Error: " + ex);
             }
             msgDoc = (EDD070102Message)newmessage;
             flexLog("Putting java beans into the session");
             ses.setAttribute("error", msgError);
             ses.setAttribute("userPO", userPO);
             ses.setAttribute("lnParam", msgDoc);
             if(IsNotError)
                 try {
                     flexLog("About to call Page: " + LangPath + "EDD0701_remesas_maint.jsp");
                     callPage(LangPath + "EDD0701_remesas_maint.jsp", req, res);
                 }
                 catch(Exception e) {
                     flexLog("Exception calling page " + e);
                 }
             else
                 try {
                     flexLog("About to call Page: " + LangPath + "EDD0701_remesas_list.jsp");
                     callPage(LangPath + "EDD0701_remesas_list.jsp", req, res);
                 }
                 catch(Exception e) {
                     flexLog("Exception calling page " + e);
                 }
         } else {
             flexLog("Message " + newmessage.getFormatName() + " received.");
         }
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
 }

 protected void procActionMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
     MessageRecord newmessage = null;
     EDD070102Message msgRT = null;
     ELEERRMessage msgError = null;
     UserPos userPO = null;
     boolean IsNotError = false;
     int acctype = 0;
     try {
         msgError = new ELEERRMessage();
     }
     catch(Exception ex) {
         flexLog("Error: " + ex);
     }
     userPO = (UserPos)ses.getAttribute("userPO");
     try {
         flexLog("Send Initial Data");
         msgRT = (EDD070102Message)ses.getAttribute("lnParam");
         msgRT.setH02USERID(user.getH01USR());
         msgRT.setH02PROGRM("EDD0701");
         msgRT.setH02TIMSYS(SuperServlet.getTimeStamp());
         msgRT.setH02SCRCOD("01");
         msgRT.setH02OPECOD("0005");
         Enumeration enu = msgRT.fieldEnumeration();
         MessageField field = null;
         String value = null;
         while(enu.hasMoreElements())  {
             field = (MessageField)enu.nextElement();
             try {
                 value = req.getParameter(field.getTag()).toUpperCase();
                 if(value != null)
                     field.setString(value);
             }
             catch(Exception exception) { }
         }

         mc.sendMessage(msgRT);
         msgRT.destroy();
         flexLog("EDD070102 Message Sent");
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
     try {
         newmessage = mc.receiveMessage();
         if(newmessage.getFormatName().equals("ELEERR")) {
             msgError = (ELEERRMessage)newmessage;
             IsNotError = msgError.getERRNUM().equals("0");
             flexLog("IsNotError = " + IsNotError);
             showERROR(msgError);
         } else {
             flexLog("Message " + newmessage.getFormatName() + " received.");
         }
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
     try {
         newmessage = mc.receiveMessage();
         if(newmessage.getFormatName().equals("EDD070102")) {
             try {
                 msgRT = new EDD070102Message();
                 flexLog("EDD070102 Message Received");
             }
             catch(Exception ex) {
                 flexLog("Error: " + ex);     
             }
             msgRT = (EDD070102Message)newmessage;
             flexLog("Putting java beans into the session");
             ses.setAttribute("error", msgError);
             ses.setAttribute("lnParam", msgRT);
             ses.setAttribute("userPO", userPO);
             if(IsNotError)
                 try {
                     res.sendRedirect(SuperServlet.srctx + "/servlet/datapro.eibs.params.JSEDD0701?SCREEN=1000");
                 }
                 catch(Exception e) {
                     flexLog("Exception calling page " + e);
                 }
             else
                 try {
                     flexLog("About to call Page: " + LangPath + "EDD0701_remesas_maint.jsp");
                     callPage(LangPath + "EDD0701_remesas_maint.jsp", req, res);
                 }
                 catch(Exception e) {
                     flexLog("Exception calling page " + e);
                 }
         } else {
             flexLog("Message " + newmessage.getFormatName() + " received.");
         }
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
 }

 
 protected void procReqSignature(MessageContext mc, 
		 ESS0030DSMessage user, 
		 HttpServletRequest req, 
		 HttpServletResponse res, 
		 HttpSession ses) throws ServletException, IOException {
         UserPos userPO = getUserPos(req);
		
	
        flexLog("About to call Page: " + LangPath + "EDD0924_signature_search.jsp");
        callPage(LangPath + "EDD0924_signature_search.jsp", req, res);

		
	}


 
 
 
protected void procReqDelete(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
     MessageRecord newmessage = null;
     EDD070102Message msgDoc = null;
     ELEERRMessage msgError = null;
     UserPos userPO = null;
     boolean IsNotError = false;
     int acctype = 0;
     try {
         msgError = new ELEERRMessage();
     }
     catch(Exception ex) {
         flexLog("Error: " + ex);
     }
     userPO = (UserPos)ses.getAttribute("userPO");
     try {
         msgDoc = (EDD070102Message)mc.getMessageRecord("EDD070102");
         msgDoc.setH02USERID(user.getH01USR());
         msgDoc.setH02PROGRM("EDD0701");
         msgDoc.setH02TIMSYS(SuperServlet.getTimeStamp());
         msgDoc.setH02SCRCOD("01");
         msgDoc.setH02OPECOD("0004");
		 try {
			 msgDoc.setE02REMLOC(req.getParameter("LOC"));
		 }
		 catch(Exception exception) { }
         try {
             msgDoc.setE02REMBAN(req.getParameter("BAN"));
         }
         catch(Exception exception) { }
         try {
             msgDoc.setE02REMSUC(req.getParameter("SUC"));
         }
         catch(Exception exception1) { }
         try {
            msgDoc.setE02REMCCY(req.getParameter("CCY"));
        }
        catch(Exception exception2) { }
         msgDoc.send();
         msgDoc.destroy();
         flexLog("EDD070102 Message Sent");
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
     try {
         newmessage = mc.receiveMessage();
         if(newmessage.getFormatName().equals("ELEERR")) {
             msgError = (ELEERRMessage)newmessage;
             IsNotError = msgError.getERRNUM().equals("0");
             flexLog("IsNotError = " + IsNotError);
             showERROR(msgError);
         } else {
             flexLog("Message " + newmessage.getFormatName() + " received.");
         }
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
     try {
         newmessage = mc.receiveMessage();
         if(newmessage.getFormatName().equals("EDD070102")) {
             try {
                 msgDoc = new EDD070102Message();
                 flexLog("EDD070102 Message Received");
             }
             catch(Exception ex) {
                 flexLog("Error: " + ex);
             }
             msgDoc = (EDD070102Message)newmessage;
             flexLog("Putting java beans into the session");
             ses.setAttribute("error", msgError);
             ses.setAttribute("userPO", userPO);
             ses.setAttribute("lnParam", msgDoc);
             if(IsNotError)
                 try {
                     flexLog("About to redirect: " + LangPath + "/servlet/datapro.eibs.params.JSEDD0701?SCREEN=1");
                     res.sendRedirect(SuperServlet.srctx + "/servlet/datapro.eibs.params.JSEDD0701?SCREEN=1" + "&E01REMLOC=" + req.getParameter("LOC") + "&E01REMBAN=" + req.getParameter("BAN") + "&E01REMSUC=" + req.getParameter("SUC") + "&E01REMCCY=" + req.getParameter("CCY"));
                 }
                 catch(Exception e) {
                     flexLog("Exception calling page " + e);
                 }
             else
                 try {
                     flexLog("About to call Page: " + LangPath + "EDD0701_remesas_maint.jsp");
                     callPage(LangPath + "EDD0701_remesas_maint.jsp", req, res);
                 }
                 catch(Exception e) {
                     flexLog("Exception calling page " + e);
                 }
         } else {
             flexLog("Message " + newmessage.getFormatName() + " received.");
         }
     }
     catch(Exception e) {
         e.printStackTrace();
         flexLog("Error: " + e);
         throw new RuntimeException("Socket Communication Error");
     }
 }
}