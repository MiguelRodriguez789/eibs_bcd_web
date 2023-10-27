<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<html>
<head>
<title>Consulta de Productos de Cuentas de Detalle</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
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
<P><BR>
</P>
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

<h3 align="center">Producto de Cuentas de Detalles<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="products_dda.jsp, ESD0700"></h3>
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
				<td nowrap="nowrap">
				<div align="right">Descripci&oacute;n :</div>
				</td>
				<td><input type="text" name="E01APCDS1" size="50"
					maxlength="45" value="<%= prd.getE01APCDS1()%>" <%if(isReadOnly) out.print("readonly");%>></td>
				<td>
				<div align="right">Nombre de Mercadeo :</div>
				</td>
				<td><input type="text" name="E01APCDS2" size="28"
					maxlength="25" value="<%= prd.getE01APCDS2()%>" <%if(isReadOnly) out.print("readonly");%>></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap="nowrap">
				<div align="right">C&oacute;digo de Moneda :</div>
				</td>
				<td><input type="text" name="E01APCCCY" size="3" maxlength="3"
					value="<%= prd.getE01APCCCY()%>" <%if(isReadOnly) out.print("readonly");%>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetCurrency('E01APCCCY','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
				<td nowrap="nowrap">
				<div align="right">Ofrecimiento por :</div>
				</td>
				<td><SELECT name="E01APCFTT" <%if(isReadOnly) out.print("disabled");%>>
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
				<td nowrap="nowrap">
				<div align="right">Cuenta Contable:</div>
				</td>
				<td><input type="text" name="E01APCGLN" size="20"
					maxlength="16" value="<%= prd.getE01APCGLN().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,document.forms[0].E01APCACD.value,'','<%= prd.getE01APCTYP().trim()%>')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
				<td nowrap="nowrap">
				<div align="right">Tipo de Residencia :</div>
				</td>
				<td><select name="E01APCRES" <%if(isReadOnly) out.print("disabled");%>>
					<option value=""
						<%if (prd.getE01APCRES().equals(""))   { out.print("selected"); }%>>Cualquiera</option>
					<option value="1"
						<%if (prd.getE01APCRES().equals("1")) { out.print("selected"); }%>>Residentes</option>
					<option value="2"
						<%if (prd.getE01APCRES().equals("2")) { out.print("selected"); }%>>Extranjeros</option>
				</select></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap="nowrap">
				<div align="right">Tabla de Documentos :</div>
				</td>
				<td><input type="text" name="E01APCDOC" size="4" maxlength="2"
					value="<%= prd.getE01APCDOC().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetDocInv('E01APCDOC')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>

				<td nowrap="nowrap">
					<div align="right">Control de Chequeras :</div>
				</td>
				<td><input type="radio" name="E01APCCBC" value="Y"
					<%if (prd.getE01APCCBC().equals("Y")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
				Si <input type="radio" name="E01APCCBC" value="N"
					<%if (prd.getE01APCCBC().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
				No</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap="nowrap">
				<div align="right">Producto Familia :</div>
				</td>
				<td><input type="text" name="E01APCUC1" size="4" maxlength="2"
					value="<%= prd.getE01APCUC1().trim()%>" <%if(isReadOnly) out.print("readonly");%>></td>
				<td>
				<div align="right">Producto Mayoria Edad :</div>
				</td>
				<td><input type="text" name="E01APCUC3" size="5" maxlength="4"
					value="<%= prd.getE01APCUC3().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetProduct('E01APCUC3','<%= prd.getE01APCACD()%>',document.forms[0].E01APCBNK.value,' ','<%= prd.getE01APCTYP().trim()%>')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="help"
					align="middle" border="0"></a>
					<%} %></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap="nowrap">
				<div align="right">Tipos de Tarjetas ATM :</div>
				</td>
				<td width="25%"><input type="text" name="E01APCCC1" size="3"
					maxlength="1" value="<%= prd.getE01APCCC1().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetDescATMCard('E01APCCC1')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
				<td>
				<div align="right">Sobregiro Permitido :</div>
				</td>
				<td width="18%"><input type="radio" name="E01APCAMO" value="1"
					<%if (prd.getE01APCAMO().equals("1")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
				Si <input type="radio" name="E01APCAMO" value="N"
					<%if (prd.getE01APCAMO().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
				No</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap="nowrap">
				<div align="right">Tipo de Cliente :</div>
				</td>
				<td><select name="E01APCFRA" <%if(isReadOnly) out.print("disabled");%>>
					<option value=" " <%if (prd.getE01APCFRA().equals(" ")) { out.print("selected"); }%>>Cualquiera</option>
					<option value="0" <%if (prd.getE01APCFRA().equals("0")) { out.print("selected"); }%>>Socios</option>
					<option value="1" <%if (prd.getE01APCFRA().equals("1")) { out.print("selected"); }%>>Empresa</option>
					<option value="2" <%if (prd.getE01APCFRA().equals("2")) { out.print("selected"); }%>>Persona</option>
					<option value="3" <%if (prd.getE01APCFRA().equals("3")) { out.print("selected"); }%>>Menor de Edad</option>
				</select>
			</td>
				<td nowrap="nowrap">
				<div align="right">C&oacute;digos Tabla de Cargos :</div>
				</td>
				<td width="18%"><input type="text" name="E01APCTAR" size="3"
					maxlength="2" value="<%= prd.getE01APCTAR()%>" <%if(isReadOnly) out.print("readonly");%>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetRetCod('E01APCTAR','<%= prd.getE01APCTYP()%>')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap="nowrap">
				<div align="right">Tipo Chequera Inicial :</div>
				</td>
				<td width="25%"><input type="text" name="E01APCCC3" size="3"
					maxlength="2" value="<%=prd.getE01APCCC3()%>" <%if(isReadOnly) out.print("readonly");%>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetTypCHKBook('E01APCCC3','','','','<%= prd.getE01APCTYP()%>','<%= prd.getE01APCCCY()%>')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a>
					<%} %></td>
				<td>
				<div align="right">Intermoneda :</div>
				</td>
				<td width="18%"><input type="text" name="E01APCROY" size="4"
					maxlength="3" value="<%= prd.getE01APCROY().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
					<%if(!isReadOnly){%> <a
					href="javascript:GetCurrency('E01APCROY','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
			</tr>
			<%  if (!prd.getE01APCACD().equals("01")){ %>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Frecuencia Pagos Reajuste:</div>
				</td>
				<td><select name="E01APCFRN" <%if(isReadOnly) out.print("disabled");%>>
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
				</select></td>
				<td nowrap="nowrap" align="right">Frecuencia Pago de Intereses : </td>
				<td><select name="E01APCFL4" <%if(isReadOnly) out.print("disabled");%>>
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
			<%  } %>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap="nowrap">
				<div align="right">Número de Registro RECA :</div>
				</td>
				<td width="18%"><input type="text" name="E01APAD01" size="40" maxlength="35" value="<%=prd.getE01APAD01().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
				</td>
				<td nowrap="nowrap">
				<div align="right">Comisiones :</div>
				</td>
				<td>
				    <input type="text" name="E01APAUC9" size="5" maxlength="4" value="<%= prd.getE01APAUC9().trim() %>" <%if(isReadOnly) out.print("readonly");%>>
				    <input type="hidden" name="DSCAPAUC9" size="5" maxlength="4" value="">
				      <%if(!isReadOnly){%><a href="javascript:GetCommission('E01APAUC9','DSCAPAUC9')" >
				      <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				      <%} %>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             	<td width="25%" align="right">Apertura con Aprobación Automatica : </td>
				<td width="25%" >
					<input type="radio" name="E01APCAPV" value="Y" <%if (prd.getE01APCAPV().equals("Y")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>> Si 
					<input type="radio" name="E01APCAPV" value="N" <%if (prd.getE01APCAPV().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>> No
			 	</td>
				<td width="25%"><div align="right">Producto Corresponsales : </div></td>
            	<td width="25%">
              		<input type="radio" name="E01APCFL2" value="Y" <%if (prd.getE01APCFL2().equals("Y")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>> Si 
              		<input type="radio" name="E01APCFL2" value="N" <%if (prd.getE01APCFL2().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>> No
            	</td>
            </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             	<td width="25%" align="right">Permite Clientes Simplificados : </td>
				<td width="25%" >
					<input type="radio" name="E01APCTX9" value="Y" <%if (prd.getE01APCTX9().equals("Y")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>> Si 
					<input type="radio" name="E01APCTX9" value="N" <%if (prd.getE01APCTX9().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>> No
			 	</td>
			 	<td align="right">Relación con el Banco Si Simplificado 1 : </td>
				<td nowrap width="35%" align="left" >
                	<select name="E01APAFG1" <%if(isReadOnly) out.print("disabled");%>>
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
                	<select name="E01APAFG2" <%if(isReadOnly) out.print("disabled");%>>
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
                	<select name="E01APAFG3" <%if(isReadOnly) out.print("disabled");%>>
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
		</td>
	</tr>
</table>

<h4>Informaci&oacute;n Sobre Proteccion Sobregiros</h4>

<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right"><b>Proteccion de Sobregiro :</B></div>
				</td>
				<td colspan="3"><input type="radio" name="E01APCREL" value="5"
					<%if (prd.getE01APCREL().equals("5")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
				<b>Si</b> <input type="radio" name="E01APCREL" value="N"
					<%if (prd.getE01APCREL().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
				<b>No</b></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Producto Prestamo Contratado :</div>
				</td>
				<td><input type="text" name="E01APAPRD" size="3" maxlength="4"
					value="<%= prd.getE01APAPRD() %>" readonly> 
					<%if(!isReadOnly){%><a
					href="javascript:GetProduct('E01APAPRD','10',document.forms[0].E01APCBNK.value,'','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
				<td>
				<div align="right">Monto Maximo Contratado :</div>
				</td>
				<td><input type="text" name="E01APAOAM" size="18"
					maxlength="16" value="<%= prd.getE01APAOAM() %>" <%if(isReadOnly) out.print("readonly");%>></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Producto Prestamo Ocasional :</div>
				</td>
				<td><input type="text" name="E01APAUC0" size="3" maxlength="4"
					value="<%= prd.getE01APAUC0() %>" readonly>
					<%if(!isReadOnly){%> <a
					href="javascript:GetProduct('E01APAUC0','10',document.forms[0].E01APCBNK.value,'','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
				<td>
				<div align="right">Dias de Vigencia(Prestamo Ocasional) :</div>
				</td>
				<td><input type="text" name="E01APAFC1" size="3" maxlength="4"
					value="<%= prd.getE01APAFC1() %>" <%if(isReadOnly) out.print("readonly");%>> 
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Tipo de Amortizacion :</div>
				</td>
				<td><input type="text" name="E01APAPCR" size="3" maxlength="1"
					value="<%= prd.getE01APAPCR() %>" readonly>
					<%if(!isReadOnly){%> <a
					href="javascript:GetCode('E01APAPCR','STATIC_typ_amortization.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
				<td>
				<div align="right">Tipo de Pago :</div>
				</td>
				<td><select name="E01APAPIF" <%if(isReadOnly) out.print("disabled");%>>
					<option value="" <%if (!prd.getE01APAPIF().equals("F") && !prd.getE01APAPIF().equals("%")) { out.print("selected"); }%>>N/A</option>
					<option value="F" <%if (prd.getE01APAPIF().equals("F")) { out.print("selected"); }%>>Monto Fijo</option>
					<option value="%" <%if (prd.getE01APAPIF().equals("%")) { out.print("selected"); }%>>% del principal</option>
				</select></td>
				
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Moneda del Pago :</div>
				</td>
				<td><input type="text" name="E01APARCY" size="3" maxlength="3"
					value="<%= prd.getE01APARCY() %>" readonly>
					<%if(!isReadOnly){%> <a
					href="javascript:GetCurrency('E01APARCY','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
					<%} %></td>
				<td>
				<div align="right">Monto ó % a Amortizar :</div>
				</td>
				<td><input type="text" name="E01APAPMT" size="18"
					maxlength="16" value="<%= prd.getE01APAPMT() %>" <%if(isReadOnly) out.print("readonly");%>></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Incluye Interes en Pago :</div>
				</td>
				<td><input type="radio" name="E01APAIIP" value="Y"
					<%if (prd.getE01APAIIP().equals("Y")) out.print("checked"); %><%if(isReadOnly) out.print("disabled");%>>
				Si <input type="radio" name="E01APAIIP" value="N"
					<%if (prd.getE01APAIIP().equals("N")) out.print("checked"); %><%if(isReadOnly) out.print("disabled");%>>
				No</td>
				<td>
				<div align="right">Ciclo de Revision Tasa :</div>
				</td>
				<td colspan="3"><input type="text" name="E01APARPD" size="4"
					maxlength="3" value="<%= prd.getE01APARPD()%>"> <select
					name="E01APARFL" <%if(isReadOnly) out.print("disabled");%>>
					<option value=""
						<%if (prd.getE01APARFL().equals("")) { out.print("selected"); }%>>N/A</option>
					<option value="D"
						<%if (prd.getE01APARFL().equals("D")) { out.print("selected"); }%>>Diario</option>
					<option value="M"
						<%if (prd.getE01APARFL().equals("M")) { out.print("selected"); }%>>Mes</option>
					<option value="Y"
						<%if (prd.getE01APARFL().equals("Y"))   { out.print("selected"); }%>>Anual</option>
				</select></td>
<!-- 				<td> -->
<!-- 				<div align="right">Transferir en Multiplos de :</div> -->
<!-- 				</td> -->
<!-- 				<td><input type="text" name="E01APAMUL" size="18" -->
<%-- 					maxlength="16" value="<%= prd.getE01APAMUL() %>"></td> --%>
			</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Balance Minimo en Cuenta :</div>
				</td>
				<td><input type="text" name="E01APAMIN" size="18"
					maxlength="16" value="<%= prd.getE01APAMIN() %>" <%if(isReadOnly) out.print("readonly");%>></td>
				<td>
				<div align="right">Tipo de Cobertura :</div>
				</td>
				<td><select name="E01APAGLT" <%if(isReadOnly) out.print("disabled");%>>
					<option value="1"
						<%if (prd.getE01APAGLT().equals("1")) { out.print("selected"); }%>>Linea</option>
					<option value="2"
						<%if (prd.getE01APAGLT().equals("2")) { out.print("selected"); }%>>Cierre
					Dia</option>
				</select></td>
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
