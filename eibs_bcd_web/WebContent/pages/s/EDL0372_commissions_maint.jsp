<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Básica de Comisiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="datarec" class="datapro.eibs.beans.EDL037201Message"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

function MedioPago() {
}

</script>

</head>


<%
	boolean readOnly = false;
	boolean newOnly = false;
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly = true;
		}
	}
	if (request.getParameter("newOnly") != null) {
		if (request.getParameter("newOnly").toLowerCase().equals("true")) {
			newOnly = true;
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
%>
<h3 align="center">Comisiones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="commissions_maint.jsp,EDL0372"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0372" >
	<input TYPE=HIDDEN NAME="SCREEN" VALUE="2004">
	<input type="hidden" name="E01DEABNK" id="E01DEABNK" value="<%= datarec.getE01DEABNK().trim()%>">
	<input type="hidden" name="E01DEAACD" id="E01DEAACD" value="<%= datarec.getE01DEAACD().trim()%>">
	<input type="hidden" name="E01DCOSEQ" id="E01DCOSEQ" value="<%= datarec.getE01DCOSEQ().trim()%>">
	<input type="hidden" name="E01DCOCTY" id="E01DCOCTY" value="<%= datarec.getE01DCOCTY().trim()%>">
	<input type="hidden" name="E01DCOOAM" id="E01DCOOAM" value="<%= datarec.getE01DCOOAM().trim()%>"> 
	<input type="hidden" name="E01DCOMEP" id="E01DCOMEP" value="<%= datarec.getE01DCOMEP().trim()%>"> 
	<input type="hidden" name="E01DCOORG" id="E01DCOORG" value="<%= datarec.getE01DCOORG().trim()%>"> 
	<% int row = 0;%>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="16%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="16%" > 
							<div align="left"> 
								<eibsinput:text property="E01DEACUN" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" readonly="true"/> 
							</div>
						</td>
						<td nowrap width="16%" ><div align="right"><b>Nombre :</b></div></td>
						<td nowrap colspan="3" > 
							<div align="left"> 
								<eibsinput:text property="E01CUSNA1" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/> 
							</div>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="16%" ><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="16%" > 
							<div align="left"> 
								<eibsinput:text property="E01DEAACC" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/> 
							</div>
						</td>
						<td nowrap width="16%" ><div align="right"><b>Moneda :</b></div></td>
						<td nowrap width="16%" > 
							<div align="left"> 
								<eibsinput:text property="E01DEACCY" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true"/> 
							</div>
						</td>
						<td nowrap width="16%" ><div align="right"><b>Producto :</b></div></td>
						<td nowrap width="17%" > 
							<div align="left">
								<eibsinput:text property="E01DEAPRO" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="true"/> 
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<h4>Informacion Basica</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="12%" ><div align="right">Comisi&oacute;n	 :</div></td>
						<td nowrap width="38%"> 
							<input type="text" name="E01DCOCDE" size="5" maxlength="4" value="<%= datarec.getE01DCOCDE().trim()%>" readonly> 
							<eibsinput:text property="E01DCONAR" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
						</td>
						<td width="12%" ><div align="right">Estado :</div></td>
						<td nowrap width="38%">
							<select name="E01DCOSTS" id="E01DCOSTS" <%=readOnly?"disabled":""%>>
								<option value=" " <% if (!(datarec.getE01DCOSTS().equals("I") )) out.print("selected");%>>Activo</option>
								<option value="I" <% if (datarec.getE01DCOSTS().equals("I")) out.print("selected");%>>Inactivo</option>
							</select>
						</td>            
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="12%" ><div align="right">Fecha Inicial :</div></td>
						<td nowrap width="38%"> 
							<eibsinput:date name="datarec" fn_month="E01DCOODM" fn_day="E01DCOODD" fn_year="E01DCOODY" readonly="<%=readOnly%>"/>
						</td>
						<td width="12%" ><div align="right">Fecha Final :</div></td>
						<td nowrap width="38%"> 
							<eibsinput:date name="datarec" fn_month="E01DCODTM" fn_day="E01DCODTD" fn_year="E01DCODTY" readonly="<%=readOnly%>"/>
						</td>
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="12%" ><div align="right">Aplicacion :</div></td>
						<td nowrap width="38%"> 
							<select name="E01DCOAPC" id="E01DCOAPC" <%=readOnly?"disabled":""%>>
								<option value=" " <% if (!(datarec.getE01DCOAPC().equals("1") || datarec.getE01DCOAPC().equals("2") || datarec.getE01DCOAPC().equals("3") || datarec.getE01DCOAPC().equals("4") )) out.print("selected");%>> </option>
								<option value="1" <% if (datarec.getE01DCOAPC().equals("1")) out.print("selected");%>>Impuestos</option>
								<option value="2" <% if (datarec.getE01DCOAPC().equals("2")) out.print("selected");%>>Comisiones</option>
								<option value="3" <% if (datarec.getE01DCOAPC().equals("3")) out.print("selected");%>>Deducciones</option>
								<option value="4" <% if (datarec.getE01DCOAPC().equals("4")) out.print("selected");%>>Iva</option>
							</select>
						</td>
						<td width="12%" ><div align="right">Tipo Cargo :</div></td>
						<td nowrap width="38%"> 
							<select name="E01DCOCTY" id="E01DCOCTY" <%=readOnly?"disabled":""%>>
								<option value=" " <% if (!(datarec.getE01DCOCTY().equals("P") || datarec.getE01DCOCTY().equals("C") || datarec.getE01DCOCTY().equals("F") || datarec.getE01DCOCTY().equals("I") || datarec.getE01DCOCTY().equals("M"))) out.print("selected");%>> </option>
								<option value="P" <% if (datarec.getE01DCOCTY().equals("P")) out.print("selected");%>>Comision Principal</option>
								<option value="C" <% if (datarec.getE01DCOCTY().equals("C")) out.print("selected");%>>Comision</option>
								<option value="F" <% if (datarec.getE01DCOCTY().equals("F")) out.print("selected");%>>Comision FG</option>
								<option value="I" <% if (datarec.getE01DCOCTY().equals("I")) out.print("selected");%>>Impuesto</option>
								<option value="M" <% if (datarec.getE01DCOCTY().equals("M")) out.print("selected");%>>Ley MiPyme</option>
							</select>
						</td>            
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="12%" ><div align="right">Cuenta Acreditar :</div></td>
						<td nowrap width="38%"> 
							<eibsinput:text property="E01DCOOBK" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="<%=readOnly %>"/>              
							<input type="text" name="E01DCOOBR" size="4" maxlength="4" value="<%= datarec.getE01DCOOBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')" <%=readOnly?"readonly":""%> >
							<input type="text" name="E01DCOOCY" size="3" maxlength="3" value="<%= datarec.getE01DCOOCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')" <%=readOnly?"readonly":""%> >              
							<input type="text" name="E01DCOOGL" size="17" maxlength="17" value="<%= datarec.getE01DCOOGL().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01DCOOBK.value,document.forms[0].E01DCOOCY.value,'','','')" <%=readOnly?"readonly":""%> >        
						</td>            
						<td width="12%" ><div align="right">Cobro de IVA :</div></td>
						<td nowrap width="38%"> 
							<input type="radio" name="E01DCOIVA" value="Y" <%=readOnly?"disabled":""%> <%if(datarec.getE01DCOIVA().equals("Y")) out.print("checked");%>> Sí
							<input type="radio" name="E01DCOIVA" value="N" <%=readOnly?"disabled":""%> <%if(!datarec.getE01DCOIVA().equals("Y")) out.print("checked");%>> No
						</td>
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="12%" ><div align="right">Base de Calculo :</div></td>
						<td nowrap width="38%"> 
							<select name="E01DCOBSC" id="E01DCOBSC" <%=readOnly?"disabled":""%>>
								<option value=" " <% if (!(datarec.getE01DCOBSC().equals("O") || datarec.getE01DCOBSC().equals("B") || datarec.getE01DCOBSC().equals("I") || datarec.getE01DCOBSC().equals("T") || datarec.getE01DCOBSC().equals("P"))) out.print("selected");%>> </option>
								<option value="O" <% if (datarec.getE01DCOBSC().equals("O")) out.print("selected");%>>Monto Original</option>
								<option value="B" <% if (datarec.getE01DCOBSC().equals("B")) out.print("selected");%>>Saldo Capital</option>
								<option value="I" <% if (datarec.getE01DCOBSC().equals("I")) out.print("selected");%>>Saldo Teorico</option>
								<option value="T" <% if (datarec.getE01DCOBSC().equals("T")) out.print("selected");%>>Total Deuda</option>
							</select>
						</td>
						<td width="12%" ><div align="right">Factor de Calculo :</div></td>
						<td nowrap width="38%"> 
							<select name="E01DCOTVA" id="E01DCOTVA" <%=readOnly?"disabled":""%>>
								<option value=" " <% if (!(datarec.getE01DCOTVA().equals("F") || datarec.getE01DCOTVA().equals("P") || datarec.getE01DCOTVA().equals("1"))) out.print("selected");%>> </option>
								<option value="F" <% if (datarec.getE01DCOTVA().equals("F")) out.print("selected");%>>Monto Fijo</option>
								<option value="P" <% if (datarec.getE01DCOTVA().equals("P")) out.print("selected");%>>Porcentaje</option>
								<option value="1" <% if (datarec.getE01DCOTVA().equals("1")) out.print("selected");%>>Tasa/Periodo</option>
							</select>
						</td>            
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="12%" ><div align="right">Valor Cargo :</div></td>
						<td nowrap width="38%"> 
							<eibsinput:text name="datarec" property="E01DCOFVA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="12%" ><div align="right">Valor Comisiones :</div></td>
						<td nowrap width="38%"> 
							<eibsinput:text name="datarec" property="E01DCOAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly %>"/>
						</td>            
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="12%" ><div align="right">Forma de Pago :</div></td>
						<td nowrap width="38%"> 
							<select name="E01DCOPVI" id="E01DCOPVI" <%=readOnly?"disabled":""%>>
								<option value=" " <% if (!(datarec.getE01DCOPVI().equals("1") || datarec.getE01DCOPVI().equals("2") || datarec.getE01DCOPVI().equals("3") || datarec.getE01DCOPVI().equals("4") || datarec.getE01DCOPVI().equals("5") )) out.print("selected");%>> </option>
								<option value="1" <% if (datarec.getE01DCOPVI().equals("1")) out.print("selected");%>>Apertura</option>
								<option value="2" <% if (datarec.getE01DCOPVI().equals("2")) out.print("selected");%>>En Cuotas</option>
								<option value="3" <% if (datarec.getE01DCOPVI().equals("3")) out.print("selected");%>>Todas las Cuotas</option>
								<option value="4" <% if (datarec.getE01DCOPVI().equals("4")) out.print("selected");%>>Apertura y Cuotas</option>
								<option value="5" <% if (datarec.getE01DCOPVI().equals("5")) out.print("selected");%>>Apertura Periodica</option>
							</select>
						</td>
						<td width="12%" ><div align="right">Cuotas :</div></td>
						<td nowrap width="38%"> 
							<eibsinput:text name="datarec" property="E01DCONCU" size="6" maxlength="5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" readonly="<%=readOnly%>"/>
						</td>            
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="12%" ><div align="right">Medio de Pago :</div></td>
						<td nowrap width="38%"> 
							<select name="E01DCOMPG" id="E01DCOMPG" <%=readOnly?"disabled":""%>>
								<option value=" " <% if (!(datarec.getE01DCOMPG().equals("D") || datarec.getE01DCOMPG().equals("A") || datarec.getE01DCOMPG().equals("G"))) out.print("selected");%>> </option>
								<option value="D" <% if (datarec.getE01DCOMPG().equals("D")) out.print("selected");%>>Con Desembolso</option>
								<option value="A" <% if (datarec.getE01DCOMPG().equals("A")) out.print("selected");%>>Cuenta Cliente</option>
								<option value="G" <% if (datarec.getE01DCOMPG().equals("G")) out.print("selected");%>>Cuenta Contable</option>
							</select>
						</td>
						<td width="12%" ><div align="right"></div></td>
						<td nowrap width="38%"> 
						</td>            
					</tr>        
				</table>
			</td>
		</tr>
	</table>                        

<% if (datarec.getE01DCOCTY().equals("M")) { %>
	<h4>Comisi&oacute;n MiPyme</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="12%" ><div align="right">Periodo :</div></td>
						<td nowrap width="38%"> 
							<eibsinput:text name="datarec" property="E01DCONPR" size="6" maxlength="5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" readonly="<%=readOnly%>"/>
						</td>            
						<td width="12%" ><div align="right">Saldo :</div></td>
						<td nowrap width="38%"> 
							<eibsinput:text name="datarec" property="E01DCOPRI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly %>"/>
						</td>            
					</tr>        
				</table>
			</td>
		</tr>
	</table>   
<% } else { %>
	<input type=HIDDEN NAME="E01DCONPR" id="E01DCONPR" value="<%= datarec.getE01DCONPR().trim()%>"> 
	<input type=HIDDEN NAME="E01DCOPRI" id="E01DCOPRI" value="<%= datarec.getE01DCOPRI().trim()%>"> 
<% } %>

	<br>

<% if (readOnly) { %>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
	</div>     
<% } else { %>
	<div align="center">
		<table class="tbenter" >
			<tr>
				<td align="right"><input id="EIBSBTN" type=button name="Submit" value="Enviar" onclick="javascript:goAction(2004);"></td>
				<td>&nbsp;</td>
				<td align="left"><input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(2005);"></td>
			</tr>
		</table>
	</div>
<% } %>

</form>

<script type="text/javascript">
	
</script>

</body>
</html>
