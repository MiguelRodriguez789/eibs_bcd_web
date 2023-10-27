<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="datapro.eibs.master.Util" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>

<html>
<head>
<title>Productos de Prestamos Nuevo/Mantenimiento</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT type="text/javascript">
	<% if (!userPO.getHeader23().equals("NO_MENU")) { %>
	builtNewMenu(prd_loan_opt);
	initMenu();
	<% } %>

	function showControlPrepagos(obj) {
		if (obj.value == '%' ){
			document.getElementById("datos1").style.display = 'table-cell';
			document.getElementById("datos2").style.display = 'none';
			document.getElementById("datos3").style.display = 'table-cell';
			document.getElementById("datos4").style.display = 'none';
			document.getElementById("datos5").style.display = 'none';
		} else if (obj.value == 'N' ){    
			document.getElementById("datos1").style.display = 'none';
			document.getElementById("datos2").style.display = 'table-cell';
			document.getElementById("datos3").style.display = 'table-cell';
			document.getElementById("datos4").style.display = 'none';
			document.getElementById("datos5").style.display = 'none';
		} else {
			document.getElementById("datos1").style.display = 'none';
			document.getElementById("datos2").style.display = 'none';
			document.getElementById("datos3").style.display = 'none';
			document.getElementById("datos4").style.display = 'table-cell';
			document.getElementById("datos5").style.display = 'table-cell';
		}
	}

	function showCred(obj) {
		if (obj.value == 'I' ){
			document.getElementById("typeOrow").style.display = 'none';
			document.getElementById("creditlinesTable").style.display = 'table';
			document.getElementById("overdraftControlTable").style.display = 'none';
		} else if (obj.value == 'O' ){
			document.getElementById("typeOrow").style.display = 'table-row';
			document.getElementById("creditlinesTable").style.display = 'none';
			document.getElementById("overdraftControlTable").style.display = 'table';
		} else {
			document.getElementById("typeOrow").style.display = 'none';
			document.getElementById("creditlinesTable").style.display = 'none';
			document.getElementById("overdraftControlTable").style.display = 'none';
		}
	}
			 
	function ShowDeduction(TypeSel) {
		if (TypeSel == 'Y') {  
			divAddOpt.style.display = "";
		} else {
			divAddOpt.style.display = "none";
		}
	}  

	function ShowFomento(TypeSel) {
		// Y=Activo A=Pasivo N=No
		if (TypeSel == 'Y') {  
			divFomAct1.style.display = "";
			divFomAct2.style.display = "";
			divFomPas1.style.display = "none";
			divFomPas2.style.display = "none";
			getElement('E01APAUC5').value = "";
		} else if (TypeSel == 'A') {
			divFomAct1.style.display = "none";
			divFomAct2.style.display = "none";
			divFomPas1.style.display = "";
			divFomPas2.style.display = "";
			getElement('E01APAUC4').value = "";
		} else {
			divFomAct1.style.display = "none";
			divFomAct2.style.display = "none";
			divFomPas1.style.display = "none";
			divFomPas2.style.display = "none";
			getElement('E01APAUC4').value = "";
			getElement('E01APAUC5').value = "";
		}
	}
	
	function consultaComissionTable() {
		getElement('SCREEN').value = 2000;
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0525EX";
		document.forms[0].action = page;
		document.forms[0].submit();
	}   

</SCRIPT>

<%
	boolean readOnly = false;
	// Determina si es solo lectura
	if (("1".equals(currUser.getH01WK1()))) {
		readOnly = true;
	}
	if ((request.getParameter("readOnly") != null)) {
		if (request.getParameter("readOnly").toLowerCase().equals("true")) {
			readOnly = true;
		}
	}
%>
<% if (readOnly) { %>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>

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

<h3 align="center">Producto de Pr�stamos

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_loans.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" onMouseMove="showCred(document.forms[0].E01APCFRN);" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1"> 
	<INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
	<INPUT TYPE=HIDDEN NAME="E01BANK" VALUE="<%= currUser.getE01UBK()%>">
	<INPUT TYPE=HIDDEN NAME="E01APAF08" id="E01APAF08" VALUE="<%= prd.getE01APAF08()%>">
	<INPUT TYPE=HIDDEN NAME="E01APAGL1" id="E01APAGL1" VALUE="<%= prd.getE01APAGL1()%>">
	<INPUT TYPE=HIDDEN NAME="E01APAFC5" id="E01APAFC5" VALUE="<%= prd.getE01APAFC7()%>">
	<INPUT TYPE=HIDDEN NAME="E01APAFC7" id="E01APAFC7" VALUE="<%= prd.getE01APAFC8()%>">
	<INPUT TYPE="hidden" NAME="H01FLGMAS" value="A">
	
	<%int row = 0; %>  
	<table class="tableinfo" style="width: 100%;">
		<tr>
			<td>
				<table cellspacing="0" cellpadding="2" width="100%" class="tbhead">
					<tr id="trdark">
						<td nowrap width="10%" align="right">Banco :</td>
						<td nowrap width="12%" align="left">
							<input type="text" name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
						</td>
						<td nowrap width="6%" align="right">Producto :</td>
						<td nowrap width="14%" align="left">
							<input type="text" name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
						</td>
						<td nowrap width="8%" align="right">Tipo de Producto :</td>
						<td nowrap width="50%" align="left">
							<input type="text" name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" readonly> - 
							<input type="text" name="E01DSCTYP" size="45" maxlength="45" value="<%= prd.getE01DSCTYP()%>" readonly>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<h4>Informaci&oacute;n General</h4>
	<table class="tableinfo" style="width: 100%;">
		<tr>
			<td>
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Descripci&oacute;n :</div></td>
						<td width="25%">
							<input type="text" name="E01APCDS1" size="50" maxlength="45" value="<%= prd.getE01APCDS1()%>">
						</td>
						<td width="25%"><div align="right">Nombre de Mercadeo :</div></td>
						<td width="25%">
							<input type="text" name="E01APCDS2" size="28" maxlength="25" value="<%= prd.getE01APCDS2()%>">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">C&oacute;digo de Moneda :</div></td>
						<td width="25%">
							<input type="text" name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>"> 
							<a href="javascript:GetCurrency('E01APCCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Ofrecimiento por :</div></td>
						<td width="25%">
							<select name="E01APCFTT">
								<option value="1" <%if (prd.getE01APCFTT().equals("1")) { out.print("selected"); }%>>Internet </option>
								<option value="I" <%if (prd.getE01APCFTT().equals("I")) { out.print("selected"); }%>>Internacional </option>
								<option value="L" <%if (prd.getE01APCFTT().equals("L")) { out.print("selected"); }%>>Local </option>
								<option value="3" <%if (prd.getE01APCFTT().equals("3")) { out.print("selected"); }%>>Plataforma </option>
								<option value="5" <%if (prd.getE01APCFTT().equals("5")) { out.print("selected"); }%>>Cualquier Medio </option>
								<option value="N" <%if (prd.getE01APCFTT().equals("N")) { out.print("selected"); }%>>No Ofrecer</option>
							</select>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Cuenta Contable:</div></td>
						<td width="25%">
							<input type="text" name="E01APCGLN" size="18" maxlength="16" value="<%= prd.getE01APCGLN() %>"> 
							<a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,document.forms[0].E01APCACD.value,'','<%= prd.getE01APCTYP().trim()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Tipo de Residencia :</div></td>
						<td width="25%">
							<select name="E01APCRES">
								<option value=""  <%if (prd.getE01APCRES().equals(""))   { out.print("selected"); }%>>Cualquiera</option>
								<option value="1" <%if (prd.getE01APCRES().equals("1")) { out.print("selected"); }%>>Residentes</option>
								<option value="2" <%if (prd.getE01APCRES().equals("2")) { out.print("selected"); }%>>Extranjeros</option>
							</select>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Tipo de Cliente :</div></td>
						<td width="25%"> 
							<select name="E01APCFRA">
								<option value=" " <%if (prd.getE01APCFRA().equals(" ")) { out.print("selected"); }%>>Cualquiera</option>
								<option value="0" <%if (prd.getE01APCFRA().equals("0")) { out.print("selected"); }%>>Socio</option>
								<option value="1" <%if (prd.getE01APCFRA().equals("1")) { out.print("selected"); }%>>Empresa</option>
								<option value="2" <%if (prd.getE01APCFRA().equals("2")) { out.print("selected"); }%>>Persona</option>
								<option value="3" <%if (prd.getE01APCFRA().equals("3")) { out.print("selected"); }%>>Menor de Edad</option>
								<option value="4" <%if (prd.getE01APCFRA().equals("4")) { out.print("selected"); }%>>Empleados</option>
							</select>
						</td>
						<td nowrap width=25% align="right"><div align="right">Requiere Convenio :</div></td>
						<td width="25%">
							<input type="radio" name="E01APAOVC" value="Y" <%if (prd.getE01APAOVC().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APAOVC" value="N" <%if (prd.getE01APAOVC().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Tabla de Documentos :</div></td>
						<td width="25%">
							<input type="text" name="E01APCDOC" size="4" maxlength="2" value="<%= prd.getE01APCDOC() %>" onKeypress="enterInteger(event)"> 
							<a href="javascript:GetDocInv('E01APCDOC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Producto Familia :</div></td>
						<td width="25%">
							<input type="text" name="E01APCUC1" size="4" maxlength="2" value="<%= prd.getE01APCUC1() %>">
						</td>
					</tr>
					<% if (currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++; %>">
						<td width="25%"><div align="right">N�mero de Registro RECA : </div></td>
						<td width="25%" >
							<input type="text" name="E01APAD01" size="40" maxlength="35" value="<%= prd.getE01APAD01() %>" >
						</td>
						<td nowrap width=25% align="right"><div align="right"></div></td>
						<td width="25%"></td>
					</tr>
					<% } %>
					<% if(currUser.getE01INT().equals("05")) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Codigo FINAC :</div></td>
						<td width="25%" >
							<eibsinput:cnofc name="prd" property="E01APAUC3" required="false" flag="CH" fn_code="E01APAUC3" />
						</td>
						<td nowrap width=25% align="right"><div align="right">Comision: </div></td>
						<td width="25%">
							<input type="text" name="E01APAUC9" size="5" maxlength="4" value="<%= prd.getE01APAUC9().trim() %>">
							<input type="hidden" name="DSCAPAUC9" size="5" maxlength="4" value="">
							<a href="javascript:GetCommission('E01APAUC9','DSCAPAUC9')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
						</td>
					</tr>
					<% } %>    
					<% if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++; %>">
						<td width="25%" align="right">Permite Clientes Simplificados : </td>
						<td width="25%" >
							<input type="radio" name="E01APCTX9" value="Y" <%if (prd.getE01APCTX9().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCTX9" value="N" <%if (prd.getE01APCTX9().equals("N")) out.print("checked"); %>> No
						</td>
						<td nowrap width=25% align="right"><div align="right">Calculo de CAE :</div></td>
						<td width="25%">
							<input type="radio" name="E01APAFG2" value="Y" <%if (prd.getE01APAFG2().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APAFG2" value="N" <%if (prd.getE01APAFG2().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<% } %>
				</table>
			</td>
		</tr>
	</table>
	
	<h4>Impuestos </h4>
	<table class="tableinfo" style="width: 100%;">
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="15%" ><div align="center"> </div></td>
						<td nowrap width="10%" ><div align="center">ISR</div></td>
						<td nowrap width="10%" ><div align="center">IVA/ITBMS</div></td>
						<td nowrap width="10%" ><div align="center">IDB/GMF</div></td>
						<td nowrap width="10%" > 
							<div align="center"> 
							<% if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %>  
							FECI 
							<% } else if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) {%>
							ITE
							<% } %>
							</div>     
						</td>
						<td nowrap width="10%" ><div align="center"> </div></td>
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="15%" ><div align="center"> </div></td>
						<td nowrap width="10%" >
							<div align="center"> 
								<select id="E01APCTX1" name="E01APCTX1" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(prd.getE01APCTX1().equals("1")) out.print("selected");%>> SI </option>
									<option value="0" <% if(prd.getE01APCTX1().equals("0")) out.print("selected");%>> NO </option>
								</select>        
							</div>
						</td>
						<td nowrap width="10%"  > 
							<div align="center"> 
								<select id="E01APCTX2" name="E01APCTX2" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(prd.getE01APCTX2().equals("1")) out.print("selected");%>> SI </option>
									<option value="0" <% if(prd.getE01APCTX2().equals("0")) out.print("selected");%>> NO </option>
								</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
								<select id="E01APCTX3" name="E01APCTX3" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(prd.getE01APCTX3().equals("1")) out.print("selected");%>> SI </option>
									<option value="0" <% if(prd.getE01APCTX3().equals("0")) out.print("selected");%>> NO </option>
								</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
								<% if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA")) || currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) { %> 
								<select id="E01APCTX4" name="E01APCTX4" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(prd.getE01APCTX4().equals("1")) out.print("selected");%>> SI </option>
									<option value="0" <% if(prd.getE01APCTX4().equals("0")) out.print("selected");%>> NO </option>
								</select>                 
								<% } %>        
							</div>
						</td>
						<td nowrap width="10%" ><div align="center"> </div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Informaci&oacute;n Adicional</h4>
	<table class="tableinfo" style="width: 100%;">
		<tr>
			<td>
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Clase de Prestamo :</div></td>
						<td width="25%">
							<input type="text" name="E01APCFRN" id="E01APCFRN" size="3" maxlength="1" value="<%=prd.getE01APCFRN()%>" readonly > 
							<a href="javascript:GetCode('E01APCFRN','STATIC_ln_cred_class.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Entregas Graduales :</div></td>
						<td width="25%">
							<input type="radio" name="E01APCCHR" value="Y" <%if (!prd.getE01APCCHR().equals("N")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCCHR" value="N" <%if (prd.getE01APCCHR().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">C&aacute;lculo de Interes Normal :</div></td>
						<td width="25%">
							<input type="text" name="E01APCMCI" size="3" maxlength="1" value="<%= prd.getE01APCMCI() %>" readonly> 
							<a href="javascript:GetCode('E01APCMCI','STATIC_ln_prov.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Deducciones :</div></td>
						<td width="25%">
							<input type="radio" name="E01APCSF1" id="E01APCSF1" value="Y" onClick="ShowDeduction('Y')" <%if (prd.getE01APCSF1().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCSF1" id="E01APCSF1" value="N" onClick="ShowDeduction('N')" <%if (prd.getE01APCSF1().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">C&aacute;lculo de Interes Mora :</div></td>
						<td width="25%">
							<input type="text" name="E01APCMCP" size="3" maxlength="1" value="<%= prd.getE01APCMCP() %>" readonly> 
							<a href="javascript:GetCode('E01APCMCP','STATIC_ln_mor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Garant&iacute;as :</div></td>
						<td width="25%">
							<input type="radio" name="E01APCSF2" value="Y" <%if (prd.getE01APCSF2().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCSF2" value="N" <%if (prd.getE01APCSF2().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Ciclo de Pago de Intereses :</div></td>
						<td width="25%">
							<input type="text" name="E01APCIPD" size="3" maxlength="3" value="<%= prd.getE01APCIPD() %>" onChange="showIncreAnual(this.value)"> 
							<a href="javascript:GetCode('E01APCIPD','STATIC_ln_pay_int.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Control de Pagos :</div></td>
						<td width="25%">
							<input type="radio" name="E01APCSF4" value="Y" <%if (prd.getE01APCSF4().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCSF4" value="N" <%if (prd.getE01APCSF4().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Ciclo de Pago Principal :</div></td>
						<td width="25%">
							<input type="text" name="E01APCPPD" size="3" maxlength="3" value="<%= prd.getE01APCPPD() %>" style="text-transform: uppercase;" onChange="showIncreAnual(this.value)"> 
							<a href="javascript:GetCode('E01APCPPD','STATIC_ln_pay_int.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Propuesta Cr&eacute;dito :</div></td>
						<td width="25%">
							<input type="radio" name="E01APCCRF" value="Y" <%if (prd.getE01APCCRF().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCCRF" value="N" <%if (prd.getE01APCCRF().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Tabla de Parametros :</div></td>
						<td width="25%">
							<input type="text" name="E01APCTLN" size="3" maxlength="2" value="<%= prd.getE01APCTLN()%>"> 
							<a href="javascript:GetLoanTable('E01APCTLN',document.forms[0].E01APCTYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Producto de Reestructurados :</div></td>
						<td width="25%">
							<input type="radio" name="E01APCSF3" value="Y" <%if (prd.getE01APCSF3().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCSF3" value="N" <%if (prd.getE01APCSF3().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Estructura de Tasas :</div></td>
						<td width="25%">
							<input type="text" name="E01APCCDT" size="3" maxlength="2" value="<%= prd.getE01APCCDT() %>"> 
							<a href="javascript:GetRateTable('E01APCCDT','P')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Intereses en la Cuota :</div></td>
						<td width="25%">
							<input type="radio" name="E01APCREL" value="Y" <%if (!prd.getE01APCREL().equals("N")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCREL" value="N" <%if (prd.getE01APCREL().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Tabla Tasa Flotante o Lider :</div></td>
						<td width="25%">
							<input type="text" name="E01APCFRT" size="3" maxlength="2" value="<%= prd.getE01APCFRT() %>"> 
							<a href="javascript:GetFloating('E01APCFRT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0"></a>
							<select name="E01APCFTY"> 
								<option value=" "  <% if (!(prd.getE01APCFTY().equals("FP") ||prd.getE01APCFTY().equals("FS"))) out.print("selected"); %>></option>
								<option value="FP" <%if (prd.getE01APCFTY().equals("FP")) { out.print("selected"); }%>>Primaria</option>
								<option value="FS" <%if (prd.getE01APCFTY().equals("FS")) { out.print("selected"); }%>>Secundaria</option>
							</select>
						</td>
						<td width="25%"><div align="right">Libera Garant&iacute;a :</div></td>
						<td width="25%">
							<input type="radio" name="E01APCRCL" value="Y" <%if (prd.getE01APCRCL().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCRCL" value="N" <%if (prd.getE01APCRCL().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Tabla de Tramos Preferenciales :</div></td>
						<td width="25%">
							<input type="text" name="E01APCCC4" size="3" maxlength="2" value="<%= prd.getE01APCCC4() %>"> 
							<a href="javascript:GetLimit('E01APCCC4',document.forms[0].E01APCBNK.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Protecci&oacute;n de Garant&iacute;a :</div></td>
						<td width="25%">
							<select name="E01APCAMC">
								<option value="1" <%if (prd.getE01APCAMC().equals("1")) { out.print("selected"); }%>>Solo Capital</option>
								<option value="2" <%if (prd.getE01APCAMC().equals("2")) { out.print("selected"); }%>>Capital e Intereses</option>
								<option value="3" <%if (prd.getE01APCAMC().equals("3")) { out.print("selected"); }%>>Capital, Intereses y Mora</option>
							</select>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Tabla de Cargos o Comisiones :</div></td>
						<td width="25%">
							<input type="text" name="E01APCTAR" size="3" maxlength="2" value="<%= prd.getE01APCTAR()%>"> 
							<a href="javascript:GetLoanChargeTable('E01APCTAR',document.forms[0].E01APCTYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Ciclo Cambio Tasa :</div></td>
						<td width="25%">
							<input type="text" name="E01APCRRD" size="3" maxlength="3" value="<%= prd.getE01APCRRD() %>"> 
							<a href="javascript:GetCode('E01APCRRD','STATIC_cycle_rev.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width=25% align="right">Codigo Actividad Economica :</td>
						<td width="25%" nowrap="nowrap">
							<input type="text" name="E01APACDE" size="4" maxlength="4" value="<%= prd.getE01APACDE().trim()%>" readonly >
							<!--  
							<a href="javascript:GetCodeDescCNOFC('E01APACDE','D01APANME','2C')"><img src="<=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
							-->
						</td>
						<td width="25%" nowrap="nowrap"><div align="right">Penalidad por Prepago :</div></td>
						<td width="25%" nowrap="nowrap">
							<input type="text" name="E01APCROY" size="3" maxlength="3" value="<%= prd.getE01APCROY() %>" onKeypress="enterInteger(event)">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Ciclo Estado de Cuenta :</div></td>
						<td width="25%" nowrap="nowrap">
							<input type="text" name="E01APAFC3" size="3" maxlength="3" value="<%= prd.getE01APAFC3()%>" onKeypress="enterInteger(event)">
						</td>
						<td nowrap width="25%" align="right">Intereses del periodo de Gracia :</td>
						<td width="25%" nowrap="nowrap">
							<select name="E01APAF01">
								<option value="" <%if (prd.getE01APAF01().equals("")) { out.print("selected"); }%>>Interes Deudor</option>
								<option value="1" <%if (prd.getE01APAF01().equals("1")) { out.print("selected"); }%>>Prepaga los Intereses</option>
								<option value="2" <%if (prd.getE01APAF01().equals("2")) { out.print("selected"); }%>>Cobrar en la 1ra Cuota</option>
								<option value="3" <%if (prd.getE01APAF01().equals("3")) { out.print("selected"); }%>>Cobrar en NN Cuotas</option>
								<option value="4" <%if (prd.getE01APAF01().equals("4")) { out.print("selected"); }%>>Cobrar en Todas las Cuotas</option>
							</select>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width=25%><div align="right">Opciones de prepago :</div></td>
						<td width="25%" nowrap="nowrap">
							<select name="E01APAPTY">
								<option value=""></option>
								<option value="A" <%if (prd.getE01APAPTY().equals("A")) { out.print("selected"); }%>>Saldo a Fec/Proceso y Reducir Cuota</option>
								<option value="D" <%if (prd.getE01APAPTY().equals("D")) { out.print("selected"); }%>>Saldo a Fec/Proceso y Reducir Plazo</option>
								<option value="1" <%if (prd.getE01APAPTY().equals("1")) { out.print("selected"); }%>>Saldo a Proxi/Cuota y Reducir Cuota</option>
								<option value="2" <%if (prd.getE01APAPTY().equals("2")) { out.print("selected"); }%>>Saldo a Proxi/Cuota y Reducir Plazo</option>
								<option value="3" <%if (prd.getE01APAPTY().equals("3")) { out.print("selected"); }%>>Solo Abono Capital y Reducir Cuota</option>
								<option value="4" <%if (prd.getE01APAPTY().equals("4")) { out.print("selected"); }%>>Solo Abono Capital y Reducir Plazo</option>            
								<option value="B" <%if (prd.getE01APAPTY().equals("B")) { out.print("selected"); }%>>Seleccionar al Pagar</option>
								<option value="N" <%if (prd.getE01APAPTY().equals("N")) { out.print("selected"); }%>>No se permite Prepagos</option>
							</select>
						</td>
						<td nowrap width="25%" align="right">Acci&oacute;n Sobre un Cambio de Tasa :</td>
						<td width="25%" nowrap="nowrap">
							<select name="E01APAFG3">
								<option value=""></option>
								<option value="T" <%if (prd.getE01APAFG3().equals("T")) { out.print("selected"); }%>>Cambiar el Plazo</option>
								<option value="P" <%if (prd.getE01APAFG3().equals("P")) { out.print("selected"); }%>>Cambiar la Cuota</option>
							</select>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
						<td nowrap width=25% align="right"><div align="right">Utiliza Cifras Decimales : </div></td>
						<td width="25%" nowrap="nowrap">
							<input type="radio" name="E01APAF10" value="Y" <%if (prd.getE01APAF10().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APAF10" value="N" <%if (prd.getE01APAF10().equals("N")) out.print("checked"); %>> No
						</td>
						<td nowrap width=25% ><div align="right" id="rowIncreAnual">Cuota Decreciente, Incremento Anual : </div></td>
						<td nowrap width="25%"  align="left">
							<div align="left" id="rowIncreAnual1">        
								<input type="radio" name="E01APCFL1" value="Y" <%if (prd.getE01APCFL1().equals("Y")) out.print("checked"); %> > Si 
								<input type="radio" name="E01APCFL1" value="N" <%if (prd.getE01APCFL1().equals("N")) out.print("checked"); %> > No
							</div>  
						</td>
					</tr>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" align="right">Cr&eacute;ditos con Fomento :</td>
						<td width="25%" nowrap="nowrap">
							<input type="radio" name="E01APAF05" id="E01APAF05" value="Y" <%if (prd.getE01APAF05().equals("Y")) out.print("checked"); %> onClick="ShowFomento('Y')"> Activo 
							<input type="radio" name="E01APAF05" id="E01APAF05" value="A" <%if (prd.getE01APAF05().equals("A")) out.print("checked"); %> onClick="ShowFomento('A')"> Pasivo 
							<input type="radio" name="E01APAF05" id="E01APAF05" value="N" <%if (prd.getE01APAF05().equals("N")) out.print("checked"); %> onClick="ShowFomento('N')"> No
						</td>
						<td width="25%">
							<div id="divFomAct1" style="display: <%= prd.getE01APAF05().equals("Y") ? "" : "none"%>" align="right"> Producto de Pasivo :</div>
							<div id="divFomPas1" style="display: <%= prd.getE01APAF05().equals("A") ? "" : "none"%>" align="right"> Minimo Prestamos x Paquete :</div>
						</td>
						<td width="25%">
							<div id="divFomAct2" style="display: <%= prd.getE01APAF05().equals("Y") ? "" : "none"%>" align="left">
								<eibsinput:help name="prd" property="E01APAUC4" fn_param_one="E01APAUC4" fn_param_two="10" fn_param_three="document.forms[0].E01BANK.value" fn_param_four=" " fn_param_five="String('L')" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="FALSE" />
							</div>  
							<div id="divFomPas2" style="display: <%= prd.getE01APAF05().equals("A") ? "" : "none"%>" align="left">
								<input type="text" name="E01APAUC5" size="6" maxlength="5" value="<%= prd.getE01APAUC5() %>" onKeypress="enterInteger(event)">
							</div>      
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" align="right">Cr&eacute;ditos con Subsidio :</td>
						<td width="25%" nowrap="nowrap">
							<input type="radio" name="E01APAF02" value="Y" <%if (prd.getE01APAF02().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APAF02" value="N" <%if (prd.getE01APAF02().equals("N")) out.print("checked"); %>> No
						</td>
						<td nowrap width="25%" align="right">Tipo Subsidio Banrep:</td>
						<td width="25%" nowrap="nowrap">
							<select name="E01APCITP">
								<option value=""></option>
								<option value="1" <%if (prd.getE01APCITP().equals("1")) { out.print("selected"); }%>>VIP</option>
								<option value="2" <%if (prd.getE01APCITP().equals("2")) { out.print("selected"); }%>>VIS</option>
								<option value="3" <%if (prd.getE01APCITP().equals("3")) { out.print("selected"); }%>>NO VIS</option>
							</select>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" align="right">Numero Meses No Pago :</td>
						<td width="25%" nowrap="nowrap" align="left">
							<select name="E01APCFL5">
								<option value=""></option>
								<option value="1" <%if (prd.getE01APCFL5().equals("1")) { out.print("selected"); }%>>1 Mes</option>
								<option value="2" <%if (prd.getE01APCFL5().equals("2")) { out.print("selected"); }%>>2 Meses</option>
								<option value="3" <%if (prd.getE01APCFL5().equals("3")) { out.print("selected"); }%>>3 Meses</option>
							</select>
						</td>
						<td nowrap width="25%" align="right">Cr&eacute;ditos con Aval :</td>
						<td width="25%" nowrap="nowrap">
							<input type="radio" name="E01APAF04" value="Y" <%if (prd.getE01APAF04().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APAF04" value="N" <%if (prd.getE01APAF04().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Termino Contrato :</div></td>
						<td width="25%" nowrap="nowrap">
							<select name="E01APCFL4">
								<option value=""></option>
								<option value="C" <%if (prd.getE01APCFL4().equals("C")) { out.print("selected"); }%>>Corto Plazo</option>
								<option value="L" <%if (prd.getE01APCFL4().equals("L")) { out.print("selected"); }%>>Largo Plazo</option>
							</select>
						</td>
						<td width="25%"><div align="right">Maximo dias Fecha Valor :</div></td>
						<td width="25%">
							<eibsinput:text property="E01APAUS2" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS%>" />
						</td>
					</tr>
					<% if(currUser.getE01INT().equals("07")) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Sujeto Cobro FECI :</div></td>
						<td width="25%">
							<input type="radio" name="E01APCTX2" value="Y" <%if (prd.getE01APCTX2().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCTX2" value="N" <%if (!prd.getE01APCTX2().equals("Y")) out.print("checked"); %>> No
						</td>
						<td width="25%"></td>
						<td width="25%"></td>
					</tr>
					<% } %>      
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Formato Extracto 1 :</div> </td>
						<td width="25%">
							<input type="text" name="E01APAUC1" size="4" maxlength="5" value="<%= prd.getE01APAUC1().trim()%>"> 
							<a href="javascript:GetStmDef('E01APAUC1','A','L')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Formato Extracto 2 :</div> </td>
						<td width="25%">
							<input type="text" name="E01APAUC2" size="4" maxlength="5" value="<%= prd.getE01APAUC2().trim()%>"> 
							<a href="javascript:GetStmDef('E01APAUC2','A','L')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Formato Cupones :</div> </td>
						<td width="25%">
							<input type="text" name="E01APAUC8" size="4" maxlength="5" value="<%= prd.getE01APAUC8().trim()%>"> 
							<a href="javascript:GetStmDef('E01APAUC8')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Dias de Mora x No Enviar Extractos :</div> </td>
						<td width="25%">
							<input type="text" name="E01APAFC0" size="5" maxlength="5" value="<%= prd.getE01APAFC0() %>" onKeypress="enterInteger(event)">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
						<td nowrap width=25% align="right"><div align="right">Consulta a Central de Riesgo :</div></td>
						<td width="25%" nowrap="nowrap">
							<input type="radio" name="E01APAF11" value="Y" <%if (prd.getE01APAF11().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APAF11" value="N" <%if (prd.getE01APAF11().equals("N")) out.print("checked"); %>> No
						</td>
						<td nowrap width=25% ><div align="right">Dias de Vigencia Consulta Centrales :</div></td>
						<td nowrap width="25%"  align="left">
							<eibsinput:text property="E01APAUS4" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS%>" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Requiere SCORE :</div></td>
						<td width="25%" nowrap="nowrap">
							<input type="radio" name="E01APAF12" value="Y" <%if (prd.getE01APAF12().equals("Y")) out.print("checked"); %> > Si 
							<input type="radio" name="E01APAF12" value="N" <%if (prd.getE01APAF12().equals("N")) out.print("checked"); %> > No
						</td>
						<td width="25%"><div align="right">Dias Vigencia SCORE :</div></td>
						<td width="25%">
							<eibsinput:text property="E01APAUS5" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS%>" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Producto Corresponsales : </div></td>
						<td width="25%">
							<input type="radio" name="E01APCFL2" value="Y" <%if (prd.getE01APCFL2().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APCFL2" value="N" <%if (prd.getE01APCFL2().equals("N")) out.print("checked"); %>> No
						</td>
						<td width="25%"><div align="right">Producto Pasivo Milagroso :</div></td>
						<td width="25%">
							<input type="text" name="E01APAUC0" size="5" maxlength="4" value="<%= prd.getE01APAUC0() %>" >
							<a href="javascript:GetProduct('E01APAUC0','04','<%=currUser.getE01UBK()%>','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width=25% align="right"><div align="right">Verificar Biometr&iacute;a :</div></td>
						<td width="25%">
							<input type="radio" name="E01APAF06" value="Y" <%if ( prd.getE01APAF06().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APAF06" value="N" <%if (!prd.getE01APAF06().equals("Y")) out.print("checked"); %>> No
						</td>
						<td width="25%"><div align="right"></div></td>
						<td width="25%">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Provisi&oacute;n</h4>
	<table class="tableinfo" style="width: 100%;">
		<tr>
			<td>
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" align="right">Tabla Provisi&oacute;n :</td>
						<td nowrap width="25%">
							<input type="text" name="E01APCRLT" size="3" maxlength="2" value="<%= prd.getE01APCRLT() %>"> 
							<a href="javascript:GetPrevTable('E01APCRLT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
						</td>
						<td nowrap width="25%" align="right">Tipo Prestamo S&uacute;per :</td>
						<td width="25%">  
							<input type="text" name="E01APCFL3" size="3" maxlength="1" value="<%= prd.getE01APCFL3() %>"> 
							<a href="javascript:GetCode('E01APCFL3','STATIC_ln_prod_sup.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" align="right">Marca de No Provisionar:</td>
						<td nowrap width="25%">
							<input type="radio" name="E01APAF14" value="Y" <%if (prd.getE01APAF14().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APAF14" value="N" <%if (!prd.getE01APAF14().equals("Y")) out.print("checked"); %>> No
						</td>
						<td nowrap width="25%" align="right">C&oacute;digo de Segmento(Provisi&oacute;n) :</td>
						<td width="25%">
							<input type="text" name="E01APAF15" size="2" maxlength="1" value="<%= prd.getE01APAF15().trim()%>">
							<a href="javascript:GetCodeCNOFC('E01APAF15','SG')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<% if(prd.getH01FLGWK3().equals("H")) { %>
	<h4>Creditos Hipotecarios</h4>
	<table class="tableinfo" style="width: 100%;">
		<tr>
			<td>
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Credito Preferencial :</div></td>
						<td width="25%">
							<select name="E01APARFL"> 
								<option value=""></option>
								<option value="1" <%if (prd.getE01APARFL().equals("1")) { out.print("selected"); }%>>Vivienda Nueva</option>
								<option value="2" <%if (prd.getE01APARFL().equals("2")) { out.print("selected"); }%>>Forestal</option>
								<option value="3" <%if (prd.getE01APARFL().equals("3")) { out.print("selected"); }%>>Restauraci�n</option>
							</select>
						</td>
						<td nowrap width=25%><div align="right">Utiliza Tabla de Desarrollo :</div></td>
						<td nowrap width="25%">
							<input type="radio" name="E01APATY1" value="Y" <%if (prd.getE01APATY1().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APATY1" value="N" <%if (prd.getE01APATY1().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Fecha Inicio Calculo Interes :</div></td>
						<td width="25%">
							<select name="E01APAF10"> 
								<option value="0" <%if (prd.getE01APAF10().equals("0")) { out.print("selected"); }%>>Firma Escritura</option>
								<option value="1" <%if (prd.getE01APAF10().equals("1")) { out.print("selected"); }%>>Fecha Apertura</option>
							</select>
						</td>
						<td width="25%"><div align="right">Constitucion de Dividendos :</div></td>
						<td width="25%">
							<input type="radio" name="E01APARTB" value="Y" <%if (prd.getE01APARTB().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APARTB" value="N" <%if (prd.getE01APARTB().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width=25%><div align="right">Producto a generar del pasivo :</div></td>
						<td nowrap width="25%">
							<input type="text" name="E01APAPRD" size="6" maxlength="4" value="<%= prd.getE01APAPRD().trim()%>">
							<a href="javascript:GetProduct('E01APAPRD','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
						<td width="25%"><div align="right">Porcentaje m&aacute;ximo financiamiento :</div></td>
						<td width="25%">
							<input type="text" name="E01APAOIS" size="10" maxlength="9" value="<%= prd.getE01APAOIS() %>" onKeyPress="enterDecimal(event, 2)">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width=25%><div align="right">Meses Gracia para 1er Dividendo :</div></td>
						<td nowrap width="25%">
							<input type="text" name="E01APAUS3" size="4" maxlength="3" value="<%= prd.getE01APAUS3() %>" onKeypress="enterInteger(event)">
						</td>
						<td width="25%"><div align="right">Dias para aplicar 1er cambio Tasa :</div></td>
						<td width="25%">
							<input type="text" name="E01APAANP" size="5" maxlength="4" value="<%= prd.getE01APAANP() %>" onKeypress="enterInteger(event)">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width=25%><div align="right">Distribucci&oacute;n meses de no pago :</div></td>
						<td nowrap width="25%">
							<select name="E01APATY2">
								<option value="C" <%if (prd.getE01APATY2().equals("C")) { out.print("selected"); }%>>Capitalizaci&oacute;n</option>
								<option value="D" <%if (prd.getE01APATY2().equals("D")) { out.print("selected"); }%>>Distribucci&oacute;n</option>
								<option value="" <%if (prd.getE01APATY2().equals("")) { out.print("selected"); }%>></option>
							</select>
						</td>
						<td nowrap width=25%><div align="right">Metodo C&aacute;lculo comision prepago :</div></td>
						<td nowrap width="25%">
							<select name="E01APATY6">
								<option value="0" <%if (prd.getE01APATY6().equals("0")) { out.print("selected"); }%>>Cupon actual</option>
								<option value="1" <%if (prd.getE01APATY6().equals("1")) { out.print("selected"); }%>>Actual + proximo cupon</option>
								<option value="2" <%if (prd.getE01APATY6().equals("2")) { out.print("selected"); }%>>Actual + proximo 2 cupones</option>
								<option value="3" <%if (prd.getE01APATY6().equals("3")) { out.print("selected"); }%>>Actual + proximo 3 cupones</option>
								<option value="4" <%if (prd.getE01APATY6().equals("4")) { out.print("selected"); }%>>Actual + proximo 4 cupones</option>
								<option value="5" <%if (prd.getE01APATY6().equals("5")) { out.print("selected"); }%>>Actual + proximo 5 cupones</option>
								<option value="6" <%if (prd.getE01APATY6().equals("6")) { out.print("selected"); }%>>Actual + proximo 6 cupones</option>
								<option value="7" <%if (prd.getE01APATY6().equals("7")) { out.print("selected"); }%>>Actual + proximo 7 cupones</option>
								<option value="8" <%if (prd.getE01APATY6().equals("8")) { out.print("selected"); }%>>Actual + proximo 8 cupones</option>
								<option value="9" <%if (prd.getE01APATY6().equals("9")) { out.print("selected"); }%>>Actual + proximo 9 cupones</option>
								<option value=""  <%if (prd.getE01APATY6().equals("")) { out.print("selected"); }%>>No calcula comision</option>
							</select>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Cobro Seguro en meses de gracia :</div></td>
						<td width="25%">
							<select name="E01APATY3">
								<option value="1" <%if (prd.getE01APATY3().equals("1")) { out.print("selected"); }%>>Primer dividendo</option>
								<option value="2" <%if (prd.getE01APATY3().equals("2")) { out.print("selected"); }%>>Capitalizarlo</option>
								<option value="3" <%if (prd.getE01APATY3().equals("3")) { out.print("selected"); }%>>Cobro en el Curce</option> 
								<option value="N" <%if (prd.getE01APATY3().equals("N")) { out.print("selected"); }%>>No cobrarlo</option>
							</select>
						</td>
						<td width="25%"><div align="right">Exclusi&oacute;n no pago de dividendo :</div></td>
						<td width="25%">
							<input type="radio" name="E01APATY5" value="Y" <%if (prd.getE01APATY5().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01APATY5" value="N" <%if (prd.getE01APATY5().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<% } %>

	<h4>L&iacute;mites</h4>
	<table class="tableinfo" style="width: 100%;">
		<tr>
			<td>
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<% row++; %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Moneda de Apertura :</div></td>
						<td width="25%">
							<select name="E01APAF13" >
								<option value=" " <%if (prd.getE01APAF13().equals(" ")) { out.print("selected"); }%>>Moneda del Producto</option>
								<option value="6" <%if (prd.getE01APAF13().equals("6")) { out.print("selected"); }%>>SMMLV </option>
							</select>
						</td>
						<td width="25%"><div align="right">Monto M&aacute;ximo Ley Mipyme :</div></td>
						<td width="25%">
							<input type="text" name="E01APAAM1" size="21" maxlength="15" value="<%= prd.getE01APAAM1().trim()%>" onKeypress="enterDecimal(event, 2)">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Monto M&iacute;nimo Apertura :</div></td>
						<td width="25%">
							<input type="text" name="E01APCAM1" size="21" maxlength="15" value="<%= prd.getE01APCAM1().trim()%>" onKeypress="enterDecimal(event, 2)">
						</td>
						<td width="25%"><div align="right">Monto M&aacute;ximo Apertura :</div></td>
						<td width="25%">
							<input type="text" name="E01APCAM2" size="21" maxlength="15" value="<%= prd.getE01APCAM2().trim()%>" onKeypress="enterDecimal(event, 2)">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Plazo M&iacute;nimo en Meses :</div></td>
						<td width="25%">
							<input type="text" name="E01APCUC2" size="5" maxlength="4" value="<%= prd.getE01APCUC2().trim()%>" onKeypress="enterInteger(event)">
						</td>
						<td width="25%"><div align="right">Plazo M&aacute;ximo en Meses :</div></td>
						<td width="25%">
							<input type="text" name="E01APCUC3" size="5" maxlength="4" value="<%= prd.getE01APCUC3().trim()%>" onKeypress="enterInteger(event)">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Edad M&iacute;nima :</div></td>
						<td width="25%">
							<input type="text" name="E01APADY2" size="4" maxlength="3" value="<%= prd.getE01APADY2().trim()%>" onKeypress="enterInteger(event)">
						</td>
						<td width="25%"><div align="right">Edad M&aacute;xima :</div></td>
						<td width="25%">
							<input type="text" name="E01APADY3" size="4" maxlength="3" value="<%= prd.getE01APADY3().trim()%>" onKeypress="enterInteger(event)">
						</td>
					</tr>
					<%-- 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" align="right">Control para Prepagos :</td>
						<td nowrap width="25%">
							<select name="E01APAF03" id="E01APAF03" onChange="showControlPrepagos(this)">
								<option value="" > </option>
								<option value="N" <%if (prd.getE01APAF03().equals("N")) { out.print("selected"); }%>>M&iacute;nimo Cuotas</option>
								<option value="%" <%if (prd.getE01APAF03().equals("%")) { out.print("selected"); }%>>Prcentaje m&iacute;nimo </option>
							</select>
						</td>
						<td width="25%" id="datos1" style="display: none;"><div align="right" >Porcentaje M&iacute;nimo de Prepago :</div></td>
						<td nowrap width="25%" id="datos2" style="display: none;"><div align="right" >Numero de Cuotas :</div></td>
						<td nowrap width="25%" id="datos3" style="display: none;" align="left"> 
							<eibsinput:text property="E01APART1" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
						</td>
						<td width="25%" id="datos4" style="display: none;"></td>
						<td width="25%" id="datos5" style="display: none;"></td>
					</tr>
					<tr id="<%=  (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width=25% id="datos6" style="display: none;"><div align="right" >Control Prorrogas o Renovaciones :</div></td>
						<td nowrap width="25%" id="datos7" style="display: none;">
							<select name="E01APAF06" id="E01APAF06">
								<option value="" > </option>
								<option value="1" <%if (prd.getE01APAF06().equals("1")) { out.print("selected"); }%>>Prorrogas</option>
								<option value="2" <%if (prd.getE01APAF06().equals("2")) { out.print("selected"); }%>>Renovaciones </option>
								<option value="3" <%if (prd.getE01APAF06().equals("3")) { out.print("selected"); }%>>Ambas </option>
								<option value="N" <%if (prd.getE01APAF06().equals("N")) { out.print("selected"); }%>>No Permite </option>
							</select>
						</td>
						<td nowrap width=25% align="right" id="datos10" style="display: none;"><div align="right">Plazo M&aacute;ximo en Meses a Prorrogar :</div></td>
						<td nowrap width="25%" id="datos11" style="display: none;">
							<input type="text" name="E01APAUS1" size="4" maxlength="3" value="<%= prd.getE01APAUS1() %>" onKeyPress="enterInteger(event)">
						</td>
					</tr>
					--%>
					
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width=25% align="right"><div align="right">M&aacute;ximo D&iacute;as de gracia :</div></td>
						<td nowrap width="25%">
							<input type="text" name="E01APAFC1" size="5" maxlength="4" value="<%= prd.getE01APAFC1() %>" onKeyPress="enterInteger(event)">
						</td>
						<td nowrap width=25%><div align="right">D&iacute;as aceleracion autom&aacute;tica :</div></td>
						<td nowrap width="25%">
							<input type="text" name="E01APAFC2" size="5" maxlength="4" value="<%= prd.getE01APAFC2() %>" onKeyPress="enterInteger(event)">
						</td>
					</tr>
					<tr id="typeOrow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++; row++;%>" style="display: none;">
						<td nowrap width=25% align="right"><div align="right">Renovacion Automatica :</div></td>
						<td nowrap width="25%" >
							<input type="radio" name="OOOAPAF08" class="typeOinput" value="Y" <%if (prd.getE01APAF08().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="OOOAPAF08" class="typeOinput" value="N" <%if (prd.getE01APAF08().equals("N")) out.print("checked"); %>> No
						</td>
						<td width="25%"><div align="right">Contabilidad Linea Credito:</div></td>
						<td width="25%">
							<input type="text" name="OOOAPAGL1" class="typeOinput" size="18" maxlength="16" value="<%= prd.getE01APAGL1() %>"> 
							<a href="javascript:GetLedger('OOOAPAGL1',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'90','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
						</td>
					</tr>        
					<table id="creditlinesTable"  class=".tableinfo" style="border: 0px; display: none; height:100%; width: 100%;">
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
							<td nowrap width=25% align="right"><div align="right">Forma Desembolso : </div></td>
							<td nowrap width="25%"  align="left">
								<select name="E01APAF07">
									<option value=" " <% if (!(prd.getE01APAF07().equals("1") ||prd.getE01APAF07().equals("2"))) out.print("selected"); %>></option>
									<option value="1" <% if(prd.getE01APAF07().equals("1")) out.print("selected");%>>Credito unico</option>
								</select>
							</td>        
							<td nowrap width=25% align="right"><div align="right">Numero Cuotas x Desembolso : </div></td>
							<td nowrap width="25%"  align="left">
								<input type="text" name="E01APAFC4" size="4" maxlength="3" value="<%= prd.getE01APAFC4() %>" onKeyPress="enterInteger(event)">
						 </td>
						</tr>  
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
							<td nowrap width=25% align="right"><div align="right">Permite Extender Plazo con Utilizaciones :</div></td>
							<td nowrap width="25%"  align="left">
								<input type="radio" name="E01APAF09" value="Y" <%if (prd.getE01APAF09().equals("Y")) out.print("checked"); %>> Si 
								<input type="radio" name="E01APAF09" value="N" <%if (prd.getE01APAF09().equals("N")) out.print("checked"); %>> No
							</td>        
							<td nowrap width=25% align="right"><div align="right">Bloqueo Temporal x Mora en Cartera : </div></td>
							<td nowrap width="25%"  align="left">
								<input type="text" name="NNNAPAFC5" class="typeNinput" size="4" maxlength="3" value="<%= prd.getE01APAFC5() %>" onKeyPress="enterInteger(event)">
						 </td>
						</tr>  
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
							<td nowrap width=25% align="right"><div align="right">Recoge Saldos :</div></td>
							<td nowrap width="25%"  align="left">
								<input type="radio" name="NNNAPAF08" class="typeNinput" value="Y" <%if (prd.getE01APAF08().equals("Y")) out.print("checked"); %>> Si 
								<input type="radio" name="NNNAPAF08" class="typeNinput" value="N" <%if (prd.getE01APAF08().equals("N")) out.print("checked"); %>> No
							</td>
							<td nowrap width=25% align="right"><div align="right"></div></td>
							<td nowrap width="25%"  align="left">
							<!-- 
								<input type="text" name="E01APAFC6" size="4" maxlength="3" value="<%= prd.getE01APAFC6().trim()%>" onKeyPress="enterInteger(event)">
							-->
							</td>  
						</tr>  
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
							<td nowrap width=25% align="right"><div align="right">Primer Ciclo Facturacion (1-15) :</div></td>
							<td nowrap width="25%"  align="left">
								<eibsinput:text property="E01APADY4" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAY%>"  />
							</td>
							<td nowrap width=25% align="right"><div align="right">Primer Ciclo de Pago (1-15) :</div></td>
							<td nowrap width="25%"  align="left">
								<eibsinput:text property="E01APADY5" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAY%>"  />
							</td>
						</tr>  
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
							<td nowrap width=25% align="right"><div align="right">Segundo Ciclo Facturacion (16-31) :</div></td>
							<td nowrap width="25%"  align="left">
								<eibsinput:text property="E01APADY6" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAY%>" />
							</td>  
							<td nowrap width=25% align="right"><div align="right">Segundo Ciclo de Pago (16-31) :</div></td>
							<td nowrap width="25%"  align="left">
								<eibsinput:text property="E01APADY7" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAY%>" />
							</td>  
						</tr>  
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
							<td width="25%"><div align="right">Contabilidad Linea Credito:</div></td>
							<td width="25%">
								<input type="text" name="NNNAPAGL1" size="18" maxlength="16" value="<%= prd.getE01APAGL1() %>" class="typeNinput"> 
								<a href="javascript:GetLedger('NNNAPAGL1',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'90','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
							</td>
							<td width="25%"><div align="right">Monto M&iacute;nimo de Pago :</div></td>
							<td width="25%">
								<eibsinput:text name="prd" property="E01APAPMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
							</td>
						</tr>
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
							<td width="25%"><div align="right">Bloqueo Definitivo x Mora en Cartera :</div></td>
							<td width="25%">
								<input type="text" name="NNNAPAFC7" class="typeNinput" size="4" maxlength="3" value="<%= prd.getE01APAFC7() %>" onKeyPress="enterInteger(event)">
							</td>
							<td width="25%"><div align="right">Cantidad Max Extensiones de Plazo :</div></td>
							<td width="25%">
								<input type="text" name="E01APAFC8" size="4" maxlength="3" value="<%= prd.getE01APAFC8() %>" onKeyPress="enterInteger(event)">
							</td>
						</tr>
					</table>
					<table id="overdraftControlTable"  class=".tableinfo" style="border: 0px; display: none; height:100%; width: 100%;">
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
							<td nowrap width=25% align="right"><div align="right">Bloqueo Temporal x Mora en Cartera : </div></td>
							<td nowrap width="25%"  align="left">
								<input type="text" name="OOOAPAFC5" class="typeOinput" size="4" maxlength="3" value="<%= prd.getE01APAFC5() %>" onKeyPress="enterInteger(event)">
							</td>        
							<td width="25%"><div align="right">Bloqueo Definitivo x Mora en Cartera :</div></td>
							<td width="25%">
								<input type="text" name="OOOAPAFC7" class="typeOinput" size="4" maxlength="3" value="<%= prd.getE01APAFC7() %>" onKeyPress="enterInteger(event)">
							</td>
						</tr>  
			 		</table>
				</table>
			</td>
		</tr>
	</table>

	<div id="divAddOpt" style="display: <%= prd.getE01APCSF1().equals("Y") ? "" : "none"%>">
	<h4>Deducciones</h4>
	<table  id="mainTable" class="tableinfo" style="height: 90px; width: 100%;">
		<tr height="5%"> 
			<td NOWRAP width="100%" >
				<table id="headTable" width="100%" >
					<tr id="trdark"> 
						<th nowrap  width="15%"></th>
						<th nowrap  width="10%">Codigo</th>
						<th nowrap  width="10%">Plan</th>
						<th nowrap  width="30%">Descripcion</th>
						<th nowrap  width="10%">Forma Cobro</th>
						<th nowrap  width="10%">Obligatorio</th>
						<th nowrap  width="15%"></th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td NOWRAP width="100%">       
				<div id="dataDiv1" class="scbarcolor" style="height:90px;  overflow:auto;">
					<table id="dataTable" width="100%" > 
					<%
					   int limite = 9;
					   String seq;            
					   for ( int i=1; i<=limite; i++ ) {
					     seq = i + "";
					%> 
						<tr id="trclear"> 
							<td nowrap width="15%"> </td>
							<td nowrap width="10%"> 
								<div align="center" > 
									<%= seq %>
									<input type=text name="E01APDDED<%= seq %>" value="<%= prd.getField("E01APDDED"+seq).getString() %>" size="5" maxlength="4" class="context-menu-help" onMouseDown="init(brokerHelp,this.name,'','','D01APDDED<%= seq %>','I','')">
								</div>
							</td>
							<td nowrap width="10%"> 
								<div align="center" > 
									<input type=text name="E01APDFL1<%=seq%>" value="<%= prd.getField("E01APDFL1"+seq).getString() %>" size="3" maxlength="2" class="context-menu-help" onMouseDown="init(accountPlanHelp, this.name, document.forms[0].elements['E01APDDED<%= seq %>'].value,'','','')">
								</div>
							</td>            
							<td nowrap width="30%"> 
								<div align="center"> 
									<input type="text" name="D01APDDED<%= seq %>" value="<%= prd.getField("D01APDDED"+seq).getString()%>" size="45" maxlength="45" readonly>
								</div>
							</td>
							<td nowrap width="10%"> 
								<div align="center"> 
									<select name="E01APDPFM<%= seq %>">
										<option value=""></option>
										<option value="O" <%if (prd.getField("E01APDPFM"+seq).getString().equals("O")) { out.print("selected"); }%>>En la Apertura</option>
										<option value="L" <%if (prd.getField("E01APDPFM"+seq).getString().equals("L")) { out.print("selected"); }%>>Financiado</option>
									</select>
								</div>
							</td>
							<td nowrap width="10%"> 
								<div align="center"> 
									<select name="E01APDFL2<%= seq %>">
										<option value=""></option>
										<option value="Y" <%if (prd.getField("E01APDFL2"+seq).getString().equals("Y")) { out.print("selected"); }%>>Si</option>
										<option value="N" <%if (prd.getField("E01APDFL2"+seq).getString().equals("N")) { out.print("selected"); }%>>No</option>
									</select>
								</div>
							</td>
							<td nowrap width="15%"> </td>
						</tr>
					<% } %> 
					</table>
				</div>
			</td>
		</tr>  
	</table>
	</div>

	<h4>Conceptos para Desembolso</h4>
	<table  id="mainTable" class="tableinfo" style="height: 90px; width: 100%;">
		<tr height="5%"> 
			<td NOWRAP width="100%" >
				<table id="headTable" width="100%" >
					<tr id="trdark"> 
						<th nowrap  width="15%"></th>
						<th nowrap  width="10%">Codigo</th>
						<th nowrap  width="90%" align="left">&nbsp;&nbsp;&nbsp;Descripcion</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td NOWRAP width="100%">       
				<div id="dataDiv1" class="scbarcolor" style="height:90px;  overflow:auto;">
					<table id="dataTable" width="100%" > 
					<%
					   int maxCounter = 9;
					   String counter;            
					   for ( int i=1; i<=maxCounter; i++ ) {
					     counter = i + "";
					%>
						<tr id="trclear"> 
							<td nowrap width="15%"> </td>
							<td nowrap width="10%"> 
								<div align="center" > 
									<%= counter %>
									<input type=text name="E01APHCON<%= counter %>" value="<%= prd.getField("E01APHCON"+counter).getString() %>" size="5" maxlength="4" class="context-menu-help" onMouseDown="init(conceptHelp,'D01APHDSC<%= counter %>',document.forms[0].E01APCBNK.value, document.forms[0].E01APCCCY.value,'',this.name,'10','01')">
								</div>
							</td>
							<td nowrap width="40%"> 
								<div align="left"> 
									<input type="text" name="D01APHDSC<%= counter %>" value="<%= prd.getField("D01APHDSC"+counter).getString()%>" size="60" maxlength="60" readonly>
								</div>
							</td>
							<td nowrap width="10%"></td>
							<td nowrap width="10%"></td>
							<td nowrap width="15%"> </td>
						</tr>
					<% } %> 
					</table>
				</div>
			</td>
		</tr>  
	</table>

	<h4>Direcciones de Acceso</h4>
	<table class="tableinfo" style="width: 100%;">
		<tr>
			<td>
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Audio :</div></td>
						<td width="75%">
							<input type="text" name="E01APEAUD" size="82" maxlength="80" value="<%= prd.getE01APEAUD() %>">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Video :</div></td>
						<td width="75%">
							<input type="text" name="E01APEVID" size="82" maxlength="80" value="<%= prd.getE01APEVID() %>">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">HTML :</div></td>
						<td width="75%">
							<input type="text" name="E01APEHTM" size="82" maxlength="80" value="<%= prd.getE01APEHTM() %>">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<% if (!readOnly) { %>
	<div align="center"><input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="submitForm()"></div>
	<% } %>

	<SCRIPT type="text/javascript">
	
	//showControlPrepagos(document.getElementById("E01APAF03"));
	showCred(document.getElementById("E01APCFRN"));
	
	function showIncreAnual(TypeSel) {
		if (TypeSel.toUpperCase() == 'SC1' || TypeSel.toUpperCase() == 'SC3' ) {  
			rowIncreAnual.style.display = "block";
			rowIncreAnual1.style.display = "table-cell";
		} else {
			rowIncreAnual.style.display = "none";
			rowIncreAnual1.style.display = "none";
		}
	}   
	
	function submitForm(){
		if(getElement("E01APCFRN").value === 'O'){
			$.each($('input[type=text].typeOinput').add('input.typeOinput:checked'), function(){
				$('#E01' +$(this).prop('name').substring(3)).val($(this).val());
			});
			
		} else {
			$.each($('input[type=text].typeNinput').add('input.typeNinput:checked'),function(){
				$('#E01' +$(this).prop('name').substring(3)).val($(this).val());
			});
		}
		document.forms[0].submit();
	}

	showIncreAnual(getElement('E01APCPPD').value);
	ShowFomento('<%=prd.getE01APAF05().trim()%>');

	<% if (readOnly) { %>
	$(document).ready(function(){
		readOnlyPage();
	});
	<% } %>

	</SCRIPT>

</form>
</body>
</html>
