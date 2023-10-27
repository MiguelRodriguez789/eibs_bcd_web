<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<html>
<head>
<title>Transferencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="prMant" class="datapro.eibs.beans.EPR010001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser"      class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<%!
boolean isOptionFSeq(String value, String selected) {
	return (value.startsWith("/"+selected) || value.startsWith(selected+"/"));
}
boolean isNotOptionFSeq(String value) {
	return  !( isOptionFSeq(value, "1") || isOptionFSeq(value, "2") || isOptionFSeq(value, "3") || isOptionFSeq(value, "4") 
			|| isOptionFSeq(value, "5") || isOptionFSeq(value, "6") || isOptionFSeq(value, "7") || isOptionFSeq(value, "8") );
}
boolean isOptionFAccount(String value) {
	return  !( isOptionFSeq(value, "ARNU") || isOptionFSeq(value, "CCPT") || isOptionFSeq(value, "CUST") || isOptionFSeq(value, "DRLC")
			|| isOptionFSeq(value, "EMPL") || isOptionFSeq(value, "NIDN") || isOptionFSeq(value, "SOSE") || isOptionFSeq(value, "TXID") );
}
%>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/wireTransfers.js"></script>

<script type="text/javascript">

function enviar(obj){
	obj.disabled = true;
	document.forms[0].submit();
}

function SetTransferType(value){
  	  var pVia = getElement('paymentVia').value;
	  getElement("TRANSFTYPE").value = "Y*";
  	  if (value=="IT") {
  	  	if(pVia == '' || !(pVia == 'R' || pVia == 'G' || pVia == '6')){
  	  		getElement("paymentVia").value = 'R';
  	  	}
  	  } else {
  	  	if(pVia == '' || (pVia == 'R' || pVia == 'G' || pVia == '6')){
  	  		getElement('paymentVia').value = '3';
  	  	}
  	  	if (value=="OW") {
  	  		getElement("TRANSFTYPE").value= "Y!";
  	  	}
  	  }
	  SetVia(value, getElement("paymentVia").value);
}

function setOrderingAccount(){
  	var option = getElement('E01PRIORO').value;
	if(getElement('E01PRITTP').value != 'IW'){
  		getElement('E01PRIDAC').value = getElement('accountOriginator').value;
	}
	setAccountField(getElement('E11PRIORC'), '50', option);
}

function setBeneficiaryAccount(){
  	var option = getElement('E01PRIBCO').value;
	if(getElement('E01PRITTP').value != 'OW'){
  		getElement('E01PRICAC').value = getElement('accountBeneficiary').value;
	} else {
  		getElement('E01PRIBAC').value = getElement('accountBeneficiary').value;
	}
	setAccountField(getElement('E11PRIBCU'), '59', option);
}

function setCustomer(e){
  	getElement('E01PRIOCU').value = '';
  	getElement('E01PRICCU').value = '';
  	var type = getElement('E01PRITTP').value;
  	if(type == 'IW'){
  		getElement('E01PRICCU').value = getElement('customerNumber').value;
  		getElement('E21PRIBCU').value = getElement('customerName').value;
  	}  else {
  		getElement('E01PRIOCU').value = getElement('customerNumber').value;
  		getElement('E21PRIORC').value = getElement('customerName').value;
  	} 
}

function showInqOFAC(fieldValue){
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
}
  
  <%
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("       showErrors();");
 	}
 	
	boolean isNew = userPO.getPurpose().equals("NEW");
 
	if (!isNew) {
  %> 
    builtNewMenu(pr_m_opt);
	initMenu();
  <% } %> 

</SCRIPT>
</head>

  <%
  	String lectura =" ";
  	String disabled=" "; 
  	boolean mostrar=true;
	int row = 1;
	
	// Determina campos de solo lectura incoming Swift and FED
	if (prMant.getE01PRITTP().equals("IW")) {
		if (prMant.getE01PRIUSC().equals("SAI") 
			|| prMant.getE01PRIUSC().equals("FAI")){
    		lectura = " readonly";
    		disabled = "disabled";
    		mostrar = false;
		}
	} else if (prMant.getE01PRITTP().equals("OW")){
		if(prMant.getE01PRISOR().equals("I")) {
	 		lectura = " readonly";
     		disabled = "disabled";
     		mostrar = false;
     	}
	}
	
   	String transftype = "";
   	if (prMant.getE01PRITCY().equals(currUser.getE01BCU())) {
   		transftype = "58";
   	} else {
   		transftype = "YL";
   	}
 %>

<body>
<h3 align="center">Transacci&oacute;n Financiera<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_maint.jsp,EPR0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000">
 
    <input type=HIDDEN name="SCREEN" value="2">
    <input type=HIDDEN name="TRANSFTYPE" value="<%=transftype%>">
    <input type=HIDDEN name="E01PRIORO" id="origOption" value="<%= prMant.getE01PRIORO().trim() %>">
    <input type=HIDDEN name="E01PRIBCO" id="beneOption" value="<%= prMant.getE01PRIBCO().trim() %>">
    <input type=HIDDEN name="E01REQCON" value="2">
    
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead" id="tableHeader1">
          <tr id="tableHeaderRow1" class="trdark" style="display:block"> 
            <td nowrap width="100"> 
                  <div align="right">Tipo :</div>
            </td>
              <td nowrap width="280" align="left">
                <%
                	if (!(prMant.getE01PRITTP().equals("IT"))
                			&& !(prMant.getE01PRITTP().equals("IW"))
                			&& !(prMant.getE01PRITTP().equals("OW"))) {
                		prMant.setE01PRITTP("OW");
                	}
                %>               
                <select id="tranferType" name="E01PRITTP" <%=disabled%> onchange="javascript:SetTransferType(this.value)">
                  <option value=" "> </option>
                  <option value="IT" <%if (prMant.getE01PRITTP().equals("IT")) { out.print("selected"); }%> >Transferencia Interna</option>
                  <option value="IW" <%if (prMant.getE01PRITTP().equals("IW")) { out.print("selected"); }%> >Transferencia Externa Recibida </option>
                  <option value="OW" <%if (prMant.getE01PRITTP().equals("OW")) { out.print("selected"); }%> >Transferencia Externa Enviada </option>
                </select>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              </td>
            	<td nowrap width="140" align="right">No. de Referencia :
                </td>
                <td nowrap width="120" align="left">
                  <input readonly type="text" id="E01PRINUM" name="E01PRINUM" size="14" maxlength="11" value="<%=prMant.getE01PRINUM().trim()%>">
				  <% if (prMant.getH01FLGMAS().equals("Y")){%>
				  <a href="javascript:showInqOFAC('<%= prMant.getE01PRINUM().trim()%>')">
				  <img src="<%=request.getContextPath()%>/images/warning_16.jpg" title="Lista de OFAC" align="middle" border="0"></a>
				  <% } %>
                </td>
 		<%
  			if (isNew) {
  		%>
            <td nowrap width="180" align="right"> 
              <input type="checkbox" id="H01FLGWK3" name="H01FLGWK3" <%if (prMant.getH01FLGWK3().equals("1"))
					out.print("checked");%>
			  onClick="getElement('H01FLGWK3').value='1'">
              Copiar de : 
            </td>
            <td nowrap >
              <input type="text" id="E01CPYNUM" name="E01CPYNUM" size="14" maxlength="11" onKeyPress="enterInteger(event)"
			  value="<%=prMant.getE01CPYNUM().trim()%>">
              <a href="javascript:GetCloneTransfer('E01CPYNUM')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0" ></a>
            </td>
		<%
            	} else {
		%>      
            <td nowrap colspan="3"> 
            </td>
		<%
            	}
		%>                 
          </tr>
		</table>
		<table width="100%" border="0" class="tbhead" id="externalType" style="display:<%=!prMant.getE01PRITTP().equals("IT") ? "block" : "none"%>">
          <tr id="tableHeaderRow2" class="trdark" >
              <td nowrap width="100"> 
                <div align="right">V&iacute;a de Pago :</div>
              </td>
              <td nowrap width="280"> 
                <select id="paymentVia" name="E01PRIPVI" <%=disabled%> onchange="SetVia(getElement('tranferType').value, this.value)">
                  	<option value="" <% if (prMant.getE01PRIPVI().equals("")) out.print("selected"); %>></option>
                	<option value="M" <% if (prMant.getE01PRIPVI().equals("M")) out.print("selected"); %>>Swift MT-102</option>
                  	<option value="3" <%if (prMant.getE01PRIPVI().equals("3") 
						|| (isNew && prMant.getE01PRITTP().equals("OW") && prMant.getE01PRIPVI().equals(""))) 
							out.print("selected");%>>Swift MT-103</option>
                  	<option value="4" <% if (prMant.getE01PRIPVI().equals("4")) out.print("selected"); %>>Swift MT-200</option>
                  	<option value="5" <% if (prMant.getE01PRIPVI().equals("5")) out.print("selected"); %>>Swift MT-202</option>
					<option value="7" <% if (prMant.getE01PRIPVI().equals("7")) out.print("selected"); %>>Swift MT-202 COV</option>
 				</select>
              </td>
			<%
			if (false) {
			%>
            <TD nowrap width="140"> 
                  <DIV align="right">Código :</DIV>
            </TD>
            <TD nowrap width="120" align="left">
                  <INPUT <%=lectura%> type="text" id="E01PRITCD" name="E01PRITCD" size="11" maxlength="10" value="<%=prMant.getE01PRITCD().trim()%>">
           		<%
              	if (mostrar) {
         		%>
	              <A href="javascript:GetCodeTransaction('E01PRITCD','','')">
	              <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></A>                   
            	<%
              	}
         		%>
            </TD>
		<%
            } else {
		%>      
            <td nowrap colspan="3"> 
            </td>
		<%
			}
			if (false) {
			%>
             <td nowrap width="180" align="right">Canal : 
             </td>
              <td nowrap align="left">
                  <input <%=lectura%> type="text" id="E01PRICNL" name="E01PRICNL" size="2" maxlength="1" value="<%=prMant.getE01PRICNL().trim()%>" >
                  <a href="javascript:GetCodeTChannel('E01PRICNL','','')">
                  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0" ></a>
                </td>   
		<%
            } else {
		%>      
            <td nowrap colspan="3"> 
            </td>
		<%
            	}
		%>
		  </tr>
        </table>
      </td>
    </tr>
   </table>
<BR>
  <div id="mainParties"> 
    <table class="tableinfo">
    <tr > 
      <td nowrap height="132"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
      	<tr id="trdark"> 
            <td nowrap colspan="2" align="center"> 
                <b>Ordenante </b>
					<SELECT id="SWF_50" name="SWF_50" class="swf_field_50" <%= disabled %> onchange="setHelp(this)" style="display:<%=!prMant.getE01PRIPVI().equals("5") ? "inline" : "none"%>">
						<OPTION value="K" <% if (!(prMant.getE01PRIORO().equals("A") ||prMant.getE01PRIORO().equals("F") || prMant.getE01PRIORO().equals("K"))) out.print("selected"); %>>K</OPTION>
						<OPTION value="A" <% if(prMant.getE01PRIORO().equals("A")) out.print("selected");%>>A</OPTION>
						<OPTION value="F" <% if(prMant.getE01PRIORO().equals("F")) out.print("selected");%>>F</OPTION>
					</SELECT>
            </td>
            <td nowrap> 
                <div align="center"><b>Número de Cliente</b></div>
            </td>
            <td nowrap colspan="2" align="center">  
                <span id="LBL_58" style="font-weight: bold; display:<%=prMant.getE01PRIPVI().equals("7") ? "inline" : "none"%>">Banco Beneficiario</span>
             		<select id="SWF_58" name="SWF_58" class="swf_field_58" <%=disabled%> onchange="setHelp(this)" style="display:<%=(prMant.getE01PRIPVI().equals("5") || prMant.getE01PRIPVI().equals("7")) ? "inline" : "none"%>">
                    	<option value="D" <% if (!(prMant.getE01PRIBCO().equals("A") || prMant.getE01PRIBCO().equals("D") || prMant.getE01PRIBCO().equals("F"))) out.print("selected"); %>>D</option>
                        <option value="A" <% if(prMant.getE01PRIBCO().equals("A")) out.print("selected");%>>A</option>
					</select>
                <span id="LBL_59" style="font-weight: bold; display:<%=!prMant.getE01PRIPVI().equals("7") ? "inline" : "none"%>">Beneficiario</span>
             		<select id="SWF_59" name="SWF_59" class="swf_field_59" <%=disabled%> onchange="setHelp(this)" style="display:<%=!prMant.getE01PRIPVI().equals("5") ? "inline" : "none"%>">
                    	<option value="" <% if (!(prMant.getE01PRIBCO().equals("A") || prMant.getE01PRIBCO().equals("F"))) out.print("selected"); %>></option>
                        <option value="A" <% if(prMant.getE01PRIBCO().equals("A")) out.print("selected");%>>A</option>
					</select>
            </td>
		</tr>
		<tr id="trclear">
			<% 
			int cpos1 = prMant.getE11PRIORC().indexOf('/');
			int cpos2 = 0;
			if(cpos1 != -1){
				cpos2 = prMant.getE11PRIORC().indexOf('/', cpos1+1) + 1;
			} 
			%>
			<td nowrap width="10%" align="right"> 
				<span id="LBL_50A_1" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">Cuenta :</span>
				<span id="LBL_50K_1" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Cuenta :</span>
				<span id="LBL_50F_1" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
	          		<select name="SWF_50F_1_1" id="SWF_50F_1_1" class="swf_field_50" <%=disabled%> dir="rtl" onchange="setOrderingAccount()"
	             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
	                	<option value="" <% if(isOptionFAccount(prMant.getE11PRIORC())) out.print("selected"); %>>Cuenta</option>
						<option value="ARNU" <% if(isOptionFSeq(prMant.getE11PRIORC(), "ARNU")) out.print("selected");%>>Número de Extranjero</option>
						<option value="CCPT" <% if(isOptionFSeq(prMant.getE11PRIORC(), "CCPT")) out.print("selected");%>>Pasaporte</option>
						<option value="CUST" <% if(isOptionFSeq(prMant.getE11PRIORC(), "CUST")) out.print("selected");%>>Id de Cliente</option>
						<option value="DRLC" <% if(isOptionFSeq(prMant.getE11PRIORC(), "DRLC")) out.print("selected");%>>Licencia de Conducir</option>
						<option value="EMPL" <% if(isOptionFSeq(prMant.getE11PRIORC(), "EMPL")) out.print("selected");%>>Número de Empleado</option>
						<option value="NIDN" <% if(isOptionFSeq(prMant.getE11PRIORC(), "NIDN")) out.print("selected");%>>Id Nacional</option>
						<option value="SOSE" <% if(isOptionFSeq(prMant.getE11PRIORC(), "SOSE")) out.print("selected");%>>No. Seguridad Social</option>
						<option value="TXID" <% if(isOptionFSeq(prMant.getE11PRIORC(), "TXID")) out.print("selected");%>>Id para Impuestos</option>
					</select> :
				</span>
			</td>
			<td nowrap width="35%">
				<input type="hidden" id="E11PRIORC" name="E11PRIORC" value="<%= prMant.getE11PRIORC() %>">
				<span id="SWB_50F" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
                <input <%=lectura%> type="text" id="SWF_50F_1_2" name="SWF_50F_1_2" size="6" maxlength="5" 
                	value="<%= cpos1 > -1 && cpos2 > cpos1 ? prMant.getE11PRIORC().substring(cpos1+1, cpos2-1) :  "" %>"  
					onchange="setOrderingAccount();">
				<% if (mostrar) {  %>
 				<span id="SWH_50F_1_2" class="swf_field_50">
              	<a href="javascript:GetCodeCNOFC('SWF_50F_1_2','03')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de Moneda" align="top" border="0"></a>
              	</span>
              	<% } %>
              	</span>
                <input <%=lectura%> type="text" id="SWF_50_1" name="accountOriginator" class="swf_field_50" 
                	size="<%=prMant.getE01PRIORO().equals("F") ? "30" : "35"%>" 
                	maxlength="<%=prMant.getE01PRIORO().equals("F") ? "27" : "35"%>" 
                	value="<%= prMant.getE11PRIORC().substring(cpos2) %>" 
					onchange="setOrderingAccount();">
                <% if(mostrar){ %>
                <span id="SWH_50_1" class="swf_field_50">
				<a href="javascript:GetAccByClient('accountOriginator','','RT','',getElement('E01PRIOCU').value,'SWF_50K_2_1')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de Cuenta" align="bottom" border="0" ></a>
                </span>
                <% } %>
			</td>
            <td nowrap width="10%"> 
              <div align="left">
				<input type="text" id="customerNumber" name="customerNumber" onchange="setCustomer(event)" 
					size="12" maxlength="10" value="<%= prMant.getE01PRITTP().equals("IW") ? prMant.getE01PRICCU() : prMant.getE01PRIOCU() %>" <%= lectura %>>
              	<input type="hidden" id="customerName" name="customerName" onchange="setCustomer(event)">
                <input type="hidden" id="E01PRIOCU" name="E01PRIOCU" value="<%= prMant.getE01PRIOCU().trim()%>">
                <input type="hidden" id="E01PRICCU" name="E01PRICCU" value="<%= prMant.getE01PRICCU().trim()%>">
				<% if(mostrar){ %>
				<a href="javascript:GetCustomerDescId('customerNumber','customerName','')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de Cliente" border="0"></a>
				<% } %>
              </div>
            </td>
			<td nowrap width="10%"> 
                <div align="right">Cuenta :</div>
			</td>
			<td nowrap width="35%"> 
				<input type="hidden" id="E01PRIBAC" name="E01PRIBAC" value="<%= prMant.getE01PRIBAC() %>">
				<input type="hidden" id="E11PRIBCU" name="E11PRIBCU" value="<%= prMant.getE11PRIBCU() %>">
                <input <%=lectura%> type="text" id="SWF_59_1" name="accountBeneficiary" class="swf_field_59" size="45" maxlength="35" 
                	value="<%= prMant.getE11PRIBCU() %>" onchange="setBeneficiaryAccount();"
                	style="display:<%=!prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">
				<% if (mostrar) {  %>
                <span id="SWH_59_1_1" class="swf_field_59" style="display: <%=prMant.getE01PRITTP().equals("OW") ? "none" : "inline"%>">
				<a href="javascript:GetAccount('accountBeneficiary','','RT','','E01PRIOCU','E21PRIBCU')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de Cuentas" align="bottom" border="0" ></a>
                </span>
				<% } %>
				<img id="beneAccountCheck" src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
			</td>
            </tr>  
      	<tr id="trclear"> 
            <td nowrap> 
                <div align="right">
                	<span id="LBL_50K_2" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Nombre :</span>
					<span id="LBL_50A_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">BIC/BEI :</span>
					<span id="LBL_50F_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
               		<select name="SWF_50F_2_1" id="SWF_50F_2_1" class="swf_field_50" <%=disabled%> dir="rtl" onchange="setField(getElement('E21PRIORC'), 'SWF_50', 'F', 2)"
             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank; display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
                    	<option value="1" <% if(isNotOptionFSeq(prMant.getE21PRIORC())) out.print("selected"); %>>Nombre</option>
						<option value="2" <% if(isOptionFSeq(prMant.getE21PRIORC(), "2")) out.print("selected");%>>Direcci&oacute;n</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE21PRIORC(), "3")) out.print("selected");%>>País y Localidad</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE21PRIORC(), "4")) out.print("selected");%>>Fecha de Nacimiento</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE21PRIORC(), "5")) out.print("selected");%>>Lugar de Nacimiento</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE21PRIORC(), "6")) out.print("selected");%>>Id del Cliente</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE21PRIORC(), "7")) out.print("selected");%>>Id Nacional </option>
						<option value="8" <% if(isOptionFSeq(prMant.getE21PRIORC(), "8")) out.print("selected");%>>Info Adicional</option>
					</select> :
					</span>
                </div>
            </td>
            <td nowrap colspan="2"> 
              <div align="left">
              	<input type="hidden" <%=lectura%> name="E21PRIORC" size="45" maxlength="35" value="<%= prMant.getE21PRIORC().trim()%>">
				<% if (mostrar) {  %>
                <span id="SWH_50A_2_1" class="swf_field_50" style="display: <%=prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">
				<input type="text" <%=lectura%> id="SWF_50A_2_1" name="SWF_50A_2_1" class="swf_field_50" onchange="setField(getElement('E21PRIORC'), 'SWF_50', 'A', 2)" 
					size="45" maxlength="35" value="<%= prMant.getE21PRIORC() %>">
				<a href="javascript:GetSwiftAll('SWF_50A_2_1','','','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de SWIFT" align="bottom" border="0" ></a>
                </span>
				<% } %>
				<input type="text" <%=lectura%> id="SWF_50K_2_1" name="E21PRIORC_1" class="swf_field_50" onchange="setField(getElement('E21PRIORC'), 'SWF_50', 'K', 2)" 
					size="45" maxlength="35" value="<%= prMant.getE21PRIORC() %>">
				<% if (mostrar) {  %>
                <span id="SWH_50K_2_1" class="swf_field_50" style="display: <%=!prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">
				<a href="javascript:GetSwiftAll('','SWF_50K_2_1','E31PRIORC','E41PRIORC','E51PRIORC')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de SWIFT" align="bottom" border="0" ></a>
                </span>
				<% } %>
				<input type="text" <%=lectura%> id="SWF_50F_2_2" name="SWF_50F_2_2" class="swf_field_50" onchange="setField(getElement('E21PRIORC'), 'SWF_50', 'F', 2)" 
					size="45" maxlength="35" value="<%= isNotOptionFSeq(prMant.getE21PRIORC()) ? prMant.getE21PRIORC() : prMant.getE21PRIORC().substring(prMant.getE21PRIORC().indexOf("/")) %>">
              </div>
            </td>
            <td nowrap> 
                <div align="right">
                	<span id="LBL_59_2" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("A") && !prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Nombre :</span>
                	<span id="LBL_59A_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>">BIC/BEI :</span>
                	<span id="LBL_59D_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("D") ? "inline" : "none"%>">Nombre :</span>
					<span id="LBL_59F_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>"></span>
				</div>
            </td>
            <td nowrap> 
              <div align="left"> 
              	<input type="text" id="E21PRIBCU" name="E21PRIBCU" size="45" maxlength="35" value="<%=prMant.getE21PRIBCU().trim()%>" <%=lectura%>>
				<% if (mostrar) {  %>
                <span id="SWH_59_2_1" class="swf_field_59" style="display: <%=prMant.getE01PRIBCO().trim().equals("") ? "inline" : "none"%>">
				<a href="javascript:GetSwiftAll('','E21PRIBCU','E31PRIBCU','E41PRIBCU','E51PRIBCU')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de SWIFT" align="bottom" border="0" ></a>
                </span>				
                <span id="SWH_59A_2_1" class="swf_field_59" style="display: <%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>">
				<a href="javascript:GetSwiftAll('E21PRIBCU','','','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de SWIFT" align="bottom" border="0" ></a>
                </span>
                <span id="SWH_59D_2_1" class="swf_field_59" style="display: <%=prMant.getE01PRIBCO().equals("D") ? "inline" : "none"%>">
				<a href="javascript:GetSwiftAll('','E21PRIBCU','E31PRIBCU','E41PRIBCU','E51PRIBCU')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de SWIFT" align="bottom" border="0" ></a>
                </span>
				<% } %>
              	<img id="beneNameCheck" src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              </div>
            </td>
		</tr>
          <tr id="trclear">
      		<td nowrap valign="top" align="right"> 
     		<div> 
				<span id="LBL_50K_3" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Direcci&oacute;n :</span>
				<span id="LBL_50F_3" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
               		<select name="SWF_50F_3_1" id="SWF_50F_3_1" class="swf_field_50" <%=disabled%> dir="rtl" onchange="setField(getElement('E31PRIORC'), 'SWF_50', 'F', 3)"
             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
						<option value="1" <% if(isOptionFSeq(prMant.getE31PRIORC(), "1")) out.print("selected");%>>Nombre</option>
                    	<option value="2" <% if(isNotOptionFSeq(prMant.getE31PRIORC())) out.print("selected"); %>>Direcci&oacute;n</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE31PRIORC(), "3")) out.print("selected");%>>País y Localidad</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE31PRIORC(), "4")) out.print("selected");%>>Fecha de Nacimiento</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE31PRIORC(), "5")) out.print("selected");%>>Lugar de Nacimiento</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE31PRIORC(), "6")) out.print("selected");%>>Id del Cliente</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE31PRIORC(), "7")) out.print("selected");%>>Id Nacional</option>
						<option value="8" <% if(isOptionFSeq(prMant.getE31PRIORC(), "8")) out.print("selected");%>>Info Adicional</option>
					</select> :
					</span>
			</div>
      		<div> 
				<span id="LBL_50F_4" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
               		<select name="SWF_50F_4_1" id="SWF_50F_4_1" class="swf_field_50" <%=disabled%> dir="rtl" onchange="setField(getElement('E41PRIORC'), 'SWF_50', 'F', 4)"
             			style="border: none; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
						<option value="1" <% if(isOptionFSeq(prMant.getE41PRIORC(), "1")) out.print("selected");%>>Nombre</option>
                    	<option value="2" <% if(isNotOptionFSeq(prMant.getE41PRIORC())) out.print("selected"); %>>Direcci&oacute;n</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE41PRIORC(), "3")) out.print("selected");%>>País y Localidad</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE41PRIORC(), "4")) out.print("selected");%>>Fecha de Nacimiento</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE41PRIORC(), "5")) out.print("selected");%>>Lugar de Nacimiento</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE41PRIORC(), "6")) out.print("selected");%>>Id del Cliente</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE41PRIORC(), "7")) out.print("selected");%>>Id Nacional</option>
						<option value="8" <% if(isOptionFSeq(prMant.getE41PRIORC(), "8")) out.print("selected");%>>Info Adicional</option>
					</select> :
				</span>
			</div>
      		<div> 
				<span id="LBL_50F_5" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
               		<select name="SWF_50F_5_1" id="SWF_50F_5_1" class="swf_field_50" <%=disabled%> dir="rtl" onchange="setField(getElement('E51PRIORC'), 'SWF_50', 'F', 5)"
             			style="border: 0; text-align: right; text-transform: none; min-width: 30px; width: 130px; background-color: blank">
						<option value="1" <% if(isOptionFSeq(prMant.getE51PRIORC(), "1")) out.print("selected");%>>Nombre</option>
                    	<option value="2" <% if(isNotOptionFSeq(prMant.getE51PRIORC())) out.print("selected"); %>>Direcci&oacute;n</option>
						<option value="3" <% if(isOptionFSeq(prMant.getE51PRIORC(), "3")) out.print("selected");%>>País y Localidad</option>
						<option value="4" <% if(isOptionFSeq(prMant.getE51PRIORC(), "4")) out.print("selected");%>>Fecha de Nacimiento</option>
						<option value="5" <% if(isOptionFSeq(prMant.getE51PRIORC(), "5")) out.print("selected");%>>Lugar de Nacimiento</option>
						<option value="6" <% if(isOptionFSeq(prMant.getE51PRIORC(), "6")) out.print("selected");%>>Id del Cliente</option>
						<option value="7" <% if(isOptionFSeq(prMant.getE51PRIORC(), "7")) out.print("selected");%>>Id Nacional</option>
						<option value="8" <% if(isOptionFSeq(prMant.getE51PRIORC(), "8")) out.print("selected");%>>Info Adicional</option>
					</select> :
					</span>
			</div>
			</td> 
            <td nowrap colspan="2"> 
              <div align="left"> 
              	<input type="hidden" <%=lectura%> name="E31PRIORC" size="45" maxlength="35" value="<%= prMant.getE31PRIORC().trim()%>">
				<input type="text" <%=lectura%> id="SWF_50K_3_2" name="E31PRIORC_3" class="swf_field_50" onchange="setField(getElement('E31PRIORC'), 'SWF_50', 'K', 3)" 
					size="45" maxlength="35" value="<%= prMant.getE31PRIORC() %>">
				<input type="text" <%=lectura%> id="SWF_50F_3_2" name="SWF_50F_3_2" class="swf_field_50" onchange="setField(getElement('E31PRIORC'), 'SWF_50', 'F', 3)" 
					size="45" maxlength="35" value="<%= prMant.getE31PRIORC().indexOf('/', 1) != -1 ? prMant.getE31PRIORC().substring(2) : prMant.getE31PRIORC() %>">
              </div>
              <div align="left"> 
              	<input type="hidden" <%=lectura%> name="E41PRIORC" size="45" maxlength="35" value="<%= prMant.getE41PRIORC().trim()%>">
				<input type="text" <%=lectura%> id="SWF_50K_4_2" name="E41PRIORC_4" class="swf_field_50" onchange="setField(getElement('E41PRIORC'), 'SWF_50', 'K', 4)" 
					size="45" maxlength="35" value="<%= prMant.getE41PRIORC() %>">
				<input type="text" <%=lectura%> id="SWF_50F_4_2" name="SWF_50F_4_2" class="swf_field_50" onchange="setField(getElement('E41PRIORC'), 'SWF_50', 'F', 4)" 
					size="45" maxlength="35" value="<%= prMant.getE41PRIORC().indexOf('/', 1) != -1 ? prMant.getE41PRIORC().substring(2) : prMant.getE41PRIORC() %>">
              </div>
              <div align="left"> 
              	<input type="hidden" <%=lectura%> name="E51PRIORC" size="45" maxlength="35" value="<%= prMant.getE51PRIORC().trim()%>">
				<input type="text" <%=lectura%> id="SWF_50K_5_2" name="E51PRIORC_5" class="swf_field_50" onchange="setField(getElement('E51PRIORC'), 'SWF_50', 'K', 5)" 
					size="45" maxlength="35" value="<%= prMant.getE51PRIORC() %>">
				<input type="text" <%=lectura%> id="SWF_50F_5_2" name="SWF_50F_5_2" class="swf_field_50" onchange="setField(getElement('E51PRIORC'), 'SWF_50', 'F', 5)" 
					size="45" maxlength="35" value="<%= prMant.getE51PRIORC().indexOf('/', 1) != -1 ? prMant.getE51PRIORC().substring(2) : prMant.getE51PRIORC() %>">
              </div>
            </td>
      		<td nowrap valign="top" align="right">
				<span id="LBL_59_3" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("A") && !prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Direcci&oacute;n :</span>
				<span id="LBL_59A_3" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>"></span>
				<span id="LBL_59F_3" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>"></span>
			</td> 
            <td nowrap > 
              <div align="left"> 
                <input <%=lectura%> type="text" id="E31PRIBCU" name="E31PRIBCU" size="45" maxlength="35" value="<%=prMant.getE31PRIBCU().trim()%>">
              </div>
              <div align="left"> 
                <input <%=lectura%> type="text" id="E41PRIBCU" name="E41PRIBCU" size="45" maxlength="35" value="<%=prMant.getE41PRIBCU().trim()%>"><br>
              </div>
              <div align="left"> 
                <input <%=lectura%> type="text" id="E51PRIBCU" name="E51PRIBCU" size="45" maxlength="35" value="<%=prMant.getE51PRIBCU().trim()%>">
              </div>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
</div>
<BR>
 <div id="divAccounting">
<table class="tableinfo">
    
    <tr > 
      <td nowrap> 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap > 
                <div align="right">Moneda/Monto a Transferir:</div>
              </td>
              <td nowrap > 
                <input <%=lectura%> type="text" id="E01PRITCY" name="E01PRITCY" size="4" maxlength="3" value="<%=prMant.getE01PRITCY().trim()%>" >
              <%if (mostrar){%>
                <a href="javascript:GetCurrency('E01PRITCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></a>
	   		  <%}%>
                <input  type="text" id="E01PRIAMT" name="E01PRIAMT" size="15" maxlength="13" value="<%=prMant.getE01PRIAMT().trim()%>"  <%if (mostrar) out.print("onKeyPress=\"enterDecimal(event)\""); %><%=lectura%> >
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              </td>
              <td nowrap > 
                <div align="left">Tasa de Cambio:</div>
              </td>
              <td nowrap >
                <input <%=lectura%> type="text" id="E01PRICXR" name="E01PRICXR" size="13" maxlength="13" value="<%=prMant.getE01PRICXR().trim()%>">
              </td>
              <td nowrap >
                <div align="left">Fecha Pago:</div>
              </td>
              <td nowrap > 
                <div align="left"> 
					<eibsinput:date name="prMant" fn_year="E01PRIVDY" fn_month="E01PRIVDM" fn_day="E01PRIVDD" readonly="<%=mostrar%>"/>
                </div>
              </td>
            </tr>
          </table>
      </td>
    </tr>
</table>

    <h4>Cuenta de D&eacute;bito</h4>
    
    <TABLE class="tableinfo">
      <tr id="trdark"> 
        <td nowrap align="center" width="15%">Concepto</td>
        <td nowrap align="center" width="5%">Banco </td>
        <td nowrap align="center" width="5%">Agencia</td>
        <td nowrap align="center" width="5%">Moneda</td>
        <td nowrap align="center" width="20%">Cuenta Contable</td>
        <td nowrap align="center" width="20%">Cuenta</td>
        <td nowrap align="center" width="10%">Centro de Costo</td>
        <td nowrap align="center" width="20%">Monto</td>
      </tr>
      <tr id="trclear"> 
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRIDRS" name="E01PRIDRS" size="2" maxlength="2"  value="<%=prMant.getE01PRIDRS().trim()%>" onkeypress="enterInteger(event)">
            <input <%=lectura%> type="text" id="E01PRIDPD" name="E01PRIDPD" size="17" maxlength="16"  value="<%=prMant.getE01PRIDPD().trim()%>" readonly
			 class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.getElementById('E01PRIDBK').value, document.getElementById('E01PRIDCY').value,'E01PRIDGL','E01PRIDRS','93')">
            <input <%=lectura%> type="hidden" id="E01DEBSOU" name="E01DEBSOU"  value="<%=prMant.getE01DEBSOU().trim()%>">
            <input <%=lectura%> type="hidden" id="E01DEBDIB" name="E01DEBDIB"  value="<%=prMant.getE01DEBDIB().trim()%>">
            <!--<input type="hidden" id="E01PRIHDY" name="E01PRIHDY"  value="<%=prMant.getE01PRIHDY().trim()%>">--> 
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRIDBK" name="E01PRIDBK" size="2" maxlength="2" value="<%=prMant.getE01PRIDBK().trim()%>" >
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRIDBR" name="E01PRIDBR" size="5" maxlength="4"  value="<%=prMant.getE01PRIDBR().trim()%>"
           class="context-menu-help" onmousedown="if(<%= !mostrar %>) return; init(branchHelp,this.name,document.getElementById('E01PRIDBK').value,'','','','')" onkeypress="enterInteger(event)">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRIDCY" name="E01PRIDCY" size="3" maxlength="3" value="<%=prMant.getE01PRIDCY().trim()%>" 
			class="context-menu-help" onmousedown="if(<%= !mostrar %>) return; init(currencyHelp,this.name,document.getElementById('E01PRIDBK').value,'','','','')">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRIDGL" name="E01PRIDGL" size="17" maxlength="16" value="<%=prMant.getE01PRIDGL().trim()%>" onkeypress="enterInteger(event)"
			class="context-menu-help" onmousedown="if(<%= !mostrar %>) return; init(ledgerHelp,this.name,document.getElementById('E01PRIDBK').value,document.getElementById('E01PRIDCY').value,'E01TITDEB','','')">
          </div>
        </td>
        <td nowrap  > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRIDAC" name="E01PRIDAC" size="17" maxlength="16" value="<%=prMant.getE01PRIDAC().trim()%>"
		    class="context-menu-help" onmousedown="if(<%= !mostrar %>) return; init(accountCustomerHelp,this.name,document.getElementById('E01PRIDBK').value,'',document.forms[0].E01PRIOCU.value,'','RT'); return false;" onKeyPress="enterInteger(event)">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRIDCC" name="E01PRIDCC" size="9" maxlength="8"  value="<%=prMant.getE01PRIDCC().trim()%>" 
			class="context-menu-help" onmousedown="if(<%= !mostrar %>) return; init(costcenterHelp,this.name,document.getElementById('E01PRIDBK').value,'','','','')">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRIDAM" name="E01PRIDAM" size="15" maxlength="13" value="<%=prMant.getE01PRIDAM().trim()%>">
          </div>
        </td>
      </tr>
      <tr id="trdark">
        <td nowrap colspan="5">
           <div align="right">Descripci&oacute;n :</div>
        </td>
        <td nowrap  colspan="2">
			<input type="text" id="E01TITDEB" name="E01TITDEB" size="50" maxlength="45" value="<%=prMant.getE01TITDEB().trim()%>" >
        </td>
        <td>
        </td>
      </tr>
    </table>
    <h4>Cuenta de Cr&eacute;dito</h4>
    <table class="tableinfo" >
      <tr id="trdark"> 
        <td nowrap align="center" width="15%">Concepto</td>
        <td nowrap align="center" width="5%">Banco </td>
        <td nowrap align="center" width="5%">Agencia</td>
        <td nowrap align="center" width="5%">Moneda</td>
        <td nowrap align="center" width="20%">Cuenta Contable</td>
        <td nowrap align="center" width="20%">Cuenta</td>
        <td nowrap align="center" width="10%">Centro de Costo</td>
        <td nowrap align="center" width="20%">Monto</td>
      </tr>
      <tr id="trclear"> 
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRICRS" name="E01PRICRS" size="2" maxlength="2"  value="<%=prMant.getE01PRICRS().trim()%>" onKeyPress="enterInteger(event)">
            <input <%=lectura%> type="text" id="E01PRICPD" name="E01PRICPD" size="17" maxlength="16"  value="<%=prMant.getE01PRICPD().trim()%>" readonly
			 class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.getElementById('E01PRICBK').value, document.getElementById('E01PRICCY').value,'E01PRICGL','E01PRICRS','93')">
            <input <%=lectura%> type="hidden" id="E01CRESOU" name="E01CRESOU"  value="<%=prMant.getE01CRESOU().trim()%>">
            <input <%=lectura%> type="hidden" id="E01CREDIB" name="E01CREDIB"  value="<%=prMant.getE01CREDIB().trim()%>">
            <input <%=lectura%> type="hidden" id="E01CREDAY"name="E01CREDAY">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRICBK" name="E01PRICBK" size="2" maxlength="2" value="<%=prMant.getE01PRICBK().trim()%>" >
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRICBR" name="E01PRICBR" size="5" maxlength="4"  value="<%=prMant.getE01PRICBR().trim()%>"
			class="context-menu-help" onmousedown="init(branchHelp,this.name,document.getElementById('E01PRICBK').value,'','','','')" onkeypress="enterInteger(event)">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRICCY" name="E01PRICCY" size="3" maxlength="3" value="<%=prMant.getE01PRICCY().trim()%>" 
			class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01PRICBK').value,'','','','')">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRICGL" name="E01PRICGL" size="17" maxlength="16" value="<%=prMant.getE01PRICGL().trim()%>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01PRICBK').value,document.getElementById('E01PRICCY').value,'E01TITCRE','','')">
          </div>
        </td>
        <td nowrap  > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRICAC" name="E01PRICAC" size="17" maxlength="16" value="<%= prMant.getE01PRICAC().trim()%>"
		  class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.getElementById('E01PRICBK').value,'',document.forms[0].E01PRICCU.value,'','RT')"  onkeypress="enterInteger(event)">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input <%=lectura%> type="text" id="E01PRICCC" name="E01PRICCC" size="9" maxlength="8"  value="<%=prMant.getE01PRICCC().trim()%>"
			class="context-menu-help" onmousedown="init(costcenterHelp,this.name,document.getElementById('E01PRICBK').value,'','','','')">
          </div>
        </td>
        <td nowrap >
          <div align="center">
            <input <%=lectura%> type="text" id="E01PRICAM" name="E01PRICAM" size="15" maxlength="13" value="<%=prMant.getE01PRICAM().trim()%>">
          </div>
        </td>
      </tr>
      <tr > 
	            <tr id="trdark">
					<td nowrap colspan="5">
					<div align="right">Descripci&oacute;n :</div>
					</td>
					<td nowrap colspan="2"><input type="text" id="E01TITCRE" name="E01TITCRE"
						size="50" maxlength="45" value="<%=prMant.getE01TITCRE().trim()%>">
					</td>
					<td nowrap> 
                <div align="right"></div>
                
              </td>
            </tr>
    </table>
  <div id="externalInfo">
    <h4>Nuestras Comisiones</h4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="24%" > 
                <div align="right">Tabla / Monto :</div>
              </td>
              <td nowrap width="30%" > 
                <input type="text" id="E01PRICOT" name="E01PRICOT" size="2" maxlength="2" value="<%= prMant.getE01PRICOT().trim()%>" onKeyPress="enterInteger(event)">
	                <a href="javascript:GetCNTRLPRF('E01PRICOT','E01PRICOM',document.forms[0].E01PRITTP.value, document.forms[0].E01PRIOCU.value, document.forms[0].E01PRIAMT.value, document.forms[0].E01PRITCY.value)">
	                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a> 
                <input type="text" id="E01PRICOM" name="E01PRICOM" size="15" maxlength="13" value="<%= prMant.getE01PRICOM().trim()%>" onKeyPress="enterDecimal(event)" readonly>
              </td>
              <td nowrap width="17%" > 
                <div align="right">Cargos por :</div>
              </td>
              <td nowrap width="29%" > 
                <select id="E01PRICHG" name="E01PRICHG">
				  <option value="A" <% if (!(prMant.getE01PRICHG().equals("B") || prMant.getE01PRICHG().equals("N"))) out.print("selected"); %>>Aplicante</option>
                  <option value="B" <% if (prMant.getE01PRICHG().equals("B")) out.print("selected"); %>>Beneficiario</option>
                  <option value="N" <% if (prMant.getE01PRICHG().equals("N")) out.print("selected"); %>>Ninguno</option>
                </select>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
</div>    
    
    
    <h4>Informaci&oacute;n B&aacute;sica</h4>
 <table class="tableinfo">
 <tr > 
      <td > 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  > 
                <div align="right">Referencia :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input <%=lectura%> type="text" name="E01PRISRF" size="17" maxlength="16" value="<%=prMant.getE01PRISRF().trim()%>">
                </div>
              </td>
              <td nowrap > 
                <div align="right">Referencia Relacionada :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input <%=lectura%> type="text" name="E01PRITHF" size="17" maxlength="16" value="<%=prMant.getE01PRITHF().trim()%>">
                </div>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  > 
                <div align="right">Motivo de Operaci&oacute;n :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input <%=lectura%> type="text" name="E01PRIUC2" size="5" maxlength="4" value="<%=prMant.getE01PRIUC2().trim()%>">
              <%if (mostrar){%>
                  <a href="javascript:GetCodeCNOFC('E01PRIUC2',getElement('TRANSFTYPE').value)">
                  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a>
               <%}%>
               </div>
              </td>
              <TD nowrap width="17%"> 
                <DIV align="right">Detalle de Cargos  :</DIV>
              </TD>
              <TD nowrap width="29%"> 
                <%
                 	if (!(prMant.getE01PRITTC().equals("BEN"))
                 			&& !(prMant.getE01PRITTC().equals("OUR"))
                 			&& !(prMant.getE01PRITTC().equals("SHA"))) {
                 		prMant.setE01PRITTC("SHA");
                 	}
                 %>
                <SELECT id="E01PRITTC" name="E01PRITTC" <%=disabled%>>
				  <OPTION value="" <% if (!(prMant.getE01PRITTC().equals("B") || prMant.getE01PRITTC().equals("N"))) out.print("selected"); %>></OPTION>
				  <OPTION value="BEN" <% if (prMant.getE01PRITTC().equals("BEN")) out.print("selected"); %>>BEN</OPTION>
                  <OPTION value="OUR" <% if (prMant.getE01PRITTC().equals("OUR")) out.print("selected"); %>>OUR</OPTION>
                  <OPTION value="SHA" <% if (prMant.getE01PRITTC().equals("SHA")) out.print("selected"); %>>SHA</OPTION>
                </SELECT>
              </TD>
              
            </tr>
			<% if (currUser.getE01INT().equals("11")) { %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  > 
                <div align="right">Origen de Divisas :</div>
              </td>
              <td nowrap > 
                <div align="left">
                  <input type="text" name="E01PRIORD" size="12" maxlength="10" value="<%= prMant.getE01PRIORD().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E01PRIORD','9B')">
                  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a>
                 </div>
              </td>
              <td nowrap > 
                <div align="right">Destino de Divisas :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIDSD" size="12" maxlength="10" value="<%= prMant.getE01PRIDSD().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01PRIDSD','9A')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a></td>
            </tr>
            <% } else { %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  > 
                <div align="right">Origen de Fondos :</div>
              </td>
              <td nowrap > 
                <div align="left">
                  <input type="text" name="E01PRISOU" size="2" maxlength="2" value="<%= prMant.getE01PRISOU().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E01PRISOU','18')">
                  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a>
                 </div>
              </td>
              <td nowrap > 
                <div align="right">Destino de Fondos :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIDIB" size="2" maxlength="2" value="<%= prMant.getE01PRIDIB().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01PRIDIB','38')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a>
                </td>
            </tr>
			<% } %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap > 
                <div align="right">Instrucciones Recibidas Via :</div>
              </td>
              <td nowrap>
                <input <%=lectura%> type="text" name="E01PRIIRV" size="3" maxlength="1" value="<%= prMant.getE01PRIIRV().trim()%>">
              <%if (mostrar){%>
                <a href="javascript:GetCode('E01PRIIRV','STATIC_pr_via.jsp')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
               <%}%>
              <td nowrap > 
                <div align="right">País de Origen/Destino de Divisas :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01PRIUC3" size="5" maxlength="4" value="<%= prMant.getE01PRIUC3().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01PRIUC3','03')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a>
                </td>
            </tr>
	</table>
	</td>
   </tr>
</table>

<% if(!prMant.getE01PRITTP().equals("IT")){ %>
<div id="externalInfo">
    <h4>Informaci&oacute;n Adicional</h4>
 <table class="tableinfo">
 <tr > 
      <td > 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
              <% 
                if (!(prMant.getE01PRIBKO().equals("CRED")) && !(prMant.getE01PRIBKO().equals("CRTS")) && !(prMant.getE01PRIBKO().equals("SPAY")) && !(prMant.getE01PRIBKO().equals("SPRI")  && !(prMant.getE01PRIBKO().equals("SSTD"))))
                {   prMant.setE01PRIBKO("CRED"); } 
                %>
            
            <tr id="trdark"> 
              <td nowrap  > 
                <div align="right">Cod. Operación Bancaria :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input <%=lectura%> type="text" name="E01PRIBKO" size="6" maxlength="4" value="<%= prMant.getE01PRIBKO()%>">
              <%if (mostrar){%>
                  <a href="javascript:GetCode('E01PRIBKO','STATIC_tr_operations.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a>
               <%}%>
               </div>
              </td>
              <td nowrap > 
                <div align="right">Código de Orden :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input <%=lectura%> type="text" name="E01PRIITC" size="6" maxlength="4" value="<%= prMant.getE01PRIITC()%>">
	              <%if (mostrar){%>
	                  <a href="javascript:GetCode('E01PRIITC','STATIC_tr_instructions.jsp')">
	                  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
                 <%}%>
                  <input <%=lectura%> type="text" name="E01PRIITA" size="11" maxlength="10" value="<%= prMant.getE01PRIITA()%>">
                </div>
              </td>
            </tr>
            <tr class="trclear"> 
              	<td nowrap>
              		<div align="right">Banco Remitente :</div> 
              	</td>
              	<td nowrap>
              	 	<input <%=lectura%> type="text" name="E01PRISID" size="15" maxlength="12" value="<%= prMant.getE01PRISID().trim()%>" readonly>
              	 	<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              	</td>
              <td nowrap > 
                <div align="right">Banco Receptor :</div>
              </td>
              <td nowrap > 
                <input <%=lectura%> type="text" name="E01PRIRID" size="15" maxlength="15" value="<%= prMant.getE01PRIRID().trim()%>">
              <%if (mostrar){%>
	            <a href="javascript:GetSwiftId('E01PRIRID')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a>
                <%}%>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
                </td>
            </tr>
	</table>
	</td>
   </tr>
</table>
</div>
<br>
<div id="externalDiv">
	<table class="tabdata" width="100%">
    <tr>
     <td nowrap width="50%" colspan="2"> 
           <table id="TableTab0" cellspacing=0 cellpadding=2 border="0">
          		<tr>
                      <td nowrap id="Tab0" class="tabhighlight"> 
                        	<div>Banco Originador &nbsp; &nbsp; &nbsp;
                           <select id="SWF_52" name="E01PRIOBO" <%=disabled%> onchange="setHelp(this)">
								<option value="" <% if(!(prMant.getE01PRIOBO().equals("A") || prMant.getE01PRIOBO().equals("D"))) out.print("selected");%>></option>
	                      		<option value="D" <% if(prMant.getE01PRIOBO().equals("D")) out.print("selected");%>>D</option>
								<option value="A" <% if(prMant.getE01PRIOBO().equals("A")) out.print("selected");%>>A</option>
						  </select>
                        	</div>
                      </td> 
                 
                  <td class="tabempty" width="100%">&nbsp;                       
                  </td> 
                </tr>
        </table>
       </td>
       <td nowrap width="50%" colspan="2"> 
           <table id="TableTab1" cellspacing=0 cellpadding=2 border="0">
          		<tr> 

                  <td nowrap id="TabB0" class="tabhighlight"> 
                            <div>Banco de la Cuenta/Pagador &nbsp;
                       	<select id="SWF_57" name="E01PRIBBO" class="swf_field_57" <%=disabled%> onchange="setHelp(this)">
                        	<option value="" <% if (!(prMant.getE01PRIBBO().equals("A") || prMant.getE01PRIBBO().equals("B") || prMant.getE01PRIBBO().equals("C") || prMant.getE01PRIBBO().equals("D"))) out.print("selected"); %>></option>
                            <option value="A" <% if(prMant.getE01PRIBBO().equals("A")) out.print("selected");%>>A</option>
                            <option value="B" <% if(prMant.getE01PRIBBO().equals("B")) out.print("selected");%>>B</option>
                            <option value="C" <% if(prMant.getE01PRIBBO().equals("C")) out.print("selected");%>>C</option>
							<option value="D" <% if(prMant.getE01PRIBBO().equals("D")) out.print("selected");%>>D</option>
						</select>						
						  </div>
                  </td>

                  <td class="tabempty" width="100%">&nbsp;                       
                  </td> 
                </tr>
        </table>
       </td>
    </tr>
    <tr>
		<td nowrap width="10%" align="right" valign="top" class="trdark"> 
				<span id="LBL_52_1" class="swf_field_52" style="display: inline">Identificador :</span>
				<br>
           		<span id="LBL_52D_2" class="swf_field_52" style="position: relative; top: 10px; display:<%=!prMant.getE01PRIOBO().equals("A") ? "inline" : "none"%>">Nombre :</span>
				<span id="LBL_52A_2" class="swf_field_52" style="position: relative; top: 10px; display:<%=prMant.getE01PRIOBO().equals("A") ? "inline" : "none"%>">BIC/BEI :</span>
				<br>
               	<span id="LBL_52D_3" class="swf_field_52" style="position: relative; top: 20px; display:<%=!prMant.getE01PRIOBO().equals("A") ? "inline" : "none"%>">Direcci&oacute;n :</span>
		</td>
     	<td nowrap width="40%">
                        <div id="dataTab0"> 
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" >
							<td nowrap align="right"> 
            				</td>
                      			<td nowrap align="left"> 
		                  <div>
                          <input <%=lectura%> type="text" id="E11PRIOBK" name="E11PRIOBK" size="45" maxlength="35" value="<%= prMant.getE11PRIOBK().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E21PRIOBK" name="E21PRIOBK" size="45" maxlength="35" value="<%= prMant.getE21PRIOBK().trim()%>">
							<% if (mostrar) {  %>
							<span id="SWH_52A_2_2" class="swf_field_52" style="display:<%=prMant.getE01PRIOBO().equals("A") ? "inline" : "none"%>">
							<a href="javascript:GetSwiftAll('E21PRIOBK','E31PRIOBK','E41PRIOBK','E51PRIOBK','')">
		                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="top" border="0"></a>
		                    </span>
							<span id="SWH_52D_2_2" class="swf_field_52" style="display:<%=!prMant.getE01PRIOBO().equals("A") ? "inline" : "none"%>">
							<a href="javascript:GetSwiftAll('','E21PRIOBK','E31PRIOBK','E41PRIOBK','E51PRIOBK')">
		                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="top" border="0"></a>
		                    </span>
							<% } %>
                          <br>
                          <input <%=lectura%> type="text" id="E31PRIOBK" name="E31PRIOBK" size="45" maxlength="35" value="<%= prMant.getE31PRIOBK().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E41PRIOBK" name="E41PRIOBK" size="45" maxlength="35" value="<%= prMant.getE41PRIOBK().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E51PRIOBK" name="E51PRIOBK" size="45" maxlength="35" value="<%= prMant.getE51PRIOBK().trim()%>">
                          </div>
                        	</td>
                        	<td width="20%">
                        	</td>
    						</tr>
 						 	</table>
                        </div>

        </td>
		<td nowrap width="10%" align="right" valign="top" class="trdark"> 
				<span id="LBL_57_1" class="swf_field_57" style="display: inline">Identificador :</span>
				<br>
                <span id="LBL_57D_2" class="swf_field_57" style="position: relative; top: 10px; display:<%=!prMant.getE01PRIBBO().equals("A") && !prMant.getE01PRIBBO().equals("B") ? "inline" : "none"%>">Nombre :</span>
				<span id="LBL_57A_2" class="swf_field_57" style="position: relative; top: 10px; display:<%=prMant.getE01PRIBBO().equals("A") ? "inline" : "none"%>">BIC :</span>
				<span id="LBL_57B_2" class="swf_field_57" style="position: relative; top: 10px; display:<%=prMant.getE01PRIBBO().equals("B") ? "inline" : "none"%>">Localización:</span>
				<br>
               	<span id="LBL_57D_3" class="swf_field_57" style="position: relative; top: 20px; display:<%=!prMant.getE01PRIBBO().equals("A") && !prMant.getE01PRIBBO().equals("B") ? "inline" : "none"%>">Direcci&oacute;n :</span>
		</td>
     <td nowrap width="40%" valign="top" align="left" class="trdark"> 

                        <div id="dataTabB0"> 
                        		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap align="left"> 
						  <div>
                          <input <%=lectura%> type="text" id="E11PRIBBK" name="E11PRIBBK" size="45" maxlength="35" value="<%= prMant.getE11PRIBBK().trim()%>">
						<% if (mostrar) {  %>
						  <a href="javascript:GetFedAll('E11PRIBBK')">
						  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda FED" align="top" border="0"></a>
						<% } %>
                          <br>
                          <input <%=lectura%> type="text" id="E21PRIBBK" name="E21PRIBBK" size="45" maxlength="35" value="<%= prMant.getE21PRIBBK().trim()%>">
							<% if (mostrar) {  %>
							<span id="SWH_57A_2_2" class="swf_field_57" style="display:<%=prMant.getE01PRIBBO().equals("A") ? "inline" : "none"%>">
							<a href="javascript:GetSwiftAll('E21PRIBBK','E31PRIBBK','E41PRIBBK','E51PRIBBK','')">
		                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="top" border="0"></a>
		                    </span>
							<span id="SWH_57D_2_2" class="swf_field_57" style="display:<%=!(prMant.getE01PRIBBO().equals("A") || prMant.getE01PRIBBO().equals("B")) ? "inline" : "none"%>">
							<a href="javascript:GetSwiftAll('', 'E21PRIBBK','E31PRIBBK','E41PRIBBK','E51PRIBBK')">
		                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="top" border="0"></a>
		                    </span>
							<% } %>
                          <br>
                          <input <%=lectura%> type="text" id="E31PRIBBK" name="E31PRIBBK" size="45" maxlength="35" value="<%=prMant.getE31PRIBBK().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E41PRIBBK" name="E41PRIBBK" size="45" maxlength="35" value="<%=prMant.getE41PRIBBK().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E51PRIBBK" name="E51PRIBBK" size="45" maxlength="35" value="<%=prMant.getE51PRIBBK().trim()%>">
                          </div>
                        	</td>
                        	<td width="20%">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
        </td>
    </tr>
  </table>
                 
   <BR>
                    
	<table class="tabdata" width="100%">
    <tr> 
       <td nowrap width="50%" colspan="2"> 
           <table id="TableTabA0" cellspacing="0" cellpadding="2" border="0">
                   <tr> 
               
                      <td nowrap id="TabA0" class="tabhighlight"> 
                        	<div>Banco Intermediario &nbsp;
							<select id="SWF_56" name="E01PRIINO" onchange="setHelp(this)">
                        		<option value="" <% if (!(prMant.getE01PRIINO().equals("A") || prMant.getE01PRIINO().equals("C") || prMant.getE01PRIINO().equals("D"))) out.print("selected"); %>></option>
                                <option value="A" <% if(prMant.getE01PRIINO().equals("A")) out.print("selected");%>>A</option>
                                <option value="C" <% if(prMant.getE01PRIINO().equals("C")) out.print("selected");%>>C</option>
								<option value="D" <% if(prMant.getE01PRIINO().equals("D")) out.print("selected");%>>D</option>
							</select>
                        	</div>
                      </td> 
                    
					 <td class="tabempty" width="100%">&nbsp;</td>
                  </tr>
	      </table>
	    </td>
       <td nowrap width="50%" colspan="2"> 
           <table id="TableTabD1" cellspacing="0" cellpadding="2" border="0">
                   <tr>                
                      <td nowrap id="TabE0" class="tabhighlight" onClick="showTab('TabE', 0,'SWF_53', 2)"> 
                        	<div>Bco. Corresponsal Emisor &nbsp;
							<select id="SWF_53" name="E01PRISCO" onchange="setHelp(this)">
                            	<option value="" <% if (!(prMant.getE01PRISCO().equals("A") || prMant.getE01PRISCO().equals("B") || prMant.getE01PRISCO().equals("D"))) out.print("selected"); %>></option>
                                <option value="A" <% if(prMant.getE01PRISCO().equals("A")) out.print("selected");%>>A</option>
                                <option value="B" <% if(prMant.getE01PRISCO().equals("B")) out.print("selected");%>>B</option>
                                <option value="D" <% if(prMant.getE01PRISCO().equals("D")) out.print("selected");%>>D</option>
                          	</select>
                        	</div>
                      </td> 
                    
                      <td nowrap id="TabE1" class="tabnormal" onClick="showTab('TabE', 1,'SWF_54', 2)"> 
                        	<div>Bco. Corresponsal Receptor &nbsp;
                    	<select id="SWF_54" name="E01PRIRBO"  onchange="setHelp(this)">
                        	<option value="" <% if (!(prMant.getE01PRIRBO().equals("A") || prMant.getE01PRIRBO().equals("B") || prMant.getE01PRIRBO().equals("D"))) out.print("selected"); %>></option>
                        	<option value="A" <% if(prMant.getE01PRIRBO().equals("A")) out.print("selected");%>>A</option>
                         	<option value="B" <% if(prMant.getE01PRIRBO().equals("B")) out.print("selected");%>>B</option>
							<option value="D" <% if(prMant.getE01PRIRBO().equals("D")) out.print("selected");%>>D</option>
                        </select>
                        	</div>
                      </td>

					 <td class="tabempty" width="100%">&nbsp;</td>
                  </tr>
	      </table>
	    </td>
	  </tr>
    	<tr>
		<td nowrap width="10%" align="right" valign="top" class="trdark"> 
			<span id="LBL_56_1" class="swf_field_56" style="position: relative; top: 3px; display: inline">Identificador :</span>
			<br>
            <span id="LBL_56D_2" class="swf_field_56" style="position: relative; top: 10px; display:<%=!prMant.getE01PRIINO().equals("A") && !prMant.getE01PRIINO().equals("C") ? "inline" : "none"%>">Nombre :</span>
			<span id="LBL_56A_2" class="swf_field_56" style="position: relative; top: 10px; display:<%=prMant.getE01PRIINO().equals("A") ? "inline" : "none"%>">BIC :</span>
			<br>
            <span id="LBL_56D_3" class="swf_field_56" style="position: relative; top: 20px; display:<%=!(prMant.getE01PRIINO().equals("A") || prMant.getE01PRIINO().equals("C")) ? "inline" : "none"%>">Direcci&oacute;n :</span>
		</td>
    		 <td nowrap width="40%" align="left" valign="top" class="trdark">                     
                        
                        <div id="dataTabA0"> 
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap> 
		                  <div>
                          <input <%=lectura%> type="text" id="E11PRIINB" name="E11PRIINB" size="45" maxlength="35" value="<%= prMant.getE11PRIINB().trim()%>">
                     	  <a href="javascript:GetFedAll('E11PRIINB')">
						  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda FED" align="top" border="0"></a>
                          <br>
                          <input <%=lectura%> type="text" id="E21PRIINB" name="E21PRIINB" size="45" maxlength="35" value="<%= prMant.getE21PRIINB().trim()%>">
							<span id="SWH_56A_2_2" class="swf_field_56" style="display:<%=prMant.getE01PRIINO().equals("A") ? "inline" : "none"%>">
							<a href="javascript:GetSwiftAll('E21PRIINB','E31PRIINB','E41PRIINB','E51PRIINB','')">
		                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="top" border="0"></a>
		                    </span>
							<span id="SWH_56D_2_2" class="swf_field_56" style="display:<%=!(prMant.getE01PRIINO().equals("A") || prMant.getE01PRIINO().equals("C")) ? "inline" : "none"%>">
							<a href="javascript:GetSwiftAll('','E21PRIINB','E31PRIINB','E41PRIINB','E51PRIINB')">
		                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="top" border="0"></a>
		                    </span>
                          <br>
                          <input <%=lectura%> type="text" id="E31PRIINB" name="E31PRIINB" size="45" maxlength="35" value="<%= prMant.getE31PRIINB().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E41PRIINB" name="E41PRIINB" size="45" maxlength="35" value="<%= prMant.getE41PRIINB().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E51PRIINB" name="E51PRIINB" size="45" maxlength="35" value="<%= prMant.getE51PRIINB().trim()%>">
                          </div>
                        	</td>
                        	<td width="20%">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
                    </td>
		<td nowrap width="10%" align="right" valign="top" class="trdark"> 
			<div id="LBL_53" class="dataTabE">
			<span id="LBL_53_1" class="swf_field_53" style="position: relative; top: 3px; display: inline">Identificador :</span>
			<br>
			<span id="LBL_53D_2" class="swf_field_53" style="position: relative; top: 10px; display:<%=!(prMant.getE01PRISCO().equals("A") || prMant.getE01PRISCO().equals("B")) ? "inline" : "none"%>">Nombre :</span>
			<span id="LBL_53A_2" class="swf_field_53" style="position: relative; top: 10px; display:<%=prMant.getE01PRISCO().equals("A") ? "inline" : "none"%>">BIC :</span>
			<span id="LBL_53B_2" class="swf_field_53" style="position: relative; top: 10px; display:<%=prMant.getE01PRISCO().equals("B") ? "inline" : "none"%>">Localización :</span>
			<br>
            <span id="LBL_53D_3" class="swf_field_53" style="position: relative; top: 20px; display:<%=!(prMant.getE01PRISCO().equals("A") || prMant.getE01PRISCO().equals("B")) ? "inline" : "none"%>">Direcci&oacute;n :</span>
			</div>
			<div id="LBL_54" class="dataTabE" style="display: none"> 
			<span id="LBL_54_1" class="swf_field_54" style="position: relative; top: 3px; display: inline">Identificador :</span>
			<br>
			<span id="LBL_54D_2" class="swf_field_54" style="position: relative; top: 10px; display:<%=!prMant.getE01PRIRBO().equals("A") && !prMant.getE01PRIRBO().equals("B") ? "inline" : "none"%>">Nombre :</span>
			<span id="LBL_54A_2" class="swf_field_54" style="position: relative; top: 10px; display:<%=prMant.getE01PRIRBO().equals("A") ? "inline" : "none"%>">BIC :</span>
			<span id="LBL_54B_2" class="swf_field_54" style="position: relative; top: 10px; display:<%=prMant.getE01PRIRBO().equals("B") ? "inline" : "none"%>">Localización :</span>
			<br>
            <span id="LBL_54D_3" class="swf_field_54" style="position: relative; top: 20px; display:<%=!(prMant.getE01PRIRBO().equals("A") || prMant.getE01PRIRBO().equals("B")) ? "inline" : "none"%>">Direcci&oacute;n :</span>
            </div>
		</td>
    		 <td nowrap width="40%" align="left" class="trdark">
                        
                        <div id="dataTabE0" class="dataTabE">
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap> 
		                  	<div>
                          <input type="text" id="E11PRISCB" name="E11PRISCB" size="45" maxlength="35" value="<%= prMant.getE11PRISCB().trim()%>">
                          <a href="javascript:GetFedAll('E11PRISCB')">
						  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda FED" align="top" border="0"></a>
                          <br>
                          <input type="text" id="E21PRISCB" name="E21PRISCB" size="45" maxlength="35" value="<%= prMant.getE21PRISCB().trim()%>">
							<span id="SWH_53A_2_2" class="swf_field_53" style="display:<%=prMant.getE01PRISCO().equals("A") ? "inline" : "none"%>">
							<a href="javascript:GetSwiftAll('E21PRISCB','E31PRISCB','E41PRISCB','E51PRISCB','')">
		                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda SWIFT" align="top" border="0"></a>
		                    </span>
							<span id="SWH_53D_2_2" class="swf_field_53" style="display:<%=!(prMant.getE01PRISCO().equals("A") || prMant.getE01PRISCO().equals("B")) ? "inline" : "none"%>">
							<a href="javascript:GetSwiftAll('','E21PRISCB','E31PRISCB','E41PRISCB','E51PRISCB')">
		                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda SWIFT" align="top" border="0"></a>
		                    </span>
                          <br>
                          <input type="text" id="E31PRISCB" name="E31PRISCB" size="45" maxlength="35" value="<%= prMant.getE31PRISCB().trim()%>">
                          <br>
                          <input type="text" id="E41PRISCB" name="E41PRISCB" size="45" maxlength="35" value="<%= prMant.getE41PRISCB().trim()%>">
                          <br>
                          <input type="text" id="E51PRISCB" name="E51PRISCB" size="45" maxlength="35" value="<%= prMant.getE51PRISCB().trim()%>">
                          </div>
                       		</td>
                       		<td width="20%">
                       		</td>
    						</tr>
 						 	</table>
                        </div>
                        <div id="dataTabE1" class="dataTabE" style="display: none" > 
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap> 
		                <div>
                          <input type="text" id="E11PRIRCB" name="E11PRIRCB" size="45" maxlength="35" value="<%= prMant.getE11PRIRCB().trim()%>">
                          <a href="javascript:GetFedAll('E11PRIRCB')">
						  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda FED" align="top" border="0"></a>
                          <br>
                          <input type="text" id="E21PRIRCB" name="E21PRIRCB" size="45" maxlength="35" value="<%= prMant.getE21PRIRCB().trim()%>">
                       		<span id="SWH_54A_2_2" class="swf_field_54" style="display:<%=prMant.getE01PRIRBO().equals("A") ? "inline" : "none"%>">
							<a href="javascript:GetSwiftAll('E21PRIRCB','E31PRIRCB','E41PRIRCB','E51PRIRCB','')">
		                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="top" border="0"></a>
		                    </span>
							<span id="SWH_54D_2_2" class="swf_field_54" style="display:<%=!(prMant.getE01PRIRBO().equals("A") || prMant.getE01PRIRBO().equals("B")) ? "inline" : "none"%>">
							<a href="javascript:GetSwiftAll('','E21PRIRCB','E31PRIRCB','E41PRIRCB','E51PRIRCB')">
		                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="top" border="0"></a>
		                    </span>
                          <br>
                          <input type="text" id="E31PRIRCB" name="E31PRIRCB" size="45" maxlength="35" value="<%= prMant.getE31PRIRCB().trim()%>">
                          <br>
                          <input type="text" id="E41PRIRCB" name="E41PRIRCB" size="45" maxlength="35" value="<%= prMant.getE41PRIRCB().trim()%>">
                          <br>
                          <input type="text" id="E51PRIRCB" name="E51PRIRCB" size="45" maxlength="35" value="<%= prMant.getE51PRIRCB().trim()%>">
                          </div>
                        	</td>
                        	<td width="20%">
                        	</td>
    						</tr>
 						 	</table>
                        </div>                      
                    </td>
  	</tr>
  </table>
   <BR>
	<table class="tabdata" width="100%">
    <tr> 
       <td nowrap width="100%"> 
           <table id="TableTabD1" cellspacing="0" cellpadding="2" border="0">
                   <tr> 
               
                  <td nowrap id="TabD0" class="tabhighlight" onClick="showTab('TabD', 0,'E11PRIDTO', 3)"> 
                            <div nowrap >Detalles para Ordenante </div>
                  </td> 
                
                  <td nowrap id="TabD1" class="tabnormal" onClick="showTab('TabD', 1,'E11PRIDTP', 3)"> 
                            <div nowrap >Detalles de Pago </div>
                  </td> 
                  
                      <td nowrap id="TabD2" class="tabnormal" onClick="showTab('TabD', 2,'E11PRIBKB', 3)"> 
                        	<div nowrap >Infor. Banco a Banco</div>
                      </td> 

					 <td class="tabempty" width="100%">&nbsp;</td>
                  </tr>
	      </table>
	    </td>
	  </tr>
    	<tr>
    		 <td nowrap width="50%" class="trdark">
                        
                        <div id="dataTabD0" align="right"> 
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      		<td nowrap align="center">  
		                          <input type="text" id="E11PRIDTO" name="E11PRIDTO" size="45" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
		                          <br>
		                          <input type="text" id="E31PRIDTO" name="E21PRIDTO" size="45" maxlength="35" value="<%= prMant.getE21PRIDTO().trim()%>">
		                          <br>
		                          <input type="text" id="E31PRIDTO" name="E31PRIDTO" size="45" maxlength="35" value="<%= prMant.getE31PRIDTO().trim()%>">
		                          <br>
		                          <input type="text" id="E41PRIDTO" name="E41PRIDTO" size="45" maxlength="35" value="<%= prMant.getE41PRIDTO().trim()%>">
		                          <br>
		                          <input type="text" id="E51PRIDTO" name="E51PRIDTO" size="45" maxlength="35" value="<%= prMant.getE51PRIDTO().trim()%>">
                        		</td>
    						</tr>
 						 	</table>
                        </div>
                        <div id="dataTabD1" style="display: none" align=center>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap align="center"> 
                        <input type="text" id="E11PRIDTP" name="E11PRIDTP" size="45" maxlength="35" value="<%= prMant.getE11PRIDTP().trim()%>">
                        <br>
                        <input type="text" id="E21PRIDTP" name="E21PRIDTP" size="45" maxlength="35" value="<%= prMant.getE21PRIDTP().trim()%>">
                        <br>
                          <input type="text" id="E31PRIDTP" name="E31PRIDTP" size="45" maxlength="35" value="<%= prMant.getE31PRIDTP().trim()%>">
                          <br>
                          <input type="text" id="E41PRIDTP" name="E41PRIDTP" size="45" maxlength="35" value="<%= prMant.getE41PRIDTP().trim()%>">
                          <br>
                          <input type="text" id="E51PRIDTP" name="E51PRIDTP" size="45" maxlength="35" value="<%= prMant.getE51PRIDTP().trim()%>">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
                        <div id="dataTabD2" style="display: none" align=center>
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    	<tr id="trdark" > 
                      	<td nowrap align="center"> 
                          <input <%=lectura%> type="text" id="E11PRIBKB" name="E11PRIBKB" size="45" maxlength="35" value="<%= prMant.getE11PRIBKB().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E21PRIBKB" name="E21PRIBKB" size="45" maxlength="35" value="<%= prMant.getE21PRIBKB().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E31PRIBKB" name="E31PRIBKB" size="45" maxlength="35" value="<%= prMant.getE31PRIBKB().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E41PRIBKB" name="E41PRIBKB" size="45" maxlength="35" value="<%= prMant.getE41PRIBKB().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E51PRIBKB" name="E51PRIBKB" size="45" maxlength="35" value="<%= prMant.getE51PRIBKB().trim()%>">
                          <br>
                          <input <%=lectura%> type="text" id="E61PRIBKB" name="E61PRIBKB" size="45" maxlength="35" value="<%= prMant.getE61PRIBKB().trim()%>">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
                    </td>
  	</tr>
  </table>
 </div>
 <% } %>
  <div id="otherTags" style="position: relative; top: 10px; display:<%=prMant.getE01PRIPVI().equals("7") ? "inline" : "none"%>">
	<% 
	String mSeq = "";
	for (int i = 0; i < 10; i++) {
		String tag = prMant.getField("E01PRATG"+i).getString().trim();
	  	String option = prMant.getField("E01PRAOP"+i).getString().trim();
		if (!tag.equals("")) {
			if (!mSeq.equals(prMant.getField("E01PRASQ"+i).getString().trim())) {
	%>
	<h4>Campos Adicionales - Secuencia <%= prMant.getField("E01PRASQ"+i).getString().trim()%></h4>
<TABLE class="tableinfo" id="dataTable">
	<%
			}
			mSeq = prMant.getField("E01PRASQ"+i).getString().trim();
			if(i == 0){
	%>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td NOWRAP align="center" width="20%"></td>
		<td NOWRAP align="center" width="5%"><b>TAG</b></td>
		<td NOWRAP align="center" width="5%"><b>Opción</b></td>
		<td NOWRAP align="left" width="65%"><b>Valor</b></td>
	</TR>
	<%
			}
	%>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td NOWRAP align="right" width="20%" valign="top">
			<INPUT type="hidden" name="E01TAGDS<%= i %>" value="<%= prMant.getField("E01TAGDS"+i).getString().trim()%>">
			<b><%= prMant.getField("E01TAGDS"+i).getString().trim()%> :</b>
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="hidden" name="E01PRATG<%= i %>" value="<%= prMant.getField("E01PRATG"+i).toString().trim()%>">
			<%= prMant.getField("E01PRATG"+i).toString().trim()%>
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<SELECT name="E01PRAOP<%= i %>" <%= disabled %>>
				<OPTION value="" <% if (!option.equals("")) out.print("selected"); %>></OPTION>
				<OPTION value="A" <% if(option.equals("A")) out.print("selected");%>>A</OPTION>
				<OPTION value="B" <% if(option.equals("B")) out.print("selected");%>>B</OPTION>
				<OPTION value="C" <% if(option.equals("C")) out.print("selected");%>>C</OPTION>
				<OPTION value="D" <% if(option.equals("D")) out.print("selected");%>>D</OPTION>			
			</SELECT>
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<INPUT type="hidden" name="E01PRAFL<%= i %>" value="<%= prMant.getField("E01PRAFL"+i).getString().trim()%>">		
	        <%
	        int seq = 1;
	        int lnt = Util.parseInt(prMant.getField("E01TAGLE"+i).getString().trim());
	        int ln = lnt;
	        if (lnt > 35) {
	          seq = lnt / 35;
	          ln = 35;
	        }  	
	        for (int ix = 1; ix <= seq; ix++) {
	          int posi = (ix * ln) - ln;
	          int posf = (ix * ln) - 1;
	          String vl = "";
	          try {
	            vl =  prMant.getField("E01PRAFL"+i).getString().substring(posi,posf);
	          } catch (Exception e) {
	          	if(posi <=  prMant.getField("E01PRAFL"+i).getString().length()) {
				  vl = prMant.getField("E01PRAFL"+i).getString().substring(posi);
				}
	          }
			%>
			  <INPUT type="text" name="E01PRAFL<%=i%>_<%=ix%>" size="40" maxlength="35" value="<%= vl %>"  
	  			   <%=lectura%> onchange="buildField('E01PRAFL<%= i %>',<%=seq%>, <%=lnt%>)">
	  			<BR>
			<%}%>   
		</td>
	</TR>
	<%
		} 
	}
	%>
  </TABLE>
</div>
 <% if(false){ %>
 <div id="divDCV">
    <BR>
    <h4>Claves Confirmación DCV</h4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="24%" > 
                <input <%=lectura%> type="text" id="E01PRUCR1" name="E01PRUCR1" size="16" maxlength="15" value="<%=prMant.getE01PRUCR1().trim()%>">
              </td>
              <td nowrap width="30%" > 
                <input <%=lectura%> type="text" id="E01PRUCR2" name="E01PRUCR2" size="16" maxlength="15" value="<%=prMant.getE01PRUCR2().trim()%>">
                </td>
              <td nowrap width="17%" > 
                <input <%=lectura%> type="text" id="E01PRUCR3" name="E01PRUCR3" size="16" maxlength="15" value="<%=prMant.getE01PRUCR3().trim()%>">
              </td>
              <td nowrap width="29%" > 
                <input <%=lectura%> type="text" id="E01PRUCR4" name="E01PRUCR4" size="16" maxlength="15" value="<%=prMant.getE01PRUCR4().trim()%>">
              </td>
              <td nowrap width="29%" > 
                <input <%=lectura%> type="text" id="E01PRUCR5" name="E01PRUCR5" size="16" maxlength="15" value="<%=prMant.getE01PRUCR5().trim()%>">
              </td>
            </tr>

            <tr id="trclear"> 
              <td nowrap width="24%" > 
                <input <%=lectura%> type="text" id="E01PRUCR6" name="E01PRUCR6" size="16" maxlength="15" value="<%=prMant.getE01PRUCR6().trim()%>">
              </td>
              <td nowrap width="30%" > 
                <input <%=lectura%> type="text" id="E01PRUCR7" name="E01PRUCR7" size="16" maxlength="15" value="<%=prMant.getE01PRUCR7().trim()%>">
                </td>
              <td nowrap width="17%" > 
                <input <%=lectura%> type="text" id="E01PRUCR8" name="E01PRUCR8" size="16" maxlength="15" value="<%=prMant.getE01PRUCR8().trim()%>">
              </td>
              <td nowrap width="29%" > 
                <input <%=lectura%> type="text" id="E01PRUCR9" name="E01PRUCR9" size="16" maxlength="15" value="<%=prMant.getE01PRUCR9().trim()%>">
              </td>
              <td nowrap width="29%" > 
                <input <%=lectura%> type="text" id="E01PRUC10" name="E01PRUC10" size="16" maxlength="15" value="<%=prMant.getE01PRUC10().trim()%>">
              </td>
            </tr>


          </table>
        </td>
      </tr>
    </table>
    </div>
<% } %>
    <BR>
    
<h4 style="text-align:center"><input type="checkbox" id="H01FLGWK2" name="H01FLGWK2" value="A" <% if(prMant.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Aceptar con Advertencias</h4>
<p align="center"> 
<INPUT id="EIBSBTN" type="button" name ="btenviar" value="Enviar" onClick="enviar(this)">
 </p>
</form>
	<div align="right">
		D&iacute;as de Retenci&oacute;n : <input <%=lectura%> type="text"
			id="E01PRIHDY" name="E01PRIHDY" size="3" maxlength="3"
			value="<%=prMant.getE01PRIHDY().trim()%>"
			onKeyPress="enterInteger(event)">
	</div>
</div>
	<script type="text/javascript">
$(document).ready(function(){
		SetVia(getElement('tranferType').value, getElement('paymentVia').value);
});
</script>
</body>
</html>
