<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<title>Credilinea</title>
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
	userPO.setHeader1("MENU");
%>


<h3 align="center">Aumento/Disminucion Credilinea<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="incre_enter.jsp, EPV0153"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0153DADC">
	<input type="hidden" name="SCREEN" value="800">
	<input type="hidden" name="opt" value="2">
<br>

<table id="TBHELPN" width="100%" border="0" cellspacing="0"
	cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="right" width="50%" nowrap>N&uacute;mero de Credilineas :&nbsp;</td>
		<td  width="50%">
              <input type="text" name="E05DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)" onchange="submitForm();">
              <a href="javascript:GetAccountInfo('E05DEAACC','','L2','','','','','', 'E05DEAPRO')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
			  <input type="hidden" name="E05DEAPRO" size="5" maxlength="4">
	</tr>
	<tr><td height="40" colspan="2">&nbsp;</td></tr>
	<tr align="center" >
		<td nowrap colspan="2" align="center">
		<div id="DIVSUBMIT" align="center"><input id="EIBSBTN" type="submit" name="Submit" value="Enviar" ></div>
		</td>
	</tr>
</table>

</form>
</body>
<script type="text/javascript">
function submitForm(){
	document.forms[0].submit();
}
</script>
</html>
 