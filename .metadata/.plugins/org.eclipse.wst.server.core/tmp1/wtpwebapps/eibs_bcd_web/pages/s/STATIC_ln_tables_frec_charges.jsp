
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Frecuencia de Cobros</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers
function a(code) {
var formLength= top.opener.document.forms[0].elements.length;
for(n=0;n<formLength;n++)
{
	var elementName= top.opener.document.forms[0].elements[n].name;
	if(elementName == top.opener.fieldName) 
	{
  		top.opener.document.forms[0].elements[n].value = code;
  		window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
  		break;
	}
 }
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<h4>Comisiones</h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr id="trdark">
    <td width=30 height="18" >
      <div align="left"><b>C&oacute;digo</b></div>
    </td>
    <td width="420">
      <div align="left"><b>Descripci&oacute;n</b></div>
    </td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>A</b></div>
    </td>
    <td width="420"><a href="javascript:a('A')">Apertura</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>B</b></div>
    </td>
    <td width="420"><a href="javascript:a('B')">Pago Interes</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>C</b></div>
    </td>
    <td width="420"><a href="javascript:a('C')">Pago de Mora</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>D</b></div>
    </td>
    <td width="420"><a href="javascript:a('D')">Apertura/Pago Interés</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>E</b></div>
    </td>
    <td width="420"><a href="javascript:a('E')">Apertura/Pago Mora</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>F</b></div>
    </td>
    <td width="420"><a href="javascript:a('F')">Pago Cuotas</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>G</b></div>
    </td>
    <td width="420"><a href="javascript:a('G')">Por Renovación</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>H</b></div>
    </td>
    <td width="420"><a href="javascript:a('H')">Por Protesto</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>I</b></div>
    </td>
    <td width="420"><a href="javascript:a('I')">Por envío Notaría</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>J</b></div>
    </td>
    <td width="420"><a href="javascript:a('J')">Por recuperación</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>K</b></div>
    </td>
    <td width="420"><a href="javascript:a('K')">Apertura/Renovación</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>L</b></div>
    </td>
    <td width="420"><a href="javascript:a('L')">Apertura Capitalizable</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>M</b></div>
    </td>
    <td width="420"><a href="javascript:a('M')">Apertura/Exceso Desembolso</a></td>
  </tr>
   <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>N</b></div>
    </td>
    <td width="420"><a href="javascript:a('N')">Pago Anual x Anticipado</a></td>
  </tr>
   <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>O</b></div>
    </td>
    <td width="420"><a href="javascript:a('O')">Pago Cuota (Capital)</a></td>
  </tr>
</table>

<h4>Otros Cargos</h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr id="trdark">
    <td width=30 height="18" >
      <div align="left"><b>C&oacute;digo</b></div>
    </td>
    <td width="420">
      <div align="left"><b>Descripci&oacute;n</b></div>
    </td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>X</b></div>
    </td>
    <td width="420"><a href="javascript:a('X')">Precancelación</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>Y</b></div>
    </td>
    <td width="420"><a href="javascript:a('Y')">Cancelación</a></td>
  </tr>
</table>

<h4>Cargos Periodicos</h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr id="trdark">
    <td width=30 height="18" >
      <div align="left"><b>C&oacute;digo</b></div>
    </td>
    <td width="420">
      <div align="left"><b>Descripci&oacute;n</b></div>
    </td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>P</b></div>
    </td>
    <td width="420"><a href="javascript:a('P')">Bimestral</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>Q</b></div>
    </td>
    <td width="420"><a href="javascript:a('Q')">Trimestral</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>S</b></div>
    </td>
    <td width="420"><a href="javascript:a('S')">Semestral</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>T</b></div>
    </td>
    <td width="420"><a href="javascript:a('T')">Anual</a></td>
  </tr>

</table>


<!--

<h4>Impuestos</h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr id="trdark">
    <td width=30 height="18" >
      <div align="left"><b>C&oacute;digo</b></div>
    </td>
    <td width="420">
      <div align="left"><b>Descripci&oacute;n</b></div>
    </td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>1</b></div>
    </td>
    <td width="420"><a href="javascript:a('1')">Apertura</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>2</b></div>
    </td>
    <td width="420"><a href="javascript:a('2')">Pago Interes</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>3</b></div>
    </td>
    <td width="420"><a href="javascript:a('3')">Pago de Mora</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>4</b></div>
    </td>
    <td width="420"><a href="javascript:a('4')">Apertura/Pago Interés</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>5</b></div>
    </td>
    <td width="420"><a href="javascript:a('5')">Apertura/Pago Mora</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>6</b></div>
    </td>
    <td width="420"><a href="javascript:a('6')">Pago Cuotas</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>7</b></div>
    </td>
    <td width="420"><a href="javascript:a('7')">Por Renovación</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>8</b></div>
    </td>
    <td width="420"><a href="javascript:a('8')">Apertura/Renovación</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>9</b></div>
    </td>
    <td width="420"><a href="javascript:a('9')">Apertura Capitalizable</a></td>
  </tr> 
</table>
<br>

-->


</BODY>
</HTML>
