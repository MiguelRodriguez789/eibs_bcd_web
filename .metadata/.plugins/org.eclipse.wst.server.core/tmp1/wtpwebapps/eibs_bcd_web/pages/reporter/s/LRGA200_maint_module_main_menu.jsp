<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRG000101"  scope="request" />

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

<script type="text/javascript">
	function enter(){
		if ( document.forms[0].USERID.value.length < 1) {
			alert("Introduzca un usuario Válido");
			document.forms[0].USERID.value='';
			document.forms[0].USERID.focus();
			return false;
		} else {
			showDiv('wait');
			showDiv('busy_wait');
			document.forms[0].submit();
		}
		return true;
	}
</script>

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
<h3 class="h3title">Administraci&oacute;n del Generador de Reportes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="main_menu, LRGA000"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRG0001">

<input type="hidden" name="SCREEN" value="20">
<div style="width:100%;" align="center">
	<div style="width:180px; text-align:left;">
	<h4>Administraci&oacute;n de M&oacute;dulos</h4>	
        <a href="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=35">1. Crear Nuevo M&oacute;dulo</a><br><br>
        <a href="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=20">2. Mantenimiento de M&oacute;dulo</a><br><br>
		<a href="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA000?SCREEN=10">3. Men&uacute; Principal</a><br><br>        
	</div>
</div>
<br><br>
     
</form>
<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>
