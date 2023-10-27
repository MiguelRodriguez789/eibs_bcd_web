<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<% 
	String title = "";
	
	if (userPO.getPurpose().equals("MAINTENANCE")) {
	   title="Mantenimiento de ";
	} else if (userPO.getPurpose().equals("PRINT")) {
	   title="Impresión de ";
	} else title = "Consulta de ";
	
	if (userPO.getOption().equals("TAXES")) {
		title = title + "Información Fiscal ";
	} else if (userPO.getOption().equals("PORTAFOLIO")) {
		title = title + "Portafolio ";
	}

	title = title + "de Clientes";
 %>

<script type="text/javascript">

function enterAction(number, name, id){
	document.forms[0].CUSNUM.value = number;
	document.forms[0].IDN.value = id;
	document.forms[0].submit();
}

function enter(NameSearch) {
	var FromRecord = 0;
	var CusType = '<%=request.getParameter("CusType") == null ? "" : request.getParameter("CusType") %>';
	var Type = getElementChecked("Type").value;
	
	if (NameSearch.length > 0) {
    	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "@CusType=" + CusType + "'";

	} else {
		alert("Debe escribir un criterio de busqueda");
	}
}

function searchByName() {
	var NameSearch = document.forms[0].NameSearch.value;
	enter(NameSearch);
}

function searchById() {
	var IDSearch = validateIdSearch();
	if(!isValidObject(IDSearch)){
		return;
	}
	enter(IDSearch);
}

function typeClick(value) {
  	if (value == "I"){
		document.getElementById('DIVNAME').style.display='none' ;
		displayIdDivs(true, document.forms[0].COUNTRY.value);
	} else {
		displayIdDivs(false);
		document.getElementById('DIVNAME').style.display='block' ;
		document.forms[0].NameSearch.value = "";
		document.forms[0].NameSearch.focus();
	}
}

</script>
<TITLE></TITLE>
</head>

<body>

<h3 align="center"><%=title%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_help_search, GENERIC">
</h3>

<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%><%= userPO.getRedirect()%>" target="_parent">
<INPUT TYPE="hidden" NAME="CUSNUM">

<table id="TBHELP" align="center">
<tr><td nowrap>
<table border="0" bordercolor="Black" cellpadding=0 cellspacing=0><tr><td nowrap>
<table  id="TBHELP" align="center" width="140" border="0" cellspacing="0" cellpadding="0">
<tr>
<th nowrap id="THHELP">Tipo de B&uacute;squeda</th>
</tr>
<tr>
<td nowrap>
<input type="radio" name="Type" value="S" checked onclick="typeClick(this.value)">Nombre Corto</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="I" onclick="typeClick(this.value)">Identificaci&oacute;n</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="W" onclick="typeClick(this.value)">Por Palabra</td>
</tr>
</table>
</td></tr>

</table>

</td>
<td nowrap>
	<div id="DIVNAME" style="position:relative; display:block;">
	<input type="text" name="NameSearch"  size=25 maxlength="30">
        &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" onClick="searchByName()" width="25" height="20">
	</div> 
	<jsp:include page="ESD0080_client_id_enter_template.jsp"/>
</td>
</tr>
</table>

  <br/>
<script type="text/javascript">
  document.forms[0].NameSearch.focus();
  
  <%if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");	
%>
            showErrors();
<% } %>
</script>

</form>
</body>
</html>
