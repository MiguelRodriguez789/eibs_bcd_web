<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ECO025001Message" scope="session" />

<title>Pago Aportes a Empleadores</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

  function validar(){
	  if (trim(document.forms[0].E01SELNUM.value)=="" ){
	  	alert("Debe ingresar un numero de planilla a buscar");
	  	document.forms[0].E01SELNUM.focus();
	  	return false;
	  }
	  return true;  	
  }

</script>

  
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

<h3 align="center">Pago de Aportes a Empleadores<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="covenant_pay_commission_search.jsp, ECO0250"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0250" onsubmit="return validar();">
<input type="hidden" name="SCREEN" value="200">
<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="center" colspan="2" >
			<table id="TBHELPN" border="0" align="center">
				<tr>
					<td align="right" nowrap>Numero Planilla :</td>
					<td align="center" nowrap>&nbsp;</td>
					<td nowrap align="left">
			 			<eibsinput:help name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" property="E01SELNUM" 
			 				help="<%= HelpTypes.CONVENANT_FORM %>" fn_param_one="E01SELNUM" fn_param_two="E01SELRCY"  required="true"/>
					</td>					
				</tr>
				<tr>
					<td align="right" nowrap>Moneda :</td>
					<td align="center" nowrap>&nbsp;</td>
					<td nowrap align="left">
						<eibsinput:help name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" property="E01SELRCY" fn_param_one="E01SELRCY" />
					</td>					
				</tr>
			</table>
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
