<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD108001Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript">
<% 
	String CusType = "A";
%>
function enterAction(code,desc,id, tid) {
	var form = document.forms[0];
	
	if(typeof fieldDesc != 'undefined' && fieldDesc.trim() !== ""){
		form[fieldDesc].value = desc;
	 	if (form[fieldDesc].type !== "hidden") {
			form[fieldDesc].focus();
		}
		if(form[fieldDesc].onchange){
			form[fieldDesc].onchange();
		}
		form[fieldDesc].select();
	}
	if(typeof fieldId != 'undefined' && fieldId.trim() !== ""){
		form[fieldId ].value = id;
		if (form[fieldId].type !== "hidden") {
			form[fieldId].focus();
		}
		if(form[fieldId].onchange){
			form[fieldId].onchange();
		}
		form[fieldId].select();
	}
	if(typeof fieldName != 'undefined' &&  fieldName.trim() !== ""){
		form[fieldName].value = code;
		if (form[fieldName].type !== "hidden"){
			form[fieldName].focus();
		}
		if(form[fieldName].onchange){
			form[fieldName].onchange();
		}
		form[fieldName].select();
	}
	
	if(typeof fieldAux1 != 'undefined' &&  fieldAux1.trim() !== ""){
  		setField(form[fieldAux1], tid);
  		selectField(form[fieldAux1]);
	}	
	// top.close();
	goAction(code,desc,id);
}

function goAction(code,desc,id) {
 		var form = document.forms[0];
 		var CusType = getElementChecked("CusType").value;
 		if (CusType == "E") { 
 			document.forms[0].SCREEN.value = '28';
 		}
 		form["E01CUN"].value = code;
 		form["E01IDN"].value = id;
 		form.submit();
	}
function enter(NameSearch) {
	var FromRecord = 0;
	var CusType = getElementChecked("CusType").value;
	var Type = getElementChecked("Type").value;
	
	if (NameSearch.length > 0) {
		if (Type !=  "C") {
    		parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "@CusType=" + CusType + "'";
    	} else {
    		goAction(NameSearch, "", "");
    	}	

	} else {
		alert("Debe escribir un criterio de busqueda");
	}
}

function searchByName() {
	var NameSearch = document.forms[0].NameSearch.value;
	enter(NameSearch);
}
function searchByCode() {
	var CodeSearch = document.forms[0].CodeSearch.value;
	if (CodeSearch == 0) {
		alert("Valor debe ser diferente de cero");
		return;
	}
	enter(CodeSearch);
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
		document.getElementById('DIVCODE').style.display='none' ;
		displayIdDivs(true, document.forms[0].COUNTRY.value);
	} else if (value == "C"){
		displayIdDivs(false);
		document.getElementById('DIVNAME').style.display='none' ;
		document.getElementById('DIVCODE').style.display='block' ;
		document.forms[0].CodeSearch.value = "0";
		document.forms[0].CodeSearch.focus();
	} else {
		displayIdDivs(false);
		document.getElementById('DIVNAME').style.display='block' ;
		document.getElementById('DIVCODE').style.display='none' ;
		document.forms[0].NameSearch.value = "";
		document.forms[0].NameSearch.focus();
	}
}


</script>
<META name="GENERATOR" content="IBM WebSphere Studio">
</head>

<body>
<h3 align="center">Consulta de Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_inq_enter_search, ESD1080"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?OPE=<%=userPO.getSource()%>" target="_parent" onsubmit="return (enterRUT());">
  <CENTER>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">
  <input type="hidden" name="E01CUN" value="<%= client.getE01CUN() %>" >
  <input type="hidden" name="E01IDN" value="<%= client.getE01IDN() %>" >
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
		<tr>
			<td nowrap><input type="radio" name="Type" value="C" onclick="typeClick(this.value)">Código Cliente</td>
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

<td nowrap>
	<div id="DIVCODE" style="position:relative; display:none;">
	<input type="text" name="CodeSearch"  size=12 maxlength="9" onClick="enterInteger(event)">
        &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/ico3.gif" onClick="searchByCode()" width="25" height="20">
	</div> 
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