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

parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0308I?DESCRIPTION=" + DESCRIPTION +"@Pos=" + pos + "'";
}
 
</script>
</head>

<body>
<FORM Action="javascript:enter()">

  <table id="tbhelp" align="center" width="556" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td align="center"><b>Instrument Search</b></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td align="center">Enter the Instrument Description : <input type="text" name="DESCRIPTION" size="40" maxlength="40">
        <input type="hidden" name="Pos">
        <img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()"></td>
        
    </tr>
  </table>
  
<script type="text/javascript">
  document.forms[0].DESCRIPTION.focus();
</script>
  
</form>
</body>
</html>
