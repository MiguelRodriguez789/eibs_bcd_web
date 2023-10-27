<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Verificar Biometria Cuentas Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
	function CheckNum(){
		if (!isNumeric(document.forms[0].E01CABCUN.value)) {
			alert("Por favor, ingrese un número de cliente válido.");
			document.forms[0].E01CABCUN.value = '';
			document.forms[0].E01CABCUN.focus();
		} else {
			document.forms[0].submit();
		}
	}

</SCRIPT>
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
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

<h3 align="center">Verificar Biometria Cuentas Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="biometric_account_enter.jsp, EDD8000"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDD8002" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
	
	<table class="tbenter" height="75%" width="100%" border="0">
		<tr>
			<td nowrap align="center">
				<div>
					Número de Cliente : 
					<input type="text" name="E01CABCUN" size="10" maxlength="9" value="<%= client %>" onKeyPress="enterInteger(event)">
					<a href="javascript:GetCustomerDescId('E01CABCUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				</div>
			</td>
		</tr>
	</table>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" OnClick="CheckNum()" value="Enviar">
	</div>

	<script type="text/javascript">
		document.forms[0].E01CABCUN.focus();
	</script>

</form>
</body>
</html>
 