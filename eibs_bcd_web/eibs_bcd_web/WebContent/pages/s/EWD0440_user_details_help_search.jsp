<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="JavaScript">
function enter(){
var NameSearch = document.forms[0].NameSearch.value;
var FromRecord = 0;

	if (NameSearch.length > 0){
		for(var i = 0; i < document.forms[0].Type.length; i++) {
			if (document.forms[0].Type[i].checked){
			var Type = document.forms[0].Type[i].value;
			}
 		}

    parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0440?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord +  "'";

	}
	else{
		alert("Campo no puede ser blanco");
	}
}

</script>
<TITLE></TITLE>
</head>

<body>
<FORM Action="javascript:enter()">
 <INPUT TYPE=HIDDEN NAME="COUNTRY" VALUE="">
<table id="TBHELP" align="center">
<tr><td nowrap>
<table border="0" bordercolor="Black" cellpadding=0 cellspacing=0><tr><td nowrap>
<table  id="TBHELP" align="center" width="140" border="0" cellspacing="0" cellpadding="0">
<tr>
                  <th nowrap id="THHELP">Tipo de B�squeda</th>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="I">
                    Identificaci�n</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="W" checked>
                    Por Nombre</td>
</tr>
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

<script language="JavaScript">
  document.forms[0].NameSearch.focus();
</script>

</form>
</body>
</html>
