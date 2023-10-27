<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %>

<html>
<head>
<title>Seguros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV118001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript"  src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
    document.forms[0].submit();		
 }

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

function FactorPrima() {
	getElement("E01PSGMTP").value = '0';
	getElement("E01PSGMTS").value = '0';
	getElement("E01PSGPGA").value = '0';
}

function FormaPago() {
	if((getElement("E01PSGCOP").value == ('O'))||(getElement("E01PSGCOP").value == ('P'))||(getElement("E01PSGCOP").value == ('D'))) {
		getElement("medioRow").style.display = 'table-row';
		getElement("medio1").style.display = 'table-cell';
		getElement("medio2").style.display = 'table-cell';
		getElement("blanco1").style.display = 'table-cell';
		getElement("blanco2").style.display = 'table-cell';
	} else {
		getElement("medioRow").style.display = 'none';
		getElement("medio1").style.display = 'none';
		getElement("medio2").style.display = 'none';
		getElement("blanco1").style.display = 'none';
		getElement("blanco2").style.display = 'none';
	}

	if((getElement("E01PSGCOP").value != ('O'))&&(getElement("E01PSGCOP").value != ('P'))&&(getElement("E01PSGCOP").value != ('D'))) getElement("E01PSGMPG").value = " ";
	MedioPago();
}

function MedioPago() {
	// D:Desembolso N:NuevoCredito A:CuentaPago G:CuentaContable
	
	if(getElement("E01PSGMPG").value == ('N')){
		getElement("titleCredito").style.display = 'table-cell';
		getElement("AperturaCredito").style.display = 'table-cell';
		getElement("blanco1").style.display = 'none';
		getElement("blanco2").style.display = 'none';
		getElement("ctaPgo1").style.display = 'none';
		getElement("ctaPgo2").style.display = 'none';
		getElement("ctaCnt1").style.display = 'none';
		getElement("ctaCnt2").style.display = 'none';
		getElement("ctaCntR").style.display = 'none';
	} else if(getElement("E01PSGMPG").value == ('A')){
		getElement("AperturaCredito").style.display = 'none';
		getElement("titleCredito").style.display = 'none';
		getElement("blanco1").style.display = 'none';
		getElement("blanco2").style.display = 'none';
		getElement("ctaPgo1").style.display = 'table-cell';
		getElement("ctaPgo2").style.display = 'table-cell';
		getElement("ctaCnt1").style.display = 'none';
		getElement("ctaCnt2").style.display = 'none';
		getElement("ctaCntR").style.display = 'none';
	} else if(getElement("E01PSGMPG").value == ('G')){
		getElement("AperturaCredito").style.display = 'none';
		getElement("titleCredito").style.display = 'none';
		getElement("blanco1").style.display = 'none';
		getElement("blanco2").style.display = 'none';
		getElement("ctaPgo1").style.display = 'none';
		getElement("ctaPgo2").style.display = 'none';
		getElement("ctaCnt1").style.display = 'table-cell';
		getElement("ctaCnt2").style.display = 'table-cell';
		getElement("ctaCntR").style.display = 'table-row';
	} else {
		getElement("AperturaCredito").style.display = 'none';
		getElement("titleCredito").style.display = 'none';
		getElement("blanco1").style.display = 'table-cell';
		getElement("blanco2").style.display = 'table-cell';
		getElement("ctaPgo1").style.display = 'none';
		getElement("ctaPgo2").style.display = 'none';
		getElement("ctaCnt1").style.display = 'none';
		getElement("ctaCnt2").style.display = 'none';
		getElement("ctaCntR").style.display = 'none';
	}
}

function RelacionPago() {
	if(getElement("E01PSGRPG").value == ('1')){
		//getElement("CuentaPago").style.display = 'block';
	} else {
		//getElement("CuentaPago").style.display = 'none';
	
	}
}

function editControl(status) {
	if (status != "Y") {
		return;
	}
	var editControlLst = ["E01PSGPLZ","E01PSGCYS","E01PSGTBL","E01PSGFT1","E01PSGBSE","E01PSGFAC",
	                     "E01PSGCYP","E01PSGPGA","E01PSGMTP"];
	if (editControlLst != null) {
		$.each(editControlLst, function(key, eleEdit) {
			if (isValidObject(eleEdit)){
				try {
					// readOnly true
					getElement(eleEdit).readOnly = true;
					// disable true for [INPUT]
					if (getElement(eleEdit).tagName == "INPUT") {
						$("input[name="+eleEdit+"]").attr('disabled', true);
						$("input[name="+eleEdit+"]").removeAttr("onmousedown").removeClass();
					} 
					// disable true for [SELECT]
					if (getElement(eleEdit).tagName == "SELECT") {
						$("select[name="+eleEdit+"]").attr('disabled', true);
					} 
					// display none for [IMG]
					if (getElement(eleEdit).tagName == "IMG") {
						getElement(eleEdit).style.display = 'none';
					} 
					// remove Help Link
					var fndHelp = $('a[href*='+eleEdit+']');
					$(fndHelp).each(function(key, eleLink) {
						var strLink = "" + eleLink;
						if (strLink.indexOf("GetTablaSeguros") == -1) {
							$(this).remove();
							return false;
						}
					});
				}
				catch (err) {
				}
			}
		});
	}
}

</script>

</head>

<%
	boolean readOnly = false;
	boolean maintenance = false;
	boolean newOnly = false;
	String appType = "";

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

	if (request.getParameter("appType") != null) {
		appType = request.getParameter("appType");
		// LN = Prestamos
		// LR = Prestamos Renovaciones
		// LS = Prestamos Simulacion
		// CP = Credilineas
	}
	
    String main = "";
    if (readOnly) {
        main = "Consulta de Seguros";
    } else if (newOnly) {       
        main = "Nuevo Seguro";
    } else {
        main = "Mantenimiento de Seguros";  
    }
	
    String title = "";
    if (appType.equals("LN")) {
        title = "Prestamos";
    } else if (appType.equals("LR")){
        title = "Renovaciones";
    } else if (appType.equals("LS")){
        title = "Simulacion Prestamos";
    } else if (appType.equals("CP")){
        title = "Cupo Rotativo";
    } else {
        title = "Genericas";
    }

%>

<body onload="FormaPago();MedioPago();">
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">
<%=main%> <%=title%>
<% 
	String emp = (String)session.getAttribute("EMPSG");
	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV0150
%>
<%if ("".equals(emp)){ %> 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="seguros_maintenance.jsp, EPV1180"></h3>
	<hr size="4">
<%}%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="600">
	<input type="hidden" name="editCntrl" id="editCntrl" value="">
	<input type=HIDDEN name="E01PSGBNK"  value="<%=currUser.getE01UBK().trim()%>">
	<input type=HIDDEN name="H01FLGMAS"  value="<%=datarec.getH01FLGMAS().trim()%>">
	<input type="hidden" name="appType" id="appType" value="<%= Util.getReqParameter("appType", request)%>">
	
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
							<eibsinput:help name="datarec" property="E01PSGSCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" size="4" fn_param_one="E01PSGSCD" fn_param_two="E01PSGSNM" fn_param_three="I" onchange="Seguro()" readonly="<%=readOnly%>"/>
							<eibsinput:text property="E01PSGSNM" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true" />
						</td>
						<td width="12%" > 
							<div align="right">Poliza Numero :</div>
						</td>
						<td width="38%" > 
							<eibsinput:text name="datarec" property="E01PSGPLZ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE%>" required="true" readonly="<%=readOnly%>"/>
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
							<input type="text" name="E01PSGPLN" size="4" maxlength="2" value="<%=datarec.getE01PSGPLN().trim()%>" class="TXTRIGHT" onchange="Plan()">
							<a href="javascript:GetTablaSeguros('E01PSGPLN',document.forms[0].E01PSGSCD.value,'E01DSCPLN','E01PSGFAC','E01PSGTBL','E01PSGPBS')" ><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"  ></a>
							<eibsinput:text name="datarec" property="E01DSCPLN"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" size="40" maxlength="40" readonly="true"/>
							<% } %>
						</td>
						<td width="12%" > 
							<div align="right">Fecha Inicio :</div>
						</td>
						<td width="38%" > 
							<eibsinput:date name="datarec" fn_year="E01PSGFIY" fn_month="E01PSGFIM" fn_day="E01PSGFID" required="true" readonly="<%=readOnly%>"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="15%" ><div align="right">Compania :</div></td>
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
							<eibsinput:help name="datarec" property="E01PSGCYS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01PSGCYS" fn_param_two="document.forms[0].E01PSGBNK.value"  required="true" readonly="<%=readOnly%>" />
					
						</td>
						<td width="12%" > 
							<div align="right">Numero de Meses :</div>
						</td>
						<td width="38%" > 
							<eibsinput:text name="datarec" property="E01PSGTRM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" required="true" readonly="<%=readOnly%>" />
							(999 = Vencimiento Credito)
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="12%" > 
							<div align="right">Tabla Factor :</div>
						</td>
						<td width="38%" > 
						<%if(!readOnly){ %>
							<input type="text" name="E01PSGTBL" size="4" maxlength="2" value="<%=datarec.getE01PSGTBL().trim()%>" class="TXTRIGHT">            
							<a id="linkHelp" href="javascript:GetTablaFactores('E01PSGTBL','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
						<% }else{ %>
							<input type="text" name="E01PSGTBL" size="4" maxlength="2" value="<%=datarec.getE01PSGTBL().trim()%>" class="TXTRIGHT" readonly>
						<% } %>
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
			                <option value="S" <% if (datarec.getE01PSGBSE().equals("S")) out.print("selected"); %>>Saldo Insoluto</option>
			                <%if(appType.equals("LR")){%>
			                <option value="R" <% if (datarec.getE01PSGBSE().equals("R")) out.print("selected"); %>>Saldo Reestructurado</option>
			                <%}%>
			                <option value="T" <% if (datarec.getE01PSGBSE().equals("T")) out.print("selected"); %>>Total Deuda</option>
			                <option value="C" <% if (datarec.getE01PSGBSE().equals("C")) out.print("selected"); %>>Valor Cuota</option>
			                <option value="A" <% if (datarec.getE01PSGBSE().equals("A")) out.print("selected"); %>>Valor Area Construida</option>
			               </select>								
			             </td>
						<td width="12%" > 
							<div align="right">Monto Asegurado :</div>
						</td>
						<td width="38%" > 
							<eibsinput:text name="datarec" property="E01PSGMTS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=readOnly%>"/>
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
			                <option value="T" <% if (datarec.getE01PSGFAC().equals("T")) out.print("selected"); %>>% Plazo Total</option>
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
								<eibsinput:text name="datarec" property="E01PSGPGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
					</tr>					
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="12%" > 
							<div align="right">Forma de Pago :</div>
						</td>
						<td width="38%" > 
							<select name="E01PSGCOP" onchange="FormaPago();" <%=readOnly ? "disabled" : ""%>>
								<option value=""></option>
								<%if(!appType.equals("LR")){%>
								<option value="O" <%if (datarec.getE01PSGCOP().equals("O")) { out.print("selected"); }%>>Apertura</option>
								<%}else{%>
								<option value="O" <%if (datarec.getE01PSGCOP().equals("O")) { out.print("selected"); }%>>Renovacion</option>
								<%}%>
								<option value="L" <%if (datarec.getE01PSGCOP().equals("L")) { out.print("selected"); }%>>Con las Cuotas</option>
								<option value="E" <%if (datarec.getE01PSGCOP().equals("E")) { out.print("selected"); }%>>Endosado</option>
								<option value="P" <%if (datarec.getE01PSGCOP().equals("P")) { out.print("selected"); }%>>Apertura Periodica</option>
								<option value="D" <%if (datarec.getE01PSGCOP().equals("D")) { out.print("selected"); }%>>Apertura Diferida</option>
							</select>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
						</td>
						<td width="12%" > 
							<div align="right">Renovacion Automatica :</div>
						</td>
						<td width="38%" > 
		                  <input type="hidden" name="E01PSGPRA" value="<%= datarec.getE01PSGPRA()%>">
		                  <input type="radio" name="CE01PSGPRA" value="Y"  <%=readOnly ? "disabled" : ""%> onClick="document.forms[0].E01PSGPRA.value = 'Y'"
					        <%if(datarec.getE01PSGPRA().equals("Y")) out.print("checked");%>>S&iacute; 
		                  <input type="radio" name="CE01PSGPRA" value="N" <%=readOnly ? "disabled" : ""%> onClick="document.forms[0].E01PSGPRA.value = 'N'"
					        <%if(!datarec.getE01PSGPRA().equals("Y")) out.print("checked");%>>No 
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="12%" > 
							<div align="right">Periodo Base :</div>
						</td>
						<td width="38%" > 
							<select name="E01PSGPBS" <%=readOnly ? "disabled" : ""%>>
								<option value=""  <%if (!datarec.getE01PSGPBS().equals("1") && !datarec.getE01PSGPBS().equals("2")) { out.print("selected"); }%>>Prestamo</option>
								<option value="1" <%if (datarec.getE01PSGPBS().equals("1")) { out.print("selected"); }%>>360</option>
								<option value="2" <%if (datarec.getE01PSGPBS().equals("2")) { out.print("selected"); }%>>365</option>
							</select>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
						</td>
						<td width="12%" > 
							<div align="right"></div>
						</td>
						<td width="38%" > 
		                  
						</td>
					</tr>
					<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" id="medioRow" style="display: none;"> 
						<td width="12%" id="medio1" >  
							<div align="right">Medio de Pago :</div>
						</td>
						<td width="38%" id="medio2" > 
							<select name="E01PSGMPG" id="E01PSGMPG" onchange="MedioPago();" <%=readOnly ? "disabled" : ""%>>
								<option value=""></option>
								<%if (appType.equals("LN") || appType.equals("LS")) {%>
								<option value="D" <%if (datarec.getE01PSGMPG().equals("D")) { out.print("selected"); }%>>Con Desembolso</option>
								<%}%>
								<option value="A" <%if (datarec.getE01PSGMPG().equals("A")) { out.print("selected"); }%>>Cuenta de Pago</option>
								<!--  
								<option value="G" <%if (datarec.getE01PSGMPG().equals("G")) { out.print("selected"); }%>>Cuenta Contable</option>
								-->
								<option value="N" <%if (datarec.getE01PSGMPG().equals("N")) { out.print("selected"); }%>>Nuevo Credito</option>
							</select>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
						</td>
						<td width="12%" id="blanco1" style="display: none;"> 
						</td>
						<td width="38%" id="blanco2" style="display: none;"> 
						</td>
						<td width="12%" id="titleCredito" style="display: none;">
							<div align="right">Numero Prestamo :</div>
						</td>
						<td width="12%" id="AperturaCredito" style="display: none;"> 
							<eibsinput:help property="E01PSGRAC" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" fn_param_one="E01PSGRAC" fn_param_two="document.forms[0].E01PSGBNK.value" fn_param_three="10" fn_param_five="document.forms[0].E01PSGCUN.value" readonly="<%=readOnly %>" />
						</td>
						<td width="12%" id="ctaPgo1" style="display: none;"> 
							<div align="right">Numero Cuenta :</div>
						</td>
						<td width="38%" id="ctaPgo2" style="display: none;"> 
							<eibsinput:help property="E01PSGMAC" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" fn_param_one="E01PSGMAC" fn_param_two="document.forms[0].E01PSGBNK.value" fn_param_three="RT" fn_param_five="${datarec.E01PSGCUN}" readonly="<%=readOnly %>" />
						</td>
						<td width="12%" id="ctaCnt1" style="display: none;"><div align="right">Cuenta Contable :</div></td>
						<td width="38%" id="ctaCnt2" style="display: none;" nowrap="nowrap"> 
							<eibsinput:text name="datarec" property="E01PSGOBK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="<%=readOnly %>" />
							<eibsinput:help name="datarec" property="E01PSGOBR" fn_param_one="E01PSGOBR" fn_param_two="document.forms[0].E01PSGOBK.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>"  readonly="<%=readOnly %>" />
							<eibsinput:help name="datarec" property="E01PSGOCY" fn_param_one="E01PSGOCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="<%=readOnly %>" />
							<eibsinput:help name="datarec" property="E01PSGOGL" fn_param_one="E01PSGOGL" fn_param_two="document.forms[0].E01PSGOBK.value" fn_param_three="document.forms[0].E01PSGOCY.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="<%=readOnly %>" />
						</td>
					</tr>
					<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" id="ctaCntR" style="display: none;"> 
						<td width="12%"></td>
						<td width="38%"></td>
						<td width="12%" ><div align="right">Referencia :</div></td>
						<td width="38%" nowrap="nowrap"> 
							<eibsinput:text name="datarec" property="E01PSGOAC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="<%=readOnly%>"/>
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
					<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="10%"> </td>
						<td width="5%" > <div align="center">Nro</div> </td>
						<td width="15%"> <div align="center">Rut</div> </td>
						<td width="30%"> <div align="center">Nombre</div> </td>
						<td width="10%"> <div align="center">Telefono</div> </td>
						<td width="10%"> <div align="Center">Relacion</div> </td>
						<td width="5%" > <div align="center">%</div> </td>
						<td width="10%"> </td>
					</tr>
					<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="10%"> </td>
						<td width="5%" > <div align="center">1</div> </td>
						<td width="15%" > 
							<eibsinput:text name="datarec" property="E01PSGRT1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="30%" > 
							<eibsinput:text name="datarec" property="E01PSGNM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > 
							<eibsinput:text name="datarec" property="E01PSGPH1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > 
							<select name="E01PSGRL1" <%=readOnly ? "disabled" : ""%>>
								<option value=" " <%if (!(datarec.getE01PSGRL1().equals("1") 
								                       || datarec.getE01PSGRL1().equals("2") 
								                       || datarec.getE01PSGRL1().equals("3") 
								                       || datarec.getE01PSGRL1().equals("4") 
								                       || datarec.getE01PSGRL1().equals("5") 
								                       || datarec.getE01PSGRL1().equals("9")))
								                       out.print("selected");%>></option>
								<option value="1" <%if (datarec.getE01PSGRL1().equals("1")) out.print("selected");%>>Esposo(a)</option>
								<option value="2" <%if (datarec.getE01PSGRL1().equals("2")) out.print("selected");%>>Hijo</option>
								<option value="3" <%if (datarec.getE01PSGRL1().equals("3")) out.print("selected");%>>Padre</option>
								<option value="4" <%if (datarec.getE01PSGRL1().equals("4")) out.print("selected");%>>Madre</option>
								<option value="5" <%if (datarec.getE01PSGRL1().equals("5")) out.print("selected");%>>Hermano(a)</option>
								<option value="9" <%if (datarec.getE01PSGRL1().equals("9")) out.print("selected");%>>Otro</option>
							</select>
						</td>
						<td width="5%" > 
							<eibsinput:text name="datarec" property="E01PSGPR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%"> </td>
					</tr>
					<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="10%"> </td>
						<td width="5%" > <div align="center">2</div> </td>
						<td width="15%"> 
							<eibsinput:text name="datarec" property="E01PSGRT2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="30%" > 
							<eibsinput:text name="datarec" property="E01PSGNM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > 
							<eibsinput:text name="datarec" property="E01PSGPH2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > 
							<select name="E01PSGRL2" <%=readOnly ? "disabled" : ""%>>
								<option value=" " <%if (!(datarec.getE01PSGRL2().equals("1")
								                       || datarec.getE01PSGRL2().equals("2")
								                       || datarec.getE01PSGRL2().equals("3")
								                       || datarec.getE01PSGRL2().equals("4")
								                       || datarec.getE01PSGRL2().equals("5")
								                       || datarec.getE01PSGRL2().equals("9")))
								                       out.print("selected");%>></option>
								<option value="1" <%if (datarec.getE01PSGRL2().equals("1")) out.print("selected");%>>Esposo(a)</option>
								<option value="2" <%if (datarec.getE01PSGRL2().equals("2")) out.print("selected");%>>Hijo</option>
								<option value="3" <%if (datarec.getE01PSGRL2().equals("3")) out.print("selected");%>>Padre</option>
								<option value="4" <%if (datarec.getE01PSGRL2().equals("4")) out.print("selected");%>>Madre</option>
								<option value="5" <%if (datarec.getE01PSGRL2().equals("5")) out.print("selected");%>>Hermano(a)</option>
								<option value="9" <%if (datarec.getE01PSGRL2().equals("9")) out.print("selected");%>>Otro</option>
							</select>
						</td>
						<td width="5%" > 
							<eibsinput:text name="datarec" property="E01PSGPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%"> </td>
					</tr>
					<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="10%" > 
						</td>
						<td width="5%" > 
							<div align="center">3</div>
						</td>
						<td width="15%" > 
							<eibsinput:text name="datarec" property="E01PSGRT3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="30%" > 
							<eibsinput:text name="datarec" property="E01PSGNM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > 
							<eibsinput:text name="datarec" property="E01PSGPH3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > 
							<select name="E01PSGRL3" <%=readOnly ? "disabled" : ""%>>
								<option value=" " <%if (!(datarec.getE01PSGRL3().equals("1")
								                       || datarec.getE01PSGRL3().equals("2")
								                       || datarec.getE01PSGRL3().equals("3")
								                       || datarec.getE01PSGRL3().equals("4")
								                       || datarec.getE01PSGRL3().equals("5")
								                       || datarec.getE01PSGRL3().equals("9")))
								                       out.print("selected");%>></option>
								<option value="1" <%if (datarec.getE01PSGRL3().equals("1")) out.print("selected");%>>Esposo(a)</option>
								<option value="2" <%if (datarec.getE01PSGRL3().equals("2")) out.print("selected");%>>Hijo</option>
								<option value="3" <%if (datarec.getE01PSGRL3().equals("3")) out.print("selected");%>>Padre</option>
								<option value="4" <%if (datarec.getE01PSGRL3().equals("4")) out.print("selected");%>>Madre</option>
								<option value="5" <%if (datarec.getE01PSGRL3().equals("5")) out.print("selected");%>>Hermano(a)</option>
								<option value="9" <%if (datarec.getE01PSGRL3().equals("9")) out.print("selected");%>>Otro</option>
							</select>
						</td>
						<td width="5%" > 
							<eibsinput:text name="datarec" property="E01PSGPR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%"> </td>
					</tr>
					<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="10%"> </td>
						<td width="5%" > <div align="center">4</div> </td>
						<td width="15%" > 
							<eibsinput:text name="datarec" property="E01PSGRT4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="30%" > 
							<eibsinput:text name="datarec" property="E01PSGNM4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > 
							<eibsinput:text name="datarec" property="E01PSGPH4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > 
							<select name="E01PSGRL4" <%=readOnly ? "disabled" : ""%>>
								<option value=" " <%if (!(datarec.getE01PSGRL4().equals("1")
								                       || datarec.getE01PSGRL4().equals("2")
								                       || datarec.getE01PSGRL4().equals("3")
								                       || datarec.getE01PSGRL4().equals("4")
								                       || datarec.getE01PSGRL4().equals("5")
								                       || datarec.getE01PSGRL4().equals("9")))
								                       out.print("selected");%>></option>
								<option value="1" <%if (datarec.getE01PSGRL4().equals("1")) out.print("selected");%>>Esposo(a)</option>                   
								<option value="2" <%if (datarec.getE01PSGRL4().equals("2")) out.print("selected");%>>Hijo</option>
								<option value="3" <%if (datarec.getE01PSGRL4().equals("3")) out.print("selected");%>>Padre</option>
								<option value="4" <%if (datarec.getE01PSGRL4().equals("4")) out.print("selected");%>>Madre</option>
								<option value="5" <%if (datarec.getE01PSGRL4().equals("5")) out.print("selected");%>>Hermano(a)</option>
								<option value="9" <%if (datarec.getE01PSGRL4().equals("9")) out.print("selected");%>>Otro</option>
							</select>
						</td>
						<td width="5%" > 
							<eibsinput:text name="datarec" property="E01PSGPR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%"> </td>
					</tr>
					<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td width="10%"> </td>
						<td width="5%" > <div align="center">5</div> </td>
						<td width="15%" > 
							<eibsinput:text name="datarec" property="E01PSGRT5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="30%" > 
							<eibsinput:text name="datarec" property="E01PSGNM5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > 
							<eibsinput:text name="datarec" property="E01PSGPH5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > 
							<select name="E01PSGRL5" <%=readOnly ? "disabled" : ""%>>
								<option value=" " <%if (!(datarec.getE01PSGRL5().equals("1")
								                       || datarec.getE01PSGRL5().equals("2")
								                       || datarec.getE01PSGRL5().equals("3")
								                       || datarec.getE01PSGRL5().equals("4")
								                       || datarec.getE01PSGRL5().equals("5")
								                       || datarec.getE01PSGRL5().equals("9")))
								                       out.print("selected");%>></option>
								<option value="1" <%if (datarec.getE01PSGRL5().equals("1")) out.print("selected");%>>Esposo(a)</option>                   
								<option value="2" <%if (datarec.getE01PSGRL5().equals("2")) out.print("selected");%>>Hijo</option>
								<option value="3" <%if (datarec.getE01PSGRL5().equals("3")) out.print("selected");%>>Padre</option>
								<option value="4" <%if (datarec.getE01PSGRL5().equals("4")) out.print("selected");%>>Madre</option>
								<option value="5" <%if (datarec.getE01PSGRL5().equals("5")) out.print("selected");%>>Hermano(a)</option>
								<option value="9" <%if (datarec.getE01PSGRL5().equals("9")) out.print("selected");%>>Otro</option>
							</select>
						</td>
						<td width="5%" > 
							<eibsinput:text name="datarec" property="E01PSGPR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > </td>
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
						<td width="10%"> </td>
						<td width="20%"> <div align="right">Garantia Asociada :</div> </td>
						<td width="40%"> 
							<eibsinput:help property="E01PSGGAC" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" fn_param_one="E01PSGGAC" fn_param_two="document.forms[0].E01PSGBNK.value" fn_param_three="91" fn_param_five="document.forms[0].E01PSGCUN.value" readonly="<%=readOnly %>" />
						</td>
						<td width="10%"> </td>
					</tr>
					<tr id="trdark"> 
						<td width="10%"> </td>
						<td width="20%"> <div align="right">Descripcion :</div> </td>
						<td width="40%"> 
						<% if (readOnly) { %>
							<textarea name="E01PSGRMK" cols="50" rows="5" readonly ><%=datarec.getE01PSGRMK()%> </textarea>
						<% } else { %>
							<textarea name="E01PSGRMK" cols="50" rows="5" ><%=datarec.getE01PSGRMK()%> </textarea>
						<% } %>  
						</td>
						<td width="10%"> </td>
					</tr>
					<tr id="trdark"> 
						<td width="10%"> </td>
						<td width="20%"> <div align="right">Dirección :</div> </td>
						<td width="40%"> 
							<eibsinput:text name="datarec" property="E01PSGMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%"> </td>
					</tr>
					<tr id="trdark"> 
						<td width="10%"> </td>
						<td width="20%"> <div align="right"> </div> </td>
						<td width="40%"> 
							<eibsinput:text name="datarec" property="E01PSGMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%"> </td>
					</tr>
					<tr id="trdark"> 
						<td width="10%" > </td>
						<td width="20%"> <div align="right"> </div> </td>
						<td width="40%"> 
							<eibsinput:text name="datarec" property="E01PSGMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%"> </td>
					</tr>
					<tr id="trdark"> 
						<td width="10%"> </td>
						<td width="20%"> <div align="right"> </div> </td>
						<td width="40%"> 
							<eibsinput:text name="datarec" property="E01PSGMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="<%=readOnly %>"/>
						</td>
						<td width="10%" > </td>
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
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&appType=<%=appType%>&E01PSGCUN=<%=userPO.getCusNum()%>&E01PSGNUM=<%=userPO.getPorfNum()%>&newCuota=<%=request.getAttribute("newCuota")%>';	   	   
	cerrarVentana();	  
</script>
<% } %>  

<script type="text/javascript">
showFactorLabel(getElement("E01PSGFAC").value,true);

function showFactorLabel(payvalue,firstTime){
	if (payvalue === "P" || payvalue === "T" || payvalue === "1"){
		getElement("divFactorLabel").innerHTML= 'Monto Prima % :';
		getElement("FIJO").style.display= 'table-cell';
		if (firstTime != true) getElement("E01PSGMTP").value = "0.000000" ;
	} else {
		getElement("divFactorLabel").innerHTML= 'Monto Prima Fijo :';
		getElement("FIJO").style.display= 'table-cell';
		if (firstTime != true) getElement("E01PSGMTP").value = "0.000000" ;
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

function Plan(){
	showFactorLabel(getElement("E01PSGFAC").value);
}

function Seguro(){
	getElement("E01PSGCCD").value = "";
	getElement("E01PSGCNM").value = "";
}

$('#E01PSGFVY, #E01PSGFVM, #E01PSGFVD').change(function(){
	$('E01PSGNPM').val('');
});

<%if(readOnly){%>
	$('#E01PSGMAC').addClass('context-menu-inq').attr('onmousedown', "init(inqAccount, this.value)");
	$('head').append('<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css">');
<% } %>	

</script>

<script type="text/javascript">
$( document ).ready(function() {
	editControl('<%=userPO.getHeader4()%>');
});
</script>
   
</body>
</HTML>
