<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>SubCuentas</title>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*" %>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>
<script type="text/javascript">
function enter(code) {
	var formLength = top.opener.document.forms[0].elements.length;
	for (n=0;n<formLength;n++) {
		var elementName= top.opener.document.forms[0].elements[n].name;
		if(elementName == top.opener.fieldName){
  			top.opener.document.forms[0].elements[n].value = code;
  			break;
		}
 	}
	top.close();
 }
</script>
</head>
<body>
<%
MessageProcessor mp = null;
//HttpSession session = request.getSession(true);
//** search values
String BankNumber = null;
//** field values
String	Currency = null;
String ExchangeRate = null;
String	Description = null;
//**utility variables
boolean firsttime = true;

out.println("<center><font><b>Busqueda de SubCuentas en el Sistema<b></font></font></center>");

//************* pull search parameters ********
	try {
		BankNumber = request.getParameter("BankNumber").trim();
	} catch (Exception e) {
		BankNumber = "";
	}
//***************************************************

//*************open the connection*************
	try	{
 		mp = new MessageProcessor("EWD0002");
				      	    
//***************************************************

//********************** send initial data******
		EWD0012DSMessage m = (EWD0012DSMessage) mp.getMessageRecord("EWD0012DS");//out.println("message title sent<br>");
	 	m.setEWDSHR(BankNumber.toUpperCase());//out.println("BankNumber field set<br>");
	 	mp.sendMessage(m);
	 	
//**************************************************


//*************receive message************
		JBObjList list = mp.receiveMessageRecordList("EWDOPE");
		
		if (!list.isEmpty()) {
			list.initRow();
			while (list.getNextRow()) {	
				m = (EWD0012DSMessage) list.getRecord();
			
				Currency = m.getEWDCCY().trim();
				ExchangeRate = m.getEWDEXR().trim();
				Description = m.getEWDDSC().trim();
				
				if (firsttime) {
					out.println("<table  class=\"tableinfo\"style=\"width:95%\" ALIGN=CENTER>");
					out.println("<tr id=\"trdark\">");
					out.println("<th>Moneda</th>");
					out.println("<th>tasa de Cambio</th>");
					out.println("<th>Descripcion</th>");
					out.println("</tr>");
					firsttime = false;
				}

				out.println("<tr>");
				out.println("<td><a href=\"javascript:enter('" + Currency + "')\">" + Currency + "</a></td>");
				out.println("<td><a href=\"javascript:enter('" + Currency + "')\">" + ExchangeRate + "</a></td>");
				out.println("<td><a href=\"javascript:enter('" + Currency + "')\">" + Description + "</a></td>");
				out.println("</tr>");		

			}// close while loop
		}// close if
		

//************* close the connection************
	} finally {
		if (mp != null) mp.close();
	}

%>
</body>
</html>