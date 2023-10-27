<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<TITLE>Ayuda</TITLE>
<script type="text/javascript">
</script>
</HEAD>
<BODY>

<table width=100% align=center border=1>


<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<%
  	// Parameter entries
  	String appCode = request.getParameter("appcode") == null ? "" : request.getParameter("appcode");
  	String typeCode = request.getParameter("typecode") == null ? "" : request.getParameter("typecode");
  	String title = request.getParameter("title") == null ? "" : request.getParameter("title");
  	boolean displayTypes = typeCode.equals("") ? true : false;

	// out.println("<tr><td colspan=5>" +  appCode + "&nbsp;" + typeCode + "&nbsp;" + "</td></tr>");
  	
  	if ( displayTypes ) {
			out.println("<tr><TH align=left colspan=5 >" +  title + "</TH></tr>");			   
			out.println("<tr><td colspan=5>&nbsp;</td></tr>");
			out.println("<tr>");
			out.println("<td align=center width=10> </td>");
			out.println("<td align=center width=40>Tipo</td>");
			out.println("<td align=center width=40>Moneda</td>");
			out.println("<td align=center width=80>Nombre de Mercadeo</td>");
			out.println("<td align=center>Descripción</td>");
			out.println("</tr>");
   } else {
			out.println("<tr><TH align=left colspan=5 >" + typeCode + " - " +  title + "</TH></tr>");			   
			out.println("<tr><td colspan=5>&nbsp;</td></tr>");
			out.println("<tr>");
			out.println("<td align=center width=10> </td>");
			out.println("<td align=center width=40>Producto</td>");
			out.println("<td align=center width=40>Moneda</td>");
			out.println("<td align=center width=80>Nombre de Mercadeo</td>");
			out.println("<td align=center>Descripción</td>");
			out.println("</tr>");
   }

	session = (HttpSession) request.getSession(false);
	
	if (session != null) {

	  	MessageProcessor mp = null;
	  	ESD071102Message msgHelp = null;
		ESS0030DSMessage msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
      	try {
      		mp = new MessageProcessor("ESD0711");
       		msgHelp = (ESD071102Message) mp.getMessageRecord("ESD071102");
			msgHelp.setE02USERID(msgUser.getH01USR());
            msgHelp.setE02SELACD(appCode); 
            msgHelp.setE02SELTYP(typeCode);
            
            mp.sendMessage(msgHelp);
            JBObjList list = mp.receiveMessageRecordList("E02OPERAC");
            
            if (!list.isEmpty()) {
            	list.initRow();
            	while (list.getNextRow()) {
            		msgHelp =  (ESD071102Message) list.getRecord();
					out.println("<tr>");
					if ( displayTypes ) {
           				out.println("<td width=10><input type=\"radio\" name=\"CODE\" value=\"" + msgHelp.getE02APCTYP().trim() + "\"></td>"); // radio button
           				out.println("<td width=30>" + msgHelp.getE02APCTYP().trim() + "</td>"); // Type Code
					} else {
           				out.println("<td width=10><input type=\"radio\" name=\"CODE\" value=\"" + msgHelp.getE02APCCDE().trim() + "\"></td>"); // radio button
           				out.println("<td width=30>" + msgHelp.getE02APCCDE().trim() + "</td>"); // Prod Code
					}
           			out.println("<td width=30>" + msgHelp.getE02CURREN().trim() + "</td>"); // Currency Code
           			out.println("<td width=80>" + msgHelp.getE02NICNME().trim() + "</td>"); // Nick Name
           			out.println("<td>"  + msgHelp.getE02DESCRI().trim() + "</td>"); // Description
           			out.println("</tr>");
            	}
            }
		} finally {
			if (mp != null) mp.close();
		}            
	}
                	
%>
</table>
</BODY>
</HTML>
