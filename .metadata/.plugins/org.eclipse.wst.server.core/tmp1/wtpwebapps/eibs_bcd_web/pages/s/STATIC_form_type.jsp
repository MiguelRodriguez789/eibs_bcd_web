<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Tipos de Formularios</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers
function a(code) {
  var formLength= top.opener.document.forms[0].elements.length;
  for(n=0;n<formLength;n++) {
    var elementName= top.opener.document.forms[0].elements[n].name;
    if(elementName == top.opener.fieldName){
      top.opener.document.forms[0].elements[n].value = code;
      if(window.opener.jQuery){
        window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
      } else{
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
<h4>Tipos de Formularios</h4> 
<table class="tableinfo" style="width:95%" >
  <tr id="trdark">
    <td width=32  height="18">
      <div align="left"><b>C&oacute;digo</b></div>
    </td>
    <td width="406">
      <div align="left"><b>Descripci&oacute;n</b></div>
    </td>
  </tr>
  <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>SP</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('SP')"> Orden de No Pago de Cheques</a></td>
  </tr>
  <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>01</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('01')"> Aperturas</a></td>
  </tr>
  <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>04</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('04')"> Pagos Carta de Credito</a></td>
  </tr>
  <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>PG</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('PG')"> Pagare de Prestamos</a></td>
  </tr>
  <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>CO</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('CO')"> Condiciones de Contrato</a></td>
  </tr>
   <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>DR</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('DR')"> Declaraci&oacute;n de Renta</a></td>
  </tr>

<P align="left"> </P>
</BODY>
</HTML>
