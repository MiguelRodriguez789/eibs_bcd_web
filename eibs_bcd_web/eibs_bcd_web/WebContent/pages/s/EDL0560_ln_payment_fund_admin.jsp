<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import = "datapro.eibs.master.*" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<html>
<head>
<title>Administracion de Fondos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-paymentplan.jsp"></script>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="lnData" class="datapro.eibs.beans.EDL056001Message" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT type="text/javascript">

		
 function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();		
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
%> 

<h3 align="center">Administraci&oacute;n de Fondos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_payment_fund_admin.jsp, EDL0560"></h3>
<hr size="4">
<form method="post" name="firstForm" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0560">
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="105">
	<INPUT TYPE=HIDDEN NAME="E01DEAOPE" id="E01DEAOPE" VALUE="1">
	<INPUT TYPE=HIDDEN NAME="E01DEABNK" id="E01DEABNK" VALUE="<%=lnData.getE01DEABNK().trim()%>">
	<INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="<%=lnData.getH01FLGWK1().trim()%>">
	
	<% int row = 0;%>
	<% 
	 String field="";
	 int numField=25;
	 for(int i=1;i <= numField;i++){
		 field = (i < 10) ? "0"+ i : ""+ i;
		 try {
			if (!(lnData.getField("PTYP"+field).getString().trim().equals(""))) {
	 %>
		 <INPUT TYPE=HIDDEN NAME="PAMT<%= field%>" VALUE="<%= lnData.getField("E01PAMT"+field).getString().trim()%>">
	 <% } 
		 }
		 catch (Exception e) {
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
								<input type="text" size="10" maxlength="9" name="E01DEACUN" value="<%= lnData.getE01DEACUN().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="30%" > 
							<div align="left">
								<input type="text" size="60" maxlength="60" name="E01CUSNA1" value="<%= lnData.getE01CUSNA1().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="15%"><div align="right"><b>Tipo Producto : </b></div></td>
						<td nowrap width="15%"> 
							<div align="left">
								<b><input type="text" size="5" maxlength="4" name="E01DEATYP" value="<%= lnData.getE01DEATYP().trim()%>" readonly></b> 
							</div> 
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="15%"> 
							<div align="left">
								<input type="text" size="13" maxlength="12" name="E01DEAACC" value="<%= lnData.getE01DEAACC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="30%"> 
							<div align="left">
								<b><input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= lnData.getE01DEACCY().trim()%>" readonly></b>
							</div>
						</td>
						<td nowrap width="15%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="15%"> 
							<div align="left">
								<b><input type="text" size="5" maxlength="4" name="E01DEAPRO" value="<%= lnData.getE01DEAPRO().trim()%>" readonly></b>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
 
	<%row++;%> 
	<h4>Distribuci&oacute;n del Pago</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="center"><b>Concepto</b></div></td>
						<td nowrap><div align="center"><b>Saldo Anterior</b></div></td>
						<td nowrap><div align="center"><b>A Pagar</b></div></td>
						<td nowrap><div align="center"><b>Nuevo Saldo</b></div></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">PRINCIPAL :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFPRI" size="16" maxlength="16" value="<%= lnData.getE01BEFPRI().trim()%>" readonly >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01TRNPRI" size="16" maxlength="16" value="<%= lnData.getE01TRNPRI().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTPRI" size="16" maxlength="16" value="<%= lnData.getE01AFTPRI().trim()%>" readonly>
						</td>
					</tr>
					<%if(lnData.getH01FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td align="center" nowrap><div align="right">REAJUSTE :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFREA" size="16" maxlength="16" value="<%= lnData.getE01BEFREA().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01TRNREA" size="16" maxlength="16" value="<%= lnData.getE01TRNREA().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)" readonly >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTREA" size="16" maxlength="16" value="<%= lnData.getE01AFTREA().trim()%>" onkeypress="enterSignCCY(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)"  ><input type="text" class="txtright" name="E01AFTREA" size="16" maxlength="16" value="<%= lnData.getE01AFTREA().trim()%>" readonly>
						</td>
					</tr>
					<%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap ><div align="right">INTERESES BALANCE :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFINV" size="16" maxlength="16" value="<%= lnData.getE01BEFINV().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01TRNINV" size="16" maxlength="16" value="<%= lnData.getE01TRNINV().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)" readonly >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTINV" size="16" maxlength="16" value="<%= lnData.getE01AFTINV().trim()%>" readonly>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap ><div align="right">INTERESES CONTINGENTE :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFINC" size="16" maxlength="16" value="<%= lnData.getE01BEFINC().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01TRNINC" size="16" maxlength="16" value="<%= lnData.getE01TRNINC().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)" readonly >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTINC" size="16" maxlength="16" value="<%= lnData.getE01AFTINC().trim()%>" readonly>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">MORA BALANCE :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFMOV" size="16" maxlength="16" value="<%= lnData.getE01BEFMOV().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01TRNMOV" size="16" maxlength="16" value="<%= lnData.getE01TRNMOV().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)" readonly >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTMOV" size="16" maxlength="16" value="<%= lnData.getE01AFTMOV().trim()%>" readonly>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">MORA CONTINGENTE :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFMOC" size="16" maxlength="16" value="<%= lnData.getE01BEFMOC().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01TRNMOC" size="16" maxlength="16" value="<%= lnData.getE01TRNMOC().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)" readonly >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTMOC" size="16" maxlength="16" value="<%= lnData.getE01AFTMOC().trim()%>" readonly>
						</td>
					</tr>
					<%if(currUser.getE01INT().equals("07")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">F.E.C.I. :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFOTH" size="16" maxlength="16" value="<%= lnData.getE01BEFOTH().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01TRNOTH" size="16" maxlength="16" value="<%= lnData.getE01TRNOTH().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this);" onKeypress="enterDecimal(event, 2)" readonly >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTOTH" size="16" maxlength="16" value="<%= lnData.getE01AFTOTH().trim()%>" readonly>
						</td>
					</tr>
					<%}%>
					<%
						String seq = "";
						for (int i = 1; i < 26; i++) {	
						  if (i < 10) seq = "0"+i; else seq = ""+i;
						  if(!lnData.getField("E01PDSC"+seq).getString().trim().equals("")) {
					%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap>
							<input type="hidden" name="E01PTYP<%= seq%>" value="<%=lnData.getField("E01PTYP"+seq).getString().trim()%>">
							<div align="right"><%=lnData.getField("E01PDSC"+seq).getString().trim()%> :</div>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFM<%=seq%>" size="16" maxlength="16" value="<%=lnData.getField("E01BEFM"+seq).getString().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01PAMT<%=seq%>" size="16" maxlength="16" value="<%=lnData.getField("E01PAMT"+seq).getString().trim()%>" onkeypress="enterDecimal(event, 2)" onchange="calculateConcepto(this,'<%=seq%>');" onKeypress="enterDecimal(event, 2)" readonly >
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTM<%=seq%>" size="16" maxlength="16" value="<%=lnData.getField("E01AFTM"+seq).getString().trim()%>" readonly>
						</td>
					</tr>
					<%
					    }
					  }
					%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">TOTAL :</div></td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01BEFTOT" size="16" maxlength="16" value="<%= lnData.getE01BEFTOT().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01TRNTOT" size="16" maxlength="16" value="<%= lnData.getE01TRNTOT().trim()%>" readonly>
						</td>
						<td align="center" nowrap> 
							<input type="text" class="txtright" name="E01AFTTOT" size="16" maxlength="16" value="<%= lnData.getE01AFTTOT().trim()%>" readonly>
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
								<input type=text name="E01PAGOPC" value="<%= lnData.getE01PAGOPC().trim()%>" size="3" maxlength="2">
								<input type=HIDDEN name="E01PAGOGL" value="<%= lnData.getE01PAGOGL().trim()%>">
								<input type="text" name="E01PAGCON" size="45" maxlength="45" readonly value="<%= lnData.getE01PAGCON().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01DEABNK.value, document.forms[0].E01PAGOCY.value,'E01PAGOGL','E01PAGOPC','10','02')">
							</div>
						</td>
						<td nowrap> 
							<div align="center"> 
								<input type="text" name="E01PAGOBK" size="3" maxlength="2" value="<%= lnData.getE01PAGOBK().trim()%>">
							</div>
						</td>
						<td nowrap> 
							<div align="center"> 
								<input type="text" name="E01PAGOBR" size="5" maxlength="4" value="<%= lnData.getE01PAGOBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
							</div>
						</td>
						<td nowrap> 
							<div align="center"> 
								<input type="text" name="E01PAGOCY" size="4" maxlength="3" value="<%= lnData.getE01PAGOCY().trim()%>"
								 class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
							</div>
						</td>
						<td nowrap> 
							<div align="center"> 
						 <% if(userPO.getPurpose().equals("MAINTENANCE")){%>
								<input type="text" name="E01PAGOAC" size="13" maxlength="12" value="<%= lnData.getE01PAGOAC().trim()%>"
								 class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01DEABNK.value,'','','','RT')">
						 <% } else {%>
							 <input type="text" name="E01PAGOAC" size="13" maxlength="12" value="<%= lnData.getE01PAGOAC().trim()%>"
								 class="context-menu-inq" onmousedown="init(inqAccount, this.value)" readonly >           
						 <% } %>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap><div align="right">Descripcion :</div></td>
						<td nowrap colspan=5> 
							<INPUT type="text" size="60" maxlength="60" name="E01DEANR1" value="<%= lnData.getE01DEANR1().trim()%>" readonly><br>
							<INPUT type="text" size="60" maxlength="60" name="E01DEANR2" value="<%= lnData.getE01DEANR2().trim()%>">
						</td>
					</tr>
				</table>  
			</td>
		</tr>
	</table>
	<br>
	
	<p align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	</p>

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
	var valbef;	var valpag;	var valaft;

	if (seq === undefined) {
		fld = ["E01BEF","E01TRN","E01AFT"];
		fldnam = obj.name.substring(0,6);
		fldcpt = obj.name.substring(6);
	} else {
		fld = ["E01BEFM","E01PAMT","E01AFTM"];
		fldnam = obj.name.substring(0,7);
		fldcpt = obj.name.substring(7);
	}
	valbef = validateValue(fld[0] + fldcpt);
	valpag = validateValue(fld[1] + fldcpt);
	valaft = validateValue(fld[2] + fldcpt);

	// A Pagar
	if (fldnam == fld[1]) {
		if (fldcpt != "PRI") {
			if (valpag > valbef) {
				valpag = valbef;
			}
		}
		if (fldcpt == "PRI") {
			if (valpag > valbef) {
				valpag = 0.00;
			}
		}
	}
	// After
	valaft = fixedValue(valbef - valpag);
	// Totales
	getElement(fld[1]+fldcpt).value = formatCCY(valpag);
	if (isValidObject(getElement(fld[2]+fldcpt))) {
		getElement(fld[2]+fldcpt).value = formatCCY(valaft);
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

</SCRIPT>
</form>
</body>
</html>
