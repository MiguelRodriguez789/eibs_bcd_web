<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Atributos de la Transacción</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers
function a(code) {
var formLength= top.top.opener.document.forms[0].elements.length;
for(n=0;n<formLength;n++)
{
	var elementName= top.top.opener.document.forms[0].elements[n].name;
	if(elementName == top.top.opener.fieldName) 
	{
  		top.top.opener.document.forms[0].elements[n].value = code;
  		if(window.opener.jQuery){
		window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
	}
	else{
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
<h4>Atributos de la Transacci&oacute;n</h4>
<table align=center class="tableinfo" style="width:95%">
  <tr id="trdark">
    <td width=83 height="18" > 
      <div align="center"><b>C&oacute;digo</b></div>
    </td>
    <td width="1215"> 
      <div align="left"><b>Descripci&oacute;n</b></div>
    </td>
  </tr>
  
  <tr>
    <td width=83 height="18" > 
      <div align="center"><b>N</b></div>
  </td>
    <td width="1215"><a href="javascript:a('N')">No tiene atributos especiales</a></td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>Y</b></div>
    </td>
    <td width="1215"><a href="javascript:a('Y')">Transacci&oacute;n de Ajuste 
      no afectar&aacute; contadores de Cr&eacute;dito o D&eacute;bitos permitidos 
      por la Rregulaci&oacute;n D del FED</a></td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>R</b></div>
    </td>
    <td width="1215"><A HREF="javascript:a('R')"> Cheque 
      devuelto por Forma puede llevar un cargo asociado, actualiza Contador Especial 
      </a></td>
  </tr>
  <tr> 
    <td width=83 height="22" > 
      <div align="center"><b>S</b></div>
    </td>
    <td width="1215" height="22"><a href="javascript:a('S')">Cheque devuelto por 
      Fondos puede llevar un cargo asociado, actualiza Contador Especial</a></td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>D</b></div>
    </td>
    <td width="1215"><a href="javascript:a('D')">Dep&oacute;sitos</a></td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>C</b></div>
    </td>
    <td width="1215"><a href="javascript:a('C')">Cheques</a> </td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>A</b></div>
    </td>
    <td width="1215"><a href="javascript:a('A')">Transacción Cajeros</a> </td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>T</b></div>
    </td>
    <td width="1215"><a href="javascript:a('T')">Compra POS</a> </td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>I</b></div>
    </td>
    <td width="1215"><a href="javascript:a('I')">Transferencia</a> </td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>P</b></div>
    </td>
    <td width="1215"><a href="javascript:a('P')">Transacción de Nómina</a> </td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>M</b></div>
    </td>
    <td width="1215"><a href="javascript:a('M')">Transacción de Cuenta Maestra</a> </td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>E</b></div>
    </td>
    <td width="1215"><a href="javascript:a('E')">Transacción de Recaudo</a> </td>
  </tr>
  <tr> 
    <td width=83 height="18" > 
      <div align="center"><b>B</b></div>
    </td>
    <td width="1215"><a href="javascript:a('B')">Pago de Servicios</a> </td>
  </tr>

</table>
<P>
</P>
</BODY>
</HTML>
