<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 

<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>Mantenimiento de Reservas</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id="gaMant" class="datapro.eibs.beans.ERA007501Message"  scope="session"/>
<jsp:useBean id="currClient" class="datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	boolean isAdmon = false;
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String opecod = "";
	String purpose = "";
	String title = "";
	// OPECOD
	opecod = "0004";
	if (request.getParameter("OPECOD") != null) {
		opecod = request.getParameter("OPECOD").trim();
		if (opecod.equals("0009")||opecod.equals("0010")) {
			opecod = "0009";
			isAdmon = true;
		}
	}
	// PURPOSE
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		purpose = "MAINTENANCE";
	} else {
		purpose = "INQUIRY";
	}
	// TITLE
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		title = "Mantenimiento";
	} else if (userPO.getPurpose().equals("INQUIRY")) { 
		title = "Consulta";
	} else {
		title = "Creación";
	}
	if (isAdmon) {
		title = title.trim() + " de Administracion de Fondos";
	} else {
		title = title.trim() + " de Reservas";
	}
%>

<body bgcolor="#FFFFFF">

<% 
	if ( !error.getERRNUM().equals("0")  ) {
	  error.setERRNUM("0");
	  out.println("<SCRIPT Language=\"Javascript\">");
	  out.println("       showErrors()");
	  out.println("</SCRIPT>");
	}
%>

<h3 align="center">
<%=title%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ERA0075_reserva_FNG_enter.jsp"></h3>
<hr>
<form METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0075" >
	<center>
	<input TYPE=HIDDEN NAME="SCREEN" VALUE="102">
	<input TYPE=HIDDEN NAME="E01RESCUN" VALUE="0">
	<input TYPE=HIDDEN NAME="OPECOD" VALUE="<%=opecod%>">
	<input TYPE=HIDDEN NAME="PURPOSE" VALUE="<%=purpose%>">
	
	<table cellspacing="0" cellpadding="2" class="tbenter" border=0   width=70% align="center" height="80%">
		<tr valign="middle"><td nowrap colspan="2" align="justify" height="120">&nbsp;</td></tr>
		<tr valign="middle"> 
			<td nowrap width=40% align="right" height="17" >Ingrese el N&uacute;mero de Reserva :</td>
			<td nowrap width=40% align="left" height="17" > 
				<input type=TEXT name="E01RESNRE" value="<%= gaMant.getE01RESNRA() %>" size=13 maxlength=12>
				<a href="javascript:GetReserva('E01RESNRE','','RS','<%=client%>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a>&nbsp; 
			</td>
		</tr>
<%-- 
		<tr valign="middle"> 
			<td nowrap width=40% align="right" height="17" >Número de Cliente para Reserva Nueva :</td>
			<td nowrap width=40% align="left" height="17" > 
				<input type="text" name="E01RESCUN" id="E01RESCUN" size="11" maxlength="9" value="<%=gaMant.getE01RESCUN().trim()%>">
				<a href="javascript:GetCustomerDetails2('E01RESCUN','E01CUSNA1','E01CUSIDN','D01CUSTID')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				<input type="text" name="E01CUSNA1" readonly size="45" maxlength="45" readonly value="<%=gaMant.getE01CUSNA1().trim()%>">
			</td>
		</tr>
--%>
		<tr> 
			<td nowrap colspan="2" valign="middle" height="120"> 
				<p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
			</td>
		</tr>
		<tr> 
			<td nowrap colspan="2" valign="middle">&nbsp;</td>
		</tr>
	</table>
	</CENTER>

	<script type="text/javascript">
		document.forms[0].E01RESNRE.focus();
	</script>

</form>

</BODY>
</HTML>
 