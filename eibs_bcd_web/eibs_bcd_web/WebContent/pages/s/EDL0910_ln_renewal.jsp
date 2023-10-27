<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import = "datapro.eibs.master.*" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<html>
<head>
<title>Pago de Prest&acute;mos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-paymentplan.jsp"></script>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-renewal.jsp"></script>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="lnRenew" class="datapro.eibs.beans.EDL091001Message" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT type="text/javascript">

<% 
	String accOpt = request.getParameter("accOpt");
	String screen = "2";
	String title = "Reestructuraci&oacute;n de Pr&eacute;stamos";
	if (accOpt.equals("M")) { 
		screen = "4"; 
		title  = "Modificaci&oacute;n de Pr&eacute;stamos"; 
	}
%>

<% if (!userPO.getPurpose().equals("MAINTENANCE")) { %>
<%  if (userPO.getPurpose().equalsIgnoreCase("APPROVAL_INQ")){ %>
     builtNewMenu(pv_a_opt);
<%  }else{%>
      builtNewMenu(ln_a_opt);
<%  } %>	
    initMenu();
<% } %>
	
function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();		
}
 
function showDetail(typ) {
	var coll = document.forms[0].elements(typ);
	if ((coll != null) && (isValidObject(getElement(typ)))) {
		page= "${pageContext.request.contextPath}/pages/s/EDL0910_ln_renewal_chg.jsp?Type="+ typ;		
		CenterWindow(page,500,400,3);
	} else alert("No existe detalle de este cargo");   
}
 
function UpdateFlag(val) {
	if (val == true){
		document.forms[0].H01FLGWK1.value = "X";
		document.forms[0].E01FLGFVE.value = "Y";
	}
	if (document.forms[0].H01FLGWK1.value == "X"){
		document.forms[0].RECALC.checked = true;
	} else {
		document.forms[0].RECALC.checked = false;
	}
}
 
function setRecalculate() {
	if (isValidObject(getElement("RECALC"))) {
		getElement("RECALC").checked = true;
		getElement("RECALC").disabled = true;
		UpdateFlag(true);  
	}
}

function amountRecalculate() {
	if (isValidObject(getElement("AmountSC1"))) {
		getElement("AmountSC1").checked = true;
		getElement("AmountSC1").disabled = false;
		UpdateAmountFlag(true);  
	}
	if (isValidObject(getElement("AmountSC21"))) {
		getElement("AmountSC21").checked = true;
		getElement("AmountSC21").disabled = false;
		UpdateAmountFlag(true);  
	}
	if (isValidObject(getElement("AmountSC22"))) {
		getElement("AmountSC22").checked = true;
		getElement("AmountSC22").disabled = false;
		UpdateAmountFlag(true);  
	}
	if (isValidObject(getElement("AmountSC3"))) {
		getElement("AmountSC3").checked = true;
		getElement("AmountSC3").disabled = false;
		UpdateAmountFlag(true);  
	}
	if (isValidObject(getElement("AmountROA"))) {
		getElement("AmountROA").checked = true;
		getElement("AmountROA").disabled = false;
		UpdateAmountFlag(true);  
	}
}

function UpdateAmountFlag(val) {
	getElement("E01FLGFVE").value = (val) ? "Y" : "";
}

function rateDisplay(){
	if((getElement("E01DEAFTB").value == null) || (getElement("E01DEAFTB").value.trim() == "")){ 
		document.getElementById("FLOATINGTABLE").style.display = 'none';
		document.getElementById("FLOATINGTABLE2").style.display = 'none';
		getElement("E01DEARTE").readOnly = false;
	}else if( (getElement("E01FLGFLT").value != null) && (parseInt(getElement("E01FLGFLT").value) == 2) ){
			document.getElementById("FLOATINGTABLE").style.display = 'table-row';
			document.getElementById("FLOATINGTABLE2").style.display = 'table-row';
			getElement("E01DEARTE").readOnly = true;
	}else{
		document.getElementById("FLOATINGTABLE").style.display = 'none';
		document.getElementById("FLOATINGTABLE2").style.display = 'none';
		getElement("E01DEARTE").readOnly = false;
	}
	if("FS" == getElement("E01DEAFTY").value && (parseInt(getElement("E01FLGFLT").value) == 2)){
		getElement("E01FLTORG").value = getElement("SECONDARYRATE").value;
	}else if ("FP" == getElement("E01DEAFTY").value && (parseInt(getElement("E01FLGFLT").value) == 2)){
		getElement("E01FLTORG").value = getElement("PRIMARYRATE").value;
	}else if ("FS" == getElement("E01DEAFTY").value && (parseInt(getElement("E01FLGFLT").value) != 2)){
		getElement("E01DEAFRT").value = getElement("SECONDARYRATE").value;
	}else{
		getElement("E01DEAFRT").value = getElement("PRIMARYRATE").value;
	}
	setRowColors("mainTable");
}

if(sessionStorage.getItem('fromPagoSelection') == "true"){
	window.location.hash = "CondicionesdePago" ;
	sessionStorage.setItem('fromPagoSelection', "false");	
} 

function cuentas(){
	setRowColors("mainTable");
	if(document.getElementById("E01DEAPVI").value == ("3")){
		document.getElementById("convenioTable").style.display = 'none';
		document.getElementById("multicuenta").style.display = 'block';
		document.getElementById("autocuenta").style.display = 'none';
		document.getElementById("convenioAsignar").style.display = 'none';
		document.getElementById("intento").style.display = 'block';
		document.getElementById("intento2").style.display = 'block';
	} else if (document.getElementById("E01DEAPVI").value == ("1") || document.getElementById("E01DEAPVI").value == ("4")) {
		document.getElementById("convenioTable").style.display = 'none';
		document.getElementById("multicuenta").style.display = 'none';
		document.getElementById("autocuenta").style.display = 'block';
		document.getElementById("convenioAsignar").style.display = 'none';
		document.getElementById("intento").style.display = 'none';
		document.getElementById("intento2").style.display = 'none';
	} else if (document.getElementById("E01DEAPVI").value == ("2")) {
		document.getElementById("convenioTable").style.display = 'block';
		document.getElementById("multicuenta").style.display = 'none';
		document.getElementById("autocuenta").style.display = 'none';
		document.getElementById("convenioAsignar").style.display = 'block';
		document.getElementById("intento").style.display = 'none';
		document.getElementById("intento2").style.display = 'none';
	} else {
		document.getElementById("convenioTable").style.display = 'none';
		document.getElementById("multicuenta").style.display = 'none';
		document.getElementById("autocuenta").style.display = 'none';
		document.getElementById("convenioAsignar").style.display = 'none';
		document.getElementById("intento").style.display = 'none';
		document.getElementById("intento2").style.display = 'none';
	}
} 

</SCRIPT>
</head>

<body onload=" rateDisplay();cuentas();">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
		 error.setERRNUM("0");
		 out.println("<SCRIPT Language=\"Javascript\">");
		 out.println("       showErrors()");
		 out.println("</SCRIPT>");
 }
%> 

<H3 align="center"><%=title%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_renewal.jsp, EDL0910"></H3>
<hr size="4">
<form method="post" name="firstForm" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0910">
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="<%=screen%>">
	<INPUT TYPE=HIDDEN NAME="E01DEABNK" id="E01DEABNK" VALUE="<%=lnRenew.getE01DEABNK().trim()%>">
	<INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="<%=lnRenew.getH01FLGWK1().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01CNTINT" id="E01CNTINT" VALUE="<%=lnRenew.getE01CNTINT().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGFPG" id="E01FLGFPG" VALUE="<%=lnRenew.getE01FLGFPG().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGFVE" id="E01FLGFVE" VALUE="<%=lnRenew.getE01FLGFVE().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGFLT" id="E01FLGFLT" VALUE="<%=lnRenew.getE01FLGFLT().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAOFN" id="E01DEAOFN" VALUE="<%=lnRenew.getE01DEAOFN().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01RNVTYP" id="E01RNVTYP" VALUE="2">
	<% int row = 0;%>
	<% 
	   String field="";
	   int numField=25;
	   for(int i=1;i <= numField;i++){
	     field = (i < 10) ? "0"+ i : ""+ i;
	     try {
	       if (!(lnRenew.getField("PTYP"+field).getString().trim().equals(""))) {
	%>
	<INPUT TYPE=HIDDEN NAME="PAMT<%= field%>" VALUE="<%= lnRenew.getField("E01PAMT"+field).getString().trim()%>">
	<%     } 
	     } catch (Exception e) {
	     } 
	   }
	%>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="15%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="15%" > 
							<div align="left">
								<input type="text" size="10" maxlength="9" name="E01DEACUN" value="<%= lnRenew.getE01DEACUN().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="30%" > 
							<div align="left">
								<input type="text" size="60" maxlength="60" name="E01CUSNA1" value="<%= lnRenew.getE01CUSNA1().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="15%"><div align="right"><b>Tipo Producto : </b></div></td>
						<td nowrap width="15%"> 
							<div align="left">
								<b><input type="text" size="5" maxlength="4" name="E01DEATYP" value="<%= lnRenew.getE01DEATYP().trim()%>" readonly></b>
							</div>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="15%"> 
							<div align="left">
								<input type="text" size="13" maxlength="12" name="E01DEAACC" value="<%= lnRenew.getE01DEAACC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="30%"> 
							<div align="left"><b> 
								<input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= lnRenew.getE01DEACCY().trim()%>" readonly>
								</b> </div>
						</td>
						<td nowrap width="15%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="15%"> 
							<div align="left">
								<b><input type="text" size="5" maxlength="4" name="E01DEAPRO" value="<%= lnRenew.getE01DEAPRO().trim()%>" readonly></b>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
 
	<%row++;%> 
	<h4>Información Básica</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap >
				<table cellspacing=0 cellpadding=2 width="100%" border="0" id="mainTable">
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">Vencimiento Actual :</div></td>
						<td nowrap> 
							<eibsinput:date name="lnRenew"  fn_month="E01DEAMDM" fn_day="E01DEAMDD" fn_year="E01DEAMDY" readonly="true" />
						</td>
						<td nowrap><div align="right">Ultimo Calculo :</div></td>
						<td nowrap>
							<eibsinput:date name="lnRenew"  fn_month="E01DEALCM" fn_day="E01DEALCD" fn_year="E01DEALCY" readonly="true" />             
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Modalidad :</div></td>
						<td nowrap width="25%"> 
							<input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= lnRenew.getE01DEAICT().trim()%>" readonly>              
						</td>
						<td nowrap width="25%"><div align="right">Tabla Tasa Flotante :</div></td>
						<td nowrap align="left" > 
							<eibsinput:help name="lnRenew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" fn_param_one="E01DEAFTB" fn_param_two="E01FLGFLT" fn_param_three="E01FLTDSC" fn_param_four="PRIMARYRATE" fn_param_five="SECONDARYRATE" fn_param_six="E01DEAFTY" property="E01DEAFTB" help="<%=HelpTypes.FLOATING_RATE_TABLES%>" onchange="rateDisplay();setRecalculate();" /> 
							<select name="E01DEAFTY" onchange="rateDisplay();setRecalculate()" > 
								<option value=" " <% if (!(lnRenew.getE01DEAFTY().equals("FP") || lnRenew.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
								<option value="FP" <% if (lnRenew.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
								<option value="FS" <% if (lnRenew.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
							</select>
						</td>
					</tr>
					<tr id="FLOATINGTABLE2" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: none;">
						<td><div align="right">Descripcion Tabla Flotante :</div></td>
						<td> 
							<eibsinput:text property="E01FLTDSC" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
						</td>
						<td nowrap ><div align="right">Tasa Flotante Base :</div></td>
						<td nowrap >
							<%if(lnRenew.getE01FLGFLT().equals("2")){%>
							<INPUT TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=lnRenew.getE01FLTORG().trim()%>">
							<INPUT TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=lnRenew.getE01FLTORG().trim()%>">
							<%}else{%>
							<INPUT TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=lnRenew.getE01DEAFRT().trim()%>">
							<INPUT TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=lnRenew.getE01DEAFRT().trim()%>">
							<%}%>
							<eibsinput:text property="E01FLTORG" name="msgLoan" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
						</td>
					</tr>
					<tr  id="FLOATINGTABLE"  style="border: 0px; display: none;"  class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" > 
						<td nowrap><div align="right">Manejo Puntos Adicional  :</div></td>
						<td nowrap> 
							<select name="E01DEAFLX" onclick="setRecalculate()" >
								<option value=" " <% if (!(lnRenew.getE01DEAFLX().equals("B") ||lnRenew.getE01DEAFLX().equals("E")||lnRenew.getE01DEAFLX().equals("N"))) out.print("selected"); %>></option>
								<option value="B" <% if(lnRenew.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</option>
								<option value="E" <% if(lnRenew.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</option>
								<option value="N" <% if(lnRenew.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</option>
							</select>
						</td>
						<td nowrap ><div align="right">Valor Tasa Adicional :</div></td>
						<td nowrap >
							<eibsinput:text property="E01DEARTX" name="lnRenew" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" onchange="UpdateFlag(true)"/>
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">Periodo Base :</div></td>
						<td nowrap> 
							<eibsinput:text property="E01DEABAS" name="lnRenew" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="rateDisplay();setRecalculate()"/>
						</td>
						<td nowrap><div align="right">Tasa Flotante :</div><td nowrap>              
							<eibsinput:text property="E01DEAFRT" name="lnRenew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>  
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">Fecha Valor :</div></td>
						<td nowrap align="left" > 
							<eibsinput:date name="lnRenew"  fn_month="E01PAGVDM" fn_day="E01PAGVDD" fn_year="E01PAGVDY" />
						</td>
						<td nowrap><div align="right">Tasa Spread :</div></td>
						<td nowrap align="left" > 
							<eibsinput:text property="E01DEARTE" name="lnRenew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>  
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">T&eacute;rmino o Plazo :</div></td>
						<td nowrap >
							<input type="text" name="E01DEATRM" id="E01DEATRM" size="6" maxlength="5" onkeypress="enterInteger(event)" value="<%= lnRenew.getE01DEATRM().trim()%>" onchange="setRecalculate();zeroDates()">
							<select name="E01DEATRC" onchange="setRecalculate();zeroDates()" >
								<option value=" " <% if (!(lnRenew.getE01DEATRC().equals("D") ||lnRenew.getE01DEATRC().equals("M")||lnRenew.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
								<option value="D" <% if(lnRenew.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
								<option value="M" <% if(lnRenew.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</option>
								<option value="Y" <% if(lnRenew.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
							</select>
						</td>
						<td nowrap><div align="right">Tasa Definitiva :</div></td>
						<td nowrap align="left" >
							<eibsinput:text property="E01RTELNS" name="lnRenew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>  
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">Nuevo Vencimiento :</div></td>
						<td nowrap > 
							<eibsinput:date name="lnRenew"  fn_month="E01NEWMDM" fn_day="E01NEWMDD" fn_year="E01NEWMDY" /> 
						</td>          
						<td nowrap><div align="right">Tasa Efectiva :</div></td>
						<td nowrap align="left" > 
							<eibsinput:text property="E01DEASPR" name="lnRenew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />  
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">Tipo :</div></td>
						<td nowrap > 
							<input type="text" name="E01DLCTPR" size="3" maxlength="2" value="<%=lnRenew.getE01DLCTPR().trim() %>"   >
							<a href="javascript:GetCodeDescCNOFC('E01DLCTPR', 'E01DSCTPR','RY')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
							<eibsinput:text name="lnRenew" property="E01DSCTPR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true"/>
						</td>          
						<td nowrap><div align="right">Condicion :</div></td>
						<td nowrap align="left" > 
							<input type="text" name="E01DLCCDR" size="3" maxlength="2" value="<%=lnRenew.getE01DLCCDR().trim() %>"   >
							<a href="javascript:GetCodeDescCNOFC('E01DLCCDR', 'E01DSCCDR','RO')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
							<eibsinput:text name="lnRenew" property="E01DSCCDR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true"/>
						</td>
					</tr>
					<!--  
					<tr> 
						<td nowrap> 
							<div align="right"></div>
						</td>
						<td nowrap > 
							<eibsinput:date name="lnRenew"  fn_month="E01NEWMDM" fn_day="E01NEWMDD" fn_year="E01NEWMDY" /> 
						</td>          
						<td nowrap> 
							 <div align="right">Tipo Renovaci&oacute;n :</div>
						</td>
						<td nowrap align="left" > 
							<select name="E01RNVTYP" onchange="UpdateFlag(true)" >
								 <OPTION value=" " < if (!(lnRenew.getE01RNVTYP().equals("1") ||lnRenew.getE01RNVTYP().equals("2")||lnRenew.getE01RNVTYP().equals("3"))) out.print("selected"); %>></OPTION>
								 <OPTION value="1" < if(lnRenew.getE01RNVTYP().equals("1")) out.print("selected");%>>Renovar Capital</OPTION>
								 <OPTION value="2" < if(lnRenew.getE01RNVTYP().equals("2")) out.print("selected");%>>Renovar Capital &amp; Intereses</OPTION>
								 <OPTION value="3" < if(lnRenew.getE01RNVTYP().equals("3")) out.print("selected");%>>Cambiar Fecha Vencimiento</OPTION>
							</select>
						</td>
					</tr>
					<tr> 
						<td nowrap> 
							<div align="right">Renovar Garantias :</div>
						</td>
						<td > 
						<input type="radio" name="E01DEAREC" value="Y" <if (lnRenew.getE01DEAREC().equals("Y")) out.print("checked"); %>> Si 
						<input type="radio" name="E01DEAREC" value="N" <if (lnRenew.getE01DEAREC().equals("N")) out.print("checked"); %>> No
						</td>
						<td nowrap> 
							<div align="right"></div>
						</td>
						<td nowrap align="left" > 
						</td>
					</tr>
					-->
				</table>
			</td>
		</tr>
	</table>

	<!-- CONDICIONES DE PAGO VARIABLES/SECTION-->
	<a name="CuentaPago"></a>   
	<h4>Forma de pago Automatico</h4>
	<table class="tableinfo" >
		<tr> 
			<td nowrap align="left"> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0" >
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%" align="right"> Autoriza Sobregiro :</td>
						<td nowrap width="15%" > 
							<div align="left">
								<input type="text" name="E01DEAODA" size="2" maxlength="1" value="<%= lnRenew.getE01DEAODA().trim()%>" readonly >
								<%-- 
								<a href="javascript:lnGetOver('E01DEAODA','STATIC_ln_over.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>  
								--%>
							 </div>
						</td>
						<td nowrap width="10%" ><div align="right">Permite Pagos en Feriados : </div></td>
						<td nowrap colspan="2" > 
							<div align="left">
								<eibsinput:text property="E01DEAHFQ" name="lnRenew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="2" maxlength="1" readonly="true"/>
								<a href="javascript:GetCode('E01DEAHFQ','STATIC_ln_tables_holidays.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"></div></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="28%" align="right"> Forma de Pago :</td>
						<td nowrap width="10%" > 
							<div align="left">
							 <select name="E01DEAPVI" id="E01DEAPVI" onchange="javascript:cuentas();">
									<option value=" " <% if (lnRenew.getE01DEAPVI().equals(" ")) out.print("selected"); %>>Caja</option>
									<option value="1" <% if (lnRenew.getE01DEAPVI().equals("1")) out.print("selected"); %>>Automatico </option>                   
									<option value="2" <% if (lnRenew.getE01DEAPVI().equals("2")) out.print("selected"); %>>Convenio</option>  
									<option value="3" <% if (lnRenew.getE01DEAPVI().equals("3")) out.print("selected"); %>>M&uacute;ltiple Cuentas</option>                 
									<option value="4" <% if (lnRenew.getE01DEAPVI().equals("4")) out.print("selected"); %>>PAC Multibanco</option>                   
								</select>
							</div>
						</td>
						<td nowrap width="10%" id="intento" style="border: 0px; display: none;"> 
							<div align="right">Intento Cobro : </div>
						</td>
						<td nowrap id="intento2" style="border: 0px; display: none;"> 
							<div align="left">
								<eibsinput:text property="E01DLCCMC" name="lnRenew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" />
							</div>
						</td>
						<td align="LEFT" id="convenioAsignar" style="border: 0px; display: none;" ><a href="#CuentaPago" onclick="goAsign();"><b>Asignar</b></a></td>
						<td colspan="4" ></td>
					</tr>
					<tr>
						<table id="autocuenta" style="border: 0px; display: none; ">
							<tr id="trdark"> 
								<td nowrap width="28%"><div align="center">Concepto</div></td>
								<td nowrap width="10%"><div align="center">Banco </div></td>
								<td nowrap width="10%"><div align="center">Sucursal</div></td>
								<td nowrap><div align="center">Moneda </div></td>
								<td nowrap><div align="center">Referencia</div></td>
								<td nowrap><div align="center">Titular</div></td>
								<td nowrap></td>
							</tr>
							<tr id="trclear">
								<td nowrap width="28%" > 
									<div align="center" > 
										<input type="text" name="E01PAUOPE" id="E01PAUOPE" value="<%= lnRenew.getE01PAUOPE().trim()%>" size="3" maxlength="3">
										<input type="hidden" name="E01PAUGLN" value="<%= lnRenew.getE01PAUGLN().trim()%>">
										<input type="text" name="E01PAUCON" id="E01PAUCON" size="25" maxlength="25" readonly value="<%= lnRenew.getE01PAUCON().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01DEABNK.value, document.forms[0].E01PAUCCY.value,'E01PAUGLN','E01PAUOPE','10','04')">
									</div>
								</td>
								<td nowrap width="10%" > 
									<div align="center"><input type="text" name="E01PAUBNK" size="2" maxlength="2" value="<%= lnRenew.getE01PAUBNK().trim()%>"></div>
								</td>
								<td nowrap width="10%" > 
									<div align="center"> 
										<input type="text" name="E01PAUBRN" size="4" maxlength="4" value="<%= lnRenew.getE01PAUBRN().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')"> 
							 		</div>
								</td>
								<td nowrap width="10%" > 
									<div align="center"> 
										<input type="text" name="E01PAUCCY" size="3" maxlength="3" value="<%= lnRenew.getE01PAUCCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
									</div>
								</td>
								<td nowrap width="14%" > 
									<div align="center"> 
										<input type="text" name="E01PAUACC" size="12" maxlength="12"  value="<%= lnRenew.getE01PAUACC().trim()%>" class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E01DEABNK.value,'',document.forms[0].E01DEACUN.value,'','RT')">
									</div>
								</td>
								<td nowrap width="28%" > 
									<div align="center"> 
										<input type="text" readonly name="E01PAUNME" size="25" maxlength="25" value="<%= lnRenew.getE01PAUNME().trim()%>">
									</div>
								</td>
							</tr>
						</table>
						<table id="convenioTable" style="border: 0px; display: none; height:100%; width: 100%;">
							<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
								<td width="33%"><div align="right">Codigo de Convenio : </div></td>
								<td nowrap > 
									<div align="left" >
										<input type="text" name="E01DEACNV" size="5" maxlength="4" value="<%= lnRenew.getE01DEACNV().trim()%>"   >
										<a href="javascript:GetConvenio('E01DEACNV','E01DSCCNV',document.forms[0].E01DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
										<eibsinput:text name="lnRenew" property="E01DSCCNV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
									</div>
								</td>
							</tr>
							<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td width="33%"><div align="right">Pagadurias : </div></td>
								<td nowrap > 
									<div align="left">
										<input type="text" name="E01DEAPGD" size="3" maxlength="2" value="<%= lnRenew.getE01DEAPGD().trim()%>" onKeypress="enterInteger(event);">
										<a href="javascript:GetPagadurias('E01DEAPGD',document.forms[0].E01DEACNV.value,'E01DSCPGD')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
										&nbsp;&nbsp;
										<eibsinput:text name="lnRenew" property="E01DSCPGD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
									</div>
								</td>
							</tr>
							<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td width="33%"><div align="right">Novedad : </div></td>
								<td nowrap > 
									<div align="left">
								 		<input type="text" name="E01DEAUC6" size="4" maxlength="2" value="<%=lnRenew.getE01DEAUC6().trim() %>"   >
							 			<a href="javascript:GetCodeDescCNOFC('E01DEAUC6', 'E01DSCUC6','NC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
						 				<eibsinput:text name="lnRenew" property="E01DSCUC6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
									</div>
								</td>
							</tr >
							<%row++;%>
						</table>
						<tr>
							<td colspan="5">
								<table id="multicuenta" style="border: 0px; display: none; height:100%; width: 100%;" >
									<tr height="5%"> 
										<td NOWRAP valign="top" width="100%">
											<table id="headTable" width="100%"> 
												<tr id="trdark"> 
													<th nowrap width="15%" align="center">Cuenta</th>
													<th nowrap width="50%" align="center">Nombre</th>
													<th nowrap width="10%" align="center">Tipo</th>
													<th nowrap width="10%" align="center">Producto</th>
													<th nowrap width="15%" align="center">%USO</th>
												</tr>
											</table>
										</td>
									</tr>
									<tr height="95%">    
										<td nowrap="nowrap" valign="top">      
											<div id="dataDiv1" style="width: 100%; height:106px; overflow:auto;"> 
												<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
												<% for (int i=1;i<10;i++) { %>
													<tr id="trclear"> 
														<td nowrap width="15%" align="center">
															<%= i %>
															<input type=text name="<%="E01PGACC"+i%>" size="13" maxlength="12" value="<%=lnRenew.getFieldString("E01PGACC"+i) %>" class="context-menu-help" onmousedown="init(accountCustomerNameHelp,this.name,document.forms[0].E01DEABNK.value,'','E01PGNME<%=i%>','','RT')"> 
														</td>
														<td nowrap width="50%" align="center">
															<input type=text name="<%="E01PGNME"+i%>" size="60" maxlength="60" value="<%=lnRenew.getFieldString("E01PGNME"+i) %>" readonly> 
														</td>
														<td nowrap width="10%" align="center">
															<input type=text name="<%="E01PGTYP"+i%>" size="5" maxlength="4" value="<%=lnRenew.getFieldString("E01PGTYP"+i) %>" readonly> 
														</td>
														<td nowrap width="10%" align="center">
															<input type=text name="<%="E01PGPRD"+i%>" size="5" maxlength="4" value="<%=lnRenew.getFieldString("E01PGPRD"+i) %>" readonly> 
														</td>
														<td nowrap width="15%" align="center">
															<input type=text name="<%="E01PGPER"+i%>" size="8" maxlength="7" class="txtright" value="<%=lnRenew.getFieldString("E01PGPER"+i) %>"> 
														</td>
													</tr> 
												<% } %>
											</table>
										</div>
									</td>
								</tr>
							</table>
		 				</td>	
					</tr>
				</table>
			</td>
		</tr>
	</table> 
	<br>
 
	<a href="#CondicionesdePago" ><b>Condiciones de Pago</b></a>
	<div  id="planPago"></div>

 	<br>
	<!-- Seguros Financiados -->  
	<% if(userPO.getPurpose().equals("MAINTENANCE")){
			session.setAttribute("EMPSG","S");//Seguros
				session.setAttribute("EMPCA","S");//Cargos Addicionales
			}else{
			session.setAttribute("EMPSG","A");//Seguros
				session.setAttribute("EMPCA","A");//Cargos Addicionales
	 }%>
	<input type="hidden" name="SGTOT" id="SGTOT" value="0">
	<iframe id="ifrempsg" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&ACT=N&appType=LR&E01PSGCUN=<%=lnRenew.getE01DEACUN().trim()%>&E01PSGNUM=<%=lnRenew.getE01DEAOFN().trim()%>"></iframe>

	<br>
	<!-- Cargos Adicionales -->
	<input type="hidden" name="CAIMP" id="CAIMP" value="0">
	<input type="hidden" name="CACOM" id="CACOM" value="0">
	<input type="hidden" name="CADED" id="CADED" value="0">
	<input type="hidden" name="CAIVA" id="CAIVA" value="0">
	<iframe id="ifrempca" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&ACT=N&appType=LR&E01PVHCUN=<%=lnRenew.getE01DEACUN().trim()%>&E01PVHNUM=<%=lnRenew.getE01DEAOFN().trim()%>"> </iframe>
	
	<h4>Distribuci&oacute;n del Pago</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="center"><b>Concepto</b></div></td>
						<td nowrap><div align="center"><b>Saldo Anterior</b></div></td>
						<td nowrap><div align="center"><b>A Condonar</b></div></td>
						<td nowrap><div align="center"><b>A Pagar</b></div></td>
						<!-- 
						<td nowrap><div align="center"><b>Capitalizar</b></div></td>
						<td nowrap><div align="center"><b>Ajustes</b></div></td>
						-->
						<td nowrap><div align="center"><b>Nuevo Saldo</b></div></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">PRINCIPAL :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFPRI" size="16" maxlength="16" value="<%= lnRenew.getE01BEFPRI().trim()%>" readonly >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNPRI" size="16" maxlength="16" value="<%= lnRenew.getE01XCNPRI().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)" >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGPRI" size="16" maxlength="16" value="<%= lnRenew.getE01PAGPRI().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTPRI" size="16" maxlength="16" value="<%= lnRenew.getE01AFTPRI().trim()%>" readonly>
						</td>
					</tr>
					<%if(lnRenew.getH01FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td align="center" nowrap><div align="right">REAJUSTE :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFREA" size="16" maxlength="16" value="<%= lnRenew.getE01BEFREA().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNREA" size="16" maxlength="16" value="<%= lnRenew.getE01XCNREA().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGREA" size="16" maxlength="16" value="<%= lnRenew.getE01PAGREA().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01CAPREA" size="16" maxlength="16" value="<%= lnRenew.getE01CAPREA().trim()%>" onkeypress="enterSignCCY(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  ><input type="text" class="txtright" name="E01AFTREA" size="16" maxlength="16" value="<%= lnRenew.getE01AFTREA().trim()%>" readonly>
						</td>
					</tr>
					<%}%>
					<!--  
					<tr> 
						<td nowrap ><div align="right">Intereses :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFINT" size="16" maxlength="16" value="<lnRenew.getE01BEFINT().trim()>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGINT" size="16" maxlength="16" value="<lnRenew.getE01PAGINT().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTINT" size="16" maxlength="16" value="<lnRenew.getE01AFTINT().trim()>" readonly>
						</td>
					</tr>
					-->
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap ><div align="right">INTERESES BALANCE :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFINV" size="16" maxlength="16" value="<%= lnRenew.getE01BEFINV().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNINV" size="16" maxlength="16" value="<%= lnRenew.getE01XCNINV().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGINV" size="16" maxlength="16" value="<%= lnRenew.getE01PAGINV().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTINV" size="16" maxlength="16" value="<%= lnRenew.getE01AFTINV().trim()%>" readonly>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap ><div align="right">INTERESES CONTINGENTE :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFINC" size="16" maxlength="16" value="<%= lnRenew.getE01BEFINC().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNINC" size="16" maxlength="16" value="<%= lnRenew.getE01XCNINC().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGINC" size="16" maxlength="16" value="<%= lnRenew.getE01PAGINC().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTINC" size="16" maxlength="16" value="<%= lnRenew.getE01AFTINC().trim()%>" readonly>
						</td>
					</tr>
					<!--  
					<tr> 
						<td nowrap><div align="right">Mora :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFMOR" size="16" maxlength="16" value="<lnRenew.getE01BEFMOR().trim()>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGMOR" size="16" maxlength="16" value="<lnRenew.getE01PAGMOR().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTMOR" size="16" maxlength="16" value="<lnRenew.getE01AFTMOR().trim()>" readonly>
						</td>
					</tr>
					-->
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">MORA BALANCE :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFMOV" size="16" maxlength="16" value="<%= lnRenew.getE01BEFMOV().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNMOV" size="16" maxlength="16" value="<%= lnRenew.getE01XCNMOV().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGMOV" size="16" maxlength="16" value="<%= lnRenew.getE01PAGMOV().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTMOV" size="16" maxlength="16" value="<%= lnRenew.getE01AFTMOV().trim()%>" readonly>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">MORA CONTINGENTE :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFMOC" size="16" maxlength="16" value="<%= lnRenew.getE01BEFMOC().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNMOC" size="16" maxlength="16" value="<%= lnRenew.getE01XCNMOC().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGMOC" size="16" maxlength="16" value="<%= lnRenew.getE01PAGMOC().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTMOC" size="16" maxlength="16" value="<%= lnRenew.getE01AFTMOC().trim()%>" readonly>
						</td>
					</tr>
					<%if(currUser.getE01INT().equals("07")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">F.E.C.I. :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFOTH" size="16" maxlength="16" value="<%= lnRenew.getE01BEFOTH().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNOTH" size="16" maxlength="16" value="<%= lnRenew.getE01XCNOTH().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGOTH" size="16" maxlength="16" value="<%= lnRenew.getE01PAGOTH().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTOTH" size="16" maxlength="16" value="<%= lnRenew.getE01AFTOTH().trim()%>" readonly>
						</td>
					</tr>
					<%}%>
					<%
						String seq = "";
						for (int i = 1; i < 26; i++) {	
							if (i < 10) seq = "0"+i; else seq = ""+i;
							if(!lnRenew.getField("E01PDSC"+seq).getString().trim().equals("")) {
					%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap>
							<input type="hidden" name="E01PTYP<%= seq%>" value="<%=lnRenew.getField("E01PTYP"+seq).getString().trim()%>">
							<div align="right"><%=lnRenew.getField("E01PDSC"+seq).getString().trim()%> :</div>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFM<%=seq%>" size="16" maxlength="16" value="<%=lnRenew.getField("E01BEFM"+seq).getString().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCAM<%=seq%>" size="16" maxlength="16" value="<%=lnRenew.getField("E01XCAM"+seq).getString().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this,'<%=seq%>');" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAMT<%=seq%>" size="16" maxlength="16" value="<%=lnRenew.getField("E01PAMT"+seq).getString().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this,'<%=seq%>');" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTM<%=seq%>" size="16" maxlength="16" value="<%=lnRenew.getField("E01AFTM"+seq).getString().trim()%>" readonly>
						</td>
					</tr>
					<%
							}
						}
					%> 
					<!--
					<tr> 
						<td nowrap><div align="right"><a href="javascript:showDetail('1')"><b>Impuesto :</b></a></div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFIMP" size="16" maxlength="16" value="<lnRenew.getE01BEFIMP().trim()>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNIMP" size="16" maxlength="16" value="<lnRenew.getE01XCNIMP().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGIMP" size="16" maxlength="16" value="<lnRenew.getE01PAGIMP().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTIMP" size="16" maxlength="16" value="<lnRenew.getE01AFTIMP().trim()>" readonly>
						</td>
					</tr>
					<tr> 
						<td nowrap><div align="right"><a href="javascript:showDetail('2')"><b>Comisiones :</b></a></div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFCOM" size="16" maxlength="16" value="<lnRenew.getE01BEFCOM().trim()>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNCOM" size="16" maxlength="16" value="<lnRenew.getE01XCNCOM().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGCOM" size="16" maxlength="16" value="<lnRenew.getE01PAGCOM().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTCOM" size="16" maxlength="16" value="<lnRenew.getE01AFTCOM().trim()>" readonly>
						</td>
					</tr>
					<tr> 
						<td nowrap><div align="right"><a href="javascript:showDetail('3')"><b>Deducciones :</b></a></div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFDED" size="16" maxlength="16" value="<lnRenew.getE01BEFDED().trim()>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNDED" size="16" maxlength="16" value="<lnRenew.getE01XCNDED().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGDED" size="16" maxlength="16" value="<lnRenew.getE01PAGDED().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTDED" size="16" maxlength="16" value="<lnRenew.getE01AFTDED().trim()>" readonly>
						</td>
					</tr>
					<tr> 
						<td nowrap><div align="right"><a href="javascript:showDetail('5')"><b>Cobranzas :</b></a></div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFCBZ" size="16" maxlength="16" value="<lnRenew.getE01BEFCBZ().trim()>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNCBZ" size="16" maxlength="16" value="<lnRenew.getE01XCNCBZ().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGCBZ" size="16" maxlength="16" value="<lnRenew.getE01PAGCBZ().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTCBZ" size="16" maxlength="16" value="<lnRenew.getE01AFTCBZ().trim()>" readonly>
						</td>
					</tr>
					<tr> 
						<td nowrap><div align="right"><a href="javascript:showDetail('4')"><b>I.V.A :</b></a></div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFIVA" size="16" maxlength="16" value="<lnRenew.getE01BEFIVA().trim()>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNIVA" size="16" maxlength="16" value="<lnRenew.getE01XCNIVA().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGIVA" size="16" maxlength="16" value="<lnRenew.getE01PAGIVA().trim()>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTIVA" size="16" maxlength="16" value="<lnRenew.getE01AFTIVA().trim()>" readonly>
						</td>
					</tr>
					-->
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">TOTAL :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFTOT" size="16" maxlength="16" value="<%= lnRenew.getE01BEFTOT().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01XCNTOT" size="16" maxlength="16" value="<%= lnRenew.getE01XCNTOT().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAGTOT" size="16" maxlength="16" value="<%= lnRenew.getE01PAGTOT().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTTOT" size="16" maxlength="16" value="<%= lnRenew.getE01AFTTOT().trim()%>" readonly>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br>
	
	<h4>Cuenta de Pago</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table class="tableinfo" style="border: none;">
					<tr id="trdark">
						<td nowrap><div align="center">Concepto</div></td>
						<td nowrap><div align="center">Banco</div></td>
						<td nowrap><div align="center">Sucursal</div></td>
						<td nowrap><div align="center">Moneda</div></td>        
						<td nowrap><div align="center">Referencia</div></td>
					</tr>
					<tr id="trclear">
						<td nowrap> 
							<div align="center"> 
								<input type=text name="E01PAGOPC" value="<%= lnRenew.getE01PAGOPC().trim()%>" size="3" maxlength="2">
								<input type=HIDDEN name="E01PAGOGL" value="<%= lnRenew.getE01PAGOGL().trim()%>">
								<input type="text" name="E01PAGCON" size="45" maxlength="45" readonly value="<%= lnRenew.getE01PAGCON().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01DEABNK.value, document.forms[0].E01PAGOCY.value,'E01PAGOGL','E01PAGOPC','10','04')">
							</div>
						</td>
						<td nowrap> 
							<div align="center"> 
								<input type="text" name="E01PAGOBK" size="3" maxlength="2" value="<%= lnRenew.getE01PAGOBK().trim()%>">
							</div>
						</td>
						<td nowrap> 
							<div align="center"> 
								<input type="text" name="E01PAGOBR" size="5" maxlength="4" value="<%= lnRenew.getE01PAGOBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
							</div>
						</td>
						<td nowrap> 
							<div align="center"> 
								<input type="text" name="E01PAGOCY" size="4" maxlength="3" value="<%= lnRenew.getE01PAGOCY().trim()%>"
								 class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
							</div>
						</td>
						<td nowrap> 
							<div align="center"> 
						 <% if(userPO.getPurpose().equals("MAINTENANCE")){%>
								<input type="text" name="E01PAGOAC" size="13" maxlength="12" value="<%= lnRenew.getE01PAGOAC().trim()%>"
								 class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01DEABNK.value,'','','','RM')">
						 <% } else {%>
							 <input type="text" name="E01PAGOAC" size="13" maxlength="12" value="<%= lnRenew.getE01PAGOAC().trim()%>"
								 class="context-menu-inq" onmousedown="init(inqAccount, this.value)" readonly >           
						 <% } %>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">Descripcion :</div></td>
						<td nowrap colspan=5> 
							<INPUT type="text" size="60" maxlength="60" name="E01DEANR1" value="<%= lnRenew.getE01DEANR1().trim()%>" readonly><br>
							<INPUT type="text" size="60" maxlength="60" name="E01DEANR2" value="<%= lnRenew.getE01DEANR2().trim()%>">
						</td>
					</tr>
				</table>  
			</td>
		</tr>
	</table>
	<br>
	
<% if(userPO.getPurpose().equals("MAINTENANCE")){%>
	<table class=tbenter style="width:60%" align=center>
	 <tr>
		<td align=center>
		 <input type="checkbox" name="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (lnRenew.getH01FLGWK1().trim().equals("X")) out.print(" checked ");%>><b> Recalcular</b> 
	</td>
	<% if(error.getERWRNG().equals("Y")){%>
	<td align=center width=50%>
	 <input type="checkbox" name="H01FLGWK2" value="A" <% if(lnRenew.getH01FLGWK2().equals("A")){ out.print("checked");} %>><b>Aceptar con Avisos</b>
		 </td>
		<% } %>
		</tr>
	</table>
 <p align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
</p>
 <% } else { %>
 <SCRIPT type="text/javascript">
	$("input[type='text']").attr("readonly", "readonly").prop("onchange",null).prop("change",null);  
	$("select").add("button").add("submit").add("input[type='radio']").add("input[type='checkbox']").attr("disabled", "disabled").prop("onchange",null).prop("change",null);  
	$("img[title='null']").add("img[src*='1b.gif']").add("img[src*='Check.gif']").add("img[src*='calendar.gif']").hide(); 	
	$("input.context-menu-help").removeAttr("onmousedown").removeClass();

//Field Used to Set Readonly
//The "Condiciones de Pago" in ln-paymentplan.js
window.inquiry = true;

</SCRIPT> 
 <% } %>

<SCRIPT type="text/javascript">
TOTALS();

function validateValue(valamt) {
	try {
		valamt = getElement(valamt).value;
		valamt = valamt.replace(/\,/g,'');
		valamt = parseFloat(valamt);
		if (isNaN(valamt)) { 
			valamt = 0.00;
		}
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

function fixedValue(valamt) {
	var maxvalue = 9999999999999.99;
	try {
		valamt = Number(valamt.toFixed(2));
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

function calculateConcepto(obj,seq) {
	var fldnam; var fldcpt; var fld; 
	var valbef;	var valxcn;	var valpag;	var valaft;

	if (seq === undefined) {
		fld = ["E01BEF","E01XCN","E01PAG","E01AFT"];
		fldnam = obj.name.substring(0,6);
		fldcpt = obj.name.substring(6);
	} else {
		fld = ["E01BEFM","E01XCAM","E01PAMT","E01AFTM"];
		fldnam = obj.name.substring(0,7);
		fldcpt = obj.name.substring(7);
	}
	valbef = validateValue(fld[0] + fldcpt);
	valxcn = validateValue(fld[1] + fldcpt);
	valpag = validateValue(fld[2] + fldcpt);
	valaft = validateValue(fld[3] + fldcpt);

	// A Condonar
	if (fldnam == fld[1]) {
		if (fldcpt != "PRI") {
			if (valxcn > valbef) {
				valxcn = valbef;
			}
			valpag = fixedValue(valbef - valxcn);
		}
		if (fldcpt == "PRI") {
			if (valxcn + valpag > valbef) {
				valxcn = 0.00;
			}
		}
	}
	// A Pagar
	if (fldnam == fld[2]) {
		if (fldcpt != "PRI") {
			if (valpag > valbef) {
				valpag = valbef;
			}
			valxcn = fixedValue(valbef - valpag);
		}
		if (fldcpt == "PRI") {
			if (valxcn + valpag > valbef) {
				valpag = 0.00;
			}
		}
	}
	// After
	valaft = fixedValue(valbef - valxcn - valpag);
	// Totales
	getElement(fld[1]+fldcpt).value = formatCCY(valxcn);
	getElement(fld[2]+fldcpt).value = formatCCY(valpag);
	if (isValidObject(getElement(fld[3]+fldcpt))) {
		getElement(fld[3]+fldcpt).value = formatCCY(valaft);
	} 
	TOTALS();
}

function TOTALS(){
	var xcn = ["E01XCNPRI","E01XCNINV","E01XCNINC","E01XCNMOV","E01XCNMOC","E01XCNIMP","E01XCNCOM","E01XCNDED","E01XCNCBZ","E01XCNIVA"];
	var pag = ["E01PAGPRI","E01PAGINV","E01PAGINC","E01PAGMOV","E01PAGMOC","E01PAGIMP","E01PAGCOM","E01PAGDED","E01PAGCBZ","E01PAGIVA"];
	var aft = ["E01AFTPRI","E01AFTINV","E01AFTINC","E01AFTMOV","E01AFTMOC","E01AFTIMP","E01AFTCOM","E01AFTDED","E01AFTCBZ","E01AFTIVA"];
	var xcntot; var pagtot; var afttot;
	xcntot = 0.00;
	pagtot = 0.00;
	afttot = 0.00; 
	// A Condonar 
	for (i = 0; i < xcn.length; i++) {
		if (isValidObject(getElement(xcn[i]))) {
			xcntot = xcntot + validateValue(xcn[i]); 		
		}
	}
	// A Pagar 
	for (i = 0; i < pag.length; i++) {
		if (isValidObject(getElement(pag[i]))) {
			pagtot = pagtot + validateValue(pag[i]); 		
		}
	}
	// Nuevo saldo 
	for (i = 0; i < aft.length; i++) {
		if (isValidObject(getElement(aft[i]))) {
			afttot = afttot + validateValue(aft[i]); 		
		}
	}
	// Impuestos, Comisiones, Deducciones
	for (var ix=1; ix<=25; ix++) {
		if (ix < 10) sq = "0"+ix; else sq = ""+ix;
		if (isValidObject(getElement("E01XCAM"+sq))) {
			xcntot = xcntot + validateValue("E01XCAM"+sq);
		}
		if (isValidObject(getElement("E01PAMT"+sq))) {
			pagtot = pagtot + validateValue("E01PAMT"+sq);
		}
		if (isValidObject(getElement("E01AFTM"+sq))) {
			afttot = afttot + validateValue("E01AFTM"+sq);
		}
	}
	// Totales
	if (isValidObject(getElement("E01XCNTOT"))) {
		getElement("E01XCNTOT").value = formatCCY(fixedValue(xcntot));
	}
	if (isValidObject(getElement("E01PAGTOT"))) {
		getElement("E01PAGTOT").value = formatCCY(fixedValue(pagtot));
	}
	if (isValidObject(getElement("E01AFTTOT"))) {
		getElement("E01AFTTOT").value = formatCCY(fixedValue(afttot));
	}
}

function updateDist(sec) {			// Esta funcion se llama desde los iframes
	var valor1 = 0.00; var valor2 = 0.00; var total = 0.00; var totoam = 0.00; 
	var recalc = false;
	// Reliquidaciones
	if (sec == "RC") {
		if (isValidObject(getElement("RCTOT")) && isValidObject(getElement("E01TOTCRN"))) {
			valor1 = parseFloat((document.forms[0].RCTOT.value));
			valor2 = parseFloat((document.forms[0].E01TOTCRN.value)); 
			recalc = (valor1 != valor2) ? true : recalc;
			document.forms[0].E01TOTCRN.value = document.forms[0].RCTOT.value; 
		}
		if (isValidObject(getElement("RCTOT")) && isValidObject(getElement("E01DEAOAM"))) { 
			if (getElement("E01FLGREF").value == "Y") {
				document.forms[0].E01DEAOAM.value = document.forms[0].RCTOT.value; 
			}
		}
	}		
	// Desembolso
	if (sec == "DS") {
		if (isValidObject(getElement("DSTOT")) && isValidObject(getElement("E01BALNET"))) {
			total = parseFloat((document.forms[0].E01BALNET.value)) - parseFloat((document.forms[0].DSTOT.value)); 
			document.forms[0].SALNET.value = formatCCY(total);
		}
	}
	// Seguros
	if (sec == "SG") {
		if (isValidObject(getElement("SGTOT")) && isValidObject(getElement("E01TOTSGR"))) {
			valor1 = parseFloat((document.forms[0].SGTOT.value));
			valor2 = parseFloat((document.forms[0].E01TOTSGR.value)); 
			recalc = (valor1 != valor2) ? true : recalc;
			document.forms[0].E01TOTSGR.value = document.forms[0].SGTOT.value;
		}
	}
	// Cargos Adicionales
	if (sec == "CA") {
		if (isValidObject(getElement("CAIMP")) && isValidObject(getElement("E01TOTIMP"))) {
			valor1 = parseFloat((document.forms[0].CAIMP.value));
			valor2 = parseFloat((document.forms[0].E01TOTIMP.value)); 
			recalc = (valor1 != valor2) ? true : recalc;
			document.forms[0].E01TOTIMP.value = document.forms[0].CAIMP.value;
		}
		if (isValidObject(getElement("CACOM")) && isValidObject(getElement("E01TOTCOM"))) {
			valor1 = parseFloat((document.forms[0].CACOM.value));
			valor2 = parseFloat((document.forms[0].E01TOTCOM.value)); 
			recalc = (valor1 != valor2) ? true : recalc;
			document.forms[0].E01TOTCOM.value = document.forms[0].CACOM.value;
		}
		if (isValidObject(getElement("CADED")) && isValidObject(getElement("E01TOTDED"))) {
			valor1 = parseFloat((document.forms[0].CADED.value));
			valor2 = parseFloat((document.forms[0].E01TOTDED.value)); 
			recalc = (valor1 != valor2) ? true : recalc;
			document.forms[0].E01TOTDED.value = document.forms[0].CADED.value;
		}
		if (isValidObject(getElement("CAIVA")) && isValidObject(getElement("E01TOTIVA"))) {
			valor1 = parseFloat((document.forms[0].CAIVA.value));
			valor2 = parseFloat((document.forms[0].E01TOTIVA.value)); 
			recalc = (valor1 != valor2) ? true : recalc;
			document.forms[0].E01TOTIVA.value = document.forms[0].CAIVA.value;
		}
	}
	if (recalc) {
		setRecalculate(true);
		//recalcDist();
		//Recalculate();
	}
}

function setRowColors(table){
		$('#'+table+ ' tr:visible:odd').removeClass().addClass('trclear').css('background-color', getStyleCSS(".trclear","background-color"));
	$('#'+table+ ' tr:visible:even').removeClass().addClass('trdark').css('background-color',getStyleCSS(".trdark","background-color")); 
}

function zeroDates(){
	getElement("E01NEWMDM").value = 0;
	getElement("E01NEWMDD").value = 0;
	getElement("E01NEWMDY").value = 0;
}

function goAsign() {
	var url = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=700";		
	CenterWindow(url, 30, 30, 2);		
}


function iFrameCheck() {
		
	var totalFrames = $('iframe').length;
	
	$("iframe").each(function(index) { 
			var $index = index; 
			var $this = $(this);
			setTimeout(function(){
				if ($index == totalFrames -1){
					//recalcDist();
					//Recalculate();
				}			  	
				var title = $this.contents().find('title').text();
					if (title.indexOf('Error') == -1 && title.indexOf('Untitled Document') == -1 && title.indexOf('PSocket no open') == -1) {
						return;
					} else {
						$this.attr("src", $this.attr("src"));
						return;
					}
				}, 5000);
	});
}

$().ready(function(){
	iFrameCheck();
});

</SCRIPT>
</form>
</body>
</html>
