<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Consulta de Productos de Productos y Derivados</title>
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

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message" scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<body>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }
%>

<h3 align="center">Producto de Productos y Derivados<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="products_inq_ln.jsp, ESD0711"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700">
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="1"> 
<INPUT TYPE=HIDDEN NAME="E01APCACD" ID="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">

<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" class="tbhead"
			align="center">
			<tr>
				<td nowrap width="10%" align="right">Banco :</td>
				<td nowrap width="12%" align="left">
 	               <eibsinput:text name="prd" property="E01APCBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
				</td>
				<td nowrap width="6%" align="right">Producto :</td>
				<td nowrap width="14%" align="left">
 	               <eibsinput:text name="prd" property="E01APCCDE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
				</td>
				<td nowrap width="8%" align="right">Tipo de Producto :</td>
				<td nowrap width="50%" align="left">
 	               <eibsinput:text name="prd" property="E01APCTYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
					-
 	               <eibsinput:text name="prd" property="E01DSCTYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
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
				<td>
 	               <eibsinput:text name="prd" property="E01APCDS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
				</td>
				<td>
				<div align="right">Nombre de Mercadeo :</div>
				</td>
				<td>
 	               <eibsinput:text name="prd" property="E01APCDS2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" />
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">C&oacute;digo de Moneda :</div>
				</td>
				<td>
			        <eibsinput:help name="prd" property="E01APCCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" 
	               	    	fn_param_one="E01APCCCY" fn_param_two="document.getElementById('E01APCBNK').value"/>
				</td>
				<td>
				<div align="right">Ofrecimiento por :</div>
				</td>
				<td><select name="E01APCFTT" id="E01APCFTT">
					<option value="1"
						<%if (prd.getE01APCFTT().equals("1")) { out.print("selected"); }%>>Internet</option>
					<option value="I"
						<%if (prd.getE01APCFTT().equals("I")) { out.print("selected"); }%>>Internacional</option>
					<option value="L"
						<%if (prd.getE01APCFTT().equals("L")) { out.print("selected"); }%>>Local</option>
					<option value="3"
						<%if (prd.getE01APCFTT().equals("3")) { out.print("selected"); }%>>Plataforma</option>
					<option value="5"
						<%if (prd.getE01APCFTT().equals("5")) { out.print("selected"); }%>>Cualquier
					Medio</option>
					<option value="N"
						<%if (prd.getE01APCFTT().equals("N")) { out.print("selected"); }%>>No
					Ofrecer</option>
				</select></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Cuenta Contable :</div>
				</td>
				<td>
			        <eibsinput:help name="prd" property="E01APCGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" 
	               	    	fn_param_one="E01APCGLN" 
	               	    	fn_param_two="document.getElementById('E01APCBNK').value" 
	               	    	fn_param_three="document.getElementById('E01APCCCY').value" 
	               	    	fn_param_four=" "
	               	    	fn_param_five="document.getElementById('E01APCTYP').value"/>
				</td>
				<td>
				<div align="right">Retenci&oacute;n de Impuestos :</div>
				</td>
				<td>
					<input type="text" name="E01APCTAX" id="E01APCTAX" size="3" maxlength="2" value="<%= prd.getE01APCTAX()%>"> 
					<a href="javascript:GetCode('E01APCTAX','STATIC_ln_prod_tax_ret.jsp')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0">
					</a>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Tabla de Documentos :</div>
				</td>
				<td>
					<input type="text" name="E01APCDOC" id="E01APCDOC" size="4" maxlength="2" value="<%= prd.getE01APCDOC().trim()%>"> 
					<a href="javascript:GetDocInv('E01APCDOC')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0">
					</a>
				</td>
				<td>
				<div align="right">Producto Familia :</div>
				</td>
				<td>
					<eibsinput:text property="E01APCUC1" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC %>" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<div align="center">
	<input id="EIBSBTN" type=button name="Submit" OnClick="submit()" value="Enviar">
</div>

</form>
</body>
</html>
