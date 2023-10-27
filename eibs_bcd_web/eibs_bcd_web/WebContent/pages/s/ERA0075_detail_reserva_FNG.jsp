<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Creación/Mantenimiento de Reservas de Garantías</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="gaDetail" class="datapro.eibs.beans.ERA007501Message" scope="session"/>
<jsp:useBean id="gaListIns" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="currClient" class="datapro.eibs.beans.ESD080001Message" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<%
	boolean readOnlyRes = false;
	boolean readOnlyAdm = false;
	boolean isAdmon = false;
	String read_only1 = "";
	String disabled1 = "";
	String client = currClient != null ? currClient.getE01CUSCUN().trim() : "";
	String curname = currClient != null ? currClient.getE01CUSNA1().trim() : "";
	String iopecod = gaDetail != null ? gaDetail.getH01OPECOD().trim() : "";
	String oopecod = gaDetail != null ? gaDetail.getH01OPECOD().trim() : "";
	String title = "";
	if (iopecod.equals("0001")||iopecod.equals("0004")||iopecod.equals("0005")) {
		oopecod = "0002";
	}
	if (iopecod.equals("0006")) {
		oopecod = "0003";
	}
	if (iopecod.equals("0009")||iopecod.equals("0010")) {
		oopecod = "0010";
		isAdmon = true;
	}
	//PROTEGER CAMPOS PARA CONSULTA Y BORRADO
	if (iopecod.equals("0003") || iopecod.equals("0005") || iopecod.equals("0006") || isAdmon) {
		readOnlyRes = true;
		read_only1 = "readonly";
		disabled1 = "disabled";
	}
	if (userPO.getPurpose().equals("INQUIRY")) {
		readOnlyRes = true;
		read_only1 = "readonly";
		disabled1 = "disabled";
	}
	if (!(isAdmon && userPO.getPurpose().equals("MAINTENANCE"))) {
		readOnlyAdm = true;
	}
	// TITLE
	if (userPO.getPurpose().equals("NEW")) {
		title = "Nueva";
	} else if (userPO.getPurpose().equals("INQUIRY")) { 
		title = "Consulta";
	} else {
		title = "Mantenimiento";
	}
	if (isAdmon) {
		title = title.trim() + " Administracion de Fondos";
	} else {
		title = title.trim() + " Reserva";
	}
%>

<SCRIPT type="text/javascript">

function initPage() {
	if (isValidObject(getElement("E01RESCOM"))) {
		document.forms[0].E01RESCOM.value = "<%=gaDetail.getE01RESCOM().trim()%>";
	}
}

function limitText(limitField, limitNum) {
	if (limitField.value.length > limitNum + 1) { 
		if (document.forms[0].LAN.value == 'S') {
			alert('Límite de texto excedido');
		} else {
			alert('Límite de texto excedido');
		}	
	}	
	if (limitField.value.length > limitNum) {
		limitField.value = limitField.value.substring(0, limitNum);
	}
}

function goExit() {
	window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
}  

</script>

<% if (!userPO.getPurpose().equals("NEW")) { %>
<SCRIPT type="text/javascript">
//MENU AQUI   
</SCRIPT>
<% } %> 

</head>

<body onload="initPage();">
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 

<%
	 double reint = 0;
	 double total = 0;
	 reint = gaDetail.getBigDecimalE01RESMRC().doubleValue() - gaDetail.getBigDecimalE01RESMAC().doubleValue();
	 total = gaDetail.getBigDecimalE01RESMA1().doubleValue() + reint;
%>

<h3 align="center">
<%=title%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ERA0075_detail_reserva_FNG.jsp,ERA0075"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0075" >
	<input type=HIDDEN name="E01RESBNK" value="<%=gaDetail.getE01RESBNK().trim()%>" >                 
	<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
	<input TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="202">
	<input type=HIDDEN name="PURPOSE" value="<%= userPO.getPurpose()%>">
	
	<% int row = 0; %>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap><div align="right"><b>Número de Reserva : </b></div></td>
						<td nowrap > 
							<div align="left"> 
								<input type="text" name="E01RESNRE" readonly size="14" maxlength="12" value="<%=gaDetail.getE01RESNRE().trim()%>">
							</div>
						</td>
						<td nowrap><div align="right"><b>Garantia Asignada : </b></div></td>
						<td nowrap> 
							<input type="text" name="E01RESNGA" readonly size="14" maxlength="12" value="<%=gaDetail.getE01RESNGA().trim()%>">
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap><div align="right"><b>Cliente : </b></div></td>
						<td nowrap > 
							<div align="left"> 
								<% if (gaDetail.getE01RESEST().equals("N")) { %>  
								<input type="text" name="E01RESCUN" id="E01RESCUN" size="11" maxlength="9" value="<%=gaDetail.getE01RESCUN().trim().equals("0") ? client : gaDetail.getE01RESCUN().trim()%>">
								<a href="javascript:GetCustomerDescId('E01RESCUN','E01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
								<% } else { %> 
								<input type="text" name="E01RESCUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01RESCUN().trim()%>">
								<% } %>
							</div>
						</td>
						<td nowrap><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap> 
							<div align="left">
								<input type="text" name="E01CUSNA1" id="E01CUSNA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01CUSNA1().trim().equals("") ? curname  : gaDetail.getE01CUSNA1().trim()%>" >
							</div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap ><div align="right"><b>Tipo de Identificación : </b></div></td>
						<td nowrap>
							<input type="text" name="D01CUSTID" id="D01CUSTID" size="4" maxlength="4" value="<%=gaDetail.getD01CUSTID().trim()%>" readonly>
						</td> 
						<td nowrap><div align="right"><b>Número : </b></div></td>
						<td nowrap> 
							<div align="left">
							 <input type="text" name="E01CUSIDN" id="E01CUSIDN" size="20" maxlength="20" value="<%=gaDetail.getE01CUSIDN().trim()%>" readonly> 
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<% if (!isAdmon) { %>
	<h4>Informaci&oacute;n de la Reserva</h4>
	<table class="tableinfo" width="100%">
		<tr > 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap><div align="right">Fondo de Garantías : </div></td>
						<td nowrap >
							<% if (readOnlyRes == false) { %>
							<eibsinput:cnofc name="gaDetail" flag="FJ" property="E01RESCFG" fn_description="D01RESCFG" required="true" readonly="<%=readOnlyRes%>"/>
							<% } else { %>
					 		<eibsinput:text name="gaDetail" property="E01RESCFG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=readOnlyRes%>" modified="F01RESCFG"/>
							<% } %>
							<eibsinput:text name="gaDetail" property="D01RESCFG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01RESCFG"/>
						</td>
						<td nowrap ></td>
						<td nowrap ></td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap><div align="right">Tipo ID Ante el Fondo de Garantías : </div></td>
						<td nowrap >
							<% if (readOnlyRes == false) { %>
							<eibsinput:cnofc name="gaDetail" flag="34" property="E01RESTID" fn_description="D01RESTID" required="true" readonly="<%=readOnlyRes%>"/>
							<% } else { %>
				 			<eibsinput:text name="gaDetail" property="E01RESTID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=readOnlyRes%>" modified="F01RESTID"/>
							<% } %>
							<eibsinput:text name="gaDetail" property="D01RESTID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01RESTID"/>
						</td>
						<td nowrap><div align="right">Número de Identificación : </div></td>
						<td nowrap >
							<eibsinput:text name="gaDetail" property="E01RESIDF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="<%=readOnlyRes%>" modified="F01RESIDF"/>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap><div align="right">Línea Crédito para Control de Cupo :</div></td>
						<td nowrap > 
							<input type="text" name="E01RESFCL" size="10" maxlength="9" value="<%= gaDetail.getE01RESFCL().trim()%>" <% if (gaDetail.getF01RESFCL().equals("Y")) out.print("class=\"txtchanged\"");%> <%=read_only1%>>
							<% if (readOnlyRes == false) { %>
							<a href="javascript:GetCustomer('E01RESFCL')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
							<% } %>
							<input type="text" name="E01RESFLN" size="5" maxlength="4" value="<%= gaDetail.getE01RESFLN().trim()%>" <% if (gaDetail.getF01RESFLN().equals("Y")) out.print("class=\"txtchanged\"");%> <%=read_only1%>>
							<% if (readOnlyRes == false) { %>
							<a href="javascript:GetCreditLine('E01RESFLN',document.forms[0].E01RESFCL.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absmiddle" border="0" ></a> 
							<% } %>
							<img src="<%=request.getContextPath()%>/images/Check.gif" alt="campo obligatorio" align="absbottom" border="0"  > 
						</td>
						<td nowrap><div align="right">Número de Reserva Asignado por el Fondo : </div></td>
						<td nowrap >
							<eibsinput:text name="gaDetail" property="E01RESNRF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="<%=readOnlyRes%>" modified="F01RESNRF"/>
						</td>
					</tr>    
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap ><div align="right">Fecha de Solicitud Reserva : </div></td>
						<td nowrap >
							<eibsinput:date name="gaDetail" fn_year="E01RESFSY" fn_month="E01RESFSM" fn_day="E01RESFSD" required="true" readonly="<%=readOnlyRes%>" modified="F01RESFSY;F01RESFSM;F01RESFSD"/>
						</td>
						<td nowrap><div align="right">Fecha Aprobación Reserva : </div></td>
						<td nowrap >
							<eibsinput:date name="gaDetail" fn_year="E01RESFAY" fn_month="E01RESFAM" fn_day="E01RESFAD" required="true" readonly="<%=readOnlyRes%>" modified="F01RESFAY;F01RESFAM;F01RESFAD"/>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap><div align="right">Oficina Intermediaria :</div></td>
						<td nowrap >
							<input type="text" name="E01RESBRN" id="E01RESBRN" size="5" maxlength="4" value="<%= gaDetail.getE01RESBRN().trim()%>" <%=read_only1%> <% if (gaDetail.getF01RESBRN().equals("Y")) out.print("class=\"txtchanged\"");%>>
							<% if (readOnlyRes == false) { %>
							<a href="javascript:GetBranch('E01RESBRN','E01RESBNK','D01RESBRN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
							<% } %>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
							<eibsinput:text name="gaDetail" property="D01RESBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01RESBRN"/>
						</td>
						<td nowrap ></td>
						<td nowrap ></td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap ><div align="right">Monto de la Reserva : </div></td>
						<td nowrap >
							<eibsinput:text name="gaDetail" property="E01RESMRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=readOnlyRes%>" modified="F01RESMRE"/>
						</td>
						<td nowrap><div align="right">Moneda : </div></td>
						<td nowrap >
				 			<eibsinput:help name="gaDetail" property="E01RESCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01RESCCY" fn_param_two="document.forms[0].E01RESBNK.value" readonly="<%=readOnlyRes%>" modified="F01RESCCY"/>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap><div align="right">Destino : </div></td>
						<td nowrap >
							<% if (readOnlyRes == false) { %>
							<eibsinput:cnofc name="gaDetail" flag="X9" property="E01RESDRE" fn_description="D01RESDRE"   readonly="<%=readOnlyRes%>" />
							<% } else { %>
				 			<eibsinput:text name="gaDetail" property="E01RESDRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=readOnlyRes%>" modified="F01RESDRE"/>
							<% } %>
							<eibsinput:text name="gaDetail" property="D01RESDRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" modified="F01RESDRE"/>
						</td>
						<td nowrap ><div align="right">Producto (Para FNG) : </div></td>
						<td nowrap >
							<% if (readOnlyRes == false) { %>
							<eibsinput:cnofc name="gaDetail" flag="YA" property="E01RESPFN" fn_description="D01RESPFN"  readonly="<%=readOnlyRes%>" modified="F01RESPFN"/>
							<% } else { %>
				 			<eibsinput:text name="gaDetail" property="E01RESPFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>"  readonly="<%=readOnlyRes%>" modified="F01RESPFN"/>
							<% } %>
							<eibsinput:text name="gaDetail" property="D01RESPFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>"  readonly="<%=readOnlyRes%>" modified="F01RESPFN"/>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap><div align="right">Departamento Ubicación : </div></td>
						<td nowrap >
							<% if (readOnlyRes == false) { %>
							<eibsinput:cnofc name="gaDetail" flag="27" property="E01RESDPT" fn_description="D01RESDPT" required="true"/>
							<% } else { %>
				 			<eibsinput:text name="gaDetail" property="E01RESDPT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=readOnlyRes%>" />
							<% } %>
							<eibsinput:text name="gaDetail" property="D01RESDPT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
						</td>
						<td nowrap ><div align="right">Ciudad Ubicación :</div></td>
						<td nowrap >
							<input type="text" name="E01RESCTY" size="6" maxlength="5" value="<%=gaDetail.getE01RESCTY().trim()%>" <%=read_only1%> />
							<% if (readOnlyRes == false) { %>
							<a href="javascript:Get2FilterCodes('E01RESCTY','D01RESCTY','84',' ',document.forms[0].E01RESDPT.value)">
								<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
							</a>
							<% } %>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
							<input type="text" name="D01RESCTY" size="30" maxlength="30" value="<%=gaDetail.getD01RESCTY().trim()%>" readonly>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap><div align="right">Tipo de Cobertura : </div></td>
						<td nowrap >
							<% if (readOnlyRes == false) { %>
							<eibsinput:cnofc name="gaDetail" flag="GI" property="E01RESTCO" fn_description="D01RESTCO" required="true" readonly="<%=readOnlyRes%>"/>
							<% } else { %>
				 			<eibsinput:text name="gaDetail" property="E01RESTCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=readOnlyRes%>" />
							<% } %>
							<eibsinput:text name="gaDetail" property="D01RESTCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
						</td>
						<td nowrap><div align="right">% de Cobertura : </div></td>
						<td nowrap >
							<input type="text" name="E01RESPCO" size="8" maxlength="7" value="<%=gaDetail.getE01RESPCO().trim()%>" required="true" readonly="<%=readOnlyRes%>" onKeyPress="enterDecimal(event,2)" <% if (gaDetail.getF01RESPCO().equals("Y")) out.print("class=\"txtchanged\"");%>>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap><div align="right">Código de Actividad Económica : </div></td>
						<td nowrap >
							<% if (readOnlyRes == false) { %>
							<eibsinput:cnofc name="gaDetail" flag="S3" property="E01RESCAC" fn_description="D01RESCAC" readonly="<%=readOnlyRes%>" required="true"/>
							<% } else { %>
				 			<eibsinput:text name="gaDetail" property="E01RESCAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" modified="F01RESCAC"/>
							<% } %>
							<eibsinput:text name="gaDetail" property="D01RESCAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01RESCAC"/>
						</td>
						<td nowrap ><div align="right">Nivel de Activos : </div></td>
						<td nowrap >
							<eibsinput:text name="gaDetail" property="E01RESNAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=readOnlyRes%>" modified="F01RESNAC"/>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap><div align="right">Tipo de Cartera : </div></td>
						<td nowrap >
							<% if (readOnlyRes == false) { %>
							<eibsinput:cnofc name="gaDetail" flag="9U" property="E01RESTCA" fn_description="D01RESTCA" required="true" readonly="<%=readOnlyRes%>"/>
							<% } else { %>
				 			<eibsinput:text name="gaDetail" property="E01RESTCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=readOnlyRes%>" modified="F01RESTCA"/>
							<% } %>
							<eibsinput:text name="gaDetail" property="D01RESTCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" modified="F01RESTCA"/>
						</td>
						<td nowrap ><div align="right">Calificación de Riesgo : </div></td>
						<td nowrap >
							<% if (readOnlyRes == false) { %>
							<eibsinput:cnofc name="gaDetail" flag="9V" property="E01RESCCR" fn_description="D01RESCCR" required="false" readonly="<%=readOnlyRes%>"/>
							<% } else { %>
				 			<eibsinput:text name="gaDetail" property="E01RESCCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=readOnlyRes%>" modified="F01RESCCR"/>
							<% } %>
							<eibsinput:text name="gaDetail" property="D01RESCCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" modified="F01RESCCR"/>
						</td>
					</tr>
					<%-- 
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap >Reserva Nueva o Novación-Reestructuración :</td>
						<td nowrap >
							<input type="hidden" name="E01RESTRS" value="<%=gaDetail.getE01RESTRS()%>">
							<input type="radio" name="CE01RESTRS" value="N" onClick="document.forms[0].E01RESTRS.value='N'" <% if (gaDetail.getE01RESTRS().equals("N")) out.print("checked");%> <%=disabled1%>>Nueva
							<input type="radio" name="CE01RESTRS" value="R" onClick="document.forms[0].E01RESTRS.value='R'" <% if (gaDetail.getE01RESTRS().equals("R")) out.print("checked");%> <%=disabled1%>>Novación
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
						</td>
						<td nowrap><div align="right">   Número de Reserva Anterior : </div></td>
						<td nowrap >
							<input type="text" name="E01RESNRA" size="14" maxlength="12" value="<%= gaDetail.getE01RESNRA().trim()%>" <%=read_only1%>>
						</td>
					</tr>
					--%>
				</table>
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap><div align="right">Comentarios : </div></td>
						<td nowrap >
							<textarea name="E01RESCOM" rows="5" cols="55" onKeyDown="limitText(this.form.E01RESCOM,200);" onKeyUp="limitText(this.form.E01RESCOM,200);" <%=disabled1%> <% if (gaDetail.getF01RESCOM().equals("Y")) out.print("class=\"txtchanged\"");%>></textarea>
						</td>
						<td nowrap align="left">Reversar esta Reserva : 
							<input type="checkbox" name="E01RESEST" value="R" <%if (gaDetail.getE01RESEST().trim().equals("R")) out.print(" checked");%>>
						</td>
						<td nowrap ></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<% } %>
	
<%-- 	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("INQUIRY") || isAdmon) { %> --%>
	<h4>Administracion de Fondos</h4>
	<table class="tableinfo" width="100%">
		<tr > 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap ><div align="right">Porcentaje Honorarios :</div></td>
						<td nowrap align="Left">                
							<input type="text" name="E01RESCPE" size="6" maxlength="6" value="<%= gaDetail.getE01RESCPE().trim()%>" <%=read_only1%> >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > <div align="right">Cuenta por Pagar Fondo :</div></td>
						<td nowrap align="Left">                
							<input type="text" name="E01RESBN1" size="2" maxlength="2" value="<%= gaDetail.getE01RESBN1().trim()%>" <%=read_only1%> >             
							&nbsp;
							<input type="text" name="E01RESCC1" size="3" maxlength="3" value="<%= gaDetail.getE01RESCC1().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01RESBN1.value,'','','','')" <%=read_only1%> >
							&nbsp;
							<input type="text" name="E01RESGL1" size="17" maxlength="16"  value="<%= gaDetail.getE01RESGL1().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01RESBN1.value,document.forms[0].E01RESCC1.value,'','','')" <%=read_only1%> >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > <div align="right">Cuenta Contable Honorarios :</div></td>
						<td nowrap align="Left">                
							<input type="text" name="E01RESBN2" size="2" maxlength="2" value="<%= gaDetail.getE01RESBN2().trim()%>" <%=read_only1%> >             
							&nbsp;
							<input type="text" name="E01RESCC2" size="3" maxlength="3" value="<%= gaDetail.getE01RESCC2().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01RESBN2.value,'','','','')" <%=read_only1%> >
							&nbsp;
							<input type="text" name="E01RESGL2" size="17" maxlength="16"  value="<%= gaDetail.getE01RESGL2().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01RESBN2.value,document.forms[0].E01RESCC2.value,'','','')" <%=read_only1%> >
						</td>
					</tr>   
				</table>
			</td>
		</tr>
	</table>
<%-- 	<% } %> --%>
	
	<% if (userPO.getPurpose().equals("INQUIRY") || isAdmon) { %>
	<h4>Saldos Administracion de Fondos</h4>
	<table class="tableinfo" width="100%">
		<tr > 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > <div align="right">Fecha Recepcion :</div></td>
						<td nowrap align="Left">                
							<eibsinput:date name="gaDetail" fn_year="E01RESRCY" fn_month="E01RESRCM" fn_day="E01RESRCD" readonly="true" />
						</td>
						<td nowrap > <div align="right">Fecha Acumulado :</div></td>
						<td nowrap align="Left">                
							<eibsinput:date name="gaDetail" fn_year="E01RESFCY" fn_month="E01RESFCM" fn_day="E01RESFCD" readonly="true" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > <div align="right">Pago Fondos :</div></td>
						<td nowrap align="Left">                
							<eibsinput:text name="gaDetail" property="E01RESMRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnlyAdm%>" />
						</td>
						<td nowrap > <div align="right">Monto Acumulado :</div></td>
						<td nowrap align="Left">                
							<eibsinput:text name="gaDetail" property="E01RESMAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > <div align="right">Pendiente Reintegro Fondo :</div></td>
						<td nowrap align="Left">                
							<eibsinput:text property="REINT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" value="<%=datapro.eibs.master.Util.formatCCY(reint)%>" readonly="true" />
						</td>
						<td nowrap > <div align="right">Total Deuda Cliente :</div></td>
						<td nowrap align="Left">                
							<eibsinput:text property="TOTAL" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" value="<%=datapro.eibs.master.Util.formatCCY(total)%>" readonly="true" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<% } %>

	<table cellspacing=0 cellpadding=2 width="100%" border="0">
	</table>

	<table width="100%">		
		<% if (read_only1 == "X") { %>
		<tr>
			<td width="100%" align="center" colspan="3">
				<input type="checkbox" name="H01FLGMAS" value="A" <%if (gaDetail.getH01FLGMAS().trim().equals("A")) out.print(" checked");%>> Aceptar con Información Parcial
			</td>
		</tr>
		<% } %>
		<tr>
			<td width="100%" align="center" colspan="3">
			<% 
			   if (!userPO.getPurpose().equals("INQUIRY")) {
			     if (iopecod.equals("0003")){
			%>
				<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Borrar">
			<%   } else { %>
				<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Enviar">
			<%   }
		     } else {
			%>
				<input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goExit()">
			<% } %>
			</td>
		</tr>
	</table>	

<script type="text/javascript">
function waitSimulate() {
	//document.body.style.cursor = "wait";
}
document.forms[0].onsubmit = waitSimulate();
</script>

</form>

</body>
</html>