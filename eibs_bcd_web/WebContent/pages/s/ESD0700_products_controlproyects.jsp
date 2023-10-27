<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>

<%@ page import="datapro.eibs.master.Util"%>
<%@page import="com.datapro.constants.EibsFields"%>


<html>
<head>
<title>Consulta de Productos para Control Proyectos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<SCRIPT
	SRC="<%=request.getContextPath()%>/pages/s/javascripts/dynlayer.js"> </SCRIPT>
<SCRIPT
	SRC="<%=request.getContextPath()%>/pages/s/javascripts/pop_out.js"> </SCRIPT>
<SCRIPT
	SRC="<%=request.getContextPath()%>/pages/s/javascripts/nav_aid.js"> </SCRIPT>

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
     error.setERRNUM("0");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Producto para Control Proyectos<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="products_controlproyects.jsp, ESD0711"></h3>
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
					type="text" name="E01DSCTYP" size="25" maxlength="25"
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
				<div align="right">Tabla de Documentos :</div>
				</td>
				<td><input type="text" name="E01APCDOC" size="4" maxlength="2"
					value="<%= prd.getE01APCDOC().trim()%>"> <a
					href="javascript:GetDocInv('E01APCDOC')"><img
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
				<div align="right">Clase de Pr&eacute;stamo :</div>
				</td>
				<td><input type="text" name="E01APCFRN" size="4" maxlength="2"
					value="<%= prd.getE01APCFRN().trim()%>"> <a
					href="javascript:GetCode('E01APCFRN','STATIC_cd_prod_loanclass.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Retencion Impuestos</div>
				</td>
				<td colspan="3"><input type="text" name="E01APCTAX" size="4"
					maxlength="2" value="<%= prd.getE01APCTAX().trim()%>"> <a
					href="javascript:GetCode('E01APCTAX','STATIC_ln_prod_tax_ret.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		</td>
	</tr>
</table>


<h4>Informaci&oacute;n Adicional</h4>

<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="40%">
				<div align="right">Fondo Nacional Vivienda :</div>
				</td>
				<td nowrap width="60%"><eibsinput:text name="prd"
					property="E01APACNV"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" /> <select
					name="E01APATY1">
					<option value=" "></option>
					<option value="F"
						<%if (prd.getE01APATY1().equals("F")) {out.print("selected"); }%>>Fijo</option>
					<option value="%"
						<%if (prd.getE01APATY1().equals("%")) { out.print("selected"); }%>>Porcentaje</option>
				</select></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="20%">
				<div align="right">Anticipo :</div>
				</td>
				<td align="left" valign="middle" nowrap="nowrap"><eibsinput:text
					name="prd" property="E01APAANT"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" /> <select
					name="E01APATY2">
					<option value=" "></option>
					<option value="F"
						<%if (prd.getE01APATY2().equals("F")) {out.print("selected"); }%>>Fijo</option>
					<option value="%"
						<%if (prd.getE01APATY2().equals("%")) { out.print("selected"); }%>>Porcentaje</option>
				</select></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="20%">
				<div align="right">Prima Fondo Garantia :</div>
				</td>
				<td nowrap width="60%"><eibsinput:text name="prd"
					property="E01APAPFG"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" /> <select
					name="E01APATY3">
					<option value=" "></option>
					<option value="F"
						<%if (prd.getE01APATY3().equals("F")) {out.print("selected"); }%>>Fijo</option>
					<option value="%"
						<%if (prd.getE01APATY3().equals("%")) { out.print("selected"); }%>>Porcentaje</option>
				</select></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="20%">
				<div align="right">Fianza Garantia :</div>
				</td>
				<td nowrap width="60%"><eibsinput:text name="prd"
					property="E01APAGRF"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" /> <select
					name="E01APATY4">
					<option value=" "></option>
					<option value="F"
						<%if (prd.getE01APATY4().equals("F")) {out.print("selected"); }%>>Fijo</option>
					<option value="%"
						<%if (prd.getE01APATY4().equals("%")) { out.print("selected"); }%>>Porcentaje</option>
				</select></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="20%">
				<div align="right">Honorarios Inspeccion :</div>
				</td>
				<td nowrap width="60%"><eibsinput:text name="prd"
					property="E01APAHOI"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" /> <select
					name="E01APATY5">
					<option value=" "></option>
					<option value="F"
						<%if (prd.getE01APATY5().equals("F")) {out.print("selected"); }%>>Fijo</option>
					<option value="%"
						<%if (prd.getE01APATY5().equals("%")) { out.print("selected"); }%>>Porcentaje</option>
				</select></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="20%">
				<div align="right">Comision Valuacion :</div>
				</td>
				<td nowrap width="60%"><eibsinput:text name="prd"
					property="E01APAFLA"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" /> <select
					name="E01APATY6">
					<option value=" "></option>
					<option value="F"
						<%if (prd.getE01APATY6().equals("F")) {out.print("selected"); }%>>Fijo</option>
					<option value="%"
						<%if (prd.getE01APATY6().equals("%")) { out.print("selected"); }%>>Porcentaje</option>
				</select></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="20%">
				<div align="right">Producto de credito :</div>
				</td>
				<td><eibsinput:help name="prd" property="E01APAPRD"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>"
					fn_param_one="E01APAPRD" fn_param_two='10' /></td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Producto de Anticipo :</div>
				</td>
				<td nowrap width="60%"><eibsinput:help name="prd"
					property="E01APAANP"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>"
					fn_param_one="E01APAANP" fn_param_two='10' /></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="20%">
				<div align="right">Producto de Ampliacion :</div>
				</td>
				<td nowrap width="60%"><eibsinput:help name="prd"
					property="E01APAAMP"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>"
					fn_param_one="E01APAAMP" fn_param_two='10' /></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Códigos de Usuario 1 :</div>
				</td>
				<td nowrap width="60%"><eibsinput:text name="prd"
					property="E01APAUS1"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" /> <eibsinput:text
					name="prd" property="E01APAUS2"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" /> <eibsinput:text
					name="prd" property="E01APAUS3"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" /> <eibsinput:text
					name="prd" property="E01APAUS4"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" /></td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Códigos de Usuario 2 :</div>
				</td>
				<td nowrap width="60%"><eibsinput:text name="prd"
					property="E01APAUS5"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" /> <eibsinput:text
					name="prd" property="E01APAUS6"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" /> <eibsinput:text
					name="prd" property="E01APAUS7"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" /> <eibsinput:text
					name="prd" property="E01APAUS8"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" /></td>
			</tr>

		</table>
		</td>
	</tr>
</table>



<div align="center">
<p><input id="EIBSBTN" type=button name="Submit" OnClick="submit()"
	value="Enviar"></p>
</div>


</form>
</body>
</html>
