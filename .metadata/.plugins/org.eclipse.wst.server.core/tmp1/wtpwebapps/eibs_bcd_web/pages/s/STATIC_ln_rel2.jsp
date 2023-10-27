
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Pago-Renovacion-Reestructuración</TITLE>
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
<h4>Pago / Renovaci&oacute;n / Reestructuraci&oacute;n </h4>
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
    <td width="420"><a href="javascript:a('P')">Pago sobre Prestamos</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>R</b></div>
    </td>
    <td width="420"><a href="javascript:a('R')">Cr&eacute;dito Retanqueado</a></td>
  </tr>
   <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>U</b></div>
    </td>
    <td width="420"><a href="javascript:a('U')">Cr&eacute;dito Negociado</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>E</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('E')"> Cr&eacute;dito Reestructurado</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>F</b></div>
    </td>
    <td width="420"><a href="javascript:a('F')">Refinanciar Sobre Otro Cr&eacute;dito</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>D</b></div>
    </td>
    <td width="420"><a href="javascript:a('D')">Refinanciar Documentaria</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>V</b></div>
    </td>
    <td width="420"><a href="javascript:a('V')">Novado</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>N</b></div>
    </td>
    <td width="420"><a href="javascript:a('N')">Ninguno</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
