<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<head>
<title>Confirmación de Biometría</title>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>

<SCRIPT>
	function finish(){
		document.forms[0].SCREEN.value = 6;
		document.forms[0].submit();
	}
</SCRIPT>
	
</head>

<body>

<h3 align="center">Confirmación de Biometría<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="biometric_confirm.jsp, EDD8002" ></h3>
<hr size="4">
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDD8002">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
	<INPUT TYPE=HIDDEN NAME="E01ACMACC" VALUE="<%= userPO.getAccNum()%>">
	
	<table class="tbenter" height="75%" width="100%" border="0">
		<tr>
			<td nowrap align="center">
				<div>
					Las cuentas del cliente <b><%= userPO.getCusNum()%></b>, han sido verificada exitosamente 
				</div>
			</td>
		</tr>
	</table>
	<div align="center"> 
		<div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="finish()" ></div>
	</div>

</FORM>

</body>
</html>
