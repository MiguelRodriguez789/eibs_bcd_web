<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="menu" class="datapro.eibs.beans.EUT011001Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

</head>
<body>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEUT0110">
<input type="hidden" id="SCREEN" name="SCREEN" value="200">
	
	<h3 align="center">Mantenimiento Opciones de Menu<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="eibs_menu_language.jsp,EUT0110"> </h3> 
    
    <hr size="4">
    <p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>


<table id="TBHELPN" width="100%" border="0" cellspacing="0"
	cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="right" width="50%" nowrap>Seleccione Lenguaje :&nbsp;</td>
		<td  width="50%">
             <select id="CODLAN" name="CODLAN">
				<option value="S">Español</option>
				<option value="E">English</option>											
			 </select> 
		</td>
	</tr>
	<tr><td height="40" colspan="2">&nbsp;</td></tr>
	<tr align="center" >
		<td nowrap colspan="2" align="center">
		<div id="DIVSUBMIT" align="center">
			<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
		</div>
		</td>
	</tr>
</table>

</form>
</body>
</html>