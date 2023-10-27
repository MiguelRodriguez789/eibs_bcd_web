<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import = "java.util.Iterator, com.datapro.eibs.reporter.model.DBTableDTO" %>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA21001" scope="request" />

<html>
<head>

<style type="text/css">
.btnTable {
	width:120px;
}
</style>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

<script type="text/javascript">
	function GetLRGUser(code, name, pattern) {
		page = "<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA300?SCREEN=500";
		fieldName=code;
		fieldAux1=name;
		CenterWindow(page,500,450,3);
	}	

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
	
	function selectTable(name) {
		if (! $('#selectedTablesList #' + name, top.frames['results'].document).length) {
			$('#selectedTablesList', top.frames['results'].document).append('<li id="' + name + '"><input type="button" style="width:120px;" class="tableButton" value="'+name+'"></li>');
		}
		$('#'+name).attr("disabled", "disabled");
	}
</script>

</head>
<body onload="document.forms[0].textSearch.focus();">
<% 
if (!error.getERRNUM().equals("0")){
	error.setERRNUM("0");
	out.println("<script type=\"text/javascript\">");
    out.println("showErrors('"+request.getContextPath()+"/pages/s/');");
	out.println("</script>");
}
%>
<h3 class="h3title">Tablas en el Schema<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="schema_tables_list, LRGA210"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA210">

<input type="hidden" name="SCREEN" value="11">

<div style="width:100%;" align="center">
<table class="table_enter" width="580" border="0">
    <tr>
     <td nowrap align="right" width="220">
     B&uacute;squeda :&nbsp;
     </td>
      <td nowrap  width="360"> 
        <input type="text" name="textSearch" size="33" maxlength="30" value="<%=msg.getTextSearch()%>">&nbsp;
        <a href="javascript:void(0)" onclick="enter();">
        	<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" width="25" height="20" border="0">
        </a> 
      </td>
    </tr>       
  </table>
</div>  

<br><br>     
<%
	String val = "";
	if (msg.getTables()!=null)
	{
	%>
	
	<table width="100%" class="actionButtons">
	<tr>
	<c:set var="i" value="0" scope="page"/>
	<c:forEach var="result" items="${requestScope.msg.tables}">
		<c:set var="i" value="${ i + 1}" scope="page"/>
		<td><input type="button" id="<c:out value='${result.TABLE_NAME}'/>" value="<c:out value='${result.TABLE_NAME}'/>" class="btnTable" onclick="selectTable('<c:out value='${result.TABLE_NAME}'/>');"></td>
		<c:if test="${i == 6}">
		 <c:set var="i" value="0" scope="page"/>
		 <c:out value="</tr><tr>" escapeXml="false" />
		</c:if>
	</c:forEach>
	
	
	</tr>
	</table>
	
	<c:if test="${i == 0 }">
		<h3>No se ha encontrado resultados para su criterio de b&uacute;squeda.</h3>
	</c:if>
	<%	} 	%>
</form>
<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>
