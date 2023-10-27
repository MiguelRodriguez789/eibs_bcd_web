<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Productos de Descuento de Documentos Nuevo/Mantenimiento</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT type="text/javascript">
       
     builtNewMenu(prd_loan_opt);
     initMenu();


function show(obj) {
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
		document.getElementById("creditlinesTable").style.display = 'table';
		document.getElementById("datos6").style.display = 'none';
		document.getElementById("datos7").style.display = 'none';
		document.getElementById("datos8").style.display = 'table-cell';
		document.getElementById("datos9").style.display = 'table-cell';
		document.getElementById("datos10").style.display = 'none';
		document.getElementById("datos11").style.display = 'none';
		document.getElementById("datos12").style.display = 'table-cell';
		document.getElementById("datos13").style.display = 'table-cell';
		
	} else {
		document.getElementById("creditlinesTable").style.display = 'none';
		document.getElementById("datos6").style.display = 'table-cell';
		document.getElementById("datos7").style.display = 'table-cell';
		document.getElementById("datos8").style.display = 'none';
		document.getElementById("datos9").style.display = 'none';
		document.getElementById("datos10").style.display = 'table-cell';
		document.getElementById("datos11").style.display = 'table-cell';
		document.getElementById("datos12").style.display = 'none';
		document.getElementById("datos13").style.display = 'none';
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
	if (TypeSel == 'Y') {	
		divFomento1.style.display = "";
		divFomento2.style.display = "";
	} else {
		divFomento1.style.display = "none";
		divFomento2.style.display = "none";
		getElement('E01APAUC4').value = "";
	}
}
	
	function consultaComissionTable() {
		getElement('SCREEN').value = 2000;
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0525EX";
		document.forms[0].action = page;
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


<h3 align="center">Producto de 
<% if (prd.getH01FLGWK3().equals("G")) {out.print("Descuento de Documentos"); } else if (prd.getH01FLGWK3().equals("V")) {out.print("Valores al Cobro"); }%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_factoring.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" onmousemove="showCred(document.forms[0].E01APCFRN);" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1"> 
<INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
<INPUT TYPE=HIDDEN NAME="E01BANK" VALUE="<%= currUser.getE01UBK()%>">
<INPUT TYPE="hidden" NAME="H01FLGMAS" value="A">
	
<%int row = 0; %>	
<table class="tableinfo" style="width: 1250px;">
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

<table class="tableinfo" style="width: 1250px;">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Descripci&oacute;n :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCDS1" size="50" maxlength="45" value="<%= prd.getE01APCDS1()%>">
				</td>
				<td width="25%">
					<div align="right">Nombre de Mercadeo :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCDS2" size="28" maxlength="25" value="<%= prd.getE01APCDS2()%>">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">C&oacute;digo de Moneda :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>"> 
						<a href="javascript:GetCurrency('E01APCCCY','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Ofrecimiento por :</div>
				</td>
				<td width="25%">
					<SELECT name="E01APCFTT">
						<OPTION value="1" <%if (prd.getE01APCFTT().equals("1")) { out.print("selected"); }%>>Internet </OPTION>
						<OPTION value="I" <%if (prd.getE01APCFTT().equals("I")) { out.print("selected"); }%>>Internacional </OPTION>
						<OPTION value="L" <%if (prd.getE01APCFTT().equals("L")) { out.print("selected"); }%>>Local </OPTION>
						<OPTION value="3" <%if (prd.getE01APCFTT().equals("3")) { out.print("selected"); }%>>Plataforma </OPTION>
						<OPTION value="5" <%if (prd.getE01APCFTT().equals("5")) { out.print("selected"); }%>>Cualquier Medio </OPTION>
						<OPTION value="N" <%if (prd.getE01APCFTT().equals("N")) { out.print("selected"); }%>>No Ofrecer</OPTION>
					</SELECT>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Cuenta Contable:</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCGLN" size="18" maxlength="16" value="<%= prd.getE01APCGLN() %>"> 
						<a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,document.forms[0].E01APCACD.value,'','<%= prd.getE01APCTYP().trim()%>')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Tipo de Residencia :</div>
				</td>
				<td width="25%">
					<select name="E01APCRES">
						<option value=""  <%if (prd.getE01APCRES().equals(""))   { out.print("selected"); }%>>Cualquiera</option>
						<option value="1" <%if (prd.getE01APCRES().equals("1")) { out.print("selected"); }%>>Residentes</option>
						<option value="2" <%if (prd.getE01APCRES().equals("2")) { out.print("selected"); }%>>Extranjeros</option>
					</select>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
				<div align="right">Tipo de Cliente :</div>
				</td>
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
				<td nowrap width=25% align="right">
					<div align="right"> Requiere Convenio </div>
				</td>
				<td width="25%">
					<input type="radio" name="E01APAOVC" value="Y" <%if (prd.getE01APAOVC().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APAOVC" value="N" <%if (prd.getE01APAOVC().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Tabla de Documentos :</div>
				</td>
				<td width="25%">
				 	<input type="text" name="E01APCDOC" size="4" maxlength="2" value="<%= prd.getE01APCDOC() %>" onKeypress="enterInteger(event)"> 
						<a href="javascript:GetDocInv('E01APCDOC')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Producto Familia :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCUC1" size="4" maxlength="2" value="<%= prd.getE01APCUC1() %>">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++; %>">
				<td width="25%">
					<div align="right">Número de Registro RECA : </div>
				</td>
				<td width="25%" >
					<input type="text" name="E01APAD01" size="40" maxlength="35" value="<%= prd.getE01APAD01() %>" >
				</td>
				<td nowrap width=25% align="right">
					<div align="right"> </div>
				</td>
				<td width="25%">
				</td>
				
			</tr>
			<%if(currUser.getE01INT().equals("05")){%>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<td width="25%" align="right">Codigo FINAC :</td>
					<td width="25%">
	 	                <eibsinput:cnofc name="prd" property="E01APAUC3" required="false" flag="CH" fn_code="E01APAUC3" />
					</td>
					<td width="25%" align="right">Permite Clientes Simplificados : </td>
			 		<td width="25%" >
					<input type="radio" name="E01APCTX9" value="Y" <%if (prd.getE01APCTX9().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCTX9" value="N" <%if (prd.getE01APCTX9().equals("N")) out.print("checked"); %>> No
			 		</td>
				</tr>
			<% } %>			
		</table>
		</td>
	</tr>
</table>

<h4>Impuestos </h4>
<table class="tableinfo" style="width: 1250px;">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" > 
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
              <div align="center"> <%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %>  FECI <% } %></div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
        </tr>        
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="10%"  > 
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
<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %> 
				<select id="E01APCTX4" name="E01APCTX4" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX4().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX4().equals("0")) out.print("selected");%>> NO </option>
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

<h4>Informaci&oacute;n Adicional</h4>

<table class="tableinfo" style="width: 1250px;">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Clase de Prestamo :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCFRN" id="E01APCFRN" size="3" maxlength="1" value="<%=prd.getE01APCFRN()%>" readonly > 
						<a href="javascript:GetCode('E01APCFRN','STATIC_ln_cred_class.jsp')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Entregas Graduales :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01APCCHR" value="Y" <%if (!prd.getE01APCCHR().equals("N")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCCHR" value="N" <%if (prd.getE01APCCHR().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">C&aacute;lculo de Interes Normal :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCMCI" size="3" maxlength="1" value="<%= prd.getE01APCMCI() %>" readonly> 
						<a href="javascript:GetCode('E01APCMCI','STATIC_ln_prov.jsp')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Deducciones :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01APCSF1" id="E01APCSF1" value="Y" onclick="ShowDeduction('Y')" <%if (prd.getE01APCSF1().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCSF1" id="E01APCSF1" value="N" onclick="ShowDeduction('N')" <%if (prd.getE01APCSF1().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">C&aacute;lculo de Interes Mora :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCMCP" size="3" maxlength="1" value="<%= prd.getE01APCMCP() %>" readonly> 
						<a href="javascript:GetCode('E01APCMCP','STATIC_ln_mor.jsp')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Garant&iacute;as :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01APCSF2" value="Y" <%if (prd.getE01APCSF2().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCSF2" value="N" <%if (prd.getE01APCSF2().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Ciclo de Pago de Intereses :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCIPD" size="3" maxlength="3" value="<%= prd.getE01APCIPD() %>" onchange="showIncreAnual(this.value)"> 
						<a href="javascript:GetCode('E01APCIPD','STATIC_ln_pay_int.jsp')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Control de Pagos :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01APCSF4" value="Y" <%if (prd.getE01APCSF4().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCSF4" value="N" <%if (prd.getE01APCSF4().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Ciclo de Pago Principal :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCPPD" size="3" maxlength="3" value="<%= prd.getE01APCPPD() %>" style="text-transform: uppercase;" onchange="showIncreAnual(this.value)"> 
						<a href="javascript:GetCode('E01APCPPD','STATIC_ln_pay_int.jsp')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Propuesta Cr&eacute;dito :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01APCCRF" value="Y" <%if (prd.getE01APCCRF().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCCRF" value="N" <%if (prd.getE01APCCRF().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Tabla de Parametros :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCTLN" size="3" maxlength="2" value="<%= prd.getE01APCTLN()%>"> 
						<a href="javascript:GetLoanTable('E01APCTLN',document.forms[0].E01APCTYP.value)">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Producto de Reestructurados :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01APCSF3" value="Y" <%if (prd.getE01APCSF3().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCSF3" value="N" <%if (prd.getE01APCSF3().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Tabla Previsi&oacute;n :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCRLT" size="3" maxlength="2" value="<%= prd.getE01APCRLT() %>"> 
						 <a href="javascript:GetPrevTable('E01APCRLT')">
						 <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Intereses en la Cuota :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01APCREL" value="Y" <%if (!prd.getE01APCREL().equals("N")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCREL" value="N" <%if (prd.getE01APCREL().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Estructura de Tasas :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCCDT" size="3" maxlength="2" value="<%= prd.getE01APCCDT() %>"> 
						<a href="javascript:GetRateTable('E01APCCDT','P')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Libera Garant&iacute;a :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01APCRCL" value="Y" <%if (prd.getE01APCRCL().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCRCL" value="N" <%if (prd.getE01APCRCL().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Factoraje Tipo de Cobranza :</div>
				</td>
				<td width="25%">
					<select name="E01APAF11">
						<option value="1" <%if (prd.getE01APAF11().equals("1")) { out.print("selected"); }%>>Cobranza Directa</option>
						<option value="2" <%if (prd.getE01APAF11().equals("2")) { out.print("selected"); }%>>Cobranza Delegada</option>
					</select>
				</td>
				<td width="25%">
					<div align="right">Factoraje con Recurso :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01APAF12" value="Y" <%if (prd.getE01APAF12().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APAF12" value="N" <%if (prd.getE01APAF12().equals("N")) out.print("checked"); %>> No
				</td>
				</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Tabla Tasa Flotante o Lider :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCFRT" size="3" maxlength="2" value="<%= prd.getE01APCFRT() %>"> 
						<a href="javascript:GetFloating('E01APCFRT')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0"></a>
					<select name="E01APCFTY"> 
						<option value=" "  <% if (!(prd.getE01APCFTY().equals("FP") ||prd.getE01APCFTY().equals("FS"))) out.print("selected"); %>></option>
						<option value="FP" <%if (prd.getE01APCFTY().equals("FP")) { out.print("selected"); }%>>Primaria</option>
						<option value="FS" <%if (prd.getE01APCFTY().equals("FS")) { out.print("selected"); }%>>Secundaria</option>
					</select>
				</td>
				<td width="25%">
					<div align="right">Protecci&oacute;n de Garant&iacute;a :</div>
				</td>
				<td width="25%">
					<select name="E01APCAMC">
						<option value="1" <%if (prd.getE01APCAMC().equals("1")) { out.print("selected"); }%>>Solo Capital</option>
						<option value="2" <%if (prd.getE01APCAMC().equals("2")) { out.print("selected"); }%>>Capital e Intereses</option>
						<option value="3" <%if (prd.getE01APCAMC().equals("3")) { out.print("selected"); }%>>Capital, Intereses y Mora</option>
					</select>
				</td>
			</tr>

			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Tabla de Tramos Preferenciales :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCCC4" size="3" maxlength="2" value="<%= prd.getE01APCCC4() %>"> 
						<a href="javascript:GetLimit('E01APCCC4',document.forms[0].E01APCBNK.value,'')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Ciclo Cambio Tasa :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCRRD" size="3" maxlength="3" value="<%= prd.getE01APCRRD() %>"> 
						<a href="javascript:GetCode('E01APCRRD','STATIC_cycle_rev.jsp')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
			</tr>

			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Tabla de Cargos o Comisiones :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCTAR" size="3" maxlength="2" value="<%= prd.getE01APCTAR()%>"> 
						<a href="javascript:GetLoanChargeTable('E01APCTAR',document.forms[0].E01APCTYP.value)">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%" nowrap="nowrap">
					<div align="right">Penalidad por Prepago :</div>
				</td>
				<td width="25%" nowrap="nowrap">
					<input type="text" name="E01APCROY" size="3" maxlength="3" value="<%= prd.getE01APCROY() %>" onKeypress="enterInteger(event)">
				</td>
			</tr>

			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width=25% align="right">Codigo Actividad Economica :</td>
				<td width="25%" nowrap="nowrap">
					<input type="text" name="E01APACDE" size="4" maxlength="4" value="<%= prd.getE01APACDE().trim()%>">
						<a href="javascript:GetCodeDescCNOFC('E01APACDE','D01APANME','2C')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
				</td>

				<td width="25%">
					<div align="right">Tipo Prestamo S&uacute;per :</div>
				</td>
			<td width="25%">
					<input type="text" name="E01APCFL3" size="3" maxlength="1" value="<%= prd.getE01APCFL3() %>"> 
						<a href="javascript:GetCode('E01APCFL3','STATIC_ln_prod_sup.jsp')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
			</tr>
			
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Ciclo Estado de Cuenta :</div>
				</td>
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
				<td nowrap width=25%>
					<div align="right">Opciones de prepago :</div>
				</td>
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
				<td nowrap width="25%" align="right">Cr&eacute;ditos con Fomento :</td>
				<td width="25%" nowrap="nowrap">
					<input type="radio" name="E01APAF05" value="Y" <%if (prd.getE01APAF05().equals("Y")) out.print("checked"); %> onclick="ShowFomento('Y')"> Si 
					<input type="radio" name="E01APAF05" value="N" <%if (prd.getE01APAF05().equals("N")) out.print("checked"); %> onclick="ShowFomento('N')"> No
				</td>
			</tr>
			
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="25%" align="right">Acci&oacute;n Sobre un Cambio de Tasa :</td>
				<td width="25%" nowrap="nowrap">
					<select name="E01APAFG3">
						<option value=""></option>
						<option value="T" <%if (prd.getE01APAFG3().equals("T")) { out.print("selected"); }%>>Cambiar el Plazo</option>
						<option value="P" <%if (prd.getE01APAFG3().equals("P")) { out.print("selected"); }%>>Cambiar la Cuota</option>
					</select>
				</td>
				<td nowrap width="25%" align="right">Cr&eacute;ditos con Subsidio :</td>
				<td width="25%" nowrap="nowrap">
					<input type="radio" name="E01APAF02" value="Y" <%if (prd.getE01APAF02().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APAF02" value="N" <%if (prd.getE01APAF02().equals("N")) out.print("checked"); %>> No
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
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
				<td nowrap width=25% align="right">
	              <div align="right">Utiliza Cifras Decimales : </div>
	            </td>
				<td width="25%" nowrap="nowrap">
					<input type="radio" name="E01APAF10" value="Y" <%if (prd.getE01APAF10().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APAF10" value="N" <%if (prd.getE01APAF10().equals("N")) out.print("checked"); %>> No
	           </td>
				<td nowrap width=25% >
	              <div align="right" id="rowIncreAnual">Cuota Decreciente, Incremento Anual : </div>
	            </td>
				<td nowrap width="25%"  align="left">
				<div align="left" id="rowIncreAnual1">				
					<input type="radio" name="E01APCFL1" value="Y" <%if (prd.getE01APCFL1().equals("Y")) out.print("checked"); %> > Si 
					<input type="radio" name="E01APCFL1" value="N" <%if (prd.getE01APCFL1().equals("N")) out.print("checked"); %> > No
				</div>	
	           </td>
			</tr>	
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Termino Contrato :</div>
				</td>
				<td width="25%" nowrap="nowrap">
					<select name="E01APCFL4">
						<option value=""></option>
						<option value="C" <%if (prd.getE01APCFL4().equals("C")) { out.print("selected"); }%>>Corto Plazo</option>
						<option value="L" <%if (prd.getE01APCFL4().equals("L")) { out.print("selected"); }%>>Largo Plazo</option>
					</select>
				</td>
				<td width="25%">
					<div align="right">Maximo dias Fecha Valor :</div>
				</td>
				<td width="25%">
					<eibsinput:text property="E01APAUS2" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS%>" />
				</td>
			</tr>
		<%if(currUser.getE01INT().equals("07")){%>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
						<div align="right">Sujeto Cobro FECI :</div>
				</td>
				<td width="25%">
						<input type="radio" name="E01APCTX2" value="Y" <%if (prd.getE01APCTX2().equals("Y")) out.print("checked"); %>> Si 
						<input type="radio" name="E01APCTX2" value="N" <%if (!prd.getE01APCTX2().equals("Y")) out.print("checked"); %>> No
				</td>
				<td width="25%">
				</td>
				<td width="25%">
				</td>
			</tr>
		<%}%>			
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
				 	<div align="right">Formato Extracto 1 :</div> 
			    </td>
				<td width="25%">
				   <input type="text" name="E01APAUC1" size="4" maxlength="5" value="<%= prd.getE01APAUC1().trim()%>"> 
				   <a href="javascript:GetStmDef('E01APAUC1','A','L')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
				 	<div align="right">Formato Extracto 2 :</div> 
			    </td>
				<td width="25%">
				   <input type="text" name="E01APAUC2" size="4" maxlength="5" value="<%= prd.getE01APAUC2().trim()%>"> 
				   <a href="javascript:GetStmDef('E01APAUC2','A','L')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
				 	<div align="right">Formato Cupones :</div> 
			    </td>
				<td width="25%">
				   <input type="text" name="E01APAUC8" size="4" maxlength="5" value="<%= prd.getE01APAUC8().trim()%>"> 
				   <a href="javascript:GetStmDef('E01APAUC8')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
				</td>
				<td width="25%">
				 	<div align="right">Dias de Mora x No Enviar Extractos :</div> 
			    </td>
				<td width="25%">
					<input type="text" name="E01APAFC0" size="5" maxlength="5" value="<%= prd.getE01APAFC0() %>" onKeypress="enterInteger(event)">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
     		     <div align="right"> Tipo de Descuento de Documento :</div>
				</td>
				<td width="25%">
     		     <div align="left">
	 		        <select name="E01APCFL2">
						<option value=""></option>
						<option value="1" <%if (prd.getE01APCFL2().equals("1")) { out.print("selected"); }%>>DTV</option>
						<option value="2" <%if (prd.getE01APCFL2().equals("2")) { out.print("selected"); }%>>Confirming</option>
						<option value="3" <%if (prd.getE01APCFL2().equals("3")) { out.print("selected"); }%>>Linea Triangular</option>
					</select>
				 </div>	  	
				</td>
				<td width="25%">
					<div align="right"> Porcentaje de Negociacion :</div>
				</td>
				<td width="25%">
					<div align="left">
	 		        <select name="E01APAF09">
						<option value=""></option>
						<option value="C" <%if (prd.getE01APAF09().equals("C")) { out.print("selected"); }%>>Por Contrato</option>
						<option value="M" <%if (prd.getE01APAF09().equals("M")) { out.print("selected"); }%>>Ingreso de Monto por Letra</option>
					</select>
				 </div>	  	
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
     		     <div align="right"> Tasa de Interes Unica por Contrato :</div>
				</td>
				<td width="25%">
     		     <div align="left">
	 		       <input type="radio" name="E01APAF13" value="Y" <%if (prd.getE01APAF13().equals("Y")) out.print("checked"); %>> Si 
				   <input type="radio" name="E01APAF13" value="N" <%if (!prd.getE01APAF13().equals("Y")) out.print("checked"); %>> No
				 </div>	  	
				</td>
				<td width="25%">
					<div align="right"> Vencimiento Unico por Contrato:</div>
				</td>
				<td width="25%">
					<div align="left">
					 <input type="radio" name="E01APAF14" value="Y" <%if (prd.getE01APAF14().equals("Y")) out.print("checked"); %>> Si 
				   	 <input type="radio" name="E01APAF14" value="N" <%if (!prd.getE01APAF14().equals("Y")) out.print("checked"); %>> No
				 </div>	  	
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right"> Deudor Cliente/No Cliente :</div>
				</td>
				<td width="25%">
					<div align="left">
					 <select name="E01APAF15">
						<option value=""></option>
						<option value="C" <%if (prd.getE01APAF15().equals("C")) { out.print("selected"); }%>>Debe ser Cliente</option>
						<option value="N" <%if (prd.getE01APAF15().equals("N")) { out.print("selected"); }%>>Debe ser No Cliente</option>
						<option value="A" <%if (prd.getE01APAF15().equals("A")) { out.print("selected"); }%>>Cualquiera de las dos</option>
					</select>
				 </div>	  	
				</td>
				<td width="25%">
     		     <div align="right"> Deudor Requiere Linea de Credito :</div>
				</td>
				<td width="25%">
     		     <div align="left">
	 		       <input type="radio" name="E01APAF07" value="Y" <%if (prd.getE01APAF07().equals("Y")) out.print("checked"); %>> Si 
				   <input type="radio" name="E01APAF07" value="N" <%if (!prd.getE01APAF07().equals("Y")) out.print("checked"); %>> No
				 </div>	  	
				</td>
				
				
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
     		     <div id="divFomento1" style="display: <%= prd.getE01APAF05().equals("Y") ? "" : "none"%>" align="right"> Producto de Pasivo :</div>
				</td>
				<td width="25%">
     		     <div id="divFomento2" style="display: <%= prd.getE01APAF05().equals("Y") ? "" : "none"%>" align="left">
	 		        <eibsinput:help name="prd" property="E01APAUC4" fn_param_one="E01APAUC4" fn_param_two="10" fn_param_three="document.forms[0].E01BANK.value" fn_param_four=" " fn_param_five="String('L')" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="FALSE" />
				 </div>	  	
				</td>
				<td width="25%">
					<div align="right"></div>
				</td>
				<td width="25%">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>





<h4>L&iacute;mites</h4>

<table class="tableinfo" style="width: 1250px;">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<%row++;%>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Monto M&iacute;nimo Apertura :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCAM1" size="21" maxlength="15" value="<%= prd.getE01APCAM1().trim()%>" onKeypress="enterDecimal(event, 2)">
				</td>
				<td width="25%">
					<div align="right">Monto M&aacute;ximo Apertura :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCAM2" size="21" maxlength="15" value="<%= prd.getE01APCAM2().trim()%>" onKeypress="enterDecimal(event, 2)">
				</td>
			</tr>

			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Plazo M&iacute;nimo en Meses :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCUC2" size="5" maxlength="4" value="<%= prd.getE01APCUC2().trim()%>" onKeypress="enterInteger(event)">
				</td>
				<td width="25%">
					<div align="right">Plazo M&aacute;ximo en Meses :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCUC3" size="5" maxlength="4" value="<%= prd.getE01APCUC3().trim()%>" onKeypress="enterInteger(event)">
				</td>
			</tr>

			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Edad M&iacute;nima :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APADY2" size="4" maxlength="3" value="<%= prd.getE01APADY2().trim()%>" onKeypress="enterInteger(event)">
				</td>
				<td width="25%">
					<div align="right">Edad M&aacute;xima :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APADY3" size="4" maxlength="3" value="<%= prd.getE01APADY3().trim()%>" onKeypress="enterInteger(event)">
				</td>
			</tr>
			
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="25%" align="right">Control para Prepagos :</td>
				<td nowrap width="25%">
					<select name="E01APAF03" id="E01APAF03" onchange="show(this)">
						<option value="" > </option>
						<option value="N" <%if (prd.getE01APAF03().equals("N")) { out.print("selected"); }%>>M&iacute;nimo Cuotas</option>
						<option value="%" <%if (prd.getE01APAF03().equals("%")) { out.print("selected"); }%>>Prcentaje m&iacute;nimo </option>
					</select>
				</td>
				
				<td width="25%" id="datos1" style="display: none;">
					<div align="right" >Porcentaje M&iacute;nimo de Prepago :</div>
				</td>
				
				<td nowrap width="25%" id="datos2" style="display: none;">
					<div align="right" >Numero de Cuotas :</div>
				</td>
				<td nowrap width="25%" id="datos3" style="display: none;" align="left"> 
					<eibsinput:text property="E01APART1" name="prd" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
				</td>
				<td width="25%" id="datos4" style="display: none;">
				</td>
				<td width="25%" id="datos5" style="display: none;"> 
				</td>
			</tr>
			
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width=25% align="right">
					<div align="right">M&aacute;ximo D&iacute;as de gracia :</div>
				</td>
				<td nowrap width="25%">
					<input type="text" name="E01APAFC1" size="5" maxlength="4" value="<%= prd.getE01APAFC1() %>" onkeypress="enterInteger(event)">
				</td>
				<td nowrap width=25%>
				<div align="right">D&iacute;as aceleracion autom&aacute;tica :
				</div>
				</td>
				<td nowrap width="25%"><input type="text" name="E01APAFC2" size="5" maxlength="4" value="<%= prd.getE01APAFC2() %>" onkeypress="enterInteger(event)"></td>
			</tr>

			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width=25% id="datos6" style="display: none;">
				<div align="right" >Control Prorrogas o Renovaciones :
				</div>
				</td>
				<td nowrap width="25%" id="datos7" style="display: none;">
					<select name="E01APAF06" id="E01APAF06">
						<option value="" > </option>
						<option value="1" <%if (prd.getE01APAF06().equals("1")) { out.print("selected"); }%>>Prorrogas</option>
						<option value="2" <%if (prd.getE01APAF06().equals("2")) { out.print("selected"); }%>>Renovaciones </option>
						<option value="3" <%if (prd.getE01APAF06().equals("3")) { out.print("selected"); }%>>Ambas </option>
						<option value="N" <%if (prd.getE01APAF06().equals("N")) { out.print("selected"); }%>>No Permite </option>
					</select>
				</td>
				<td nowrap width="25%" id="datos8" style="display: none;">
					<div align="right" >Forma Desembolso :</div>
				</td>
				<td nowrap width="25%" id="datos9" style="display: none;">
	              <select name="E01APAF07">
		              <OPTION value=" " <% if (!(prd.getE01APAF07().equals("1") ||prd.getE01APAF07().equals("2"))) out.print("selected"); %>></OPTION>
		              <OPTION value="1" <% if(prd.getE01APAF07().equals("1")) out.print("selected");%>>Credito unico</OPTION>
		              <OPTION value="2" <% if(prd.getE01APAF07().equals("2")) out.print("selected");%>>Multiple credito</OPTION>
	              </select>
				</td>				
				<td nowrap width=25% align="right" id="datos10" style="display: none;">
					<div align="right">Plazo M&aacute;ximo en Meses a Prorrogar :</div>
				</td>
				<td nowrap width="25%" id="datos11" style="display: none;">
					<input type="text" name="E01APAUS1" size="4" maxlength="3" value="<%= prd.getE01APAUS1() %>" onkeypress="enterInteger(event)">
				</td>
				<td nowrap width=25% align="right" id="datos12" style="display: none;">
					<div align="right">Numero Cuotas x Desembolso :</div>
				</td>
				<td nowrap width="25%" id="datos13" style="display: none;">
					<input type="text" name="E01APAFC4" size="4" maxlength="3" value="<%= prd.getE01APAFC4() %>" onkeypress="enterInteger(event)">
				</td>	
			</tr>
		
		</table>
		</td>
	</tr>
</table>

<div id="divAddOpt" style="display: <%= prd.getE01APCSF1().equals("Y") ? "" : "none"%>">

<h4>Deducciones</h4>
	<table  id="mainTable" class="tableinfo" style="height: 90px; width: 1250px;">
    	<tr height="5%"> 
    		<TD NOWRAP width="100%" >
  				<TABLE id="headTable" width="100%" >
         			 <TR id="trdark"> 
			            <th nowrap  width="15%"></th>
			            <th nowrap  width="10%">Codigo</th>
			            <th nowrap  width="10%">Plan</th>
			            <th nowrap  width="30%">Descripcion</th>
			            <th nowrap  width="10%">Forma Cobro</th>
			            <th nowrap  width="10%">Obligatorio</th>
			            <th nowrap  width="15%"></th>
          			</TR>
       			</TABLE>
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
	          <input type=text name="E01APDDED<%= seq %>" value="<%= prd.getField("E01APDDED"+seq).getString() %>" size="5" maxlength="4"
	           class="context-menu-help" onmousedown="init(brokerHelp,this.name,'','','D01APDDED<%= seq %>','I','')">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center" > 
	           <input type=text name="E01APDFL1<%=seq%>" value="<%= prd.getField("E01APDFL1"+seq).getString() %>" size="3" maxlength="2"
	           class="context-menu-help" onmousedown="init(accountPlanHelp, this.name, document.forms[0].elements['E01APDDED<%= seq %>'].value,'','','')">
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
		</TD>
	</TR>	
	</TABLE>

</div>

<h4>Conceptos para Desembolso</h4>
<table  id="mainTable" class="tableinfo" style="height: 90px; width: 1250px;">
    	<tr height="5%"> 
    		<TD NOWRAP width="100%" >
  				<TABLE id="headTable" width="100%" >
         			 <TR id="trdark"> 
			            <th nowrap  width="15%"></th>
			            <th nowrap  width="10%">Codigo</th>
			            <th nowrap  width="90%" align="left">&nbsp;&nbsp;&nbsp;Descripcion</th>
          			</TR>
       			</TABLE>
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
	          <input type=text name="E01APHCON<%= counter %>" value="<%= prd.getField("E01APHCON"+counter).getString() %>" size="5" maxlength="4"
	           class="context-menu-help" onmousedown="init(conceptHelp,'D01APHDSC<%= counter %>',document.forms[0].E01APCBNK.value, document.forms[0].E01APCCCY.value,'',this.name,'10','01')">
              </div>
            </td>
            <td nowrap width="40%"> 
              <div align="left"> 
                <input type="text" name="D01APHDSC<%= counter %>" value="<%= prd.getField("D01APHDSC"+counter).getString()%>" size="60" maxlength="60" readonly>
              </div>
            </td>
            <td nowrap width="10%"> 
            </td>
            <td nowrap width="10%"> 
            </td>
             <td nowrap width="15%"> </td>
          </tr>
         <% } %> 
				</table>
			</div>
		</TD>
	</TR>	
	</TABLE>




<h4>Direcciones de Acceso</h4>
<table class="tableinfo" style="width: 1250px;">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Audio :</div>
				</td>
				<td width="75%">
					<input type="text" name="E01APEAUD" size="82" maxlength="80" value="<%= prd.getE01APEAUD() %>">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Video :</div>
				</td>
				<td width="75%">
					<input type="text" name="E01APEVID" size="82" maxlength="80" value="<%= prd.getE01APEVID() %>">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">HTML :</div>
				</td>
				<td width="75%">
					<input type="text" name="E01APEHTM" size="82" maxlength="80" value="<%= prd.getE01APEHTM() %>">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


<div align="center"><input id="EIBSBTN" type=Submit name="Submit" value="Enviar"></div>

<SCRIPT type="text/javascript">
	show(document.getElementById("E01APAF03"));
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

showIncreAnual(getElement('E01APCPPD').value);
	
	
</SCRIPT>


</form>
</body>
</html>
