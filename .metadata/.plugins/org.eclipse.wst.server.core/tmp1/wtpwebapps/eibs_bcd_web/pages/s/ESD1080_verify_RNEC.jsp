<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" 	scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<title>Verificacion RNEC</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" 	rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/Homini/jsHominiR.js"> </SCRIPT>
<script src="<%=request.getContextPath()%>/jquery/jquery-3.1.1.min.js"> </SCRIPT>

<script language="JavaScript">
	function VerifyRNEC() {
		//-------------------------------------------------------------------------
		// Establecer nuevo objeto
		var objetoHOM = new HomHttp(1200);          
		var cedula = getElement("IDN").value;
		var tid = getElement("TID").value;
		var user = '<%=currUser.getH01USR()%>';
		var brn = '<%=currUser.getE01UBR()%>';
		var cid = '<%=currUser.getH01TIM()%>';
		//-------------------------------------------------------------------------
		// Llamar la funcion y obtener el resultado
		//-------------------------------------------------------------------------
		// JSON:
		// OPERACION: Especifique 6
		// TipoNip: Tipo de identificacion
		// NIP: Identificacion
		// InfAdicional: Usuario
		var jsonSolicitud = "[{'Operacion':'6','SucursalId':'1001','correlId':'" + cid + "','UsuarioAplicacion':'" + user + "','OperacionNegocio':'TomaHuellas','TipoNip':'" + tid + "','Nip':'" + cedula +"'}]";	               
		//-------------------------------------------------------
		// Solicitud al componente
		var resultado = objetoHOM.RNEC(jsonSolicitud, ResBusquedaSuc, ResBusquedaError);
		//-------------------------------------------------------
	};
	// Resultado exitoso
	function ResBusquedaSuc(res) {
		// Imprimir resultado
		// Posicion 0 del vector, la funcion se ejecuta correctamente.
		var s = res.split(",");
		switch(s[0]) {
			case "0":
				alert('Se realiza prueba, resultado: ' + s[1]);
				document.getElementById("divresultado").innerHTML=s[1];
				break;
			case "-1":
				// Respuesta posiciones restantes: descripciondelerror
				// Descripciondelerror: Retorna el mensaje de error que ocurrio
				alert('El proceso ha sido cancelado o ocurrio un error.');
				document.getElementById("divresultado").innerHTML=s[1];
			break;
		} 
	}
	// Resultado error
	function ResBusquedaError(res) {
		alert('Error: ' + res);
		document.getElementById("divresultado").innerHTML='Error: ' + res;
	}
		//----------------------------------------------------------------------------
		//-----------------------------------------------------------------------------
</script>

</head>

<body bgcolor="#FFFFFF">

<!-- Reemplazado por el ESD1094_verify_RNEC -->

<h3 align="center">Verificar RNEC 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="verify_RNEC, ESD1080">
</h3>
<hr size="4">

<form name="forma" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">
<% String IDN = request.getParameter("IDN"); 
	 String TID = request.getParameter("TID");
%>
<INPUT TYPE=HIDDEN NAME="IDN" VALUE="<%=IDN%>">
<INPUT TYPE=HIDDEN NAME="TID" VALUE="<%=TID%>">

<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<div id="divresultado" class="alert alert-success" role="alert">
			</div>
			</tr>
		</table>
	</tr> 
</table>


</form>
</body>

<SCRIPT Language="Javascript">;
	VerifyRNEC();		
</SCRIPT>

</html>
