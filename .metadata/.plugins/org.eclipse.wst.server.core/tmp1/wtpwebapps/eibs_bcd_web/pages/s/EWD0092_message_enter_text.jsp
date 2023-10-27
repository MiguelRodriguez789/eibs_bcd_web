<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Razon de Aprobacion - Rechazo</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
function ok() {
	if(document.forms[0].txtReason.value == ''){
		alert("Debe proveer un comentario");
		return false;
	}
  	top.opener.reason = document.forms[0].txtReason.value;
  	document.forms[0].submit();
 }
//-->
</script>
</HEAD>
<BODY>
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="Number" VALUE="<%=request.getParameter("Number")%>">
<INPUT TYPE=HIDDEN NAME="Seq" VALUE="<%=request.getParameter("Seq")%>">
<table align=center width="100%" id="tbhelp">
  <TR> 
    <TH> 
      <div align="left">Usted debe proveer una razón por la cual no ha revisado todas las coincidencias encontradas :
        <hr>
      </div>
    </TH>
  </TR>
  <TR> 
    <TD align="center">
		<textarea cols="50" rows="20" name="txtReason"></textarea>
    </TD>
  </TR>
</table>
<table align=center width="100%" id="tbhelp">
  <TR> 
    <TD align="center">
		<a href="javascript:ok()"><b> Enviar </b></a>
    </TD>
    <TD align="center">
		<a href="javascript:self.close()"><b> Cerrar </b></a>
    </TD>
  </TR>
</table>
</FORM>
</BODY>
</HTML>
