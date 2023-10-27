<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@page import="com.datapro.constants.Entities"%> 
<html>
<head>
<title>Mantenimiento Tablas de Registros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.EFE009501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

</head>

<%
  boolean readOnly = false;
  boolean maintenance = false;
%> 
		  
<%
  // Determina si es solo lectura
  if (request.getParameter("readOnly") != null ){
	if (request.getParameter("readOnly").toLowerCase().equals("true")){
	  readOnly=true;
	} else {
	  readOnly=false;
	}
  }
%>
<body>
<%
  if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
  }
  if (!userPO.getPurpose().equals("NEW")) {
	maintenance = true;
	out.println("<SCRIPT> initMenu(); </SCRIPT>");
  }
%>

<h3 align="center">
<%if (readOnly){ %>
  CONSULTA TABLAS DE REGISTROS
<%} else if (maintenance){ %>
  MANTENIMIENTO TABLAS DE REGISTROS
<%} else { %>
  NUEVA TABLA DE REGISTROS
<%} %>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="FEBRK_maintenance.jsp, EFE0095"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0095" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
	<input type=HIDDEN name="E01FEBATY" id="E01FEBATY" value="<%= cnvObj.getE01FEBATY().trim()%>">
	<input type=HIDDEN name="E01UBK" id="E01UBK" value="<%= currUser.getE01UBK().trim()%>">
  
	<% int row = 0;%>
 
	<table  class="tableinfo">
	<tr bordercolor="#FFFFFF"> 
		<td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<td nowrap width="10%" align="right"> Tipo Registro : </td>
			<td nowrap width="10%" align="left">
				<input type="text" readonly name="rectyp" size="2" maxlength="1" value="<%= userPO.getOption().trim()%>" readonly>
			</td>
			<td nowrap width="10%" align="right"> Descripcion : 
				</td>
			<td nowrap width="50%"align="left">
			<% 
			  if (userPO.getOption().equals("A")) out.print("SEGURO AUTOS");
			  else if (userPO.getOption().equals("C")) out.print("CREDIAHORROS");
			  else if (userPO.getOption().equals("T")) out.print("RECOLECTOR DE IMPUESTOS");
			  else if (userPO.getOption().equals("V")) out.print("AGENTES DE BOLSA");
			  else if (userPO.getOption().equals("G")) out.print("ADMINISTRACION DE FONDOS");
			  else if (userPO.getOption().equals("I")) out.print("SEGUROS");
			  else if (userPO.getOption().equals("L")) out.print("ENTIDADES AVALADORAS");
			  else if (userPO.getOption().equals("E")) out.print("ENTIDADES DE GOBIERNO");
			  else if (userPO.getOption().equals("F")) out.print("ENTIDADES DE SUBSIDIO");
			  else if (userPO.getOption().equals("K")) out.print("ENTIDADES DE VENTA O TITULARIZACION");
			  else if (userPO.getOption().equals("R")) out.print("ENTIDADES DE RECAUDO");
			  else if (userPO.getOption().equals("S")) out.print("VENDEDORES - COMISIONISTAS");
			  else if (userPO.getOption().equals("D")) out.print("AGENTES - REPRESENTANTES COMEX");
			  else if (userPO.getOption().equals("N")) out.print("NOTARIAS");
			  else if (userPO.getOption().equals("P")) out.print("PARTICIPANTES POOL CONTRATOS");
			  else if (userPO.getOption().equals("O")) out.print("INSPECTORES DE OBRA"); 
			  else if (userPO.getOption().equals("X")) out.print("TIENDA VIRTUAL"); 
			  else if (userPO.getOption().equals("Y")) out.print("TARJETAS ALIANZA");
			  else if (userPO.getOption().equals("B")) out.print("ENTIDADES DE EMBARGO");
			%>
			</td>
			</tr>
		</table>
		</td>
	</tr>
	</table>
  
	<h4>Informacion Basica </h4>
	<table  class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Codigo :</div></td>
						<td width="30%" > 
							<% if ( !userPO.getPurpose().equals("NEW") ) { %>
								<eibsinput:text name="cnvObj" property="E01FEBNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER%>" readonly="true"/>
							<% } else { %>
								<eibsinput:text name="cnvObj" property="E01FEBNUM"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER%>" readonly="false"/>
							<% } %>
						</td>
						<td width="20%" > 
							<div align="right">Cliente :</div>
						</td>
						<td width="30%" > 
							<eibsinput:help name="cnvObj" property="E01FEBCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" fn_param_one="E01FEBCUN" fn_param_two="E01FEBNM1" fn_param_three="E01FEBBID"   readonly="<%=readOnly %>"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Nombre :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBNM1" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="20%" > <div align="right">Identificacion :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBBID" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" readonly="<%=readOnly %>"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Direccion :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBNM2" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="20%" > <div align="right"> Nombre Corto :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBSNM" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="<%=readOnly %>"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right"> </div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBNM3" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="20%" > <div align="right">Estado :</div></td>
						<td width="30%" > 
							<eibsinput:cnofc name="cnvObj" property="E01FEBSTE" required="false" flag="27" fn_code="E01FEBSTE" fn_description="" readonly="<%=readOnly %>"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Ciudad :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBCTY" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="20%" > <div align="right">Area :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBZIP" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ZIPCODE%>" readonly="<%=readOnly %>"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Nombre Contacto :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBNMC" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="20%" > <div align="right">Telefono :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBPHC" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="<%=readOnly %>"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Email :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBIA1" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="20%" > <div align="right">Fax :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBFAC" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="<%=readOnly %>"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Sitio Web :</div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBIA2" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="20%" > <div align="right"></div></td>
						<td width="30%" > </td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Producto	</h4>
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
				
					<% if (userPO.getOption().equals("I") ) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Compañia :</div></td>
						<td width="30%" > 
							<eibsinput:cnofc name="cnvObj" property="E01FEBCIA" required="false" flag="IT" fn_code="E01FEBCIA" fn_description="E01DSCCIA" readonly="<%=readOnly%>" size="4" maxlength="4"/>
							<eibsinput:text property="E01DSCCIA" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="false" size="35" maxlength="35" readonly="true"/>
						</td>
						<td width="20%" > <div align="right"></div></td>
						<td width="30%" > </td>
					</tr>
					
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%"> <div align="right">Fecha Inicio :</div></td>
						<td width="30%"> 
							<eibsinput:date name="cnvObj" fn_year="E01FEBFIY" fn_month="E01FEBFIM" fn_day="E01FEBFID" />
						</td>
						<td width="20%"> <div align="right">Fecha Vencimiento :</div></td>
						<td width="30%"> 
							<eibsinput:date name="cnvObj" fn_year="E01FEBFVY" fn_month="E01FEBFVM" fn_day="E01FEBFVD" />
						</td>
					</tr>
					<% } %>   
					
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right"> Descripcion : </div></td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBNM4" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="20%" > 
						<% if (userPO.getOption().equals("I") ) { %>
							<div align="right"> Poliza General :</div>
						<% } else { %>
							<div align="right"> Referencia :</div>
						<% } %>          
						</td>
						<td width="30%" > 
							<eibsinput:text property="E01FEBPLZ" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CARD_NUMBER%>" readonly="<%=readOnly %>"/>
						</td>
					</tr>
					
					<!-- SEGUROS --> 
					<% if (userPO.getOption().equals("I") ) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Tipo de Seguro :</div></td>
						<td width="30%" > 
							<select name="E01FEBITY" <%=readOnly?"disabled":""%>>
							<option value="1" <% if (cnvObj.getE01FEBITY().equals("1")) out.print("selected"); %>>Vida</option>
							<option value="2" <% if (cnvObj.getE01FEBITY().equals("2")) out.print("selected"); %>>Incendio</option>
							<option value="3" <% if (cnvObj.getE01FEBITY().equals("3")) out.print("selected"); %>>Vehiculos</option>
							<option value="4" <% if (cnvObj.getE01FEBITY().equals("4")) out.print("selected"); %>>Desempleo</option>
							<option value="5" <% if (cnvObj.getE01FEBITY().equals("5")) out.print("selected"); %>>Otros</option>
							</select>
						</td>
						<td width="20%" > <div align="right">Seguro Obligatorio :</div></td>
						<td width="30%" > 
							<input type="radio" name="E01FEBOTI" value="Y" <%if(!cnvObj.getE01FEBOTI().equals("N")) out.print("checked");%>>S&iacute; 
							<input type="radio" name="E01FEBOTI" value="N" <%if(cnvObj.getE01FEBOTI().equals("N")) out.print("checked");%>>No 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Frecuencia Pago a la Compañia :</div></td>
						<td width="30%"> 
							<select name="E01FEBFL2" <%=readOnly?"disabled":""%>>
							<option value="M" <% if (cnvObj.getE01FEBFL2().equals("M")) out.print("selected"); %>>Mensual</option>
							<option value="B" <% if (cnvObj.getE01FEBFL2().equals("B")) out.print("selected"); %>>Bimensual</option>
							<option value="T" <% if (cnvObj.getE01FEBFL2().equals("T")) out.print("selected"); %>>Trimestral</option>
							<option value="S" <% if (cnvObj.getE01FEBFL2().equals("S")) out.print("selected"); %>>Semestral</option>
							<option value="A" <% if (cnvObj.getE01FEBFL2().equals("A")) out.print("selected"); %>>Anual</option>
							</select>
						</td>
						<td width="20%" ><div align="right">Dia de Pago :</div></td>
						<td width="30%" >
							<eibsinput:text name="cnvObj" property="E01FEBDAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="<%=readOnly %>"/>
							&nbsp;
							<eibsinput:date name="cnvObj" fn_year="E01FEBNPY" fn_month="E01FEBNPM" fn_day="E01FEBNPD" readonly="true" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" ><div align="right">Exige Garant&iacute;a Hipotecaria :</div></td>
						<td width="30%" >
							<input type="radio" name="E01FEBFL1" value="Y" <%if(!cnvObj.getE01FEBFL1().equals("N")) out.print("checked");%>>S&iacute; 
							<input type="radio" name="E01FEBFL1" value="N" <%if(cnvObj.getE01FEBFL1().equals("N")) out.print("checked");%>>No 
						</td>
						<td width="20%" ><div align="right"></div></td>
						<td width="30%" >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > 
							<div align="right" >Tipo Intermediacion :</div>
						</td>
						<td width="30%" >
							<select name="E01FEBFCT" <%=readOnly?"disabled":""%> onchange="intermType(this.value)">
								<option value="F" <% if (!cnvObj.getE01FEBFCT().equals("1")) out.print("selected"); %>>Valor Fijo</option>
								<option value="1" <% if (cnvObj.getE01FEBFCT().equals("1")) out.print("selected"); %>>Porcentaje</option>
							</select>
						</td>
						<td width="20%" >
							<div align="right" id="intermLabel">Valor :</div>
						</td>
						<td width="30%" >
							<div align="right" id="intermFij">
								<eibsinput:text name="cnvObj" property="E01FEBVAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>" readonly="<%=readOnly %>"/>
							</div>
							<div align="right" id="intermPor">
								<eibsinput:text name="cnvObj" property="E01FEBMAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="<%=readOnly %>"/>
							</div>
						</td>
					</tr>
					<% } %>   
					
					<!-- DEFERENTE SEGUROS --> 
					<% if (!userPO.getOption().equals("I") ) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" >
							<div align="right">
					<%   if (userPO.getOption().equals("K") || userPO.getOption().equals("R")) { %>
								Valor Intermediacion :
					<%   } else { %>
								Valor Deduccion :
					<%   } %>
							</div>
						</td>
						<td width="30%" >
							<eibsinput:text property="E01FEBVAL" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="20%" > 
							<div align="right"> 
					<%   if (userPO.getOption().equals("K") || userPO.getOption().equals("R")) { %>
								Tipo Intermediacion :
					<%   } else { %>
								Tipo Deduccion :
					<%   } %>                
							</div>
						</td>
						<td width="30%" >
					<%   if (userPO.getOption().equals("K")) { %>
							<select name="E01FEBFCT" <%=readOnly?"disabled":""%>>
							<option value="F" <% if (cnvObj.getE01FEBFCT().equals("F")) out.print("selected"); %>>Valor Fijo</option>
							<option value="1" <% if (cnvObj.getE01FEBFCT().equals("1")) out.print("selected"); %>>% Sobre monto Recuperado</option>
							</select>
					<%   } else if (userPO.getOption().equals("R")) { %>
							<select name="E01FEBFCT" <%=readOnly?"disabled":""%>>
							<option value=""	<% if (!cnvObj.getE01FEBFCT().equals("R")) out.print("selected"); %>> </option>
							<option value="R" <% if (cnvObj.getE01FEBFCT().equals("R"))  out.print("selected"); %>>Monto por Registro</option>
							</select>
					<%   } else if (userPO.getOption().equals("V") || userPO.getOption().equals("S")) { %>
							<select name="E01FEBFCT" <%=readOnly?"disabled":""%>>
							<option value="" <% if (!(cnvObj.getE01FEBFCT().equals("P") || cnvObj.getE01FEBWTH().equals("F"))) out.print("selected"); %>> </option>
							<option value="P" <% if (cnvObj.getE01FEBFCT().equals("P")) out.print("selected"); %>>Porcentaje %</option>
							<option value="F" <% if (cnvObj.getE01FEBFCT().equals("F")) out.print("selected"); %>>Valor Fijo</option>
							</select>
					<%   } else { %>          
							<select name="E01FEBFCT" <%=readOnly?"disabled":""%>>
							<option value="F" <% if (cnvObj.getE01FEBFCT().equals("F")) out.print("selected"); %>>Valor Fijo</option>
							<option value="1" <% if (cnvObj.getE01FEBFCT().equals("1")) out.print("selected"); %>>% Sobre monto Original</option>
							<option value="2" <% if (cnvObj.getE01FEBFCT().equals("2")) out.print("selected"); %>>% Sobre saldo Principal</option>
							<option value="3" <% if (cnvObj.getE01FEBFCT().equals("3")) out.print("selected"); %>>% Sobre valor Cuota</option>
							</select>
					<%   } %>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Cobro de IVA :</div></td>
						<td width="30%" > 
							<select name="E01FEBWTH" <%=readOnly?"disabled":""%>>
					<%   if (userPO.getOption().equals("R")) { %>   
							<option value="Y" <% if (cnvObj.getE01FEBWTH().equals("Y")) out.print("selected"); %>>Si</option>
							<option value="N" <% if (cnvObj.getE01FEBWTH().equals("N")) out.print("selected"); %>>No</option>
					<%   } else { %>   
							<option value="W" <% if (!(cnvObj.getE01FEBWTH().equals("F") || cnvObj.getE01FEBWTH().equals("B") || cnvObj.getE01FEBWTH().equals("N"))) out.print("selected"); %>>Retencion</option>
							<option value="F" <% if (cnvObj.getE01FEBWTH().equals("F")) out.print("selected"); %>>Forma 1099</option>
							<option value="B" <% if (cnvObj.getE01FEBWTH().equals("B")) out.print("selected"); %>>Ambos</option>
							<option value="N" <% if (cnvObj.getE01FEBWTH().equals("N")) out.print("selected"); %>>Ninguno</option>
					<%   } %>   
							</select>
						</td>
					<%   if (userPO.getOption().equals("K") || userPO.getOption().equals("R") ) { %>   
							<td width="20%" ></td>
							<td width="30%" ></td>
							<td width="20%" ></td> 
					<%   } else {%>
						<td width="20%" > 
					<%     if (userPO.getOption().equals("F")) {%>    
							<div align="right">Tasa Subsidio:</div>
					<%     } else { %>
							<div align="right">Tasa Activa:</div>
					<%     } %>
						</td>
						<td width="30%" > 
							<eibsinput:text name="cnvObj" property="E01FEBRTA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="<%=readOnly %>"/>
						</td>
					<%   } %>
					</tr>
					<%   if (!userPO.getOption().equals("K")) { %>   
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Via de Pago :</div></td>
						<td width="30%" > 
							<select name="E01FEBPVI" <%=readOnly?"disabled":""%>>
					<%     if (userPO.getOption().equals("R")) { %>   
							<option value="1" <% if (cnvObj.getE01FEBPVI().equals("1")) out.print("selected"); %>>Asobancaria 98</option>
							<option value="2" <% if (cnvObj.getE01FEBPVI().equals("2")) out.print("selected"); %>>Asobancaria 2001</option>
					<%     } else { %>
							<option value="A" <% if (cnvObj.getE01FEBPVI().equals("A")) out.print("selected"); %>>Cuenta Detalle</option>
							<option value="G" <% if (cnvObj.getE01FEBPVI().equals("G")) out.print("selected"); %>>Cuenta Contable</option>
							<option value="F" <% if (cnvObj.getE01FEBPVI().equals("F")) out.print("selected"); %>>Transfer FED</option>
							<option value="T" <% if (cnvObj.getE01FEBPVI().equals("T")) out.print("selected"); %>>Transfer Telex</option>
							<option value="1" <% if (cnvObj.getE01FEBPVI().equals("1")) out.print("selected"); %>>Swift MT-100</option>
							<option value="2" <% if (cnvObj.getE01FEBPVI().equals("2")) out.print("selected"); %>>Swift MT-200</option>
							<option value=""	<% if (cnvObj.getE01FEBPVI().equals("")) out.print("selected");  %>>Ninguno</option>
					<%     } %>
							</select>
						</td>
					<%     if (userPO.getOption().equals("R")) { %>    
						<td width="20%" > </td>
						<td width="30%" > </td>
					<%     } else if (userPO.getOption().equals("F")) { %>
						<td width="20%" > <div align="right">Dias en Mora para Perdida de Subsidio :</div></td>
						<td width="30%" > 
							<eibsinput:text name="cnvObj" property="E01FEBDAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS%>" readonly="<%=readOnly %>"/>
						</td>
					<%     } else { %>    
						<td width="20%" > <div align="right">Tasa Pasiva :</div></td>
						<td width="30%" > 
							<eibsinput:text name="cnvObj" property="E01FEBRTL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="<%=readOnly %>"/>
						</td>
					<%     } %>
					</tr>            
					<%   } %>
					<% } %>
					
					<!--  --> 
					<% if (!userPO.getOption().equals("K") && !userPO.getOption().equals("R") && !userPO.getOption().equals("I")){%>   
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<%   if(!userPO.getOption().equals("F")){%>    
						<td width="20%" ><div align="right">% Intermediacion :</div></td>
						<td width="30%" >
							<eibsinput:text name="cnvObj" property="E01FEBMAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="<%=readOnly %>"/>
						</td>
						<%   } else if(userPO.getOption().equals("F")){ %>       
						<td width="20%" >
						<div align="right">Tabla Factores de Tasa :</div>
						</td>
						<td width="30%" >
							<input type="text" name="E01FEBTBR" size="3" maxlength="2" value="<%=cnvObj.getE01FEBTBR().trim()%>" >  
							<a href="javascript:GetLimit('E01FEBTBR',document.forms[0].E01UBK.value,'')">          
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0">
							</a>
						</td>              
						<%   } %>            
						<td width="20%" ><div align="right">Canal Venta :</div></td>
						<td width="30%" >
							<eibsinput:cnofc name="cnvObj" property="E01FEBSCH" required="false" flag="62" fn_code="E01FEBSCH" fn_description="" readonly="<%=readOnly %>"/>
						</td>
					</tr>
					<% } %>
					
					<!-- ENTIDADES AVALADORAS -->         
					<% if(userPO.getOption().equals("L")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">Dias Maximo para aplicar el Pago :</div></td>
						<td width="30%" > 
							<eibsinput:text name="cnvObj" property="E01FEBVIG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS%>" readonly="<%=readOnly %>"/>
						</td>
						<td width="20%" > </td>
						<td width="30%" > </td>
					</tr>           
					<% } %>
					
					<!-- ENTIDADES DE SUBSIDIO -->
					<% if (userPO.getOption().equals("F")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="20%" > <div align="right">T&eacute;rmino Expiraci&oacute;n :</div></td>
						<td width="30%" > 
							<eibsinput:text name="cnvObj" property="E01FEBVIG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="<%=readOnly %>"/>
							<select name="E01FEBFL4" onchange="setRecalculate()" >
							<OPTION value="D" <% if (cnvObj.getE01FEBFL4().equals("D")) out.print("selected"); %>>D&iacute;a(s)</OPTION>
							<OPTION value="M" <% if (cnvObj.getE01FEBFL4().equals("M")) out.print("selected"); %>>Mes(es)</OPTION>
							<OPTION value="Y" <% if ( cnvObj.getE01FEBFL4().equals("Y") || !(cnvObj.getE01FEBFL4().equals("D") || cnvObj.getE01FEBFL4().equals("M"))) out.print("selected"); %>>A&ntilde;o(s)</OPTION>
							</select>
						</td>
						<td width="20%" > </td>
						<td width="30%" > </td>
					</tr>           
					<% } %>
					
					<% if (!userPO.getOption().equals("K") && !userPO.getOption().equals("R")) { %>
					<tr>
						<td nowrap width="25%"> <div align="right">Código de Comisi&oacute;n :</div></td>
						<td nowrap width="25%">
							<input type="text" name="E01FEBUC1" maxlength="4" size="5" value="<%= cnvObj.getE01FEBUC1().trim()%>" >
							<a href="javascript:GetCommDef('E01FEBUC1','D01FEBUC1')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
							<input type="text" name="D01FEBUC1" maxlength="30" size="30" value="<%= cnvObj.getD01FEBUC1().trim()%>" readonly >
						</td>
						<td width="20%" ><div align="right"></div></td>
						<td width="30%" ></td>
					</tr>
					<% } %>
					
				</table>
			</td>
		</tr>
	</table>
 
	<h4>Contabilidad </h4>
	<table  class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
			<table cellspacing=2 cellpadding=2 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap></td>
				<td nowrap align="CENTER"><b>Banco</b></td>
				<td nowrap align="CENTER"><b>Suc.</b></td>
				<td nowrap align="CENTER"><b>Mda.</b></td>
				<td nowrap align="CENTER"><b>C.Contable</b></td>
				<td nowrap align="CENTER"><b>Referencia</b></td>
				<td nowrap align="CENTER"><b>C.Costo</b></td>
				</tr>                     
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<% if (userPO.getOption().equals("K")) { %>
				<td nowrap> <div align="right">TIT. Cta. x Pagar / VTA. Perdida :</div></td>
				<% } else if (userPO.getOption().equals("R")){ %>
				<td nowrap> <div align="right">Credito Recaudos No Aplicados :</div></td>
				<% } else { %> 
				<td nowrap> <div align="right">Cuenta Acreditar :</div></td>
				<% } %>
				<td nowrap align="center">                
					<input type="text" name="E01FEBCBK" size="2" maxlength="2" value="<%= cnvObj.getE01FEBCBK().trim()%>">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBCBR" size="4" maxlength="4" value="<%= cnvObj.getE01FEBCBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBCCY" size="3" maxlength="3" value="<%= cnvObj.getE01FEBCCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')">              
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBCGL" size="17" maxlength="16"  value="<%= cnvObj.getE01FEBCGL().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBCBK.value,document.forms[0].E01FEBCCY.value,'','','')">        
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBCAC" size="13" maxlength="12"  value="<%= cnvObj.getE01FEBCAC().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','RT')">        
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBCCN" size="10" maxlength="8"  value="<%= cnvObj.getE01FEBCCN().trim()%>" class="context-menu-help" onmousedown="init(costcenterHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')">        
				</td>
				</tr>  
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<% if (userPO.getOption().equals("K")) { %>
				<td nowrap > <div align="right">Cuenta por Cobrar :</div></td>
				<% } else if (userPO.getOption().equals("R")){ %>
				<td nowrap > <div align="right">Cuenta Puente Recaudos :</div></td>
				<% } else { %>   
				<td nowrap > <div align="right">Cuenta de Pago :</div></td>
				<%} %>
				<td nowrap align="center">                
					<input type="text" name="E01FEBRBK" size="2" maxlength="2" value="<%= cnvObj.getE01FEBRBK().trim()%>">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBRBR" size="4" maxlength="4" value="<%= cnvObj.getE01FEBRBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBRBK.value,'','','','')">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBRCY" size="3" maxlength="3" value="<%= cnvObj.getE01FEBRCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBRBK.value,'','','','')">              
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBRGL" size="17" maxlength="16"  value="<%= cnvObj.getE01FEBRGL().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBRBK.value,document.forms[0].E01FEBRCY.value,'','','')">        
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBRAC" size="13" maxlength="12"  value="<%= cnvObj.getE01FEBRAC().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBRBK.value,'','','','RM')">        
				</td>
				<td nowrap align="center"></td>
				</tr>
				<% if (!userPO.getOption().equals("K")) {%>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<%   if (!userPO.getOption().equals("R")) {%>
				<td nowrap > <div align="right">Cuenta por Cobrar :</div></td>
				<%   } else { %>
				<td nowrap > <div align="right">Recaudos Diarios Totales :</div></td>
				<%   } %>
				<td nowrap align="center">                
					<input type="text" name="E01FEBXBK" size="2" maxlength="2" value="<%= cnvObj.getE01FEBXBK().trim()%>">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBXBR" size="4" maxlength="4" value="<%= cnvObj.getE01FEBXBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBXBK.value,'','','','')">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBXCY" size="3" maxlength="3" value="<%= cnvObj.getE01FEBXCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBXBK.value,'','','','')">              
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBXGL" size="17" maxlength="16"  value="<%= cnvObj.getE01FEBXGL().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBXBK.value,document.forms[0].E01FEBXCY.value,'','','')">        
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBXAC" size="13" maxlength="12"  value="<%= cnvObj.getE01FEBXAC().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBXBK.value,'','','','RT')">        
				</td>
				<td nowrap align="center"></td>
				</tr>
				<% }else if(userPO.getOption().equals("K")){%>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap > <div align="right">TIT. Cta. Prestamo / VTA. Utilidad :</div></td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBXBK" size="2" maxlength="2" value="<%= cnvObj.getE01FEBXBK().trim()%>">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBXBR" size="4" maxlength="4" value="<%= cnvObj.getE01FEBXBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBXBK.value,'','','','')">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBXCY" size="3" maxlength="3" value="<%= cnvObj.getE01FEBXCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBXBK.value,'','','','')">              
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBXGL" size="17" maxlength="16"  value="<%= cnvObj.getE01FEBXGL().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBXBK.value,document.forms[0].E01FEBXCY.value,'','','')">        
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBXAC" size="13" maxlength="12"  value="<%= cnvObj.getE01FEBXAC().trim()%>" disabled="disabled">        
				</td>
				<td nowrap align="center"></td>
				</tr>
				<% } %>
				<% if( currUser.getE01INT().equals("18")){%>   
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap > <div align="right">Comision Fogape :</div></td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBGBK" size="2" maxlength="2" value="<%= cnvObj.getE01FEBGBK().trim()%>">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBGBR" size="4" maxlength="4" value="<%= cnvObj.getE01FEBGBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBGBK.value,'','','','')">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBGCY" size="3" maxlength="3" value="<%= cnvObj.getE01FEBGCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBGBK.value,'','','','')">              
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBGGL" size="17" maxlength="16"  value="<%= cnvObj.getE01FEBGGL().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBGBK.value,document.forms[0].E01FEBGCY.value,'','','')">        
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBGAC" size="13" maxlength="12"  value="<%= cnvObj.getE01FEBGAC().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBGBK.value,'','','','RT')">        
				</td>
				<td nowrap align="center"></td>
				</tr>   
				<% } %>         
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap > <div align="right">Cuenta Intermediacion :</div></td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBBN1" size="2" maxlength="2" value="<%= cnvObj.getE01FEBBN1().trim()%>">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBBR1" size="4" maxlength="4" value="<%= cnvObj.getE01FEBBR1().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBBN1.value,'','','','')">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBCC1" size="3" maxlength="3" value="<%= cnvObj.getE01FEBCC1().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBBN1.value,'','','','')">              
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBGL1" size="17" maxlength="16"  value="<%= cnvObj.getE01FEBGL1().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBBN1.value,document.forms[0].E01FEBCC1.value,'','','')">        
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBAC1" size="13" maxlength="12"  value="<%= cnvObj.getE01FEBAC1().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBBN1.value,'','','','RT')">        
				</td>
				<td nowrap align="center"></td>
				</tr>                 
				<% if (userPO.getOption().equals("K")){%>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap > <div align="right"> Cuenta Credito Seguro Titularizado:</div></td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBBN2" size="2" maxlength="2" value="<%= cnvObj.getE01FEBBN2().trim()%>">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBBR2" size="4" maxlength="4" value="<%= cnvObj.getE01FEBBR2().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBBN2.value,'','','','')">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBCC2" size="3" maxlength="3" value="<%= cnvObj.getE01FEBCC2().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBBN2.value,'','','','')">              
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBGL2" size="17" maxlength="16"  value="<%= cnvObj.getE01FEBGL2().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBBN2.value,document.forms[0].E01FEBCC2.value,'','','')">        
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBAC2" size="13" maxlength="12"  value="<%= cnvObj.getE01FEBAC2().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBBN2.value,'','','','RT')">        
				</td>
				<td nowrap align="center"></td>
				</tr>                 
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap > <div align="right">Cuenta x Pagar Seguro Titularizado:</div></td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBBN3" size="2" maxlength="2" value="<%= cnvObj.getE01FEBBN3().trim()%>">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBBR3" size="4" maxlength="4" value="<%= cnvObj.getE01FEBBR3().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBBN3.value,'','','','')">             
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBCC3" size="3" maxlength="3" value="<%= cnvObj.getE01FEBCC3().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBBN3.value,'','','','')">              
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBGL3" size="17" maxlength="16"  value="<%= cnvObj.getE01FEBGL3().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBBN3.value,document.forms[0].E01FEBCC3.value,'','','')">        
				</td>
				<td nowrap align="center">                
					<input type="text" name="E01FEBAC3" size="13" maxlength="12"  value="<%= cnvObj.getE01FEBAC3().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBBN3.value,'','','','RT')">        
				</td>
				<td nowrap align="center"></td>
				</tr>                 
				<% } %>
			</table>
			</td>
		</tr>
	</table>

	<% if (readOnly){ %>
	<h4>Saldos </h4>
	<table  class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
			<table cellspacing=2 cellpadding=2 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap > <div align="right">Monto Pago Anual :</div></td>
				<td nowrap > 
					<eibsinput:text name="cnvObj" property="E01FEBPYT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false"/>
				</td>
				<td nowrap > <div align="right">Retenido Anual :</div></td>
				<td nowrap colspan=2> 
					<eibsinput:text name="cnvObj" property="E01FEBWYT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false"/>
				</td>
				</tr>                 
			</table>
			</td>
		</tr>
	</table>
	<% } %>  

	<% if  (!readOnly) { %>
	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	</div>
	<% } %>  

</form>

<script type="text/javascript">
intermType(getElement("E01FEBFCT").value,true);

function intermType(val,firstTime){
	if(isValidObject(getElement("intermLabel"))){
		if (val === "1"){
			getElement("intermLabel").innerHTML = 'Porcentaje : ';
			getElement("intermFij").style.display = 'none';
			getElement("intermPor").style.display = 'table-cell';
			if (firstTime != true) getElement("E01FEBVAL").value = "0.000000" ;
		} else {
			getElement("intermLabel").innerHTML = 'Valor : ';
			getElement("intermFij").style.display = 'table-cell';
			getElement("intermPor").style.display = 'none';
			if (firstTime != true) getElement("E01FEBMAR").value = "0.000000" ;
		}
	}
}

</script>

</body>
</HTML>
