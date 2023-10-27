<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import="datapro.eibs.master.*" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.eibs.constants.StyleID"%>

<html>
<head>
<title> Cupo Rotativo Basic Information for Inquiry,Maintenance and Creation </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="RecData" class="datapro.eibs.beans.EPV015401Message" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">
 function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();
 }
 
 function reloadIFrame(name) {		// Esta funcion se llama desde los iframes
	if (isValidObject(document.getElementById(name))) {
		var iframe = document.getElementById(name);
		var source = iframe.src.replace("ACT=N", "ACT=S");;
		iframe.src = source;
	}
}
 
function rateDisplay(){
		var defaultValue = 0;
		var DECIMAL_LENGTH = <%=EibsFields.EIBS_FIELD_RATE_LENGTH_PART_DECIMAL%>
	
		if((getElement("E01DEAFTB").value == null) || (getElement("E01DEAFTB").value.trim() == "")){ 
			document.getElementById("FLOATINGTABLE").style.display = 'none';
			document.getElementById("FLOATINGTABLE2").style.display = 'none';
			getElement("E01DEASPR").readOnly = false;				

		}else if( (getElement("E01FLGFLT").value != null) && (parseInt(getElement("E01FLGFLT").value) == 2) ){
				document.getElementById("FLOATINGTABLE").style.display = 'table-row';
				document.getElementById("FLOATINGTABLE2").style.display = 'table-row';
				getElement("E01DEARTE").readOnly = true;
				getElement("E01DEASPR").readOnly = false;				
				
		}else if( (getElement("E01FLGFLT").value != null) && (parseInt(getElement("E01FLGFLT").value) == 1) ){
			document.getElementById("FLOATINGTABLE").style.display = 'none';
			document.getElementById("FLOATINGTABLE2").style.display = 'none';
			getElement("E01DEARTE").readOnly = false;	
			getElement("E01DEASPR").readOnly = true;				
				
		}else{
			document.getElementById("FLOATINGTABLE").style.display = 'none';
			document.getElementById("FLOATINGTABLE2").style.display = 'none';
			getElement("E01DEARTE").readOnly = false;
			getElement("E01DEASPR").readOnly = false;				
			
		}
		changeTRClass(); 	
		
		if("FS" == getElement("E01DEAFTY").value && (parseInt(getElement("E01FLGFLT").value) == 2)){
			getElement("E01FLTORG").value = getElement("SECONDARYRATE").value;

		}else if ("FP" == getElement("E01DEAFTY").value && (parseInt(getElement("E01FLGFLT").value) == 2)){
			getElement("E01FLTORG").value = getElement("PRIMARYRATE").value;
		
		}else if ("FP" == getElement("E01DEAFTY").value && (parseInt(getElement("E01FLGFLT").value) == 1)){
			getElement("E01DEASPR").value = getElement("PRIMARYRATE").value;
		
		}else if ("FS" == getElement("E01DEAFTY").value && (parseInt(getElement("E01FLGFLT").value) == 1)){
			getElement("E01DEASPR").value = getElement("SECONDARYRATE").value;	
			
		}else if (" " == getElement("E01DEAFTY").value && (parseInt(getElement("E01FLGFLT").value) == 1)){
			getElement("E01DEASPR").value = String(defaultValue.toFixed(DECIMAL_LENGTH));		

		}else if (" " == getElement("E01DEAFTY").value && (parseInt(getElement("E01FLGFLT").value) == 1)){
			getElement("E01DEASPR").value = String(defaultValue.toFixed(DECIMAL_LENGTH));					
			
		}else if (" " == getElement("E01DEAFTY").value && (parseInt(getElement("E01FLGFLT").value) == 2)){
			getElement("E01FLTORG").value = String(defaultValue.toFixed(DECIMAL_LENGTH));

		}else{
			getElement("E01DEAFRT").value = getElement("PRIMARYRATE").value;
		}
}

var TRCLASScounter = 0;
var orgTRCLEAR ;
var orgTRDARK ;

function changeTRClass(){
	var testClear = document.getElementsByClassName('trclear');
	var testDark  = document.getElementsByClassName('trdark');
	if( TRCLASScounter <1){
		orgTRCLEAR = Array.prototype.slice.call(testClear,0);
		orgTRDARK = Array.prototype.slice.call(testDark,0);
	}
	wrkTRCLEAR = orgTRCLEAR.slice();
	wrkTRDARK =  orgTRDARK.slice();
	if( (getElement("E01FLGFLT").value != null) && (parseInt(getElement("E01FLGFLT").value) != 2) ){
		for (var i = 0; i < wrkTRCLEAR.length; ++i){
			 wrkTRCLEAR[i].className = "trdark";	
		}
		for (var i = 0; i < wrkTRDARK.length; ++i){
			 wrkTRDARK[i].className = "trclear";	
		}		
		}else{
		for (var i = 0; i < wrkTRCLEAR.length; ++i){
			 wrkTRCLEAR[i].className = "trclear";	
		}
		for (var i = 0; i < wrkTRDARK.length; ++i){
			 wrkTRDARK[i].className = "trdark";	
		}		
		}
		TRCLASScounter ++;
 }	  
 
function showNumTarjeta() {
	if (document.forms[0].E01DEAF02.value == 'Y') {
		$('#numTarjetaLbl').show();	
		$('#numTarjetaFld').show();	
	} else {
		$('#numTarjetaLbl').hide();	
		$('#numTarjetaFld').hide();	
	}
}

function showMesesPlazo() {
	if (document.forms[0].E01DEAROC.value == 'Y') {
		$('#mesesPlazoLbl').show();	
		$('#mesesPlazoFld').show();	
	} else {
		$('#mesesPlazoLbl').hide();	
		$('#mesesPlazoFld').hide();	
	}
}

 </script>
</head>

<%
	boolean maint = false;
	boolean readOnly = false;
%> 
					
<body onload="showNumTarjeta();">
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		maint = true;
	}
	if(!RecData.getE01FLGNEW().equals("N")){ 	
		readOnly = true;
	}
	String FLGNEW = RecData.getE01FLGNEW().trim();
%>

<h3 align="center">
<%if (maint){ %>
	Mantenimiento 
<%} else { %>
	Nueva 
<%}%> Cupo Rotativo - <%=RecData.getE01DSCPRO()%>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="crotat_basic_info.jsp, EPV0154"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
	<INPUT TYPE=HIDDEN NAME="E01FLGFLT" id="E01FLGFLT" VALUE="<%=RecData.getE01FLGFLT().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAACD" id="E01DEAACD" VALUE="<%=RecData.getE01DEAACD().trim()%>">
 
	<%int row = 0; %>
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="15%"><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="10%"><div align="left"><eibsinput:text property="E01DEACUN" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/></div></td>
						<td nowrap width="10%"><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="35%"><div align="left"><eibsinput:text property="E01CUSNA1" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/></div></td>
						<td nowrap width="10%"><div align="right"><b>Tipo : </b></div></td>
						<td nowrap width="20%"><div align="left"><eibsinput:text property="E01DEATYP" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/></div></td>
					</tr>
					<tr id="trdark">
						<td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="10%"><div align="left"><input type="text" name="E01DEAACC" size="14" maxlength="12"  readonly value="<% if (RecData.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(RecData.getE01DEAACC().trim()); %>"></div></td>
						<td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="35%"><div align="left"><eibsinput:text property="E01DEACCY" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/></div></td>
						<td nowrap width="10%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="20%"><div align="left"><eibsinput:text property="E01DEAPRO" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/></div></td>
					</tr>
				</table>
			</td>
		</tr>
 </table>
 
	<h4>Datos B&aacute;sicos de la Operaci&oacute;n </h4>
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Monto cupo credito :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEAOAM" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=readOnly%>"/>  
						</td>
						<td nowrap width="25%"><div align="right">Fecha de Apertura :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="RecData" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" readonly="<%=readOnly%>"/> 
						</td>
					</tr>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Fecha de Vencimiento :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="RecData"  fn_month="E01DEAMAM" fn_day="E01DEAMAD" fn_year="E01DEAMAY" required="True" /> 
						</td>
						<td nowrap width="25%"><div align="right">T&eacute;rmino o Plazo :</div></td>
						<td nowrap width="25%"> 
						
							<input type="text" name="E01DEATRM" id="E01DEATRM" size="6" maxlength="5" value="<%= RecData.getE01DEATRM().trim()%>" >
							<select name="E01DEATRC">
								<OPTION value=" " <% if (!(RecData.getE01DEATRC().equals("D") ||RecData.getE01DEATRC().equals("M")||RecData.getE01DEATRC().equals("Y"))) out.print("selected"); %>></OPTION>
								<OPTION value="D" <% if(RecData.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
								<OPTION value="M" <% if(RecData.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
								<OPTION value="Y" <% if(RecData.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
							</select>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						
						</td>
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Uso de Domicilio :</div></td>
						<td nowrap width="25%" >
							<select name="E01DEAWHF" id="E01DEAWHF" >
								<option value=" " <% if (!(RecData.getE01DEAWHF().equals("R") || RecData.getE01DEAWHF().equals("C"))) out.print("selected"); %>></option>
								<option value="R" <% if (RecData.getE01DEAWHF().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
								<option value="C" <% if (RecData.getE01DEAWHF().equals("C")) out.print("selected"); %>>Correo Eléctronico</option>
							</select>
							<input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= RecData.getE01DEAMLA().trim()%>">
							<a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value,document.forms[0].E01DEAWHF.value)">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0"></a> 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>	        
						<td nowrap width="25%" ><div align="right">Condici&oacute;n  Cr&eacute;dito :</div></td>
						<td nowrap width="27%" >
						<input type="text" name="E01DEADLC" size="2" maxlength="1" value="<%=RecData.getE01DEADLC() %>">
							<a href="javascript:GetCondicionesCode('E01DEADLC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td align=right nowrap width="25%"><div align="right">Banco/Sucursal :</div></td>
						<td nowrap width="25%">
							<eibsinput:text property="E01DEABNK" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>"/>
							<eibsinput:help fn_param_one="E01DEABRN" fn_param_two="document.forms[0].E01DEABNK.value" property="E01DEABRN" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"/>
						</td>   
						<td nowrap width="25%" ><div align="right">Numero Referencia :</div></td>
						<td nowrap width="25%" >
							<eibsinput:text property="E01DEAREF" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_REFERENCE %>"/> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">L&iacute;nea de Cr&eacute;dito :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= RecData.getE01DEACMC().trim()%>" >
							<input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= RecData.getE01DEACMN().trim()%>" >
							<a href="javascript:GetCreditLine('E01DEACMN',document.forms[0].E01DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle"></a> 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
						<td nowrap width="25%" ><div align="right">Centro de Costo :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEACCN" size="8" maxlength="8" value="<%= RecData.getE01DEACCN().trim()%>">
							<a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].E01DEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right"> Estado :</div></td>
						<td nowrap width="25%" > 
							<select name="E01DEAIDT" disabled >
								<OPTION value=" " <% if (!(RecData.getE01DEAIDT().equals("1") ||RecData.getE01DEAIDT().equals("2")||RecData.getE01DEAIDT().equals("3")
											||RecData.getE01DEAIDT().equals("4") ||RecData.getE01DEAIDT().equals("5") ||RecData.getE01DEAIDT().equals("6"))) out.print("selected");;%>>Pendiente</OPTION>
								<OPTION value="1" <% if(RecData.getE01DEAIDT().equals("1")) out.print("selected");%>>Activo</OPTION>
								<OPTION value="2" <% if(RecData.getE01DEAIDT().equals("2")) out.print("selected");%>>Inactivo</OPTION>
								<OPTION value="3" <% if(RecData.getE01DEAIDT().equals("3")) out.print("selected");%>>Bloqueado</OPTION>
								<OPTION value="4" <% if(RecData.getE01DEAIDT().equals("4")) out.print("selected");%>>Bloqueo DEF</OPTION>
								<OPTION value="5" <% if(RecData.getE01DEAIDT().equals("5")) out.print("selected");%>>Cancelado</OPTION>
								<OPTION value="6" <% if(RecData.getE01DEAIDT().equals("6")) out.print("selected");%>>Cerrado</OPTION>
							</select>
						</td>
						<td nowrap width="25%" ><div align="right">Tipo de Credito :</div></td>
						<td nowrap width="25%" > 
							<select name="E01DEAF01" >
								<OPTION value=" " <% if (!(RecData.getE01DEAF01().equals("1") || RecData.getE01DEAF01().equals("2"))) out.print("selected");;%>></OPTION>
								<OPTION value="1" <% if(RecData.getE01DEAF01().equals("1")) out.print("selected");%>>No Revolvente</OPTION>
								<OPTION value="2" <% if(RecData.getE01DEAF01().equals("2")) out.print("selected");%>>Revolvente</OPTION>
								
							</select>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">N&uacute;mero Utilizaciones :</div></td>
						<td nowrap width="25%" >
							<input type="text" size="4" maxlength="3" name="E01DEAANT" value="<%=RecData.getE01DEAANT().trim()%>" > 
						</td>
						<td nowrap width="25%" ><div align="right"></div></td>
						<td nowrap width="25%" ></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" height="19"><div align="right">Dia de Facturaci&oacute;n :</div></td>
						<td nowrap width="25%" height="19">
							<input type="text" size="3" maxlength="2" name="E01CLCFAC" value="<%=RecData.getE01CLCFAC().trim()%>" onKeyPress="enterInteger(event);"> 
						</td>
						<td nowrap width="25%" height="19"><div align="right">Dia de Pago :</div></td>
						<td nowrap width="27%" height="19"> 
								<input type="text" size="3" maxlength="2" name="E01CLCPAG" value="<%=RecData.getE01CLCPAG().trim()%>" onKeyPress="enterInteger(event);"> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Permite Pagos en Feriados :</div></td>
						<td nowrap width="25%" >
							<eibsinput:text property="E01DEAHFQ" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="2" maxlength="1" />
							<a href="javascript:GetCode('E01DEAHFQ','STATIC_ln_tables_holidays.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" width="16" height="20"  >
						</td>
						<td nowrap width="25%" ><div align="right">Cuenta de Pago :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:help name="RecData" property="E01DEARAC" fn_param_one="E01DEARAC" fn_param_two="document.forms[0].E01DEABNK.value"  fn_param_three="RT" fn_param_five="document.forms[0].E01DEACUN.value" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" required="true"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Fuente de Recurso : </div></td>
						<td nowrap width="25%" >
							<eibsinput:cnofc name="RecData" flag="RS" property="E01DEAUC7" fn_code="E01DEAUC7" fn_description="" required="true"/>
						</td>
						<td nowrap width="25%" ><div align="right">Cuenta de Desembolso :</div></td>
						<td nowrap width="25%" >
						<eibsinput:help name="RecData" property="E01DEAOAC" fn_param_one="E01DEAOAC" fn_param_two="document.forms[0].E01DEABNK.value"  fn_param_three="RT" fn_param_five="document.forms[0].E01DEACUN.value"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" required="true"/>				
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Fecha de Suscripci&oacute;n : </div></td>
						<td nowrap width="25%" >
							<eibsinput:date name="RecData" fn_year="E01DEAPSY" fn_month="E01DEAPSM" fn_day="E01DEAPSD" required="true"/>
						</td>
						<td nowrap width="25%" ><div align="right"></div></td>
						<td nowrap width="25%" > 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" id="Renovacion" ><div align="right">Dias para Bloqueo Automatico :</div></td>
						<td nowrap width="25%"  id="RenovacionDias"> 
							<eibsinput:text name="RecData" property="E01DEAPRR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS%>" readonly="false"/>
						</td>
						<td nowrap width="25%" ><div align="right">Monto M&iacute;nimo de Pago :</div></td>
						<td nowrap width="25%"  id="RenovacionDias"> 
							<eibsinput:text name="RecData" property="E01DEAMPA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="false"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Maneja Tarjeta :</div></td>
						<td nowrap width="25%" >
							<input type="hidden" name="E01DEAF02" value="<%=RecData.getE01DEAF02()%>">
							<input type="radio" name="CE01DEAF02" value="Y" onClick="document.forms[0].E01DEAF02.value='Y'; showNumTarjeta();" <%if(RecData.getE01DEAF02().equals("Y")) out.print("checked");%> >S&iacute; 
							<input type="radio" name="CE01DEAF02" value="N" onClick="document.forms[0].E01DEAF02.value='N'; showNumTarjeta();" <%if(!RecData.getE01DEAF02().equals("Y")) out.print("checked");%> >No 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" width="16" height="20"  >
						</td>
						<td width="25%" ><div align="right" id="numTarjetaLbl" style="display: <%= RecData.getE01DEAF02().equals("Y") ? "" : "none" %>">N&uacute;umero de Tarjeta :</div></td>			
						<td width="25%" >
							<div align="left" id="numTarjetaFld" style="display: <%=RecData.getE01DEAF02().equals("Y")?"":"none" %>"> 
								<eibsinput:text name="RecData" property="E01DEACRC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>"/>
							</div>
						</td>    
					</tr>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Recoge Saldos :</div></td>
						<td nowrap width="25%" >
							<input type="hidden" name="E01DEAROC" value="<%=RecData.getE01DEAROC()%>">
							<input type="radio" name="CE01DEAROC" value="Y" onClick="document.forms[0].E01DEAROC.value='Y'; " <%if(RecData.getE01DEAROC().equals("Y")) out.print("checked");%> >S&iacute; 
							<input type="radio" name="CE01DEAROC" value="N" onClick="document.forms[0].E01DEAROC.value='N'; " <%if(!RecData.getE01DEAROC().equals("Y")) out.print("checked");%> >No 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" width="16" height="20"  >
						</td>
						<td width="25%" ></td>			
						<td width="25%" >
							
						</td>    
					</tr>          
				</table>
			</td>
		</tr>
	</table>
	
	<h4>Datos Generales de la Operaci&oacute;n </h4>
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right">Per&iacute;odo Base :</div></td>
						<td width="25%" > 
						<eibsinput:text property="E01DEABAS" name="RecData" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" readonly="<%=readOnly%>" />
						</td> 
						<td nowrap width="25%" ><div align="right">Tabla Tasa Flotante :</div></td>
						<%if(!readOnly){%>
						<td nowrap> 
							<eibsinput:help name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" fn_param_one="E01DEAFTB" fn_param_two="E01FLGFLT" fn_param_three="E01FLTDSC" fn_param_four="PRIMARYRATE" fn_param_five="SECONDARYRATE" fn_param_six="E01DEAFTY" property="E01DEAFTB" help="<%=HelpTypes.FLOATING_RATE_TABLES%>" onchange="rateDisplay()" /> 
							<select name="E01DEAFTY" onchange="rateDisplay();"> 
								<option value=" " <% if (!(RecData.getE01DEAFTY().equals("FP") ||RecData.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
								<option value="FP" <% if (RecData.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
								<option value="FS" <% if (RecData.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
							</select>
						</td>
						<%}else{%>
						<td nowrap>
							<eibsinput:text name="RecData" property="E01DEAFTB" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="true"/>
							<INPUT TYPE=HIDDEN NAME="E01DEAFTY" id="E01DEAFTY" VALUE="<%=RecData.getE01DEAFTY().trim()%>">
							<select name="I01DEAFTY" disabled="disabled"> 
								<option value=" " <% if (!(RecData.getE01DEAFTY().equals("FP") ||RecData.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
								<option value="FP" <% if (RecData.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
								<option value="FS" <% if (RecData.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
							</select>
						</td>            
						<%}%>
					</tr>
					<tr id="FLOATINGTABLE2" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: none">
						<td><div align="right">Descripcion Tabla Flotante :</div></td>
						<td> 
							<eibsinput:text property="E01FLTDSC" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
						</td>
						<td><div align="right">Tasa Flotante Base :</div></td>
						<td nowrap>
							<%if(RecData.getE01FLGFLT().equals("2")){%>
							<INPUT TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=RecData.getE01FLTORG().trim()%>">
							<INPUT TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=RecData.getE01FLTORG().trim()%>">
							<%}else{%>
							<INPUT TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=RecData.getE01DEAFRT().trim()%>">
							<INPUT TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=RecData.getE01DEAFRT().trim()%>">
							<%}%>
							<eibsinput:text property="E01FLTORG" name="RecData" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
						</td>
					</tr>
					<tr id="FLOATINGTABLE" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: none"> 
						<td><div align="right">Manejo Puntos Adicional  :</div></td>
						<% if(!readOnly){ %>
						<td nowrap width="25%" > 
							<select name="E01DEAFLX" onclick="" >
								<OPTION value=" " <% if (!(RecData.getE01DEAFLX().equals("B") ||RecData.getE01DEAFLX().equals("E")||RecData.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
								<OPTION value="B" <% if(RecData.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
								<OPTION value="E" <% if(RecData.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
								<OPTION value="N" <% if(RecData.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
							</select>
						</td>
						<td><div align="right">Valor Tasa Adicional :</div></td>
						<td> 
							<eibsinput:text property="E01DEARTX" name="RecData" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" onchange=""/>
						</td>
						<%}else{%>
						<td> 
							<INPUT TYPE=HIDDEN NAME="E01DEAFLX" id="E01DEAFLX" VALUE="<%=RecData.getE01DEAFLX().trim()%>">
							<select name="I01DEAFLX" disabled="disabled" >
								<OPTION value=" " <% if (!(RecData.getE01DEAFLX().equals("B") ||RecData.getE01DEAFLX().equals("E")||RecData.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
								<OPTION value="B" <% if(RecData.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
								<OPTION value="E" <% if(RecData.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
								<OPTION value="N" <% if(RecData.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
							</select>
						</td>
						<td><div align="right">Valor Tasa Adicional :</div></td>
						<td> 
							<eibsinput:text property="E01DEARTX" name="RecData" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" readonly="true"/>
						</td>
						<%}%>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tasa Flotante :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEAFRT" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"/>  
						</td>
						<td nowrap width="25%" ><div align="right"></div></td>
						<td nowrap>
							  
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tasa Efectiva :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEASPR" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="<%=readOnly%>"/>
						</td>
						<td nowrap width="25%" ><div align="right">Tasa Interes/Spread :</div></td>
						<td nowrap width="20%" > 
							<eibsinput:text property="E01DEARTE" name="RecData" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" readonly="<%=readOnly%>" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Tasa/Cargo por Mora :</div></td>
						<td nowrap width="25%" > 
							<input type="text" class="txtright" name="E01DEAPEI" size="8" maxlength="7" value="<%= RecData.getE01DEAPEI().trim()%>" >
							<input type="text" name="E01DEAPIF" size="2" maxlength="1" value="<%= RecData.getE01DEAPIF().trim()%>" >
							<a href="javascript:lnGetFact('E01DEAPIF','STATIC_ln_fact.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" ></a> 
						</td>
						<td nowrap width="25%" ><div align="right">Tasa Definitiva :</div></td>
						<td nowrap width="20%" > 
							<eibsinput:text property="E01LNSRTE" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>        
					</tr>
					
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tabla de Parametros :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEATLN" size="3" maxlength="2" value="<%= RecData.getE01DEATLN().trim()%>">
							<a href="javascript:GetLoanTable('E01DEATLN',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
						</td>
						<td nowrap width="25%" ><div align="right">Tabla de Cargos :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEAOFT" size="3" maxlength="2" value="<%= RecData.getE01DEAOFT().trim()%>">
							<a href="javascript:GetLoanChargeTable('E01DEAOFT',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
							<b>&nbsp; &nbsp; Personalizar</b>
							<% if("N".equals(RecData.getE01FLGNEW())){ %>
							<a href="javascript: setComissionTable('false')"><img src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
							<% }else{ %>
							<a href="javascript: setComissionTable('false')"><img src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
							<% } %>  
						</td>
					</tr>
					
				</table>
			</td>
		</tr>
	</table>

	<h4>Impuestos </h4>
	<table class="tableinfo" >
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="15%" > 
							<div align="center"> </div>
						</td>
						<td nowrap width="10%" > 
							<div align="center">ISR</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center">IVA/ITBMS</div>
						</td>
						<td nowrap width="10%" > 
							 <div align="center">IDB/GMF</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
								<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %>  
									FECI 
								<% } else if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) {%>
									ITE
								<% } %>
						</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> </div>
						</td>
				</tr>        
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="15%" > 
							<div align="center"> </div>
						</td>
						<td nowrap width="10%"  > 
							<div align="center"> 
				<select id="E01DEATX1" name="E01DEATX1" >
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(RecData.getE01DEATX1().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(RecData.getE01DEATX1().equals("0")) out.print("selected");%>> NO </option>
				</select>        
							</div>
						</td>
						<td nowrap width="10%"  > 
							<div align="center"> 
				<select id="E01DEATX2" name="E01DEATX2" >
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(RecData.getE01DEATX2().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(RecData.getE01DEATX2().equals("0")) out.print("selected");%>> NO </option>
				</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
				<select id="E01DEATX3" name="E01DEATX3" >
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(RecData.getE01DEATX3().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(RecData.getE01DEATX3().equals("0")) out.print("selected");%>> NO </option>
				</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
			<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA")) || currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %> 
				<select id="E01DEATX4" name="E01DEATX4" >
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(RecData.getE01DEATX4().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(RecData.getE01DEATX4().equals("0")) out.print("selected");%>> NO </option>
				</select>                 
			<% } %>				
			</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> </div>
						</td>
				 </tr>
				</table>
			</td>
		</tr>
	</table>
	
	<h4>Prioridad de Pagos </h4>
	<table class="tableinfo" >
		<tr> 
			<td nowrap > 
				<table id="tableSelect" cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="14%"  > 
							<div align="center"> 
								<select id="E01DEAPP1" name="E01DEAPP1" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(RecData.getE01DEAPP1().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(RecData.getE01DEAPP1().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(RecData.getE01DEAPP1().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(RecData.getE01DEAPP1().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(RecData.getE01DEAPP1().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(RecData.getE01DEAPP1().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(RecData.getE01DEAPP1().equals("7")) out.print("selected");%>> 7 </option>
				 					<% if (currUser.getE01INT().equals("07")) { %> 
				 					<option value="8" <% if(RecData.getE01DEAPP1().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>        
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<select id="E01DEAPP2" name="E01DEAPP2" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(RecData.getE01DEAPP2().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(RecData.getE01DEAPP2().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(RecData.getE01DEAPP2().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(RecData.getE01DEAPP2().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(RecData.getE01DEAPP2().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(RecData.getE01DEAPP2().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(RecData.getE01DEAPP2().equals("7")) out.print("selected");%>> 7 </option>
				 					<% if (currUser.getE01INT().equals("07")) { %> 
				 					<option value="8" <% if(RecData.getE01DEAPP2().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<select id="E01DEAPP3" name="E01DEAPP3" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(RecData.getE01DEAPP3().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(RecData.getE01DEAPP3().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(RecData.getE01DEAPP3().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(RecData.getE01DEAPP3().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(RecData.getE01DEAPP3().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(RecData.getE01DEAPP3().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(RecData.getE01DEAPP3().equals("7")) out.print("selected");%>> 7 </option>
				 					<% if (currUser.getE01INT().equals("07")) { %> 
									<option value="8" <% if(RecData.getE01DEAPP3().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<select id="E01DEAPP4" name="E01DEAPP4" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(RecData.getE01DEAPP4().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(RecData.getE01DEAPP4().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(RecData.getE01DEAPP4().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(RecData.getE01DEAPP4().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(RecData.getE01DEAPP4().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(RecData.getE01DEAPP4().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(RecData.getE01DEAPP4().equals("7")) out.print("selected");%>> 7 </option>
				 					<% if (currUser.getE01INT().equals("07")) { %> 
				 					<option value="8" <% if(RecData.getE01DEAPP4().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>              
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<select id="E01DEAPP5" name="E01DEAPP5" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(RecData.getE01DEAPP5().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(RecData.getE01DEAPP5().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(RecData.getE01DEAPP5().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(RecData.getE01DEAPP5().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(RecData.getE01DEAPP5().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(RecData.getE01DEAPP5().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(RecData.getE01DEAPP5().equals("7")) out.print("selected");%>> 7 </option>
				 					<%if(currUser.getE01INT().equals("07")){%> 
				 					<option value="8" <% if(RecData.getE01DEAPP5().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>              
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center">
								<select id="E01DEAPP6" name="E01DEAPP6" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(RecData.getE01DEAPP6().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(RecData.getE01DEAPP6().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(RecData.getE01DEAPP6().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(RecData.getE01DEAPP6().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(RecData.getE01DEAPP6().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(RecData.getE01DEAPP6().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(RecData.getE01DEAPP6().equals("7")) out.print("selected");%>> 7 </option>
				 					<%if(currUser.getE01INT().equals("07")){%> 
				 					<option value="8" <% if(RecData.getE01DEAPP6().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>               
							</div>
						</td>
			 			<% if(currUser.getE01INT().equals("07")) { %> 
							<td nowrap width="12%"  > 
								<div align="center">
									<select id="E01DEAPP7" name="E01DEAPP7" >
										<option value=" " selected> &nbsp; </option>
										<option value="1" <% if(RecData.getE01DEAPP7().equals("1")) out.print("selected");%>> 1 </option>
										<option value="2" <% if(RecData.getE01DEAPP7().equals("2")) out.print("selected");%>> 2 </option>
										<option value="3" <% if(RecData.getE01DEAPP7().equals("3")) out.print("selected");%>> 3 </option>
										<option value="4" <% if(RecData.getE01DEAPP7().equals("4")) out.print("selected");%>> 4 </option>
										<option value="5" <% if(RecData.getE01DEAPP7().equals("5")) out.print("selected");%>> 5 </option>
										<option value="6" <% if(RecData.getE01DEAPP7().equals("6")) out.print("selected");%>> 6 </option>
										<option value="7" <% if(RecData.getE01DEAPP7().equals("7")) out.print("selected");%>> 7 </option>
										<option value="8" <% if(RecData.getE01DEAPP7().equals("8")) out.print("selected");%>> 8 </option> 
									</select>	               
								</div>
							</td>
						<% } %>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<select id="E01DEAPP8" name="E01DEAPP8" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(RecData.getE01DEAPP8().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(RecData.getE01DEAPP8().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(RecData.getE01DEAPP8().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(RecData.getE01DEAPP8().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(RecData.getE01DEAPP8().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(RecData.getE01DEAPP8().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(RecData.getE01DEAPP8().equals("7")) out.print("selected");%>> 7 </option>
									<% if(currUser.getE01INT().equals("07")){%> 
									<option value="8" <% if(RecData.getE01DEAPP8().equals("8")) out.print("selected");%>> 8 </option> 
									<% } %>
								</select>              
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="12%"><div align="center">Principal</div></td>
						<td nowrap width="12%"><div align="center">Intereses</div></td>
						<td nowrap width="12%"><div align="center">Mora</div></td>
						<td nowrap width="12%"><div align="center">Comisiones</div></td>
						<td nowrap width="12%"><div align="center">Impuestos</div></td>
						<td nowrap width="12%"><div align="center">Deducciones</div></td>
			 			<% if (currUser.getE01INT().equals("07")) { %> 
						<td nowrap width="12%"><div align="center">FECI</div></td>
						<% } %>
						<td nowrap width="12%"><div align="center">Cobranzas</div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<p></p>
	<p></p>

	<!-- Seguros Financiados -->
	<% session.setAttribute("EMPSG","S"); %>
	<iframe id="ifrempsg" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&appType=CP&ACT=N&E01PSGCUN=<%=RecData.getE01DEACUN().trim()%>&E01PSGNUM=<%=RecData.getE01DEAOFN().trim()%>"></iframe>  
				
	<!-- Cargos Adicionales -->
	<% session.setAttribute("EMPCA","S"); %>
	<iframe id="ifrempca" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&appType=CP&ACT=N&E01PVHCUN=<%=RecData.getE01DEACUN().trim()%>&E01PVHNUM=<%=RecData.getE01DEAOFN().trim()%>"> </iframe>

	<!-- Condiciones cupos -->
	<% session.setAttribute("EMPCU","S"); %>
	<iframe id="ifrempcu" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1166?SCREEN=101&appType=CP&ACT=N&E01TYPCUN=<%=RecData.getE01DEACUN().trim()%>&E01TYPNUM=<%=RecData.getE01DEAOFN().trim()%>"> </iframe>
	
	<% if ("N".equals(FLGNEW)){ %>
	<h4>Garantias</h4>
	<TABLE id="mainTable" class="tableinfo" style="height:106px;">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="98%">
					<tr id="trdark">
						<th nowrap width="16%" align="center">Cuenta</th>
						<th nowrap width="7%"  align="center">Prod</th>
						<th nowrap width="30%" align="center">Nombre</th>
						<th nowrap width="7%"  align="center">Moneda</th>
						<th nowrap width="20%" align="center">Monto Garantizado</th>
						<th nowrap width="20%" align="center">Valor del bien</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr  height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:106px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<% for (int i=1;i<10;i++) { %> 
						<tr id="trclear"> 
							<td nowrap width="16%" align="center"> 
								<%= i %>
								<input type=text name="<%="E01CLACB"+i%>" size="13" maxlength="12" value="<%=RecData.getFieldString("E01CLACB"+i) %>" class="context-menu-help garantiaInq" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E01DEABNK.value,'',document.forms[0].E01DEACUN.value,'','91')">      
							</td>
							<td nowrap width="7%"  align="center"> 
								<input type="text" name="<%="E01CLTYB"+i %>" size="5" maxlength="4" value="<%=RecData.getFieldString("E01CLTYB"+i) %>" readonly>
							</td>
							<td nowrap width="30%" align="center"> 
								<input type="text" name="<%="E01CLDSC"+i %>" size="46" maxlength="45" value="<%=RecData.getFieldString("E01CLDSC"+i) %>" readonly> 
							</td>
							<td nowrap width="7%"  align="center"> 
								<input type="text" name="<%="E01CLCCY"+i %>" size="4" maxlength="3" value="<%=RecData.getFieldString("E01CLCCY"+i) %>" readonly>  
							</td>
							<td nowrap width="20%" align="center"> 
								<input type="text" class="txtright" name="<%="E01CLAMT"+i %>" size="19" maxlength="18" value="<%=RecData.getFieldString("E01CLAMT"+i) %>" onclick="this.select();" onkeypress="enterDecimal(event, 2)" onblur=" this.value = formatCCY(this.value);"  >  
							</td>
							<td nowrap width="20%" align="center"> 
								<input type="text" class="txtright" name="<%="E01CLBOP"+i %>" size="19" maxlength="18" value="<%=RecData.getFieldString("E01CLBOP"+i) %>" readonly> 
								<input class="styled-button-Search" id="garbtn<%=i%>" type=button name="Submit" value="Consulta" onClick="showCollateralList(getElement('E01CLACB<%=i%>').value.trim())" style="visibility: <%= RecData.getFieldString("E01CLACB"+i).trim().equals("0") ? "hidden;" : "visible"  %>">
							</td>
						</tr> 
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>
	<% } %>
	
	<% if(error.getERWRNG().equals("Y")){%>
	 <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(RecData.getH01FLGWK2().equals("A")){ out.print("checked");} %> >Aceptar con Aviso</h4>
	<% } %> 
	
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	
			<div align="center"> 
			 <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%if(!readOnly){%>	
			 <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(200);">
			 <%}else{%>
			 <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(125);">
		 <%}%>       
		</div>  
		
 </form>
</body>

<script type="text/javascript">

function setComissionTable(readOnly) {
	var notMissingInfo = true;
	var cun = getElement('E01DEACUN').value;
	var apcd = getElement('E01DEAACD').value;
	var bank = getElement('E01DEABNK').value;
	var type = getElement('E01DEATYP').value;
	var table = getElement('E01DEAOFT').value;
	var alertMessage = "Por Favor Ingresse : ";
	
	if(readOnly === "true" ){	
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table+"&readOnly="+readOnly;
	}else{
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table;
		
		if(trim(bank) == "") {
			alert(alertMessage + "Banco")
			notMissingInfo = false;			
		}
		
		if(trim(table) == "") {
			alert(alertMessage + "Tabla de Cargos")
			notMissingInfo = false;			
		}		
	}
	
	if(notMissingInfo){			
		CenterWindow(page, 1200, 1000, 2);
	}	
}


</script>

</HTML>



