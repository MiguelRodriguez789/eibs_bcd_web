<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript">

function enterAction(code,desc,id) {
	var form = top.top.opener.document.forms[0];
	var fieldName = top.top.opener.fieldName; 
	var fieldAux1 = top.top.opener.fieldAux1;
	var fieldAux2 = top.top.opener.fieldAux2;
	
	if(isValidObject(form[fieldName])){
		setField(form[fieldName], code);		
		form[fieldName].select();
	}
	if(isValidObject(form[fieldAux1])){
		setField(form[fieldAux1], desc);		
	}
	if(isValidObject(form[fieldAux2])){
		setField(form[fieldAux2], desc);		
	} 
	top.close();
}

function enter() {
	var NameSearch = document.forms[0].NameSearch.value;
	var FromRecord = 0;
	var Type = getElementChecked("Type").value;

	if (NameSearch.length > 0 || Type == "S" ) {
	    
		parent.parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0430?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "'";

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
                  <th nowrap id="THHELP">Tipo de Búsqueda</th>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="S" checked>
                    Nombre </td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="U">
                    Usuario</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="W">
                    Por Palabra</td>
</tr>
<tr>

</table>
</td></tr>

</table>

</td><td nowrap>
<input type="text" name="NameSearch"  size=25 maxlength="30">
        &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="21"> 
      </td>
    </tr>
</table>
<hr>

<script type="text/javascript">
  document.forms[0].NameSearch.focus();
</script>

</form>
</body>
</html>
