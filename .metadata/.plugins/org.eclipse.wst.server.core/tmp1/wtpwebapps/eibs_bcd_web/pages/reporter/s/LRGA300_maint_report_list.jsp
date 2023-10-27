<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import = "java.util.Iterator, com.datapro.eibs.reporter.model.ReportDTO" %>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA30002" scope="request" />

<html>
<head>

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
	
	function editReport(id) {
		location.href='<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA300?SCREEN=32&ID_REP=' + id; 
	}
	
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
<h3 class="h3title">Mantenimiento de Reportes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="maint_report_list, LRGA300"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA300">

<input type="hidden" name="SCREEN" value="31">
<div style="width:100%;" align="center">
<table class="table_enter" width="580" border="0">
    <tr>
     <td nowrap align="right" width="220">
     Propietario :&nbsp;
     </td>
      <td nowrap  width="360"> 
        <INPUT type="text" name="textSearch" size="33" maxlength="30" value="<%=msg.getTextSearch()%>">
        <input type="hidden" name="name">
        <a href="javascript:GetLRGUser('textSearch', 'name', document.forms[0].textSearch.value)">
        <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
      </td>
    </tr>       
  </table>
</div>  
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color: #fff">		
  	<tr>
  		<td width="100%" align="center">
     		<input id="EIBSBTN" type="button" name="Submit1" value="Enviar" onclick="javascript:enter();">
     		&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="EIBSBTN" type="button" name="Submit2" value="Retornar" onclick="javascript:goAction(10);">
  		</td>  		
  	</tr>	
</table>	
<br><br>     
<%
	int ix = 0;
	String val = "";
	if (msg.getReportList()!=null)
	{
	%>
	<div style="width: 100%;" align="center" class="dataContent">
		<display:table name="requestScope.msg.reportList" uid="result" pagesize="30"
		requestURI="" style="width:100%;" class="dataTable" export="false" >
		<%
			ix = 0;
		%>
			<display:column title="C&oacute;digo" class="r" >
			<a href="javascript:void(0)" onclick="editReport('${result.ID_REP}');return false;">
				<c:out value="${result.ID_REP}"/>
			</a>
			</display:column>
			<display:column title="Descripci&oacute;n" class="l">
			<a href="javascript:void(0)" onclick="editReport('${result.ID_REP}');return false;">
				<%= ( (ReportDTO) pageContext.getAttribute("result")).getRPTDSC() %>			
			</a>
			</display:column>
			<display:column title="P&uacute;blico" class="c">
			<a href="javascript:void(0)" onclick="editReport('${result.ID_REP}');return false;">
				<%
					val = ( (ReportDTO) pageContext.getAttribute("result")).getPUBREP(); 
					if (val.equals("0")) out.write("No");
					else out.write("Si");
				%>
			</a>
			</display:column>
			<display:column title="Activo" class="c">
			<a href="javascript:void(0)" onclick="editReport('${result.ID_REP}');return false;">
				<c:if test="${result.ACTIVE=='0'}">No</c:if>
				<c:if test="${result.ACTIVE=='1'}">Si</c:if>
			</a>
			</display:column>
			<display:column title="Creado el" class="c">
			<a href="javascript:void(0)" onclick="editReport('${result.ID_REP}');return false;">
				<fmt:formatDate pattern="dd-MM-yyyy" value="${result.CREADT}"></fmt:formatDate>
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
