<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA21003" scope="request" />

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
<link type="text/css" href="${pageContext.request.contextPath}/pages/css/smoothness/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

<script type="text/javascript">

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
<h3 class="h3title">Columnas Disponibles<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="available_columns_list, LRGA210"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA210">

<input type="hidden" name="SCREEN" value="31">
<input type="hidden" name="tables" value="<%=msg.getStrTables()%>">


<div style="width:100%;" align="center">
	<table class="table_enter" width="580" border="0">
    <tr>
     <td nowrap align="right" width="220">
     Tabla :&nbsp;
     </td>
      <td nowrap  width="360"> 
		<select id="idTableSelect" name="searchTable">
		<option>--seleccione--</option>
		<%
		if (msg.getTableNameList()!=null)
		{
		%>
		<c:forEach var="result" items="${requestScope.msg.tableNameList}">
			<option value="<c:out value='${result}'/>" <c:if test="${result == requestScope.msg.searchTable}">selected</c:if>><c:out value='${result}'/></option>
		</c:forEach>
		<% } %>
		</select>
		&nbsp;
		<input type="button" value="Consultar" onclick="goAction(31);">
      </td>
    </tr>       
  	</table>
</div>  

<br>

</form>


<%
	int ix = 0;
	String val = "";
	if (msg.getColumnList()!=null)
	{
%>	
	<div style="width: 100%;" align="center" class="dataContent">
		<display:table name="requestScope.msg.columnList" uid="result" pagesize="50"
		requestURI="" style="width:100%;" class="dataTable" export="false" >
		<%
			ix = 0;
		%>
			<display:column title="Columna" class="l" >
			<a href="javascript:void(0)" onclick="setData('${requestScope.msg.searchTable}','${result.COLUMN_NAME}', '<c:out value="${fn:trim(result.REMARKS)}"/>', '${result.TYPE_NAME}');return false;">
				<c:out value="${result.COLUMN_NAME}"/>
			</a>
			</display:column>
			<display:column title="Tipo de Dato" class="l">
			<a href="javascript:void(0)" onclick="setData('${requestScope.msg.searchTable}','${result.COLUMN_NAME}', '<c:out value="${fn:trim(result.REMARKS)}"/>', '${result.TYPE_NAME}');return false;">
				<c:out value="${result.TYPE_NAME}"/>			
			</a>
			</display:column>
 			<display:column title="Observaciones" class="l">
			<a href="javascript:void(0)" onclick="setData('${requestScope.msg.searchTable}','${result.COLUMN_NAME}', '<c:out value="${fn:trim(result.REMARKS)}"/>', '${result.TYPE_NAME}');return false;">
				<c:out value="${fn:trim(result.REMARKS)}"/>
			</a>
			</display:column>
			
			<%
				ix = ix + 1;
			%>

	</display:table></div>
	<% } %>

<script type="text/javascript">

	function goAction(val) {
		showDiv('wait');
		showDiv('busy_wait');
		document.forms[0].SCREEN.value = val;	
		document.forms[0].submit();
	}

	function setData(tab, col, rem, typ) {
		var valPut = tab + '.' + col;
		$('#idFldDsc', top.opener.document).val(valPut);
		$('#idFldLbl', top.opener.document).val(rem);
		
		if (typ.indexOf('CHAR') != -1)
			$('#idDatTyp', top.opener.document).val('CHAR');
		else if (typ.indexOf('DEC') != -1)
			$('#idDatTyp', top.opener.document).val('DECIMAL');
		else
			$('#idDatTyp', top.opener.document).val('PLAIN_NUMBER');					
		
		window.close();
	}
	
	function cancel() {
		window.close();
	}
</script>

<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>
