
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Instrucciones para Impuestos</TITLE>
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
<H4>Instrucciones para Impuestos</H4>
<table align=center class="tableinfo" style="width:95%" >
  <tr id="trdark">
    <td width=30  height="18">
      <div align="center"><b>C&oacute;digo</b></div>
    </td>
    <td width="420">
      <div align="left"><b>Descripci&oacute;n</b></div>
    </td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>1</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('1')"> Retenci&oacute;n sobre Intereses 
      ISR</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>2</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('2')"> Cobro del IVA </a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>3</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('3')"> IVA mas ISR</a></td>
  </tr>
  <tr> 
    <td width=30 height="18"> 
      <div align="center"><b>4</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('4')"> IVA Comision/ITBMS</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>5</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('5')"> IVA en Intereses</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>6</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('6')"> Debito Bancario IDB</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>7</b></div>
    </td>
    <td width="420"><a href="javascript:a('7')">IDB mas ISR</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>8</b></div>
    </td>
    <td width="420"><a href="javascript:a('8')">IDB mas IVA</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>9</b></div>
    </td>
    <td width="420"><a href="javascript:a('9')">Todo tipo de Impuesto</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>F</b></div>
    </td>
    <td width="420"><a href="javascript:a('F')">FECI (Panama)</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>G</b></div>
    </td>
    <td width="420"><a href="javascript:a('G')">FECI e ITBMS (panama)</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>N</b></div>
    </td>
    <td width="420"><a href="javascript:a('N')">No Calcula Impuestos</a></td>
  </tr>

</table>
<P align="left"> </P>
</BODY>
</HTML>
