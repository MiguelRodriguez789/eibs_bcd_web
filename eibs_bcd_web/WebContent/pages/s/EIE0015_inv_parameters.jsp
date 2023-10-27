<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.EIE001501Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<SCRIPT type="text/javascript">

<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"));
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
 	String disabledMnt = (userPO.getPurpose().equals("NEW")?"":" disabled");
 	if (isInquiry) {
 	  help = "";
 	}
%>

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		}
	submitForm();
}

</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%>

<h3 align="center">Mantenimiento de Parámetros de Inversiones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="inv_parameters.jsp, EIE0015"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0015" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="trdark">
				<td nowrap width=10% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01IVSBNK" size="3" maxlength="3" value="<%= msgRcd.getE01IVSBNK() %>" onkeypress="enterInteger(event)" <%= readMnt%>>
					<%=mandatory %>
				</td>
            	<td nowrap width=10% align="right">Descripción : </td>
            	<td nowrap width=40% align="left">
            		<input type="text" name="E01BNKDSC" size="40" maxlength="35" value="<%= msgRcd.getE01BNKDSC() %>" readonly>
       			</td>
	  		</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Método Contable : </td>
				<td nowrap width=40% align="left">
				<select name="E01IVSBKM" <%=disabled%>>
                	<option value="1" <%if (msgRcd.getE01IVSBKM().equals("1")) { out.print("selected"); }%>>FIFO</option>
                	<option value="2" <%if (msgRcd.getE01IVSBKM().equals("2")) {  out.print("selected"); }%>>LIFO</option>
                	<option value="3" <%if (msgRcd.getE01IVSBKM().equals("3")) {  out.print("selected"); }%>>Costo Promedio</option>
              	</select><%=mandatory %>	
				</td>
				<td nowrap width=10% align="right">Tipo de Orden por Defecto : </td>
				<td  nowrap width=40% align="left">
					<input type="text" name="E01IVSOTY" size="5" maxlength="4" value="<%=msgRcd.getE01IVSOTY()%>" <%= read %>>
            		<input type="text" name="E01DSCOTY" size="50" maxlength="45"  value="<%=msgRcd.getE01DSCOTY()%>" readonly><%=mandatory %>
            		<a href="javascript:GetCodeDescCNOFC('E01IVSOTY','E01DSCOTY','04')"><%=help%></a>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width=10% align="right">Días por Adelantado para <br>Cancelar Ordenes Pendientes : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01IVSDYS" size="4" maxlength="3" value="<%= msgRcd.getE01IVSDYS() %>" onkeypress="enterInteger(event)" <%= read %>>	
					<%=mandatory %>
				</td>
            	<td nowrap width=10% align="right">Moneda por Defecto para <br>Estado de Cuentas : </td>
            	<td  nowrap width=40% align="left">
            		<select name="E01IVSDCY" <%=disabled%>>
                  <option value="B" <%if (msgRcd.getE01IVSDCY().equals("B")) { out.print("selected"); }%>>Moneda Base</option>
                  <option value="I" <%if (msgRcd.getE01IVSDCY().equals("I")) {  out.print("selected"); }%>>Moneda del Instrumento</option>
                  <option value="P" <%if (msgRcd.getE01IVSDCY().equals("P")) {  out.print("selected"); }%>>Moneda del Portafolio</option>
                </select><%=mandatory %>
       			</td>
	  		</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Tabla de Cargos para Custodia : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01IVSCUT" size="4" maxlength="2" value="<%=msgRcd.getE01IVSCUT()%>" <%= read %>>
					<a href="javascript:GetCommCustodyTable('E01IVSCUT','CST','','')"><%=help%></a>
					<%=mandatory %> 
				</td>
				<td nowrap width=10% align="right">Días por Adelantado para <br>Enviar Mensaje Swift a Agentes : </td>
				<td  nowrap width=40% align="left">
					<input type="text" name="E01IVSDYM" size="4" maxlength="3" value="<%= msgRcd.getE01IVSDYM() %>" onkeypress="enterInteger(event)" <%= read %>>
				</td>
			</tr>
	  		<tr id="trdark">
				<td nowrap width=10% align="right">Período para Cargo de Custodio : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01IVSCFV" size="4" maxlength="3" value="<%= msgRcd.getE01IVSCFV()%>" onkeypress="enterInteger(event)" <%= read %>>
                	<select name="E01IVSCFC" <%=disabled%>>
                  		<option value="D" <%if (msgRcd.getE01IVSCFC().equals("D")) { out.print("selected"); }%>>Dia(s)</option>
                  		<option value="M" <%if (msgRcd.getE01IVSCFC().equals("M")) {  out.print("selected"); }%>>Mes(es)</option>
                  		<option value="Y" <%if (msgRcd.getE01IVSCFC().equals("Y")) {  out.print("selected"); }%>>Año(s)</option>
                	</select>
				</td>
				<td nowrap width=10% align="right">Margen del Precio del Cliente : </td>
				<td  nowrap width=40% align="left">
					<input type="text" name="E01IVSMRG" size="12" maxlength="10" value="<%= msgRcd.getE01IVSMRG() %>" onkeypress="enterRate(event)" <%= read %>>
				</td>
			</tr>
			<tr id="trclear"  > 
             	<td nowrap width="10%" align="right">Máximo Porciento del<br> Valor del Mercado (Solo para Garantías): </td>
              	<td nowrap width="40%" align="left">
              		<input type="text" name="E01IVSFL7" size="12" maxlength="10" value="<%= msgRcd.getE01IVSFL7() %>" onkeypress="enterRate(event)" <%= read %>>
              		Acciones
              		<input type="text" name="E01IVSFL8" size="12" maxlength="10" value="<%= msgRcd.getE01IVSFL8() %>" onkeypress="enterRate(event)" <%= read %>>
              		Bonos
              	</td>
              	<td nowrap width=10% align="right">Método Contable para <br>Ingresos Variables : </td>
				<td  nowrap width=40% align="left">
					<input type="hidden" name="E01IVSFL0" value="<%= msgRcd.getE01IVSFL0()%>">
                	<input type="radio" name="CE01IVSFL0" value="1" onClick="document.forms[0].E01IVSFL0.value='1'"
			  		<%if(msgRcd.getE01IVSFL0().equals("1")) out.print("checked");%> <%=disabled%>>
                	Cantidad 
                	<input type="radio" name="CE01IVSFl0" value="2" onClick="document.forms[0].E01IVSFL0.value='2'"
			  		<%if(msgRcd.getE01IVSFL0().equals("2")) out.print("checked");%> <%=disabled%>>
                	Valor de Mercado 
				</td>
          	</tr>
          	<tr id="trdark">
				<td nowrap width=10% align="right">Días por adelantado para <br>generación de reporte de Cupones : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01IVSFL4" size="4" maxlength="3" value="<%= msgRcd.getE01IVSFL4()%>" onkeypress="enterInteger(event)" <%= read %>>
				</td>
				<td nowrap width=10% align="right">Tipo Aprobación de Compras  : </td>
				<td  nowrap width=40% align="left">
					<input type="hidden" name="E01IVSFL1" value="<%= msgRcd.getE01IVSFL1()%>">
                	<input type="radio" name="CE01IVSFL1" value="1" onClick="document.forms[0].E01IVSFL1.value='1'"
			  		<%if(msgRcd.getE01IVSFL1().equals("1")) out.print("checked");%> <%=disabled%>>
                	Etapa Simple 
                	<input type="radio" name="CE01IVSFl1" value="2" onClick="document.forms[0].E01IVSFL1.value='2'"
			  		<%if(msgRcd.getE01IVSFL1().equals("2")) out.print("checked");%> <%=disabled%>>
                	Dos Etapas de Aprobación (Confirmación de Agente) 
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width=10% align="right">Método de Ingreso de Ordenes : </td>
				<td nowrap width=40% align="left">
                	<select name="E01IVSFL61" <%=disabled%>>
                  		<option value=" " <%if (msgRcd.getE01IVSFL61().equals(" ")) { out.print("selected"); }%>>Flujo Regular o Largo</option>
                  		<option value="1" <%if (msgRcd.getE01IVSFL61().equals("1")) {  out.print("selected"); }%>>Flujo Corto (Un solo Ingreso)</option>
                	</select>
				</td>
				<td nowrap width=10% align="right">Forma de Cálculo de Custodia : </td>
				<td  nowrap width=40% align="left">
					<select name="E01IVSFL62" <%=disabled%>>
                  		<option value="1" <%if (msgRcd.getE01IVSFL62().equals("1")) { out.print("selected"); }%>>Valor Nominal Por Ordenes</option>
                  		<option value="2" <%if (msgRcd.getE01IVSFL62().equals("2")) {  out.print("selected"); }%>>Saldo Posición de portafolio</option>
                	</select>
				</td>
			</tr>
   		</table> 
      </td>  
    </tr>
  </table>
	

	<h4>Información Adicional</h4> 
   	<table class="tableinfo" width=80% height="10%">
   		<tr id="trdark">
			<td nowrap width=10% align="right">Retener Fondos antes de Aprobarlos : </td>
			<td nowrap width="40%" align="left">
				<input type="hidden" name="E01IVSHLD" value="<%= msgRcd.getE01IVSHLD()%>">
                <input type="radio" name="CE01IVSHLD" value="Y" onClick="document.forms[0].E01IVSHLD.value='Y'"
			  		<%if(msgRcd.getE01IVSHLD().equals("Y")) out.print("checked");%> <%=disabled%>>
                	Sí 
                <input type="radio" name="CE01IVSHLD" value="N" onClick="document.forms[0].E01IVSHLD.value='N'"
			  		<%if(msgRcd.getE01IVSHLD().equals("N")) out.print("checked");%> <%=disabled%>>
                	No 
			</td>
			<td nowrap width=10% align="right">Permitir Actualización de la Tasa de Cambio : </td>
			<td nowrap width="40%" align="left">
				<input type="hidden" name="E01IVSUPX" value="<%= msgRcd.getE01IVSUPX()%>">
                <input type="radio" name="CE01IVSUPX" value="Y" onClick="document.forms[0].E01IVSUPX.value='Y'"
			  		<%if(msgRcd.getE01IVSUPX().equals("Y")) out.print("checked");%> <%=disabled%>>
                	Sí 
                <input type="radio" name="CE01IVSUPX" value="N" onClick="document.forms[0].E01IVSUPX.value='N'"
			  		<%if(msgRcd.getE01IVSUPX().equals("N")) out.print("checked");%> <%=disabled%>>
                	No 
			</td>
		</tr>
		<tr id="trclear">
			<td nowrap width=10% align="right">Incluir Futuras Transacciones en Estado de Cuentas : </td>
			<td nowrap width="40%" align="left">
				<input type="hidden" name="E01IVSFUT" value="<%= msgRcd.getE01IVSFUT()%>">
                <input type="radio" name="CE01IVSFUT" value="Y" onClick="document.forms[0].E01IVSFUT.value='Y'"
			  		<%if(msgRcd.getE01IVSFUT().equals("Y")) out.print("checked");%> <%=disabled%>>
                	Sí 
                <input type="radio" name="CE01IVSFUT" value="N" onClick="document.forms[0].E01IVSFUT.value='N'"
			  		<%if(msgRcd.getE01IVSFUT().equals("N")) out.print("checked");%> <%=disabled%>>
                	No 
			</td>
			<td nowrap width=10% align="right">Permitir Reversar Ordenes ya Procesadas : </td>
			<td nowrap width="40%" align="left">
				<input type="hidden" name="E01IVSREV" value="<%= msgRcd.getE01IVSREV()%>">
                <input type="radio" name="CE01IVSREV" value="Y" onClick="document.forms[0].E01IVSREV.value='Y'"
			  		<%if(msgRcd.getE01IVSREV().equals("Y")) out.print("checked");%> <%=disabled%>>
                	Sí 
                <input type="radio" name="CE01IVSREV" value="N" onClick="document.forms[0].E01IVSREV.value='N'"
			  		<%if(msgRcd.getE01IVSREV().equals("N")) out.print("checked");%> <%=disabled%>>
                	No 
			</td>
		</tr>		
		<tr id="trdark">
			<td nowrap width=10% align="right">Cuentas del Banco para Entradas de Compras/Ventas : </td>
			<td nowrap width="40%" align="left">
				<input type="hidden" name="E01IVSFl2" value="<%= msgRcd.getE01IVSFL2()%>">
                <input type="radio" name="CE01IVSFl2" value="Y" onClick="document.forms[0].E01IVSFl2.value='Y'"
			  		<%if(msgRcd.getE01IVSFL2().equals("Y")) out.print("checked");%> <%=disabled%>>
                	Sí 
                <input type="radio" name="CE01IVSFl2" value="N" onClick="document.forms[0].E01IVSFl2.value='N'"
			  		<%if(msgRcd.getE01IVSFL2().equals("N")) out.print("checked");%> <%=disabled%>>
                	No 
			</td>
			<td nowrap width=10% align="right">Incluir Cuenta de Cliente en Transferencia de Posición : </td>
			<td nowrap width="40%" align="left">
				<input type="hidden" name="E01IVSFL3" value="<%= msgRcd.getE01IVSFL3()%>">
                <input type="radio" name="CE01IVSFL3" value="Y" onClick="document.forms[0].E01IVSFL3.value='Y'"
			  		<%if(msgRcd.getE01IVSFL3().equals("Y")) out.print("checked");%> <%=disabled%>>
                	Sí 
                <input type="radio" name="CE01IVSFL3" value="N" onClick="document.forms[0].E01IVSFL3.value='N'"
			  		<%if(msgRcd.getE01IVSFL3().equals("N")) out.print("checked");%> <%=disabled%>>
                	No 
			</td>
		</tr>	
		<tr id="trclear">			
			<td nowrap width="10%" align="right">Cuenta para Dividendos por Pagar : </td>
        	<td nowrap width="40%">
 				<input type="text" name="E01IVSGLN" size="18" maxlength="16" value="<%=msgRcd.getE01IVSGLN().trim()%>" onKeyPress="enterInteger()" <%=read%>>        
 				<a href="javascript:GetLedger('E01IVSGLN',document.forms[0].E01IVSBNK.value,'','')"><%=help%></a> 
 			</td>
            <td nowrap width="10%" align="right">Dias Maximos para Verificar Cambio de Custodiante : </td>
            <td nowrap width="40%">
              	<INPUT type="text" name="E01IVSFL9" size="4" maxlength="3" value="<%= msgRcd.getE01IVSFL9()%>" onKeyPress="enterInteger()" <%=read%>>
            </td>
        </tr>       
        <tr id="trdark">
        	<td nowrap width="10%" align="right">Porcentaje de Tolerancia del Precio de Mercado : </td>
            <td nowrap width="40%">
              	<INPUT type="text" name="E01IVSFL5" size="4" maxlength="3" value="<%= msgRcd.getE01IVSFL5()%>" onKeyPress="enterInteger()" <%=read%>>
            </td>
        	<td nowrap width="10%" align="right">Cuenta Contable para Cupones por Pagar :</td>
            <td nowrap width="40%">
              	<INPUT type="text" name="E01IVSGL1" size="18" maxlength="16" value="<%= msgRcd.getE01IVSGL1()%>" onKeyPress="enterInteger()" <%=read%> >
              <a href="javascript:GetLedger('E01IVSGL1',document.forms[0].E01IVSBNK.value,'','')"><%=help%></a> 
            </td>        	
        </tr>
		<tr id="trclear">
			<td nowrap width="10%" align="right">Días para definir Spot/Forward : </td>
            <td nowrap width="40%">
              <INPUT type="text" name="E01IVSFL66" size="3" maxlength="2" value="<%= msgRcd.getE01IVSFL66()%>" onKeyPress="enterInteger()" <%=read%> >
            </td>        				
			<td nowrap width="10%" align="right">Código Producto Mutuo Pasivo : </td>
            <td nowrap width="40%">
              <INPUT type="text" name="E01US1CD1" size="5" maxlength="4" value="<%= msgRcd.getE01US1CD1()%>" <%=read%>>
              <INPUT type="text" readonly name="E01US1DS1" size="31" maxlength="60" value="<%= msgRcd.getE01US1DS1()%>">
              	<a href="javascript:GetProduct('E01US1CD1','11','','E01US1DS1','','')"><%=help%></a>               
            </td>        				
		</tr>
		<tr id="trdark">
			<td nowrap width="10%" align="right">Cta Contable Transitoria (Mutuos Pasivos) : </td>
            <td nowrap width="40%">
              <INPUT type="text" name="E01FLDGLN" size="17" maxlength="16" value="<%= msgRcd.getE01FLDGLN()%>" onKeyPress="enterInteger()" <%=read%>>
				<a href="javascript:GetLedger('E01FLDGLN',document.forms[0].E01IVSBNK.value,'','')"><%=help%></a>
			</td>        				
			<td nowrap width="10%" align="right">Código Producto Mutuo Activo : </td>
            <td nowrap width="40%">
              <INPUT type="text" name="E01US1CD2" size="5" maxlength="4" value="<%= msgRcd.getE01US1CD2()%>" >
              <INPUT type="text" readonly name="E01US1DS2" size="31" maxlength="60" value="<%= msgRcd.getE01US1DS2()%>">
              	<a href="javascript:GetProduct('E01US1CD2','11','','E01US1DS2','','')"><%=help%></a>               
            </td>        				
		</tr>
		<tr id="trclear">
			<td nowrap width="10%" align="right">Cta Contable Transitoria (Mutuos Activos) : </td>
            <td nowrap width="40%">
              <INPUT type="text" name="E01FLDGLA" size="17" maxlength="16" value="<%= msgRcd.getE01FLDGLA()%>" onKeyPress="enterInteger()" <%=read%>>
				<a href="javascript:GetLedger('E01FLDGLA',document.forms[0].E01IVSBNK.value,'','')"><%=help%></a>
			</td>        				
			<td nowrap width="10%" align="right">Código Broker Comision Mtto. : </td>
            <td nowrap width="40%">
              <INPUT type="text" name="E01US1CD3" size="5" maxlength="4" value="<%= msgRcd.getE01US1CD3()%>" >
              <INPUT type="text" readonly name="E01US1DS3" size="31" maxlength="60" value="<%= msgRcd.getE01US1DS3()%>">
              <a href="javascript:GetCustodian('E01US1CD3','E01US1DS3')"><%=help%></a>             
            </td>        				
		</tr>				
   	</table>
   	
<br>
	
	<table width="100%">		
  	<tr>
  		<td width="50%">
  		<%if (!isInquiry) {%>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<%if (!isInquiry) {%>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right"> </td>
            <td nowrap align="left" width="35%">
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01IVSLMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right"> </td>
			<td nowrap width="35%" align="left"> 
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01IVSLMM()),Integer.parseInt(msgRcd.getE01IVSLMD()),Integer.parseInt(msgRcd.getE01IVSLMY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right"> </td>
			<td nowrap width="35%" align="left">
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01IVSLMT()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  
</form>
</body>

	<SCRIPT type="text/javascript">
	<%if (isInquiry) {%>
		readOnlyPage();
	<% } %>		
	</SCRIPT>

</html>
