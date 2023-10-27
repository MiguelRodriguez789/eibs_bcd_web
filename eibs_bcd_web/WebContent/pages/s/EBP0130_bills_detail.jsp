<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Detalle Factura</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EBP0130Record" class="datapro.eibs.beans.EBP013001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
    
	if (op == 4) {
		if (!confirm("Esta seguro que desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].submit();
}

function UpdateTotal(fld, value) {
	if (isNaN(value)) {
		value = 0.00;
	}
	var val = 0.00; 
	var net = 0.00;
	var iva = 0.00;
	try {
		val = parseFloat(value.replace(/,/g,''));
	} catch (err) {
		val = 0.00;
	}
	if (isNaN(val))
		val = 0.00;
	if (fld == "N")
	{
		net = parseFloat(value.replace(/,/g,''));
		try 
		{
			iva = parseFloat(document.forms[0].E01BPBIVA.value.replace(/,/g,''));
		} catch (exception) {
			iva = 0.00;
		}
	}
	if (fld == "I")
	{
		iva = parseFloat(value.replace(/,/g,''));
		try 
		{
			net = parseFloat(document.forms[0].E01BPBNTA.value.replace(/,/g,''));
		} catch (exception) {
			net = 0.00;
		}
	}
		if (isNaN(net)) {
			net = 0;
		}
		if (isNaN(iva)) {
			iva = 0;
		}
		val = net + iva;
		document.forms[0].E01BPBBAM.value = formatCCY(val + "");
		document.forms[0].E01BPBNTA.value = formatCCY(net + "");
		document.forms[0].E01BPBIVA.value = formatCCY(iva + "");
}
function goGl() {
	//isCheck();
    pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0136?SCREEN=1&DOCUMENTO=" + document.getElementById("E01BPBNUM").value;
    window.location.href=pg;
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

<h3 align="center">	Factura
					<% if (userPO.getHeader1().equals("V")) { 
										out.println(" Proveedor "); 
					  } 
					  else if (userPO.getHeader1().equals("C")) {
					                                     out.println(" Cliente "); 
					  }			  
					  else { out.println(" Con Documento Origen ");
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
	name="EIBS_GIF" title="bills_detail.jsp, EBP0130">
</h3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0130" >
	<input TYPE=HIDDEN name="SCREEN" value="5">
	<input TYPE=HIDDEN name="E01BPBNUM" value="<%= EBP0130Record.getE01BPBNUM().trim()%>" id="E01BPBNUM">
	<input TYPE=HIDDEN name="E01BPBTYP" value="<%= EBP0130Record.getE01BPBTYP().trim()%>">
	<input TYPE=HIDDEN name="E01BPBSTS" value="<%= EBP0130Record.getE01BPBSTS().trim()%>">
	<input TYPE=HIDDEN name="E01BPBPMD" value="<%= EBP0130Record.getE01BPBPMD().trim()%>">
	<input TYPE=HIDDEN name="userpox" value="<%= userPO.getPurpose()%>"> 
	<INPUT TYPE=HIDDEN name="E01REQTYP" value="<%= userPO.getHeader1().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQORD" value="<%= userPO.getHeader2().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQSTS" value="<%= userPO.getHeader3().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQFRM" value="<%= userPO.getHeader4().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQPD1" value="<%= userPO.getHeader5().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQPD2" value="<%= userPO.getHeader6().trim() %>">
	<INPUT TYPE=HIDDEN name="E01REQPD3" value="<%= userPO.getHeader7().trim() %>">

<table width="100%"> <tr> <td nowrap>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		
		<table class="tableinfo" cellspacing="0" width="100%" border="0" >
			<tr id="trdark"> 
				<td nowrap width="5%" align="right">Número Interno : </td>
				<td nowrap width="5%" align="left"> <%= EBP0130Record.getE01BPBNUM().trim()%></td>
				<td nowrap width="5%" align="right">Proveedor : </td>
				<td nowrap width="60%" align="left"> 
					<input type="text" name="E01BPBCOD" maxlength="9" size="10" value="<%= EBP0130Record.getE01BPBCOD().trim()%>" <%= read %>  onkeypress="enterInteger(event)">
					<input type="text" name="E01BPBVCN" size="45"  maxlength="46" value="<%= EBP0130Record.getE01BPBVCN().trim()%>"  readonly>
						<a href="javascript:GetVendorBP('E01BPBCOD','E01BPBVCN')">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>	
						<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
				</td>
				<td nowrap width="25%">Fecha de Ingreso : <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), EBP0130Record.getE01REQPDM(),EBP0130Record.getE01REQPDD(),EBP0130Record.getE01REQPDY())%></td>
			</tr>
		</table>
	</td></tr></table>
	<h4><B>Información Básica</B></h4>  
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Referencia Factura :</td>
				<td nowrap width="40%" align="left">
       	       <eibsinput:text 	name="EBP0130Record" property="E01BPBBIL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" required="true"/>
			</td>
				<td nowrap width="10%" align="right">Tipo : </td>
				<td nowrap width="20%" align="left"> <%= EBP0130Record.getE01BPBTYPD().trim()%> 
			  	<% if (userPO.getHeader1().equals("C") )  { %>	
					<INPUT type="text" name="E01BPBCUN" maxlength="9" size="10" <%= read %> value="<%= EBP0130Record.getE01BPBCUN().trim()%>" onkeypress="enterDecimal(event, 2)">
				    	<A href="javascript:GetCustomerDescId('E01BPBCUN','E01BPBRM1','')" > 
			    		<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
			    		</A> 
				  <%} %>  	
				</td>
			</tr>
			<tr id="trclear"> 
				<td nowrap width="10%" align="right">Banco :</td>
				<td nowrap width="40%" align="left">
       	       <eibsinput:text 	name="EBP0130Record" property="E01BPBBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" required="true" />
						Oficina :       
                <eibsinput:help name="EBP0130Record" property="E01BPBBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"
               	    	fn_param_one="E01BPBBRN" fn_param_two="document.forms[0].E01BPBBNK.value"/>
						Moneda :
                <eibsinput:help name="EBP0130Record" property="E01BPBCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" required="true"
               	    	fn_param_one="E01BDCCCY" fn_param_two="document.forms[0].E01BPBBNK.value"/>
				</td>
				<td nowrap width="10%" align="right"><% if (EBP0130Record.getE01BPBTYP().equals("P") )  { %> Documento Origen: <% }%></td>
				<td nowrap width="40%" align="left" ><% if (EBP0130Record.getE01BPBTYP().equals("P") )  { %> 
					<input type="text" name="E01BPBORD" maxlength="12" size="14" <%= read %> value="<%= EBP0130Record.getE01BPBORD().trim()%>"> 
					<A href="javascript:GetSourceDoc('E01BPBORD','E01BPBDSC')" > 
			    		<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
			    		</A>
			    	<% }%>	
				</td>	
			</tr>
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Fecha Factura : </td>
				<td nowrap width="40%" align="left">
	               <eibsinput:date name="EBP0130Record" fn_year="E01BPBIV3" fn_month="E01BPBIV2" fn_day="E01BPBIV1" required="true"/>
			</td>    
				<td nowrap width="10%" align="right">Monto Neto</td>
				<td nowrap width="40%" align="left">
				<eibsinput:text 	name="EBP0130Record" property="E01BPBNTA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onblur="UpdateTotal('N', this.value)" required="true"/>
				</td>
			</tr>
			<tr id="trclear" align="left"> 
				<td nowrap width="10%" align="right">Descripción Factura  : </td>
				<td nowrap width="40%" align="left" >
       	       <eibsinput:text 	name="EBP0130Record" property="E01BPBDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" />
				</td>		
				<td nowrap width="10%" align="right">Monto Iva :</td>
				<td nowrap width="40%" align="left">
       	       <eibsinput:text 	name="EBP0130Record" property="E01BPBIVA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onblur="UpdateTotal('I', this.value)" required="true"/>
				</td>
			</tr>
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Observaciones : </td>
				<td nowrap width="40%" align="left"> 
       	       <eibsinput:text 	name="EBP0130Record" property="E01BPBRM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false"/>
               	<BR>
       	       <eibsinput:text 	name="EBP0130Record" property="E01BPBRM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false"/>
				</td>
				<td nowrap width="10%" align="right">Monto Total : </td>
				<td nowrap width="40%" align="left"> 
				<eibsinput:text 	name="EBP0130Record" property="E01BPBBAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
				</td>
			</tr>
		</table> 
	</td></tr></table>
	<h4><B>Información de Gasto y Fiscal</B></h4>  
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark" align="left"> 
				<td nowrap width="10%" align="right">Tipo Bienes o Servicios Comprados : </td>
				<td nowrap width="20%" align="left">  
                 <eibsinput:cnofc name="EBP0130Record" flag="V3" property="E01BPBETY" fn_description="E01BPBETYD"  required="true"/>
        	       <eibsinput:text 	name="EBP0130Record" property="E01BPBETYD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
			 </td>	
				<td nowrap width="10%" align="right">Origen  : </td>
				<td nowrap width="40%" align="left" >
					<select name="E01BPBLFS" <%= read %>>
						<option <%= EBP0130Record.getE01BPBLFS().trim().equals("L")?"selected":"" %> value="L">Local      </option>
						<option <%= EBP0130Record.getE01BPBLFS().trim().equals("F")?"selected":"" %> value="F">Extranjero  </option>
					</select>
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
				</td>
			</tr>
			<tr id="trclear" align="left"> 
				<td nowrap width="10%" align="right">Cantidad de periodos : </td>
				<td nowrap width="40%" align="left">  
					<input type="text" name="E01BPBPFN" size="5" maxlength="4" value="<%= EBP0130Record.getE01BPBPFN().trim()%>" onkeypress="enterInteger(event)">
				</td>	
				<td nowrap width="10%" align="right">Número de Pagos por Periodo  : </td>
				<td nowrap width="40%" align="left" >
					<input type="text" name="E01BPBPFP" size="5" maxlength="4" value="<%= EBP0130Record.getE01BPBPFP().trim()%>" onkeypress="enterInteger(event)">
				</td>
			</tr>
			<tr id="trdark" align="left"> 
				<td nowrap width="10%" align="right">Año fiscal (aa) : </td>
				<td nowrap width="40%" align="left">  
					<input type="text" name="E01BPBPFY" size="4" maxlength="4" value="<%= EBP0130Record.getE01BPBPFY().trim()%>" onkeypress="enterInteger(event)">
				</td>	
				<td nowrap width="10%" align="right">Monto Pago por Periodo  : </td>
				<td nowrap width="40%" align="left" >
					<input type="text" name="E01BPBPYF" size="20" maxlength="15" value="<%= EBP0130Record.getE01BPBPYF().trim()%>" onkeypress="enterDecimal(event, 2)">
				</td>
			</tr>
		</table> 
	</td></tr></table>
	<h4><B>Información para El Pago</B></h4>  
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Fecha Vencimiento : </td>
				<td nowrap width="40%" align="left"> 
	               <eibsinput:date name="EBP0130Record" fn_year="E01BPBPD3" fn_month="E01BPBPD2" fn_day="E01BPBPD1" required="true"/>
					</td>
				<td nowrap width="10%" align="right">Forma de Pago : </td>
				<td nowrap width="40%" align="left"> 
					<select name="E01BPBPVI" <%= read %>>
						<option <%= EBP0130Record.getE01BPBPVI().trim().equals("")?"selected":"" %> value="">                   </option>
						<option <%= EBP0130Record.getE01BPBPVI().trim().equals("A")?"selected":"" %> value="A">ACH              </option>
						<option <%= EBP0130Record.getE01BPBPVI().trim().equals("R")?"selected":"" %> value="R">Cuenta Corriente </option>
						<option <%= EBP0130Record.getE01BPBPVI().trim().equals("G")?"selected":"" %> value="G">Cuenta Por Pagar </option>
						<option <%= EBP0130Record.getE01BPBPVI().trim().equals("C")?"selected":"" %> value="C">Cheque/Giro      </option>
						<option <%= EBP0130Record.getE01BPBPVI().trim().equals("S")?"selected":"" %> value="S">Swift            </option>
						<option <%= EBP0130Record.getE01BPBPVI().trim().equals("F")?"selected":"" %> value="F">Transferencia       </option>
					</select>
				</td>
			</tr> 
			<tr id="trclear"> 
				<td nowrap width="10%" align="right">Tipo de Pago : </td>
				<td nowrap width="40%" align="left"> 
					<select name="E01BPBPTY" <%= read %>>
						<option <%= EBP0130Record.getE01BPBPTY().trim().equals("F")?"selected":"" %> value="F">Monto Fijo      </option>
						<option <%= EBP0130Record.getE01BPBPTY().trim().equals("V")?"selected":"" %> value="V">Monto Variable  </option>
					</select>
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
				</td>	
				<td nowrap width="10%" align="right">Frecuencia : </td>
				<td nowrap width="40%" align="left"> 
					<select name="E01BPBPFR" <%= read %>>
						<option <%= EBP0130Record.getE01BPBPFR().trim().equals("O")?"selected":"" %> value="O">Una Vez      </option>
						<option <%= EBP0130Record.getE01BPBPFR().trim().equals("W")?"selected":"" %> value="W">Semanal      </option>
						<option <%= EBP0130Record.getE01BPBPFR().trim().equals("B")?"selected":"" %> value="B">Quincenal    </option>
						<option <%= EBP0130Record.getE01BPBPFR().trim().equals("M")?"selected":"" %> value="M">Mensual      </option>
						<option <%= EBP0130Record.getE01BPBPFR().trim().equals("Q")?"selected":"" %> value="Q">Trimestral   </option>
						<option <%= EBP0130Record.getE01BPBPFR().trim().equals("Y")?"selected":"" %> value="Y">Anual        </option>
					</select>
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" border="0" ></td>
			</tr>	
			<tr id="trdark">
				<td nowrap width="10%" align="left"> <b>Si la Frecuencia es diferente de "Una Vez" : </b></td>
				<td nowrap width="40%" align="left"> </td>
				<td nowrap width="10%" align="left"> </td>
				<td nowrap width="40%" align="left"> </td>
			</tr>
			<tr id="trdark">
				<td nowrap width="10%" align="right"> Día de Pago : </td> 
				<td nowrap width="40%" align="left"> 
					<input type="text" size="3" maxlength="2" name="E01BPBDAY" onKeypress="enterInteger(event)" value="<%= EBP0130Record.getE01BPBDAY().trim()%>" <%= read %>>
						<a href="javascript:GetCode('E01BPBDAY','STATIC_rt_ciclo.jsp')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Día" border="0" ></a>
				</td> 
				<td nowrap width="10%" align="right">Inicio Fecha de Pago : </td>
				<td nowrap width="40%" align="left">
	               <eibsinput:date name="EBP0130Record" fn_year="E01BPBID3" fn_month="E01BPBID2" fn_day="E01BPBID1" required="false"/>
			</td>
			</tr>
			<tr id="trclear"> 
				<td nowrap width="10%" align="right">Límites de Pago : </td> 
				<td nowrap width="40%" align="left"> 
					<select name="E01BPBPLI" <%= read %>>
						<option <%= EBP0130Record.getE01BPBPLI().trim().equals("T")?"selected":"" %> value="T">Factura Total</option>
						<option <%= EBP0130Record.getE01BPBPLI().trim().equals("F")?"selected":"" %> value="F">Valor Fijo</option>
						<option <%= EBP0130Record.getE01BPBPLI().trim().equals("P")?"selected":"" %> value="P">Porcentaje</option>
					</select>
				</td>
				<td nowrap width="10%" align="right"> % Tolerancia : </td> 
				<td nowrap width="40%" align="left"> 
    	       	<eibsinput:text name="EBP0130Record" property="E01BPBPER" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" required="false"/>
				<b>(Únicamente si Límite de Pago es "Porcentaje")</b></td>
			</tr>	
			<tr id="trdark">
				<td nowrap width="10%" align="left"> <b>Si Tipo de Pago es "Variable" : </b></td>
				<td nowrap width="40%" align="left"> </td>
				<td nowrap width="10%" align="left"> </td>
				<td nowrap width="40%" align="left"> </td>
			</tr>
			<tr id="trdark">
				<td nowrap width="10%" align="right">Número de Pagos : </td>
				<td nowrap width="40%" align="left">
					<input type="text" name="E01BPBNOP" maxlength="3" size="4" <%= read %> value="<%= EBP0130Record.getE01BPBNOP().trim()%>" onkeypress="enterInteger(event)">
				</td> 
				<td nowrap width="10%" align="right">Monto Mínimo de Pago : </td> 
				<td nowrap width="40%" align="left"> 
    	       	<eibsinput:text name="EBP0130Record" property="E01BPBMAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false"/>
				</td>
			</tr>
		</table>  
	</td></tr></table>
	<% if (userPO.getHeader1().equals("C") )  { %>
	<h5></h5>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Tabla Comisiones : </td>
				<td nowrap width="40%" align="left">  
					<input type="text" name="E01BPBFCO" maxlength="2" size="3" <%= read %> value="<%= EBP0130Record.getE01BPBFCO().trim()%>" onkeypress="enterInteger(event)">        
						<a href="javascript:GetCNTRLPRF('E01BPBFCO','E01BPBFAM')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a>
				</td>
				<td nowrap width="10%" align="right">Monto Comisión : </td> 
				<td nowrap width="40%" align="left">
    	       	<eibsinput:text name="EBP0130Record" property="E01BPBFAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false"/>
			</tr>
		</table>
	</td></tr></table>
	<% } %>

	<h4><B>Información Contable</B> </h4>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Amortización : </td>
				<td nowrap width="40%" align="left"> 
					<input type="radio" name="E01BPBAMC" <%= read %> value="Y" <% if (EBP0130Record.getE01BPBAMC().equals("Y")) out.print("checked"); %>>
					Si 
					<input type="radio" name="E01BPBAMC" <%= read %> value="N" <% if (EBP0130Record.getE01BPBAMC().equals("N")) out.print("checked"); %>>
					No          
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></td>
				<td nowrap width="10%" align="right">Numero de meses de Amortización : </td> 
				<td nowrap width="40%" align="left">
					<input type="text" name="E01BPBAMS" maxlength="3" size="4" <%= read %> value="<%= EBP0130Record.getE01BPBAMS().trim()%>">
				</td>
			</tr>
			<tr id="trclear"> 
				<td nowrap width="10%" align="right">Comenzar Amortización en  </td>
				<td nowrap width="40%"align="left"> Año: <input type="text" name="E01BPBAYY" maxlength="4" size="4" <%= read %> value="<%= EBP0130Record.getE01BPBAYY().trim()%>">
    	              								Mes: <input type="text" name="E01BPBAMM" maxlength="2" size="3" <%= read %> value="<%= EBP0130Record.getE01BPBAMM().trim()%>">
				</td>	
				<td nowrap width="10%" align="right"> </td>
				<td nowrap width="40%" align="left">
				</td>   
			</tr>
		</table>
	</td></tr></table>
	<h4><B>Información Adicional</B> </h4>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Identificación Presupuesto : </td>
				<td nowrap width="40%" align="left">
       	       <eibsinput:text 	name="EBP0130Record" property="E01BPBBID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false"/>
				</td>
				<td nowrap width="10%" align="right">Penalización % por Incumplimiento Fecha Entrega: </td> 
				<td nowrap width="40%" align="left">
       	       <eibsinput:text 	name="EBP0130Record" property="E01BPBBCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" required="false"/>
				</td>
			</tr>
			<tr id="trclear"> 
				<td nowrap width="10%" align="right">Penalización % por Servicio No Conforme : </td> 
				<td nowrap width="40%" align="left">
     	       	<eibsinput:text name="EBP0130Record" property="E01BPBPPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" required="false"/>
				<td nowrap width="10%" align="right"> </td>
				<td nowrap width="40%" align="right"> </td>
			</tr>

		</table>
	</td></tr></table>
	
	<h6></h6>

	<% if (userPO.getHeader3().equals("A")) { 
		if (!EBP0130Record.getE01BPBPMD().equals("0")) {%>
	<h4><B>Información Suspensión</B></h4> 
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Suspender en Fecha : </td>
				<td nowrap width="40%" align="left">
	               <eibsinput:date name="EBP0130Record" fn_year="E01BPBSD3" fn_month="E01BPBSD2" fn_day="E01BPBSD1" required="false"/>
			</td>
				<td nowrap width="10%" align="right">Razón de Suspensión : </td> 
				<td nowrap width="40%" align="left">
    	       	<eibsinput:text name="EBP0130Record" property="E01BPBSDS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" required="false"/>
				</td>
			</tr>
		</table>		
	</td></tr></table>
	<% }
    } %>
    <h5></h5>
    <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark"> 
				<td nowrap width="10%" align="right">Estado : </td>
				<td nowrap width="40%" align="left"><%= EBP0130Record.getE01BPBSTD().trim()%></td>
				<td nowrap width="10%" align="right"> </td> 
				<td nowrap width="40%">Fecha Aprobación/Fecha Rechazo : <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), EBP0130Record.getE01BPBADM(),EBP0130Record.getE01BPBADD(),EBP0130Record.getE01BPBADY())%></td>
			</tr>
		</table>		
	</td></tr></table>
	<% if (!userPO.getPurpose().equals("INQUIRY")) {%>
	<h5></h5>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table width="100%">

		<% if (userPO.getPurpose().equals("NEW")) { %>
			<tr>
				<td width="25%" align="center"> 
					<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(6);" >
				</td>
				<td width="25%" align="center"> 
					<input id="EIBSBTN" type=submit name="Exit" value="Salir" onClick="goAction(2);" >
				</td>
			</tr>	
		<% } else if (userPO.getPurpose().equals("MAINTENANCE")) {%>
			<tr>
				<td width="25%" align="center"> 
					<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(6);" >
				</td>
				<td width="25%" align="center"> 
					<input id="EIBSBTN" type=button name="Submit" value="Contabilidad" onClick="goGl();" >
				</td>
				<td width="25%" align="center"> 
					<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);">
				</td>
				<td width="25%" align="center"> 
					<input id="EIBSBTN" type=submit name="Exit" value="Salir" onClick="goAction(2);" >
				</td>
			</tr>	
		
		<% } %>
		</table>
	</td></tr></table>
	<% } %>

</td>	</tr>	</table>

</form>
</body>
</html>
