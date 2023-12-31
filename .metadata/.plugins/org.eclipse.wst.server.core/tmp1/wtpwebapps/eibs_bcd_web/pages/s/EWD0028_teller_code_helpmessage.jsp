<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head><title>Cajeros</title>
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
<h3 align="center">Cajeros</h3>

<%
MessageContext mc = null;
//HttpSession session = request.getSession(true);
MessageRecord newmessage = null;
EWD0014DSMessage m = null;
OutputStream outstream = null;
//** search values
String BankNumber = null;
//** field values
String	CostCenter = null;
String Description = null;
//**utility variables
String marker = null;
boolean close = false;
boolean firsttime = true;


//************* pull search parameters ********
try{BankNumber = request.getParameter("BankNumber");}catch(Exception e){BankNumber = "";}
//***************************************************

//*************open the connection*************
	try	{
		mc = new MessageContext(new MessageProcessor("EWD0014").getMessageHandler());
				      	    
	}catch (Exception e)	{
	  out.println("Connection error " + e);
	}
//***************************************************

//********************** send initial data******
	try	{
		m = (EWD0014DSMessage)mc.getMessageRecord("EWD0014DS");//out.println("message title sent<br>");
	 	m.setEWDSBK(BankNumber.toUpperCase());//out.println("BankNumber field set<br>");
	 	m.send();//out.println("message sent<br>");
	 	m.destroy();//out.println("mesage destroyed<br>");
	 	
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
				if (newmessage.getFormatName().equals("EWD0014DS")) {	
				m = (EWD0014DSMessage) newmessage;//out.println("message cast<br>");
				}	
			}catch(Exception e){
			break;
			}
			
		CostCenter = m.getEWDCCN().trim();if(CostCenter.length() == 0){CostCenter = "&nbsp;";}
		Description = m.getEWDDSC().trim();if(Description.length() == 0){Description = "&nbsp;";}
				
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
			out.println("<table  class=\"tableinfo\"width:95%\" ALIGN=CENTER>");
			out.println("<tr id=\"trdark\">");
			out.println("<th>Centro de Costo</th>");
			out.println("<th>Descripcion</th>");
			out.println("</tr>");
			firsttime = false;
			}

			out.println("<tr>");
			out.println("<td><a href=\"javascript:enter('" + CostCenter + "')\">" + CostCenter + "</a></td>");
			out.println("<td><a href=\"javascript:enter('" + CostCenter + "')\">" + Description + "</a></td>");
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