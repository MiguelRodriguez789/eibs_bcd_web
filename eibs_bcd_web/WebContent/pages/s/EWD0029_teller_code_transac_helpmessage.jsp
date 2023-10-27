<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head><title>Codigo de Transacciones</title>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*" %>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>
<script type="text/javascript">
//<!-- Hide from old browsers
	function enter(code) {
		var formLength= top.opener.document.forms[0].elements.length;
		for(n=0;n<formLength;n++){
			var elementName= top.opener.document.forms[0].elements[n].name;
			if(elementName == top.opener.fieldName){
  				top.opener.document.forms[0].elements[n].value = code;
  				break;
			}
 		}
		top.close();
 	}
//-->
</script>
</head>
<body>
<%
	out.println("<center><font><b>Busqueda de Codigos de Transaccion para Cajeros en el Sistema<b></font></font></center>");

	MessageProcessor mp = null;
	try {
		mp = new MessageProcessor("EWD0029");
		EWD0029DSMessage msg = (EWD0029DSMessage) mp.getMessageRecord("EWD0029DS");

		mp.sendMessage(msg);
		JBObjList list = mp.receiveMessageRecordList("EWDOPE");

		if (!list.isEmpty()) {
			String	TableCode = "";
			String  Description = "";
			String	Type = "";
			list.initRow();
			out.println("<table  class=\"tableinfo\"width:95%\" ALIGN=CENTER>");
			out.println("<tr id=\"trdark\">");
			out.println("<th>Codigo de Transaccion</th>");
			out.println("<th>Descripcion</th>");
			out.println("<th>Tipo de Transaccion</th>");
			out.println("</tr>");
			while (list.getNextRow()) {
				msg = (EWD0029DSMessage) list.getRecord();
				TableCode = msg.getEWDTCD().trim();
				Description = "".equals(msg.getEWDITD().trim()) ? "&nbsp;" : msg.getEWDITD().trim();
				Type = "".equals(msg.getEWDTYP().trim()) ? "&nbsp;" : msg.getEWDTYP().trim(); 
				out.println("<tr>");
				out.println("<td><a href=\"javascript:enter('" + TableCode + "')\">" + TableCode + "</a></td>");
				out.println("<td><a href=\"javascript:enter('" + TableCode + "')\">" + Description + "</a></td>");
				out.println("<td><a href=\"javascript:enter('" + TableCode + "')\">" + Type + "</a></td>");
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