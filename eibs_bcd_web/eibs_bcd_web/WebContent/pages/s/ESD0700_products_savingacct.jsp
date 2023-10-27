<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<html>
<head>
<title>Productos para Cuentas de Ahorros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/dynlayer.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/pop_out.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/nav_aid.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<%
 boolean isReadOnly = false;
 %>
<body>

<script type="text/javascript">
<%    
   
  	if (userPO.getPurpose().equals("INQUIRY")) {
		if (userPO.getOption().equals("RT")) {%>
  			builtNewMenu(rt_i_opt);
		<%} else if ( userPO.getOption().equals("SV") ) {%>
			builtNewMenu(sv_i_opt);
		<%}%>
		 initMenu();
		 <%
		isReadOnly = true;
	}
	
%>

</script>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }
    %>


<h3 align="center">Producto para Cuentas de Ahorro<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="products_savingacct.jsp, ESD0700"></h3>
<hr size="4">

<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1"> <INPUT TYPE=HIDDEN
	NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" class="tbhead"
			align="center">
			<tr>
				<td nowrap width="10%" align="right">Banco :</td>
				<td nowrap width="12%" align="left"><input type="text"
					name="E01APCBNK" size="3" maxlength="2"
					value="<%= prd.getE01APCBNK()%>" readonly></td>
				<td nowrap width="6%" align="right">Producto :</td>
				<td nowrap width="14%" align="left"><input type="text"
					name="E01APCCDE" size="6" maxlength="4"
					value="<%= prd.getE01APCCDE()%>" readonly></td>
				<td nowrap width="8%" align="right">Tipo de Producto :</td>
				<td nowrap width="50%" align="left"><input type="text"
					name="E01APCTYP" size="6" maxlength="4"
					value="<%= prd.getE01APCTYP()%>" readonly> - <input
					type="text" name="E01DSCTYP" size="45" maxlength="45"
					value="<%= prd.getE01DSCTYP()%>" readonly></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<%int row = 1; %> 
<h4>Informaci&oacute;n General</h4>

<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Descripci&oacute;n :</div>
				</td>
				<td><input type="text" name="E01APCDS1" size="50"
					maxlength="45" value="<%= prd.getE01APCDS1()%>" <%if(isReadOnly) out.print("readonly"); %>></td>
				<td>
				<div align="right">Nombre de Mercadeo :</div>
				</td>
				<td><input type="text" name="E01APCDS2" size="28"
					maxlength="25" value="<%= prd.getE01APCDS2()%>" <%if(isReadOnly) out.print("readonly"); %>></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">C&oacute;digo de Moneda :</div>
				</td>
				<td><input type="text" name="E01APCCCY" size="4" maxlength="3"
					value="<%= prd.getE01APCCCY()%>" <%if(isReadOnly) out.print("readonly"); %>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetCurrency('E01APCCCY','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
				<td>
				<div align="right">Ofrecimiento por :</div>
				</td>
				<td><SELECT name="E01APCFTT" <%if(isReadOnly) out.print("disabled"); %>>
					<OPTION value="1"
						<%if (prd.getE01APCFTT().equals("1")) { out.print("selected"); }%>>Internet</OPTION>
					<OPTION value="I"
						<%if (prd.getE01APCFTT().equals("I")) { out.print("selected"); }%>>Internacional</OPTION>
					<OPTION value="L"
						<%if (prd.getE01APCFTT().equals("L")) { out.print("selected"); }%>>Local</OPTION>
					<OPTION value="3"
						<%if (prd.getE01APCFTT().equals("3")) { out.print("selected"); }%>>Plataforma</OPTION>
					<OPTION value="5"
						<%if (prd.getE01APCFTT().equals("5")) { out.print("selected"); }%>>Cualquier
					Medio</OPTION>
					<OPTION value="N"
						<%if (prd.getE01APCFTT().equals("N")) { out.print("selected"); }%>>No
					Ofrecer</OPTION>
				</SELECT></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Cuenta Contable:</div>
				</td>
				<td><input type="text" name="E01APCGLN" size="18"
					maxlength="16" value="<%= prd.getE01APCGLN().trim()%>" <%if(isReadOnly) out.print("readonly"); %>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,document.forms[0].E01APCACD.value,'','<%= prd.getE01APCTYP().trim()%>')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
				<td>
				<div align="right">Tipo de Residencia :</div>
				</td>
				<td><select name="E01APCRES" <%if(isReadOnly) out.print("disabled"); %>>
					<option value=""
						<%if (prd.getE01APCRES().equals(""))   { out.print("selected"); }%>>Cualquiera</option>
					<option value="1"
						<%if (prd.getE01APCRES().equals("1")) { out.print("selected"); }%>>Residentes</option>
					<option value="2"
						<%if (prd.getE01APCRES().equals("2")) { out.print("selected"); }%>>Extranjeros</option>
				</select></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Tabla de Documentos :</div>
				</td>
				<td><input type="text" name="E01APCDOC" size="4" maxlength="2"
					value="<%= prd.getE01APCDOC().trim()%>" <%if(isReadOnly) out.print("readonly"); %>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetDocInv('E01APCDOC')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
				<td>
				<div align="right">Sobregiro Permitido :</div>
				</td>
				<td width="18%"><input type="radio" name="E01APCAMO" value="1"
					<%if (prd.getE01APCAMO().equals("1")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled"); %>>
				Si <input type="radio" name="E01APCAMO" value="N"
					<%if (prd.getE01APCAMO().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled"); %>>
				No</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">C&oacute;digos Tabla de Cargos :</div>
				</td>
				<td><input type="text" name="E01APCTAR" size="3" maxlength="2"
					value="<%= prd.getE01APCTAR()%>" <%if(isReadOnly) out.print("readonly"); %>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetRetCod('E01APCTAR','<%= prd.getE01APCTYP()%>')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%}%></td>
				<td>
				<div align="right">Frecuencia Pago de Intereses :</div>
				</td>
				<td>
				  <select name="E01APCFL4" <%if(isReadOnly) out.print("disabled"); %>>
					<option value="M"
						<%if (prd.getE01APCFL4().equals("M")) { out.print("selected"); }%>>Mensual</option>
					<option value="D"
						<%if (prd.getE01APCFL4().equals("D")) { out.print("selected"); }%>>Diario</option>
					<option value="Q"
						<%if (prd.getE01APCFL4().equals("Q")) { out.print("selected"); }%>>Trimestral</option>
					<option value="S"
						<%if (prd.getE01APCFL4().equals("S")) { out.print("selected"); }%>>Semestral</option>
					<option value="Y"
						<%if (prd.getE01APCFL4().equals("Y")) { out.print("selected"); }%>>Anual</option>
				  </select>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td align="right">Tipo de Cliente : </td>
				<td>
				  <select name="E01APCFRA" <%if(isReadOnly) out.print("disabled"); %>>
	                <option value=" " <%if (prd.getE01APCFRA().equals(" ")) { out.print("selected"); }%>>Cualquiera</option>
	                <option value="1" <%if (prd.getE01APCFRA().equals("1")) { out.print("selected"); }%>>Juridico</option>
	                <option value="2" <%if (prd.getE01APCFRA().equals("2")) { out.print("selected"); }%>>Natural</option>
	              </select>
				</td>
				<td align="right">Frecuencia Pagos Reajuste : </td>
				<td><select name="E01APCFRN" <%if(isReadOnly) out.print("disabled"); %>>
					<option value="N"
						<%if (prd.getE01APCFRN().equals("N")) { out.print("selected"); }%>>No
					Aplica</option>
					<option value="M"
						<%if (prd.getE01APCFRN().equals("M")) { out.print("selected"); }%>>Mensual</option>
					<option value="Q"
						<%if (prd.getE01APCFRN().equals("Q")) { out.print("selected"); }%>>Trimestral</option>
					<option value="S"
						<%if (prd.getE01APCFRN().equals("S")) { out.print("selected"); }%>>Semestral</option>
					<option value="Y"
						<%if (prd.getE01APCFRN().equals("Y")) { out.print("selected"); }%>>Anual</option>
				</select>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td  align="right">Tipo Ahorro : </td>
				<td><select name="E01APCFL2" <%if(isReadOnly) out.print("disabled"); %>>
					<% if("06".equals(prd.getE01APCACD())) {%>					
						<%-- Only for Cuota de Participacion ACDs--%>
						<option value="3" <% if (prd.getE01APCFL2().equals("3") || "06".equals(prd.getE01APCACD())) out.print("selected");%>>
							Cuota de Participación
						</option>
					<% } else {%>					
						<option value="" <% if (prd.getE01APCFL2().equals("")) out.print("selected");%>>
							N/A
						</option>
						<option value="4" 
						<% if (prd.getE01APCFL2().equals("4")) out.print("selected");%>>
							Ahorro Programado</option>
						<option value="5" <% if (prd.getE01APCFL2().equals("5")) out.print("selected");%>>
							Ahorro Milagroso
						</option>
					<% } %>					
					</select>
				</td>
				<td  align="right"></td>
				<td nowrap width="35%" align="left" >
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
					<div align="right">Número de Registro RECA :</div>
				</td>
				<td>
					<input type="text" name="E01APAD01" size="40" maxlength="35" value="<%= prd.getE01APAD01()%>" <%if(isReadOnly) out.print("readonly"); %> >
				</td>
				<td>
				<div align="right">Tipos de Tarjetas ATM :</div>
				</td>
				<td width="25%"><input type="text" name="E01APCCC1" size="4"
					maxlength="2" value="<%= prd.getE01APCCC1().trim()%>" <%if(isReadOnly) out.print("readonly"); %>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetDescATMCard('E01APCCC1')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%}%></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
					<div align="right">Comisiones :</div>
				</td>
				<td>
				    <input type="text" name="E01APAUC9" size="5" maxlength="4" value="<%= prd.getE01APAUC9().trim() %>" <%if(isReadOnly) out.print("readonly"); %>>
				    <input type="hidden" name="DSCAPAUC9" size="5" maxlength="4" value="" <%if(isReadOnly) out.print("readonly"); %>>
				     <%if(!isReadOnly){%> <a href="javascript:GetCommission('E01APAUC9','DSCAPAUC9')" >
				      <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				      <%} %>
				</td>
				<td>
				<div align="right">Permite mas de una cuenta con este producto :</div>
				</td>
				<td>
				  <input type="radio" name="E01APAF13" value="Y"  <%if (prd.getE01APAF13().equals("Y")) out.print("checked"); %>
				  <%if(isReadOnly) out.print("disabled"); %>>
              		Si 
             	   <input type="radio" name="E01APAF13" value="N"  <%if (prd.getE01APAF13().equals("N")) out.print("checked"); %>
             	   <%if(isReadOnly) out.print("disabled"); %>>
           			No
           		</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Producto CATS:</div>
				</td>
				<td nowrap width="25%">
       				<input type="radio" name="E01APCTX8" value="Y" <%if (prd.getE01APCTX8().equals("Y")) out.print("checked"); %>
       				<%if(isReadOnly) out.print("disabled"); %>>
	  					Si 
       				<input type="radio" name="E01APCTX8" value="N" <%if (prd.getE01APCTX8().equals("N")) out.print("checked"); %>
       				<%if(isReadOnly) out.print("disabled"); %>>
	  					No 
            	</td>
				<td width="25%" align="right">Apertura con Aprobación Automatica : </td>
				<td width="25%" >
					<input type="radio" name="E01APCAPV" value="Y" <%if (prd.getE01APCAPV().equals("Y")) out.print("checked"); %>
					<%if(isReadOnly) out.print("disabled"); %>> Si 
					<input type="radio" name="E01APCAPV" value="N" <%if (prd.getE01APCAPV().equals("N")) out.print("checked"); %>
					<%if(isReadOnly) out.print("disabled"); %>> No
			 	</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             	<td width="25%" align="right">Permite Clientes Simplificados : </td>
				<td width="25%" >
					<input type="radio" name="E01APCTX9" value="Y" <%if (prd.getE01APCTX9().equals("Y")) out.print("checked"); %>
					<%if(isReadOnly) out.print("disabled"); %>> Si 
					<input type="radio" name="E01APCTX9" value="N" <%if (prd.getE01APCTX9().equals("N")) out.print("checked"); %>
					<%if(isReadOnly) out.print("disabled"); %>> No
			 	</td>
			 	<td align="right">Relación con el Banco Si Simplificado 1 : </td>
				<td nowrap width="35%" align="left" >
                	<select name="E01APAFG1" <%if(isReadOnly) out.print("disabled"); %>>
                	<option value=" " <% if (prd.getE01APAFG1().equals(" ")) out.print("selected"); %>>NO APLICA</option>
                    <option value="1" <% if (prd.getE01APAFG1().equals("1")) out.print("selected"); %>>CLIENTE REGULAR</option>
                    <option value="2" <% if (prd.getE01APAFG1().equals("2")) out.print("selected"); %>>CONTRAPARTE</option>
                    <option value="3" <% if (prd.getE01APAFG1().equals("3")) out.print("selected"); %>>EMPLEADO</option>
                    <option value="7" <% if (prd.getE01APAFG1().equals("7")) out.print("selected"); %>>CODEUDOR</option>
                    <option value="9" <% if (prd.getE01APAFG1().equals("9")) out.print("selected"); %>>CB</option>
                    <option value="I" <% if (prd.getE01APAFG1().equals("I")) out.print("selected"); %>>INTERVINIENTE</option>
                    <option value="T" <% if (prd.getE01APAFG1().equals("T")) out.print("selected"); %>>MERCADO SEGUNDARIO</option>
                    <option value="E" <% if (prd.getE01APAFG1().equals("E")) out.print("selected"); %>>USUARIO</option>
                    <option value="P" <% if (prd.getE01APAFG1().equals("P")) out.print("selected"); %>>PROVEEDOR</option>
                    <option value="C" <% if (prd.getE01APAFG1().equals("C")) out.print("selected"); %>>CONVENIO</option>
                    <option value="B" <% if (prd.getE01APAFG1().equals("B")) out.print("selected"); %>>BANCARIZACION</option>
                    <option value="L" <% if (prd.getE01APAFG1().equals("L")) out.print("selected"); %>>LIDER</option>
                    <option value="X" <% if (prd.getE01APAFG1().equals("X")) out.print("selected"); %>>CUALQUIERA</option>
                	</select>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             	<td width="25%" align="right"> </td>
				<td width="25%" >
			 	</td>
			 	<td align="right">Relación con el Banco Si Simplificado 2 : </td>
				<td nowrap width="35%" align="left" >
                	<select name="E01APAFG2" <%if(isReadOnly) out.print("disabled"); %>>
                	<option value=" " <% if (prd.getE01APAFG2().equals(" ")) out.print("selected"); %>>NO APLICA</option>
                    <option value="1" <% if (prd.getE01APAFG2().equals("1")) out.print("selected"); %>>CLIENTE REGULAR</option>
                    <option value="2" <% if (prd.getE01APAFG2().equals("2")) out.print("selected"); %>>CONTRAPARTE</option>
                    <option value="3" <% if (prd.getE01APAFG2().equals("3")) out.print("selected"); %>>EMPLEADO</option>
                    <option value="7" <% if (prd.getE01APAFG2().equals("7")) out.print("selected"); %>>CODEUDOR</option>
                    <option value="9" <% if (prd.getE01APAFG2().equals("9")) out.print("selected"); %>>CB</option>
                    <option value="I" <% if (prd.getE01APAFG2().equals("I")) out.print("selected"); %>>INTERVINIENTE</option>
                    <option value="T" <% if (prd.getE01APAFG2().equals("T")) out.print("selected"); %>>MERCADO SEGUNDARIO</option>
                    <option value="E" <% if (prd.getE01APAFG2().equals("E")) out.print("selected"); %>>USUARIO</option>
                    <option value="P" <% if (prd.getE01APAFG2().equals("P")) out.print("selected"); %>>PROVEEDOR</option>
                    <option value="C" <% if (prd.getE01APAFG2().equals("C")) out.print("selected"); %>>CONVENIO</option>
                    <option value="B" <% if (prd.getE01APAFG2().equals("B")) out.print("selected"); %>>BANCARIZACION</option>
                    <option value="L" <% if (prd.getE01APAFG2().equals("L")) out.print("selected"); %>>LIDER</option>
                    <option value="X" <% if (prd.getE01APAFG2().equals("X")) out.print("selected"); %>>CUALQUIERA</option>
                	</select>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             	<td width="25%" align="right"></td>
				<td width="25%" >
			 	</td>
			 	<td align="right">Relación con el Banco Si Simplificado 3 : </td>
				<td nowrap width="35%" align="left" >
                	<select name="E01APAFG3" <%if(isReadOnly) out.print("disabled"); %>>
                	<option value=" " <% if (prd.getE01APAFG3().equals(" ")) out.print("selected"); %>>NO APLICA</option>
                    <option value="1" <% if (prd.getE01APAFG3().equals("1")) out.print("selected"); %>>CLIENTE REGULAR</option>
                    <option value="2" <% if (prd.getE01APAFG3().equals("2")) out.print("selected"); %>>CONTRAPARTE</option>
                    <option value="3" <% if (prd.getE01APAFG3().equals("3")) out.print("selected"); %>>EMPLEADO</option>
                    <option value="7" <% if (prd.getE01APAFG3().equals("7")) out.print("selected"); %>>CODEUDOR</option>
                    <option value="9" <% if (prd.getE01APAFG3().equals("9")) out.print("selected"); %>>CB</option>
                    <option value="I" <% if (prd.getE01APAFG3().equals("I")) out.print("selected"); %>>INTERVINIENTE</option>
                    <option value="T" <% if (prd.getE01APAFG3().equals("T")) out.print("selected"); %>>MERCADO SEGUNDARIO</option>
                    <option value="E" <% if (prd.getE01APAFG3().equals("E")) out.print("selected"); %>>USUARIO</option>
                    <option value="P" <% if (prd.getE01APAFG3().equals("P")) out.print("selected"); %>>PROVEEDOR</option>
                    <option value="C" <% if (prd.getE01APAFG3().equals("C")) out.print("selected"); %>>CONVENIO</option>
                    <option value="B" <% if (prd.getE01APAFG3().equals("B")) out.print("selected"); %>>BANCARIZACION</option>
                    <option value="L" <% if (prd.getE01APAFG3().equals("L")) out.print("selected"); %>>LIDER</option>
                    <option value="X" <% if (prd.getE01APAFG3().equals("X")) out.print("selected"); %>>CUALQUIERA</option>
                	</select>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%" align="right">Verificar Biometr&iacute;a :</td>
				<td width="25%" >
					<input type="radio" name="E01APAF06" value="Y" <%if ( prd.getE01APAF06().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APAF06" value="N" <%if (!prd.getE01APAF06().equals("Y")) out.print("checked"); %>> No
			 	</td>
				<td width="25%"><div align="right"></div></td>
				<td width="25%"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Limites</h4> 
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Saldo Mínimo :</div>
				</td>
				<td><input type="text" name="E01APCAM1" size="19"
					maxlength="17" value="<%= prd.getE01APCAM1()%>"
					onkeypress="enterDecimal(event, 2)" <%if(isReadOnly) out.print("readonly"); %>>
				</td>
				<td>
				<div align="right">Saldo Máximo :</div>
				</td>
				<td><input type="text" name="E01APCAM2" size="19"
					maxlength="17" value="<%= prd.getE01APCAM2()%>"
					onkeypress="enterInteger(event, 2)" <%if(isReadOnly) out.print("readonly"); %>>
				</td>
			</tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="34"> 
              <div align="right">Monto Límite Debitos :</div>
            </td>
            <td nowrap width="25%" height="34" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E01APAAM1" size="15" maxlength="13" value="<%= prd.getE01APAAM1()%>"
                onkeypress="enterInteger(event, 2)" <%if(isReadOnly) out.print("readonly"); %>>
                <select name="E01APAF14" <%if(isReadOnly) out.print("disabled"); %>>
                  <option value=" " <% if (!(prd.getE01APAF14().equals("M") || prd.getE01APAF14().equals("B")
                  		|| prd.getE01APAF14().equals("Q") || prd.getE01APAF14().equals("S") || prd.getE01APAF14().equals("Y"))) out.print("selected"); %>></option>
                  <option value="M" <%if (prd.getE01APAF14().equals("M")) { out.print("selected"); }%>>Mensual</option>
                  <option value="B" <%if (prd.getE01APAF14().equals("B")) { out.print("selected"); }%>>Bimestral</option>
                  <option value="Q" <%if (prd.getE01APAF14().equals("Q")) { out.print("selected"); }%>>Trimestral</option>
                  <option value="S" <%if (prd.getE01APAF14().equals("S")) { out.print("selected"); }%>>Semestral</option>
                  <option value="Y" <%if (prd.getE01APAF14().equals("Y")) { out.print("selected"); }%>>Anual</option>
                </select>
              </div>
            </td>
            <td nowrap width="25%" height="34"> 
              <div align="right">Monto Límite Créditos :</div>
            </td>
            <td nowrap width="25%" height="34" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E01APAAM2" size="15" maxlength="13" value="<%= prd.getE01APAAM2()%>"
                onkeypress="enterInteger(event, 2)" <%if(isReadOnly) out.print("readonly"); %>>
                <select name="E01APAF15" <%if(isReadOnly) out.print("disabled"); %>>
                  <option value=" " <% if (!(prd.getE01APAF15().equals("M") || prd.getE01APAF15().equals("B")
                  		|| prd.getE01APAF15().equals("Q") || prd.getE01APAF15().equals("S") || prd.getE01APAF15().equals("Y"))) out.print("selected"); %>></option>
                  <option value="M" <%if (prd.getE01APAF15().equals("M")) { out.print("selected"); }%>>Mensual</option>
                  <option value="B" <%if (prd.getE01APAF15().equals("B")) { out.print("selected"); }%>>Bimestral</option>
                  <option value="Q" <%if (prd.getE01APAF15().equals("Q")) { out.print("selected"); }%>>Trimestral</option>
                  <option value="S" <%if (prd.getE01APAF15().equals("S")) { out.print("selected"); }%>>Semestral</option>
                  <option value="Y" <%if (prd.getE01APAF15().equals("Y")) { out.print("selected"); }%>>Anual</option>
                </select>
              </div>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
  
  <h4>Grupo Cuentas de Ahorro</h4> 
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Plazo Mínimo (en meses) :</div>
				</td>
				<td><input type="text" name="E01APAFC6" size="3"
					maxlength="2" value="<%= prd.getE01APAFC6()%>"
					onkeypress="enterDecimal(event, 2)" <%if(isReadOnly) out.print("readonly"); %>>
				</td>
				<td>
				<div align="right">Plazo Máximo (en meses) :</div>
				</td>
				<td><input type="text" name="E01APAFC7" size="3"
					maxlength="2" value="<%= prd.getE01APAFC7()%>"
					onkeypress="enterInteger(event, 2)" <%if(isReadOnly) out.print("readonly"); %>>
				</td>
			</tr>
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Integrantes Mínimo :</div>
				</td>
				<td><input type="text" name="E01APAFC8" size="3"
					maxlength="2" value="<%= prd.getE01APAFC8()%>"
					onkeypress="enterDecimal(event, 2)" <%if(isReadOnly) out.print("readonly"); %>>
				</td>
				<td>
				<div align="right">Integrantes Máximo (Tope 10) :</div>
				</td>
				<td><input type="text" name="E01APAFC9" size="3"
					maxlength="2" value="<%= prd.getE01APAFC9()%>"
					onkeypress="enterInteger(event, 2)" <%if(isReadOnly) out.print("readonly"); %>>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Escala/Tramo:</div>
				</td>
				<td nowrap width="25%">
					 <input type="text" name="E01APAUC5" size="4" maxlength="5" value="<%= prd.getE01APAUC5().trim()%>"
					 <%if(isReadOnly) out.print("readonly"); %>>
					 <%if(!isReadOnly){ %>
                	<a href="javascript:GetScaleDef('E01APAUC5','E01DEST')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
                	<input type="hidden" name="E01DEST" size="40" maxlength="35" value="">
                	<%} %>
                </td>
                <td>
				</td>
				<td>
				</td>
            </tr>    
		 </table>
      </td>
    </tr>
  </table>
<%if(!isReadOnly){%>
<div align="center"><input id="EIBSBTN" type=button name="Submit"
	OnClick="submit()" value="Enviar"></div>
<%} %>
</form>
</body>
</html>
