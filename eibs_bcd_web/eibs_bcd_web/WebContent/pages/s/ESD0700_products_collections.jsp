<html>
<head>
<title>Consulta de Productos para Cobranzas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message"
	scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />

<body>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }
%>

<h3 align="center">Producto para Cobranzas<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="products_collections.jsp, ESD0700"></h3>
<hr size="4">

<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1"> <INPUT TYPE=HIDDEN
	NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" class="tbhead"
			align="center">
			<tr>
				<td nowrap width="10%" align="right">Banco:</td>
				<td nowrap width="12%" align="left"><input type="text"
					name="E01APCBNK" size="3" maxlength="2"
					value="<%= prd.getE01APCBNK()%>" readonly></td>
				<td nowrap width="6%" align="right">Producto:</td>
				<td nowrap width="14%" align="left"><input type="text"
					name="E01APCCDE" size="6" maxlength="4"
					value="<%= prd.getE01APCCDE()%>" readonly></td>
				<td nowrap width="8%" align="right">Tipo de Producto :</td>
				<td nowrap width="50%" align="left"><input type="text"
					name="E01APCTYP" size="6" maxlength="4"
					value="<%= prd.getE01APCTYP()%>" readonly> - <input
					type="text" name="E01DSCTYP" size="45" maxlength="45"
					value="<%= prd.getE01DSCTYP()%>" readonly></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<h4>Informaci&oacute;n General</h4>

<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td>
				<div align="right">Descripci&oacute;n :</div>
				</td>
				<td><input type="text" name="E01APCDS1" size="50"
					maxlength="45" value="<%= prd.getE01APCDS1()%>"></td>
				<td>
				<div align="right">Nombre de Mercadeo :</div>
				</td>
				<td><input type="text" name="E01APCDS2" size="28"
					maxlength="25" value="<%= prd.getE01APCDS2()%>"></td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">C&oacute;digo de Moneda :</div>
				</td>
				<td><input type="text" name="E01APCCCY" size="3" maxlength="3"
					value="<%= prd.getE01APCCCY()%>"> <a
					href="javascript:GetCurrency('E01APCCCY','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a></td>
				<td>
				<div align="right">Ofrecimiento por :</div>
				</td>
				<td><SELECT name="E01APCFTT">
					<OPTION value="1"
						<%if (prd.getE01APCFTT().equals("1")) { out.print("selected"); }%>>Internet</OPTION>
					<OPTION value="I"
						<%if (prd.getE01APCFTT().equals("I")) { out.print("selected"); }%>>Internacional</OPTION>
					<OPTION value="L"
						<%if (prd.getE01APCFTT().equals("L")) { out.print("selected"); }%>>Local</OPTION>
					<OPTION value="3"
						<%if (prd.getE01APCFTT().equals("3")) { out.print("selected"); }%>>Plataforma</OPTION>
					<OPTION value="5"
						<%if (prd.getE01APCFTT().equals("5")) { out.print("selected"); }%>>Cualquier
					Medio</OPTION>
					<OPTION value="N"
						<%if (prd.getE01APCFTT().equals("N")) { out.print("selected"); }%>>No
					Ofrecer</OPTION>
				</SELECT></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Cuenta Contable:</div>
				</td>
				<td><input type="text" name="E01APCGLN" size="18"
					maxlength="16" value="<%= prd.getE01APCGLN().trim()%>"> <a
					href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,document.forms[0].E01APCACD.value,'','<%= prd.getE01APCTYP().trim()%>')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a></td>
				<td>
				<div align="right">C&oacute;digo de Tarifa:</div>
				</td>
				<td><input type="text" name="E01APCTLN" size="3" maxlength="2"
					value="<%= prd.getE01APCTLN().trim()%>"> <a
					href="javascript:GetTariffColl('E01APCTLN',document.forms[0].E01APCTYP.value, ' ')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a></td>
			</tr>
			<tr>
				<td>
				<div align="right">Producto Familia :</div>
				</td>
				<td><input type="text" name="E01APCUC1" size="4" maxlength="2"
					value="<%= prd.getE01APCUC1().trim()%>"></td>
				<td>
				<div align="right">Tipo de Cobranza:</div>
				</td>
				<td><select name="E01APCAMO">
					<OPTION value=""
						<%if (!prd.getE01APCAMO().equals("I") && !prd.getE01APCAMO().equals("O")) { out.print("selected"); }%>=""></OPTION>
					<OPTION value="I"
						<%if (prd.getE01APCAMO().equals("I")) { out.print("selected"); }%>="">Recibidas</OPTION>
					<OPTION value="O"
						<%if (prd.getE01APCAMO().equals("O")) { out.print("selected"); }%>="">Enviadas</OPTION>
				</select></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Retencion Impuestos</div>
				</td>
				<td><input type="text" name="E01APCTAX" size="4" maxlength="2"
					value="<%= prd.getE01APCTAX().trim()%>"> <a
					href="javascript:GetCode('E01APCTAX','STATIC_ln_prod_tax_ret.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a></td>
				<td>
				<div align="right">Subtipo de Cobranza</div>
				</td>
				<td><select name="E01APCITP">
					<OPTION value="D"
						<%if (prd.getE01APCITP().equals("D")) { out.print("selected"); }%>="">Documentarias</OPTION>
					<OPTION value="C"
						<%if (prd.getE01APCITP().equals("C")) { out.print("selected"); }%>="">Simple</OPTION>
				</select></td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Tabla de Documentos :</div>
				</td>
				<td><input type="text" name="E01APCFTF" size="4" maxlength="2"
					value="<%= prd.getE01APCFTF().trim()%>"> <a
					href="javascript:GetDocInv('E01APCFTF')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a></td>
				<td>
				<div align="right">Entregar Documento :</div>
				</td>
				<td><select name="E01APCCDT">
					<OPTION value="P"
						<%if (prd.getE01APCCDT().equals("P")) { out.print("selected"); }%>="">Pago</OPTION>
					<OPTION value="A"
						<%if (prd.getE01APCCDT().equals("A")) { out.print("selected"); }%>="">Aceptacion</OPTION>
				</select></td>
			</tr>
			<tr id="trdark">
				<td width="25%">
					<div align="right">N�mero de Registro RECA : </div>
				</td>
				<td width="25%" colspan="1">
					<input type="text" name="E01APAD01" size="40" maxlength="35" value="<%= prd.getE01APAD01() %>">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<div align="center"><input id="EIBSBTN" type=button name="Submit"
	OnClick="submit()" value="Enviar"></div>

</form>
</body>
</html>
