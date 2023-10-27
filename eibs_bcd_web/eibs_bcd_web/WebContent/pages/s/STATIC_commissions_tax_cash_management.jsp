<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Commission Type</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function a(code) {
var formLength= top.opener.document.forms[0].elements.length;
for(n=0;n<formLength;n++)
{
	var elementName= top.opener.document.forms[0].elements[n].name;
	if(elementName == top.opener.fieldName) 
	{
  		top.opener.document.forms[0].elements[n].value = code;
  		break;
	}
 }
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<h4>Impuestos aplicables sobre la Comisión</h4>
<table align=center class=tableinfo style="width:95%">
  <TR id=trdark> 
    <TH align=left  > 
      <div align="left">Codigo</div>
    </TH>
    <TH align=left  > 
      <div align="left">Descripción</div>
    </TH>
  </TR>
  <TR id=trclear> 
    <td width=30 > 
      <div align="center"><b>1</b></div>
    </td>
    <td ><a href="javascript:a('1')">Iva Incluido</a></td>
  </tr>
  <TR id=trdark> 
    <td width=30 > 
      <div align="center"><b>2</b></div>
    </td>
    <td ><a href="javascript:a('2')">Iva No Incluido</a></td>
  </tr>
  <TR id=trclear> 
    <td width=30 > 
      <div align="center"><b>3</b></div>
    </td>
    <td ><a href="javascript:a('3')">No genera Iva</a></td>
  </tr>
</table>
</BODY>
</HTML>
