<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="com.datapro.constants.Entities"%> 
<html>
<head>
<title>Poliza de Seguros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ESG001001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">
<%if (userPO.getOption().equals("LN") && userPO.getPurpose().equals("INQUIRY")){ %>
	<% if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
		builtNewMenu(ln_i_1_opt);
	
	<% } else { %>
		builtNewMenu(ln_i_2_opt);
	
	<% } %>
	initMenu();
<% } %>


//  Process according with user selection
 function goAction(op) {
	
	switch (op){
	//Cancel
	case 1:  {
		<%if (userPO.getOption().equals("LN") && userPO.getPurpose().equals("INQUIRY")){ %>
			document.forms[0].SCREEN.value = "102";
		<%} else {%>
			document.forms[0].SCREEN.value = "101";
		<% } %>
		break;
		}
	case 100:  {
		document.forms[0].SCREEN.value = "100";
		break;
		}	
	
	}
	document.forms[0].submit();
 }
 </script>
</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
%> 
		  
<%
	// Determina si es solo lectura
	readOnly=true;
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
		maintenance = true;
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA POLIZA DE SEGURO
<%} else if (maintenance){ %>
	CONSULTA POLIZA DE SEGURO
<%} else { %>
	NUEVO POLIZA DE SEGURO
<%} %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="PAC_Inq_seguros.jsp, ESG0010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESG0010I" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type=HIDDEN name="E01PACBNK"  value="<%= currUser.getE01UBK().trim()%>">
  <input type=HIDDEN name="H01FLGMAS"  value="<%= cnvObj.getH01FLGMAS().trim()%>">
 
 <table class="tableinfo" >
	<tr > 
	  <td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		  <tr id="trdark">          
			 <td nowrap width="10%" align="right">Numero Cliente : 
			  </td>
			 <td nowrap width="10%" align="left">
				<eibsinput:text name="cnvObj" property="E01PACCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
			 </td>
			 <td nowrap width="10%" align="right">Nombre Cliente : 
			   </td>
			 <td nowrap width="50%"align="left">
				<eibsinput:text name="cnvObj" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
			 </td>
			 <td nowrap width="10%" align="right">Identificación :  
			 </td>
			 <td nowrap width="10%" align="left">
				<eibsinput:text name="cnvObj" property="E01CUSIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
			 </td>
		 </tr>
		  <tr class="trdark">
			 <td nowrap width="10%" align="right">Cuenta Seguro :</td>
			 <td nowrap width="10%" align="left">
				<eibsinput:text name="cnvObj" property="E01PACNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
			 </td>
			 <td nowrap width="10%" align="right"></td>
			 <td nowrap width="10%" align="left"></td>
			 <td nowrap width="10%" align="right">Relaci&oacute;n Prestamo:</td>
			 <td nowrap width="50%"align="left">
				<eibsinput:text name="cnvObj" property="E01PACACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
			 </td>
		  </tr>
		</table>
	  </td>
	</tr>
 </table>
  
	<h4>Poliza de Seguro </h4>
	<table  class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
		<td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		
			<tr id="trdark"> 
			<td width="15%" > 
			  <div align="right">Descripcion :</div>
			</td>
			<td width="35%" > 
				 <eibsinput:text property="E01PACDSC" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
			</td>
			<td width="15%" > 
			  <div align="right">Poliza Numero :</div>
			</td>
			<td width="35%" > 
				 <eibsinput:text name="cnvObj" property="E01PACPLZ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE%>" required="false"  readonly="<%=readOnly %>"/>
			</td>
		  </tr>

		  <tr id="trclear"> 
			<td width="15%" > 
			  <div align="right">Codigo :</div>
			</td>
			<td width="35%" > 
				 <eibsinput:cnofc name="cnvObj" property="E01PACCOD" required="false" flag="IT" fn_code="E01PACCOD" fn_description="E01SEGNME" readonly="<%=readOnly %>"/>
				 <eibsinput:text property="E01SEGNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
			</td>
		   <td width="15%"> 
			  <div align="right">Fecha Incicio :</div>
			</td>
			<td width="35%"> 
				<eibsinput:date name="cnvObj" fn_year="E01PACFIY" fn_month="E01PACFIM" fn_day="E01PACFID" readonly="<%=readOnly%>"/>
			</td>
		  </tr>

		  <tr id="trdark"> 
			<td width="15%" > 
			  <div align="right">Plan :</div>
			</td>
			<td width="35%" > 
			  <input type="text" name="E01PACPLN" size="3" maxlength="2" value="<%= cnvObj.getE01PACPLN().trim()%>" readonly>
			  <eibsinput:text property="E01PLNNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="false" size="45" maxlength="45" readonly="true"/>
			</td>
		   <td width="15%"> 
			  <div align="right">Fecha Vencimiento :</div>
			</td>
			<td width="35%"> 
				<eibsinput:date name="cnvObj" fn_year="E01PACFVY" fn_month="E01PACFVM" fn_day="E01PACFVD" readonly="<%=readOnly%>"/>
			</td>
		  </tr>

		  <tr id="trclear"> 
			<td width="15%" > 
			  <div align="right">Moneda Seguro :</div>
			</td>
			<td width="35%" > 
				<eibsinput:help name="cnvObj" property="E01PACCYS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01PACCYS" fn_param_two="document.forms[0].E01PACBNK.value"  required="false" readonly="<%=readOnly %>" />
			</td>
		   <td width="15%"> 
			  <div align="right">Monto Asegurado :</div>
			</td>
			<td width="35%"> 
				<eibsinput:text name="cnvObj" property="E01PACMTS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="<%=readOnly %>"/>
			</td>
		  </tr>

		  <tr id="trdark"> 
			<td width="15%" > 
			  <div align="right">Moneda Prima :</div>
			</td>
			<td width="35%" > 
				<eibsinput:help name="cnvObj" property="E01PACCYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01PACCYP" fn_param_two="document.forms[0].E01PACBNK.value"  required="false" readonly="<%=readOnly %>"/>
			</td>
		   <td width="15%"> 
			  <div align="right">Monto Prima :</div>
			</td>
			<td width="35%"> 
				<eibsinput:text name="cnvObj" property="E01PACMTP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="<%=readOnly %>"/>
			</td>
		  </tr>

		  <tr id="trclear"> 
			<td width="15%" > 
			  <div align="right">Compania :</div>
			</td>
			<td width="35%" > 
				<eibsinput:help name="cnvObj" property="E01PACCIA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" 
					fn_param_one="E01PACCIA" fn_param_two="E01CIANME" fn_param_three="I" readonly="<%=readOnly %>"/>
				 <eibsinput:text property="E01CIANME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
			</td>
		   <td width="15%"> 
			  <div align="right">Prima Total :</div>
			</td>
			<td width="35%"> 
				<eibsinput:text name="cnvObj" property="E01PACPRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true"/>
			</td>
		  </tr>

			<tr id="trdark"> 
			<td width="15%" > 
			  <div align="right">Estado :</div>
			</td>
			<td width="35%" > 
			   <select name="E01PACSTS" <%=readOnly?"disabled":""%>>
					<option value=" " <% if (!(cnvObj.getE01PACSTS().equals("1")||cnvObj.getE01PACSTS().equals("2") || cnvObj.getE01PACSTS().equals("3")|| cnvObj.getE01PACSTS().equals("4"))) out.print("selected"); %>> 
					</option>
					<option value="1" <% if (cnvObj.getE01PACSTS().equals("1")) out.print("selected"); %>>Vigente</option>
					<option value="2" <% if (cnvObj.getE01PACSTS().equals("2")) out.print("selected"); %>>Cancelado</option>                   
					<option value="3" <% if (cnvObj.getE01PACSTS().equals("3")) out.print("selected"); %>>Bloqueado</option>                   
					<option value="4" <% if (cnvObj.getE01PACSTS().equals("4")) out.print("selected"); %>>Suspendido</option>                   
				  </select>
			</td>
		   <td width="15%"> 
			  <div align="right">Fecha contrato :</div>
			</td>
			<td width="35%"> 
				<eibsinput:date name="cnvObj" fn_year="E01PACFCY" fn_month="E01PACFCM" fn_day="E01PACFCD" readonly="<%=readOnly%>"/>
			</td>
		  </tr>

			<tr id="trclear"> 
			<td width="15%" > 
			  <div align="right">Factor :</div>
			</td>
			<td width="35%" > 
				<select name="E01PACFAC" <%=readOnly ? "disabled" : ""%> onchange="showFactorLabel(this.value)">
					<option value="F" <% if (cnvObj.getE01PACFAC().equals("F")) out.print("selected"); %>>Valor Fijo</option>
					<option value="P" <% if (cnvObj.getE01PACFAC().equals("P")) out.print("selected"); %>>Porcentaje</option>
					<option value="T" <% if (cnvObj.getE01PACFAC().equals("T")) out.print("selected"); %>>% Plazo Total</option>
					<option value="1" <% if (cnvObj.getE01PACFAC().equals("1")) out.print("selected"); %>>Tasa/Periodo</option>
				</select>							
			</td>
		   <td width="15%"> 
			  <div align="right">Periodo Base :</div>
			</td>
			<td width="35%"> 
				<select name="E01PACFL1" <%=readOnly ? "disabled" : ""%>>
					<option value=" " <%if (cnvObj.getE01PACFL1().equals(" ")) { out.print("selected"); }%>>Prestamo</option>
					<option value="1" <%if (cnvObj.getE01PACFL1().equals("1")) { out.print("selected"); }%>>360</option>
					<option value="2" <%if (cnvObj.getE01PACFL1().equals("2")) { out.print("selected"); }%>>365</option>
				</select>
			</td>
		  </tr>

		</table>
	  </td>
	</tr>
  </table>
  
  <h4>Recaudacion </h4>
	
  <table  class="tableinfo">
	<tr bordercolor="#FFFFFF"> 
	  <td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

		  <tr id="trdark"> 
			<td width="15%" > 
			  <div align="right">Modo Recaudacion :</div>
			</td>
			<td width="35%" > 
					<select name="E01PACRCD" <%=readOnly?"disabled":""%>>
						<option></option>
						<option value="0" <% if (cnvObj.getE01PACRCD().equals("0")) out.print("selected");%>>No Programado</option>
						<option value="1" <% if (cnvObj.getE01PACRCD().equals("1")) out.print("selected");%>>Convenio</option>
						<option value="2" <% if (cnvObj.getE01PACRCD().equals("2")) out.print("selected");%>>Automatico</option>
						<option value="3" <% if (cnvObj.getE01PACRCD().equals("3")) out.print("selected");%>>Caja</option>
						<option value="4" <% if (cnvObj.getE01PACRCD().equals("4")) out.print("selected");%>>Transferencia ACH</option>
						<option value="5" <% if (cnvObj.getE01PACRCD().equals("5")) out.print("selected");%>>Prestamo</option>
						<option value="6" <% if (cnvObj.getE01PACRCD().equals("6")) out.print("selected");%>>Desembolso</option>
						<option value="7" <% if (cnvObj.getE01PACRCD().equals("7")) out.print("selected");%>>Endosado</option>
					</select>
		  </td>
			<td width="15%"> 
			  <div align="right">Dia del cargo :</div>
			</td>
			<td width="35%"> 
				<eibsinput:text name="cnvObj" property="E01PACDYS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="<%=readOnly %>" />
			</td>
		  </tr>

		  <tr id="trclear"> 
			<td width="15%"> 
			  <div align="right">Frecuencia Pago :</div>
			</td>
			<td width="35%"> 
				<select name="E01PACFRE" <%=readOnly?"disabled":""%>>
					<option></option>
					<option value="D" <% if (cnvObj.getE01PACFRE().equals("D")) out.print("selected");%>>Diario</option>
					<option value="M" <% if (cnvObj.getE01PACFRE().equals("M")) out.print("selected");%>>Mensual</option>
					<option value="Y" <% if (cnvObj.getE01PACFRE().equals("Y")) out.print("selected");%>>Anual</option>
					<option value="S" <% if (cnvObj.getE01PACFRE().equals("S")) out.print("selected");%>>Semestral</option>					
				</select>
			</td>
			<td width="15%" > 
			  <div align="right">Numero de Pagos :</div>
			</td>
			<td width="35%" > 
				<eibsinput:text name="cnvObj" property="E01PACNPM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="<%=readOnly %>"/>
		  </td>
		  </tr>

		  <tr id="trdark"> 
			<td width="15%" > 
			  <div align="right">Cuenta de Pago :</div>
			</td>
			<td width="35%" > 
				<eibsinput:help name="cnvObj" property="E01PACPAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" fn_param_one="E01PACPAC" fn_param_two="document.forms[0].E01PACBNK.value" fn_param_three="RT" readonly="<%=readOnly %>"/>
				<eibsinput:text name="cnvObj" property="E01PRDPAG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
				</td>
		   <td width="15%"> 
			  <div align="right">Primas Mora Maxima :</div>
			</td>
			<td width="35%"> 
				<eibsinput:text name="cnvObj" property="E01PACMPI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="<%=readOnly %>"/>
			</td>
		  </tr>
		  
		  <tr id="trclear"> 
			<td width="15%" > 
			  <div align="right">Codigo Convenio :</div>
			</td>
			<td width="35%" > 
			   <input type="text" name="E01PACCNV" size="5" maxlength="4" value="<%= cnvObj.getE01PACCNV().trim()%>" readonly>
			</td>
		   <td width="15%"> 
			  <div align="right">Dias Mora Maxima :</div>
			</td>
			<td width="35%"> 
				<eibsinput:text name="cnvObj" property="E01PACMMR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="<%=readOnly %>"/>
			</td>
		  </tr>
		  
		  <tr id="trdark"> 	
			<td width="15%" > 
			  <div align="right">Cuenta Contable Abono :</div>
			</td>
			<td width="35%" > 
				<eibsinput:text name="cnvObj" property="E01PACABK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
				<eibsinput:text name="cnvObj" property="E01PACABR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
				<eibsinput:text name="cnvObj" property="E01PACACY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
				<eibsinput:text name="cnvObj" property="E01PACAGL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>
			</td>
			<td width="15%" > 
			  <div align="right">Maximo Insistencias :</div>
			</td>
			<td width="35%" > 
				<eibsinput:text name="cnvObj" property="E01PACMIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="<%=readOnly %>"/>
			</td>
		  </tr>

		  <tr id="trclear"> 
			<td width="15%" > 
			  <div align="right">Cuenta Corriente Abono :</div>
			</td>
			<td width="35%" > 
				<eibsinput:help name="cnvObj" property="E01PACAAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" fn_param_one="E01PACAAC" fn_param_two="document.forms[0].E01PACBNK.value" fn_param_three="RT" readonly="<%=readOnly %>"/>
				<eibsinput:text name="cnvObj" property="E01PRDABO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
				</td>
		   <td width="15%"> 
			  <div align="right">% Intermediacion :</div>
			</td>
			<td width="35%"> 
				<eibsinput:text name="cnvObj" property="E01PACPIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>" />
			</td>
		  </tr>
		  
		</table>
	  </td>
	</tr>
  </table>

  
  <h4>Beneficiarios </h4>
	
  <table  class="tableinfo">
	<tr bordercolor="#FFFFFF"> 
	  <td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

		 <tr id="trdark"> 
		   <td width="10%" > 
		   </td>
		   <td width="5%" > 
			  <div align="center">Nro</div>
		   </td>
		   <td width="15%" > 
			  <div align="center">Rut</div>
		   </td>
		   <td width="30%" > 
			  <div align="center">Nombre</div>
		   </td>
		   <td width="10%" > 
			  <div align="center">Telefono</div>
		   </td>
		   <td width="10%" > 
			  <div align="Center">Relacion</div>
		   </td>
		   <td width="5%" > 
			  <div align="center">%</div>
		   </td>
		   <td width="10%" > 
		   </td>
		  </tr>

		 <tr id="trclear"> 
		   <td width="10%" > 
		   </td>
		   <td width="5%" > 
			  <div align="center">1</div>
		   </td>
		   <td width="15%" > 
				<eibsinput:text name="cnvObj" property="E01PACRT1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="30%" > 
				<eibsinput:text name="cnvObj" property="E01PACNM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
				<eibsinput:text name="cnvObj" property="E01PACPH1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
				  <select name="E01PACRL1" <%=readOnly?"disabled":""%>>
					<option value=" " <% if (!(cnvObj.getE01PACRL1().equals("1")||cnvObj.getE01PACRL1().equals("2") || cnvObj.getE01PACRL1().equals("3")||cnvObj.getE01PACRL1().equals("4")||cnvObj.getE01PACRL1().equals("5")||cnvObj.getE01PACRL1().equals("9"))) out.print("selected"); %>></option>
					<option value="1" <% if (cnvObj.getE01PACRL1().equals("1")) out.print("selected"); %>>Esposo(a)</option>                   
					<option value="2" <% if (cnvObj.getE01PACRL1().equals("2")) out.print("selected"); %>>Hijo</option>
					<option value="3" <% if (cnvObj.getE01PACRL1().equals("3")) out.print("selected"); %>>Padre</option>
					<option value="4" <% if (cnvObj.getE01PACRL1().equals("4")) out.print("selected"); %>>Madre</option>
					<option value="5" <% if (cnvObj.getE01PACRL1().equals("5")) out.print("selected"); %>>Hermano(a)</option>
					<option value="9" <% if (cnvObj.getE01PACRL1().equals("9")) out.print("selected"); %>>Otro</option>
				  </select>
		   </td>
		   <td width="5%" > 
				<eibsinput:text name="cnvObj" property="E01PACPR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
		   </td>
		  </tr>

		 <tr id="trdark"> 
		   <td width="10%" > 
		   </td>
		   <td width="5%" > 
			  <div align="center">2</div>
		   </td>
		   <td width="15%" > 
				<eibsinput:text name="cnvObj" property="E01PACRT2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="30%" > 
				<eibsinput:text name="cnvObj" property="E01PACNM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
				<eibsinput:text name="cnvObj" property="E01PACPH2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
				  <select name="E01PACRL2" <%=readOnly?"disabled":""%>>
					<option value=" " <% if (!(cnvObj.getE01PACRL2().equals("1")||cnvObj.getE01PACRL2().equals("2") || cnvObj.getE01PACRL2().equals("3")||cnvObj.getE01PACRL2().equals("4")||cnvObj.getE01PACRL2().equals("5")||cnvObj.getE01PACRL2().equals("9"))) out.print("selected"); %>></option>
					<option value="1" <% if (cnvObj.getE01PACRL2().equals("1")) out.print("selected"); %>>Esposo(a)</option>                   
					<option value="2" <% if (cnvObj.getE01PACRL2().equals("2")) out.print("selected"); %>>Hijo</option>
					<option value="3" <% if (cnvObj.getE01PACRL2().equals("3")) out.print("selected"); %>>Padre</option>
					<option value="4" <% if (cnvObj.getE01PACRL2().equals("4")) out.print("selected"); %>>Madre</option>
					<option value="5" <% if (cnvObj.getE01PACRL2().equals("5")) out.print("selected"); %>>Hermano(a)</option>
					<option value="6" <% if (cnvObj.getE01PACRL2().equals("9")) out.print("selected"); %>>Otro</option>
				  </select>
		   </td>
		   <td width="5%" > 
				<eibsinput:text name="cnvObj" property="E01PACPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
		   </td>
		  </tr>

		 <tr id="trclear"> 
		   <td width="10%" > 
		   </td>
		   <td width="5%" > 
			  <div align="center">3</div>
		   </td>
		   <td width="15%" > 
				<eibsinput:text name="cnvObj" property="E01PACRT3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="30%" > 
				<eibsinput:text name="cnvObj" property="E01PACNM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
				<eibsinput:text name="cnvObj" property="E01PACPH3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
				  <select name="E01PACRL3" <%=readOnly?"disabled":""%>>
					<option value=" " <% if (!(cnvObj.getE01PACRL3().equals("1")||cnvObj.getE01PACRL3().equals("2") || cnvObj.getE01PACRL3().equals("3")||cnvObj.getE01PACRL3().equals("4")||cnvObj.getE01PACRL3().equals("5")||cnvObj.getE01PACRL3().equals("9"))) out.print("selected"); %>></option>
					<option value="1" <% if (cnvObj.getE01PACRL3().equals("1")) out.print("selected"); %>>Esposo(a)</option>                   
					<option value="2" <% if (cnvObj.getE01PACRL3().equals("2")) out.print("selected"); %>>Hijo</option>
					<option value="3" <% if (cnvObj.getE01PACRL3().equals("3")) out.print("selected"); %>>Padre</option>
					<option value="4" <% if (cnvObj.getE01PACRL3().equals("4")) out.print("selected"); %>>Madre</option>
					<option value="5" <% if (cnvObj.getE01PACRL3().equals("5")) out.print("selected"); %>>Hermano(a)</option>
					<option value="6" <% if (cnvObj.getE01PACRL3().equals("9")) out.print("selected"); %>>Otro</option>
				  </select>
		   </td>
		   <td width="5%" > 
				<eibsinput:text name="cnvObj" property="E01PACPR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
		   </td>
		  </tr>

		 <tr id="trdark"> 
		   <td width="10%" > 
		   </td>
		   <td width="5%" > 
			  <div align="center">4</div>
		   </td>
		   <td width="15%" > 
				<eibsinput:text name="cnvObj" property="E01PACRT4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="30%" > 
				<eibsinput:text name="cnvObj" property="E01PACNM4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
				<eibsinput:text name="cnvObj" property="E01PACPH4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
				  <select name="E01PACRL4" <%=readOnly?"disabled":""%>>
					<option value=" " <% if (!(cnvObj.getE01PACRL4().equals("1")||cnvObj.getE01PACRL4().equals("2") || cnvObj.getE01PACRL4().equals("3")||cnvObj.getE01PACRL4().equals("4")||cnvObj.getE01PACRL4().equals("5")||cnvObj.getE01PACRL4().equals("9"))) out.print("selected"); %>></option>
					<option value="1" <% if (cnvObj.getE01PACRL4().equals("1")) out.print("selected"); %>>Esposo(a)</option>                   
					<option value="2" <% if (cnvObj.getE01PACRL4().equals("2")) out.print("selected"); %>>Hijo</option>
					<option value="3" <% if (cnvObj.getE01PACRL4().equals("3")) out.print("selected"); %>>Padre</option>
					<option value="4" <% if (cnvObj.getE01PACRL4().equals("4")) out.print("selected"); %>>Madre</option>
					<option value="5" <% if (cnvObj.getE01PACRL4().equals("5")) out.print("selected"); %>>Hermano(a)</option>
					<option value="6" <% if (cnvObj.getE01PACRL4().equals("9")) out.print("selected"); %>>Otro</option>
				  </select>
		   </td>
		   <td width="5%" > 
				<eibsinput:text name="cnvObj" property="E01PACPR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
		   </td>
		  </tr>

		 <tr id="trclear"> 
		   <td width="10%" > 
		   </td>
		   <td width="5%" > 
			  <div align="center">5</div>
		   </td>
		   <td width="15%" > 
				<eibsinput:text name="cnvObj" property="E01PACRT5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="30%" > 
				<eibsinput:text name="cnvObj" property="E01PACNM5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
				<eibsinput:text name="cnvObj" property="E01PACPH5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
				  <select name="E01PACRL5" <%=readOnly?"disabled":""%>>
					<option value=" " <% if (!(cnvObj.getE01PACRL5().equals("1")||cnvObj.getE01PACRL5().equals("2") || cnvObj.getE01PACRL5().equals("3")||cnvObj.getE01PACRL5().equals("4")||cnvObj.getE01PACRL5().equals("5")||cnvObj.getE01PACRL5().equals("9"))) out.print("selected"); %>></option>
					<option value="1" <% if (cnvObj.getE01PACRL5().equals("1")) out.print("selected"); %>>Esposo(a)</option>                   
					<option value="2" <% if (cnvObj.getE01PACRL5().equals("2")) out.print("selected"); %>>Hijo</option>
					<option value="3" <% if (cnvObj.getE01PACRL5().equals("3")) out.print("selected"); %>>Padre</option>
					<option value="4" <% if (cnvObj.getE01PACRL5().equals("4")) out.print("selected"); %>>Madre</option>
					<option value="5" <% if (cnvObj.getE01PACRL5().equals("5")) out.print("selected"); %>>Hermano(a)</option>
					<option value="6" <% if (cnvObj.getE01PACRL5().equals("9")) out.print("selected"); %>>Otro</option>
				  </select>
		   </td>
		   <td width="5%" > 
				<eibsinput:text name="cnvObj" property="E01PACPR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>"/>
		   </td>
		   <td width="10%" > 
		   </td>
		  </tr>
		 
		</table>
	  </td>
	</tr>
  </table>
  
  <h4>Propiedad </h4>
	
  <table  class="tableinfo">
	<tr bordercolor="#FFFFFF"> 
	  <td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

		  <tr id="trdark"> 
			<td width="10%" > 
			</td>
		   <td width="20%"> 
			  <div align="right">Descripcion :</div>
			</td>
			<td width="40%"> 
				<textarea name="E01PACRMK" cols="50" rows="5" readonly ><%= cnvObj.getE01PACRMK()%> </textarea>
			</td>
			<td width="10%" > 
			</td>
		  </tr>


		  <tr id="trdark"> 
			<td width="10%" > 
			</td>
		   <td width="20%"> 
			  <div align="right">Dirección :</div>
			</td>
			<td width="40%"> 
				<eibsinput:text name="cnvObj" property="E01PACMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="<%=readOnly %>"/>
			</td>
			<td width="10%" > 
			</td>
		  </tr>

		  <tr id="trdark"> 
			<td width="10%" > 
			</td>
		   <td width="20%"> 
			  <div align="right"> </div>
			</td>
			<td width="40%"> 
				<eibsinput:text name="cnvObj" property="E01PACMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="<%=readOnly %>"/>
			</td>
			<td width="10%" > 
			</td>
		  </tr>

		  <tr id="trdark"> 
			<td width="10%" > 
			</td>
		   <td width="20%"> 
			  <div align="right"> </div>
			</td>
			<td width="40%"> 
				<eibsinput:text name="cnvObj" property="E01PACMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="<%=readOnly %>"/>
			</td>
			<td width="10%" > 
			</td>
		  </tr>

		  <tr id="trdark"> 
			<td width="10%" > 
			</td>
		   <td width="20%"> 
			  <div align="right"> </div>
			</td>
			<td width="40%"> 
				<eibsinput:text name="cnvObj" property="E01PACMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="<%=readOnly %>"/>
			</td>
			<td width="10%" > 
			</td>
		  </tr>

		</table>
	  </td>
	</tr>
  </table>

  
  <h4>Vendedor </h4>
	
  <table  class="tableinfo">
	<tr bordercolor="#FFFFFF"> 
	  <td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

		  <tr id="trdark"> 
			<td width="25%" > 
			</td>
		   <td width="15%"> 
			  <div align="right">Ejecutivo Cuenta :</div>
			</td>
			<td width="35%"> 
				 <eibsinput:cnofc name="cnvObj" property="E01PACOFI" required="false" flag="15" fn_code="E01PACOFI" fn_description="E01OFINME" readonly="<%=readOnly %>"/>
				 <eibsinput:text property="E01OFINME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
			</td>
			<td width="25%" > 
			</td>
		  </tr>

		  <tr id="trclear"> 
			<td width="25%" > 
			</td>
		   <td width="15%"> 
			  <div align="right">Canal de venta :</div>
			</td>
			<td width="35%"> 
				 <eibsinput:cnofc name="cnvObj" property="E01PACCNL" required="false" flag="62" fn_code="E01PACCNL" fn_description="E01CNLNME" readonly="<%=readOnly %>"/>
				 <eibsinput:text property="E01CNLNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
			</td>
			<td width="25%" > 
			</td>
		  </tr>

		  <tr id="trdark"> 
			<td width="25%" > 
			</td>
		   <td width="15%"> 
			  <div align="right">Oficina de venta :</div>
			</td>
			<td width="35%"> 
				<eibsinput:help name="cnvObj" property="E01PACBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="false" readonly="<%=readOnly%>"
					fn_param_one="E01PACBRN" fn_param_two="document.forms[0].E01PACBNK.value" fn_param_three="E01BRNNME" />
				 <eibsinput:text property="E01BRNNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
			</td>
			<td width="25%" > 
			</td>
		  </tr>

		  <tr id="trclear"> 
			<td width="25%" > 
			</td>
			<td width="15%" > 
			  <div align="right">Vendedor del Seguro :</div>
			</td>
			<td width="35%" > 
				<eibsinput:help name="cnvObj" property="E01PACVDR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" 
					fn_param_one="E01PACVDR" fn_param_two="E01VDRNME" fn_param_three="S" readonly="<%=readOnly %>"/>
				 <eibsinput:text property="E01VDRNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
			</td>
			<td width="25%" > 
			</td>
		  </tr>

		</table>
	  </td>
	</tr>
  </table>


 <% if(readOnly){%>  
  <h4>Informacion Adicional </h4>
  <table  class="tableinfo">
	<tr bordercolor="#FFFFFF"> 
	  <td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		  <tr id="trdark"> 
			<td width="15%" nowrap="nowrap"> 
			  <div align="right">Valor Pagado por el Cliente Acumulado :</div>
			</td>
			<td width="35%" > 
				 <eibsinput:text property="E01PACTPD" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
			</td>
			<td width="15%" nowrap="nowrap"> 
			  <div align="right">Numero Orden de Pago :</div>
			</td>
			<td width="35%" > 
				 <eibsinput:text property="E01PACPRN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHECK_NUMBER%>" readonly="true"/>
			</td>          
		  </tr>          
		  <tr id="trclear"> 
			<td width="15%" nowrap="nowrap"> 
			  <div align="right">Valor Pagado por el Cliente Anual :</div>
			</td>
			<td width="35%" > 
				 <eibsinput:text property="E01PACTPY" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
			</td>
			<td width="15%" nowrap="nowrap"> 
			  <div align="right">Numero de Renovaciones :</div>
			</td>
			<td width="35%" > 
				 <eibsinput:text property="E01PACPRN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHECK_NUMBER%>" readonly="true"/>
			</td>
		  </tr>
		  <tr id="trdark"> 
			<td width="15%" nowrap="nowrap"> 
			  <div align="right">Valor Pagado a la Compañia Acumulado :</div>
			</td>
			<td width="35%" > 
				 <eibsinput:text property="E01PACPLT" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
			</td>
			<td width="15%" nowrap="nowrap"> 
			  <div align="right">Fecha Ultima Renovacion :</div>
			</td>
			<td width="35%" > 
				<eibsinput:date name="cnvObj" fn_year="E01PACPRY" fn_month="E01PACPRM" fn_day="E01PACPRD" readonly="true"/>
			</td>
		  </tr>     
		  <tr id="trclear"> 
			<td width="15%" nowrap="nowrap"> 
			  <div align="right">Valor Pagado  a la Compañia Anual :</div>
			</td>
			<td width="35%" > 
				 <eibsinput:text property="E01PACTPY" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
			</td>
			<td width="15%" nowrap="nowrap"> 
			  <div align="right">Fecha Ultimo Pago a la Compañia :</div>
			</td>
			<td width="35%" > 
				<eibsinput:date name="cnvObj" fn_year="E01PACPCY" fn_month="E01PACPCM" fn_day="E01PACPCD" readonly="true"/>
			</td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
 <% } %>          

  <% if ((readOnly) && (!cnvObj.getE01DLCTFL().equals(""))) { %>  
  <%   String titdsc = "";
	   if (cnvObj.getE01DLCTFL().equals("T")){
		 titdsc = "Venta Cartera Administrada";
	   } else if (cnvObj.getE01DLCTFL().equals("D")){
		 titdsc = "Destitularizado";
	   } else if (cnvObj.getE01DLCTFL().equals("V")){
		 titdsc = "Venta Cartera No Administrada";
	   }
  %>
  <h4>Venta de Cartera</h4>
  <table class="tableinfo">
	<tr bordercolor="#FFFFFF"> 
	  <td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		  <tr id="trdark"> 
			<td width="25%" ></td>
			<td width="15%"><div align="right">Tipo de Venta :</div></td>
			<td width="45%"> 
			  <eibsinput:text property="E01DLCTFL" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" value="<%=titdsc%>" readonly="true" />
			</td>
			<td width="15%" ></td>
		  </tr>
		  <tr id="trclear"> 
			<td width="25%" ></td>
			<td width="15%"><div align="right">Entidad Compradora :</div></td>
			<td width="45%"> 
			  <eibsinput:text property="E01DLCTCD" name="cnvObj" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" /> 
			  <eibsinput:text property="E01DSCTCD" name="cnvObj" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" /> 
			</td>
			<td width="15%" ></td>
		  </tr>
		  <tr id="trdark"> 
			<td width="25%" ></td>
			<td width="15%"><div align="right">Portafolio :</div></td>
			<td width="45%"> 
			  <eibsinput:text property="E01DLCTPF" name="cnvObj" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" /> 
			  <eibsinput:text property="E01DSCTPF" name="cnvObj" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" /> 
			</td>
			<td width="15%" ></td>
		  </tr>
		  <tr id="trclear"> 
			<td width="25%" ></td>
			<td width="15%"><div align="right">Universalidad :</div></td>
			<td width="45%"> 
			  <eibsinput:text property="E01DLCTUN" name="cnvObj" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" /> 
			  <eibsinput:text property="E01DSCTUN" name="cnvObj" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" /> 
			</td>
			<td width="15%" ></td>
		  </tr>
		  <tr id="trdark"> 
			<td width="25%" ></td>
			<td width="15%"><div align="right">Motivo :</div></td>
			<td width="45%"> 
			  <input type="text" readonly name="E01DLCTMT" size="1" maxlength="1" value="<%=cnvObj.getE01DLCTMT().trim()%>">
			  <input type="text" readonly size="25" value='<% if (cnvObj.getE01DLCTMT().equals("1")) out.print("Normal");
															  else if (cnvObj.getE01DLCTMT().equals("2")) out.print("Cesion");
															  else if (cnvObj.getE01DLCTMT().equals("3")) out.print("Sustitucion");
															  else if (cnvObj.getE01DLCTMT().equals("4")) out.print("Recompras");
															  else if (cnvObj.getE01DLCTMT().equals("5")) out.print("Readquision");
															  else out.print(" ");%>'>
			</td>
			<td width="15%" ></td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
  <% } %>          

 <table class="tbenter" >
	<tr > 
	<td width="10%"> 
		<div align="center"> 
			<p> <input class="EIBSBTN" type="button" name="Submit"   value="Regressar" onclick="goAction(1)"> </p>
		</div>
	</td>
	</tr>
</table>

  </form>
</body>
</HTML>
