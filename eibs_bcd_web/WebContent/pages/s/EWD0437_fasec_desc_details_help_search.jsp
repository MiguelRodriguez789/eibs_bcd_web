<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript">

function enterAction(code,desc,id,f4,f5,f6,f7,f8) {
	var form = top.top.opener.document.forms[0];
	
	if(top.top.opener.fieldName !== ""){
		form[top.top.opener.fieldName].value = code;
		if (form[top.top.opener.fieldName].type !== "hidden"){
			form[top.top.opener.fieldName].focus();
		}
		form[top.top.opener.fieldName].select();
	}
	if(top.top.opener.fieldAux1 !== ""){
		form[top.top.opener.fieldAux1].value = desc;
	}
	if(top.top.opener.fieldAux2 !== ""){
		form[top.top.opener.fieldAux2].value = id;
	} 
	if(top.top.opener.fieldAux3 !== ""){
		form[top.top.opener.fieldAux3].value = f8;
	} 
	top.close();
}

function enter() {
	var NameSearch = document.forms[0].NameSearch.value;
	var FromRecord = 0;
	var Type = getElementChecked("Type").value;
	var Model = document.forms[0].MODELO.value;
	if (NameSearch.length > 0 || Type == "S" ) {
	    if (Type == "I") {
			NameSearch = validateId(NameSearch, <%=currUser.getE01INT()%>);
			if (NameSearch == 0) {
				alert("!! Error: El Identificador no es valido. !!");
				return;
			}	
		}

		parent.parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0437?NameSearch=" + NameSearch + "@Type=" + Type +"@Model=" + Model + "@FromRecord=" + FromRecord + "'";

	} else {
		alert("Campo no puede ser blanco");
	}
}

</script>
<TITLE></TITLE>
</head>

<body>
<FORM Action="javascript:enter()">

<table id="TBHELP" align="center">
<tr><td nowrap>
<table border="0" bordercolor="Black" cellpadding=0 cellspacing=0><tr><td nowrap>
<table  id="TBHELP" align="center" width="140" border="0" cellspacing="0" cellpadding="0">
<tr>
                  <th nowrap id="THHELP">Búsqueda Codigo FASECOLDA</th>
</tr>
<tr>
<td nowrap>
Modelo&nbsp;&nbsp;<input type="text" name="MODELO" size="5" maxlength="4" value="" onKeyPress="enterInteger()"  />

</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="T" checked>
                    Tipo de Vehículo</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="S" >
                    Buscar por Marca Vehículo</td>
</tr>
</table>
</td></tr>

</table>

</td><td nowrap>
<BR><BR><input type="text" name="NameSearch"  size=25 maxlength="30">
        &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="21"> 
      </td>
    </tr>
</table>
<hr>

<script language="JavaScript">
  document.forms[0].MODELO.focus();
</script>

</form>
</body>
</html>
