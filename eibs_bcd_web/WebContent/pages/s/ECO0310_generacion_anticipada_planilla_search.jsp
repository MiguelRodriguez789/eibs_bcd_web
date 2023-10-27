<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Generacio Anticipada de Planillas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ECO031001Message" scope="session" />

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

<h3 align="center">Generacion Anticipada de Planillas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="generacion_anticipada_search.jsp, ECO0310"></h3>
<hr size="4">
    <p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>

<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0310">
<input type="hidden" name="SCREEN" value="200">
<input type=HIDDEN name="E01COTDES" value=" ">

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="center" colspan="2" >
			<table id="TBHELPN" border="0" align="center">
			    <tr>
			      <td width="50%"> 
			        <div align="right">Codigo de Convenio : </div>
			      </td>
			      <td width="50%"> 
			        <div align="left"> 
			          <input type="text" name="E01SELCDE" size="5" maxlength="4" value="<%= cnvObj.getE01SELCDE().trim()%>">
			            <a href="javascript:GetCodeDescDeal('E01SELCDE','E01COTDES')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
			          <input type="hidden" name="E01COTDES">
			        </div>
			      </td>
			    </tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>	
	<tr align="center">
		<td nowrap colspan="2" align="center">
		<div id="DIVSUBMIT" align="center"><input id="EIBSBTN" type="submit"
			name="Submit" value="Enviar"></div>
		</td>
	</tr>
</table>

</form>
</body>
</html>
