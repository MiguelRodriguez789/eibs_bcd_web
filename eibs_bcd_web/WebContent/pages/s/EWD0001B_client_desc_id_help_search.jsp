<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript">

function enterAction(code,desc,id) {
	var form = top.top.opener.document.forms[0];
	
	if(top.top.opener.fieldDesc.trim() !== ""){
		form[top.top.opener.fieldDesc].value = desc;
	 	if (form[top.top.opener.fieldDesc].type !== "hidden") {
			form[top.top.opener.fieldDesc].focus();
		}
		form[top.top.opener.fieldDesc].select();
	}
	if(top.top.opener.fieldId.trim() !== ""){
		form[top.top.opener.fieldId ].value = id;
		if (form[top.top.opener.fieldId].type !== "hidden") {
			form[top.top.opener.fieldId].focus();
		}
		form[top.top.opener.fieldId].select();
	}
	if(top.top.opener.fieldName.trim() !== ""){
		form[top.top.opener.fieldName].value = code;
		if (form[top.top.opener.fieldName].type !== "hidden"){
			form[top.top.opener.fieldName].focus();
		}
		form[top.top.opener.fieldName].select();
	}
	  
	top.close();
}

function enter(){
	var NameSearch = document.forms[0].NameSearch.value;
	var FromRecord = 0
	var CusType = top.top.opener.fieldAux1;
	var Type = getElementChecked("Type").value;

	if (NameSearch.length < 1) {
		NameSearch=".";
	}
	
    if (Type == "N") {
		NameSearch = justifyRight(NameSearch, 20);
	}

    parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "@CusType=" + CusType + "'";
}

function typeClick() {
	document.forms[0].NameSearch.value = "";
	document.forms[0].NameSearch.focus();
}

function enterNameSearch() {
	var value = getElementChecked("Type").value;
	if (value == "N") {
		enterInteger(event);
	}
}


</script>
<META name="GENERATOR" content="IBM WebSphere Studio">
</head>

<body>
<FORM Action="javascript:enter()">

<table id="TBHELP" align="center">
<tr><td nowrap>
<table border="0" bordercolor="Black" cellpadding=0 cellspacing=0><tr><td nowrap>
<table  id="TBHELP" align="center" width="140" border="0" cellspacing="0" cellpadding="0">
<tr>
<th nowrap id="THHELP">Tipo de Busqueda</th>
</tr>
<TR>
<TD nowrap>
<INPUT type="radio" name="Type" value="N" checked onclick="typeClick()">Número</TD>
</TR>
<tr>
<td nowrap>
<input type="radio" name="Type" value="S" onclick="typeClick()">Nombre Corto</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="I" onclick="typeClick()">Identificación</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="W" onclick="typeClick()">Por Palabra</td>
</tr>
</table>
</td></tr>

</table>

</td><td nowrap>
<input type="text" name="NameSearch"  size=25 maxlength="30" onkeypress="enterNameSearch()">
        &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="20"> 
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
