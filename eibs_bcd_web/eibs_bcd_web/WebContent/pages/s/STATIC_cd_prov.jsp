<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Provisi�n de Intereses</TITLE>
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
<H4>Provision de Intereses</H4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <TR id="trdark"> 
    <TH><div align="left">C�digo</div></TH>
    <TH>
      <div align="left">Descripci�n</div>
    </TH>
  </TR>
  <tr> 
    <td width=30 height="18"> 
      <div align="center"><b>1</b></div>
    </td>
    <td><A HREF="javascript:a('1')"> C&aacute;lculo sobre el Saldo del Capital</a></td>
  </tr>
  <tr> 
    <td width=30  height="18"> 
      <div align="center"><b>N</b></div>
    </td>
    <td><A HREF="javascript:a('N')"> No Calcula Intereses</a></td>
  </tr>
</table>
<P align="left"> </P>
</BODY>
</HTML>
