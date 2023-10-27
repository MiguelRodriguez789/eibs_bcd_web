<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title></title>
</head>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp""></script>	

<body>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEODPDF" target="_parent">
<input type="hidden" name="SCREEN" value="7"> 
<input type="hidden" id="type" name="TYPE" value=""> 

<table border="0" class="tbhead" width="100%" >
	<tr align="center">
		<td align="right">Buscar por :&nbsp;&nbsp;</td>
		<td align="left">
			<input type="radio" name="TYP" value="U" checked>Usuario&nbsp;&nbsp; 
			<input type="radio" name="TYP" value="G" >Grupo
		</td>
	</tr>
	<tr align="center">
		<td align="center" colspan="2">
			<input type="text" id="USR" name="USER" value="" size="20" maxlength="10" />&nbsp;&nbsp; 
			<input type="button" name="Buscar" id="BuscarUser" value="Buscar" onclick="searchUsers();" />
		</td>
	</tr>
</table>

<table id="tree" BORDER=1 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" HEIGHT="92%">
	<tr>
		<td ALIGN=left VALIGN=top BGCOLOR="#ffffff" width="100%" height="100%">
			<APPLET archive="eibs_applets.zip" align="top" code="datapro.eibs.applets.tree.TreeApp.class" height="100%" width="100%" name="JExplorer" 
				title="Vista de Usuarios" codebase="<%=request.getContextPath()%>/pages/s/">
				<PARAM NAME="file1" VALUE="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSOfferParams"> 
				<PARAM NAME="bghighlight" VALUE="336699">
				<PARAM NAME="pluscolor" VALUE="000000">
				<PARAM NAME="mouseover" VALUE="336699">
				<PARAM NAME="texthighlight" VALUE="ffffff">
				<PARAM NAME="fgcolor" VALUE="666666">
				<PARAM NAME="mouseunder" VALUE="000033">
				<PARAM NAME="toolback" VALUE="ffffcc">
			</APPLET>
		</td>
	</tr>
</table>

<script type="text/javascript">

function searchUsers() {
    
    document.getElementById("type").value = getElementChecked("TYP").value;
    document.forms[0].submit();
}

</script>

</form>
</body>
</html>
