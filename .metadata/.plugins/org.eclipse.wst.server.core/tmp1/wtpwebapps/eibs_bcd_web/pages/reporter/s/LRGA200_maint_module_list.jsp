<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.util.Iterator, com.datapro.eibs.reporter.model.ModuleDTO" %>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA20001" scope="request" />

<html>
<head>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

<script type="text/javascript">
	function enter(){
		if ( document.forms[0].textSearch.value.length < 1) {
			alert("Introduzca un valor");
			document.forms[0].textSearch.value='';
			document.forms[0].textSearch.focus();
			return false;
		} else {
			showDiv('wait');
			showDiv('busy_wait');
			document.forms[0].submit();
		}
		return true;
	}
	
	function editModule(idmod) {
		location.href='<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=30&ID_MOD=' + idmod; 
	}

	$(document).ready(function(){
		if ($('#searchByNumber').is(':checked')) {
			$('#textSearchID').keypress(enterInteger);
		} else {
			$('#textSearchID').unbind("keypress");
		}

	$('#searchByNumber').click(function() {
		$('#textSearchID').val('');
		$('#textSearchID').unbind("keypress");
	});
	$('#searchByDescription').click( function() {
		$('#textSearchID').val('');
		$('#textSearchID').unbind("keypress");
	});	
});
	
	
</script>

</head>
<body onload="document.forms[0].textSearch.focus();">
<% 
if (!error.getERRNUM().equals("0")){
	error.setERRNUM("0");
	out.println("<script type=\"text/javascript\">");
    out.println("showErrors();");
	out.println("</script>");
}
%>
<h3 class="h3title">Mantenimiento de M&oacute;dulos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="maint_module_list, LRGA200"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA200">

<input type="hidden" name="SCREEN" value="21">
<div style="width:100%;" align="center">
<table class="table_enter" width="720" border="0">
    <tr>
     <td nowrap align="right" width="220">
     B&uacute;squeda por :&nbsp;
     </td>
     <td nowrap width="140">
     <input type="radio" id="searchByNumber" name="searchBy" value="N" <%= !msg.getSearchBy().equals("A") ? "checked" : "" %>> N&uacute;mero<br>
     <input type="radio" id="searchByDescription" name="searchBy" value="A" <%= msg.getSearchBy().equals("A") ? "checked" : "" %>> Descripci&oacute;n<br>
     </td>     
      <td nowrap  width="360"> 
        <INPUT type="text" id="textSearchID" name="textSearch" size="33" maxlength="30" value="<%=msg.getTextSearch()%>">
        <a href="javascript:GetUserRegistry('<%=request.getContextPath()%>', 'USERID', 'name', document.forms[0].USERID.value)">
	        <img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onclick="enter()" width="25" height="20" border="0">
        </a> 
      </td>
    </tr>       
  </table>
</div>  
<br><br>
	<p align="center">             
	<input id="EIBSBTN" type="button" name="Submit2" value="Retornar" onclick="javascript:goAction(10);">    
    </p>
     
<%
	int ix = 0;
	String val = "";
	if (msg.getModuleList()!=null)
	{
	%>
	<div style="width: 100%;" align="center" class="dataContent">
		<display:table name="requestScope.msg.moduleList" uid="result" pagesize="30"
		requestURI="" style="width:100%;" class="dataTable" export="false" >
		<%
			ix = 0;
		%>
			<display:column title="C&oacute;digo" class="r" >
			<a href="/showModuleMenu.do?id_mod=0&sid=<%=session.getId()%>">
				<c:out value="${result.ID_MOD}"/>
			</a>
			</display:column>
			<display:column title="Descripci&oacute;n" class="l">
			<a href="#" onclick="editModule('${result.ID_MOD}');return false;">
				<%= ( (ModuleDTO) pageContext.getAttribute("result")).getMODDSC() %>			
			</a>
			</display:column>
<%-- 		<display:column title="P&uacute;blico" class="c">
			<a href="/showModuleMenu.do?id_mod=0&sid=<%=session.getId()%>">
				<%
					val = ( (ModuleDTO) pageContext.getAttribute("result")).getPUBMOD(); 
					if (val.equals("0")) out.write("No");
					else out.write("Si");
				%>
			</a>
			</display:column>
--%>			
			<display:column title="Activo" class="c">
			<a href="/showModuleMenu.do?id_mod=0&sid=<%=session.getId()%>">
				<c:if test="${result.ACTIVE=='0'}">No</c:if>
				<c:if test="${result.ACTIVE=='1'}">Si</c:if>
			</a>
			</display:column>
			<%
				ix = ix + 1;
			%>

	</display:table></div>
	<% } %>
</form>
<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>
