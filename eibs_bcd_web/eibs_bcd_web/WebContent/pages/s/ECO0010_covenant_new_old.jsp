<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Solicitud de Convenio</title>
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>
<script type="text/javascript">

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
 </script>
</head>
<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ECO001002Message"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />

<%!
	boolean readOnly=false;
%> 
          
<%
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
%>
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">Solicitud de Convenio<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="covenant_new, ECO0010"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0010">
	<input type=hidden name="SCREEN" value="201"> <input type=hidden
	name="APPROVAL" value="N"></form>
	
	<table width="400" align="right" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td width="100" nowrap align="center">N&#176; SOLICITUD</td>
		<td width="100" nowrap align="center">FECHA SOLICITUD</td>
	</tr>
	<tr>
		<td nowrap align="center">
			<eibsinput:text name="cnvObj" property="E02COSNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" required="false" readonly="<%=readOnly%>"/>
		</td>
		<td nowrap align="center">
            <eibsinput:date name="cnvObj" fn_year="E02COSFIY" fn_month="E02COSFIM" fn_day="E02COSFID" readonly="<%=readOnly%>"/>
		</td>
	</tr>	
	</table>
	<br>
	<!-- BEGIN ANTECEDENTES -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap>ANTECENDENTES DE LA EMPRESA</td>
		<td nowrap colspan="4">
			<eibsinput:help name="cnvObj" property="E02COSECU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>"  
				fn_param_one="E02COSECU" fn_param_two="E02EMPNME" fn_param_three="E02EMPIDN"   readonly="<%=readOnly %>"/>
		</td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap>IDENTIDAD</td>
		<td align="center" colspan="4" nowrap>NOMBRE</td>
	</tr>
	 <tr class="trclear">
		<td align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
		</td>
		<td align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	 <tr class="trdark">
		<td width="20%" align="center" nowrap>AMBITO</td>
		<td width="40%" align="center" colspan="2"nowrap>SECTOR</td>
		<td width="40%" align="center" colspan="2" nowrap>RAZON SOCIAL</td>
	</tr>
	<tr class="trclear">
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPAMB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/>
		</td>
		<td width="40%" align="center" colspan="2" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPSEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/>
		</td>
		<td width="40%" align="center" colspan="2" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPRZN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trdark">
		<td width="40%" align="center" nowrap colspan="2">GIRO COMERCIAL</td>
		<td width="20%" align="center" nowrap>ANTIGUEDAD EMPRESA</td>
		<td width="20%" align="center" nowrap>N&#176; FUNCIONARIOS</td>
		<td width="20%" align="center" nowrap>RENTA BRUTA PROMEDIO</td>
	</tr>
	<tr class="trclear">
		<td width="40%" align="center" nowrap colspan="2">
			<eibsinput:text name="cnvObj" property="E02EMPGRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
            <eibsinput:date name="cnvObj" fn_year="E02EMPIDY" fn_month="E02EMPIDM" fn_day="E02EMPIDD" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02COSNFU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" required="false" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPGRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trdark">
		<td width="100%" align="center" nowrap colspan="5">DIRECCION CASA MATRIZ</td>
	</tr>
	<tr class="trclear">
		<td width="100%" align="center" colspan="5" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EMPMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EMPMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EMPMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> 
		</td>
	</tr>
	<tr class="trdark">
		<td width="80%" align="center" nowrap colspan="4">SITIO WEB</td>
		<td width="20%" align="center" nowrap>TELEFONO</td>
	</tr>
	<tr class="trclear">
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trdark">
		<td width="80%" align="center" nowrap colspan="4">EMAIL</td>
		<td width="20%" align="center" nowrap>TELEFONO</td>
	</tr>
	<tr class="trclear">
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
	</tr>
	
	</table>
	<!-- END ANTECEDENTES -->
	 <br>
	<!-- BEGIN CASA MATRIZ -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">DIRECCION CASA MATRIZ</td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap colspan="2">CALLE</td>
		<td width="20%" align="center" nowrap>DEPTO</td>
		<td width="20%" align="center" nowrap>COMUNA</td>
		<td width="20%" align="center" nowrap>FONO</td>
	</tr>
	 <tr class="trclear">
		<td align="center" colspan="2" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	 <tr class="trdark">
		<td width="20%" align="center" nowrap>FAX</td>
		<td align="center" nowrap colspan="2">CASILLA</td>
		<td align="center" nowrap colspan="2">SITIO WEB</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap colspan="2"></td>
		<td align="center" nowrap colspan="2"></td>
	</tr>
	</table>
	<!-- END CASA MATRIZ -->	 
	<br>
	<!-- BEGIN REPRESENTANTE LEGAL -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">REPRESENTANTE LEGAL</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>RUT</td>
		<td width="20%" align="center" nowrap>APELLIDO PATERNO</td>
		<td width="20%" align="center" nowrap>APELLIDO MATERNO</td>
		<td width="20%" align="center" nowrap>NOMBRES</td>
		<td width="20%" align="center" nowrap>GENERO</td>
	</tr>
	 <tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap>CARGO</td>
		<td align="center" nowrap>FONO</td>
		<td align="center" nowrap>FAX</td>
		<td align="center" nowrap colspan="2">EMAIL</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap colspan="2"></td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap colspan="2">DIRECCION COMERCIAL</td>
		<td align="center" nowrap>DPTO</td>
		<td align="center" nowrap>COMUNA</td>
		<td align="center" nowrap>CASILLA</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap colspan="2"></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>	
	</table>
	<!-- END REPRESENTANTE LEGAL -->	 
	<br>
	<!-- BEGIN ENTIDAD ENCARGADA -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">ENTIDAD ENCARGADA DEL CONVENIO</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>RUT</td>
		<td align="center" nowrap colspan="3">NOMBRE</td>
		<td width="20%" align="center" nowrap>SUBSECTOR</td>
	</tr>
	 <tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" colspan="3" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	 <tr class="trdark">
		<td width="20%" align="center" nowrap>N&#176; FUNCIONARIOS</td>
		<td width="20%" align="center" nowrap>RTA. BRUTA PROM.</td>
		<td width="20%" align="center" nowrap>RTA. LIQUIDA PROM.</td>
		<td width="20%" align="center" nowrap>TIPO</td>
		<td width="20%" align="center" nowrap>DIA ANIVERSARIO</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	</table>
	<!-- END ENTIDAD ENCARGADA -->	 
	<br>
	<!-- BEGIN DIRECCION ENTIDAD -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">DIRECCION ENTIDAD</td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap colspan="2">CALLE</td>
		<td width="20%" align="center" nowrap>DEPTO</td>
		<td width="20%" align="center" nowrap>COMUNA</td>
		<td width="20%" align="center" nowrap>FONO</td>
	</tr>
	 <tr class="trclear">
		<td align="center" colspan="2" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	 <tr class="trdark">
		<td width="20%" align="center" nowrap>FAX</td>
		<td align="center" nowrap colspan="2">CASILLA</td>
		<td align="center" nowrap colspan="2">EMAIL</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap colspan="2"></td>
		<td align="center" nowrap colspan="2"></td>
	</tr>
	</table>
	<!-- END DIRECCION ENTIDAD -->	 
	<br>
	<!-- BEGIN TITULAR CONVENIO -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">TITULAR CONVENIO</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>RUT</td>
		<td width="20%" align="center" nowrap>APELLIDO PATERNO</td>
		<td width="20%" align="center" nowrap>APELLIDO MATERNO</td>
		<td width="20%" align="center" nowrap>NOMBRES</td>
		<td width="20%" align="center" nowrap>GENERO</td>
	</tr>
	 <tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap>CARGO</td>
		<td align="center" nowrap>FONO</td>
		<td align="center" nowrap>FAX</td>
		<td align="center" nowrap colspan="2">EMAIL</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap colspan="2"></td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap colspan="2">DIRECCION COMERCIAL</td>
		<td align="center" nowrap>DPTO</td>
		<td align="center" nowrap>COMUNA</td>
		<td align="center" nowrap>CASILLA</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap colspan="2"></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>	
	</table>
	<!-- END TITULAR CONVENIO -->
	<br>
	<!-- BEGIN INFORMACION PARA EVALUACION -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">INFORMACION PARA EVALUACION</td>
	</tr>
	<tr class="trdark">
		<td width="30%" align="center" nowrap>EMPRESA</td>
		<td width="35%" align="center" nowrap>REP. LEGAL</td>
		<td width="35%" align="center" nowrap>EMPRESAS PRIVADAS</td>
	</tr>
	 <tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	</table>
	<!-- END INFORMACION PARA EVALUACION -->
	<br>
	<!-- OPERACION CONVENIO -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">OPERACION CONVENIO</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>COBERTURA</td>
		<td width="20%" align="center" nowrap>HABILITADOS</td>
		<td width="40%" align="center" nowrap>PRODUCTOS HABILITADOS</td>
		<td width="20%" align="center" nowrap>MAX. ACCIONES</td>
	</tr>
	 <tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>		
	</tr>
	</table>
	<!-- END OPERACION CONVENIO -->
	<br>
	<!-- BEGIN APORTE AL EMPLEADOR -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">APORTE AL EMPLEADOR</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>TIPO APORTE</td>
		<td width="20%" align="center" nowrap>CALCULO SOBRE</td>
		<td width="20%" align="center" nowrap>MAGNITUD APORTE</td>
		<td width="20%" align="center" nowrap>MONEDA PAGO</td>
		<td width="20%" align="center" nowrap>FORMA PAGO</td>		
	</tr>
	 <tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>		
		<td align="center" nowrap></td>
	</tr>
	</table>
	<!-- END APORTE AL EMPLEADOR -->
	<br>
	<!-- BEGIN PLANILLA Y DESCUENTO -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">PLANILLA Y DESCUENTO</td>
	</tr>
	<tr class="trdark">
		<td width="15%" align="center" nowrap>DESCUENTO COOPEUCH</td>
		<td width="15%" align="center" nowrap>ENVIO</td>
		<td width="15%" align="center" nowrap>ROL DE PAGO</td>
		<td width="18%" align="center" nowrap>FORMA DE PAGO</td>
		<td width="15%" align="center" nowrap>TIPO</td>
		<td width="15%" align="center" nowrap>FECHA ENVIO</td>		
	</tr>
	 <tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>		
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	</table>
	<!-- END PLANILLA Y DESCUENTO -->
	<br>
	<!-- BEGIN ENCARGADO GESTION CONVENIO -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">ENCARGADO GESTION CONVENIO</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>RUT</td>
		<td align="center" nowrap colspan="3">NOMBRE</td>
		<td width="20%" align="center" nowrap>SUBSECTOR</td>
	</tr>
	 <tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" colspan="3" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	 <tr class="trdark">
		<td width="20%" align="center" nowrap>N&#176; FUNCIONARIOS</td>
		<td width="20%" align="center" nowrap>RTA. BRUTA PROM.</td>
		<td width="20%" align="center" nowrap>RTA. LIQUIDA PROM.</td>
		<td width="20%" align="center" nowrap>TIPO</td>
		<td width="20%" align="center" nowrap>DIA ANIVERSARIO</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	</table>
	<!-- END ENCARGADO GESTION CONVENIO -->	 	
	<br>
	<!-- BEGIN ENCARGADO PLANILLAS DESCUENTO -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">PLANILLAS DESCUENTO</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>RUT</td>
		<td align="center" nowrap colspan="3">NOMBRE</td>
		<td width="20%" align="center" nowrap>SUBSECTOR</td>
	</tr>
	 <tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" colspan="3" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	 <tr class="trdark">
		<td width="20%" align="center" nowrap>N&#176; FUNCIONARIOS</td>
		<td width="20%" align="center" nowrap>RTA. BRUTA PROM.</td>
		<td width="20%" align="center" nowrap>RTA. LIQUIDA PROM.</td>
		<td width="20%" align="center" nowrap>TIPO</td>
		<td width="20%" align="center" nowrap>DIA ANIVERSARIO</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
		<td align="center" nowrap></td>
	</tr>
	</table>
	<!-- END ENCARGADO PLANILLAS DESCUENTO -->
	<br>
	<!-- BEGIN GENERACION DE CODIGOS -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">GENERACION DE CODIGOS</td>
	</tr>
	<tr class="trclear">
		<td nowrap></td>
	</tr>
	</table>
	<!-- END GENERACION DE CODIGOS -->
	<br>
	<!-- BEGIN OPERAN CON MANDATO -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">OPERAN CON MANDATO</td>
	</tr>
	<tr class="trclear">
		<td nowrap></td>
	</tr>
	</table>
	<!-- END OPERAN CON MANDATO -->
	<br><br><br>
</body>
</html>