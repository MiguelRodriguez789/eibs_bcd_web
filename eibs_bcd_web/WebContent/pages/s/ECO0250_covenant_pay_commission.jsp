
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO020001Message,datapro.eibs.beans.ECO020002Message"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@page import="com.datapro.constants.Entities"%> 

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Pago Comisiones</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ECO025001Message" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

	   function validar(){
	   
	   	return true;
	   }
	   
  	  function cerrarVentana(){  	
    	alert("Actualización Exitosa!!");  	
		window.open('','_parent','');
		window.close(); 
  	}

</script>


</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Pago de Comisiones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="covenant_pay_commission.jsp,ECO250"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0250" onsubmit="return validar();">
<input type="hidden" name="SCREEN" value="300">
<input type=HIDDEN name="E01PLHBNK"  value="<%= cnvObj.getE01PLHBNK().trim()%>">
<input type=HIDDEN name="E01BCU"  value="<%= currUser.getE01BCU().trim()%>">

<br>
<table id="mainTable" class="tableinfo" align="center" style="width: 1040px">
	<tr>
	<td nowrap valign="top" width="100%">
		<table width="100%">
			<tr id="trclear">
				<td align="right" nowrap width="10%">Codigo Convenio :</td>				
				<td align="left" nowrap width="15%"><%=cnvObj.getE01PLHCDE() %><input type="hidden" name="E01PLHCDE" value="<%=cnvObj.getE01PLHCDE() %>"></td>
				<td align="right" nowrap width="10%">Nro Planilla :</td>
				<td align="left" nowrap width="15%"><%=cnvObj.getE01PLHNUM() %><input type="hidden" name="E01PLHNUM" value="<%=cnvObj.getE01PLHNUM() %>"></td>
				<td align="right" nowrap width="10%">Fecha Emisión :</td>
				<td align="left" nowrap width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),
																 cnvObj.getBigDecimalE01PLHFEM().intValue(),
																 cnvObj.getBigDecimalE01PLHFED().intValue(),
																 cnvObj.getBigDecimalE01PLHFEY().intValue())%></td>
				<td align="right" nowrap width="10%">Estado :</td>
				<td align="left" nowrap width="15%"><%=cnvObj.getE01DSCSTA() %></td>
			</tr>
			<tr id="trclear">
				<td align="right"  nowrap  width="10%">Empleador :</td>
				<td align="left" nowrap width="15%"><%=cnvObj.getE01PLHENM()%></td>
				<td align="right" nowrap width="10%">Identificacion :</td>
				<td align="left" nowrap width="15%"><%=cnvObj.getE01PLHEID()%></td>
				<td align="right" nowrap width="10%">Vencimiento : </td>
				<td align="left" nowrap  width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),
																 cnvObj.getBigDecimalE01PLHFVM().intValue(),
																 cnvObj.getBigDecimalE01PLHFVD().intValue(),
																 cnvObj.getBigDecimalE01PLHFVY().intValue())%></td>
				<td align="right" nowrap width="10%">Oficina Pago :</td>
				<td align="left" nowrap width="15%"><%=cnvObj.getE01PLHBRN()%></td>
			</tr>
			<tr id="trclear">
				<td align="right"  nowrap  width="10%">Cliente Convenio :</td>
				<td align="left" nowrap width="15%"><%=cnvObj.getE01PLHCNM()%></td>
				<td align="right" nowrap width="10%">Identificacion :</td>
				<td align="left" nowrap width="15%"><%=cnvObj.getE01PLHCID()%></td>
				<td align="right" nowrap width="10%">Moneda :</td>
				<td align="left" nowrap  width="15%"><%=cnvObj.getE01PLHRCY() %><input type="hidden" name="E01PLHRCY" value="<%=cnvObj.getE01PLHRCY() %>"></td>
				<td align="right" nowrap width="10%">Total Planilla :</td>
				<td align="left" nowrap  width="15%"><%=cnvObj.getE01PLHPAM() %></td>
			</tr>
		</table>
	</td>
  </tr>
</table>
 <br>
<table id="mainTable" class="tableinfo" align="center" style="width: 1040px">
  <tr>
	<td nowrap valign="top" width="100%">
		<table width="100%">
			<tr id="trdark">
				<td align="center" width="14%">Monto Recibido</td>				
				<td align="center" width="14%">Recibido Aplicado</td>				
				<td align="center" width="14%">Recibido Rechazado</td>				
				<td align="center" width="14%">Pagado de menos</td>				
				<td align="center" width="14%">Monto Impago</td>				
				<td align="center" width="14%">Aportes Pagados</td>				
				<td align="center" width="14%">Pagado por Caja </td>				
			</tr>
			<tr id="trclear">
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHPPG() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHPAP() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHPRE() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHPPN() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHNRP() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHAAM() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHRAM() %></td>
			</tr>
		</table>
      </td>
    </tr>
 </table>


  
<H4>Aportes al Empleador</H4>
  <table  class="tableinfo" align="center" style="width: 1040px">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="trdark"> 
           <td width="20%" > 
              <div align="Center">Factor</div>
           </td>
           <td width="10%" > 
              <div align="Center">Aporte</div>
           </td>
           <td width="20%" > 
              <div align="Center">Base</div>
           </td>
           <td width="10%" > 
              <div align="left">Moneda</div>
           </td>
           <td width="10%" > 
              <div align="Center">Monto</div>
           </td>
           <td width="15%" > 
              <div align="Center">Contabilidad <br> Gastos</div>
           </td>
           <td width="15%" > 
              <div align="Center">Valor <br>Comision</div>
           </td>
          </tr>
 
          <tr id="trclear"> 
            <td width="20%" > 
                 <select name="E03COSAF1" disabled>
                    <option value=" " <% if ((cnvObj.getE01COSAF1().equals("1")||cnvObj.getE01COSAF1().equals("2")||cnvObj.getE01COSAF1().equals("3"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE01COSAF1().equals("1")) out.print("selected"); %>>% Monto Pagado</option>
                    <option value="2" <% if (cnvObj.getE01COSAF1().equals("2")) out.print("selected"); %>>Valor Fijo Transaccion</option>                   
                    <option value="3" <% if (cnvObj.getE01COSAF1().equals("3")) out.print("selected"); %>>Valor Fijo Por Planilla</option>                   
                  </select>
           </td>
           <td width="10%" > 
              <div align="Center">1</div>
           </td>
           <td width="20%" > 
                 <select name="E01COSAB1" disabled>
                    <option value=" " <% if (!(cnvObj.getE01COSAB1().equals("1")||cnvObj.getE01COSAB1().equals("2")||cnvObj.getE01COSAB1().equals("3")
                  							 ||cnvObj.getE01COSAB1().equals("4")||cnvObj.getE01COSAB1().equals("5")||cnvObj.getE01COSAB1().equals("6")
                  							 ||cnvObj.getE01COSAB1().equals("7")||cnvObj.getE01COSAB1().equals("9")||cnvObj.getE01COSAB1().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE01COSAB1().equals("1")) out.print("selected"); %>>Cuenta Ahorros</option>
                    <option value="2" <% if (cnvObj.getE01COSAB1().equals("2")) out.print("selected"); %>>Ahorro Vivienda</option>                   
                    <option value="3" <% if (cnvObj.getE01COSAB1().equals("3")) out.print("selected"); %>>Prestamos</option>                   
                    <option value="4" <% if (cnvObj.getE01COSAB1().equals("4")) out.print("selected"); %>>Cuota Participacion</option>                   
                    <option value="5" <% if (cnvObj.getE01COSAB1().equals("5")) out.print("selected"); %>>Creditos Hipotecarios</option>                   
                    <option value="6" <% if (cnvObj.getE01COSAB1().equals("6")) out.print("selected"); %>>Tarjeta Credito</option>                   
                    <option value="7" <% if (cnvObj.getE01COSAB1().equals("7")) out.print("selected"); %>>Seguros</option>                   
                    <option value="9" <% if (cnvObj.getE01COSAB1().equals("9")) out.print("selected"); %>>Todos los Productos</option>                   
                  </select>
            </td>
           <td width="10%" > 
 	 			<eibsinput:help name="cnvObj" property="E01COSAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>"fn_param_one="E01COSAM1" fn_param_two="document.forms[0].E01COSBNK.value"  required="false" readonly="true" />
           </td>
           <td width="10%" > 
 		        <eibsinput:text name="cnvObj" property="E01COSAR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
           </td>
           <td width="15%" > 
 		        <eibsinput:help name="cnvObj" property="E01COSAG1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E01COSAG1" fn_param_two="document.forms[0].E01PLHBNK.value" fn_param_three="document.forms[0].E01BCU.value"  required="false"/>
           </td>
           <td width="15%" > 
 		        <eibsinput:text name="cnvObj" property="E01COSAP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
           </td>
          </tr>
 
          <tr id="trdark"> 
           <td width="20%" > 
           </td>
           <td width="10%" > 
              <div align="Center">2</div>
           </td>
           <td width="20%" > 
                 <select name="E01COSAB2" disabled>
                    <option value=" " <% if (!(cnvObj.getE01COSAB2().equals("1")||cnvObj.getE01COSAB2().equals("2")||cnvObj.getE01COSAB2().equals("3")
                  							 ||cnvObj.getE01COSAB2().equals("4")||cnvObj.getE01COSAB2().equals("5")||cnvObj.getE01COSAB2().equals("6")
                  							 ||cnvObj.getE01COSAB2().equals("7")||cnvObj.getE01COSAB2().equals("8")||cnvObj.getE01COSAB2().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE01COSAB2().equals("1")) out.print("selected"); %>>Cuenta Ahorros</option>
                    <option value="2" <% if (cnvObj.getE01COSAB2().equals("2")) out.print("selected"); %>>Ahorro Vivienda</option>                   
                    <option value="3" <% if (cnvObj.getE01COSAB2().equals("3")) out.print("selected"); %>>Prestamos</option>                   
                    <option value="4" <% if (cnvObj.getE01COSAB2().equals("4")) out.print("selected"); %>>Cuota Participacion</option>                   
                    <option value="5" <% if (cnvObj.getE01COSAB2().equals("5")) out.print("selected"); %>>Creditos Hipotecarios</option>                   
                    <option value="6" <% if (cnvObj.getE01COSAB2().equals("6")) out.print("selected"); %>>Tarjeta Credito</option>                   
                    <option value="7" <% if (cnvObj.getE01COSAB2().equals("7")) out.print("selected"); %>>Seguros</option>                   
                    <option value="8" <% if (cnvObj.getE01COSAB2().equals("8")) out.print("selected"); %>>Los Restantes</option>                   
                  </select>
            </td>
            <td width="10%" > 
 	 			<eibsinput:help name="cnvObj" property="E01COSAM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>"fn_param_one="E01COSAM2" fn_param_two="document.forms[0].E01COSBNK.value"  required="false" readonly="true" />
           </td>
           <td width="10%" > 
 		        <eibsinput:text name="cnvObj" property="E01COSAR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
           </td>
           <td width="15%" > 
 		        <eibsinput:help name="cnvObj" property="E01COSAG2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E01COSAG2" fn_param_two="document.forms[0].E01PLHBNK.value" fn_param_three="document.forms[0].E01BCU.value"  required="false"/>
           </td>
           <td width="15%" > 
 		        <eibsinput:text name="cnvObj" property="E01COSAP2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
           </td>
          </tr>
 
          <tr id="trclear"> 
           <td width="20%" > 
           </td>
           <td width="10%" > 
              <div align="Center">3</div>
           </td>
           <td width="20%" > 
                 <select name="E01COSAB3" disabled>
                    <option value=" " <% if (!(cnvObj.getE01COSAB3().equals("1")||cnvObj.getE01COSAB3().equals("2")||cnvObj.getE01COSAB3().equals("3")
                  							 ||cnvObj.getE01COSAB3().equals("4")||cnvObj.getE01COSAB3().equals("5")||cnvObj.getE01COSAB3().equals("6")
                  							 ||cnvObj.getE01COSAB3().equals("7")||cnvObj.getE01COSAB3().equals("8")||cnvObj.getE01COSAB3().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE01COSAB3().equals("1")) out.print("selected"); %>>Cuenta Ahorros</option>
                    <option value="2" <% if (cnvObj.getE01COSAB3().equals("2")) out.print("selected"); %>>Ahorro Vivienda</option>                   
                    <option value="3" <% if (cnvObj.getE01COSAB3().equals("3")) out.print("selected"); %>>Prestamos</option>                   
                    <option value="4" <% if (cnvObj.getE01COSAB3().equals("4")) out.print("selected"); %>>Cuota Participacion</option>                   
                    <option value="5" <% if (cnvObj.getE01COSAB3().equals("5")) out.print("selected"); %>>Creditos Hipotecarios</option>                   
                    <option value="6" <% if (cnvObj.getE01COSAB3().equals("6")) out.print("selected"); %>>Tarjeta Credito</option>                   
                    <option value="7" <% if (cnvObj.getE01COSAB3().equals("7")) out.print("selected"); %>>Seguros</option>                   
                    <option value="8" <% if (cnvObj.getE01COSAB3().equals("8")) out.print("selected"); %>>Los Restantes</option>                   
                  </select>
            </td>
           <td width="10%" > 
 	 			<eibsinput:help name="cnvObj" property="E01COSAM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>"fn_param_one="E01COSAM3" fn_param_two="document.forms[0].E01COSBNK.value"  required="false" readonly="true"/>
           </td>
           <td width="10%" > 
 		        <eibsinput:text name="cnvObj" property="E01COSAR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
           </td>
           <td width="15%" > 
 		        <eibsinput:help name="cnvObj" property="E01COSAG3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E01COSAG3" fn_param_two="document.forms[0].E01PLHBNK.value" fn_param_three="document.forms[0].E01BCU.value"  required="false"/>
           </td>
           <td width="15%" > 
 		        <eibsinput:text name="cnvObj" property="E01COSAP3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
           </td>
          </tr>
 
 
         <tr id="trdark"> 
           <td width="20%" > 
           </td>
           <td width="10%" > 
               <div align="right">Forma de Pago :</div>
           </td>
           <td width="20%" > 
	  			<select name="E01COSAFP" disabled>
                    <option value=" " <% if (!(cnvObj.getE01COSAFP().equals("1")||cnvObj.getE01COSAFP().equals("2")||cnvObj.getE01COSAFP().equals("3"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE01COSAFP().equals("1")) out.print("selected"); %>>Cuenta Cliente</option>
                    <option value="2" <% if (cnvObj.getE01COSAFP().equals("2")) out.print("selected"); %>>Cheque</option>                   
                    <option value="3" <% if (cnvObj.getE01COSAFP().equals("3")) out.print("selected"); %>>Cta Otro Banco</option>                   
                  </select>
           </td>
           <td  width="10%" > 
            </td>
           <td  width="10%" > 
            </td>
           <td width="15%" > 
           </td>
           <td width="15%" > 
           </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>  

<h4>Informacion del Pago Aportes</h4>
<table class="tableinfo" align="center" style="width: 1040px">
  <tr > 
    <td> 
      <table cellspacing=0 cellpadding=2 width="100%" border="0">
      	<tr id="trdark">
            <td width="40%"> 
              <div align="right">Fecha Valor :</div>
            </td>
            <td width="60%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E01VALDTY" fn_month="E01VALDTM" fn_day="E01VALDTD" />
            </td>
          </tr>
      	<tr id="trclear">
            <td width="40%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td width="60%"> 
	  			<eibsinput:text name="cnvObj" property="E01NARRAT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>" />
            </td>
          </tr>
          
          <tr id="trdark"> 	
            <td width="40%" > 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td width="60%" > 
 		        <eibsinput:text name="cnvObj" property="E01COSABK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />
 	 			<eibsinput:help name="cnvObj" property="E01COSABR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" fn_param_one="E01COSABR" fn_param_two="document.forms[0].E01COSABK.value" required="false" />
 	 			<eibsinput:help name="cnvObj" property="E01COSACY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01COSACY" fn_param_two="document.forms[0].E01COSABK.value"  required="false" />
 		        <eibsinput:help name="cnvObj" property="E01COSAGL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E01COSAGL" fn_param_two="document.forms[0].E01COSABK.value" fn_param_three="document.forms[0].E01COSACY.value"  required="false"/>
            </td>
          </tr>
       
           <tr id="trclear"> 
            <td width="40%" > 
              <div align="right">Cuenta de Detalle :</div>
            </td>
            <td width="60%" > 
 				<eibsinput:help name="cnvObj" property="E01COSAAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" fn_param_one="E01COSAAC" fn_param_two="document.forms[0].E01COSABK.value" fn_param_three="RT" />
		        </td>
          </tr>
     
     </table>
   </td>
   </tr>  
 </table>
 
<table align="center" id="TBHELPN">
	<tr>
	<td>
	<div id="DIVSUBMIT" align="center">
		<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
	</div>
	</td>
	</tr>
</table>
	
</form>
</body>
</html>
