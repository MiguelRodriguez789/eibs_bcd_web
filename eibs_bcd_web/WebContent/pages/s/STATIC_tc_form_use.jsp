
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Forma de Uso</TITLE>
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
<h4>Forma de Uso</h4> 
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
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
      <div align="center"><b>1</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('1')"> Solo General</a></td>
  </tr>
  <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>2</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('2')"> Solo ATM Banco</a></td>
  </tr>
  <tr> 
    <td width=32  height="18"> 
      <div align="center"><b>3</b></div>
    </td>
    <td width="406"><A HREF="javascript:a('3')"> Red Nacional Completa</a></td>
  </tr>
</table>
<P align="left"> </P>
</BODY>
</HTML>
