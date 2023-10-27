<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
%>

<title>Poliza de Seguros</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
</head>
<body>

<%
	if (!error.getERRNUM().equals("0")) {
		out.println("<script type=\"text/javascript\">");
		error.setERRNUM("0");
		out.println("showErrors()");
		out.println("</script>");
	}
%>

<h3 align="center">Poliza de Seguros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="PAC_client_enter_search.jsp, ESG0010"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESG0010">
<input type="hidden" name="SCREEN" value="<% if (userPO.getPurpose().equals("MAINTENANCE")) out.print("101"); else out.print("200"); %>">
<br>

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">

	<tr>
		<td align="right" width="50%" nowrap>N&uacute;mero de cliente :&nbsp;</td>
		<td  width="50%">
			<input type="text" name="customer_number" size="10" maxlength="9" value="<%= client %>">
			<a href="javascript: GetCustomerDescId('customer_number', 'customer_name', 'customer_id')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
			<input type="hidden" name="customer_name" value="">
			<input type="hidden" name="customer_id" value="">
		</td>
	</tr>
	<tr>
		<td align="right" width="50%" nowrap>N&uacute;mero de prestamo :&nbsp;</td>
		<td  width="50%">
			<input type="text" name="loan_number" size="14" maxlength="12" onkeypress="enterInteger(event)" value="0">
			<a href="javascript:GetAccount('loan_number','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
		</td>
	</tr>

	<tr><td height="40" colspan="2">&nbsp;</td></tr>
	<tr align="center" >
		<td nowrap colspan="2" align="center">
		<div id="DIVSUBMIT" align="center"><input id="EIBSBTN" type="submit"
			name="Submit" value="Enviar"></div>
		</td>
	</tr>
</table>

</form>
</body>
</html>
 