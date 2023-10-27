<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Forma Cambio Contable</TITLE>
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
<h4>Forma Cambio Contables</h4>
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
      <div align="center"><b>0</b></div>
    </td>
    <td width="420"><a href="javascript:a('0')">A nivel de Cuotas Vencidas Cambia de Cuenta Contable</a></td>
  </tr>
  <tr> 
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>1-5</b></div>
    </td>
    <td width="420"><a href="javascript:a('')">A Partir del Ciclo Indicado el Prestamo
    										   cambia de Cuenta Contable, los primeros los 
    										   maneja a nivel de Cuotas Vencidas.</a></td>
  </tr>
  <tr> 
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>M</b></div>
    </td>
    <td width="420"><a href="javascript:a('M')">El prestamo cambia de Cuenta Contable 
    											al Vencimiento, y varia segun el ciclo </a></td>
  </tr>
  <tr> 
  </tr>
  
</table>
<P>
</P>
</BODY>
</HTML>
