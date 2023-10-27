<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>

<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Comisiones-Consulta Definición de Cargos Especificos</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "charges" class= "datapro.eibs.beans.ESD020101Message"  scope="session" />

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
 
 
<h3 align="center">Comisiones-Consulta Definición de Cargos Especificos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ESD0201_rt_tables_detail_inq_apr, ESD0201" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0201">

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    
  <h4> </h4>
  
  <% int row = 0; %>
  <table class="tableinfo">
          <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 

            <td nowrap width="25%">
              <div align="right">Código de Comisión :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type=hidden name="E01DDCBNK" readonly size="3" maxlength="2" value="<%=userPO.getHeader1().trim()%>">
                <input type="text" name="E01DDCCDE" readonly size="5" maxlength="4" value="<%=charges.getE01DDCCDE().trim()%>">
                <input type="text" name="E01DDCDSC" size="65" maxlength="60" value="<%=charges.getE01DDCDSC()%>" readonly>
              </div>
            </td>

            <td nowrap width="25%">
              <div align="right">Segmento :</div>
            </td>
            <td nowrap width="25%">
                <input type="text" name="E01DDCSEG" readonly size="5" maxlength="4" value="<%=charges.getE01DDCSEG().trim()%>">
                <input type="text" name="D01DDCSEG" size="35" maxlength="35" value="<%=charges.getD01DDCSEG()%>" readonly>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%">
              <div align="right">Grupo Cargo :</div>
            </td>
            <td nowrap width="25%">
                <input type="text" name="E01DDCGRP" readonly size="5" maxlength="4" value="<%=charges.getE01DDCGRP().trim()%>">
                <input type="text" name="D01DDCGRP" size="35" maxlength="35" value="<%=charges.getD01DDCGRP()%>" readonly>
            </td>
            <td nowrap width="25%">
              <div align="right">Producto :</div>
            </td>
            <td nowrap width="25%">
                <input type="text" name="E01DDCPRD" readonly size="5" maxlength="4" value="<%=charges.getE01DDCPRD().trim()%>">
                <input type="text" name="D01DDCPRD" size="35" maxlength="35" value="<%=charges.getD01DDCPRD()%>" readonly>
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">            
            <td nowrap width="25%">
              <div align="right">Cliente :</div>
            </td>
            <td nowrap width="25%">
                <input type="text" name="E01DDCCUN" readonly size="10" maxlength="9" value="<%=charges.getE01DDCCUN().trim()%>">
                <input type="text" name="D01DDCCUN" size="35" maxlength="35" value="<%=charges.getD01DDCCUN()%>" readonly>
            </td>
            <td nowrap width="25%">
              <div align="right">Cuenta :</div>
            </td>
            <td nowrap width="25%">
                <input type="text" name="E01DDCACC" readonly size="13" maxlength="12" value="<%=charges.getE01DDCACC().trim()%>">
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
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Descripción de la Comisión :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"> 
                <input type="text" name="E01DDCDSC" size="65" maxlength="60" value="<%=charges.getE01DDCDSC()%>" readonly disabled>
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Moneda/Cuenta Contable :</div>
            </td>
            <td nowrap width="18%" > 
				<input type="text" name="E01DDCCCY" size="3" maxlength="3"
					value="<%= charges.getE01DDCCCY() %>" readonly disabled> 
				<input type="text" name="E01DDCGLN" size="18"
					maxlength="16" value="<%= charges.getE01DDCGLN().trim()%>" readonly disabled>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cobro de I.V.A :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
					<input type="radio" name="E01DDCTAX" value="Y" disabled
					<%if (!charges.getE01DDCTAX().equals("N")) out.print("checked"); %>>
				Si 	<input type="radio" name="E01DDCTAX" value="N" disabled
					<%if (charges.getE01DDCTAX().equals("N")) out.print("checked"); %>>
				No
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Cobro G.M.F :</div>
            </td>
            <td nowrap width="18%" > 
					<input type="radio" name="E01DDCGMF" value="Y" disabled
					<%if (!charges.getE01DDCGMF().equals("N")) out.print("checked"); %>>
				Si 	<input type="radio" name="E01DDCGMF" value="N" disabled
					<%if (charges.getE01DDCGMF().equals("N")) out.print("checked"); %>>
				No
            </td>
            <td nowrap width="29%"> 
              <div align="right">Frecuencia :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
					<input type="radio" name="E01DDCFRQ" value="P" disabled
					<%if (!charges.getE01DDCFRQ().equals("T")) out.print("checked"); %>>
				Periodica 	<input type="radio" name="E01DDCFRQ" value="T" disabled
					<%if (charges.getE01DDCFRQ().equals("T")) out.print("checked"); %>>
				Transacción
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Forma de Cobro :</div>
            </td>
            <td nowrap width="18%" > 
					<input type="radio" name="E01DDCCOT" value="T" disabled
					<%if (!charges.getE01DDCCOT().equals("C")) out.print("checked"); %>>
				Transacción 	<input type="radio" name="E01DDCCOT" value="C" disabled
					<%if (charges.getE01DDCCOT().equals("C")) out.print("checked"); %>>
				Consolidado
            </td>
            <td nowrap width="29%"> 
              <div align="right">Medio de Cobro :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
	              <select name="E01DDCCOM" disabled>
	                <option value="M" <%if (charges.getE01DDCCOM().equals("M")) { out.print("selected"); }%>>Manual</option>
	                <option value="A" <%if (charges.getE01DDCCOM().equals("A")) { out.print("selected"); }%>>Automático</option>
	                <option value="B" <%if (charges.getE01DDCCOM().equals("B")) { out.print("selected"); }%>>Ambas</option>
	              </select>
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Valor/Porcentaje de Comisión :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
				<input type="text" name="E01DDCCOA" size="17" maxlength="15" value="<%= charges.getE01DDCCOA() %>"
				  readonly disabled>
				/
				<input type="text" name="E01DDCCOP" size="10" maxlength="9" value="<%= charges.getE01DDCCOP() %>"
				  readonly disabled>
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cobro Sobregira :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCOVD" value="Y" disabled
					<%if (!charges.getE01DDCOVD().equals("N")) out.print("checked"); %>>
				Si 	<input type="radio" name="E01DDCOVD" value="N" disabled
					<%if (charges.getE01DDCOVD().equals("N")) out.print("checked"); %>>
				No
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Porcentaje de Descuento :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
				<input type="text" name="E01DDCPDE" size="10" maxlength="9" value="<%= charges.getE01DDCPDE() %>"
				  readonly disabled>
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Momento de Cobro :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCCTM" value="V" disabled
					<%if (!charges.getE01DDCCTM().equals("A")) out.print("checked"); %>>
				Vencido 	<input type="radio" name="E01DDCCTM" value="A" disabled
					<%if (charges.getE01DDCCTM().equals("A")) out.print("checked"); %>>
				Anticipado
            </td>

          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Método de Cobro de Comisión :</div>
            </td>
            <td nowrap width="18%" > 
	              <select name="E01DDCMTH" disabled>
	                <option value="F" <%if (charges.getE01DDCMTH().equals("F")) { out.print("selected"); }%>>Monto Fijo</option>
	                <option value="P" <%if (charges.getE01DDCMTH().equals("P")) { out.print("selected"); }%>>Porcentaje</option>
	                <option value="E" <%if (charges.getE01DDCMTH().equals("E")) { out.print("selected"); }%>>Escala/Tramos</option>
	              </select>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cobro Generado por :</div>
            </td>
            <td nowrap width="31%" > 
	              <select name="E01DDCTPR" disabled>
	                <option value="1" <%if (charges.getE01DDCTPR().equals("1")) { out.print("selected"); }%>>Comisiones IBS</option>
	                <option value="2" <%if (charges.getE01DDCTPR().equals("2")) { out.print("selected"); }%>>Aplic.Satelite</option>
	                <option value="3" <%if (charges.getE01DDCTPR().equals("3")) { out.print("selected"); }%>>Otro Mod.IBS</option>
	              </select>

            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Monto Mínimo :</div>
            </td>
            <td nowrap width="18%" > 
				<input type="text" name="E01DDCMIN" size="17" maxlength="15" value="<%= charges.getE01DDCMIN() %>"
				  readonly disabled>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Monto Máximo :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
				<input type="text" name="E01DDCMAX" size="17" maxlength="15" value="<%= charges.getE01DDCMAX() %>"
				  readonly disabled>
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Periodo de Cobro de Comisión :</div>
            </td>
            <td nowrap width="18%" > 
	              <select name="E01DDCPER" disabled>
	                <option value="D" <%if (charges.getE01DDCPER().equals("D")) { out.print("selected"); }%>>Diario</option>
	                <option value="W" <%if (charges.getE01DDCPER().equals("W")) { out.print("selected"); }%>>Semanal</option>
	                <option value="B" <%if (charges.getE01DDCPER().equals("B")) { out.print("selected"); }%>>Quincenal</option>
	                <option value="M" <%if (charges.getE01DDCPER().equals("M")) { out.print("selected"); }%>>Mensual</option>
	                <option value="Q" <%if (charges.getE01DDCPER().equals("Q")) { out.print("selected"); }%>>Trimestral</option>
	                <option value="Y" <%if (charges.getE01DDCPER().equals("Y")) { out.print("selected"); }%>>Anual</option>
	              </select>
	              Día:
	              <input type="text" name="E01DDCP01" size="3" maxlength="2" value="<%= charges.getE01DDCP01().trim()%>" readonly disabled>
	              Mes:
	              <input type="text" name="E01DDCP02" size="3" maxlength="2" value="<%= charges.getE01DDCP02().trim()%>" readonly disabled>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Numero de Transacciones con Excepción :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
				<input type="text" name="E01DDCNTE" size="7" maxlength="5" value="<%= charges.getE01DDCNTE() %>"
				  readonly disabled>
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Número Período :</div>
            </td>
            <td nowrap width="18%" > 
				<input type="text" name="E01DDCNPE" size="7" maxlength="5" value="<%= charges.getE01DDCNPE() %>"
				  readonly disabled>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Frecuencia Período :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
	              <select name="E01DDCTPE" disabled>
	                <option value="D" <%if (charges.getE01DDCTPE().equals("D")) { out.print("selected"); }%>>Diario</option>
	                <option value="W" <%if (charges.getE01DDCTPE().equals("W")) { out.print("selected"); }%>>Semanal</option>
	                <option value="B" <%if (charges.getE01DDCTPE().equals("B")) { out.print("selected"); }%>>Quincenal</option>
	                <option value="M" <%if (charges.getE01DDCTPE().equals("M")) { out.print("selected"); }%>>Mensual</option>
	              </select>
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tipo de Persona :</div>
            </td>
            <td nowrap width="18%" > 
	              <select name="E01DDCLGT" disabled>
	                <option value="1" <%if (charges.getE01DDCLGT().equals("1")) { out.print("selected"); }%>>Jurídica</option>
	                <option value="2" <%if (charges.getE01DDCLGT().equals("2")) { out.print("selected"); }%>>Física</option>
	                <option value="B" <%if (charges.getE01DDCLGT().equals("B")) { out.print("selected"); }%>>Ambas</option>
	              </select>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Valida Plaza :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCPLZ" value="Y" disabled
					<%if (!charges.getE01DDCPLZ().equals("N")) out.print("checked"); %>>
				Si 	<input type="radio" name="E01DDCPLZ" value="N" disabled
					<%if (charges.getE01DDCPLZ().equals("N")) out.print("checked"); %>>
				No
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="29%"> 
              <div align="right">Aplica a Portafolio :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCPCK" value="Y" disabled
					<%if (!charges.getE01DDCPCK().equals("N")) out.print("checked"); %>>
				Si 	<input type="radio" name="E01DDCPCK" value="N" disabled
					<%if (charges.getE01DDCPCK().equals("N")) out.print("checked"); %>>
				No
            </td>
            <td nowrap width="29%"> 
              <div align="right">Estado Comisión :</div>
            </td>
            <td nowrap width="31%" > 
					<input type="radio" name="E01DDCSTS" value="A" disabled
					<%if (charges.getE01DDCSTS().equals("A")) out.print("checked"); %>>
				Activo 	<input type="radio" name="E01DDCSTS" value="I" disabled
					<%if (charges.getE01DDCSTS().equals("I")) out.print("checked"); %>>
				Inactivo <input type="radio" name="E01DDCSTS" value="C" disabled
					<%if (charges.getE01DDCSTS().equals("C")) out.print("checked"); %>>
				Cerrado
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Fecha Inicial :</div>
            </td>
            <td nowrap width="18%" > 
    	        <eibsinput:date name="charges" fn_year="E01DDCOPY" fn_month="E01DDCOPM" fn_day="E01DDCOPD" readonly="true"  disabled="true"/>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Fecha Final :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
    	        <eibsinput:date name="charges" fn_year="E01DDCMAY" fn_month="E01DDCMAM" fn_day="E01DDCMAD" readonly="true"  disabled="true"/>
              </div>
            </td>
          </tr>

       
        </table>
      </td>
    </tr>
  </table>


<% if(charges.getH01FLGWK3().equals("A")){ %>    
  <h4><b>Promedio Pactado</b></h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Valor Promedio :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
				<input type="text" readonly name="E01DDCAVG" size="17" maxlength="15" value="<%= charges.getE01DDCAVG() %>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Saldo Promedio :</div>
            </td>
            <td nowrap width="31%" > 
                <select name="E01DDCTAV" disabled>
                  <option value=" " <%if (!(charges.getE01DDCTAV().equals("N") || charges.getE01DDCTAV().equals("G")))
				out.print("selected");%>></option>
                  <option value="N" <%if (charges.getE01DDCTAV().equals("N")) {
				out.print("selected");
				}%>>Promedio 
                  Neto</option>
                  <option value="G" <%if (charges.getE01DDCTAV().equals("G")) {
				out.print("selected");
				}%>>Promedio 
                  Global</option>
                </select>

            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Modo de Cálculo :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
					<input type="radio" disabled name="E01DDCALV" value="Y"
					<%if (!charges.getE01DDCALV().equals("N")) out.print("checked"); %>>
				Una Cuenta 	<input type="radio" disabled name="E01DDCALV" value="N"
					<%if (charges.getE01DDCALV().equals("N")) out.print("checked"); %>>
				Todas las Cuentas
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cuenta a Promediar :</div>
            </td>
            <td nowrap width="31%" > 
            <input type="text" name="E01DDCAAC" size="13" maxlength="12" readonly disabled value="<%= charges.getE01DDCAAC() %>">
            </td>

          </tr>

       
        </table>
      </td>
    </tr>
  </table>
<% } %>

  
  
  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Regresar" onClick="javascript:CheckAcc(100)">
  </div>
</form>
</body>
</html>
