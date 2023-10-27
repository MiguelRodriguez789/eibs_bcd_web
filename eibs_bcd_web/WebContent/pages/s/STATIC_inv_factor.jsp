<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Commission Type</TITLE>
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
<h4>Tipo de Comisión</h4>
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
    <td width=30 > 
      <div align="center"><b>F</b></div>
    </td>
    <td ><a href="javascript:a('F')">Comisión Plana</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>%</b></div>
    </td>
    <td ><a href="javascript:a('%')">Porcentaje Comisión</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>1</b></div>
    </td>
    <td ><a href="javascript:a('1')">Monto Fijo sobre Saldo Promedio</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>2</b></div>
    </td>
    <td ><A HREF="javascript:a('2')">Monto Fijo sobre Valor de Mercado</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>3</b></div>
    </td>
    <td ><A HREF="javascript:a('3')">Porcentaje sobre Saldo Promedio</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>4</b></div>
    </td>
    <td ><A HREF="javascript:a('4')">Percentaje sobre Valor de Mercado</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>5</b></div>
    </td>
    <td ><a href="javascript:a('5')">Monto Fijo por Unidad</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>6</b></div>
    </td>
    <td ><a href="javascript:a('6')">Monto Fijo por Unidad y Rango de Precio</a></td>
  </tr>
</table>
</BODY>
</HTML>
