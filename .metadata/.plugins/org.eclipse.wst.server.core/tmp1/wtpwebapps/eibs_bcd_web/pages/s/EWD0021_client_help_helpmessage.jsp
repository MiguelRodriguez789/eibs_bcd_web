<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head><title>Localidades de Activos Fijos</title>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*" %>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
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
MessageContext mc = null;
MessageRecord newmessage = null;
EWD0021DSMessage m = null;
OutputStream outstream = null;
//** field values
String Num = null;
String Name = null;
//**utility variables
String marker = null;
boolean firsttime = true;

out.println("<center><font><b>Busqueda de Localidades de los Activos fijos en el Sistema<b></font></font></center>");

//*************open the connection*************
	try	{
		mc = new MessageContext(new MessageProcessor("EWD0021").getMessageHandler());
				      	    
	}catch (Exception e)	{
	  out.println("Connection error " + e);
	}
//***************************************************

//********************** send initial data******
	try	{
		m = (EWD0021DSMessage)mc.getMessageRecord("EWD0021DS");//out.println("message title sent<br>");
		m.send();//out.println("message sent<br>");
	 	m.destroy();//out.println("message destroyed<br>");
	 	
	}catch (Exception e)	{
	  e.printStackTrace();
	  out.println("Send Client Header Information error " + e);
	}
//**************************************************


//*************receive message************

	try	{
		
		while(true) {	
			try{//out.println("message requested<br>");
			newmessage = mc.receiveMessage();//out.println("message received<br>");
				if (newmessage.getFormatName().equals("EWD0021DS")) {	
				m = (EWD0021DSMessage) newmessage;//out.println("message cast<br>");
				}	
			}catch(Exception e){
			break;
			}
			
		Num = m.getEWDNUM().trim();
		Name = m.getEWDNME().trim();if(Name.length() == 0){Name="&nbsp;";}
						
		try{
		marker = m.getEWDOPE().trim();
		}catch(Exception e){
		marker = "*";
		}

			if(marker.equals("*") ){
			out.println("</table>");
			break;
			}		
			
			if(firsttime == true){
			out.println("<table  class=\"tableinfo\"style=\"width:95%\" ALIGN=CENTER>");
			out.println("<tr id=\"trdark\">");
			out.println("<th>Nombre</th>");
			out.println("<th>Numero</th>");
			out.println("</tr>");
			firsttime = false;
			}

			out.println("<tr>");
			out.println("<td><a href=\"javascript:enter('" + Num + "')\">" + Num + "</a></td>");
			out.println("<td><a href=\"javascript:enter('" + Num + "')\">" + Name + "</a></td>");
			out.println("</tr>");		

		
	}// close while loop
		

//************* close the connection************
	}catch (Exception e)	{
	out.println("Read error " + e);
	}	
	
	try	{
	  mc.close();
	}catch (Exception e) {
	  out.println("Error closing socket connection " + e);
	}
	


%>
</body>
</html>