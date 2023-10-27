<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import = "datapro.eibs.master.*" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.eibs.constants.StyleID"%>

<html>
<head>
<title>Suspension Debito Automatico</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "lnAutoDebit" class= "datapro.eibs.beans.EDL015210Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
<%if (userPO.getPurpose().equals("MAINTENANCE")){%>
	<%if (userPO.getOption().equals("PV")){%>
		 builtNewMenu(pv_m_opt);
	<%}else{%>
			builtNewMenu(dft_m_opt);
	<%}
	}
	%>

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}
	
function setCheckbox(chk){
	if (isValidObject(getElement("E10DLASTS"))) {
		if (chk) {
			getElement("E10DLASTS").value = "A";
		} else {
			getElement("E10DLASTS").value = "I";
		}
		
	}
 } 
 
</SCRIPT>
</head>

<%
	boolean readOnly = false;
	boolean iFrame = false;

	// Determina si es solo lectura
	if (userPO.getPurpose().equals("APPROVAL_INQ")) {
		readOnly = true;
	}

	// Determina si se llama desde un iFrame
	if (request.getParameter("iFrame") != null) {
		if (request.getParameter("iFrame").toLowerCase().equals("true")) {
			iFrame = true;
		}
	}
%>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
		 error.setERRNUM("0");
		 out.println("<SCRIPT Language=\"Javascript\">");
		 out.println("       showErrors()");
		 out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") ) {
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
%>

<%if (!iFrame){ %> 
<h3 align="center">Bloqueo Recepci&oacute;n De Pagos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_cancel_bloqueo_pago.jsp, EDL0150"></h3>
<hr size="4">
<%}%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="344">
	<INPUT TYPE=HIDDEN NAME="E10DEABNK" VALUE="<%= lnAutoDebit.getE10DEABNK().trim()%>">
<%--
	<INPUT TYPE=HIDDEN NAME="E10DLASTS" VALUE="<%= lnAutoDebit.getE10DLASTS().trim()%>"> 
--%>
	
<%if (!iFrame){ %> 
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="16%" > 
							<div align="right"><b>Cliente :</b></div>
						</td>
						<td nowrap width="20%" > 
							<div align="left">
								<input type="text" name="E10DEACUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
							</div>
						</td>
						<td nowrap width="16%" > 
							<div align="right"><b>Nombre :</b> </div>
						</td>
						<td nowrap colspan="3" > 
							<div align="left">
								<input type="text" name="E10CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
							 </div>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="16%"> 
							<div align="right"><b>Préstamo :</b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left">
								<input type="text" name="E10DEAACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="16%"> 
							<div align="right"><b>Moneda : </b></div>
						</td>
						<td nowrap width="16%"> 
							<div align="left"><b>
								<input type="text" name="E10DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
								</b> </div>
						</td>
						<td nowrap width="16%"> 
							<div align="right"><b>Producto : </b></div>
						</td>
						<td nowrap width="16%"> 
							<div align="left"><b>
								<input type="text" name="E10DEAPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
								</b> </div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<%}%>

<%if (!iFrame){ %> 
	<h4>Informaci&oacute;n B&aacute;sica</h4>
<%}%>
<%if (iFrame){ %> 
	<h4>Bloqueo Recepci&oacute;n De Pagos</h4>
<%}%>
	<%int row = 0; %>
	<table class="tableinfo">
		<tr > 
			<td> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td><div align="right">Bloqueo :</div></td>
						<td> 
							<select name="E10DLASTS" id="E10DLASTS" <%if (readOnly) out.print("disabled");%> <%if (lnAutoDebit.getF10DLASTS().equals("Y")) out.print("class=\"txtchanged\"");%> >
								<option value=" " <% if (!lnAutoDebit.getE10DLASTS().equals("A") || !lnAutoDebit.getE10DLASTS().equals("I")) out.print("selected"); %>></OPTION>
								<option value="A" <% if (lnAutoDebit.getE10DLASTS().equals("A")) out.print("selected");%>>Activo</option>
								<option value="I" <% if (lnAutoDebit.getE10DLASTS().equals("I")) out.print("selected");%>>Inactivo</option>
							</select>
							<%-- 
							<input type="checkbox" name="DLASTS" <%if (lnAutoDebit.getE10DLASTS().equals("A")) out.print("checked"); %> onChange="setCheckbox(this.checked)" <% if (readOnly) out.print(" disabled");%> <% if (lnAutoDebit.getF10DLASTS().equals("Y")) out.print("class=\"txtchanged\""); %> > 
							--%>
						</td>
					</tr>
					<%--
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="40%"><div align="right">Fecha Inicio :</div></td>
						<td width="60%">
							<eibsinput:date name="lnAutoDebit" fn_year="E10DLASDY" fn_month="E10DLASDM" fn_day="E10DLASDD" />
						</td>
					</tr>
					--%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td><div align="right">Fecha Vencimiento :</div></td>
						<td>
							<eibsinput:date name="lnAutoDebit" fn_year="E10DLAMAY" fn_month="E10DLAMAM" fn_day="E10DLAMAD" readonly="<%=readOnly%>" modified="F10DLAMAY;F10DLAMAD;F10DLAMAM" />
						</td>
					</tr>
					<%--
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td> 
							<div align="right">Motivo :</div>
						</td>
						<td> 
							<input type="text" name="E10DLAMO1" size="60" maxlength="60" value="<%= lnAutoDebit.getE10DLAMO1().trim()%>">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td> 
							<div align="right"></div>
						</td>
						<td> 
							<input type="text" name="E10DLAMO2" size="60" maxlength="60" value="<%= lnAutoDebit.getE10DLAMO2().trim()%>">
						</td>
					</tr>
					--%>
				</table>
			</td>
		</tr>
	</table>
	
	<%--
	<h4>Informaci&oacute;n Cuenta Provisional</h4>
	<table class="tableinfo">
		<tr > 
			<td> 
			 <table style="border: 0px; width: 100%">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="28%"> 
							<div align="center">Concepto</div>
						</td>
						<td nowrap width="10%"> 
							<div align="center">Banco </div>
						</td>
						<td nowrap width="10%"> 
							<div align="center">Sucursal</div>
						</td>
						<td nowrap> 
							<div align="center">Moneda </div>
						</td>
						<td nowrap> 
							<div align="center">Referencia</div>
						</td>
					 
					</tr>

					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="28%" > 
							<div align="center" > 
								<input type="text" name="E10DLAOPE" value="<%= lnAutoDebit.getE10DLAOPE().trim()%>" size="3" maxlength="3">
								<input type="hidden" name="E10DLADGL" value="<%= lnAutoDebit.getE10DLADGL().trim()%>">
								<input type="text" name="E10DLACON" size="25" maxlength="25" readonly value="<%= lnAutoDebit.getE10DLACON().trim()%>"
					class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E10DEABNK.value, document.forms[0].E10DLADCY.value ,'E10DLADGL','E10DLAOPE','10', '02')">
				</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
								<input type="text" name="E10DLADBK" size="2" maxlength="2" value="<%= lnAutoDebit.getE10DLADBK().trim()%>">
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
								<input type="text" name="E10DLADBR" size="4" maxlength="4" value="<%= lnAutoDebit.getE10DLADBR().trim()%>"
								 class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E10DEABNK.value,'','','','')"> 
							 </div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
								<input type="text" name="E10DLADCY" size="3" maxlength="3" value="<%= lnAutoDebit.getE10DLADCY().trim()%>"
								 class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E10DEABNK.value,'','','','')">
							</div>
				</td>
						<td nowrap width="14%" > 
							<div align="center"> 
								<input type="text" name="E10DLADAC" size="12" maxlength="12"  value="<%= lnAutoDebit.getE10DLADAC().trim()%>"
								class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E10DEABNK.value,'',document.forms[0].E10DEACUN.value,'','RT')">
							</div>
			</td>
			
					</tr><%row++;%>
					</table>
			 
			 
			</td>
		</tr>
	</table>
	--%>

<%if (!iFrame){ %> 
	<h4>Ultima Modificaci&oacute;n</h4>
	<table class="tableinfo">
		<tr > 
			<td> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="15%"><div align="right">Usuario :</div></td>
						<td width="35%">
							<input type="text" name="E10DLAUSR" size="12" maxlength="10" value="<%= lnAutoDebit.getE10DLAUSR().trim()%>" readonly>
						</td>
						<td width="15%"><div align="right">Fecha :</div></td>
						<td width="35%">
							<eibsinput:date name="lnAutoDebit" fn_year="E10DLALDY" fn_month="E10DLALDM" fn_day="E10DLALDD" readonly="true" modified="F10DLALDY;F10DLALDD;F10DLALDM" />
						</td>
					</tr>
				 </table>
			</td>
		</tr>
	</table>
<%}%>
	
<%if (!iFrame){ %> 
	<% if (!readOnly) { %>
	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	</div>
	<% } else { %>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
	</div>     
	<% } %>
<%}%>
	
</form>
</body>
</html>
