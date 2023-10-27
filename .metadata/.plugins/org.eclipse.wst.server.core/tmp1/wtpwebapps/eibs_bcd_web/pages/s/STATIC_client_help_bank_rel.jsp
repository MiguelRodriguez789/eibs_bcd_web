<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Relación con el Banco</TITLE>
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
<h4>Seleccione la relación del cliente con el Banco</H4>
<table class="tableinfo" align=center style="width:95%">
  <tr id="trdark">
    <td width=30  height="18"><b>C&oacute;digo</b></td>
    <td width="420"><b>Descripci&oacute;n</b></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>1</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('1')"> CLIENTE REGULAR</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>2</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('2')"> ESPECIAL</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>3</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('3')"> EMPLEADO</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>4</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('4')"> FUNCIONARIO </a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>5</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('5')"> DIRECTOR </a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>6</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('6')"> PARIENTE </a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>7</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('7')"> EMPRESA AFILIADA </a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>8</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('8')"> JUNTA DIRECTIVA </a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>9</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('9')"> BANCO CORRESPONSAL</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>T</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('T')"> TESORERIA</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>E</b></div>
    </td>
    <td width="420"> <A HREF="javascript:a('E')"> TERCERO</a></td>
  </tr>

</table>
</BODY>
</HTML>
