<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript">
function enter(){
var Bank = top.top.opener.Bank;
var Currency = top.top.opener.Currency;
var AppCode = top.top.opener.AppCode;
var NameSearch = document.forms[0].NameSearch.value;
var FromRecord = 0;

parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0405?NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrCurrency=" + Currency + "'";

}
</script>
</head>

<body>
<FORM Action="javascript:enter()">
  <table id="tbhelp" align="center" width="510" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center"><b>Cuentas en Amortizaci�n</b></td>
    </tr>
    <tr> 
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td align="center">N�mero de Cuenta Inicial : 
        <input type="text" name="NameSearch" size=12>
			<img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="21" > 
      </td>
    </tr>
  </table>
</form>
<script type="text/javascript">
  document.forms[0].NameSearch.focus();
</script>
</body>
</html>
