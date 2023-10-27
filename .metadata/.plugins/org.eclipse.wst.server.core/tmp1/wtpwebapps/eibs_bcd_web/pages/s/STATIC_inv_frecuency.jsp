<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Frecuencia de Comisiones</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function a(code) {
var formLength= top.opener.document.forms[0].elements.length;
for(n=0;n<formLength;n++)
{
	var elementName= top.opener.document.forms[0].elements[n].name;
	if(elementName == top.opener.fieldName) 
	{
  		top.opener.document.forms[0].elements[n].value = code;
  		break;
	}
 }
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<h4>Frecuencia de Comisión</h4>
<table align=center class=tableinfo style="width:95%">
  <TR id=trdark> 
    <TH align=left  > 
      <div align="left">Codigo</div>
    </TH>
    <TH align=left  > 
      <div align="left">Descripción</div>
    </TH>
  </TR>
  <tr> 
    <td width=30 >&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2" ><b>Tipo de Cargo</b></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>A</b></div>
    </td>
    <td ><a href="javascript:a('A')">Anual</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>S</b></div>
    </td>
    <td ><a href="javascript:a('S')">Semi-Anual</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>T</b></div>
    </td>
    <td ><a href="javascript:a('T')">Trimestral</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>M</b></div>
    </td>
    <td ><A HREF="javascript:a('M')">Mensual</a></td>
  </tr>
  <tr> 
    <td colspan="2" >&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2" ><b>Cargos de Contingencia</b></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>1</b></div>
    </td>
    <td ><A HREF="javascript:a('1')">Apertura de Emisión</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>2</b></div>
    </td>
    <td ><A HREF="javascript:a('2')">Pago de Intereses</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>3</b></div>
    </td>
    <td ><a href="javascript:a('3')">Compras</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>4</b></div>
    </td>
    <td ><a href="javascript:a('4')">Ventas</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>5</b></div>
    </td>
    <td ><a href="javascript:a('5')">Redención</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>6</b></div>
    </td>
    <td ><a href="javascript:a('6')">Emisión al Vencimiento</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>7</b></div>
    </td>
    <td ><a href="javascript:a('7')">Pagos de Capital</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>8</b></div>
    </td>
    <td ><a href="javascript:a('8')">Compras / Ventas</a></td>
  </tr>
</table>
</BODY>
</HTML>
