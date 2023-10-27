
<!DOCTYPE html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
function enter(){
	var AppCode = top.top.opener.AppCode;
	var Bank = top.top.opener.Bank;
	var Selection = top.top.opener.Selection;
	//var NameSearch = document.forms[0].NameSearch.value
	var CUN = document.forms[0].CUN.value;
	var FromRecord = 0;

    parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0146?CUN=" + CUN + "'";
}


</SCRIPT>
</HEAD>
<BODY>
<FORM Action="javascript:enter()">
	
  <TABLE  id="tbhelp" align="center" width="447" border="0" cellspacing="0" cellpadding="0">
    <TR>
		<TD align="CENTER" colspan="3"><B>Busqueda de Planillas</B></TD>
	</TR>
    <TR>
		<TD align="CENTER" colspan="3">&nbsp;</TD>
	</TR>
    <TR>
		<TD align="RIGHT" colspan="2">Numero de Cliente : </TD><TD>
        <INPUT type="text" name="CUN" size=14>
        <a href="javascript:GetCustomer('CUN')">
        <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
			<IMG src="<%=request.getContextPath()%>/images/search1.gif" onclick="enter()" width="25" height="21">
        
      </TD>
    </TR>
    

  </TABLE>
  <br>

<script type="text/javascript">
 	document.forms[0].CUN.focus();
</script>

</FORM>
</BODY>
</HTML>
