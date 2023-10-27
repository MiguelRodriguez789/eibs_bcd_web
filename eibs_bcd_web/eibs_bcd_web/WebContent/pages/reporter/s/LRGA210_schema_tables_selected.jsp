<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<style type="text/css">
#navcontainer ul
{
margin: 0;
padding: 0;
list-style-type: none;
text-align: left;
}

#navcontainer ul li { display: inline; }

#navcontainer ul li a
{
text-decoration: none;
padding: .2em 1em;
color: #fff;
background-color: #036;
}

#navcontainer ul li a:hover
{
color: #fff;
background-color: #369;
}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/jquery-1.6.1.min.js"></script>
<script type="text/javascript">
$('.tableButton').on('click', function() {
	var id = $(this).attr('value'); 
	$(this).parent().remove();
	if ( $('#' + id, top.frames['query'].document).length) {
		$('#' + id,  top.frames['query'].document).removeAttr("disabled");
	}
	return false;
});

$(document).ready(function() {
	$('#btnReset').click(function() {
		$('#selectedTablesList').empty();
		$('.btnTable',  top.frames['query'].document).removeAttr("disabled");
	});
	
	$('#btnSend').click(function() {
		var tableList = '';
		var len = $('#selectedTablesList li').length; 
		$('#selectedTablesList li').each(function(index) {
			tableList += $(this).attr('id');
			if (index < len - 1) {
				tableList += ', ';
			}
		});	

		$('#idEntStr', top.opener.document).val(tableList);
		top.close();
	});
});	
</script>
</head>
<body>
<h5>Tablas seleccionadas</h5>
<table width="800" class="actionButtons">
<tr>
	<td width="720" valign="top">
	<div id="navcontainer">
	<ul id="selectedTablesList"></ul>
	</div>
	</td>
	<td width="80" valign="top">
	<div align="center">
	<input type="button" class="EIBSBTN" id="btnSend" value="Enviar" style="width:70px;">
	<input type="button" class="EIBSBTN" id="btnReset" value="Limpiar" style="width:70px;">
	</div>
	</td>
</tr>
</table>
</body>
</html>