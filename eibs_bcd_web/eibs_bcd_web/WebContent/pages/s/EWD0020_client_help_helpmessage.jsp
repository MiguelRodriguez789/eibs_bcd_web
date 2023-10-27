<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head><title>Clases</title>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*" %>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>
<script type="text/javascript">
	function enter(code, desc) {
		var formLength= top.opener.document.forms[0].elements.length;
		for(var n=0;n<formLength;n++){
			var elementName= top.opener.document.forms[0].elements[n].name;
			if(elementName == top.opener.fieldName){
  				top.opener.document.forms[0].elements[n].value = code;
  				break;
			}
 		}
		for(var n=0;n<formLength;n++){
			var elementName= top.opener.document.forms[0].elements[n].name;
			if(elementName == top.opener.fieldDesc){
  				top.opener.document.forms[0].elements[n].value = desc;
  				break;
			}
 		}
		top.close();
 	}
</script>
</head>
<body>
<%
	out.println("<center><H3><b>Busqueda de Clases de Activos en el Sistema<b></H3></center>");
	
	MessageProcessor mp = null;
	try {
		mp = new MessageProcessor("EWD0020");
		EWD0020DSMessage msg = (EWD0020DSMessage) mp.getMessageRecord("EWD0020DS");
		
		mp.sendMessage(msg);
		JBObjList list = mp.receiveMessageRecordList("EWDOPE");
		
		if (!list.isEmpty()) {
			String ClassNum = "";
			String Name = "";
			String Group = "";
			list.initRow();
			out.println("<table  class=\"tableinfo\" style=\"width:95%\" ALIGN=CENTER>");
			out.println("<tr id=\"trdark\">");
			out.println("<th>Clase</th>");
			out.println("<th>Nombre</th>");
			out.println("<th>Grupo Sistema de Información</th>");
			out.println("</tr>");
			while (list.getNextRow()) {
				msg = (EWD0020DSMessage) list.getRecord();
				ClassNum = msg.getEWDNUM().trim();
				Name = "".equals(msg.getEWDNME().trim()) ? "&nbsp;" : msg.getEWDNME().trim();
				Group = "".equals(msg.getEWDGRP().trim()) ? "&nbsp;" : msg.getEWDGRP().trim(); 
				out.println("<tr>");
				out.println("<td><a href=\"javascript:enter('" + ClassNum + "', '" + Name + "')\">" + ClassNum + "</a></td>");
				out.println("<td><a href=\"javascript:enter('" + ClassNum + "', '" + Name + "')\">" + Name + "</a></td>");
				out.println("<th><a href=\"javascript:enter('" + ClassNum + "', '" + Name + "')\">" + Group + "</a></thewdeewd>");
				out.println("</tr>");		
			}
			out.println("</table>");
		}
	
	} catch (Exception e) {
		out.println("Read error: " + e.getMessage());
	} finally {
		if (mp != null) mp.close();
	}
%>
</body>
</html>