<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Clases de Prestamos</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
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
	  		break;
		}
	 }
	 top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<h4>Nivel de los Estados Financieros</h4>
<table class="tableinfo" style="width: 95%" ALIGN=CENTER>
	<tr id="trdark">
		<td width=30 height="18">
		<div align="left"><b>C&oacute;digo</b></div>
		</td>
		<td width="420">
		<div align="left"><b>Descripci&oacute;n</b></div>
		</td>
	</tr>
	<tr>
		<td width=30 height="18">
		<div align="center"><b>1</b></div>
		</td>
		<td width="420"><a href="javascript:a('1')">Presentados por
		Sucursal</a></td>
	</tr>
	<tr>
		<td width=30 height="18">
		<div align="center"><b>2</b></div>
		</td>
		<td width="420"><a href="javascript:a('2')">Presentados por
		Banco</a></td>
	</tr>
	<tr>
		<td width=30 height="18">
		<div align="center"><b>3</b></div>
		</td>
		<td width="420"><a href="javascript:a('3')">Por Compa�ias
		Base</a></td>
	</tr>
	<tr>
		<td width=30 height="18">
		<div align="center"><b>4</b></div>
		</td>
		<td width="420"><a href="javascript:a('4')">Por Compa�ias de
		Resultados</a></td>
	</tr>
</table>
<P></P>
</BODY>
</HTML>
