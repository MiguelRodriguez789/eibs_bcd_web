 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<style>
TH {
  background: #FFFFFF;
}
</style>
<script type="text/javascript">
	function enter(){
		var pos = document.forms[0].Pos.value;
		var DESCRIPTION = document.forms[0].DESCRIPTION.value;
		var ISINNUM = document.forms[0].ISINNUM.value;
		var SYMBOL = document.forms[0].SYMBOL.value;
		var CUSIP = document.forms[0].CUSIP.value;
		parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0308F?DESCRIPTION=" +
 		DESCRIPTION + "@ISINNUM=" + ISINNUM + "@SYMBOL=" + SYMBOL + "@CUSIP=" + CUSIP +  "@Pos=" + pos + "'";
	}
 
</script>
</head>

<body>
<FORM Action="javascript:enter()">

  <table id="tbhelp" align="center" width="556" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td align="center"><b>Búsqueda de Instrumentos</b></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td align="left"><b>Buscar por : </b></td>
    </tr>    
    <tr> 
      <td align="right">Descripción de Instrumento : </td>
      <td>
      <input type="text" name="DESCRIPTION" size="40" maxlength="40">
        <input type="hidden" name="Pos">
        <img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()">
      </td>
     </tr>
     <tr>
      <td align="right">Número de ISIN : </td>
      <td>
      <input type="text" name="ISINNUM" size="37" maxlength="14"> 
      </td>
     </tr>
     <tr>
      <td align="right">Simbolo : 
      </td>
      <td>
      <input type="text" name="SYMBOL"  size=12 maxlength="14"> 
      </td>
     </tr>
     <tr>
      <td align="right">CUSIP : 
      </td>
      <td>
      <input type="text" name="CUSIP"  size=15 maxlength="15" >
      </td>
    </tr>

  </table>
  
<script type="text/javascript">
  document.forms[0].DESCRIPTION.focus();
  document.forms[0].ISINNUM.focus();
</script>
  
</form>
</body>
</html>

 