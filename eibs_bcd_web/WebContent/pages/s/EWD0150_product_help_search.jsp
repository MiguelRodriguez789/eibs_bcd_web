<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>
<style>
TH {
  background: #FFFFFF;
}
</style>
<script type="text/javascript">
function enter() {
    var AppCode = getElement("AppCode").value;
	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0150?dlt=N@AppCode="+AppCode+"'";
}

function GetProductTypes() {
	GetXMLResponse('<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0150?SCREEN=2', selectCallback, false);
}

</script>
</head>

<body>
<FORM Action="javascript:enter()">

  <table id="tbhelp" align="center" width="556" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td align="center"><b>B&uacute;squeda de Productos</b></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td align="center">Por favor seleccione el tipo de producto:&nbsp; 
        <select id="AppCode" name="AppCode">
        </select>
	</td>
    </tr>
  </table>
  
<script type="text/javascript">
	getElement("AppCode").focus();
	GetProductTypes();
</script>
  
</form>
</body>
</html>
