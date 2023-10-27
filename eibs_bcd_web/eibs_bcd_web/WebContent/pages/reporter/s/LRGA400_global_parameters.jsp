<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ page import = "java.util.Iterator, com.datapro.eibs.reporter.model.GlbprmDTO" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA40001" scope="request" />

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

<script type="text/javascript">
	function mainMenu() {
		document.forms[0].action = '<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA000?SCREEN=10';	
		document.forms[0].submit();
	}
</script>

</head>

<%
	GlbprmDTO params = new GlbprmDTO();
	if (msg.getParams() != null)
		params = msg.getParams();
%>

<body onload="document.forms[0].MAXRWS.focus();">
<% 
if (!error.getERRNUM().equals("0")){
	error.setERRNUM("0");
	out.println("<script type=\"text/javascript\">");
    out.println("showErrors();");
	out.println("</script>");
}
if (error.getERWRNG() != null && error.getERWRNG().equals("K")) {
	error.setERWRNG("");
	out.println("<script type=\"text/javascript\">");
    out.println("alert('Actualización exitosa.');");
	out.println("</script>");
}
%>
<h3 class="h3title">Par&aacute;metros Generales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="global_parameters, LRGA400"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA400">

<input type="hidden" name="SCREEN">

  <h4>Par&aacute;metros</h4>
    <div align="left">
      
    <table class="tableinfo" >
      <tr > 
          <td nowrap align="center">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="25%"> 
                  <div align="right">M&aacute;ximo de filas por reporte :</div>
                </td>
                <td nowrap colspan=3> 
                  <input type="text" name="MAXRWS" size="7" maxlength="5" value="<%= params.getMAXRWS()%>" onkeypress="enterInteger(event)">&nbsp;
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
   </div>
<br>

<table border="0" cellspacing="0" cellpadding="0" class="actionButtons">		
  	<tr>
  		<td width="100%" align="center">
     		<input id="EIBSBTN" type="button" name="Submit1" value="Enviar" onclick="goAction(11);">
     		&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="EIBSBTN" type="button" name="Submit2" value="Retornar" onclick="mainMenu();">
  		</td>  		
  	</tr>	
</table>	
<br>
</form>
<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>