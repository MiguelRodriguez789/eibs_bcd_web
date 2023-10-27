<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Razon de Rechazo</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript">

function ok() {
	top.close();
}

</script>
</HEAD>
<BODY>
<FORM  action="javascript:ok()">
<table align=center width="100%" id="tbhelp">
  <TR> 
    <TH> 
      <div align="left">Comentario :
      	<hr>
      </div>
    </TH>
  </TR>
  <TR> 
    <TD align="center">
      <div align="center">&nbsp;</div>
     </TD> 
  </TR>
  <TR> 
    <TD align="center">
		<textarea cols="50" rows="20" name="txtReason" readonly="readonly"><%=request.getParameter("text")%></textarea>
    </TD>
  </TR>
</table>
	<table align=center width="100%" id="tbhelp">
		<TR>
			<TD align="center" class="TDBKG" ><a href="javascript:ok()"><b> Cerrar </b></a></TD>
		</TR>
	</table>
</FORM>
</BODY>
</HTML>
