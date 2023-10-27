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
		showDiv('wait');
		showDiv('busy_wait');
		document.forms[0].submit();
		return true;
	}
	
	function GetLRGUser(code, name, pattern) {
		page = "<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA300?SCREEN=500";
		fieldName=code;
		fieldAux1=name;
		CenterWindow(page,500,450,3);
	}	
</script>

</head>
<body onload="document.forms[0].fromUser.focus();">
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
    out.println("alert('La operación se ha realizado con éxito.');");
	out.println("</script>");
}
%>
<h3 class="h3title">Reasignaci&oacute;n de Reportes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reassign_reports, LRGA300"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA300">

<input type="hidden" name="SCREEN" value="21">
<table class="tbenter"  width="100%" border="0">
    <tr> 
      <td nowrap align="right" width="50%"> 
        De Usuario : 
       </td>
       <td nowrap width="50%">
        <INPUT type="text" name="fromUser" size="16" maxlength="15" value="">
        <INPUT type="hidden" name="name"> 
        <a href="javascript:GetLRGUser('fromUser', 'name', document.forms[0].fromUser.value)">
        <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
      </td>
    </tr>
    <tr> 
      <td nowrap align="right"> 
        A Usuario :
       </td>
       <td nowrap>         
        <INPUT type="text" name="toUser" size="16" maxlength="15" value="">
        <INPUT type="hidden" name="name1"> 
        <a href="javascript:GetLRGUser('toUser', 'name1', document.forms[0].toUser.value)">
        <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
      </td>
    </tr>       
  </table>
<br><br>
	<p align="center">             
    <input id="EIBSBTN" type=button name="Submit" value="Enviar" onclick="enter()" style="z-index: -1;">
   		&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="EIBSBTN" type="button" name="Submit2" value="Retornar" onclick="javascript:goAction(10);">    
    </p>
      
</form>
<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>
