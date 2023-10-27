<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %> 
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head> 
<title>Commercial Papers - Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="deal" class="datapro.eibs.beans.EDL010802Message"  scope="session" />
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
<% if (deal.getH02SCRCOD().toString().equals("05")) { %>
	CONFIRMACION - 
<% } %>
<% if (userPO.getPurpose().equals("INQUIRY")) { %>
	CONSULTA - 
<% } %>
Papeles Comerciales - Back Office - <%= deal.getE02DEATYP().trim()%> <%= deal.getD02DEATYP().trim()%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="backoffice.jsp,EDL0108"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSEDL0108" id="target">
	<input type="hidden" name="SCREEN"  value="5" >
	<input type="hidden" name="E02DEADLC"  value="<%= deal.getE02DEADLC().trim()%>" >
	<input type="hidden" name="E02DEATYP"  value="<%= deal.getE02DEATYP().trim()%>" >
	<input type="hidden" name="E02DLIBAP"  value="<%= deal.getE02DLIBAP().trim()%>" >
	<input type="hidden" name="E02DLIOPT"  value="<%= deal.getE02DLIOPT().trim()%>" >

  <table class="tableinfo" width="100%" >
    <tr id="trclear"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" align="right"><b>Contraparte :</b></td>
            <td nowrap colspan="3" width="85%" align="left"> 
            	<input type="text" name="E02DLICUS" size="10" maxlength="9" value="<%= deal.getE02DLICUS().trim()%>" readonly>
                <input type="text" name="E02DLINAM" size="40" maxlength="35" value="<%= deal.getE02DLINAM().trim()%>" readonly>
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
            	<eibsinput:date name="deal" fn_month="E02DLITDM" fn_day="E02DLITDD" fn_year="E02DLITDY" readonly="true"/>
            </td>
            <td nowrap align="right">Fecha Valor : </td>
            <td nowrap>
            	<eibsinput:date name="deal" fn_month="E02DLISDM" fn_day="E02DLISDD" fn_year="E02DLISDY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Número de Referencia / Contrato : </td>
            <td nowrap width="23%" >
            	<input type="text" name="E02DEAREF" size="13" maxlength="12" value="<%= deal.getE02DEAREF().trim()%>" readonly>
            	<input type="text" name="E02DEAACC" size="13" maxlength="12" value="<%= deal.getE02DEAACC().trim()%>" readonly>
            </td>
            <td nowrap width="18%" align="right">Tipo de Operación : </td>
            <td nowrap width="20%" >
              <select name="E02DLISBT" disabled>
                <option value="" <% if (!(deal.getE02DLISBT().equals("PA") || deal.getE02DLISBT().equals("SL") || deal.getE02DLISBT().equals("S1") || deal.getE02DLISBT().equals("PR") || deal.getE02DLISBT().equals("RL"))) out.print("selected"); %>></option>
                <option value="PA" <% if(deal.getE02DLISBT().equals("PA")) out.print("selected");%>>Compra Adicional</option>
                <option value="SL" <% if(deal.getE02DLISBT().equals("SL")) out.print("selected");%>>Venta</option>
                <option value="S1" <% if(deal.getE02DLISBT().equals("S1")) out.print("selected");%>>Re-Venta</option>
                <option value="PR" <% if(deal.getE02DLISBT().equals("PR")) out.print("selected");%>>Re-Compra</option>
                <option value="RL" <% if(deal.getE02DLISBT().equals("RL")) out.print("selected");%>>Liberar Custodia</option>
              </select>
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Banco/Sucursal/Moneda/Cuenta : </td>
            <td nowrap width="23%" >
            	<input type="text" name="E02DEABNK" size="3" maxlength="2" value="<%= deal.getE02DEABNK().trim()%>" readonly>
            	<input type="text" name="E02DEABRN" size="5" maxlength="4" value="<%= deal.getE02DEABRN().trim()%>" readonly>
            	<input type="text" name="E02DEACCY" size="4" maxlength="3" value="<%= deal.getE02DEACCY().trim()%>" readonly>
            	<input type="text" name="E02DEAGLN" size="17" maxlength="16" value="<%= deal.getE02DEAGLN().trim()%>" readonly>
            </td>
            <td nowrap align="right" width="18%">Valor Nominal :</td>
            <td nowrap width="20%">
            	<input type="text" name="E02DLIFCV" size="18" maxlength="17" value="<%= deal.getE02DLIFCV().trim()%>" readonly>
            </td>
          </tr>
          <% if (deal.getE02DEADLC().equals("B")) {%>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Precio : </td>
            <td nowrap width="23%" >
            	<input type="text" name="E02DLIPRC" size="18" maxlength="17" value="<%= deal.getE02DLIPRC().trim()%>" readonly>
            </td>
            <td nowrap width="18%" align="right">Saldo Neto : </td>
            <td nowrap width="20%">
            	<input type="text" name="E02DLINET" size="18" maxlength="17" value="<%= deal.getE02DLINET().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Tasa : </td>
            <td nowrap width="23%">
            	<input type="text" name="E02DEARTE" size="18" maxlength="17" value="<%= deal.getE02DEARTE().trim()%>" readonly>
            </td>
            <td nowrap width="18%" align="right">Prima / Descuento : </td>
            <td nowrap width="20%">
            	<input type="text" name="E02DEATDM" size="18" maxlength="17" value="<%= deal.getE02DEATDM().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Fecha Ultimo Cupón : </td>
            <td nowrap width="23%" >
            	<eibsinput:date name="deal" fn_month="E02DEALIM" fn_day="E02DEALID" fn_year="E02DEALIY" readonly="true"/>
            </td>	
           <td nowrap  width="18%" align="right">Interés Acumulado : </td>
            <td nowrap width="20%">
            	<input type="text" name="E02DLIINT" size="18" maxlength="17" value="<%= deal.getE02DLIINT().trim()%>" readonly>
            </td>
          </tr>
          <% } else { %>
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Precio : </td>
            <td nowrap width="23%" >
            	<input type="text" name="E02DLIPRC" size="18" maxlength="17" value="<%= deal.getE02DLIPRC().trim()%>" readonly>
            </td>
            <td nowrap width="18%" align="right">Cantidad : </td>
           <td nowrap width="20%">
            	<input type="text" name="E02DEAQTY" size="18" maxlength="17" value="<%= deal.getE02DEAQTY().trim()%>" readonly>
           </td> 	
          </tr>
          <% } %>          
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Tipo de Inversión :</td>
            <td nowrap width="23%">
            	<input type="text" name="E02DEAUC6" size="5" maxlength="4" value="<%= deal.getE02DEAUC6().trim()%>" readonly>
            	<%= deal.getD02DEAUC6().trim()%>
            </td>
            <td nowrap width="18%" align="right">Tipo de Portafolio : </td>
            <td nowrap width="20%">
            	<select name="E02DEALNC" disabled >
                  <option value="" <% if(deal.getE02DEALNC().equals("")) out.print("selected");%>></option>
                  <option value="1" <% if(deal.getE02DEALNC().equals("1")) out.print("selected");%>>Al Vencimiento</option>
                  <option value="2" <% if(deal.getE02DEALNC().equals("2")) out.print("selected");%>>Disponible para Venta</option>
				  <option value="3" <% if(deal.getE02DEALNC().equals("3")) out.print("selected");%>>Intercambio</option>
                </select> 
            </td>
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Producto :</td>
            <td nowrap width="23%">
              <input type="text" name="E02DEAPRO" size="5" maxlength="4" value="<%= deal.getE02DEAPRO().trim()%>" readonly>
              <input type="text" name="E02DLSPDS" readonly size="40" maxlength="30" value="<%= deal.getE02DLSPDS().trim()%>" readonly>
            </td>
            <td nowrap width="18%" align="right">Número de CUSIP/ISIN : </td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E02DEACUI" size="13" maxlength="12" value="<%= deal.getE02DEACUI().trim()%>" readonly>
            </td>
          </tr>     
          <% if (deal.getE02DEADLC().equals("B")) { %>       
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Frecuencia de Pago Cupón  :</td>
            <td nowrap width="23%">
            	<input type="text" name="E02DEATRM" size="4" maxlength="3" value="<%= deal.getE02DEATRM().trim()%>" readonly>
              	<select  name="E02DEATRC" disabled>
                	<option value=" " <% if (!(deal.getE02DEATRC().equals("D") ||deal.getE02DEATRC().equals("M")||deal.getE02DEATRC().equals("Y"))) out.print("selected"); %>></option>
                	<option value="D" <% if(deal.getE02DEATRC().equals("D")) out.print("selected");%>>Día(s)</option>
                	<option value="M" <% if(deal.getE02DEATRC().equals("M")) out.print("selected");%>>Mes(es)</option>
                	<option value="Y" <% if(deal.getE02DEATRC().equals("Y")) out.print("selected");%>>Año(s)</option>
              	</select>
            </td>
            <td nowrap width="25%" align="right">Fecha de Vencimiento :</td>
            <td nowrap width="27%">
            	<eibsinput:date name="deal" fn_month="E02DEAMDM" fn_day="E02DEAMDD" fn_year="E02DEAMDY" readonly="true"/>
            </td>	
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Tipo de Cálculo de Interés :</td>
            <td nowrap width="23%">
            	<SELECT name="E02DEAICT" disabled>
					<OPTION value=" "
						<% if (!(deal.getE02DEAICT().equals("1") ||deal.getE02DEAICT().equals("2")||deal.getE02DEAICT().equals("3")||deal.getE02DEAICT().equals("4")||deal.getE02DEAICT().equals("5")||deal.getE02DEAICT().equals("6"))) out.print("selected"); %>></OPTION>
					<OPTION value="1" <% if (deal.getE02DEAICT().equals("1")) out.print("selected"); %>>Actual/actual (en periodo)</OPTION>
					<OPTION value="2" <% if (deal.getE02DEAICT().equals("2")) out.print("selected"); %>>Actual/365</OPTION>
					<OPTION value="3" <% if (deal.getE02DEAICT().equals("3")) out.print("selected"); %>>Actual/365 (366 en bisiesto)</OPTION>
					<OPTION value="4" <% if (deal.getE02DEAICT().equals("4")) out.print("selected"); %>>Actual/360</OPTION>
					<OPTION value="5" <% if (deal.getE02DEAICT().equals("5")) out.print("selected"); %>>30/360</OPTION>
					<OPTION value="6" <% if (deal.getE02DEAICT().equals("6")) out.print("selected"); %>>30E/360</OPTION>
				</SELECT> 
            </td>
            <td nowrap width="25%" align="right">Tasa de Rendimiento :</td>
            <td nowrap width="27%">
            	<input type="text" name="E02DEAMXR" size="13" maxlength="12" value="<%= deal.getE02DEAMXR().trim()%>" readonly> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Periodo de Pago del Cupón :</td>
            <td nowrap width="23%">
            	<input type="text" name="E02DEAROY" size="5" maxlength="4" value="<%= deal.getE02DEAROY().trim()%>" readonly>
            	<SELECT name="E02DEAODA" disabled>
					<OPTION value=" "
						<% if (!(deal.getE02DEAODA().equals("P") ||deal.getE02DEAODA().equals("I")||deal.getE02DEAODA().equals("M") || deal.getE02DEAODA().equals("D") )) out.print("selected"); %>></OPTION>
					<OPTION value="P" <% if (deal.getE02DEAODA().equals("P")) out.print("selected"); %>>Periodos Mensuales(No incluye último día)</OPTION>
					<OPTION value="I" <% if (deal.getE02DEAODA().equals("I")) out.print("selected"); %>>Periodos Mensuales(Incluye último día)</OPTION>
					<OPTION value="M" <% if (deal.getE02DEAODA().equals("M")) out.print("selected"); %>>Mensual(Ultimo Día del Mes)</OPTION>
					<OPTION value="D"<% if (deal.getE02DEAODA().equals("D")) out.print("selected"); %>>	Mensual(Día del mes)</OPTION>
				</SELECT>
            </td>
            <td nowrap width="25%" align="right"></td>
            <td nowrap width="27%">
            </td>
          </tr>
          <% } %>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Número de Custodia :</td>
            <td nowrap width="23%">
				<input type="text" name="E02SFENUM" size="11" maxlength="10" value="<%= deal.getE02SFENUM().trim()%>" onkeypress="enterInteger()" readonly>            
            </td>
            <td nowrap width="25%" align="right">Pignorado / Localización : </td>
            <td nowrap width="27%">
            	<input type="text" name="E02DEALOC" size="40" maxlength="35" value="<%= deal.getE02DEALOC().trim()%>" readonly> 
            </td>
          </tr>          
          <tr id="trclear"> 
            <td nowrap width="21%" align="right">Notas :</td>
            <td nowrap width="23%"><%= deal.getE02DLSOTC().trim()%></td>
            <td nowrap width="18%" align="right">Tesorero :</td>
            <td nowrap width="20%">
            	<input type="text" name="E02DLSUSR" size="11" maxlength="10" value="<%= deal.getE02DLSUSR().trim()%>" readonly>
            	<%= deal.getE02DLSDSC().trim()%>
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
            <td nowrap width="25%" align="right">Tipo de Confirmación : </td>
            <td nowrap width="23%">
            	<select name="E02DEAF03">
                <option value=" " <% if (!(deal.getE02DEAF03().equals("P") ||deal.getE02DEAF03().equals("S")||deal.getE02DEAF03().equals("N"))) out.print("selected"); %>></option>
                <option value="P" <% if (deal.getE02DEAF03().equals("P")) out.print("selected"); %>>Imprimir</option>
                <option value="S" <% if (deal.getE02DEAF03().equals("S")) out.print("selected"); %>>Swift</option>
                <option value="N" <% if (deal.getE02DEAF03().equals("N")) out.print("selected"); %>>Ninguna</option>
              </select> 
            </td>
            <td nowrap width="25%" align="right">Vía de Pago :</td>
            <td nowrap width="27%"> 
               <select name="E02DEAPVI" >
                  <option value="" <% if(deal.getE02DEAPVI().equals("")) out.print("selected");%>></option>
                  <option value="F" <% if(deal.getE02DEAPVI().equals("F")) out.print("selected");%>>Fed</option>
                  <option value="1" <% if(deal.getE02DEAPVI().equals("1")) out.print("selected");%>>Swift MT-103</option>
                  <option value="2" <% if(deal.getE02DEAPVI().equals("2")) out.print("selected");%>>Swift MT-200</option>
				  <option value="3" <% if(deal.getE02DEAPVI().equals("3")) out.print("selected");%>>Swift MT-202</option>
				  <option value="G" <% if(deal.getE02DEAPVI().equals("G")) out.print("selected");%>>Cuenta Contable</option>
				  <option value="R" <% if(deal.getE02DEAPVI().equals("R")) out.print("selected");%>>Cuenta de Detalle</option>				  
                  <option value="C" <% if(deal.getE02DEAPVI().equals("C")) out.print("selected");%>>Cheque Oficial</option>
                  <option value="A" <% if(deal.getE02DEAPVI().equals("A")) out.print("selected");%>>ACH</option>
                </select> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">País de Residencia :</td>
            <td nowrap width="23%">
            	<input type="text" name="E02DEAGCD" size="5" maxlength="4" value="<%= deal.getE02DEAGCD().trim()%>" >
              	<a href="javascript:GetCodeCNOFC('E02DEAGCD','03')"><%=help%></a> 
            </td>
            <td nowrap width="25%" align="right">País de Riesgo  :</td>
            <td nowrap width="27%">
            	<input type="text" name="E02DEAGRC" size="13" maxlength="12" value="<%= deal.getE02DEAGRC().trim()%>" >
              	<a href="javascript:GetCodeCNOFC('E02DEAGRC','03')"><%=help%></a>  
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" align="right">Tasa de Cambio Moneda Extranjera :</td>
            <td nowrap width="23%">
            	<input type="text" name="E02DEAEXR" size="15" maxlength="13" value="<%= deal.getE02DEAEXR().trim()%>" onkeypress="enterSignDecimal()"> 
            </td>
            <td nowrap width="25%" align="right">Centro de Costo :</td>
            <td nowrap width="27%">
            	<input type="text" name="E02DEACCN" size="8" maxlength="6" value="<%= deal.getE02DEACCN().trim()%>" onKeypress="enterInteger()">
              	<a href="javascript:GetCostCenter('E02DEACCN',document.forms[0].E02DEABNK.value)"><%=help%></a> 
            </td>
          </tr>   
          <tr id="trclear"> 
            <td nowrap width="25%" align="right">Agente de Bolsa : </td>
            <td nowrap width="23%" colspan="3"> 
              <input type="text" name="E02DLSBRK" size="5" maxlength="4" value="<%= deal.getE02DLSBRK().trim()%>" >
              <input type="text" name="E02DLSBDS" size="40" maxlength="35" value="<%= deal.getE02DLSBDS().trim()%>" >
              <a href="javascript:GetBrokerT('E02DLSBRK','E02DLSBDS')"><%=help%></a> 
            </td>
            <td nowrap width="25%" align="right"></td>
            <td nowrap width="27%">
            </td>	
          </tr>
        </table>
      </td>
    </tr>
  </table>  

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
          	<input type="text" name="E02REPOPE"  value="<%= deal.getE02REPOPE().trim()%>" size="2" maxlength="2">
          	<input type="text" name="E02REPCON" size="25" maxlength="45"  value="<%= deal.getE02REPCON().trim()%>" 
          	class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E02DLIOBN.value, document.forms[0].E02DLIOCY.value,'E02DLIOGL','E02REPOPE','13')">
      	</td>
      	<td nowrap align="center"> 
          	<input type="text" name="E02DLIOBN" size="2" maxlength="2" value="<%= deal.getE02DLIOBN().trim()%>" onKeypress="enterInteger(event)">
        </td>
      	<td nowrap align="center"> 
          	<input type="text" name="E02DLIOBR" size="5" maxlength="4" value="<%= deal.getE02DLIOBR().trim()%>" 
			class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E02DLIOBN.value,'','','',''); return false;">
      	</td>
      	<td nowrap align="center"> 
          	<input type="text" name="E02DLIOCY" size="3" maxlength="3" value="<%= deal.getE02DLIOCY().trim()%>" 
          	class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E02DLIOBN.value,'','','','')">
      	</td>
      	<td nowrap align="center">
        	<INPUT type="text" name="E02DLIOGL" size="17" maxlength="16" value="<%= deal.getE02DLIOGL().trim()%>" readonly>
		</td>
      	<td nowrap align="center">
        	<INPUT type="text" name="E02DLIOAC" size="13" maxlength="12" value="<%= deal.getE02DLIOAC().trim()%>"
			class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E02DLIOBN.value,'','','','RT')"
			onkeypress="enterInteger(event)">
		</td>
    </tr>
     </table>
     </div>
  </TD>  
</TR>	
</TABLE>    
   <SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables(headTable1,dataTable1,dataDiv1,0,false);
   }
  tableresize();
  window.onresize=tableresize;  
  </SCRIPT>

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
            <td nowrap  colspan="2" align="right"><%= Util.fcolorCCY(deal.getE02DLSAMT1())%></td>
            <td nowrap align="right"><%= Util.fcolorCCY(deal.getE02DLSAMT3())%></td>
            <td nowrap align="right"><b><%= Util.fcolorCCY(deal.getE02DLSAMT2())%></b></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <% 	if (!(deal.getH02SCRCOD().equals("05") || userPO.getPurpose().equals("INQUIRY"))) { %>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%" align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);">
      </td>
    </tr>
  </table>
  <% } %>
	<SCRIPT type="text/javascript">
 		
	<% 	if (deal.getH02SCRCOD().equals("05") || userPO.getPurpose().equals("INQUIRY")) { %>	
		$("#target :input").prop("disabled", true);
		$("a").removeAttr('href');
	<%	} %>	
	</SCRIPT>  
	
  </form>
</body>
</html>
