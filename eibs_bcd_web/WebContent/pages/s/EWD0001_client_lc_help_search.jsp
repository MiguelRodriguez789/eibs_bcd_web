<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript">
function enter() {
	var NameSearch = document.forms[0].NameSearch.value;
	var FromRecord = 0;
	var CusType = top.top.opener.fieldAux9;
	var Type = getElementChecked("Type").value;
	
	if (NameSearch.length > 0) {
		
    	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001D_LC?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "@CusType=" + CusType + "'";
	} else {
		alert("Campo no puede ser blanco");
	}
}

function typeClick() {
	document.forms[0].NameSearch.value = "";
	document.forms[0].NameSearch.focus();
}
</script>
<TITLE></TITLE>
</head>

<body>
<FORM Action="javascript:enter()">
	<table id="TBHELP" align="center">
		<tr>
			<td nowrap>
				<table border="0" bordercolor="Black" cellpadding=0 cellspacing=0>
					<tr>
						<td nowrap>
							<table  id="TBHELP" align="center" width="140" border="0" cellspacing="0" cellpadding="0">
								<tr>
                  					<th nowrap id="THHELP">Tipo de Búsqueda</th>
								</tr>
								<tr>
									<td nowrap><input type="radio" name="Type" value="S" checked onclick="typeClick()">Nombre Corto</td>
								</tr>
								<tr>
									<td nowrap><input type="radio" name="Type" value="I" onclick="typeClick()">Identificación</td>
								</tr>
								<tr>
									<td nowrap><input type="radio" name="Type" value="W" onclick="typeClick()">Por Palabra</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td nowrap>
				<input type="text" name="NameSearch"  size=25 maxlength="30">&nbsp;&nbsp;
        			<img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="21"> 
      		</td>
    	</tr>
	</table>
<br>

<script type="text/javascript">
  document.forms[0].NameSearch.focus();
</script>

</form>
</body>
</html>
