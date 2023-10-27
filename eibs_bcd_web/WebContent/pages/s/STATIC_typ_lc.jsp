<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Tipo de Carta de Credito</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers
function a(code) {
 top.opener.document.forms[0][top.opener.fieldName].value = code;
	if(window.opener.jQuery){
		window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
	}
	else{
	}
 top.opener.document.forms[0][top.opener.fieldName].focus();
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<H4>Tipo de Carta de Credito</H4>
<table align=center class="tableinfo" style="width:95%">
  <tr id="trdark">
    <td width=39  height="18">
      <div align="center"><b>Codigo</b></div>
    </td>
    <td width="424"> 
      <div align="left"><b>Descripcion</b></div>
    </td>
  </tr>
  <tr > 
    <td width="39" > 
      <div align="center"><b>I</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('I')">Exportacion</a></td>
  </tr>
  <tr > 
    <td width="39" > 
      <div align="center"><b>O</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('O')">Inportacion</a></td>
  </tr>
  <tr > 
    <td width="39" > 
      <div align="center"><b>S</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('S')">En Garantia</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
