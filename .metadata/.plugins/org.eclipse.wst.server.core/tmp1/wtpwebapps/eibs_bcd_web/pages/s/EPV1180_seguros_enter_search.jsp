<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV118001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<title>Seguros</title>
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

<h3 align="center">Seguros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="seguros_enter_search.jsp,EPV1180"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180">
<input type="hidden" name="SCREEN" value="101">

<input type=HIDDEN name="E01UBK"  value="<%= currUser.getE01UBK().trim()%>">
<br>

<table id="TBHELPN" width="100%" border="0" cellspacing="0"
	cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="right" width="50%" nowrap>N&uacute;mero de cliente :&nbsp;</td>
		<td  width="50%">
			<eibsinput:help name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01PSGCUN" 
				fn_param_one="E01PSGCUN" fn_param_two="" fn_param_three="E01PSGCUN"   />
		</td>
	</tr>
	<tr>
		<td align="right" width="50%" nowrap>N&uacute;mero Propuesta :&nbsp;</td>
		<td  width="50%">
 			<eibsinput:help name="datarec" property="E01PSGNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>"fn_param_one="E01PSGNUM" fn_param_two="document.forms[0].E01UBK.value" fn_param_three="RT" required="false" />
		</td>
	</tr>
</table>

  <p align="center">
  	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>

</form>
</body>
</html>
 