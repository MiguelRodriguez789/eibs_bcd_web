<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>C�digo de Instituci�n</TITLE>
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

<h4> C&oacute;digo de Instituci&oacute;n</h4>
<table align=center class=tableinfo style="width:95%">
  <TR id=trdark> 
    <TH align=left  > 
      <div align="left"></div>
    </TH>
    <TH align=left  > 
      <div align="left">Description</div>
    </TH>
  </TR>
  <tr> 
    <td width=30  > 
      <div align="center"><b>B</b></div>
    </td>
    <td ><A HREF="javascript:a('B')"> C&oacute;digo de Identificaci&oacute;n de 
      Banco(BIC/SWIFT)</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>C</b></div>
    </td>
    <td ><a href="javascript:a('C')">Chips Participant</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>D</b></div>
    </td>
    <td ><a href="javascript:a('D')">N&uacute;mero de Cuenta DDA</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>F</b></div>
    </td>
    <td ><a href="javascript:a('F')">N&uacute;merod e Rueo de FED</a></td>
  </tr>
  <tr> 
    <td width=30  > 
      <div align="center"><b>U</b></div>
    </td>
    <td ><a href="javascript:a('U')">Chips Identiier</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
