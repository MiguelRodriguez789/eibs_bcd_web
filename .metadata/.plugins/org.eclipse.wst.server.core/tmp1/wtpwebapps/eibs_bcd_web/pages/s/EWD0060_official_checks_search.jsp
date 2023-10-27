
<!DOCTYPE html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT type="text/javascript">
	function enter() {
		var NameSearch = document.forms[0].NameSearch.value;
		var FromRecord = 0;
		var sType = top.top.opener.fieldAux1 == null ? "" : top.top.opener.fieldAux1;
		var sccy = top.top.opener.Currency == null ? "" : top.top.opener.Currency;
		var ssel = top.top.opener.Selection == null ? "" : top.top.opener.Selection;
		if (NameSearch.length > 0) {
    		parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0060?NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@Type=" + sType + "@Ccy=" + sccy + "@Sel=" + ssel + "'";
		} else {
			alert("Un carácter válido debe ser tecleado")
		}
	}
</SCRIPT>
</HEAD>
<BODY>
<FORM Action="javascript:enter()">
	
  <TABLE  id="tbhelp" align="center" width="447" border="0" cellspacing="0" cellpadding="0">
    <TR> 
      <Td align="CENTER"><b>Busqueda de Cheques Oficiales</b></Td>
    </TR>
    <TR>
      <TD align="CENTER">&nbsp;</TD>
    </TR>
    <TR> 
      <TD align="CENTER"> Ingrese Nombre Corto : 
        <INPUT type="text" name="NameSearch" size=14>
        &nbsp;&nbsp;<IMG src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="21"> 
      </TD>
    </TR>
  </TABLE>
  <br>

<script type="text/javascript">
  document.forms[0].NameSearch.focus();
</script>

</FORM>
</BODY>
</HTML>
