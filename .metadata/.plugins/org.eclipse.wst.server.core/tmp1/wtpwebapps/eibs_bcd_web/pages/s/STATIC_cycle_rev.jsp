<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Tipos</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<script type="text/javascript">
//<!-- Hide from old browsers
function a(code) {
	top.opener.document.forms[0][top.opener.fieldName].value = code;
	top.opener.document.forms[0][top.opener.fieldName].focus();
	if(window.opener.jQuery){
		window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
	}
	 top.close();
 }
//-->
</script>
</HEAD>
<BODY>

<h4>Ciclo de Revision</h4>
<table align=center class=tableinfo style="width:95%">
  <TR id=trdark> 
    <TH align=left  > 
      <div align="left"></div>
    </TH>
    <TH align=left  > 
      <div align="left">Descripci&oacute;n</div>
    </TH>
  </TR>
  <tr> 
    <td width=60  > 
      <div align="center"><b>nnn = </b></div>
    </td>
    <td ><A HREF="javascript:a('')"> Cada n Días</a></td>
  </tr>
  <tr> 
    <td width=60  > 
      <div align="center"><b>SCH = </b></div>
    </td>
    <td ><a href="javascript:a('SCH')">Coincide Fecha de Pago</a></td>
  </tr>
  <tr> 
    <td width=60  > 
      <div align="center"><b>N/A = </b></div>
    </td>
    <td ><a href="javascript:a('N/A')">No Aplica Revision</a></td>
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
