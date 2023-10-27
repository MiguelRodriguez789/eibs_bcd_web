<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %> 
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head> 
<title>Deposits - Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="deal" class="datapro.eibs.beans.EDL013111Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goAction(op) {
 		switch (op){
 		// Submit Data
 		case 5:  {
    		document.forms[0].SCREEN.value = '5';
			submitForm();
       		break;
        	}
 		// Default
 		default: {
 			}
		}
	}
</SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\">"; 
String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" alt=\"Ayuda\" align=\"bottom\" border=\"0\">";
%> 

<h3 align="center">
<% if (deal.getH11SCRCOD().toString().equals("05")) { %>
	CONFIRMACION - 
<% } %>
<% if (userPO.getPurpose().equals("INQUIRY")) { %>
	CONSULTA - 
<% } %>
Depósitos - Back Office - <%= deal.getE11DEATYP().trim()%> <%= deal.getD11DEATYP().trim()%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="backoffice.jsp,EDL0131"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSEDL0131" id="target">
	<input type="hidden" name="SCREEN"  value="5" >
	<input type="hidden" name="E11DEADLC"  value="<%= deal.getE11DEADLC().trim()%>" >
	<input type="hidden" name="E11DEATYP"  value="<%= deal.getE11DEATYP().trim()%>" >
	<input type="hidden" name="E11DEABAP"  value="<%= deal.getE11DEABAP().trim()%>" >

  <table class="tableinfo" width="100%" >
    <tr id="trclear"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" align="right"><b>Contraparte :</b></td>
            <td nowrap colspan="3" width="85%" align="left"> 
            	<input type="text" name="E11DEACUN" size="10" maxlength="9" value="<%= deal.getE11DEACUN().trim()%>" readonly>
                <input type="text" name="E11CUSNA1" size="40" maxlength="35" value="<%= deal.getE11CUSNA1().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Información Básica</h4>
  <table  class="tableinfo" width="736">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap align="right">Fecha Proceso : </td>
            <td nowrap >
            	<eibsinput:date name="deal" fn_month="E11DEAODM" fn_day="E11DEAODD" fn_year="E11DEAODY" readonly="true"/>
            </td>
            <td nowrap align="right">Fecha Valor : </td>
            <td nowrap>
            	<eibsinput:date name="deal" fn_month="E11DEASDM" fn_day="E11DEASDD" fn_year="E11DEASDY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Número de Referencia / Contrato : </td>
            <td nowrap width="23%" >
            	<input type="text" name="E11DEAREF" size="13" maxlength="12" value="<%= deal.getE11DEAREF().trim()%>" readonly>
            	<input type="text" name="E11DEAACC" size="13" maxlength="12" value="<%= deal.getE11DEAACC().trim()%>" readonly>
            </td>
            <td nowrap width="18%" align="right">Tipo de Operación : </td>
            <td nowrap width="20%" >
              <select name="E11DLSSBT" disabled>
                <option value="" <% if (!(deal.getE11DLSSBT().equals("PU") || deal.getE11DLSSBT().equals("SL"))) out.print("selected"); %>></option>
                <% if (deal.getE11DEAACD().equals("11"))  { %>
                <option value="PU" <% if(deal.getE11DLSSBT().equals("PU")) out.print("selected");%>>ACTIVA</option>
                <option value="SL" <% if(deal.getE11DLSSBT().equals("SL")) out.print("selected");%>>PASIVA</option>
                <% } else  if (deal.getE11DEAACD().equals("12"))  {%>
                <option value="PU" <% if(deal.getE11DLSSBT().equals("PU")) out.print("selected");%>>COMPRA</option>
                <option value="SL" <% if(deal.getE11DLSSBT().equals("SL")) out.print("selected");%>>EMISION</option>
                <% } else  if (deal.getE11DEAACD().equals("14"))  {%>
                <option value="SL" <% if(deal.getE11DLSSBT().equals("SL")) out.print("selected");%>>VENTA</option>
                <% } else {%>
                <option value="PU" <% if(deal.getE11DLSSBT().equals("PU")) out.print("selected");%>>COMPRA</option>
                <option value="SL" <% if(deal.getE11DLSSBT().equals("SL")) out.print("selected");%>>VENTA</option>
                <% } %>
              </select>
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Banco/Sucursal/Moneda/Cuenta : </td>
            <td nowrap width="23%" >
            	<input type="text" name="E11DEABNK" size="3" maxlength="2" value="<%= deal.getE11DEABNK().trim()%>" readonly>
            	<input type="text" name="E11DEABRN" size="5" maxlength="4" value="<%= deal.getE11DEABRN().trim()%>" readonly>
            	<input type="text" name="E11DEACCY" size="4" maxlength="3" value="<%= deal.getE11DEACCY().trim()%>" readonly>
            	<input type="text" name="E11DEAGLN" size="17" maxlength="16" value="<%= deal.getE11DEAGLN().trim()%>" readonly>
            </td>
            <td nowrap align="right" width="18%">Valor Nominal :</td>
            <td nowrap width="20%">
            	<input type="text" name="E11DEAOAM" size="18" maxlength="17" value="<%= deal.getE11DEAOAM().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Tasa : </td>
            <td nowrap width="23%">
            	<input type="text" name="E11DEARTE" size="18" maxlength="17" value="<%= deal.getE11DEARTE().trim()%>" readonly>
            </td>
            <td nowrap width="18%" align="right">Interés : </td>
            <td nowrap width="20%">
            	<input type="text" name="E11DEAINT" size="18" maxlength="17" value="<%= deal.getE11DEAINT().trim()%>" readonly>            
            </td>
          </tr>
          <% if (deal.getE11DEAACD().equals("14")) {%>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Tasa de Descuento : </td>
            <td nowrap width="23%" >
            	<input type="text" name="E11DEAMIR" size="18" maxlength="17" value="<%= deal.getE11DEAMIR().trim()%>" readonly>
            </td>	
           <td nowrap  width="18%" align="right">Monto Neto : </td>
            <td nowrap width="20%">
            	<input type="text" name="E11DEABAP" size="18" maxlength="17" value="<%= deal.getE11DEABAP().trim()%>" readonly>
            </td>
          </tr>
          <% } %>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Notas :</td>
            <td nowrap width="23%"><%= deal.getE11DLSOTC().trim()%></td>
            <td nowrap width="18%" align="right">Tesorero :</td>
            <td nowrap width="20%">
            	<input type="text" name="E11DLSUSR" size="11" maxlength="10" value="<%= deal.getE11DLSUSR().trim()%>" readonly>
            	<%= deal.getE11DLSDSC().trim()%>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  
  </table>
  <h4>Información Adicional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%" align="right">Producto :</td>
            <td nowrap width="23%"> 
              <input type="text" name="E11DEAPRO" size="5" maxlength="4" value="<%= deal.getE11DEAPRO().trim()%>">
              <input type="text" name="E11DLSPDS" readonly size="40" maxlength="30" value="<%= deal.getE11DLSPDS().trim()%>" >
              <a href="javascript:GetProductB('E11DEAPRO','E11DLSPDS','13','')"><%=help%></a> 
               <%=mandatory%>
            </td>
            <td nowrap width="25%" align="right">Vía de Pago :</td>
            <td nowrap width="27%"> 
               <select name="E11DEAPVI" >
                  <option value="" <% if(deal.getE11DEAPVI().equals("")) out.print("selected");%>></option>
                  <option value="F" <% if(deal.getE11DEAPVI().equals("F")) out.print("selected");%>>Fed</option>
                  <option value="1" <% if(deal.getE11DEAPVI().equals("1")) out.print("selected");%>>Swift MT-103</option>
                  <option value="2" <% if(deal.getE11DEAPVI().equals("2")) out.print("selected");%>>Swift MT-200</option>
				  <option value="3" <% if(deal.getE11DEAPVI().equals("3")) out.print("selected");%>>Swift MT-202</option>
				  <option value="G" <% if(deal.getE11DEAPVI().equals("G")) out.print("selected");%>>Cuenta Contable</option>
				  <option value="R" <% if(deal.getE11DEAPVI().equals("R")) out.print("selected");%>>Cuenta de Detalle</option>				  
                  <option value="C" <% if(deal.getE11DEAPVI().equals("C")) out.print("selected");%>>Cheque Oficial</option>
                  <option value="A" <% if(deal.getE11DEAPVI().equals("A")) out.print("selected");%>>ACH</option>
                </select> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Código de Renovación : </td>
            <td nowrap width="23%">
            	<input type="text" name="E11DEAF02" size="2" maxlength="1" value="<%= deal.getE11DEAF02().trim()%>" readonly>
            </td>
            <td nowrap width="25%" align="right">Tipo de Confirmación :</td>
            <td nowrap width="27%">
            	<select name="E11DEAF03">
                <option value=" " <% if (!(deal.getE11DEAF03().equals("P") ||deal.getE11DEAF03().equals("S")||deal.getE11DEAF03().equals("N"))) out.print("selected"); %>></option>
                <option value="P" <% if (deal.getE11DEAF03().equals("P")) out.print("selected"); %>>Imprimir</option>
                <option value="S" <% if (deal.getE11DEAF03().equals("S")) out.print("selected"); %>>Swift</option>
                <option value="N" <% if (deal.getE11DEAF03().equals("N")) out.print("selected"); %>>Ninguna</option>
              </select> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" align="right">País de Residencia :</td>
            <td nowrap width="23%">
            	<input type="text" name="E11DEAGCD" size="5" maxlength="4" value="<%= deal.getE11DEAGCD().trim()%>" >
              	<a href="javascript:GetCodeCNOFC('E11DEAGCD','03')"><%=help%></a> 
            </td>
            <td nowrap width="25%" align="right">País de Riesgo  :</td>
            <td nowrap width="27%">
            	<input type="text" name="E11DEAGRC" size="13" maxlength="12" value="<%= deal.getE11DEAGRC().trim()%>" >
              	<a href="javascript:GetCodeCNOFC('E11DEAGRC','03')"><%=help%></a>  
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Tasa de Cambio Moneda Extranjera :</td>
            <td nowrap width="23%">
            	<input type="text" name="E11DEAEXR" size="15" maxlength="13" value="<%= deal.getE11DEAEXR().trim()%>" onkeypress="enterSignDecimal()"> 
            </td>
            <td nowrap width="25%" align="right">Centro de Costo :</td>
            <td nowrap width="27%">
            	<input type="text" name="E11DEACCN" size="8" maxlength="6" value="<%= deal.getE11DEACCN().trim()%>" onKeypress="enterInteger()">
              	<a href="javascript:GetCostCenter('E11DEACCN',document.forms[0].E11DEABNK.value)"><%=help%></a> 
            </td>
          </tr>   
          <tr id="trdark"> 
            <td nowrap width="25%" align="right">Agente : </td>
            <td nowrap width="23%"> 
              <input type="text" name="E11DLSBRK" size="5" maxlength="4" value="<%= deal.getE11DLSBRK().trim()%>" >
              <input type="text" name="E11DLSBDS" size="40" maxlength="35" value="<%= deal.getE11DLSBDS().trim()%>" >
              <a href="javascript:GetBrokerT('E11DLSBRK','E11DLSBDS')"><%=help%></a> 
            </td>
            <td nowrap width="25%" align="right">Tipo de Cálculo de Interés : </td>
            <td nowrap width="27%">
            	    <input type="text" readonly name="E11DEAICT" size="2" maxlength="1" value="<%= deal.getE11DEAICT()%>">
              		<input type="text" readonly name="D11DEAICT" size="40" maxlength="35" 
						value="<% if (deal.getE11DEAICT().equals("S")) out.print("Al Vencimiento Calendario");
							else if (deal.getE11DEAICT().equals("M")) out.print("Al Vencimiento Comercial");
							else if (deal.getE11DEAICT().equals("P")) out.print("Prepagados Calendario");
							else if (deal.getE11DEAICT().equals("A")) out.print("Prepagados Comerciales");
							else if (deal.getE11DEAICT().equals("D")) out.print("Descontados Calendario");
							else if (deal.getE11DEAICT().equals("T")) out.print("Descontados Comerciales");
							else if (deal.getE11DEAICT().equals("R")) out.print("Capitalizados(CD's)");
							else if (deal.getE11DEAICT().equals("1")) out.print("Al Vencimiento Calendario");
							else if (deal.getE11DEAICT().equals("2")) out.print("Al Vencimiento Comercial");
							else if (deal.getE11DEAICT().equals("3")) out.print("Prepagados Calendario");
							else if (deal.getE11DEAICT().equals("4")) out.print("Prepagados Comerciales");
							else if (deal.getE11DEAICT().equals("5")) out.print("Descontados Calendario");
							else if (deal.getE11DEAICT().equals("6")) out.print("Descontados Comerciales");
							else if (deal.getE11DEAICT().equals("7")) out.print("Capitalizados (CD's)");
							else if (deal.getE11DEAICT().equals("8")) out.print("Regla 78");
							else out.print("");%>" >
            </td>	
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Plazo : </td>
            <td nowrap width="23%">
            	<input type="text" name="E11DEATRM" size="4" maxlength="3" value="<%= deal.getE11DEATRM().trim()%>" >
              	<select  name="E11DEATRC">
                	<option value=" " <% if (!(deal.getE11DEATRC().equals("D") ||deal.getE11DEATRC().equals("M")||deal.getE11DEATRC().equals("Y"))) out.print("selected"); %>></option>
                	<option value="D" <% if(deal.getE11DEATRC().equals("D")) out.print("selected");%>>Día(s)</option>
                	<option value="M" <% if(deal.getE11DEATRC().equals("M")) out.print("selected");%>>Mes(es)</option>
                	<option value="Y" <% if(deal.getE11DEATRC().equals("Y")) out.print("selected");%>>Año(s)</option>
              	</select>
              	<%=mandatory %> 
            </td>
            <td nowrap width="25%" align="right">Fecha de Vencimiento :</td>
            <td nowrap width="27%">
            	<eibsinput:date name="deal" fn_month="E11DEAMDM" fn_day="E11DEAMDD" fn_year="E11DEAMDY" readonly="false"/>
            </td>	
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" align="right">Periodo de Pago Intereses : </td>
            <td nowrap width="23%">
            	<input type="text" name="E11DEAROY" size="4" maxlength="5" value="<%= deal.getE11DEAROY().trim()%>" >
            	<select  name="E11DEAODA">
                	<option value=" " <% if (!(deal.getE11DEAODA().equals("D") ||deal.getE11DEAODA().equals("M")||deal.getE11DEAODA().equals("Y"))) out.print("selected"); %>></option>
                	<option value="D" <% if(deal.getE11DEAODA().equals("D")) out.print("selected");%>>Día(s)</option>
                	<option value="M" <% if(deal.getE11DEAODA().equals("M")) out.print("selected");%>>Mes(es)</option>
                	<option value="Y" <% if(deal.getE11DEAODA().equals("Y")) out.print("selected");%>>Año(s)</option>
              	</select>
            </td>
            <td nowrap width="25%" align="right">Fecha de Revisión/Ciclo :</td>
            <td nowrap width="27%">
            	<eibsinput:date name="deal" fn_month="E11DEARDM" fn_day="E11DEARDD" fn_year="E11DEARDY" readonly="false"/> 
              	/ 
              	<input type="text" name="E11DEARRP" size="3" maxlength="3" value="<%= deal.getE11DEARRP().trim()%>" onkeypress="enterCharNumber()" onblur="rightAlignCharNumber()"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Tipo de Tasa Flotante :</td>
            <td nowrap width="23%">
            	<input type="text" name="E11DEAFTB" size="2" maxlength="2" value="<%= deal.getE11DEAFTB().trim()%>">
              	<a href="javascript:GetFloating('E11DEAFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
              	<select name="E11DEAFTY">
                	<option value=" " <% if (!(deal.getE11DEAFTY().equals("FP") ||deal.getE11DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                	<option value="FP" <% if (deal.getE11DEAFTY().equals("FP")) out.print("selected"); %>>Primaria</option>
                	<option value="FS" <% if (deal.getE11DEAFTY().equals("FS")) out.print("selected"); %>>Secundaria</option>
              	</select> 
              	<input type="text" name="E11FLTRTE" size="9" maxlength="9" value="<%= deal.getE11FLTRTE().trim()%>" readonly> 
            </td>
            <td nowrap width="25%" align="right">Tasa Total : </td>
            <td nowrap width="27%">
            	<input type="text" name="E11RATE" size="9" maxlength="9" value="<%= deal.getE11RATE().trim()%>" readonly> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  

               
   <h4>Cuentas de Contrapartida <%=mandatory%></h4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
  
   <table id="headTable">
    <tr id="trdark"> 
      <td nowrap align="center" >Concepto</td>
      <td nowrap align="center" >Banco </td>
      <td nowrap align="center" >Agencia</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Cuenta Contable</td>
      <td nowrap align="center" >No. de Referencia</td>
      <td nowrap align="center" >Monto</td>
    </tr>
    </table> 
      
    <div id="dataDiv" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable" >
    <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
          <tr id="trclear"> 
            <td nowrap align="center"> 
            	<input type="text" name="E11OFFOP<%= name %>" size="2" maxlength="2" value="<%= deal.getField("E11OFFOP"+name).getString().trim()%>" onKeypress="enterInteger(event)">
                <input type="text" name="E11OFFCO<%= name %>" size="25" maxlength="45" readonly value="<%= deal.getField("E11OFFCO"+name).getString().trim()%>" 
                 class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E11DEABNK.value, document.forms[0].E11OFFCY<%= name %>.value,'E11OFFGL<%= name %>','E11OFFOP<%= name %>','13')">
            </td>
            <td nowrap width="5%" align="center"> 
                <input type="text" name="E11OFFBK<%= name %>" size="2" maxlength="2" value="<%= deal.getField("E11OFFBK"+name).getString().trim()%>" onKeypress="enterInteger(event)">
            </td>
            <td nowrap align="center">   
                <input type="text" name="E11OFFBR<%= name %>" size="5" maxlength="4" value="<%= deal.getField("E11OFFBR"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E11DEABNK.value,'','','',''); return false;">
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E11OFFCY<%= name %>" size="3" maxlength="3" value="<%= deal.getField("E11OFFCY"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E11DEABNK.value,'','','','')">
            </td>
            <td nowrap align="center">
        		<INPUT type="text" name="E11OFFGL<%= name %>" size="17" maxlength="16" value="<%= deal.getField("E11OFFGL"+name).getString().trim()%>" readonly>
			</td>
            <td nowrap align="center"> 
              	<input type="text" name="E11OFFAC<%= name %>" size="13" maxlength="12"  value="<%= deal.getField("E11OFFAC"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E11DEABNK.value,'','','','RT')" onKeypress="enterInteger(event)">
            </td>
            <td nowrap align="center"> 
                <input type="text" name="E11OFFAM<%= name %>" size="15" maxlength="13"  value="<%= deal.getField("E11OFFAM"+name).getString().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
     <% } %> 
     </table>
    </div>

<table id="footTable" > 				
    	<tr id="trdark">
    		<td nowrap align="right"><b>Monto del Contrato en Moneda Equivalente :</b> </td>
     		<td nowrap align="center"><b> 
          		<input type="text" name="E11OFFEQV" size="15" maxlength="13" readonly value="<%= deal.getE11OFFEQV().trim()%>">
          	</b>
      		</td>
    	</tr>
  	</table>
  </TD>  
</TR>	
</TABLE>    

    <h4>Cuentas de Pago <%=mandatory%></h4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
  
   <table id="headTable1">
    <tr id="trdark"> 
      <td nowrap align="center" >Concepto</td>
      <td nowrap align="center" >Banco </td>
      <td nowrap align="center" >Agencia</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Cuenta Contable</td>
      <td nowrap align="center" >No. de Referencia</td>
    </tr>
    </table> 
      
    <div id="dataDiv1" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable1" >
     <tr id="trclear"> 
      	<td nowrap align="center"> 
          	<input type="text" name="E11REPOPE"  value="<%= deal.getE11REPOPE().trim()%>" size="2" maxlength="2">
          	<input type="text" name="E11REPCON" size="25" maxlength="45"  value="<%= deal.getE11REPCON().trim()%>" 
          	class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E11DEABNK.value, document.forms[0].E11REPCCY.value,'E11REPGLN','E11REPOPE','13')">
      	</td>
      	<td nowrap align="center"> 
          	<input type="text" name="E11REPBNK" size="2" maxlength="2" value="<%= deal.getE11REPBNK().trim()%>" onKeypress="enterInteger(event)">
        </td>
      	<td nowrap align="center"> 
          	<input type="text" name="E11REPBRN" size="5" maxlength="4" value="<%= deal.getE11REPBRN().trim()%>" 
			class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E11DEABNK.value,'','','',''); return false;">
      	</td>
      	<td nowrap align="center"> 
          	<input type="text" name="E11REPCCY" size="3" maxlength="3" value="<%= deal.getE11REPCCY().trim()%>" 
          	class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E11DEABNK.value,'','','','')">
      	</td>
      	<td nowrap align="center">
        	<INPUT type="text" name="E11REPGLN" size="17" maxlength="16" value="<%= deal.getE11REPGLN().trim()%>" readonly>
		</td>
      	<td nowrap align="center">
        	<INPUT type="text" name="E11REPACC" size="13" maxlength="12" value="<%= deal.getE11REPACC().trim()%>"
			class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E11DEABNK.value,'','','','RT')"
			onkeypress="enterInteger(event)">
		</td>
    </tr>
     </table>
     </div>
  </TD>  
</TR>	
</TABLE>    

  <h4>Límites</h4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap>&nbsp;</td>
            <td nowrap  colspan="2" align="center"><b>Monto Límite </b></td>
            <td nowrap align="center"><b>Monto Límite Utilizado</b></td>
            <td nowrap align="center"><b>Monto Límite Disponible  </b></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap>Líneas de Crédito</td>
            <td nowrap  colspan="2" align="right"><%= Util.fcolorCCY(deal.getE11DLSAMT1())%></td>
            <td nowrap align="right"><%= Util.fcolorCCY(deal.getE11DLSAMT3())%></td>
            <td nowrap align="right"><b><%= Util.fcolorCCY(deal.getE11DLSAMT2())%></b></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <% 	if (!(deal.getH11SCRCOD().equals("05") || userPO.getPurpose().equals("INQUIRY"))) { %>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%" align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);">
      </td>
    </tr>
  </table>
  <% } %>
	<SCRIPT type="text/javascript">
	
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
     adjustEquTables(headTable1,dataTable1,dataDiv1,0,false);
   	}
  	tableresize();
  	window.onresize=tableresize;  
 		
	<% 	if (deal.getH11SCRCOD().equals("05") || userPO.getPurpose().equals("INQUIRY")) { %>	
		$("#target :input").prop("disabled", true);
		$("a").removeAttr('href');
	<%	} %>	
	</SCRIPT>  
	
  </form>
</body>
</html>
