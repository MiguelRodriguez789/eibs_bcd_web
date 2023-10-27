<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript">
<% 
	String CusType = "A";
%>
function enterAction(code,desc,id, tid) {
	var form = top.top.opener.document.forms[0];
	
	if(typeof top.top.opener.fieldDesc != 'undefined' && top.top.opener.fieldDesc.trim() !== ""){
		form[top.top.opener.fieldDesc].value = desc;
	 	if (form[top.top.opener.fieldDesc].type !== "hidden") {
			form[top.top.opener.fieldDesc].focus();
		}
		if(form[top.opener.fieldDesc].onchange){
			form[top.opener.fieldDesc].onchange();
		}
		form[top.top.opener.fieldDesc].select();
	}
	if(typeof top.top.opener.fieldId != 'undefined' && top.top.opener.fieldId.trim() !== ""){
		form[top.top.opener.fieldId ].value = id;
		if (form[top.top.opener.fieldId].type !== "hidden") {
			form[top.top.opener.fieldId].focus();
		}
		if(form[top.opener.fieldId].onchange){
			form[top.opener.fieldId].onchange();
		}
		form[top.top.opener.fieldId].select();
	}
	if(typeof top.top.opener.fieldName != 'undefined' &&  top.top.opener.fieldName.trim() !== ""){
		form[top.top.opener.fieldName].value = code;
		if (form[top.top.opener.fieldName].type !== "hidden"){
			form[top.top.opener.fieldName].focus();
		}
		if(form[top.opener.fieldName].onchange){
			form[top.opener.fieldName].onchange();
		}
		form[top.top.opener.fieldName].select();
	}
	
	if(typeof top.top.opener.fieldAux1 != 'undefined' &&  top.top.opener.fieldAux1.trim() !== ""){
  		setField(form[top.top.opener.fieldAux1], tid);
  		selectField(form[top.top.opener.fieldAux1]);
	}	
	top.close();
}

function enter(NameSearch) {
	var FromRecord = 0;
	var CusType = getElementChecked("CusType").value;
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
<META name="GENERATOR" content="IBM WebSphere Studio">
</head>

<body>
<FORM Action="javascript:enter()">
<INPUT TYPE=HIDDEN NAME="CusType" value="A" > 

<table id="TBHELP" align="center">
<tr><td nowrap>
<table border="0" bordercolor="Black" cellpadding=0 cellspacing=0><tr><td nowrap>
	<table  id="TBHELP" align="left" width="140" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th nowrap id="THHELP">Tipo de B&uacute;squeda</th>
		</tr>
		<td>
			<table id="TBHELP" align="center">
			<tr>
				<td nowrap>
				<p>
				<input type="radio" name="CusType" value="A" <%if (CusType.equals("A")){out.print(" checked");} %> />Clientes / Prospectos
				<input type="radio" name="CusType" value="E" <%if (CusType.equals("E")){out.print(" checked");} %> />Entidades
				</p>
				</td>	 
			</tr>
			</table>
		</td>
		<td>
		<table id="TBHELP" align="center">
		<tr>
			<td nowrap><input type="radio" name="Type" value="S" checked onclick="typeClick(this.value)">Nombre Corto</td>
		</tr>
		<tr>
			<td nowrap><input type="radio" name="Type" value="I" onclick="typeClick(this.value)">Identificaci&oacute;n</td>
		</tr>
		<tr>
			<td nowrap><input type="radio" name="Type" value="W" onclick="typeClick(this.value)">Por Palabra</td>
		</tr>
		</table>
		</td>
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
	<jsp:include page="ESD1080_client_id_enter_template.jsp"/>
</td>
</tr>
</table>
  <hr align="center" width="90%">
</form>
<script type="text/javascript">
  document.forms[0].NameSearch.focus();
</script>

</body>
</html>
