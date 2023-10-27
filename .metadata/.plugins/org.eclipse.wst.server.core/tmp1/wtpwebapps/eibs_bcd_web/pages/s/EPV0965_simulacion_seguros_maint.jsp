<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Seguros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV096501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();		
 }

function FactorPrima() {
	getElement("E01PSGMTP").value = '0';
	getElement("E01PSGMTS").value = '0';
	getElement("E01PSGPGA").value = '0';
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

</script>

</head>

<%
	boolean readOnly = false;
	boolean maintenance = false;
	boolean newOnly = false;
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null) {
		if (request.getParameter("readOnly").toLowerCase().equals("true")) {
			readOnly = true;
		} else {
			readOnly = false;
		}
	}
	// Determina si es nuevo o mantencion
	if (userPO.getHeader20().equals("NEW")) {
		newOnly = true;
	} else {
		newOnly = false;
	}
%>

<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly) {%>
	CONSULTA DE SEGURO
<%} else if (newOnly) {%>
	NUEVO SEGURO
<%} else {%>
	MANTENIMIENTO DE SEGURO
<%}%>

<% 
	String emp = (String)session.getAttribute("EMPSG");
	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV0150
%>
<%if ("".equals(emp)){ %> 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="simulacion_seguro_maint.jsp, EPV0965"></h3>
	<hr size="4">
<%}%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0965" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="600">
	<input type=HIDDEN name="E01PSGBNK"  value="<%=currUser.getE01UBK().trim()%>">
	<input type=HIDDEN name="H01FLGMAS"  value="<%=datarec.getH01FLGMAS().trim()%>">
	
	<%int row = 0;%>
 
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap width="16%" align="right"> Cliente : </td>
						<td nowrap width="17%" align="left">
							<eibsinput:text name="datarec" property="E01PSGCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
						</td>
						<td nowrap width="16%" align="right"> Propuesta : </td>
						<td nowrap width="17%"align="left">
							<eibsinput:text name="datarec" property="E01PSGNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="16%" align="right">Sequencia : </td>
						<td nowrap width="18%" align="left">
							<eibsinput:text name="datarec" property="E01PSGSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
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
				<table cellspacing="0" cellpadding="2" width="100%" border="0" >
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="12%" > 
							<div align="right">Seguro :</div>
						</td>
						<td width="38%"  nowrap="nowrap" > 
							<eibsinput:help name="datarec" property="E01PSGSCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" size="4" fn_param_one="E01PSGSCD" fn_param_two="E01PSGSNM" fn_param_three="I" readonly="<%=readOnly%>"/>
							<eibsinput:text property="E01PSGSNM" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
						</td>
						<td width="12%" > 
							<div align="right">Poliza Numero :</div>
						</td>
						<td width="38%" > 
							<eibsinput:text name="datarec" property="E01PSGPLZ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE%>" required="false" readonly="<%=readOnly%>"/>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="12%" > 
							<div align="right">Plan :</div>
						</td>
						<td width="38%" > 
							<%if(readOnly){ %>
							<input type="text" name="E01PSGPLN" size="4" maxlength="2" value="<%=datarec.getE01PSGPLN().trim()%>" readonly class="TXTRIGHT">
							<eibsinput:text name="datarec" property="E01DSCPLN"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" size="40" maxlength="40" readonly="true"/>
							<%}else{ %>
							<input type="text" name="E01PSGPLN" size="4" maxlength="2" value="<%=datarec.getE01PSGPLN().trim()%>" readonly class="TXTRIGHT">
							<a href="javascript:GetTablaSeguros('E01PSGPLN',document.forms[0].E01PSGSCD.value,'E01DSCPLN','E01PSGFAC','E01PSGTBL')" ><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"  ></a>
							<eibsinput:text name="datarec" property="E01DSCPLN"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" size="40" maxlength="40" readonly="true"/>
							<% } %>
						</td>
						<td width="12%" > 
							<div align="right">Fecha Inicio :</div>
						</td>
						<td width="38%" > 
							<eibsinput:date name="datarec" fn_year="E01PSGFIY" fn_month="E01PSGFIM" fn_day="E01PSGFID" readonly="<%=readOnly%>"/>
						</td>
					</tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		            <td width="15%" > 
	  				  <div align="right">Compania :</div>
		            </td>
		            <td width="35%" > 
							<eibsinput:cnofc name="datarec" property="E01PSGCCD" required="false" flag="IT" fn_code="E01PSGCCD" fn_description="E01PSGCNM" readonly="<%=readOnly %>" size="4" maxlength="4" />
							<eibsinput:text property="E01PSGCNM" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" size="40" maxlength="40" readonly="<%=readOnly %>"/>
			        </td>
		           <td width="15%"> 
						<div align="right">Fecha Vencimiento :</div>
		            </td>
		            <td width="35%"> 
							<eibsinput:date name="datarec" fn_year="E01PSGFVY" fn_month="E01PSGFVM" fn_day="E01PSGFVD" readonly="<%=readOnly%>"/>
		            </td>
		          </tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="12%" > 
							<div align="right">Moneda Seguro :</div>
						</td>
						<td width="38%" > 
							<eibsinput:help name="datarec" property="E01PSGCYS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01PSGCYS" fn_param_two="document.forms[0].E01PSGBNK.value"  required="false" readonly="<%=readOnly%>" />
					
				    </td>
						<td width="12%" > 
							<div align="right">Numero de Meses :</div>
						</td>
						<td width="38%" > 
							<eibsinput:text name="datarec" property="E01PSGNPM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" readonly="<%=readOnly%>"/>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="12%" > 
							<div align="right">Tabla Factor :</div>
						</td>
						<td width="38%" > 
			            	<input type="text" name="E01PSGTBL" size="4" maxlength="2" value="<%=datarec.getE01PSGTBL().trim()%>" class="TXTRIGHT">            
			           		   <a href="javascript:GetTablaFactores('E01PSGTBL','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>						
						</td>
						<td width="12%" nowrap="nowrap"> 
							<div align="right">Tasa Tramo :</div>
						</td>
						<td width="38%" >  
			           		<eibsinput:text property="E01PSGFT1" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true"/>		
			           	</td>
					</tr> 
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="12%" > 
			               <div align="right">Monto Base :</div>
						</td>
						<td width="38%" > 
			              <select name="E01PSGBSE" <%=readOnly ? "disabled" : ""%>>
			                <option value="O" <% if (datarec.getE01PSGBSE().equals("O")) out.print("selected"); %>>Monto Original</option>
			                <option value="B" <% if (datarec.getE01PSGBSE().equals("B")) out.print("selected"); %>>Saldo Capital</option>
			                <option value="I" <% if (datarec.getE01PSGBSE().equals("I")) out.print("selected"); %>>Saldo Teorico</option>
			                <option value="T" <% if (datarec.getE01PSGBSE().equals("T")) out.print("selected"); %>>Total Deuda</option>
			                <option value="C" <% if (datarec.getE01PSGBSE().equals("C")) out.print("selected"); %>>Valor Cuota</option>
			               </select>								
			             </td>
						<td width="12%" > 
							<div align="right">Monto Asegurado :</div>
						</td>
						<td width="38%" > 
							<eibsinput:text name="datarec" property="E01PSGMTS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="<%=readOnly%>"/>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td  width="12%" > 
         	           		 <div align="right">Factor :</div>
						</td>
						<td width="38%" > 
			              <select name="E01PSGFAC" <%=readOnly ? "disabled" : ""%> onchange="showFactorLabel(this.value)">
			                <option value="F" <% if (datarec.getE01PSGFAC().equals("F")) out.print("selected"); %>>Valor Fijo</option>
			                <option value="P" <% if (datarec.getE01PSGFAC().equals("P")) out.print("selected"); %>>Porcentaje</option>
			                <option value="1" <% if (datarec.getE01PSGFAC().equals("1")) out.print("selected"); %>>Tasa/Periodo</option>
			               </select>							
						</td>
						<td width="12%" > 
							<div align="right" id="divFactorLabel">Monto Prima Fijo :</div>
						</td>
						<td width="38%" > 
			               <div align="left" id="FIJO"> 
								<eibsinput:text name="datarec" property="E01PSGMTP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" onchange="setMonto()" readonly="<%=readOnly%>"/>
							</div>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="12%" > 
							<div align="right">Moneda Prima :</div>
						</td>
						<td width="38%" > 
							<eibsinput:help name="datarec" property="E01PSGCYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01PSGCYP" fn_param_two="document.forms[0].E01PSGBNK.value"  required="false" readonly="<%=readOnly%>"/>
						</td>					
						<td  width="12%" > 
							<div align="right">Monto Prima :</div>
						</td>
						<td width="38%" > 
								<eibsinput:text name="datarec" property="E01PSGPGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true"/>
						</td>
					</tr>					
				</table>
			</td>
		</tr>
	</table>
	
	<% if (!readOnly) { %>
	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
	</div>
	<% } else { %>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
	</div>     
	<% } %>
	  
</form>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
	window.opener.location.href =  '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0965?SCREEN=101&E01PSGCUN=<%=userPO.getCusNum()%>&E01PSGNUM=<%=userPO.getPorfNum()%>';	   	   
	cerrarVentana();	  
</script>
<% } %>  

<script type="text/javascript">
showFactorLabel(getElement("E01PSGFAC").value,true);


function showFactorLabel(payvalue,firstTime){
	if(payvalue === "P" || payvalue === "1"){
		getElement("divFactorLabel").innerHTML= 'Monto Prima % :';
		getElement("FIJO").style.display= 'inline';
		if(firstTime != true)getElement("E01PSGMTP").value = "0.000000" ;
	}else{
		getElement("divFactorLabel").innerHTML= 'Monto Prima Fijo :';
		getElement("FIJO").style.display= 'inline';
	}
}

function setMonto(){
	var payType = getElement("E01PSGFAC").value ;
	if(payType === "F"){
		getElement("E01PSGPGA").readOnly = true;
		getElement("E01PSGMTP").value = formatCCY(getElement("E01PSGMTP").value);	
		getElement("E01PSGPGA").value = getElement("E01PSGMTP").value ;
	}else{
		getElement("E01PSGPGA").readOnly = true;
		getElement("E01PSGPGA").value = "0.0000";
	}	
}

</script>


   
</body>
</HTML>

