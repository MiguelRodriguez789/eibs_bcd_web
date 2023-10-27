<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Clases de Prestamos</TITLE>
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
	  		if(window.opener.jQuery){
				window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
			}
	  		break;
		}
	 }
	 top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<h4> Clases de Pr&eacute;stamos </h4>
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
    <td width="420"><a href="javascript:a('A')">Arrendamiento Financiero</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>C</b></div>
    </td>
    <td width="420"><a href="javascript:a('C')">Pr&eacute;stamos de Consumo</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>D</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('D')"> Pr&eacute;stamos sobre Saldo 
      Disoluto </a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>F</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('F')"> Pr&eacute;stamos de Fomento</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>L</b></div>
    </td>
    <td width="420"><a href="javascript:a('L')">Pr&eacute;stamo Regular</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>H</b></div>
    </td>
    <td width="420"><a href="javascript:a('H')">Hipotecarios</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>K</b></div>
    </td>
    <td width="420"><a href="javascript:a('K')">Relacionado</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>M</b></div>
    </td>
    <td width="420"><a href="javascript:a('M')">Microcredito</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>P</b></div>
    </td>
    <td width="420"><a href="javascript:a('P')">Politica Habitacional</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>G</b></div>
    </td>
    <td width="420"><a href="javascript:a('G')">Factoring (Descuento documentos)</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>V</b></div>
    </td>
    <td width="420"><a href="javascript:a('V')">Valores al Cobro</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>O</b></div>
    </td>
    <td width="420"><a href="javascript:a('O')">Para Control de Sobregiros</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>I</b></div>
    </td>
    <td width="420"><a href="javascript:a('I')">Cupo Rotativo</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>J</b></div>
    </td>
    <td width="420"><a href="javascript:a('J')">Pr&eacute;stamo Revolvente</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>R</b></div>
    </td>
    <td width="420"><a href="javascript:a('R')">Pr&eacute;stamo para Refinanciar 
      Otro </a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>S</b></div>
    </td>
    <td width="420"><a href="javascript:a('S')">Pr&eacute;stamo Avalado</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>T</b></div>
    </td>
    <td width="420"><a href="javascript:a('T')">Deuda de Tarjetas en Recuperaci&oacute;n</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>U</b></div>
    </td>
    <td width="420"><a href="javascript:a('U')">Deudores Varios</a></td>
  </tr>

  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>X</b></div>
    </td>
    <td width="420"><a href="javascript:a('X')">Pr&eacute;stamo Regular Refinanciado</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" >&nbsp;</td>
    <td width="420">&nbsp;</td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>1..9</b></div>
    </td>
    <td width="420">Proyectos de Constructor (Digitar desde Pantalla)</td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
