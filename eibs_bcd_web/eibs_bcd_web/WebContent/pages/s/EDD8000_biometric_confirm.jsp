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

<h3 align="center">Confirmación de Biometría<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="biometric_confirm.jsp, EDD8000" ></h3>
<hr size="4">
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDD8000">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
	<INPUT TYPE=HIDDEN NAME="E01ACMACC" VALUE="<%= userPO.getAccNum()%>">
	
	<table width="100%" height="100%" border="1" bordercolor="#000000">
		<tr > 
			<td> 
				<table width="100%" height="100%">
					<tr> 
						<td align=center>
							<h4>CONFIRMACION DE BIOMETRIA</h4>
							<BR>
							La cuenta <b><%= userPO.getAccNum()%></b>, ha sido verificada exitosamente para
							<br>
							Biometría de sus Titulares
							<br>
						</td>
					</tr>
					<tr>
						<td width="100%">&nbsp;</td>
					</tr>
					<tr> 
						<td "width="100%">
							<div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="finish()" ></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</FORM>

</body>
</html>
