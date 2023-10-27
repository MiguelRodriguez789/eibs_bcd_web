<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA30090"  scope="request" />

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
	
	function selectField(field){
		try {
			field.focus();
			field.select();
		} catch (e){
		}	
	}

	function setField(field, value){
		try {
			field.value = value;
			field.onchange();
		} catch(e) {
		}
	}

	function assign(code, desc) {
		var form = top.opener.document.forms[0];
		
		setField(form[top.opener.fieldName], code);
		setField(form[top.opener.fieldAux1], desc);
		
		if (form[top.opener.fieldName].type != "hidden") {
			selectField(form[top.opener.fieldName]);
		} else {
			selectField(form[top.opener.fieldAux1]);
		}  		
		top.close();
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
<h3 class="h3title">B&uacute;squeda de Usuarios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="search_user_help, LRG0001"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRG0001">

<input type="hidden" name="SCREEN" value="501">
<table class="tbenter"  width="100%" border="0">
    <tr> 
      <td nowrap ALIGN=left> 
        <b>B&uacute;squeda R&aacute;pida :</b> 
        <INPUT type="text" name="textSearch" size="13" maxlength="10" value="<%= (msg.getTextSearch()!=null)?(String) msg.getTextSearch():""%>">
        <INPUT type="hidden" name="name">
         <a href="#" onclick="enter();">
			<img src="<%=request.getContextPath()%>/images/search1.gif" align="absbottom" border="0"></a>
      </td>
    </tr>
  </table>
<br><br>
</form>


<%
	String val = "";
	if (msg.getUserList()!=null)
	{
	%>
	<div style="width: 100%;" align="center" class="dataContent">
		<display:table name="requestScope.msg.userList" uid="result" pagesize="30"
		requestURI="" style="width:100%;" class="dataTable" export="false" >

			<display:column title="C&oacute;digo" class="l" >
				<a href="#" onclick="assign('${result.userCode}', '${result.totalReports}');">
					<c:out value="${result.userCode}"/>
				</a>
			</display:column>
			<display:column title="Descripci&oacute;n" class="l">
			<a href="#" onclick="assign('${result.userCode}', '${result.totalReports}');">
				<c:out value="${result.userName}"/>			
			</a>
			</display:column>
			<% if (msg.getUsersWithReportsOnly().equals("1")) { %>
			<display:column title="Autoridad" class="c">
			<a href="#" onclick="assign('${result.userCode}', '${result.totalReports}');">
				<c:out value="${result.authority}"/>			
			</a>
			</display:column>
			<% } %>			
	</display:table></div>
	<% } %>

<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>
