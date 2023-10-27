<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>

<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Comisiones-Consulta Definición de Cargos</title>
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
</SCRIPT>  



 
</head>
<body bgcolor="#FFFFFF">

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 
 
 
<h3 align="center">Comisiones-Consulta Definición de Cargos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ESD0202_rt_tables_detail_inq, ESD0202" ></h3>
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
            <td nowrap width="22%"> 
              <div align="right">Descripción de la Comisión :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"> 
                <input type="text" name="E01DDCDSC" size="65" maxlength="60" value="<%=charges.getE01DDCDSC()%>" readonly="readonly">
              </div>
            </td>
          </tr>
          <tr class ="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Fecha Inicial :</div>
            </td>
            <td nowrap width="18%" > 
    	        <eibsinput:date name="charges" fn_year="E01DDCOPY" fn_month="E01DDCOPM" fn_day="E01DDCOPD" readonly="true" />
            </td>
            <td nowrap width="29%"> 
              <div align="right">Fecha Final :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
    	        <eibsinput:date name="charges" fn_year="E01DDCMAY" fn_month="E01DDCMAM" fn_day="E01DDCMAD" readonly="true"/>
              </div>
            </td>
          </tr>          
          <tr class ="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Moneda/Cuenta Contable :</div>
            </td>
            <td nowrap width="18%" > 
				<input type="text" name="E01DDCCCY" size="3" maxlength="3"	readonly value="<%= charges.getE01DDCCCY() %>" readonly> 
				<input type="text" name="E01DDCGLN" size="18" maxlength="16" readonly value="<%= charges.getE01DDCGLN().trim()%>"> 
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cobro de I.V.A :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
					<input type="radio" name="E01DDCTAX" value="Y" disabled="disabled"
					<%if (!charges.getE01DDCTAX().equals("N")) out.print("checked"); %>>
				Si 	<input type="radio" name="E01DDCTAX" value="N" disabled="disabled"
					<%if (charges.getE01DDCTAX().equals("N")) out.print("checked"); %>>
				No
              </div>
            </td>
          </tr>

          <tr class ="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Aplicacion :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
	              <select name="E01DDCFRQ" disabled="disabled">
	                <option value="P" <%if (charges.getE01DDCFRQ().equals("P") || (!charges.getE01DDCFRQ().equals("T") && !charges.getE01DDCFRQ().equals("X"))) { out.print("selected"); }%>>Periodica</option>
	                <option value="T" <%if (charges.getE01DDCFRQ().equals("T")) { out.print("selected"); }%>>Transacción</option>
	                <option value="X" <%if (charges.getE01DDCFRQ().equals("X")) { out.print("selected"); }%>>Tabla Cargos</option>
	              </select>              
              </div>            
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cobro G.M.F :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCGMF" value="Y" disabled="disabled"
					<%if (!charges.getE01DDCGMF().equals("N")) out.print("checked"); %>>
				Si 	<input type="radio" name="E01DDCGMF" value="N" disabled="disabled"
					<%if (charges.getE01DDCGMF().equals("N")) out.print("checked"); %>>
				No
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
            <td nowrap width="22%"> 
              <div align="right">Forma de Cobro :</div>
            </td>
            <td nowrap width="18%" > 
					<input type="radio" name="E01DDCCOT" value="T" disabled="disabled"
					<%if (!charges.getE01DDCCOT().equals("C")) out.print("checked"); %>>
				Transacción 	<input type="radio" name="E01DDCCOT" value="C" disabled="disabled"
					<%if (charges.getE01DDCCOT().equals("C")) out.print("checked"); %>>
				Consolidado
            </td>
            <td nowrap width="29%"> 
              <div align="right">Medio de Cobro :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
	              <select name="E01DDCCOM" disabled="disabled">
	                <option value="M" <%if (charges.getE01DDCCOM().equals("M")) { out.print("selected"); }%>>Manual</option>
	                <option value="A" <%if (charges.getE01DDCCOM().equals("A")) { out.print("selected"); }%>>Automático</option>
	                <option value="B" <%if (charges.getE01DDCCOM().equals("B")) { out.print("selected"); }%>>Ambas</option>
	              </select>
              </div>
            </td>
          </tr>
 	    <tr > 
            <td nowrap width="22%"> 
              <div align="right">Método de Cobro de Comisión :</div>
            </td>
            <td nowrap width="18%" > 
	              <select name="E01DDCMTH" disabled="disabled">
	                <option value="F" <%if (charges.getE01DDCMTH().equals("F")) { out.print("selected"); }%>>Monto Fijo</option>
	                <option value="P" <%if (charges.getE01DDCMTH().equals("P")) { out.print("selected"); }%>>Porcentaje</option>
	                <option value="E" <%if (charges.getE01DDCMTH().equals("E")) { out.print("selected"); }%>>Escala/Tramos</option>
	              </select>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cobro Generado por :</div>
            </td>
            <td nowrap width="31%" > 
	              <select name="E01DDCTPR" disabled="disabled">
	                <option value="1" <%if (charges.getE01DDCTPR().equals("1")) { out.print("selected"); }%>>Comisiones IBS</option>
	                <option value="2" <%if (charges.getE01DDCTPR().equals("2")) { out.print("selected"); }%>>Aplic.Satelite</option>
	                <option value="3" <%if (charges.getE01DDCTPR().equals("3")) { out.print("selected"); }%>>Otro Mod.IBS</option>
	              </select>

            </td>
          </tr>   	
          <tr > 
            <td nowrap width="22%"> 
              <div align="right" id="divCobroTitle">Valor de Commision</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left" id="FIJO" style="display: none"> 
				<input type="text" name="E01DDCCOA" size="17" maxlength="15" readonly value="<%= charges.getE01DDCCOA() %>">
              </div>
              <div align="left" id="PORCENTAJE" style="display: none"> 
				<input type="text" name="E01DDCCOP" size="10" maxlength="9" readonly value="<%= charges.getE01DDCCOP() %>">
              </div>    
              <div align="left" id="ESCALA" style="display: none"> 
                <input type="text" name="E01DDCCHN" size="4" maxlength="5" readonly value="<%= charges.getE01DDCCHN().trim()%>">
                <input type="text" name="D01DDCCHN" size="31" maxlength="30" readonly value="<%=charges.getD01DDCCHN()%>">            
              </div>                                
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cobro Sobregira :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCOVD" value="Y" disabled="disabled"
					<%if (!charges.getE01DDCOVD().equals("N")) out.print("checked"); %>>
				Si 	<input type="radio" name="E01DDCOVD" value="N" disabled="disabled"
					<%if (charges.getE01DDCOVD().equals("N")) out.print("checked"); %>>
				No
            </td>
          </tr>
    	<tr > 
            <td nowrap width="22%"> 
              <div align="right">Porcentaje de Descuento :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
				<input type="text" name="E01DDCPDE" size="10" maxlength="9" readonly value="<%= charges.getE01DDCPDE() %>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Momento de Cobro :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCCTM" value="V" disabled="disabled"
					<%if (!charges.getE01DDCCTM().equals("A")) out.print("checked"); %>>
				Vencido 	<input type="radio" name="E01DDCCTM" value="A" disabled="disabled"
					<%if (charges.getE01DDCCTM().equals("A")) out.print("checked"); %>>
				Anticipado
            </td>

          </tr>
          <tr class ="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Monto Mínimo :</div>
            </td>
            <td nowrap width="18%" > 
				<input type="text" name="E01DDCMIN" size="17" maxlength="15" readonly value="<%= charges.getE01DDCMIN() %>">
            </td>
            <td nowrap width="29%"> 
              <div align="right">Monto Máximo :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
				<input type="text" name="E01DDCMAX" size="17" maxlength="15" readonly value="<%= charges.getE01DDCMAX() %>">
              </div>
            </td>
          </tr>
          <tr > 
            <td nowrap width="22%"> 
              <div align="right">Periodo de Cobro de Comisión :</div>
            </td>
            <td nowrap width="18%" > 
	              <select name="E01DDCPER" disabled="disabled">
	                <option value="D" <%if (charges.getE01DDCPER().equals("D")) { out.print("selected"); }%>>Diario</option>
	                <option value="W" <%if (charges.getE01DDCPER().equals("W")) { out.print("selected"); }%>>Semanal</option>
	                <option value="B" <%if (charges.getE01DDCPER().equals("B")) { out.print("selected"); }%>>Quincenal</option>
	                <option value="M" <%if (charges.getE01DDCPER().equals("M")) { out.print("selected"); }%>>Mensual</option>
	                <option value="Q" <%if (charges.getE01DDCPER().equals("Q")) { out.print("selected"); }%>>Trimestral</option>
	                <option value="Y" <%if (charges.getE01DDCPER().equals("Y")) { out.print("selected"); }%>>Anual</option>
	              </select>
	              Día:
	              <input type="text" name="E01DDCP01" size="3" maxlength="2" readonly value="<%= charges.getE01DDCP01().trim()%>">
	              Mes:
	              <input type="text" name="E01DDCP02" size="3" maxlength="2" readonly value="<%= charges.getE01DDCP02().trim()%>">
            </td>
            <td nowrap width="29%"> 
              <div align="right">Numero de Transacciones con Excepción :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
				<input type="text" name="E01DDCNTE" size="7" maxlength="5" readonly value="<%= charges.getE01DDCNTE() %>">
              </div>
            </td>
          </tr>
          <tr > 
            <td nowrap width="22%"> 
              <div align="right">Número Período :</div>
            </td>
            <td nowrap width="18%" > 
				<input type="text" name="E01DDCNPE" size="7" maxlength="5" readonly value="<%= charges.getE01DDCNPE() %>">
            </td>
            <td nowrap width="29%"> 
              <div align="right">Frecuencia Período :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
	              <select name="E01DDCTPE" disabled="disabled">
	                <option value="D" <%if (charges.getE01DDCTPE().equals("D")) { out.print("selected"); }%>>Diario</option>
	                <option value="W" <%if (charges.getE01DDCTPE().equals("W")) { out.print("selected"); }%>>Semanal</option>
	                <option value="B" <%if (charges.getE01DDCTPE().equals("B")) { out.print("selected"); }%>>Quincenal</option>
	                <option value="M" <%if (charges.getE01DDCTPE().equals("M")) { out.print("selected"); }%>>Mensual</option>
	              </select>
              </div>
            </td>
          </tr>
          <tr > 
            <td nowrap width="22%"> 
              <div align="right">Tipo de Persona :</div>
            </td>
            <td nowrap width="18%" > 
	              <select name="E01DDCLGT" disabled="disabled">
	                <option value="1" <%if (charges.getE01DDCLGT().equals("1")) { out.print("selected"); }%>>Jurídica</option>
	                <option value="2" <%if (charges.getE01DDCLGT().equals("2")) { out.print("selected"); }%>>Física</option>
	                <option value="B" <%if (charges.getE01DDCLGT().equals("B")) { out.print("selected"); }%>>Ambas</option>
	              </select>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Valida Plaza :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCPLZ" value="Y" disabled="disabled"
					<%if (!charges.getE01DDCPLZ().equals("N")) out.print("checked"); %>>
				Si 	<input type="radio" name="E01DDCPLZ" value="N" disabled="disabled"
					<%if (charges.getE01DDCPLZ().equals("N")) out.print("checked"); %>>
				No
            </td>
          </tr>
          <tr > 
            <td nowrap width="29%"> 
              <div align="right">Aplica a Portafolio :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCPCK" value="Y" disabled="disabled"
					<%if (!charges.getE01DDCPCK().equals("N")) out.print("checked"); %>>
				Si 	<input type="radio" name="E01DDCPCK" value="N" disabled="disabled"
					<%if (charges.getE01DDCPCK().equals("N")) out.print("checked"); %>>
				No
            </td>
            <td nowrap width="29%"> 
              <div align="right">Estado Comisión :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCSTS" value="A" disabled="disabled"
					<%if (charges.getE01DDCSTS().equals("A")) out.print("checked"); %>>
				Activo 	<input type="radio" name="E01DDCSTS" value="I" disabled="disabled"
					<%if (charges.getE01DDCSTS().equals("I")) out.print("checked"); %>>
				Inactivo <input type="radio" name="E01DDCSTS" value="C" disabled="disabled"
					<%if (charges.getE01DDCSTS().equals("C")) out.print("checked"); %>>
				Cerrado
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
            <td nowrap width="22%"> 
              <div align="right">Método de Cobro de Comisión :</div>
            </td>
            <td nowrap width="18%" > 
	              <select name="E01DDCMTH" disabled="disabled">
	                <option value="F" <%if (charges.getE01DDCMTH().equals("F")) { out.print("selected"); }%>>Monto Fijo</option>
	                <option value="P" <%if (charges.getE01DDCMTH().equals("P")) { out.print("selected"); }%>>Porcentaje</option>
	                <option value="E" <%if (charges.getE01DDCMTH().equals("E")) { out.print("selected"); }%>>Escala/Tramos</option>
	              </select>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Estado Comisión :</div>
            </td>
            <td nowrap width="31%"  > 
					<input type="radio" name="E01DDCSTS" value="A" disabled="disabled"
					<%if (charges.getE01DDCSTS().equals("A")) out.print("checked"); %>>
				Activo 	<input type="radio" name="E01DDCSTS" value="I" disabled="disabled"
					<%if (charges.getE01DDCSTS().equals("I")) out.print("checked"); %>>
				Inactivo <input type="radio" name="E01DDCSTS" value="C" disabled="disabled"
					<%if (charges.getE01DDCSTS().equals("C")) out.print("checked"); %>>
				Cerrado
            </td>
          </tr>            
          <tr > 
            <td nowrap width="22%"> 
              <div align="right" id="divCobroTitle">Valor/Porcentaje de Comisión :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left" id="FIJO"> 
				<input type="text" name="E01DDCCOA" size="17" maxlength="15" readonly value="<%= charges.getE01DDCCOA() %>">
              </div>
              <div align="left" id="ESCALA"> 
                <input type="text" name="E01DDCCHN" size="4" maxlength="5" value="<%= charges.getE01DDCCHN().trim()%>">
                <a href="javascript:GetScaleDef('E01DDCCHN','D01DDCCHN')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
                <input type="text" name="D01DDCCHN" size="31" maxlength="30" value="<%=charges.getD01DDCCHN()%>">
              </div>  
              </td>
            <td nowrap width="29%"> 
              <div align="right">Tipo Cargo :</div>
            </td>
            <td nowrap width="31%" > 
	              <select name="E01DDCCTY" disabled="disabled">
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
            <td nowrap width="22%"> 
              <div align="right">Monto Mínimo :</div>
            </td>
            <td nowrap width="18%" > 
				<input type="text" name="E01DDCMIN" size="17" maxlength="15" readonly value="<%= charges.getE01DDCMIN() %>">
            </td>
            <td nowrap width="29%"> 
              <div align="right">Monto Máximo :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
				<input type="text" name="E01DDCMAX" size="17" maxlength="15" readonly value="<%= charges.getE01DDCMAX() %>">
              </div>
            </td>
          </tr>
          <tr > 
            <td nowrap width="22%"> 
              <div align="right">Tipo de FG :</div> <!-- FNG -->
            </td>
            <td nowrap width="18%" > 
				<input type="text" name="E01DDCRNG" size="5" maxlength="4" readonly value="<%= charges.getE01DDCRNG() %>">
            </td>
            <td nowrap width="29%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
				
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
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar"  onClick="javascript:CheckAcc(100)">
  </div>
</form>
</body>
<script type="text/javascript">
	function showCobro(payvalue){
		if(payvalue === "E"){ 
			getElement("divCobroTitle").innerHTML= 'Escala/Tramo :';
			getElement("FIJO").style.display= 'none';
			if(getElement("E01DDCFRQ").value != 'X') getElement("PORCENTAJE").style.display= 'none';
			getElement("ESCALA").style.display= 'block';
		}else if(payvalue === "P"){
			getElement("divCobroTitle").innerHTML= '% Comission';
			getElement("ESCALA").style.display= 'none';			
			if(getElement("E01DDCFRQ").value === 'X'){
				getElement("FIJO").style.display= 'block';
			}else{
				getElement("FIJO").style.display= 'none';
				getElement("PORCENTAJE").style.display= 'block';
			}
		}else{
			getElement("divCobroTitle").innerHTML= 'Valor Comission :';
			getElement("FIJO").style.display= 'block';
			if(getElement("E01DDCFRQ").value != 'X') getElement("PORCENTAJE").style.display= 'none';
			getElement("ESCALA").style.display= 'none';
		}
		setRowColors();
	}
	showCobro(getElement("E01DDCMTH").value);
	
	function setRowColors(){
	    $('#datosAddicionalTable tr:visible:odd').removeClass().addClass('trclear');
    	$('#datosAddicionalTable tr:visible:even').removeClass().addClass('trdark'); 
}
	
</script>


</html>
