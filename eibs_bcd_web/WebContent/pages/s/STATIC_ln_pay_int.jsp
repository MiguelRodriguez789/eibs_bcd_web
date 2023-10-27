<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Forma de pagos en Préstamos</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<script type="text/javascript">
function a(code) {
	var form = top.opener.document.forms[0];
	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code; 
		if(window.opener.jQuery){
			window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
		}
	
  	if (typeof form[top.opener.fieldName].onchange === "function" ){
		form[top.opener.fieldName].onchange();	
	}
 	top.close();
}
</script>

</HEAD>
<BODY>
<h4>Forma de Pagos en Préstamos</h4>
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
      <div align="center"><b>nnn</b></div>
    </td>
    <td width="420"><a href="javascript:a('')">Pagos Cíclicos cada nnn días (030, 090, 180)</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>SC1</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('SC1')"> Cuotas Niveladas y Pagos Extraordinarios</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>SC2</b></div>
    </td>
    <td width="420"><a href="javascript:a('SC2')"> Doble Cuota Nivelada Según el % del Capital</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>SC3</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('SC3')">Cuotas Niveladas para Préstamo de Consumo</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>SC4</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('SC4')">Cuotas Revolventes para Cupo Rotativo</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>SCH</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('SCH')">Cuotas Irregulares, Ingreso Manual</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>MAT</b></div>
    </td>
    <td width="420"><a href="javascript:a('MAT')">Pagos al Vencimiento del Préstamo</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
