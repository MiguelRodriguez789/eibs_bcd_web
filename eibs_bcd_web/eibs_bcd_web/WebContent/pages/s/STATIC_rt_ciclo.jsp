
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Ciclo</TITLE>
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
<h4>Dia de la Semana</h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr>
    <td width=29  height="18">
      <div align="left"><b>C&oacute;digo</b></div>
    </td>
    <td width="413">
      <div align="left"><b>Descripci&oacute;n</b></div>
    </td>
  </tr>
  <tr> 
    <td width=29  height="18"> 
      <div align="center"><b>MO</b></div>
    </td>
    <td width="413"><A HREF="javascript:a('MO')"> Lunes</a></td>
  </tr>
  <tr> 
    <td width=29  height="18"> 
      <div align="center"><b>TU</b></div>
    </td>
    <td width="413"><A HREF="javascript:a('TU')"> Martes</a></td>
  </tr>
  <tr> 
    <td width=29  height="18"> 
      <div align="center"><b>WE</b></div>
    </td>
    <td width="413"><a href="javascript:a('WE')">Miercoles</a></td>
  </tr>
  <tr> 
    <td width=29  height="18"> 
      <div align="center"><b>TH</b></div>
    </td>
    <td width="413"><a href="javascript:a('TH')">Jueves</a></td>
  </tr>
  <tr> 
    <td width=29  height="18"> 
      <div align="center"><b>FR</b></div>
    </td>
    <td width="413"><a href="javascript:a('FR')">Viernes</a></td>
  </tr>
  <tr> 
    <td width=29 height="18">&nbsp;</td>
    <td width="413">&nbsp;</td>
  </tr>
</table>
<h4> Dia del Mes</h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr> 
    <td>(01...31), Donde los n&uacute;meros significan los d&iacute;as del mes, 
      tener en cuenta que esta selecci&oacute;n ser&aacute; v&aacute;lida solamente 
      si se escoge como Frecuencia Mensual</td>
  </tr>
  <tr> 
    <td height="17">&nbsp;</td>
  </tr>
</table>
<P> </P>
</BODY>
</HTML>
