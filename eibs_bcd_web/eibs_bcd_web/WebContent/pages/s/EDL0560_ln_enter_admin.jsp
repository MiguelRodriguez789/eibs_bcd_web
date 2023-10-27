<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Modificacion de Cuotas: Pr&eacute;stamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id="data" class="datapro.eibs.beans.EDL056001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function checkNum(){
	if (isNaN(document.forms[0].E01DEAACC.value) || (document.forms[0].E01DEAACC.value.length < 1)) {
		alert("Debe ingresar un número de Prestamo valido");
		document.forms[0].E01DEAACC.value = '';
		document.forms[0].E01DEAACC.focus();
	} else {
		document.forms[0].submit();
	}
}

function checkVal(val){ 	
	if (isValidObject(getElement('txtE01DEAOAM'))) {
		txtE01DEAOAM.style.display = (val=="2") ?  "" : "none";
	}
	document.forms[0].E01DEAOPE.value = val;
}
 
</script>

</head>
<body>

<h3 align="center" style="width: 95%">Administraci&oacute;n de Fondos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_admin, EDL0560"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0560" >
	<input type="hidden" name="SCREEN" id="SCREEN" value="101">
	<input type="hidden" name="E01DEAOPE" id="E01DEAOPE" VALUE="1">

	<table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
		<tr bordercolor="#FFFFFF" > 
			<td nowrap> 
				<table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr> 
						<td nowrap width="50%"> 
							<div align="right">Ingrese el N&uacute;mero del Pr&eacute;stamo :</div> <!-- Ingrese el Numero del Prestamo -->
						</td>
						<td nowrap width="50%"> 
							<input type="text" name="E01DEAACC" size="14" maxlength="12" onKeypress="enterInteger(event)" value="<%=data.getE01DEAACC().trim() %>">
							<a href="javascript:GetAccount('E01DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
						</td>
					</tr>
					<tr><td colspan="2"></td></tr>
					<tr><td colspan="2"></td></tr>
					<tr> 
						<td nowrap width="50%"><div align="right">Tipo de Operaci&oacute;n:</div></td> <!-- Tipo de Operacion -->
						<td nowrap width="50%">
							<input type="radio" name="DEAOPE" value="1" <% if (!data.getE01DEAOPE().equals("2")) out.print("checked");%> onclick="checkVal(this.value)">Abono del Fondo 
						</td> 
					</tr>
					<tr> 
						<td nowrap width="50%"></td>
						<td nowrap width="50%">
							<div style="float: left;">
								<input type="radio" name="DEAOPE" value="2" <% if (data.getE01DEAOPE().equals("2")) out.print("checked");%> onclick="checkVal(this.value)">Pago a Pr&eacute;stamo&nbsp;&nbsp;
							</div>
							<div id="txtE01DEAOAM" style="float: left;" >
								<input type="text" name="E01DEAOAM" size="20" maxlength="22" value="<%= data.getE01DEAOAM().trim()%>" onKeypress="enterDecimal(event, 2)" onblur=" this.value = formatCCY(this.value);" class="TXTRIGHT">
							</div>
						</td> 
					</tr>
				</table>
			</td>
		</tr>
	</table>

<% if(error.getERWRNG().equals("Y")){%>
	<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK3" value="A" <% if(data.getH01FLGWK3().equals("A")){ out.print("checked");} %>>Aceptar con Advertencias</h4>
<% } %>         

<br>
<div align="center"> 
	<input id="EIBSBTN" type=button name="Submit" OnClick="checkNum()" value="Enviar">
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
checkVal("1");

</script>

</html>
