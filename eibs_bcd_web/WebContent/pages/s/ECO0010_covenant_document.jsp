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
	//Cancel
	case 1:  {
 		document.forms[0].SCREEN.value = "101";
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
	<input type=hidden name="SCREEN" value="101"> <input type=hidden
	name="APPROVAL" value="N"></form>
	
	<table width="400" align="right" cellpadding="0" cellspacing="0" border="1">
	<tr class="trclear">
		<td width="100" nowrap align="center">N&#176; SOLICITUD</td>
		<td width="100" nowrap align="center">FECHA SOLICITUD</td>
	</tr>
	<tr class="trdark">
		<td nowrap align="center">
			<eibsinput:text name="cnvObj" property="E02COSNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" required="false" readonly="true"/>
		</td>
		<td nowrap align="center">
            <eibsinput:date name="cnvObj" fn_year="E02COSFIY" fn_month="E02COSFIM" fn_day="E02COSFID" readonly="true"/>
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
				fn_param_one="E02COSECU" fn_param_two="E02EMPNME" fn_param_three="E02EMPIDN"   readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>IDENTIDAD</td>
		<td align="center" colspan="4" nowrap>NOMBRE</td>
	</tr>
	 <tr class="trdark">
		<td align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
		</td>
		<td align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	 <tr class="trclear">
		<td width="20%" align="center" nowrap>AMBITO</td>
		<td width="40%" align="center" colspan="2"nowrap>SECTOR</td>
		<td width="40%" align="center" colspan="2" nowrap>RAZON SOCIAL</td>
	</tr>
	<tr class="trdark">
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
	<tr class="trclear">
		<td width="40%" align="center" nowrap colspan="2">GIRO COMERCIAL</td>
		<td width="20%" align="center" nowrap>ANTIGUEDAD EMPRESA</td>
		<td width="20%" align="center" nowrap>N&#176; FUNCIONARIOS</td>
		<td width="20%" align="center" nowrap>RENTA BRUTA PROMEDIO</td>
	</tr>
	<tr class="trdark">
		<td width="40%" align="center" nowrap colspan="2">
			<eibsinput:text name="cnvObj" property="E02EMPGRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
            <eibsinput:date name="cnvObj" fn_year="E02EMPIDY" fn_month="E02EMPIDM" fn_day="E02EMPIDD" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02COSEFU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" required="false" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02COSEBP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="80%" align="center" nowrap colspan="4">SITIO WEB</td>
		<td width="20%" align="center" nowrap>TELEFONO</td>
	</tr>
	<tr class="trdark">
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPWEB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_WEB %>" required="false" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="80%" align="center" nowrap colspan="4">EMAIL</td>
		<td width="20%" align="center" nowrap>TELEFONO</td>
	</tr>
	<tr class="trdark">
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPIAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPPH2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="100%" align="center" nowrap colspan="5">DIRECCION CASA MATRIZ</td>
	</tr>
	<tr class="trdark">
		<td width="100%" align="center" colspan="5" nowrap>
			<eibsinput:text name="cnvObj" property="E02EMPMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EMPMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EMPMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EMPMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> 
		</td>
	</tr>
	
	</table>
	<!-- END ANTECEDENTES -->
	
	<br>
	<!-- BEGIN REPRESENTANTE LEGAL -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">REPRESENTANTE LEGAL</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>RUT</td>
		<td align="center" colspan="4" nowrap>NOMBRE</td>
	</tr>
	 <tr class="trdark">
		<td align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02RPLIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
		</td>
		<td align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02RPLNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>GENERO</td>
		<td align="center" nowrap>ESTADO CIVIL</td>
		<td align="center" colspan="3" nowrap>CARGO</td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap>
 		       <p> 
                 <input type="radio" disabled name="E02RPLSEX"  value="F" <%if (cnvObj.getE02RPLSEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02RPLSEX"  value="M" <%if (cnvObj.getE02RPLSEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
		</td>
		<td align="center" nowrap>
               <select name="E02RPLBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02RPLBMS().equals("1")||cnvObj.getE02RPLBMS().equals("2") || cnvObj.getE02RPLBMS().equals("3")||cnvObj.getE02RPLBMS().equals("4")||cnvObj.getE02RPLBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02RPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02RPLBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02RPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02RPLBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02RPLBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02RPLBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02RPLBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02RPLBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02RPLBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02RPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02RPLBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02RPLBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02RPLBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02RPLBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02RPLBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
		</td>
		<td align="center" colspan="3" nowrap>
			<eibsinput:text name="cnvObj" property="E02RPLCRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="20%" align="center" nowrap>TELEFONO</td>
		<td width="80%" align="center" nowrap colspan="4">EMAIL</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02RPLPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02RPLIAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false" readonly="true"/>
		</td>
	</tr>

	<tr class="trclear">
		<td width="100%" align="center" nowrap colspan="5">DIRECCION</td>
	</tr>
	<tr class="trdark">
		<td width="100%" align="center" colspan="5" nowrap>
			<eibsinput:text name="cnvObj" property="E02RPLMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02RPLMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02RPLMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02RPLMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> 
		</td>
	</tr>
	</table>
	<!-- END REPRESENTANTE LEGAL -->	 
	
	<br>
	<!-- BEGIN ENTIDAD ENCARGADA -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">ENTIDAD ENCARGADA DEL CONVENIO</td>
	</tr>
	<tr class="trclear">
		<td width="20%" align="center" nowrap>RUT</td>
		<td align="center" nowrap colspan="3">NOMBRE</td>
		<td width="20%" align="center" nowrap>SUBSECTOR</td>
	</tr>
	 <tr class="trdark">
		<td align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02CONIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
		</td>
		<td align="center" colspan="3" nowrap>
			<eibsinput:text name="cnvObj" property="E02CONNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
		<td align="center" nowrap>
  			<eibsinput:text name="cnvObj" property="E02CONSEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
		</td>
	</tr>
	 <tr class="trclear">
		<td width="20%" align="center" nowrap>N&#176; FUNCIONARIOS</td>
		<td width="20%" align="center" nowrap>RTA. BRUTA PROM.</td>
		<td width="20%" align="center" nowrap>RTA. LIQUIDA PROM.</td>
		<td width="20%" align="center" nowrap>TIPO</td>
		<td width="20%" align="center" nowrap>INICIO ACTIVIDAD</td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap>
               <eibsinput:text property="E02COSEFU" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5" readonly="true"/>
		</td>
		<td align="center" nowrap>
               <eibsinput:text property="E02COSRBP" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
		</td>
		<td align="center" nowrap>
              <eibsinput:text property="E02COSENP" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
		</td>
		<td align="center" nowrap>
           <select name="E02COSTCO" disabled>
               <option value="1" <% if (cnvObj.getE02COSTCO().equals("1")) out.print("selected"); %>>Bienestar</option>
               <option value="2" <% if (cnvObj.getE02COSTCO().equals("2")) out.print("selected"); %>>Dir. Empresa</option>
               <option value="3" <% if (cnvObj.getE02COSTCO().equals("3")) out.print("selected"); %>>Depto RRHH</option>                                                				
               <option value="4" <% if (cnvObj.getE02COSTCO().equals("4")) out.print("selected"); %>>Sindicato</option>                                                				
               <option value="5" <% if (cnvObj.getE02COSTCO().equals("5")) out.print("selected"); %>>Asociacion</option>                                                				
       	   </select>
		</td>
		<td align="center" nowrap>
   	        <eibsinput:date name="cnvObj" fn_year="E02CONIDY" fn_month="E02CONIDM" fn_day="E02CONIDD" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="80%" align="center" nowrap colspan="4">SITIO WEB</td>
		<td width="20%" align="center" nowrap>TELEFONO</td>
	</tr>
	<tr class="trdark">
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02CONWEB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_WEB %>" required="false" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02CONPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="80%" align="center" nowrap colspan="4">EMAIL</td>
		<td width="20%" align="center" nowrap>TELEFONO</td>
	</tr>
	<tr class="trdark">
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02CONIAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false" readonly="true"/>
		</td>
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02CONPH2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="100%" align="center" nowrap colspan="5">DIRECCION CASA MATRIZ</td>
	</tr>
	<tr class="trdark">
		<td width="100%" align="center" colspan="5" nowrap>
			<eibsinput:text name="cnvObj" property="E02CONMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02CONMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02CONMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02CONMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> 
		</td>
	</tr>

  </table>
	<!-- END ENTIDAD ENCARGADA -->	 

	<br>
	<!-- BEGIN TITULAR CONVENIO -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">TITULAR CONVENIO</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>RUT</td>
		<td align="center" colspan="4" nowrap>NOMBRE</td>
	</tr>
	 <tr class="trdark">
		<td align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02TCOIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
		</td>
		<td align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02TCONME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>GENERO</td>
		<td align="center" nowrap>ESTADO CIVIL</td>
		<td align="center" colspan="3" nowrap>CARGO</td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap>
 		       <p> 
                 <input type="radio" disabled name="E02TCOSEX"  value="F" <%if (cnvObj.getE02TCOSEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02TCOSEX"  value="M" <%if (cnvObj.getE02TCOSEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
		</td>
		<td align="center" nowrap>
               <select name="E02TCOBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02TCOBMS().equals("1")||cnvObj.getE02TCOBMS().equals("2") || cnvObj.getE02TCOBMS().equals("3")||cnvObj.getE02TCOBMS().equals("4")||cnvObj.getE02TCOBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02TCOBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02TCOBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02TCOBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02TCOBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02TCOBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02TCOBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02TCOBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02TCOBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02TCOBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02TCOBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02TCOBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02TCOBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02TCOBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02TCOBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02TCOBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
		</td>
		<td align="center" colspan="3" nowrap>
			<eibsinput:text name="cnvObj" property="E02TCOCRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="20%" align="center" nowrap>TELEFONO</td>
		<td width="80%" align="center" nowrap colspan="4">EMAIL</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02TCOPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02TCOIAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false" readonly="true"/>
		</td>
	</tr>

	<tr class="trclear">
		<td width="100%" align="center" nowrap colspan="5">DIRECCION</td>
	</tr>
	<tr class="trdark">
		<td width="100%" align="center" colspan="5" nowrap>
			<eibsinput:text name="cnvObj" property="E02TCOMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02TCOMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02TCOMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02TCOMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> 
		</td>
	</tr>
	</table>
	<!-- END TITULAR CONVENIO -->


	<br>
	<!-- BEGIN ENCARGADO CONVENIO -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">ENCARGADO CONVENIO</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>RUT</td>
		<td align="center" colspan="4" nowrap>NOMBRE</td>
	</tr>
	 <tr class="trdark">
		<td align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EGEIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
		</td>
		<td align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02EGENME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>GENERO</td>
		<td align="center" nowrap>ESTADO CIVIL</td>
		<td align="center" colspan="3" nowrap>CARGO</td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap>
 		       <p> 
                 <input type="radio" disabled name="E02EGESEX"  value="F" <%if (cnvObj.getE02EGESEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02EGESEX"  value="M" <%if (cnvObj.getE02EGESEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
		</td>
		<td align="center" nowrap>
               <select name="E02EGEBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02EGEBMS().equals("1")||cnvObj.getE02EGEBMS().equals("2") || cnvObj.getE02EGEBMS().equals("3")||cnvObj.getE02EGEBMS().equals("4")||cnvObj.getE02EGEBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02EGEBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EGEBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02EGEBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EGEBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02EGEBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02EGEBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02EGEBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02EGEBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02EGEBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02EGEBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EGEBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02EGEBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02EGEBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02EGEBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02EGEBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
		</td>
		<td align="center" colspan="3" nowrap>
			<eibsinput:text name="cnvObj" property="E02EGECRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="20%" align="center" nowrap>TELEFONO</td>
		<td width="80%" align="center" nowrap colspan="4">EMAIL</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EGEPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02EGEIAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false" readonly="true"/>
		</td>
	</tr>

	<tr class="trclear">
		<td width="100%" align="center" nowrap colspan="5">DIRECCION</td>
	</tr>
	<tr class="trdark">
		<td width="100%" align="center" colspan="5" nowrap>
			<eibsinput:text name="cnvObj" property="E02EGEMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EGEMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EGEMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EGEMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> 
		</td>
	</tr>
	</table>
	<!-- END ENCARGADO CONVENIO -->

	<br>
	<!-- BEGIN ENCARGADO PLANILLA -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">ENCARGADO PLANILLA</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>RUT</td>
		<td align="center" colspan="4" nowrap>NOMBRE</td>
	</tr>
	 <tr class="trdark">
		<td align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EPLIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
		</td>
		<td align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02EPLNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>GENERO</td>
		<td align="center" nowrap>ESTADO CIVIL</td>
		<td align="center" colspan="3" nowrap>CARGO</td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap>
 		       <p> 
                 <input type="radio" disabled name="E02EPLSEX"  value="F" <%if (cnvObj.getE02EPLSEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02EPLSEX"  value="M" <%if (cnvObj.getE02EPLSEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
		</td>
		<td align="center" nowrap>
               <select name="E02EPLBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02EPLBMS().equals("1")||cnvObj.getE02EPLBMS().equals("2") || cnvObj.getE02EPLBMS().equals("3")||cnvObj.getE02EPLBMS().equals("4")||cnvObj.getE02EPLBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02EPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EPLBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02EPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EPLBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02EPLBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02EPLBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02EPLBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02EPLBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02EPLBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02EPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EPLBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02EPLBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02EPLBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02EPLBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02EPLBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
		</td>
		<td align="center" colspan="3" nowrap>
			<eibsinput:text name="cnvObj" property="E02EPLCRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="20%" align="center" nowrap>TELEFONO</td>
		<td width="80%" align="center" nowrap colspan="4">EMAIL</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02EPLPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02EPLIAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false" readonly="true"/>
		</td>
	</tr>

	<tr class="trclear">
		<td width="100%" align="center" nowrap colspan="5">DIRECCION</td>
	</tr>
	<tr class="trdark">
		<td width="100%" align="center" colspan="5" nowrap>
			<eibsinput:text name="cnvObj" property="E02EPLMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EPLMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EPLMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02EPLMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> 
		</td>
	</tr>
	</table>
	<!-- END ENCARGADO PLANILLA -->


	<br>
	<!-- BEGIN PAGO APORTES -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">PAGO APORTES</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>RUT</td>
		<td align="center" colspan="4" nowrap>NOMBRE</td>
	</tr>
	 <tr class="trdark">
		<td align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02PAPIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
		</td>
		<td align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02PAPNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>GENERO</td>
		<td align="center" nowrap>ESTADO CIVIL</td>
		<td align="center" colspan="3" nowrap>CARGO</td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap>
 		       <p> 
                 <input type="radio" disabled name="E02PAPSEX"  value="F" <%if (cnvObj.getE02PAPSEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02PAPSEX"  value="M" <%if (cnvObj.getE02PAPSEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
		</td>
		<td align="center" nowrap>
               <select name="E02PAPBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02PAPBMS().equals("1")||cnvObj.getE02PAPBMS().equals("2") || cnvObj.getE02PAPBMS().equals("3")||cnvObj.getE02PAPBMS().equals("4")||cnvObj.getE02PAPBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02PAPBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02PAPBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02PAPBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02PAPBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02PAPBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02PAPBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02PAPBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02PAPBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02PAPBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02PAPBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02PAPBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02PAPBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02PAPBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02PAPBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02PAPBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
		</td>
		<td align="center" colspan="3" nowrap>
			<eibsinput:text name="cnvObj" property="E02PAPCRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="20%" align="center" nowrap>TELEFONO</td>
		<td width="80%" align="center" nowrap colspan="4">EMAIL</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02PAPPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02PAPIAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false" readonly="true"/>
		</td>
	</tr>

	<tr class="trclear">
		<td width="100%" align="center" nowrap colspan="5">DIRECCION</td>
	</tr>
	<tr class="trdark">
		<td width="100%" align="center" colspan="5" nowrap>
			<eibsinput:text name="cnvObj" property="E02PAPMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02PAPMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02PAPMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02PAPMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> 
		</td>
	</tr>
	</table>
	<!-- END PAGO APORTES -->


	<br>
	<!-- BEGIN HABILITADO -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">HABILITADO</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>RUT</td>
		<td align="center" colspan="4" nowrap>NOMBRE</td>
	</tr>
	 <tr class="trdark">
		<td align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02HABIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
		</td>
		<td align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02HABNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td align="center" nowrap>GENERO</td>
		<td align="center" nowrap>ESTADO CIVIL</td>
		<td align="center" colspan="3" nowrap>CARGO</td>
	</tr>
	<tr class="trdark">
		<td align="center" nowrap>
 		       <p> 
                 <input type="radio" disabled name="E02HABSEX"  value="F" <%if (cnvObj.getE02HABSEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02HABSEX"  value="M" <%if (cnvObj.getE02HABSEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
		</td>
		<td align="center" nowrap>
               <select name="E02HABBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02HABBMS().equals("1")||cnvObj.getE02HABBMS().equals("2") || cnvObj.getE02HABBMS().equals("3")||cnvObj.getE02HABBMS().equals("4")||cnvObj.getE02HABBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02HABBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02HABBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02HABBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02HABBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02HABBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02HABBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02HABBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02HABBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02HABBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02HABBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02HABBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02HABBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02HABBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02HABBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02HABBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
		</td>
		<td align="center" colspan="3" nowrap>
			<eibsinput:text name="cnvObj" property="E02HABCRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="true"/>
		</td>
	</tr>
	<tr class="trclear">
		<td width="20%" align="center" nowrap>TELEFONO</td>
		<td width="80%" align="center" nowrap colspan="4">EMAIL</td>
	</tr>
	<tr class="trdark">
		<td width="20%" align="center" nowrap>
			<eibsinput:text name="cnvObj" property="E02HABPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="true"/>
		</td>
		<td width="80%" align="center" colspan="4" nowrap>
			<eibsinput:text name="cnvObj" property="E02HABIAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false" readonly="true"/>
		</td>
	</tr>

	<tr class="trclear">
		<td width="100%" align="center" nowrap colspan="5">DIRECCION</td>
	</tr>
	<tr class="trdark">
		<td width="100%" align="center" colspan="5" nowrap>
			<eibsinput:text name="cnvObj" property="E02HABMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02HABMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02HABMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> <br>
			<eibsinput:text name="cnvObj" property="E02HABMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/> 
		</td>
	</tr>
	</table>
	<!-- END TITULAR CONVENIO -->



	<br>
	<!-- BEGIN INFORMACION PARA EVALUACION -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">INFORMACION PARA EVALUACION</td>
	</tr>
	<tr class="trclear">
		<td width="30%" align="center" nowrap>EMPRESA</td>
		<td width="35%" align="center" nowrap>REP. LEGAL</td>
		<td width="35%" align="center" nowrap>EMPRESAS PRIVADAS</td>
	</tr>
	 <tr class="trdark">
		<td align="center" nowrap>
		  <input type="checkbox" disabled name="E02COSEE1" value="Y" <%if (cnvObj.getE02COSEE1().equals("Y")){out.print(" checked");}; %>/>Dicom 
		  <input type="checkbox" disabled name="E02COSEE2" value="Y" <%if (cnvObj.getE02COSEE2().equals("Y")){out.print(" checked");}; %>/>Deuda SBIF<br>
		  <input type="checkbox" disabled name="E02COSEE3" value="Y" <%if (cnvObj.getE02COSEE3().equals("Y")){out.print(" checked");}; %>/>Rut Empresa<br>
		</td>
		<td align="center" nowrap>
		  <input type="checkbox" disabled name="E02COSRE1" value="Y" <%if (cnvObj.getE02COSRE1().equals("Y")){out.print(" checked");}; %>/>Dicom &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" disabled name="E02COSRE4" value="Y"<%if (cnvObj.getE02COSRE4().equals("Y")){out.print(" checked");}; %>/>Documento de Designación Rep. Leg.<br>
		  <input type="checkbox" disabled name="E02COSRE3" value="Y" <%if (cnvObj.getE02COSRE3().equals("Y")){out.print(" checked");}; %>/>Deuda SBIF &nbsp;&nbsp;<input type="checkbox" disabled name="E02COSRE5" value="Y" <%if (cnvObj.getE02COSRE5().equals("Y")){out.print(" checked");}; %>/>Ultima declaracion de Renta en Impuestos<br>
		  <input type="checkbox" disabled name="E02COSRE2" value="Y"<%if (cnvObj.getE02COSRE2().equals("Y")){out.print(" checked");}; %>/>Rut Empresa &nbsp;<input type="checkbox" disabled name="E02COSRE6" value="Y"<%if (cnvObj.getE02COSRE6().equals("Y")){out.print(" checked");}; %>/>Liquidacion Sueldo<br>
		</td>
		<td align="center" nowrap>
		  <input type="checkbox" disabled name="E02COSBL1" value="Y" <%if (cnvObj.getE02COSBL1().equals("Y")){out.print(" checked");}; %>/>Balance General&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" disabled name="E02COSBL2" value="Y" <%if (cnvObj.getE02COSBL2().equals("Y")){out.print(" checked");}; %>/>Flujo de Caja<br>
		  <input type="checkbox" disabled name="E02COSBL3" value="Y" <%if (cnvObj.getE02COSBL3().equals("Y")){out.print(" checked");}; %>/>Declaración de Impuestos &nbsp;&nbsp;<input type="checkbox" disabled name="E02COSBL4" value="Y" <%if (cnvObj.getE02COSBL4().equals("Y")){out.print(" checked");}; %>/>Declaración IVA<br>
		  <input type="checkbox" disabled name="E02COSBL5" value="Y" <%if (cnvObj.getE02COSBL5().equals("Y")){out.print(" checked");}; %>/>Despidos Ultimos 2 años<br>
		</td>
	</tr>
	</table>
	<!-- END INFORMACION PARA EVALUACION -->
	<br>
	<!-- OPERACION CONVENIO -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">OPERACION CONVENIO</td>
	</tr>
	<tr class="trclear">
		<td width="20%" align="center" nowrap>COBERTURA</td>
		<td width="20%" align="center" nowrap>HABILITADOS</td>
		<td width="40%" align="center" nowrap>PRODUCTOS HABILITADOS</td>
		<td width="20%" align="center" nowrap>MAX. ACCIONES</td>
	</tr>
	 <tr class="trdark">
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
	<tr class="trclear">
		<td width="20%" align="center" nowrap>TIPO APORTE</td>
		<td width="20%" align="center" nowrap>CALCULO SOBRE</td>
		<td width="20%" align="center" nowrap>MAGNITUD APORTE</td>
		<td width="20%" align="center" nowrap>MONEDA PAGO</td>
		<td width="20%" align="center" nowrap>FORMA PAGO</td>		
	</tr>
	 <tr class="trdark">
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
	<tr class="trclear">
		<td width="15%" align="center" nowrap>DESCUENTO COOPEUCH</td>
		<td width="15%" align="center" nowrap>ENVIO</td>
		<td width="15%" align="center" nowrap>ROL DE PAGO</td>
		<td width="18%" align="center" nowrap>FORMA DE PAGO</td>
		<td width="15%" align="center" nowrap>TIPO</td>
		<td width="15%" align="center" nowrap>FECHA ENVIO</td>		
	</tr>
	 <tr class="trdark">
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
	<br>
	<!-- BEGIN GENERACION DE CODIGOS -->
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td nowrap colspan="5">GENERACION DE CODIGOS</td>
	</tr>
	<tr class="trdark">
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
	<tr class="trdark">
		<td nowrap></td>
	</tr>
	</table>
	<!-- END OPERAN CON MANDATO -->
	<br><br><br>
	
</body>
</html>