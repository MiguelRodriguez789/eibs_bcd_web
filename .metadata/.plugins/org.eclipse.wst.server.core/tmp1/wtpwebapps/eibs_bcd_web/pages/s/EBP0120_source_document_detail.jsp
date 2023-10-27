<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<html>
<head>
<title>Detalle Factura</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EBP0120Record" class="datapro.eibs.beans.EBP012001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </SCRIPT>

<script type="text/javascript">

builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
	init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
}

function goAction(op) {
	document.forms[0].SCREEN.value = op;
    
	if (op == 4) {
		if (!confirm("Esta seguro que desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].submit();
}
</SCRIPT>

</head>

<body >

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
	String read = "";
 	String disabled = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; }	
	if (userPO.getHeader3().equals ("A") && (userPO.getPurpose().equals("MAINTENANCE"))) {
	        read = " readonly ";
		    disabled = " disabled"; 
		  }		  
%>

<h3 align="center">	Documento
					Origen Obligación <% if (userPO.getHeader1().equals("V")) { 
										out.println(" Proveedor "); 
					  } 
					  else if (userPO.getHeader1().equals("C")) {
					                                     out.println(" Cliente "); 
					  }			  
					  else { out.println("  ");
					  } 
				   %>  
				   <% if (userPO.getPurpose().equals("NEW")) { 
										out.println("  - Nueva "); 
					   } 
					   else if (userPO.getPurpose().equals("MAINTENANCE")) {
					                               out.println(" - Mantenimiento "); 
					   }			  
					   else { out.println(" - Consulta ");
					   } 
				   %> 				
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="bills_detail.jsp, EBP0120">
</h3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0120" >
	<input TYPE=HIDDEN name="SCREEN" value="5">
	<input TYPE=HIDDEN name="E01BDCNUM" value="<%= EBP0120Record.getE01BDCNUM().trim()%>">
	<input TYPE=HIDDEN name="E01BDCTYP" value="<%= EBP0120Record.getE01BDCTYP().trim()%>">
	<input TYPE=HIDDEN name="E01BDCSTS" value="<%= EBP0120Record.getE01BDCSTS().trim()%>">
	<input TYPE=HIDDEN name="E01BDCPMD" value="<%= EBP0120Record.getE01BDCPMD().trim()%>">
	<input TYPE=HIDDEN name="userpox" value="<%= userPO.getPurpose()%>"> 
  	<INPUT TYPE=HIDDEN name="REQSTS" value="<%= userPO.getHeader3().trim() %>">
  
<table width="100%"> <tr> <td nowrap>
	<h4><B>Información Básica</B></h4>  
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trclear"> 
				<td nowrap width="10%" align="right">Tipo Documento: </td>
				<td nowrap width="40%" align="left">
                  <eibsinput:cnofc name="EBP0120Record" flag="V1" property="E01BDCKIN" fn_description="E01BDCKIND"  required="true"/>
        	       <eibsinput:text 	name="EBP0120Record" property="E01BDCKIND" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
				<td nowrap align="right" width="18%">Proveedor : </td>
				<td nowrap align="left" width="32%">
						<input type="text" name="E01BDCCOD" maxlength="9" size="10" value="<%= EBP0120Record.getE01BDCCOD().trim()%>" <%= read %>  onkeypress="enterInteger(event)">
					<input type="text" name="E01BDCVEND" size="45"  maxlength="46" value="<%= EBP0120Record.getE01BDCVEND().trim()%>"  readonly>
						<a href="javascript:GetVendorBP('E01BDCCOD','E01BDCVEND')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>	
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
				</td>
			</tr>
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Número Interno : </td>
				<td nowrap width="40%" align="left"> <%= EBP0120Record.getE01BDCNUM().trim()%></td>
				<td nowrap align="right" width="18%">Referencia  :</td>
				<td nowrap align="left" width="32%">
       	       <eibsinput:text 	name="EBP0120Record" property="E01BDCREF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" required="true"/>
			</td>

			</tr>
			<tr id="trclear"> 
				<td nowrap width="10%" align="right"></td>
				<td nowrap width="40%" align="left"></td>
				<td nowrap align="right" width="18%"></td>
				<td nowrap align="left" width="32%"></td>
			</tr>
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Fecha Documento : </td>
				<td nowrap width="40%" align="left">
	               <eibsinput:date name="EBP0120Record" fn_year="E01BDCDD3" fn_month="E01BDCDD2" fn_day="E01BDCDD1" />
  
				</td>    
				<td nowrap align="right" width="18%">Banco :</td>
				<td nowrap align="left" width="32%">
       	       <eibsinput:text 	name="EBP0120Record" property="E01BDCBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" required="true" />
						Oficina :       
                <eibsinput:help name="EBP0120Record" property="E01BDCBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"
               	    	fn_param_one="E01BDCBRN" fn_param_two="document.forms[0].E01BDCBNK.value"/>
						Moneda :
                <eibsinput:help name="EBP0120Record" property="E01BDCCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" required="true"
               	    	fn_param_one="E01BDCCCY" fn_param_two="document.forms[0].E01BDCBNK.value"/>
				</td>
			</tr>
			<tr id="trclear" align="left"> 
				<td nowrap width="10%" align="right">Descripción Documento  : </td>
				<td nowrap width="40%" align="left" >
       	       <eibsinput:text 	name="EBP0120Record" property="E01BDCDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true"/>
				</td>		
				<td nowrap align="right" width="18%">Monto Total :</td>
				<td nowrap align="left" width="32%">
       	       <eibsinput:text 	name="EBP0120Record" property="E01BDCAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="true" readonly="false"/>
				</td>
			</tr>
			
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Observaciones : </td>
				<td nowrap width="40%" align="left"> 
       	       <eibsinput:text 	name="EBP0120Record" property="E01BDCRM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false"/>
              	<BR>
       	       <eibsinput:text 	name="EBP0120Record" property="E01BDCRM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false"/>
				</td>
				<td nowrap align="left" width="18%"> </td>
				<td nowrap align="left" width="32%"> </td>
			</tr>
		</table> 
	</td></tr></table>
	<h4><B>Información Fiscal</B></h4>  
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trclear" align="left"> 
				<td nowrap width="10%" align="right">Tipo Bienes O Sercivios Comprados : </td>
				<td nowrap width="40%" align="left">  
		          <eibsinput:cnofc name="EBP0120Record" flag="V3" property="E01BDCETY" fn_description="E01BDCETYD"  required="true"/>
        	       <eibsinput:text 	name="EBP0120Record" property="E01BDCETYD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
			</td>	
				<td nowrap width="10%" align="right">Origen  : </td>
				<td nowrap width="40%" align="left" >
					<select name="E01BDCLFS" <%= read %>>
						<option <%= EBP0120Record.getE01BDCLFS().trim().equals("L")?"selected":"" %> value="L">Local      </option>
						<option <%= EBP0120Record.getE01BDCLFS().trim().equals("F")?"selected":"" %> value="F">Extranjero  </option>
					</select>
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
				</td>
			</tr>
			<tr id="trdark" align="left"> 
				<td nowrap width="10%" align="right">Cantidad de periodos : </td>
				<td nowrap width="40%" align="left">  
					<input type="text" name="E01BDCPFN" size="5" maxlength="4" value="<%= EBP0120Record.getE01BDCPFN().trim()%>" onkeypress="enterInteger(event)">
				</td>	
				<td nowrap width="10%" align="right">Número de Pagos por Periodo  : </td>
				<td nowrap width="40%" align="left" >
					<input type="text" name="E01BDCPFP" size="5" maxlength="4" value="<%= EBP0120Record.getE01BDCPFP().trim()%>" onkeypress="enterInteger(event)">
				</td>
			</tr>
			<tr id="trclear" align="left"> 
				<td nowrap width="10%" align="right">Año fiscal (aa) : </td>
				<td nowrap width="40%" align="left">  
					<input type="text" name="E01BDCPFY" size="5" maxlength="4" value="<%= EBP0120Record.getE01BDCPFY().trim()%>" onkeypress="enterInteger(event)">
				</td>	
				<td nowrap width="10%" align="right">Monto Pago por Periodo  : </td>
				<td nowrap width="40%" align="left" >
					<input type="text" name="E01BDCPYF" size="20" maxlength="15" value="<%= EBP0120Record.getE01BDCPYF().trim()%>" onkeypress="enterDecimal()">
				</td>
			</tr>

		</table> 
	</td></tr></table>
	<h4><B>Información Entrega</B></h4>  
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark" align="left"> 
				<td nowrap width="10%" align="right">Número de Entregas : </td>
				<td nowrap width="40%" align="left">  
					<input type="text" name="E01BDCDLN" size="5" maxlength="4" value="<%= EBP0120Record.getE01BDCDLN().trim()%>" onkeypress="enterInteger(event)">
				</td>	
				<td nowrap width="10%" align="right"></td>
				<td nowrap width="40%" align="left" >
				</td>
			</tr>
			<tr id="trclear"> 
				<td nowrap width="10%" align="right">Fecha Inicio : </td>
				<td nowrap width="40%" align="left">
	               <eibsinput:date name="EBP0120Record" fn_year="E01BDCST3" fn_month="E01BDCST2" fn_day="E01BDCST1" />
  	
			</td>    
				<td nowrap width="10%" align="right">Fecha Vencimiento : </td>
				<td nowrap width="40%" align="left">
	               <eibsinput:date name="EBP0120Record" fn_year="E01BDCPD3" fn_month="E01BDCPD2" fn_day="E01BDCPD1" />
			</td>    
			</tr>
			<tr id="trdark" align="left"> 
				<td nowrap width="10%" align="right">Requerido por : </td>
				<td nowrap width="40%" align="left">  
       	       <eibsinput:text 	name="EBP0120Record" property="E01BDCNAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false"/>
			</td>	
				<td nowrap width="10%" align="right">Tiempo esperado de Entrega </td>
				<td nowrap width="40%" align="left" >
					<input type="text" name="E01BDCLDT" size="5" maxlength="4" value="<%= EBP0120Record.getE01BDCLDT().trim()%>" onkeypress="enterInteger(event)">
				</td>
			</tr>
			<tr id="trclear" align="left"> 
				<td nowrap width="10%" align="right">Dirección de Entrega  </td>
				<td nowrap width="40%" align="left">  
				</td>	
				<td nowrap width="10%" align="right"></td>
				<td nowrap width="40%" align="left" >
				</td>
			</tr>
			<tr id="trdark" align="left"> 
				<td nowrap width="10%" align="right">Calle : </td>
				<td nowrap width="40%" align="left">  
       	       <eibsinput:text 	name="EBP0120Record" property="E01BDCDA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false"/>
			</td>	
				<td nowrap width="10%" align="right">Residencial/Edificio  : </td>
				<td nowrap width="40%" align="left" >
      	       <eibsinput:text 	name="EBP0120Record" property="E01BDCDA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false"/>
				</td>
			</tr>
			<tr id="trclear" align="left"> 
				<td nowrap width="10%" align="right">Número Casa/Apartamento: </td>
				<td nowrap width="40%" align="left">  
      	       <eibsinput:text 	name="EBP0120Record" property="E01BDCDA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false"/>
				</td>	
				<td nowrap width="10%" align="right">Provincia  : </td>
				<td nowrap width="40%" align="left" >
		          <eibsinput:cnofc name="EBP0120Record" flag="PV" property="E01BDCSTE" fn_description="E01BDCSTED"  required="false"/>
        	       <eibsinput:text 	name="EBP0120Record" property="E01BDCSTED" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
			</td>
			</tr>
			<tr id="trdark" align="left"> 
				<td nowrap width="10%" align="right">Distrito : </td>
				<td nowrap width="40%" align="left">  
		          <eibsinput:cnofc name="EBP0120Record" flag="PI" property="E01BDCDPI" fn_description="E01BDCDPID"  required="false"/>
        	       <eibsinput:text 	name="EBP0120Record" property="E01BDCDPID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>	
				<td nowrap width="10%" align="right">Corregimiento  : </td>
				<td nowrap width="40%" align="left" >
		          <eibsinput:cnofc name="EBP0120Record" flag="PE" property="E01BDCDPE" fn_description="E01BDCDPED"  required="false"/>
        	       <eibsinput:text 	name="EBP0120Record" property="E01BDCDPED" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>

				</td>
			</tr>

		</table> 
	</td></tr></table>
	<h4><B>Información para El Pago</B></h4>  
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trclear"> 
				<td nowrap width="10%" align="right">Forma de Pago : </td>
				<td nowrap width="40%" align="left"> 
					<select name="E01BDCPVI" <%= read %>>
						<option <%= EBP0120Record.getE01BDCPVI().trim().equals("")?"selected":"" %> value="">                   </option>
						<option <%= EBP0120Record.getE01BDCPVI().trim().equals("A")?"selected":"" %> value="A">ACH              </option>
						<option <%= EBP0120Record.getE01BDCPVI().trim().equals("R")?"selected":"" %> value="R">Cuenta Corriente </option>
						<option <%= EBP0120Record.getE01BDCPVI().trim().equals("G")?"selected":"" %> value="G">Cuenta Contable  </option>
						<option <%= EBP0120Record.getE01BDCPVI().trim().equals("C")?"selected":"" %> value="C">Cheque Gerencia  </option>
						<option <%= EBP0120Record.getE01BDCPVI().trim().equals("S")?"selected":"" %> value="S">Swift            </option>
						<option <%= EBP0120Record.getE01BDCPVI().trim().equals("F")?"selected":"" %> value="F">Transferencia    </option>
					</select>
				</td>
				<td nowrap width="10%" align="right">Frecuencia de Pago : </td>
				<td nowrap width="40%" align="left"> 
					<select name="E01BDCPFR" <%= read %>>
						<option <%= EBP0120Record.getE01BDCPFR().trim().equals("O")?"selected":"" %> value="O">Un Pago       </option>
						<option <%= EBP0120Record.getE01BDCPFR().trim().equals("W")?"selected":"" %> value="W">Semanal       </option>
						<option <%= EBP0120Record.getE01BDCPFR().trim().equals("B")?"selected":"" %> value="B">Quincenal     </option>
						<option <%= EBP0120Record.getE01BDCPFR().trim().equals("M")?"selected":"" %> value="M">Mensual       </option>
						<option <%= EBP0120Record.getE01BDCPFR().trim().equals("Q")?"selected":"" %> value="Q">Trimestral    </option>
						<option <%= EBP0120Record.getE01BDCPFR().trim().equals("Y")?"selected":"" %> value="Y">Anual         </option>
						<option <%= EBP0120Record.getE01BDCPFR().trim().equals("P")?"selected":"" %> value="P">Plan de Pagos </option>
					</select>
				</td>
			</tr> 
			<tr id="trdark" align="left"> 
				<td nowrap width="10%" align="right">Numero de Pagos : </td>
				<td nowrap width="40%" align="left">  
					<input type="text" name="E01BDCPYN" size="5" maxlength="4" value="<%= EBP0120Record.getE01BDCPYN().trim()%>" onkeypress="enterInteger(event)">
				</td>	
				<td nowrap width="10%" align="right"> </td>
				<td nowrap width="40%" align="left" >
				</td>
			</tr>
		</table>  
	</td></tr></table>

	<h4><B>Información Contable</B> </h4>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trclear"> 
				<td nowrap width="10%" align="right">Amortización : </td>
				<td nowrap width="40%" align="left"> 
					<input type="radio" name="E01BDCAMC" <%= read %> value="Y" <% if (EBP0120Record.getE01BDCAMC().equals("Y")) out.print("checked"); %>>
					Si 
					<input type="radio" name="E01BDCAMC" <%= read %> value="N" <% if (EBP0120Record.getE01BDCAMC().equals("N")) out.print("checked"); %>>
					No          
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></td>
				<td nowrap width="10%" align="right">Numero de meses de Amortización : </td> 
				<td nowrap width="40%" align="left">
					<input type="text" name="E01BDCAMS" maxlength="3" size="4" <%= read %> value="<%= EBP0120Record.getE01BDCAMS().trim()%>">
				</td>
			</tr>
			<tr id="trdark"> 
				<td nowrap width="10%" align="right"> </td>
				<td nowrap width="40%" align="left">
				</td>
				<td nowrap width="10%" align="right">Comenzar Amortización en  </td>
				<td nowrap width="40%"align="left"> Año: <input type="text" name="E01BDCAYY" maxlength="4" size="4" <%= read %> value="<%= EBP0120Record.getE01BDCAYY().trim()%>">
    	              								Mes: <input type="text" name="E01BDCAMM" maxlength="2" size="3" <%= read %> value="<%= EBP0120Record.getE01BDCAMM().trim()%>">
				</td>	   
			</tr>
		</table>
	</td></tr></table>
	<h4><B>Información Presupuesto</B> </h4>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Identificación Presupuesto : </td>
				<td nowrap width="40%" align="left">
        	       <eibsinput:text 	name="EBP0120Record" property="E01BDCBID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="false"/>

				</td>	
				<td nowrap width="10%" align="right">Código Presupuestario del MEF : </td> 
				<td nowrap width="40%" align="left">
        	       <eibsinput:text 	name="EBP0120Record" property="E01BDCBCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE%>" readonly="false"/>
				</td>
			</tr>
		</table>
	</td></tr></table>
	
	<h4><B>Información Penalización</B> </h4>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">% por Incumplimiento Fecha Entrega : </td>
				<td nowrap width="40%" align="left">
        	       <eibsinput:text 	name="EBP0120Record" property="E01BDCPPF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" readonly="false"/>
				</td>	
				<td nowrap width="10%" align="right">% por Servicio No Conforme : </td> 
				<td nowrap width="40%" align="left">
        	       <eibsinput:text 	name="EBP0120Record" property="E01BDCPPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" readonly="false"/>
				</td>
			</tr>
		</table>
	</td></tr></table>
	
	
	<h6></h6>

	<% if (userPO.getHeader3().equals("A")) { 
		if (!EBP0120Record.getE01BDCPMD().equals("0")) {%>
	<h4><B>Información Suspensión</B></h4> 
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Suspendido en Fecha : </td>
				<td nowrap width="40%" align="left">
	               <eibsinput:date name="EBP0120Record" fn_year="E01BDCSD3" fn_month="E01BDCSD2" fn_day="E01BDCSD1" />
				</td>
				<td nowrap width="10%" align="right">Razón de Suspensión : </td> 
				<td nowrap width="40%" align="left">
		          <eibsinput:cnofc name="EBP0120Record" flag="V5" property="E01BDCSDS" fn_description="E01BDCSDSD"  required="false"/>
        	       <eibsinput:text 	name="EBP0120Record" property="E01BDCSDSD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
			</td>
			</tr>
		</table>		
	</td></tr></table>
	<% }
    } %>
    <h5></h5>
    <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Estado : </td>
				<td nowrap width="40%" align="left"><%= EBP0120Record.getE01BDCSTSD().trim()%></td>
				<td nowrap width="10%" align="right"> </td> 
				<td nowrap width="40%">Fecha Aprobación/Fecha Rechazo : <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), EBP0120Record.getE01BDCSD1(),EBP0120Record.getE01BDCSD2(),EBP0120Record.getE01BDCSD3())%></td>
			</tr>
		</table>		
	</td></tr></table>
	<% if (!userPO.getPurpose().equals("INQUIRY")) {%>
	<h5></h5>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table width="100%">
			<tr>
				<td width="33%" align="center"> 
					<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(6);" >
				</td>
				<td width="33%" align="center"> 
					<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
				</td>
				<td width="34%" align="center"> 
					<input id="EIBSBTN" type=submit name="Exit" value="Salir" onClick="goAction(2);" >
				</td>
			</tr>	
		</table>
	</td></tr></table>
	<% } %>


</td>	</tr>	</table>
</form>
</body>
</html>
