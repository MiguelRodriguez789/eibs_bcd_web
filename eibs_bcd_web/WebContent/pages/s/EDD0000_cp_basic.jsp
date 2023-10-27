<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Cuentas Cuotas de Participaci&oacute;n</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<%@ page import="java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>


<jsp:useBean id="cpBasic" class="datapro.eibs.beans.EDD000001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
	
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

</head>
<body>
<SCRIPT type="text/javascript">

	builtNewMenu(cpar_m_opt);
	initMenu();

//  Process according with user selection
 function goAction(op) {
	
   	switch (op){
	// Validate & Write 
  	case 1:  {
    	document.forms[0].APPROVAL.value = 'N';
       	break;
        }
	// Validate and Approve
	case 2:  {
 		document.forms[0].APPROVAL.value = 'Y';
       	break;
		}
	}
	document.forms[0].submit();
 }
 
</SCRIPT>

<%
		if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	    }

	    boolean protect = JSEIBSProp.getProtectedBNKBRN();
	    String blocked = "";
	    if (!currUser.getE01AUT().equals("B")) {
		blocked = "readonly disabled";
	    }
%>
<H3 align="center">Mantenimiento de Cuentas Cuotas de Participaci&oacute;n<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="cp_basic.jsp, EDD0000"></H3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000">
<INPUT TYPE=HIDDEN NAME="SCREEN"    VALUE="62"> 
<INPUT TYPE=HIDDEN NAME="E01ACMATY" VALUE="<%=cpBasic.getE01ACMATY().trim()%>"> 
<INPUT TYPE=HIDDEN NAME="E01ACMACD" VALUE="<%=cpBasic.getE01ACMACD().trim()%>"> 
<INPUT TYPE=HIDDEN NAME="APPROVAL"  VALUE="N">

<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			class="tbhead">
			<tr id="trclear">
				<td nowrap width="16%">
				<div align="right"><b>Cliente :</b></div>
				</td>
				<td nowrap width="20%">
				<div align="left"><input type="text" name="E01ACMCUN"
					size="10" maxlength="9" value="<%=cpBasic.getE01ACMCUN().trim()%>">
				<a href="javascript:GetCustomer('E01ACMCUN')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a></div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Nombre :</b></div>
				</td>
				<td nowrap colspan="3">
				<div align="left"><font face="Arial"><font face="Arial"><font
					size="2"> <input type="text" name="E01CUSNA1" size="45"
					maxlength="45" value="<%=cpBasic.getE01CUSNA1().trim()%>">
				</font></font></font></div>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="16%">
				<div align="right"><b>Cuenta :</b></div>
				</td>
				<td nowrap width="20%">
				<div align="left"><input type="text" name="E01ACMACC"
					size="13" maxlength="12"
					value="<%=cpBasic.getE01ACMACC().trim()%>" readonly></div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Moneda : </b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01DEACCY"
					size="3" maxlength="3" value="<%=userPO.getCurrency().trim()%>"
					readonly> </b></div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Producto : </b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01ACMPRO"
					size="4" maxlength="4" value="<%=cpBasic.getE01ACMPRO().trim()%>">
				</b></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<H4>Datos B&aacute;sicos de la Operaci&oacute;n</H4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Nombre de la Cuenta:</div>
				</td>
				<td nowrap width="19%"><input type="text" name="E01ACMNME"
					size="60" maxlength="80"
					value="<%=cpBasic.getE01ACMNME().trim()%>"></td>
				<td nowrap width="26%">
				<div align="right">C&oacute;digo Referencial:</div>
				</td>
				<td nowrap width="26%"><select name="E01ACMRCD">
					<option value=" "
						<%if (!(cpBasic.getE01ACMRCD().equals("D")
		    || cpBasic.getE01ACMRCD().equals("C") || cpBasic
		    .getE01ACMRCD().equals("A")))
		out.print("selected");%>></option>
					<option value="D"
						<%if (cpBasic.getE01ACMRCD().equals("D"))
		out.print("selected");%>>D&eacute;bitos</option>
					<option value="C"
						<%if (cpBasic.getE01ACMRCD().equals("C"))
		out.print("selected");%>>Cr&eacute;ditos</option>
					<option value="A"
						<%if (cpBasic.getE01ACMRCD().equals("A"))
		out.print("selected");%>>Ambos</option>
				</select></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right">Fecha de Apertura:</div>
				</td>
				<td nowrap width="19%">
					<eibsinput:date name="cpBasic" fn_month="E01ACMOPM" fn_day="E01ACMOPD" fn_year="E01ACMOPY" readonly="true" />
				</td>
				<td nowrap width="26%">
				<div align="right">Fecha de Ingreso:</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:date name="cpBasic" fn_month="E01ACMSUM" fn_day="E01ACMSUD" fn_year="E01ACMSUY" readonly="true" />
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Retenci&oacute;n de Impuestos:</div>
				</td>
				<td nowrap width="19%"><input type="text" name="E01ACMWHF"
					size="2" maxlength="1" value="<%=cpBasic.getE01ACMWHF().trim()%>"
					<%=blocked%>> <%
 if (blocked == "") {
 %> <a
					href="javascript:GetCode('E01ACMWHF','STATIC_cd_taxes.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a><img
					src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" align="bottom" border="0"> <%
 }
 %>
				</td>
				<td nowrap width="26%">
				<div align="right">Tipo Cuenta :</div>
				</td>
				<td nowrap width="26%"><select name="E01ACMPEC">
					<option value=" "
						<%if (!(cpBasic.getE01ACMPEC().equals("1") || cpBasic.getE01ACMPEC()
		    .equals("2")))
		out.print("selected");%>></option>
					<option value="1"
						<%if (cpBasic.getE01ACMPEC().equals("1"))
		out.print("selected");%>>Indistinto</option>
					<option value="2"
						<%if (cpBasic.getE01ACMPEC().equals("2"))
		out.print("selected");%>>Conjunto</option>
				</select></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%" height="23">
				<div align="right">Mensajes al Cliente:</div>
				</td>
				<td nowrap width="19%" height="23"><input type="hidden"
					name="E01ACMPMF" value="<%=cpBasic.getE01ACMPMF()%>"> <input
					type="radio" name="CE01ACMPMF" value="Y"
					onClick="document.forms[0].E01ACMPMF.value='Y'"
					<%if (cpBasic.getE01ACMPMF().equals("Y"))
		out.print("checked");%>>
				S&iacute; <input type="radio" name="CE01ACMPMF" value="N"
					onClick="document.forms[0].E01ACMPMF.value='N'"
					<%if (cpBasic.getE01ACMPMF().equals("N"))
		out.print("checked");%>>
				No</td>
				<td nowrap width="26%" height="23">
				<div align="right">Manejo de Sub-Cuentas:</div>
				</td>
				<td nowrap width="26%" height="23"><input type="hidden"
					name="E01ACMPTF" value="<%=cpBasic.getE01ACMPTF()%>"> <input
					type="radio" name="CE01ACMPTF" value="Y"
					onClick="document.forms[0].E01ACMPTF.value='Y'"
					<%if (cpBasic.getE01ACMPTF().equals("Y"))
		out.print("checked");%>>
				S&iacute; <input type="radio" name="CE01ACMPTF" value="N"
					onClick="document.forms[0].E01ACMPTF.value='N'"
					<%if (cpBasic.getE01ACMPTF().equals("N"))
		out.print("checked");%>>
				No <img src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" align="bottom" border="0"></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%" height="19">
				<div align="right">N&uacute;mero de Direcci&oacute;n Postal:</div>
				</td>
				<td nowrap width="19%" height="19"><input type="text"
					name="E01ACMMLA" size="2" maxlength="2"
					value="<%=cpBasic.getE01ACMMLA().trim()%>"> <a
					href="javascript:GetMailing('E01ACMMLA',document.forms[0].E01ACMCUN.value)"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="middle" border="0"></a></td>
				<td nowrap width="26%" height="19">
				<div align="right">Centro de Costo:</div>
				</td>
				<td nowrap width="26%" height="19"><input type="text"
					name="E01ACMCCN" size="8" maxlength="8"
					value="<%=cpBasic.getE01ACMCCN().trim()%>"> <a
					href="javascript:GetCostCenter('E01ACMCCN','01')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="help"
					align="middle" border="0"></a> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" align="bottom" border="0"></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%" height="19">
				<div align="right">Diferidos Locales:</div>
				</td>
				<td nowrap width="19%" height="19"><input type="text" size="2"
					maxlength="1" value="<%=cpBasic.getE01ACMWLF().trim()%>"
					name="E01ACMWLF" <%=blocked%>> <%
 if (blocked == "") {
 %> <a
					href="javascript:GetCode('E01ACMWLF','STATIC_rt_delay.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <%
 }
 %>
				</td>
				<td nowrap width="26%" height="19">
				<div align="right">Diferidos No Locales:</div>
				</td>
				<td nowrap width="26%" height="19"><input type="text" size="2"
					maxlength="1" value="<%=cpBasic.getE01ACMWNF().trim()%>"
					name="E01ACMWNF" <%=blocked%>> <%
 if (blocked == "") {
 %> <a
					href="javascript:GetCode('E01ACMWNF','STATIC_rt_delay.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <%
 }
 %>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%" height="19">
				<div align="right">Tabla de Documentos:</div>
				</td>
				<td nowrap width="19%" height="19"><input type="text"
					name="E01APCTNU" size="3" readonly maxlength="2"
					value="<%=cpBasic.getE01APCTNU().trim()%>"></td>
				<td nowrap width="29%" height="19">
				<div align="right">Banco/Sucursal :</div>
				</td>
				<td nowrap>
				<%
				if (!protect && cpBasic.getH01FLGMAS().equals("N")) {
				%> <input
					type="text" name="E01ACMBNK" size="2" maxlength="2"
					value="<%=cpBasic.getE01ACMBNK().trim()%>"> <input
					type="text" name="E01ACMBRN" size="5" maxlength="4"
					value="<%=cpBasic.getE01ACMBRN().trim()%>"> <a
					href="javascript:GetBranch('E01ACMBRN','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda"
					align="bottom" border="0"></a> <%
 } else {
 %> <input type="text"
					name="E01ACMBNK" size="2" maxlength="2"
					value="<%=cpBasic.getE01ACMBNK().trim()%>" readonly> <input
					type="text" name="E01ACMBRN" size="5" maxlength="4"
					value="<%=cpBasic.getE01ACMBRN().trim()%>" readonly> <%
 }
 %>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<H4>Informaci&oacute;n para Cargos por Servicios</H4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="30%">
				<div align="right">Cargos por Servicios:</div>
				</td>
				<td nowrap width="18%"><input type="hidden" name="E01ACMSCF"
					value="<%=cpBasic.getE01ACMSCF()%>"> <input type="radio"
					name="CE01ACMSCF" value="Y"
					onClick="document.forms[0].E01ACMSCF.value='Y'"
					<%if (cpBasic.getE01ACMSCF().equals("Y"))
		out.print("checked");%>
					<%=blocked%>> S&iacute; <input type="radio"
					name="CE01ACMSCF" value="N"
					onClick="document.forms[0].E01ACMSCF.value='N'"
					<%if (cpBasic.getE01ACMSCF().equals("N"))
		out.print("checked");%>
					<%=blocked%>> No <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" align="bottom" border="0"></td>
				<td nowrap width="28%">
				<div align="right">Frecuencia Cobro Cargos:</div>
				</td>
				<td nowrap width="24%"><select name="E01ACMSHF" <%=blocked%>>
					<option value=" "
						<%if (!(cpBasic.getE01ACMSHF().equals("D")
		    || cpBasic.getE01ACMSHF().equals("W")
		    || cpBasic.getE01ACMSHF().equals("B")
		    || cpBasic.getE01ACMSHF().equals("M") || cpBasic
		    .getE01ACMSHF().equals("Q")))
		out.print("selected");%>></option>
					<option value="D"
						<%if (cpBasic.getE01ACMSHF().equals("D"))
		out.print("selected");%>>Diario</option>
					<option value="W"
						<%if (cpBasic.getE01ACMSHF().equals("W"))
		out.print("selected");%>>Semanal</option>
					<option value="B"
						<%if (cpBasic.getE01ACMSHF().equals("B"))
		out.print("selected");%>>Quincenal</option>
					<option value="M"
						<%if (cpBasic.getE01ACMSHF().equals("M"))
		out.print("selected");%>>Mensual</option>
					<option value="Q"
						<%if (cpBasic.getE01ACMSHF().equals("Q"))
		out.print("selected");%>>Trimestral</option>
				</select> <img src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" align="bottom" border="0"></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%">
				<div align="right">C&oacute;digos Tabla de Cargos:</div>
				</td>
				<td nowrap width="18%"><input type="text" name="E01ACMACL"
					size="2" maxlength="2" value="<%=cpBasic.getE01ACMACL().trim()%>"
					<%=blocked%>> <%
 if (blocked == "") {
 %> <a
					href="javascript:GetRetCod('E01ACMACL',document.forms[0].E01ACMATY.value)"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="middle" border="0"></a> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" align="bottom" border="0"> <%
 }
 %>
				</td>
				<td nowrap width="28%">
				<div align="right">Ciclo/D&iacute;a de Cobro de Cargos:</div>
				</td>
				<td nowrap width="24%"><input type="text" name="E01ACMSHY"
					size="3" maxlength="2" value="<%=cpBasic.getE01ACMSHY().trim()%>"
					<%=blocked%>> <%
 if (blocked == "") {
 %> <a
					href="javascript:GetCode('E01ACMSHY','STATIC_rt_ciclo.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" align="bottom" border="0"> <%
 }
 %>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<H4>Informaci&oacute;n Estado de Cuenta</H4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="30%">
				<div align="right">Frecuencia :</div>
				</td>
				<td nowrap width="18%">
	              <select name="E01ACMSTF">
					<option value=" " <% if (!(cpBasic.getE01ACMSTF().equals("D") ||cpBasic.getE01ACMSTF().equals("W")
					||cpBasic.getE01ACMSTF().equals("B")||cpBasic.getE01ACMSTF().equals("M")
					||cpBasic.getE01ACMSTF().equals("Q")||cpBasic.getE01ACMSTF().equals("Y")))
					out.print("selected"); %>></option>
<%--
	                <option value="D" <%if (cpBasic.getE01ACMSTF().equals("D")) out.print("selected"); %>>Diario</option>
	                <option value="W" <%if (cpBasic.getE01ACMSTF().equals("W")) out.print("selected"); %>>Semanal</option>
	                <option value="B" <%if (cpBasic.getE01ACMSTF().equals("B")) out.print("selected"); %>>Quincenal</option>
	                <option value="M" <%if (cpBasic.getE01ACMSTF().equals("M")) out.print("selected"); %>>Mensual</option>
	                <option value="Q" <%if (cpBasic.getE01ACMSTF().equals("Q")) out.print("selected"); %>>Trimestral</option>
--%>	                
	                <option value="Y" <%if (cpBasic.getE01ACMSTF().equals("Y")) out.print("selected"); %>>Anual</option>
	              </select>
	                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
				</td>
				<td nowrap width="28%">
				<div align="right">Retenci&oacute;n de Correos :</div>
				</td>
				<td nowrap width="24%"><font face="Arial" size="2"> <input
					type="hidden" name="E01ACMHSF" value="<%=cpBasic.getE01ACMHSF()%>">
				<input type="radio" name="CE01ACMHSF" value="H"
					onClick="document.forms[0].E01ACMHSF.value='H'"
					<%if (cpBasic.getE01ACMHSF().equals("H"))
		out.print("checked");%>>
				S&iacute; <input type="radio" name="CE01ACMHSF" value=""
					onClick="document.forms[0].E01ACMHSF.value=''"
					<%if (cpBasic.getE01ACMHSF().equals(""))
		out.print("checked");%>>
				No </font></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%">
				<div align="right">Ciclo/D&iacute;a Impresi&oacute;n :</div>
				</td>
				<td nowrap width="18%"><input type="text" name="E01ACMSDY"
					size="3" maxlength="2" value="<%=cpBasic.getE01ACMSDY().trim()%>">
				<a href="javascript:GetCode('E01ACMSDY','STATIC_rt_ciclo.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <img
					src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" align="bottom" border="0"></td>
				<td nowrap width="28%">
				<div align="right">Estado Consolidado :</div>
				</td>
				<td nowrap width="24%"><font face="Arial" size="2"> <input
					type="hidden" name="E01ACMCSF" value="<%=cpBasic.getE01ACMCSF()%>">
				<input type="radio" name="CE01ACMCSF" value="Y"
					onClick="document.forms[0].E01ACMCSF.value='Y'"
					<%if (cpBasic.getE01ACMCSF().equals("Y"))
		out.print("checked");%>>
				S&iacute; <input type="radio" name="CE01ACMCSF" value="N"
					onClick="document.forms[0].E01ACMCSF.value='N'"
					<%if (cpBasic.getE01ACMCSF().equals("N"))
		out.print("checked");%>>
				No</font></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="30%" height="23">
				<div align="right">Tipo de Estado de Cuenta :</div>
				</td>
				<td nowrap width="18%" height="23"><select name="E01ACMSTY">
					<option value=" "
						<%if (!(cpBasic.getE01ACMSTY().equals("P")
		    || cpBasic.getE01ACMSTY().equals("C") || cpBasic
		    .getE01ACMSTY().equals("N")))
		out.print("selected");%>></option>
					<option value="P"
						<%if (cpBasic.getE01ACMSTY().equals("P"))
		out.print("selected");%>>Personal</option>
					<option value="C"
						<%if (cpBasic.getE01ACMSTY().equals("C"))
		out.print("selected");%>>Corporativa</option>
					<option value="N"
						<%if (cpBasic.getE01ACMSTY().equals("N"))
		out.print("selected");%>>Ninguna</option>
				</select> <img src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" align="bottom" border="0"></td>
				<td nowrap width="28%" height="23">
				<div align="right">Forma de Env&iacute;o :</div>
				</td>
				<td nowrap width="24%" height="23"><select name="E01ACMSTE"
					<%if (cpBasic.getH01FLGWK2().equals("Y")) {%> disabled="disabled"
					<%}%>>
					<option value="N"
						<%if (!(cpBasic.getE01ACMSTE().equals("T")
		    || cpBasic.getE01ACMSTE().equals("P")
		    || cpBasic.getE01ACMSTE().equals("F") || cpBasic
		    .getE01ACMSTE().equals("E")))
		out.print("selected");%>>Ninguno</option>
					<option value="T"
						<%if (cpBasic.getE01ACMSTE().equals("T"))
		out.print("selected");%>>Telex</option>
					<option value="P"
						<%if (cpBasic.getE01ACMSTE().equals("P"))
		out.print("selected");%>>Impresora</option>
					<option value="F"
						<%if (cpBasic.getE01ACMSTE().equals("F"))
		out.print("selected");%>>Facsimil</option>
					<option value="E"
						<%if (cpBasic.getE01ACMSTE().equals("E"))
		out.print("selected");%>>Email</option>
				</select> <img src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" align="bottom" border="0"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
 <H4>Cuotas de Participaci&oacute;n</H4>
<table id="mainTable" class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="24%">
				<div align="right">Codigo de Convenio :</div>
				</td>
				<td nowrap width="21%"><input type="text" size="5" maxlength="4" name="E01ACMCNV" value="<%=cpBasic.getE01ACMCNV().trim()%>" readonly>
				</td>
				<td nowrap width="25%">
				<div align="right">Fecha de Inicio Mandato :</div>
				</td>
				<td nowrap width="24%">
					<eibsinput:date name="cpBasic" fn_year="E01ACASTY" fn_month="E01ACASTM" fn_day="E01ACASTD" required="false" />
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%">
				<div align="right">Número de Cuotas Pactadas :</div>
				</td><td nowrap width="21%"><input type="text" size="10" maxlength="9" name="E01ACACON" value="<%=cpBasic.getE01ACACON().trim()%>"> (Mensuales)
				</td>
				<td nowrap width="25%">
				<div align="right">Monto en Moneda Nacional :</div>
				</td><td nowrap width="24%">
					<eibsinput:text name="cpBasic" property="E01ACAAUG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false"  /> (Mensual)
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="23%">
					<div align="right">Medio de Pago :</div>
				</td><td nowrap width="21%">
					<select name="E01ACATYR">
						<option></option>
						<option value="0" <% if (cpBasic.getE01ACATYR().equals("0")) out.print("selected");%>>No Programado</option>
						<option value="1" <% if (cpBasic.getE01ACATYR().equals("1")) out.print("selected");%>>Planilla/Nomina</option>
						<option value="2" <% if (cpBasic.getE01ACATYR().equals("2")) out.print("selected");%>>PAC/Automatico</option>
						<option value="3" <% if (cpBasic.getE01ACATYR().equals("3")) out.print("selected");%>>Caja</option>
						<option value="4" <% if (cpBasic.getE01ACATYR().equals("4")) out.print("selected");%>>PAC Multibanco</option>
					</select>
				</td>
				<td nowrap width="25%">
				<div align="right">Cuenta  a Debitar :</div>
				</td><td nowrap width="24%">
	              <INPUT name="E01ACAPAC" size="13" maxlength="12" value="<%= cpBasic.getE01ACAPAC().trim()%>" >
				  <A href="javascript:GetAccByClient('E01ACAPAC','','RT','',document.forms[0].E01ACMCUN.value)"> 
				  <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
				</td>			
			</tr>
			<tr id="trclear">
				<td nowrap width="25%">
				<div align="right">Frecuencia :</div>
				</td>
				<td nowrap width="24%"><select name="E01ACAFRE">
					<option></option>
					<option value="M" <% if (cpBasic.getE01ACAFRE().equals("M")) out.print("selected");%>>Mensual</option>
					<option value="Q" <% if (cpBasic.getE01ACAFRE().equals("Q")) out.print("selected");%>>Trimestral</option>
					<option value="S" <% if (cpBasic.getE01ACAFRE().equals("S")) out.print("selected");%>>Semestral</option>
					<option value="Y" <% if (cpBasic.getE01ACAFRE().equals("Y")) out.print("selected");%>>Anual</option>
				</select>
				</td>
			    <td nowrap width="25%">
				<div align="right">Día de aplicación :</div>
				</td>
					<td nowrap width="24%"><input type="text" size="2" maxlength="3" name="E01ACADMP" value="<%=cpBasic.getE01ACADMP().trim()%>">
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="24%">
				<div align="right">Moneda :</div>
				</td>
				<td nowrap width="21%">
					<eibsinput:help name="cpBasic" property="E01ACACCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" required="false" fn_param_one="E01ACACCY" fn_param_two="document.forms[0].E01ACMBNK.value" />
				</td>			
				<td nowrap width="23%">
					<div align="right">Estado :</div>
				</td><td nowrap width="21%">
					<select name="E01ACASTS">
					<option></option>
					<option value="1" <% if (cpBasic.getE01ACASTS().equals("1")) out.print("selected"); %>>Vigente</option>
					<option value="2" <% if (cpBasic.getE01ACASTS().equals("2")) out.print("selected"); %>>No Vigente</option>
				</select>
				</td>
				<td nowrap width="25%"></td><td nowrap width="24%"></td>			
			</tr>
		</table>
		</td>
	</tr>
</table>
<% 
 	if (cpBasic.getH01FLGMAS().equals("N")) {
 %>
<H4>Origen de Fondos</H4>
<TABLE id="mainTable" class="tableinfo">
	<TR>
		<TD>

		<table id="headTable">
			<tr id="trdark">
				<td nowrap align="center">Concepto</td>
				<td nowrap align="center">Banco</td>
				<td nowrap align="center">Sucursal</td>
				<td nowrap align="center">Moneda</td>
				<td nowrap align="center">Referencia</td>
				<td nowrap align="center">Monto</td>
			</tr>
		</table>

		<div id="dataDiv" style="height:60; overflow-y :scroll; z-index:0">
		<table id="dataTable">
			<% 
					int amount = 9;
					String name;
					for (int i = 1; i <= amount; i++) {
					    name = i + "";
			%>
			<tr id="trclear">
				<td nowrap>
				<div align="center" ><input type="text"
					name="E01OFFOP<%=name %>" id="E01OFFOP<%=name%>"
					value="<%=cpBasic.getField("E01OFFOP" + name).getString()
			    .trim()%>"
					size="3" maxlength="3"> <input type="hidden"
					name="E01OFFGL<%=name%>"
					value="<%=cpBasic.getField("E01OFFGL" + name).getString()
			    .trim()%>">
				<input type="text" name="E01OFFCO<%=name%>" size="25"
					maxlength="25" readonly 
					value="<%=cpBasic.getField("E01OFFCO" + name).getString()
			    .trim()%>"
					class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01ACMBNK.value, document.forms[0].E01OFFCY<%=name%>.value,'E01OFFGL<%=name%>','E01OFFOP<%=name%>',document.forms[0].E01ACMACD.value, ' '); return false;">
				</div>
				</td>          
				<td nowrap>
				<div align="center"><input type="text"
					name="E01OFFBK<%=name%>" size="2" maxlength="2"
					value="<%=cpBasic.getField("E01OFFBK" + name).getString()
			    .trim()%>">
				</div>
				</td>
				<td nowrap>
				<div align="center"><input type="text"
					name="E01OFFBR<%=name%>" size="5" maxlength="4"
					value="<%=cpBasic.getField("E01OFFBR" + name).getString()
			    .trim()%>"
					class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01ACMBNK.value,'','','',''); return false;">
				</div>
				</td>
				<td nowrap>
				<div align="center"><input type="text"
					name="E01OFFCY<%=name%>" size="3" maxlength="3"
					value="<%=cpBasic.getField("E01OFFCY" + name).getString().trim()%>"
					class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01ACMBNK.value,'','','',''); return false;">
				</div>
				</td>
				<td nowrap>
				<div align="center"><input type="text"
					name="E01OFFAC<%=name%>" id="E01OFFAC<%=name%>" size="13"
					maxlength="12"
					value="<%=cpBasic.getField("E01OFFAC" + name).getString()
			    .trim()%>"
	                class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E01ACMBNK.value,'',document.forms[0].E01ACMCUN.value,'','RT'); return false;">
				</div>
				</td>
				<td nowrap>
				<div align="center"><input type="text"
					name="E01OFFAM<%=name%>" size="15" maxlength="15"
					value="<%=cpBasic.getField("E01OFFAM" + name).getString()
			    .trim()%>"
					onKeypress="enterDecimal()"></div>
				</td>
			</tr>
			<% 
			}
			%>
		</table>
		</div>


		<TABLE id="footTable">
			<tr id="trdark">
				<td nowrap align="right"><b>Equivalente Moneda de la
				Cuenta:</b></td>
				<td nowrap align="center"><input type="text" name="E01OFFEQV"
					size="15" maxlength="15" readonly
					value="<%=cpBasic.getE01OFFEQV().trim()%>"></td>
			</tr>
		</table>

		</TD>
	</TR>
</TABLE>
<SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv'),0,true);
   }
  tableresize();
  window.onresize=tableresize; 
  </SCRIPT> <% 
 }
 %> <% 
 if (error.getERWRNG().equals("Y")) {
 %>
<h4 style="text-align:center"><input type="checkbox"
	name="H01FLGWK2" value="A"
	<% if (cpBasic.getH01FLGWK2().equals("A")) {
		    out.print("checked");
		}%>>
Aceptar con Aviso</h4>
<% 
}
%>

<table width="100%">
	<tr>
		<% 
		if (cpBasic.getH01FLGWK2().equals("Y")) {
		%>
		<td width="50%">
		<% 
		} else {
		%>
		<td width="100%">
		<% 
		}
		%>

		<div align="center"><input id="EIBSBTN" type="button"
			name="Submit" value="Enviar" onClick="javascript:goAction(1);">
		</div>
		</td>
		<% 
		if (cpBasic.getH01FLGWK2().equals("Y")) {
		%>
		<td width="50%">
		<div align="center"><input id="EIBSBTN" type="button"
			name="Submit2" value="Crear" onClick="javascript:goAction(2);">
		</div>
		</td>
		<% 
		}
		%>
		
	</tr>
</table>


</form>
</body>
</html>
