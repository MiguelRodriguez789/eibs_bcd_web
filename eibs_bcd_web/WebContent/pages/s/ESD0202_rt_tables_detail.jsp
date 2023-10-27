<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>

<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Comisiones-Definición de Cargos</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "charges" class= "datapro.eibs.beans.ESD020201Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">

function CheckAcc(op){
	document.forms[0].SCREEN.value = op;
	document.forms[0].submit();
}

$( document ).ready(function() {
	setRowColors();
});

function ShowFNG(TypeSel) {
  if (TypeSel == 'Y') {  
    divAddOpt.style.display = "";
  } else {
    divAddOpt.style.display = "none";
  }
}  
</SCRIPT>  



 
</head>

<body bgcolor="#FFFFFF" onload="loadFreq(getElement('E01DDCPLZ').checked);">

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 
 
 
<h3 align="center">Comisiones-Definición de Cargos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_tables_detail, ESD0202" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0202">

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    
  <h4> </h4>
  
  <% int row = 0; %>
  <table class="tableinfo">
          <tr > 
        <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr class ="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01DDCBNK" readonly size="3" maxlength="2" value="<%=userPO.getHeader1().trim()%>">
              </div>
            </td>
           <td nowrap width="25%">
              <div align="right">Código de Comisión :</div>
            </td>
            <td nowrap>
                <input type="text" name="E01DDCCDE" readonly size="5" maxlength="4" value="<%=charges.getE01DDCCDE().trim()%>">
            </td>
          </tr>
        </table>
        </td>
      </tr>


</table>
    
    
  <h4><b>Información Básica</b></h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr class ="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Descripción de la Comisión :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01DDCDSC" size="65" maxlength="60" value="<%=charges.getE01DDCDSC()%>">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="30%" > 
					<input type="radio" name="E01DDCSTS" value="A" <%if (charges.getE01DDCSTS().equals("A")) out.print("checked"); %>> Activo 	
					<input type="radio" name="E01DDCSTS" value="I" <%if (charges.getE01DDCSTS().equals("I")) out.print("checked"); %>> Inactivo 
					<input type="radio" name="E01DDCSTS" value="C" <%if (charges.getE01DDCSTS().equals("C")) out.print("checked"); %>> Cerrado
            </td>
          </tr>
          <tr > 
          <tr class ="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Fecha Inicial :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:date name="charges" fn_year="E01DDCOPY" fn_month="E01DDCOPM" fn_day="E01DDCOPD" />
            </td>
            <td nowrap width="20%"> 
              <div align="right">Fecha Final :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
    	        <eibsinput:date name="charges" fn_year="E01DDCMAY" fn_month="E01DDCMAM" fn_day="E01DDCMAD" />
              </div>
            </td>
          </tr>          
          <tr class ="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Moneda/Cuenta Contable :</div>
            </td>
            <td nowrap width="30%" > 
				<input type="text" name="E01DDCCCY" size="3" maxlength="3"
					value="<%= charges.getE01DDCCCY() %>" readonly> <a
					href="javascript:GetCurrency('E01DDCCCY','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
				<input type="text" name="E01DDCGLN" size="18"
					maxlength="16" value="<%= charges.getE01DDCGLN().trim()%>"> <a
					href="javascript:GetLedger('E01DDCGLN',document.forms[0].E01DDCBNK.value,document.forms[0].E01DDCCCY.value,'','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Cobro de I.V.A :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
					<input type="radio" name="E01DDCTAX" value="Y" <%if (!charges.getE01DDCTAX().equals("N")) out.print("checked"); %>> Si 	
					<input type="radio" name="E01DDCTAX" value="N" <%if (charges.getE01DDCTAX().equals("N")) out.print("checked"); %>> 	No
              </div>
            </td>
          </tr>

          <tr class ="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Aplicacion :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
	              <select name="E01DDCFRQ" onchange="CheckAcc('999');">
	                <option value="P" <%if (charges.getE01DDCFRQ().equals("P") || (!charges.getE01DDCFRQ().equals("T") && !charges.getE01DDCFRQ().equals("X"))) { out.print("selected"); }%>>Periodica</option>
	                <option value="T" <%if (charges.getE01DDCFRQ().equals("T")) { out.print("selected"); }%>>Transacción</option>
	                <option value="X" <%if (charges.getE01DDCFRQ().equals("X")) { out.print("selected"); }%>>Tabla Activos</option>
	              </select>              
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Cobro G.M.F :</div>
            </td>
            <td nowrap width="30%" > 
					<input type="radio" name="E01DDCGMF" value="Y" <%if (!charges.getE01DDCGMF().equals("N")) out.print("checked"); %>> Si 	
					<input type="radio" name="E01DDCGMF" value="N" <%if (charges.getE01DDCGMF().equals("N")) out.print("checked"); %>> 	No            
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>          

<% if (!charges.getE01DDCFRQ().equals("X")){ %>  
  <h4><b>Datos Adicionales</b></h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" id="datosAddicionalTable" cellpadding="2" width="100%" border="0" align="left" >
          <tr class ="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Forma de Cobro :</div>
            </td>
            <td nowrap width="30%" > 
					<input type="radio" name="E01DDCCOT" value="T" <%if (!charges.getE01DDCCOT().equals("C")) out.print("checked"); %>> Transacción 	
					<input type="radio" name="E01DDCCOT" value="C" <%if (charges.getE01DDCCOT().equals("C")) out.print("checked"); %>> 	Consolidado
            </td>
            <td nowrap width="25%"> 
              <div align="right">Medio de Cobro :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
	              <select name="E01DDCCOM">
	                <option value="M" <%if (charges.getE01DDCCOM().equals("M")) { out.print("selected"); }%>>Manual</option>
	                <option value="A" <%if (charges.getE01DDCCOM().equals("A")) { out.print("selected"); }%>>Automático</option>
	                <option value="B" <%if (charges.getE01DDCCOM().equals("B")) { out.print("selected"); }%>>Ambas</option>
	              </select>
              </div>
            </td>
          </tr>
 	    <tr > 
            <td nowrap width="20%"> 
              <div align="right">Método de Cobro de Comisión :</div>
            </td>
            <td nowrap width="30%" > 
	              <select name="E01DDCMTH" onchange="showCobro(this.value)">
	                <option value="F" <%if (charges.getE01DDCMTH().equals("F")) { out.print("selected"); }%>>Monto Fijo</option>
	                <option value="P" <%if (charges.getE01DDCMTH().equals("P")) { out.print("selected"); }%>>Porcentaje</option>
	                <option value="E" <%if (charges.getE01DDCMTH().equals("E")) { out.print("selected"); }%>>Escala/Tramos</option>
	              </select>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Cobro Generado por :</div>
            </td>
            <td nowrap width="30%" > 
	              <select name="E01DDCTPR">
	                <option value="1" <%if (charges.getE01DDCTPR().equals("1")) { out.print("selected"); }%>>Comisiones IBS</option>
	                <option value="2" <%if (charges.getE01DDCTPR().equals("2")) { out.print("selected"); }%>>Aplic.Satelite</option>
	                <option value="3" <%if (charges.getE01DDCTPR().equals("3")) { out.print("selected"); }%>>Otro Mod.IBS</option>
	              </select>

            </td>
          </tr>
   		 <tr > 
            <td nowrap width="20%"> 
              <div align="right" id="divCobroTitle">Valor Commision :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left" id="FIJO" style="display: none"> 
				<input type="text" class="txtright" name="E01DDCCOA" size="17" maxlength="15"  value="<%= charges.getE01DDCCOA() %>">
              </div>
              <div align="left" id="ESCALA" style="display: none"> 
                <input type="text" name="E01DDCCHN" size="4" maxlength="5" value="<%= charges.getE01DDCCHN().trim()%>">
                <a href="javascript:GetScaleDef('E01DDCCHN','D01DDCCHN')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
                <input type="text" name="D01DDCCHN" size="40" maxlength="35" readonly value="<%=charges.getD01DDCCHN()%>">
            </div>                                
            </td>
            <td nowrap width="20%"> 
              <div align="right">Cobro Sobregira :</div>
            </td>
            <td nowrap width="30%" > 
					<input type="radio" name="E01DDCOVD" value="Y" <%if (!charges.getE01DDCOVD().equals("N")) out.print("checked"); %>> Si 	
					<input type="radio" name="E01DDCOVD" value="N" <%if (charges.getE01DDCOVD().equals("N")) out.print("checked"); %>> 	No
            </td>
          </tr>
    	<tr > 
            <td nowrap width="20%"> 
              <div align="right">Porcentaje de Descuento :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
				<input type="text" class="txtright" name="E01DDCPDE" size="10" maxlength="9" value="<%= charges.getE01DDCPDE() %>"
				 onKeypress="enterDecimal(event,6)">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Momento de Cobro :</div>
            </td>
            <td nowrap width="30%" > 
					<input type="radio" name="E01DDCCTM" value="V" <%if (!charges.getE01DDCCTM().equals("A")) out.print("checked"); %>> Vencido 	
					<input type="radio" name="E01DDCCTM" value="A" <%if (charges.getE01DDCCTM().equals("A")) out.print("checked"); %>> Anticipado
            </td>

          </tr>
    	<tr > 
            <td nowrap width="20%"> 
              <div align="right">Monto Mínimo :</div>
            </td>
            <td nowrap width="30%" > 
				<input type="text" class="txtright" name="E01DDCMIN" size="17" maxlength="15" value="<%= charges.getE01DDCMIN() %>"
				 onKeypress="enterDecimal(event,2)">
            </td>
            <td nowrap width="20%"> 
              <div align="right">Monto Máximo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
				<input type="text" class="txtright" name="E01DDCMAX" size="17" maxlength="15" value="<%= charges.getE01DDCMAX() %>"
				 onKeypress="enterDecimal(event,2)">
              </div>
            </td>
          </tr>
          <tr > 
            <td nowrap width="20%"> 
              <div align="right">Periodo de Cobro de Comisión :</div>
            </td>
            <td nowrap width="30%" > 
	              <select name="E01DDCPER">
	                <option value="D" <%if (charges.getE01DDCPER().equals("D")) { out.print("selected"); }%>>Diario</option>
	                <option value="W" <%if (charges.getE01DDCPER().equals("W")) { out.print("selected"); }%>>Semanal</option>
	                <option value="B" <%if (charges.getE01DDCPER().equals("B")) { out.print("selected"); }%>>Quincenal</option>
	                <option value="M" <%if (charges.getE01DDCPER().equals("M")) { out.print("selected"); }%>>Mensual</option>
	                <option value="Q" <%if (charges.getE01DDCPER().equals("Q")) { out.print("selected"); }%>>Trimestral</option>
	                <option value="Y" <%if (charges.getE01DDCPER().equals("Y")) { out.print("selected"); }%>>Anual</option>
	              </select>
	              Día:
	              <input type="text" name="E01DDCP01" size="3" maxlength="2" value="<%= charges.getE01DDCP01().trim()%>">
				  <a href="javascript:GetCode('E01DDCP01','STATIC_cash_pool_cycle.jsp')"><img src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" border="0" ></a>	              
	              Mes:
	              <input type="text" name="E01DDCP02" size="3" maxlength="2" value="<%= charges.getE01DDCP02().trim()%>">
            </td>
            <td nowrap width="20%"> 
              <div align="right">Numero de Transacciones con Excepción :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
				<input type="text" class="txtright" name="E01DDCNTE" size="7" maxlength="5" value="<%= charges.getE01DDCNTE() %>"
				 onKeypress="enterInteger(event)">
              </div>
            </td>
          </tr>
          <tr > 
            <td nowrap width="20%"> 
              <div align="right">Número Período :</div>
            </td>
            <td nowrap width="30%" > 
				<input type="text" class="txtright" name="E01DDCNPE" size="7" maxlength="5" value="<%= charges.getE01DDCNPE() %>"
				 onKeypress="enterInteger(event)">
            </td>
            <td nowrap width="20%"> 
              <div align="right">Frecuencia Período :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
	              <select name="E01DDCTPE">
	                <option value="D" <%if (charges.getE01DDCTPE().equals("D")) { out.print("selected"); }%>>Diario</option>
	                <option value="W" <%if (charges.getE01DDCTPE().equals("W")) { out.print("selected"); }%>>Semanal</option>
	                <option value="B" <%if (charges.getE01DDCTPE().equals("B")) { out.print("selected"); }%>>Quincenal</option>
	                <option value="M" <%if (charges.getE01DDCTPE().equals("M")) { out.print("selected"); }%>>Mensual</option>
	              </select>
              </div>
            </td>
          </tr>
          <tr > 
            <td nowrap width="20%"> 
              <div align="right">Tipo de Persona :</div>
            </td>
            <td nowrap width="30%" > 
	              <select name="E01DDCLGT">
	                <option value="1" <%if (charges.getE01DDCLGT().equals("1")) { out.print("selected"); }%>>Jurídica</option>
	                <option value="2" <%if (charges.getE01DDCLGT().equals("2")) { out.print("selected"); }%>>Física</option>
	                <option value="B" <%if (charges.getE01DDCLGT().equals("B")) { out.print("selected"); }%>>Ambas</option>
	              </select>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Valida Plaza :</div>
            </td>
            <td nowrap width="30%" > 
					<input type="radio" name="E01DDCPLZ" value="Y" <%if (!charges.getE01DDCPLZ().equals("N")) out.print("checked"); %>> Si 	
					<input type="radio" name="E01DDCPLZ" value="N" <%if (charges.getE01DDCPLZ().equals("N")) out.print("checked"); %>> 	No
            </td>
          </tr>
          <tr > 
            <td nowrap width="20%"> 
              <div align="right">Aplica a Portafolio :</div>
            </td>
            <td nowrap width="30%" > 
					<input type="radio" name="E01DDCPCK" value="Y" <%if (!charges.getE01DDCPCK().equals("N")) out.print("checked"); %>> Si 	
					<input type="radio" name="E01DDCPCK" value="N" <%if (charges.getE01DDCPCK().equals("N")) out.print("checked"); %>> 	No
            </td>
            <td nowrap width="20%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="30%" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}else{%>
  <h4><b>Datos Adicionales</b></h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table id="datosAddicionalTable" cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr > 
            <td nowrap width="20%"> 
              <div align="right">Método de Cobro de Comisión :</div>
            </td>
            <td nowrap width="30%" > 
	              <select name="E01DDCMTH" onchange="showCobro(this.value)">
	                <option value="F" <%if (charges.getE01DDCMTH().equals("F")) { out.print("selected"); }%>>Monto Fijo</option>
	                <option value="P" <%if (charges.getE01DDCMTH().equals("P")) { out.print("selected"); }%>>Porcentaje</option>
	                <option value="1" <%if (charges.getE01DDCMTH().equals("1")) { out.print("selected"); }%>>Tasa/Periodo</option>
	                <option value="E" <%if (charges.getE01DDCMTH().equals("E")) { out.print("selected"); }%>>Escala/Tramos</option>
	              </select>
            </td>
          </tr>
          <tr>
            <td nowrap width="20%"> 
              <div align="right">Tipo Cargo :</div>
            </td>
            <td nowrap width="30%" > 
	              <select name="E01DDCCTY" onchange="showPlazo(this.value)">
	                <option value=" " <%if (!charges.getE01DDCCTY().equals("C") && !charges.getE01DDCCTY().equals("F") && !charges.getE01DDCCTY().equals("I") ) { out.print("selected"); }%>></option>
	                <option value="C" <%if (charges.getE01DDCCTY().equals("C")) { out.print("selected"); }%>>Comisi&oacute;n</option>
	                <option value="F" <%if (charges.getE01DDCCTY().equals("F")) { out.print("selected"); }%>>Comisi&oacute;n FG</option> <!-- FNG -->
	                <option value="M" <%if (charges.getE01DDCCTY().equals("M")) { out.print("selected"); }%>>Comisi&oacute;n MiPYME</option>
	                <option value="P" <%if (charges.getE01DDCCTY().equals("P")) { out.print("selected"); }%>>Comisi&oacute;n Principal</option>
	                <option value="I" <%if (charges.getE01DDCCTY().equals("I")) { out.print("selected"); }%>>Impuesto</option>
	              </select>            
            </td>
          </tr>        
          <tr > 
            <td nowrap width="20%"> 
              <div align="right" id="divCobroTitle">Valor/Porcentaje de Comisión :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left" id="FIJO"> 
				<input type="text" class="txtright" name="E01DDCCOA" size="17" maxlength="15"  value="<%= charges.getE01DDCCOA() %>">
              </div>
              <div align="left" id="ESCALA"> 
                <input type="text" name="E01DDCCHN" size="4" maxlength="5" value="<%= charges.getE01DDCCHN().trim()%>">
                <a href="javascript:GetScaleDef('E01DDCCHN','D01DDCCHN')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
                <input type="text" name="D01DDCCHN" size="40" maxlength="35" value="<%=charges.getD01DDCCHN()%>">
              </div>  
              </td>
           </tr>
           <tr>
	         <td nowrap width="20%" >
              <div id="plazoLabel" align="right"> Plazo : </div>
            </td>
	         <td nowrap width="30%" >
				<div id="plazoRadio" align="left"> 
					<input type="radio" name="E01DDCPLZ" value="C" <%if (charges.getE01DDCPLZ().equals("C")) out.print("checked"); %> onclick="showFreq(this.value);"> Corto 	
					<input type="radio" name="E01DDCPLZ" value="L" <%if (charges.getE01DDCPLZ().equals("L")) out.print("checked"); %> onclick="showFreq(this.value);"> 	Largo
				</div>	
            </td>
          </tr>
         
		<tr id="freqLine" style="display: none;">
	         <td nowrap width="20%" >
              <div id="freqLabel" align="right"> Frecuencia Pago(Meses) : </div>
            </td>
	         <td nowrap  width="30%">
				<input type="text" name="E01DDCP04" id="freqText" size="4" maxlength="5" value="<%= charges.getE01DDCP04().trim()%>">	
            </td>
        </tr>
        	 <tr > 
            <td nowrap width="20%"> 
              <div align="right">Moneda Referencial :</div>
            </td>
            <td nowrap width="30%" > 
				<select name="H01FLGWK1" >
						<option value=" " <%if (charges.getH01FLGWK1().equals(" ")) { out.print("selected"); }%>>Moneda del Producto</option>
						<option value="6" <%if (charges.getH01FLGWK1().equals("6")) { out.print("selected"); }%>>SMMLV </option>
					</select>
            </td>
           </tr>
		
          <tr > 
            <td nowrap width="20%"> 
              <div align="right">Monto Mínimo :</div>
            </td>
            <td nowrap width="30%" > 
				<input type="text" class="txtright" name="E01DDCMIN" size="17" maxlength="15" value="<%= charges.getE01DDCMIN() %>"
				 onKeypress="enterDecimal(event,2)">
            </td>
           </tr>
           <tr>
            <td nowrap width="20%"> 
              <div align="right">Monto Máximo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
				<input type="text" class="txtright" name="E01DDCMAX" size="17" maxlength="15" value="<%= charges.getE01DDCMAX() %>"
				 onKeypress="enterDecimal(event,2)">
              </div>
            </td>
          </tr>
          <tr>
            <td nowrap width="20%"> 
              <div align="right" id="tipofng" >Tipo de FG :</div>  <!-- FNG -->
            </td>
            <td nowrap width="30%" > 
              <div align="left" id="fngdsc" > 
				 <eibsinput:cnofc name="charges" flag="FJ" property="E01DDCRNG" fn_code="E01DDCRNG" fn_description="" required="false"/>
			  </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  
  <%}%>
  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar"  onClick="javascript:CheckAcc(200)">
    <input id="EIBSBTN" type=submit name="Submit" value="Cancelar"  onClick="javascript:CheckAcc(100)">
  </div>
</form>
</body>
<script type="text/javascript">

	
	function showCobro(payvalue){
		if(payvalue === "E"){ 
			getElement("divCobroTitle").innerHTML= 'Escala/Tramo :';
			getElement("FIJO").style.display= 'none';
			getElement("ESCALA").style.display= 'block';
		}else if(payvalue === "P"){
			getElement("divCobroTitle").innerHTML= '% Comision';
			getElement("ESCALA").style.display= 'none';			
			getElement("FIJO").style.display= 'block';
		}else{
			getElement("divCobroTitle").innerHTML= 'Valor Comision :';
			getElement("FIJO").style.display= 'block';
			getElement("ESCALA").style.display= 'none';
		}
		setRowColors();
	}
	
	function showPlazo(plazoValue){
		if(plazoValue === "F"){
			getElement("plazoLabel").style.display = 'block';			
			getElement("plazoRadio").style.display = 'block';
			getElement("tipofng").style.display = 'block';			
			getElement("fngdsc").style.display = 'block';
		}else {
			getElement("plazoLabel").style.display = 'none';			
			getElement("plazoRadio").style.display = 'none';
			getElement("tipofng").style.display = 'none';			
			getElement("fngdsc").style.display = 'none';
		}
	}

	function showFreq(freqValue){
		if(freqValue === "L"){
			getElement("freqLine").style.display = 'table-row';
			getElement("freqLabel").style.display = 'block';			
			getElement("freqText").style.display = 'block';			
			setRowColors();
		}else{
			getElement("freqLine").style.display = 'none';
			getElement("freqLabel").style.display = 'none';			
			getElement("freqText").style.display = 'none';
		}
	}
	
	function loadFreq(value){
		if(value === false){
			showFreq("L");
		}else{
			showFreq("C");
		}
	}
	
	showCobro(getElement("E01DDCMTH").value);
	
	if (isValidObject(getElement("E01DDCCTY"))) {
		showPlazo(getElement("E01DDCCTY").value);
	}
	
	function setRowColors(){
	    $('#datosAddicionalTable tr:visible:odd').removeClass().addClass('trclear');
    	$('#datosAddicionalTable tr:visible:even').removeClass().addClass('trdark'); 
}
	
</script>


</html>
