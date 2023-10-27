<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<title>Desembolso</title>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV110001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<%
	boolean readOnly=false;
	boolean maintenance=false;
	boolean newOnly=false;
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
	// Determina si es nuevo o mantencion
	if (userPO.getHeader20().equals("NEW")){
		newOnly=true;
	} else if (userPO.getHeader20().equals("MAINTENANCE")) {
   		newOnly=false;
	} else {
   		newOnly=true;		
	}
%>

<script type="text/javascript">
//ADD LISTENER TO PAGE
addEventHandler(document, 'DOMContentLoaded', function() {
	<%-- Commision Fields(ACH) --%>
    addEventHandler(getElement('ACHCOA'), 'change', function() {
        getElement('E01FLGCOA').value = "X";
        getElement('ACHIVA').value = "0.00";
    });
    <%-- Comision Fields(Official Check) --%>
    addEventHandler(getElement('OFCCOA'), 'change', function() {
    	getElement('E01FLGCOA').value = "X";
    	getElement('OFCIVA').value = "0.00";
    });	    
    
    <%-- Impuesto Fields(ACH) --%>
    addEventHandler(getElement('ACHTXA'), 'change', function() {
    	getElement('E01FLGTXA').value = "X";
    });	    
    <%-- Impuesto Fields(Generic) --%>
    addEventHandler(getElement('LNSTXA'), 'change', function() {
    	getElement('E01FLGTXA').value = "X";
    });	 
    <%-- Impuesto Fields(Ofiicial Check) --%>
    addEventHandler(getElement('OFCTXA'), 'change', function() {
    	getElement('E01FLGTXA').value = "X";
    });	  

	chgConcept();
	chgPago('<%=datarec.getE01PVBPFL().equals("")?"TO":datarec.getE01PVBPFL().trim()%>');
});	

</script>
</head>
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA DE DESEMBOLSO
<%} else if (newOnly){ %>
	NUEVO DESEMBOLSO
<%} else { %>
	MANTENIMIENTO DE DESEMBOLSO
<%} %>

 <% String emp = (String)session.getAttribute("EMPDS");
 	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV1010
 %>
 <%if ("".equals(emp)){ %> 
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="desembolso_maintenance.jsp, EPV1100"></h3>
<hr size="4">
<%}%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100" >
  <INPUT type=HIDDEN name="SCREEN"    id="SCREEN"    value="500">
  <input type=HIDDEN name="E01UBK"    id="E01UBK"    value="<%= currUser.getE01UBK().trim()%>">
  <input type=HIDDEN name="H01FLGMAS" id="H01FLGMAS" value="<%= datarec.getH01FLGMAS().trim()%>">
  <input type=HIDDEN name="E01PVBOGL" id="E01PVBOGL" value="<%= datarec.getE01PVBOGL().trim()%>">
  <input type=HIDDEN name="E01PVBPFL" id="E01PVBPFL" value="<%= datarec.getE01PVBPFL().trim()%>">
  <input type=HIDDEN name="E01PVBTYP" id="E01PVBTYP" value="<%= datarec.getE01PVBTYP().trim()%>">
  <input type=HIDDEN name="E01PVBOAM" id="E01PVBOAM" value="<%= datarec.getE01PVBOAM().trim()%>">
  <input type=HIDDEN name="E01PVBTXA" id="E01PVBTXA" value="<%= datarec.getE01PVBTXA().trim()%>">
  <input type=HIDDEN name="E01PVBCOA" id="E01PVBCOA" value="<%= datarec.getE01PVBCOA().trim()%>">
  <input type=HIDDEN name="E01PVBIVA" id="E01PVBIVA" value="<%= datarec.getE01PVBIVA().trim()%>">
  <input type=HIDDEN name="E01PVBTOT" id="E01PVBTOT" value="<%= datarec.getE01PVBTOT().trim()%>">
  <input type=HIDDEN name="E01PVBOAC" id="E01PVBOAC" value="<%= datarec.getE01PVBOAC().trim()%>">
  <input type=HIDDEN name="E01FLGTXA" id="E01FLGTXA" value="<%= datarec.getE01FLGTXA().trim()%>">
  <input type=HIDDEN name="E01FLGCOA" id="E01FLGCOA" value="<%= datarec.getE01FLGCOA().trim()%>">
  <input type=HIDDEN name="prdCode" id="prdCode" value="<%= request.getAttribute("prdCode")%>">
  <input type=HIDDEN name="OFFACD" id="OFFACD" value="<% if (userPO.getHeader23().equals("DFT") ) { out.print("FA"); } else { out.print("10"); }%>">
  
 <% int row = 0;%>
 <%if ("".equals(emp)){ %> 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
             <td nowrap width="10%" align="right"> Cliente : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="datarec" property="E01PVBCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Propuesta : 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="datarec" property="E01PVBNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">Sequencia :  
             </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="datarec" property="E01PVBSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
             </td>
         </tr>
       </table>
      </td>
    </tr>
  </table>
  <%}else{%>
  	<input  type="hidden" name="E01PVBCUN" value="<%=datarec.getE01PVBCUN()%>">
  	<input  type="hidden" name="E01PVBNUM" value="<%=datarec.getE01PVBNUM()%>">
  	<input  type="hidden" name="E01PVBSEQ" value="<%=datarec.getE01PVBSEQ()%>"> 
  <%} %>

<%if ("".equals(emp)){ %>      
  <h4>Datos de Desembolso</h4>
<%} %>      
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
						<td width="30%"> 
							<div align="right">Concepto :</div>
						</td>
						<td width="70%">
							<% if (readOnly) { %>
								<input type="text" name="E01PVBOPC" id="E01PVBOPC" value="<%= datarec.getE01PVBOPC().trim()%>" size="3" maxlength="3" <%=readOnly?"readonly":""%>>
								<eibsinput:text property="E01PVBDSC" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" required="true" readonly="<%=readOnly%>"/>
							<% }else{ %>
								<input type="text" name="E01PVBOPC" id="E01PVBOPC" value="<%= datarec.getE01PVBOPC().trim()%>" size="3" maxlength="3" onchange="chgConcept();" readonly>
								<%if(datarec.getE01PVBOPC().trim().equals("")) {%><!--If Empty. New. If not Empty. Maint. Not able to change  -->
									<a href="javascript:GetConcept('E01PVBDSC',getElement('E01UBK').value,getElement('OFFACD').value,'E01PVBOGL','E01PVBOPC','01','E01PVBTYP',getElement('E01PVBOCY').value,getElement('prdCode').value , 'E01PVBOCY');">
										<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
									</a> 
								<% } %>
								<eibsinput:text property="E01PVBDSC" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" required="true" readonly="true"/>
							<% } %>
						</td>
					</tr>
					<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
						<td> 
							<div align="right">Destino Fondos :</div>
						</td>
						<td > 
							<% if (readOnly) { %>
								<eibsinput:text property="E01PVBDST" name="datarec" size="5" maxlength="4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TEXT%>" readonly="true" />
								<eibsinput:text property="E01DSCDST" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
							<%	}else{ %>
								<eibsinput:cnofc name="datarec" property="E01PVBDST" size="5" maxlength="4" flag="38" fn_code="E01PVBDST" fn_description="E01DSCDST" readonly="<%=readOnly%>" onchange="resetAMTField(getElement('OFCOAM'));resetAMTField(getElement('OFCTOT'));"/>
								<eibsinput:text property="E01DSCDST" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"  required="true" readonly="true"/>
							<% } %>
						</td>
					</tr>
					<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>
						<td width="30%"> 
							<div align="right">Banco :</div>
						</td>
						<td width="70%">             
 			    <eibsinput:text property="E01PVBOBK" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK%>" required="false" readonly="<%=readOnly%>"/>
						</td>
					</tr>
					<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
						<td > 
							<div align="right">Sucursal :</div>
						</td>
						<td >
							<% if (readOnly) { %>
								<eibsinput:text name="datarec" property="E01PVBOBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" readonly="<%=readOnly%>"/>
							<% }else{ %>
								<eibsinput:help name="datarec" property="E01PVBOBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" fn_param_one="E01PVBOBR" fn_param_two="document.forms[0].E01PVBOBK.value" readonly="<%=readOnly%>"/>
							<% } %>
						</td>
					</tr>
					<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
						<td > 
							<div align="right">Moneda :</div>
						</td>
						<td >
							<% if (readOnly) { %>
								<eibsinput:text name="datarec" property="E01PVBOCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="<%=readOnly%>"/>
							<% }else{
									if(datarec.getE01PVBOCY().trim().equals("")){ 
								%>
										<eibsinput:help fn_param_one="E01PVBOCY" fn_param_two="document.forms[0].E01PVBOBK.value" name="datarec" property="E01PVBOCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="<%=readOnly%>"/>
							      <% } else { %>
										<eibsinput:help fn_param_one="E01PVBOCY" fn_param_two="document.forms[0].E01PVBOBK.value" name="datarec" property="E01PVBOCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="<%=readOnly%>"/>
							 	<%  }
							  }%>     
						</td>
					</tr>
					<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
						<td > 
							<div align="right">Tasa de Cambio :</div>
						</td>
						<td >
							<eibsinput:text property="E01PVBEXR" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE%>" readonly="<%=readOnly%>"/>
						</td>
					</tr>
					<tr > 
						<td colspan="2">
							<table id="selDefault" cellspacing="0" width="100%" border="0">
								<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
									<td> 
										<div align="right">Referencia :</div>
									</td>
									<td >
										<% if (readOnly) { %>
											<eibsinput:text name="datarec" property="REFOAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBOAC().trim()%>"/>
										<% }else{ %>
											<eibsinput:help name="datarec" property="REFOAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" fn_param_one="REFOAC" fn_param_two="document.forms[0].E01UBK.value" fn_param_three="RT" fn_param_five="${datarec.E01PVBCUN}" fn_param_six="String('E01PVBOCY')" required="false" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBOAC().trim()%>"/>
										<% } %>
									</td>
								</tr>
								<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>
									<td width="30%">  
										<div align="right">Valor Desembolso :</div>
									</td>
									<td width="70%">
										<eibsinput:text property="E01MON" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBOAM().trim()%>" onchange="resetAMTField(this);"/>
									</td>
								</tr>
								<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
									<td > 
										<div align="right">Impuesto :</div>
									</td>
									<td colspan="3">
										<eibsinput:text property="TXA1" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBTXA().trim()%>"/>
									</td>
								</tr>
								<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
									<td > 
										<div align="right">Total Fraccion :</div>
									</td>
									<td colspan="3">
										<eibsinput:text property="TOT1" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBTOT().trim()%>" onchange="resetAMTField(this);"/>
						       	 	    <input class="styled-button-Search" type=button name="Submit" value="Saldo" onClick="javascript:goAction('SALDO','TOT1')">
									</td>
								</tr>
							</table>
						</td>  
					</tr>
				</table>
			</td>
		</tr>
	</table>
  
	<div id="transferenciaach">
		<h4>Transferencia ACH</h4>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF"> 
				<td nowrap> 
					<table cellspacing="0" cellpadding="2" width="100%" border="0" > <%row = 1;%>
						<% if (!datarec.getE01PVCSTS().equals("")) { %>
						<%   String stsdsc = "";
						     if (datarec.getE01PVCSTS().equals("R")){
						       stsdsc = "REENVIADO";
						     } else if (datarec.getE01PVCSTS().equals("C")){
						       stsdsc = "RECHAZADO";
						     } else {
						       stsdsc = datarec.getE01PVCSTS().trim();
						     }
						%>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"><div align="right">Estado :</div></td>
							<td width="30%">
								<eibsinput:text property="E01PVCSTS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" value="<%=stsdsc%>" readonly="true" />
							</td>
							<td width="20%"></td>
							<td width="30%"></td>
						</tr>
						
						<% } %>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Nombre Beneficiario :</div>
							</td>
							<td width="30%">
								<eibsinput:text property="E01PVBNME" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly%>" />
							</td>
							<td width="20%"> 
								<div align="right">Direccion :</div>
							</td>
							<td width="30%">
								<eibsinput:text property="E01PVBADD" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly%>" />
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Ciudad :</div>
							</td>
							<td width="30%">
								<eibsinput:text property="E01PVBCSZ" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly%>" />
							</td>
							<td width="20%"> 
								<div align="right">Tipo de Indentificacion :</div>
							</td>
							<td width="30%">
								<eibsinput:cnofc flag="34" name="datarec" property="E01PVBTID" readonly="<%=readOnly%>" />
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Numero de Identificacion :</div>
							</td>
							<td width="30%">
								<eibsinput:text property="E01PVBIDN" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" readonly="<%=readOnly%>" />
							</td>
							<td width="20%"> 
								<div align="right">Banco Destino (Ruta) :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01PVBROU" size="11" maxlength="10" value="<%= datarec.getE01PVBROU().trim()%>" readonly="<%=readOnly%>" >
								<% if (!readOnly) { %>
								<a href="javascript:GetAchOperator('E01PVBROU','O',' ','D')"> 
									<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
								</a>
								<% } %>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Tipo de Cuenta :</div>
							</td>
							<td width="30%">
								<select name="E01PVBACT" <%=readOnly?"disabled":""%> >
								<option value="C" <% if (!(datarec.getE01PVBACT().equals("C"))) out.print("selected"); %>>Corriente </option>
								<option value="S" <% if   (datarec.getE01PVBACT().equals("S"))  out.print("selected"); %>>Ahorros   </option>
								</select>
							</td>
							<td width="20%"> 
								<div align="right">Cuenta Beneficiario :</div>
							</td>
							<td width="30%">
								<eibsinput:text property="E01PVBAAC" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TEXT%>" maxlength="17" size="18" readonly="<%=readOnly%>"/>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Valor a Transferir :</div>
							</td>
							<td width="30%">
								<eibsinput:text property="E01ACH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBOAM().trim()%>" onchange="resetAMTField(this);"/>
							</td>
							<td width="20%"></td>
							<td width="30%"></td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Comisión :</div>
							</td>
							<td colspan="3">
								<eibsinput:text property="ACHCOA" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBCOA().trim()%>"/>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">IVA :</div>
							</td>
							<td colspan="3">
								<eibsinput:text property="ACHIVA" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" value="<%= datarec.getE01PVBIVA().trim()%>"/>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Impuesto :</div>
							</td>
							<td colspan="3">
								<eibsinput:text property="ACHTXA" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBTXA().trim()%>"/>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Total Fraccion :</div>
							</td>
							<td colspan="3">
								<eibsinput:text property="ACHTOT" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBTOT().trim()%>" onchange="resetAMTField(this);"/>
				       	 	    <input class="styled-button-Search" type=button name="Submit" value="Saldo" onClick="javascript:goAction('SALDO','ACHTOT')">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>  
  
  <div id="pagoprestamos">
    <h4>Pago a Prestamos</h4>
    <table class="tableinfo">
      <tr bordercolor="#FFFFFF"> 
        <td nowrap> <%row++;%>
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >
	          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
	            <td > 
	              <div align="right">Prestamo :</div>
	            </td>
	            <td >
					<% if (readOnly) { %>
						<eibsinput:text name="datarec" property="LNSOAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBOAC().trim()%>"/>
					<% }else{ %>
		   	 			<eibsinput:help name="datarec" property="LNSOAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" fn_param_one="LNSOAC" fn_param_two="document.forms[0].E01UBK.value" fn_param_three="10" required="false" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBOAC().trim()%>"/>
					<% } %>
	            </td>
	          </tr>
            <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>  
              <td nowrap width="30%"> 
                <div align="right">                
                  <input type="radio" name="E01FLG" value="TO" <%if ((datarec.getE01PVBPFL().equals("TO")) || (datarec.getE01PVBPFL().equals(""))) out.print("checked");%> onclick="chgPago(this.value)">
                </div>
              </td>
              <td nowrap width="70%">Pago Total</td>
            </tr>
            <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>  
              <td nowrap width="30%"> 
                <div align="right">
                  <input type="radio" name="E01FLG" value="CV" <%if(datarec.getE01PVBPFL().equals("CV")) out.print("checked");%> onclick="chgPago(this.value)">
                </div>
              </td>
              <td nowrap width="70%">Cuotas Vencidas</td>
            </tr>
            <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>  
              <td nowrap width="30%"> 
                <div align="right">
                  <input type="radio" name="E01FLG" value="PC" <%if(datarec.getE01PVBPFL().equals("PC")) out.print("checked");%> onclick="chgPago(this.value)">
                </div>
              </td>
              <td nowrap width="70%">N&uacute;mero de Cuotas
	              <eibsinput:text property="E01PVBCUO" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" readonly="<%=readOnly%>" />
			  </td>              
            </tr>
            <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>  
              <td nowrap width="30%"> 
                <div align="right">
                  <input type="radio" name="E01FLG" value="DS" <%if(datarec.getE01PVBPFL().equals("DS")) out.print("checked");%> onclick="chgPago(this.value)">
                </div>
              </td>
              <td nowrap width="70%"> Monto a Distribuir </td>
            </tr>
               <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>
                 <td width="30%">  
                   <div align="right">Valor a Pagar :</div>
                 </td>
                 <td width="70%">
                   <eibsinput:text property="LNSOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBOAM().trim()%>" onchange="resetAMTField(this);" />
                 </td>
               </tr>
	           <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
	            <td > 
	              <div align="right">Impuesto :</div>
	            </td>
	            <td colspan="3">
	              <eibsinput:text property="LNSTXA" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBTXA().trim()%>"/>
	            </td>
	          </tr>
	          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
	            <td > 
	              <div align="right">Total Fraccion :</div>
	            </td>
	            <td colspan="3">
	              <eibsinput:text property="LNSTOT" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBTOT().trim()%>" onchange="resetAMTField(this)"/>
        	 	   <input class="styled-button-Search" type=button name="Submit" value="Saldo" onClick="javascript:goAction('SALDO','LNSTOT')">
	            </td>
	          </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>  

	<div id="chequegerencia">
		<h4>Cheque de Gerencia</h4>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF"> 
				<td nowrap> 
					<table cellspacing="0" cellpadding="2" width="100%" border="0"><%row = 1;%>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="15%"> 
								<div align="right">Identificacion :</div>
							</td>
							<td width="35%">
							<%if (readOnly){ %>
								<eibsinput:text property="E01PVCRUT" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>"  readonly="true" />
							<% } else { %>
								<eibsinput:text property="E01PVCRUT" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" required="true" />
							<% } %>  
							</td>
							<td width="15%"> 
								<div align="right">Cliente :</div>
							</td>
							<td width="35%">             
								<eibsinput:help name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01PVCCCU" fn_param_one="E01PVCCCU" fn_param_two="E01PVCNME" fn_param_three="E01PVCRUT"   readonly="<%=readOnly %>"/>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Nombre :</div>
							</td>
							<td colspan="3">
								<eibsinput:text name="datarec" property="E01PVCNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="true" readonly="<%=readOnly%>"/>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Direccion   :</div>
							</td>
							<td colspan="3">
								<eibsinput:text name="datarec" property="E01PVCAD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly%>"/> <br>
								<eibsinput:text name="datarec" property="E01PVCAD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly%>"/> <br>
								<eibsinput:text name="datarec" property="E01PVCAD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly%>"/>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Descripci&oacute;n   :</div>
							</td>
							<td colspan="3">
								<eibsinput:text name="datarec" property="E01PVCDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="<%=readOnly%>"/> <br>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Referencia :</div>
							</td>
							<td colspan="3">
								<eibsinput:text name="datarec" property="E01PVBAAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" size="20" maxlength="17"  readonly="<%=readOnly%>"/> <br>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Nro. Cheque :</div>
							</td>
							<td colspan="3">
								<eibsinput:text name="datarec" property="E01PVCCKN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHECK_NUMBER %>" readonly="true"/> <br>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Valor del Cheque:</div>
							</td>
							<td colspan="3">
								<eibsinput:text property="OFCOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBOAM().trim()%>" onchange="resetAMTField(this);" />              
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Comisión :</div>
							</td>
							<td colspan="3">
								<eibsinput:text property="OFCCOA" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBCOA().trim()%>"/>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">IVA :</div>
							</td>
							<td colspan="3">
								<eibsinput:text property="OFCIVA" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" value="<%= datarec.getE01PVBIVA().trim()%>"/>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Impuesto :</div>
							</td>
							<td colspan="3">
								<eibsinput:text property="OFCTXA" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBTXA().trim()%>"/>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td > 
								<div align="right">Total Fraccion :</div>
							</td>
							<td colspan="3">
								<eibsinput:text property="OFCTOT" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01PVBTOT().trim()%>" onchange="resetAMTField(this)"/>
			        	 	    <input class="styled-button-Search" type=button name="Submit" value="Saldo" onClick="javascript:goAction('SALDO','OFCTOT')">
							</td>
						</tr>
	        </table>
	      </td>
	    </tr>
	  </table>
  </div>  

   <%if  (!readOnly) { %>
      <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" onclick="SendInfo()" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
      </div>
    <% } else { %>
      <div align="center"> 
          <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
      </div>     
    <% } %>  
    
</form>

<script type="text/javascript">
	function resetAMTField(that){
		if((that.name).match(/^(ACHTOT|OFCTOT|LNSTOT|TOT1|E01ACH|LNSOAM|OFCOAM|E01MON)$/)){
			if((that.name).match(/^(ACHTOT|OFCTOT|LNSTOT|TOT1)$/)){
				getElement("E01ACH").value = "0.00";
				getElement("LNSOAM").value = "0.00";
				getElement("OFCOAM").value = "0.00";
				getElement("E01MON").value = "0.00";		
				
			}else if((that.name).match(/^(E01ACH|LNSOAM|OFCOAM|E01MON)$/)){
				getElement("ACHTOT").value = "0.00";
				getElement("OFCTOT").value = "0.00";
				getElement("LNSTOT").value = "0.00";
				getElement("TOT1").value = "0.00";
			}

		wipeOtherAmounts();		
		wipeFlags();
	  }
	}
	
	function wipeOtherAmounts(){
		getElement("ACHTXA").value = "0.00"; //ACH FIELDS
		getElement("ACHCOA").value = "0.00";
		getElement("ACHIVA").value = "0.00";
	//	getElement("ACHOAC").value = "0.00";	

		getElement("LNSTXA").value = "0.00";//LNS FIELDS
	//	getElement("LNSOAC").value = "0.00";
		
		getElement("OFCTXA").value = "0.00";//OFFICIAL CHECK FIELS
		getElement("OFCCOA").value = "0.00";
		getElement("OFCIVA").value = "0.00";	
		
		getElement("TXA1").value = "0.00";
	}
	
	function wipeFlags(){
		getElement("E01FLGTXA").value = "";
		getElement("E01FLGCOA").value = "";			
	}
	
	function goAction(type, elemName){
		<%--Called OnClick of Saldo Buttons; Determines Saldo Value--%>
		
		var saldoElm = getElement(elemName); 
		if(getElement('E01PVBOCY').value != '${sessionScope.userPO.currency}'){
			getSaldo(saldoElm, opener.parent.document.forms[0]["SALNET"].value, true);
		} else {
			getSaldo(saldoElm, opener.parent.document.forms[0]["SALNET"].value, false);
		}
	}

	function getSaldo(saldoElm, amt2Ex ,ajax){
		var saldo = amt2Ex;

		<%--Desemobolso Ajax Calls when CCY of Loan and Disbursement are != --%>
		if(ajax){
			var serialize = $('form').serialize();

			$.ajax({
				  type: 'POST',
				  url: "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=10",
		          cache: false,
		          data: serialize + "&LN_BNK=${sessionScope.userPO.bank}&LN_CCY=${sessionScope.userPO.currency}&SALDO="+amt2Ex,
		          async: false,
		        error: function(e) { 
		    		return saldo;		
		        },
		        success : function(response){
		        	var data = response;
		        	if (data.type == "error"){
		        		showErrors();
		        	}
					if(data.type == 'data'){
						saldo= data.E03DSTAMT;
						displaySaldo(saldoElm, saldo);
					}
		        }
			});	
		} else {
			displaySaldo(saldoElm, saldo);
		}
	}

	function displaySaldo(saldoElm, amt){
		saldoElm.value = amt;
		EventTrigger(saldoElm, "change");
	}

	function chgConcept(val){
		<%-- Called Onchange of Concept Field. Determisn Which Div/Table to Show --%>
		if (getElement("E01PVBTYP").value == ("A")) {					// ACH
			$('#selDefault').hide();
			$('#transferenciaach').show();
			$('#pagoprestamos').hide();
			$('#chequegerencia').hide();
		} else if (getElement("E01PVBTYP").value == ("L")) {	// Pago a Prestamos
			$('#selDefault').hide();
			$('#transferenciaach').hide();
			$('#pagoprestamos').show();
			$('#chequegerencia').hide();
		} else if (getElement("E01PVBTYP").value == ("1")) {	// Cheque de Gerencia
			$('#selDefault').hide();
			$('#transferenciaach').hide();
			$('#pagoprestamos').hide();
			$('#chequegerencia').show();
		} else {
			$('#selDefault').show();
			$('#transferenciaach').hide();
			$('#pagoprestamos').hide();
			$('#chequegerencia').hide();
		} 
	}

	function chgPago(val){ 		
		getElement("E01PVBPFL").value = val;
	}

	function SendInfo(){
        <%--Function Called on Submit Button. Places Values in Correct Fields --%>
		var val = getElement("E01PVBPFL").value;
		if (getElement("E01PVBTYP").value == ("A")) {					// ACH
			getElement("E01PVBOAM").value = getElement("E01ACH").value;
			getElement("E01PVBTXA").value = getElement("ACHTXA").value;
			getElement("E01PVBCOA").value = getElement("ACHCOA").value;
			getElement("E01PVBIVA").value = getElement("ACHIVA").value;
			getElement("E01PVBTOT").value = getElement("ACHTOT").value;
		//	getElement("E01PVBOAC").value = getElement("ACHOAC").value;
		} else if (getElement("E01PVBTYP").value == ("L")) {	// Pago a Prestamos
			getElement("E01PVBOAM").value = getElement("LNSOAM").value;
			getElement("E01PVBTXA").value = getElement("LNSTXA").value;
			getElement("E01PVBTOT").value = getElement("LNSTOT").value;
			getElement("E01PVBOAC").value = getElement("LNSOAC").value;
		} else if (getElement("E01PVBTYP").value == ("1")) {	// Cheque de Gerencia
			getElement("E01PVBOAM").value = getElement("OFCOAM").value;
			getElement("E01PVBTXA").value = getElement("OFCTXA").value;
			getElement("E01PVBCOA").value = getElement("OFCCOA").value;
			getElement("E01PVBIVA").value = getElement("OFCIVA").value;
			getElement("E01PVBTOT").value = getElement("OFCTOT").value;
		} else {
			getElement("E01PVBOAC").value = getElement("REFOAC").value;
			getElement("E01PVBTXA").value = getElement("TXA1").value;
			getElement("E01PVBTOT").value = getElement("TOT1").value;
			getElement("E01PVBOAM").value = getElement("E01MON").value;
		} 
		document.forms[0].submit();
	}

	function cerrarVentana(){
		window.open('','_parent','');
		window.close(); 
	}

	//Display Saldo Button if SALNET > 0	
	if(parseFloat(opener.parent.document.forms[0]["SALNET"].value) <= 0){
		var buttons = document.getElementsByClassName("styled-button-Search");
		Array.prototype.filter.call(buttons, function(buttons){
		    return buttons.style.display = 'none';
		});
	} 
</script>

	
<%--****************************** Refreshes Parent Iframe After Successful Submission ******************************--%>
<% if ("S".equals(request.getAttribute("ACT"))){ %>
<script type="text/javascript">
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=101&E01PVBCUN=<%=userPO.getCusNum()%>&E01PVBNUM=<%=userPO.getPorfNum()%>&prdCode=<%=userPO.getProdCode()%>"';	   	   
	cerrarVentana();	  
</script>
<% } %>	
	
<% if(readOnly) {%>	
<%--///******************************   Scripts Depend on Read Only Status of Page ************************////////	--%>
	<script type="text/javascript">
		 // If Inquiry, Always Remove Button
		var buttons = document.getElementsByClassName("styled-button-Search");
			Array.prototype.filter.call(buttons, function(buttons){
			return buttons.style.display = 'none';
		});

		<%-- Add Right Click Consulta Functionality --%>		
		$('#REFOAC').addClass('context-menu-inq').attr('onmousedown', "init(inqAccount, this.value)");
		$('head').append('<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css">');
	</script>
<% } %>
</body> 
</HTML>