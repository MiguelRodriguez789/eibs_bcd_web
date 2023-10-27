<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
	function enterAction(code, desc, id) {
		var form = top.opener.document.forms[0];
	   	if (isValidObject(form[top.opener.fieldName])) {
	   		form[top.opener.fieldName].value = code;
	   	}
  		if (isValidObject(form[top.opener.fieldDesc])) {
  			form[top.opener.fieldDesc].value = desc;
  		}
  		if (isValidObject(form[top.opener.fieldId])) {
  			form[top.opener.fieldId].value = id;
  		}
  
		top.close();
 	}

	function enter(){
		var NameSearch = document.forms[0].NameSearch.value;
		var FromRecord = 0;
		if (NameSearch.length > 0){
			var Type = getElementChecked("Type").value;
    		parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "'";

		} else {
			alert("Field can not be blank");
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
                  <th nowrap id="THHELP"> Búsqueda por : </th>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="S" checked>
                    Nombre Corto</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="I">
                    Identificación</td>
</tr>
<tr>
<td nowrap><input type="radio" name="Type" value="W">
                    Por Palabras</td>
</tr>
</table>
</td></tr>

</table>

</td><td nowrap>
<input type="text" name="NameSearch"  size=14>
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
