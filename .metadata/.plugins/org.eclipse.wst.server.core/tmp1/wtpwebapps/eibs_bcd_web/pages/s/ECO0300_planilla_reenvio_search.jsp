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
<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ECO030001Message" scope="session" />

<title>Reenvio Planillas</title>
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

<h3 align="center">Reenvio de Planillas por Interface<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="planilla_reenvio_search.jsp, ECO0300"></h3>
<hr size="4">
    <p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>

<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0300" >
	<input type="hidden" name="SCREEN" value="200">

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="center" colspan="2" >
			<table id="TBHELPN" border="0" align="center">
				<tr>
					<td align="right" nowrap>Codigo de Convenio:</td>
					<td align="center" nowrap>&nbsp;</td>
					<td nowrap align="left">
			          <input type="text" name="E01SELCDE" size="5" maxlength="4" value="<%= cnvObj.getE01SELCDE().trim()%>">
			            <a href="javascript:GetCodeDescDeal('E01SELCDE',' ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
					</td>					
				</tr>
			</table>
		</td>
	</tr>
	<tr><td height="40" colspan="2">&nbsp;</td></tr>	
	<tr align="center">
		<td nowrap colspan="2" align="center">
		<div id="DIVSUBMIT" align="center">
			<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
		</div>
		</td>
	</tr>
</table>

</form>
</body>
</html>
