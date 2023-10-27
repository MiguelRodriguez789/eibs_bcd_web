<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="febrk" class="datapro.eibs.beans.EFE009501Message" scope="session" />

<title>Tablas de Seguros</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
</head>
<body>

<%
	if (!error.getERRNUM().equals("0")) {
		out.println("<script type=\"text/javascript\">");
		error.setERRNUM("0");
		out.println("showErrors()");
		out.println("</script>");
	}
%>

<h3 align="center">Tablas de Registros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="FEBRK_enter_search.jsp,EFE0095"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0095">
<input type="hidden" name="SCREEN" value="101">
<br>

<table id="TBHELPN" width="100%" border="0" cellspacing="0"
	cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="right" width="50%" nowrap>Tipo de Registros :&nbsp;</td>
		<td  width="50%">
             <select name="E01SELATY">
                <option value="I">SEGUROS</option>
                <option value="A">SEGURO AUTOS</option>
                <option value="C">CREDIAHORRO</option>
                <option value="T">RECOLECTOR DE IMPUESTOS</option>
                <option value="V">AGENTES DE BOLSA</option>
              	<option value="G">ADMINISTRACION DE FONDOS</option>
                <option value="L">ENTIDADES AVALADORAS</option>
                <option value="E">ENTIDADES DE GOBIERNO</option>
                <option value="F">ENTIDADES DE SUBSIDIO</option>
                <option value="K">ENTIDADES DE VENTA O TITULARIZACION</option>
                <option value="B">ENTIDADES DE EMBARGO</option>
                <option value="R">ENTIDADES DE RECAUDO</option> 
                <option value="S">VENDEDORES - COMISIONISTAS</option>
                <option value="D">AGENTES - REPRESENTANTES COMEX</option>
                <option value="N">NOTARIAS</option>
                <option value="P">PARTICIPANTES POOL CONTRATOS</option>
                <option value="O">INSPECTORES DE OBRA</option> 
                <option value="X">TIENDA VIRTUAL</option> 
                <option value="Y">TARJETAS ALIANZA</option> 
			 </select> 
		</td>
	</tr>
	<tr><td height="40" colspan="2">&nbsp;</td></tr>
	<tr align="center">
		<td nowrap colspan="2" align="center">
		<div id="DIVSUBMIT" align="center"><input id="EIBSBTN" type="submit"
			name="Submit" value="Enviar"></div>
		</td>
	</tr>
</table>

</form>
</body>
</html>
 