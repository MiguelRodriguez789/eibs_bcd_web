<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA21002" scope="request" />

<html>
<head>

<style type="text/css">
.btnTable {
	width:120px;
}
</style>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/pages/css/smoothness/jquery-ui-1.8.13.custom.css" rel="stylesheet" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
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
<h3 class="h3title">Relaciones entre las tablas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="relationship_list, LRGA210"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA210">

<input type="hidden" name="SCREEN" value="21">

<br>

<table border="0" cellspacing="0" cellpadding="0" class="actionButtons">		
  	<tr>
  		<td width="100%" align="center">
     		<input id="EIBSBTN" type="button" name="Submit1" value="Enviar" onclick="send();">
     		&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="EIBSBTN" type="button" name="Submit2" value="Cancelar" onclick="cancel();">
  		</td>  		
  	</tr>	
</table>	
<br>
<table width="710" id="RelTable">
<tbody>
<tr id="-1"><td align="center" width="50">Elim.</td><td width="130">Tabla A</td><td width="150">Columna A</td><td width="50"></td><td width="130">Tabla B</td><td width="150">Columna B</td><td align="center" width="50">M&aacute;s</td></tr>
<c:set var="idx" value="0" />
<tr id="${idx}" class="trRel">
	<td align="center"><span id="delRelIco_${idx}" class="ui-icon ui-icon-close"></span></td>
	<td>
		<select id="idTableSelectA_${idx}" name="tableNameA">
		<option>--seleccione--</option>
		<%
		if (msg.getTableNameList()!=null)
		{
		%>
		<c:forEach var="result" items="${requestScope.msg.tableNameList}">
			<option value="<c:out value='${result}'/>"><c:out value='${result}'/></option>
		</c:forEach>
		<% } %>
		</select>
	</td>
	<td>
		<select id="idColumnSelectA_${idx}" name="columnNameA">
		<option>--Seleccione--</option>
		</select>
	</td>
	<td align="center">=</td>
	<td>
		<select id="idTableSelectB_${idx}" name="tableNameB">
		<option>--seleccione--</option>
		<%
		if (msg.getTableNameList()!=null)
		{
		%>
		<c:forEach var="result" items="${requestScope.msg.tableNameList}">
			<option value="<c:out value='${result}'/>"><c:out value='${result}'/></option>
		</c:forEach>
		<% } %>
		</select>
	</td>
	<td>
		<select id="idColumnSelectB_${idx}" name="columnNameB">
		<option>--Seleccione--</option>
		</select>
	</td>
	<td align="center"><span id="addRelIco_${idx}" class="ui-icon ui-icon-plus"></span></td>
</tr>
</tbody>
</table>


</form>


<script type="text/javascript">
	$(document).ready(function() {
		$('select[id^="idTableSelect"]').change(function(){
			$tableName = $(this).val();
			var id = $(this).attr('id');
			var idx = $(this).parent().parent().attr('id');
			var selector = '';
			$.post("<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA210?SCREEN=21", {tableName:$tableName}, function(data) {
				if (id.substring(0,14) == 'idTableSelectA')
					selector = 'idColumnSelectA_' + idx;
				else
					selector = 'idColumnSelectB_' + idx;
				//$(selector).empty().append(data);
				var arrData = eval(data);
				var select = document.getElementById(selector);
				select.options.length = 0;
				select.options.add(new Option('--seleccione--', ''));
				for (var i=0; i<arrData.length; i++) {
					var d = arrData[i];
					select.options.add(new Option(d.text, d.value));
				}
			});
		});
		
		loadAddRelationshipBehavior();

	});
	
	function loadAddRelationshipBehavior()
	{
		var idx = 0;
		var newidx = 0;
	    $('span[id^="addRelIco_"]').click(function() {
	    		  idx = $('#RelTable tbody>tr:last').attr('id');
	    		  newidx = parseInt(idx,10) + parseInt(1,10);
	    	      $('#RelTable tbody>tr:last').clone(true).insertAfter('#RelTable tbody>tr:last');
	    	      $('#RelTable tbody>tr:last').attr('id', newidx);
				 
				  $('#RelTable tbody>tr:last select[name=columnNameA]').empty().append('<option value="">--seleccione--</option>');
				  $('#RelTable tbody>tr:last select[name=columnNameB]').empty().append('<option value="">--seleccione--</option>');
				  
	    	      $('#RelTable tbody>tr:last select[name=tableNameA]').attr('id', 'idTableSelectA_' + newidx);
	    	      $('#RelTable tbody>tr:last select[name=columnNameA]').attr('id', 'idColumnSelectA_' + newidx);
	    	      $('#RelTable tbody>tr:last select[name=tableNameB]').attr('id', 'idTableSelectB_' + newidx);
	    	      $('#RelTable tbody>tr:last select[name=columnNameB]').attr('id', 'idColumnSelectB_' + newidx);
	    	      return false;
	    	    });
	    	    
	    $("span[id^='delRelIco_']").click(function() {
	      $(this).parent().parent().remove();
	   	  return false;
	     });    
	
	}
	
	function send() {
		var relations = '';
		var len = $('#RelTable tr.trRel').length;
		$('#RelTable tr.trRel').each( function(index) {
			relations += $(this).find('select[id^="idTableSelectA_"]').val() + '.' + $(this).find('select[id^="idColumnSelectA_"]').val();
			relations += ' = ' +  $(this).find('select[id^="idTableSelectB_"]').val() + '.' + $(this).find('select[id^="idColumnSelectB_"]').val();
			if (index < len - 1) {
				relations += ' AND ';
			}
		});	
		$('#idRelStr', top.opener.document).val(relations);
		window.close();
	}
	
	function cancel() {
		window.close();
	}
</script>

<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>
