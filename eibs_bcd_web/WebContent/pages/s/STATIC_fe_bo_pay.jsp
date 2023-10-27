<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Payment Via</TITLE>
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
<h4>Via de Pago</h4>
<table align=center class=tableinfo style="width:95%">
  <TR id=trdark> 
    <TH align=left  > 
      <div align="left">Código</div>
    </TH>
    <TH align=left  > 
      <div align="left">Descripción</div>
    </TH>
  </TR>
  <tr> 
    <td width=30 > 
      <div align="center"><b>N</b></div>
    </td>
    <td ><a href="javascript:a('N')">Ninguna</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>F</b></div>
    </td>
    <td ><a href="javascript:a('F')">Pago Via Fed</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>1</b></div>
    </td>
    <td ><a href="javascript:a('1')">Pago Via Swift MT-103</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>2</b></div>
    </td>
    <td ><A HREF="javascript:a('2')">Pago Via Swift MT - 200</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>3</b></div>
    </td>
    <td ><A HREF="javascript:a('3')">Pago Via Swift MT- 202</a></td>
  </tr>
  <tr> 
    <td width=30 > 
      <div align="center"><b>T</b></div>
    </td>
    <td ><A HREF="javascript:a('T')">SINPE</a></td>
  </tr>
  
<!--  <tr> 
    <td width=30 > 
      <div align="center"><b>T</b></div>
    </td>
    <td ><A HREF="javascript:a('T')">Payment Via Telex</a></td>
  </tr>   -->
  
  
  
</table>
</BODY>
</HTML>
