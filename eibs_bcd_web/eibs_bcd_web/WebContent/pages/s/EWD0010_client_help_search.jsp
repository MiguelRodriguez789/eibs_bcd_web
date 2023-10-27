<html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<script type="text/javascript">
function enter() {
	var Bank = top.top.opener.Bank;
	var Currency = top.top.opener.Currency;
	var AppCode = top.top.opener.AppCode;
	var NameSearch = document.forms[0].NameSearch.value;
	var AccType = top.top.opener.AccType;
	var FromRecord = 0;

	if(window.top.opener.jQuery){
		window.top.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
	}
	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0010?NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrCurrency=" + Currency +  "@shrType=" + AccType + "'";
}
</script>
</head>

<body>

<FORM Action="javascript:enter()">
  <table id="tbhelp" align="center" width="510" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center"><b>Plan Contable</b></td>
    </tr>
    <tr> 
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td align="center">N&uacute;mero Inicial:&nbsp; 
        <input type="text" name="NameSearch" size=16 onkeypress="enterInteger(event)" size="30" maxlength="16">
        &nbsp;&nbsp;<img id="HELP" src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="21" > 
      </td>
    </tr>
  </table>
</form>
<script type="text/javascript">
  document.forms[0].NameSearch.focus();
  clickElementID("HELP");
    
defer(function(){ return typeof $.fn.pressEnter !== 'undefined'},
	function(){
		$(document).pressEnter(function(evt){
			enter();
		});
	});  
  
</script>
</body>
</html>
