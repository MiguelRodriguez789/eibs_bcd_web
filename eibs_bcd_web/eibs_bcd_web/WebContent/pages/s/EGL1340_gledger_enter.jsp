<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Transacciones</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="gLedger" class="datapro.eibs.beans.EGL134001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript">

function CheckNum(){
	if (!isNumeric(document.forms[0].E01GLMGLN.value) || document.forms[0].E01GLMGLN.value == 0) {
		alert("Debe introducir un valor valido de cuenta");
		document.forms[0].E01GLMGLN.value = '';
		document.forms[0].E01GLMGLN.focus();
	} else {
		document.forms[0].submit();
	}
}

</SCRIPT>

<body bgcolor="#FFFFFF">

<H3 align="center">Maestro de Contabilidad General
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="gledger_enter,EGL0340"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

<h4>&nbsp;</h4>
<table class="tbenter" cellspacing=0 cellpadding=2 width="100%"
	border="0">
	<tr>
		<td width="50%">
		<div align="right">Código de Banco :</div>
		</td>
		<td width="50%">
		<div align="left">
			<input type="text" name="E01GLMBNK" onKeypress="enterInteger(event)" size="3" maxlength="2" value="<%= gLedger.getE01GLMBNK().trim()%>">
		</div>
		</td>
	</tr>
	<tr>
		<td width="50%">
		<div align="right">Código de Moneda :</div>
		</td>
		<td width="50%">
		<div align="left">
 			<eibsinput:help name="gLedger" property="E01GLMCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>"fn_param_one="E01GLMCCY" fn_param_two="document.forms[0].E01GLMBNK.value"  />
		</div>
		</td>
	</tr>
	<tr>
		<td width="50%">
		<div align="right">Número de Cuenta Contable :</div>
		</td>
		<td width="50%">
		<div align="left">
 			<eibsinput:help name="gLedger" property="E01GLMGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>"fn_param_one="E01GLMGLN" fn_param_two="document.forms[0].E01GLMBNK.value" fn_param_three="document.forms[0].E01GLMCCY.value"  />
		</div>
		</td>
	</tr>
</table>

<br>
<div align="center">
	<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="CheckNum()">
</div>

<script type="text/javascript">
  document.forms[0].E01GLMBNK.focus();
  document.forms[0].E01GLMBNK.select();
</script> <% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT> <%
 } %>
 
</form>
</body>
</html>
