<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRG000101"  scope="request" />

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

</head>
<body>
<% 
if (!error.getERRNUM().equals("0")){
	error.setERRNUM("0");
	out.println("<script type=\"text/javascript\">");
    out.println("showErrors();");
	out.println("</script>");
}
%>
<h3 class="h3title">Administraci&oacute;n del Generador de Reportes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="maint_report_main_menu, LRGA300"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRG0001">

<input type="hidden" name="SCREEN">
<div style="width:100%;" align="center">
	<div style="width:180px; text-align:left;">
	<h4>Administraci&oacute;n de Reportes</h4>	
        <a href="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA300?SCREEN=20">1. Reasignaci&oacute;n de Reportes</a><br><br>
        <a href="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA300?SCREEN=30">2. Mantenimiento de Reportes</a><br><br>
		<a href="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA000?SCREEN=10">3. Men&uacute; Principal</a><br><br>        
	</div>
</div>
<br><br>

</form>
<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>
