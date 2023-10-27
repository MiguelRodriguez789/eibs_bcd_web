
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Cheques Oficiales</TITLE>
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
<h4>Clases de Cheques Oficiales</h4>
<table class="tableinfo" style="width:95%" ALIGN=CENTER>
  <tr>
    <td width=30 height="18" >
      <div align="left"><b>C&oacute;digo</b></div>
    </td>
    <td width="420">
      <div align="left"><b>Descripci&oacute;n</b></div>
    </td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>A</b></div>
    </td>
    <td width="420"><a href="javascript:a('A')">Cheque al Portador</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>B</b></div>
    </td>
    <td width="420"><a href="javascript:a('B')">Cheque Nominativo</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>C</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('C')"> Cheque Endosable</a></td>
  </tr>
  <tr> 
    <td width=30 height="18" > 
      <div align="center"><b>D</b></div>
    </td>
    <td width="420"><A HREF="javascript:a('D')"> Cobro Inmediato</a></td>
  </tr>

  <tr> 
    <td width=30 height="18" > 
      <div align="center"> </div>
    </td>
    <td width="420"><a href="javascript:a(' ')">Cheque Regular</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
