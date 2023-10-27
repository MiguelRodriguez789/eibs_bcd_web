<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 

<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>Renovacion/Prorroga de Garantias</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "gaMant" class= "datapro.eibs.beans.ERA007501Message"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
%>

<body bgcolor="#FFFFFF">

 <% if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %>

<h3 align="center">
<%
	if (userPO.getPurpose().equals("MAINTENANCE")) {
%>
Mantenimiento de Renovacion/Prorroga Reservas FNG
<%
	}else{
%>
Consulta de Renovacion/Prorroga de Reservas FNG
<%
	}
%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ERA0075_reserva_FNG_enter.jsp"></h3>
<hr>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0075" >
	<CENTER>
    	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="102">
<%
	if (userPO.getPurpose().equals("MAINTENANCE")) {
%>
    	<INPUT TYPE=HIDDEN NAME="OPECOD" VALUE="0007">
    	<INPUT TYPE=HIDDEN NAME="PURPOSE" VALUE="MAINTENANCE">
<%
	}else{
%>
    	<INPUT TYPE=HIDDEN NAME="OPECOD" VALUE="0005">
    	<INPUT TYPE=HIDDEN NAME="PURPOSE" VALUE="INQUIRY">
<%
	}
%>
    	<table cellspacing="0" cellpadding="2" class="tbenter" border=0   width=70% align="center" height="80%">
      		<tr valign="middle"> 
        		<td nowrap colspan="2" align="justify" height="120">&nbsp;</td>
      		</tr>
      		<tr valign="middle"> 
        		<td nowrap width=40% align="right" height="17" >Ingrese el N&uacute;mero de Reserva FNG :</td>
        		<td nowrap width=40% align="left" height="17" > 
          			<input type=TEXT name="E01RESNRE" value="<%= gaMant.getE01RESNRA() %>" size=13 maxlength=12>
          			<a href="javascript:GetReserva('E01RESNRE','','RS','<%=client%>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
          			&nbsp; 
          		</td>
      		</tr>
      		<tr> 
        		<td nowrap colspan="2" valign="middle" height="120"> 
          			<p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
        		</td>
      		</tr>
      		<tr> 
        		<td nowrap colspan="2" valign="middle">&nbsp;</td>
      		</tr>
    	</table>
		<script type="text/javascript">
  			document.forms[0].E01RESNRE.focus();
		</script>
  	</CENTER>
</FORM>

</BODY>
</HTML>
 