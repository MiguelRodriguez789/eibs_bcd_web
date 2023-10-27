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
	function GetLRGUser(code, name, pattern) {
		page = "<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRG0001?SCREEN=500";
		fieldName=code;
		fieldAux1=name;
		CenterWindow(page,500,450,3);
	}	
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
	function goAction(val) {
		showDiv('wait');
		showDiv('busy_wait');
		document.forms[0].action = '<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA000';
		document.forms[0].SCREEN.value = val;	
		document.forms[0].submit();
	}	
</script>

</head>
<body onload="document.forms[0].USERID.focus();">
<% 
if (!error.getERRNUM().equals("0")){
	error.setERRNUM("0");
	out.println("<script type=\"text/javascript\">");
    out.println("showErrors();");
	out.println("</script>");
}
%>
<h3 class="h3title">Acceso al Generador de Reportes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="select_user, LRG0001"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRG0001">

<input type="hidden" name="SCREEN" value="20">
<table class="tbenter"  width="100%" border="0">
    <tr> 
      <td nowrap ALIGN=CENTER> 
        Usuario : 
        <INPUT type="text" name="USERID" size="16" maxlength="15" value="<%= (request.getAttribute("userID")!=null)?(String) request.getAttribute("userID"):""%>">
        <INPUT type="hidden" name="name"> 
        <%-- <a href="javascript:GetUserRegistry('<%=request.getContextPath()%>', 'USERID', 'name', document.forms[0].USERID.value)"> --%>
        <a href="javascript:GetLRGUser('USERID', 'name', document.forms[0].USERID.value)">
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
