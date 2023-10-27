<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Reversa Prorroga de Cuotas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="data" class="datapro.eibs.beans.EDL091401Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function CheckNum(){
	if(isNaN(document.forms[0].E01DEAACC.value)||(document.forms[0].E01DEAACC.value.length < 1)){
		alert("Debe ingresar un número de Prestamo valido");
		document.forms[0].E01DEAACC.value='';
		document.forms[0].E01DEAACC.focus();
	} else {
		document.forms[0].submit();
	}
}

</script>

</head>
<body>

<h3 align="center" style="width: 95%">Reversa Pr&oacute;rroga de Cuotas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="prorroga_reversal_enter, EDL0914"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0914" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="150">
	<table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr><td>&nbsp;</td></tr>
					<tr><td>&nbsp;</td></tr>
					<tr><td>&nbsp;</td></tr>
					<tr><td>&nbsp;</td></tr>
					<tr> 
						<td nowrap width="50%"> 
							<div align="right">Ingrese el N&uacute;mero del Pr&eacute;stamo :</div>
						</td>
						<td nowrap width="50%"> 
							<input type="text" name="E01DEAACC" size="14" maxlength="12" onKeypress="enterInteger(event)" value="<%=data.getE01DEAACC().trim() %>">
							<a href="javascript:GetAccount('E01DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
						</td>
					</tr>
					<tr><TD></TD></tr>
					<tr><TD></TD></tr>
				</table>
			</td>
		</tr>
	</table>

<% if(error.getERWRNG().equals("Y")){%>
	<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK3" value="A" <% if(data.getH01FLGWK3().equals("A")){ out.print("checked");} %>>Aceptar con Advertencias</h4>
<% } %>         

<br><br>
<div align="center"> 
	<input id="EIBSBTN" type=button name="Submit" OnClick="CheckNum()" value="Enviar">
</div>

<script type="text/javascript">
	document.forms[0].E01DEAACC.focus();
	document.forms[0].E01DEAACC.select();
</script>

<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
%>
		<SCRIPT type="text/javascript">;
			showErrors();
		</SCRIPT>
<%
	}
%>
</form>
</body>

<script type="text/javascript">
function submitForm(){
	document.forms[0].submit();
}
</script>

</html>
