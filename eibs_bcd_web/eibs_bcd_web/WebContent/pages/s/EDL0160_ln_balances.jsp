<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import = "datapro.eibs.master.Util" %>

<html>
<head> 
<title>Consulta de Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="inqLoans" class="datapro.eibs.beans.EDL016001Message"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<%if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
	builtNewMenu(ln_i_1_opt);
<% } else if(inqLoans.getE01DEACLF().equals("I")) { %>
	// builtNewMenu(cuplus_inq_opt);
		builtNewMenu(ln_i_2_opt);
<% } else  { %>
	builtNewMenu(ln_i_2_opt);
<% } %>

</SCRIPT> 
</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
		 out.println("<SCRIPT Language=\"Javascript\">");
		 out.println("       showErrors()");
		 out.println("</SCRIPT>");
		 }
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<%
	 double totrrf = 0;
	 totrrf = inqLoans.getBigDecimalE01TOTRRF().doubleValue();
%>

  
<div align="center"></div>
<h3 align="center"> Consulta de Saldos - <%=inqLoans.getE01DSCPRO()%> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_balances,EDL0160"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0160" >
	<input type=HIDDEN name="SCREEN" value="1">
	
	<table border="0" cellspacing="0" cellpadding="0" width="100%" style="visibility: <%= inqLoans.getE01PENDAP().equals("") ? "hidden" : "visible" %>">
		<tr>
			<td align="right" valign="top" width="85%" style="color:red;font-size:12;"><b><%=inqLoans.getE01PENDAP()%></b></td>
			<td width="5%"><h4>&nbsp;</h4></td>
		</tr>
	</table>
	
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="14%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="9%" > 
							<div align="left"> 
								<input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
							</div>
						</td>
						<td nowrap width="12%" ><div align="right"><b>Nombre :</b></div></td>
						<td nowrap > 
							<div align="left"> 
								<input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
							</div>
						</td>
						<td nowrap ><div align="right"><b>Producto : </b></div></td>
						<td nowrap >
							<b> 
								<input type="text" name="E02PTYP" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
								<input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
							</b>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="14%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="9%"> 
							<div align="left"> 
								<input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="12%"><div align="right"><b>Oficial :</b></div></td>
						<td nowrap width="33%"> 
							<div align="left"> 
								<input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
							</div>
						</td>
						<td nowrap width="11%"><div align="right"><b>Moneda :</b></div></td>
						<td nowrap width="21%"> 
							<div align="left"> 
								<input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
								<b>Nota Interna :</b>
								<input type="text" name="E01NOTINT" size="3" maxlength="3" value="<%= inqLoans.getE01NOTINT().trim()%>" readonly>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<br>
	<table class=tbenter>
		<tr > 
			<td nowrap> 
			<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
				<h4>Sumario Moneda Reajustable </h4>
			<% } else { %>
			<h4>Sumario</h4>
				<% } %>   
			</td>
			<td nowrap align=left> 
				<b>CREDITO :<font color="#ff6600"> 
				<% if (inqLoans.getE01COLATR().trim().equals("") )
				   out.print("SIN GARANTIA");
				   else
				   out.print(inqLoans.getE01COLATR());
				%></font>
				</b>
			</td>
			<td nowrap align=left> 
				<b>CONDICION CREDITICIA :</b>
				<b><font color="#ff6600"><%= inqLoans.getE01CONDSC().trim()%></font></b>
			</td>
			<td nowrap align=left> 
				<b>ESTADO :</b>
				<b><font color="#ff6600"><%= inqLoans.getE01STATUS().trim()%></font></b>
			</td>
		</tr>
	</table>
	
	<%int row = 0;row++; %>
	<table class="tableinfo">
		<tr > 
			<td nowrap>  
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Monto Original :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01DEAOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
							<eibsinput:text name="inqLoans" property="E01REVOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
							<% } %>   
						</td> 
						<td nowrap width="25%"><div align="right">Fecha de Apertura :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Saldo Principal :</div></td>
						<td nowrap width="25%">               
							<eibsinput:text name="inqLoans" property="E01DEAMEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
			 				<eibsinput:text name="inqLoans" property="E01REVMEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
			 				<% } %>               
						</td>
						<td nowrap width="25%"><div align="right">Fecha de Vencimiento :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEAMDM" fn_day="E01DEAMDD" fn_year="E01DEAMDY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Reajuste :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqLoans" property="E01DEAREA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="25%"><div align="right">T&eacute;rmino :</div></td>
						<td nowrap width="25%"> 
							<input type="text" name="E01DEATRM" size="5" maxlength="5" value="<%= inqLoans.getE01DEATRM().trim()%>" readonly>
							<input type="text" name="E01DEATRC" size="10" 
							value="<% if (inqLoans.getE01DEATRC().equals("D")) out.print("D&iacute;a(s)");
							else if (inqLoans.getE01DEATRC().equals("M")) out.print("Mes(es)");
							else if (inqLoans.getE01DEATRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" 
							readonly>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Saldo Intereses :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqLoans" property="E01DEAMEI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
							<eibsinput:text name="inqLoans" property="E01REVMEI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
							<% } %>              
						</td>
						<td nowrap width="25%"><div align="right">Tasa Inter&eacute;s :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqLoans" property="E01NOWRTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>      
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Interes por Mora :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqLoans" property="E01DEAMEM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
							<eibsinput:text name="inqLoans" property="E01REVMEM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
							<% } %>              
						</td>
						<td nowrap width="25%"><div align="right">Per&iacute;odo Base :</div></td>
						<td nowrap width="25%"> 
							<input type="text" name="E01DEABAS" size="4" maxlength="3" value="<%= inqLoans.getE01DEABAS().trim()%>" readonly>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Reajuste por Mora :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01DEAREX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="25%"><div align="right">Ciclo / Fecha Principal :</div></td>
						<td nowrap width="25%">
							<input type="text" name="E01DEAPPD" size="3" maxlength="3" value="<%= inqLoans.getE01DEAPPD().trim()%>" readonly>
							/ 
							<eibsinput:date name="inqLoans"  fn_month="E01DEAHEM" fn_day="E01DEAHED" fn_year="E01DEAHEY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Deducciones :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01TOTDED" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
							<eibsinput:text name="inqLoans" property="E01REVDED" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
							<% } %>              
						</td>
						<td nowrap width="25%"><div align="right">Ciclo / Fecha Intereses :</div></td>
						<td nowrap width="25%">
							<input type="text" name="E01DEAIPD" size="3" maxlength="3" value="<%= inqLoans.getE01DEAIPD().trim()%>" readonly>
							/ 
							<eibsinput:date name="inqLoans"  fn_month="E01DEARDM" fn_day="E01DEARDD" fn_year="E01DEARDY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Comisiones :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01TOTCOM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
			 				<eibsinput:text name="inqLoans" property="E01REVCOM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
			 				<% } %>
						</td>
						<td nowrap width="25%"><div align="right">Ciclo / Fecha Cambio Tasa :</div></td>
						<td nowrap width="25%">
							<input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= inqLoans.getE01DEARRP().trim()%>" readonly>
							/ 
							<eibsinput:date name="inqLoans"  fn_month="E01DEARRM" fn_day="E01DEARRD" fn_year="E01DEARRY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Impuestos :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01TOTIMP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
							<eibsinput:text name="inqLoans" property="E01REVIMP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
							<% } %>
						</td>
						<td nowrap width="25%"><div align="right">Cuota Financiera :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01DEAROA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>      
						</td>
					</tr>
					<% if(currUser.getE01INT().equals("07")) { %> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
						<td nowrap width="25%"><div align="right">F.E.C.I :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01DLCAV3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
							<eibsinput:text name="inqLoans" property="E01REVAV3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
							<% } %>
						</td>
						<td nowrap width="25%"><div align="right">F.E.C.I Vencido :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01DLCAV4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
							<eibsinput:text name="inqLoans" property="E01REVAV4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
							<% } %>
						</td>
					</tr>
					<% } %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">IVA :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01TOTIVA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
							<eibsinput:text name="inqLoans" property="E01REVIVA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
							<% } %>
						</td>
						<td nowrap width="25%"><div align="right">Otros Cargos :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01OTHCHG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>      
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Cobranzas :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01TOTCBZ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
							<eibsinput:text name="inqLoans" property="E01REVCBZ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
							<% } %>
						</td>
						<td nowrap width="25%"><div align="right">Cuota Total :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqLoans" property="E01TOTPYM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>      
						</td>
					</tr>
					<% if (inqLoans.getBigDecimalE01TOTRRF().doubleValue() > 0) { %>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Saldo Reintegro Fondo :</div></td>
						<td nowrap >
							<eibsinput:text property="E01TOTRRF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" value="<%=datapro.eibs.master.Util.formatCCY(inqLoans.getBigDecimalE01TOTRRF().doubleValue())%>" readonly="true"/>                                
						</td>
						<td nowrap width="25%"><div align="right"></div></td>
						<td nowrap >
						</td>
					</tr> 
					<% } %>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Saldo Total :</div></td>
						<td nowrap >
							<eibsinput:text name="inqLoans" property="E01MEMBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                                
							<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
			 				<eibsinput:text name="inqLoans" property="E01REVBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" size="13" maxlength="13"/>
				 			<% } %>
						</td>
						<td nowrap width="25%"><div align="right">Inter&eacute;s Calculado Hasta :</div></td>
						<td nowrap >
							<eibsinput:date name="inqLoans"  fn_month="E01DEALCM" fn_day="E01DEALCD" fn_year="E01DEALCY" readonly="True" /> 
						</td>
					</tr>
					<% if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) { %>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"></td>
						<td nowrap ></td>
						<td nowrap width="25%"><div align="right">Tasa CAE :</div></td>
						<td nowrap >
							<eibsinput:text name="inqLoans" property="E01DLCRT3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
						</td>
					</tr> 
					<% } %>          
				</table>
			</td>
		</tr> 
	</table>  
	
	<%if(inqLoans.getE01FLGCRL().equals("Y")){%>  
	<h4>Cupo Rotativo </h4>
	<table class="tableinfo" >
		<tr > 
			<td nowrap>   
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"> 
							<div align="right">Estado Cupo Rotativo :</div>
						</td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E01DEAIDT" size="1" maxlength="1" value="<%= inqLoans.getE01DEAIDT().trim()%>">
							<input type="text" readonly name="D01DEAIDT" size="20" maxlength="20" 
				value="<% if (inqLoans.getE01DEAIDT().equals("1")) out.print("Activo");
							else if (inqLoans.getE01DEAIDT().equals("2")) out.print("Inactivo");
							else if (inqLoans.getE01DEAIDT().equals("3")) out.print("Bloqueado");
							else if (inqLoans.getE01DEAIDT().equals("4")) out.print("Bloqueo DEF");
							else if (inqLoans.getE01DEAIDT().equals("5")) out.print("Cancelado");
							else if (inqLoans.getE01DEAIDT().equals("6")) out.print("Cerrado");
							else if (inqLoans.getE01DEAIDT().equals("7")) out.print("Bloqueo Manual");
							else out.print("Activo");%>" >
						</td>
						<td nowrap width="25%"> 
						</td>
							<td nowrap width="25%"> 
					</tr>
				
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Monto cupo credito :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEAOAM" name="inqLoans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="TRUE"/>  
						</td>
						<td nowrap width="25%"> 
						</td>
							<td nowrap width="25%"> 
					</tr>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Monto Utilizado :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEAMEP" name="inqLoans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="TRUE"/>  
						</td>
						<td nowrap width="25%"> 
						</td>
						<td nowrap width="25%"> 
						</td>
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"> 
							<div align="right">Saldo Disponible :</div>
						</td>
							<td nowrap width="25%"> 
							<eibsinput:text property="E01SALDIS" name="inqLoans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="TRUE"/>  
						</td>
						<td nowrap width="25%"> 
						</td>
						 <td nowrap width="25%"> 
						</td>
					</tr>
			 </table>
				</td>
			 </tr>
			</table>
<%}%>  

<%if(inqLoans.getE01DEACLF().equals("O")){%>

<h4>Sobregiro </h4>
	<table class="tableinfo" >
		<tr > 
			<td nowrap>   
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"> 
							<div align="right">Estado Sobregiro :</div>
						</td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E01DEAIDT" size="1" maxlength="1" value="<%= inqLoans.getE01DEAIDT().trim()%>">
							<input type="text" readonly name="D01DEAIDT" size="23" maxlength="22" 
				value="<% if (inqLoans.getE01DEAIDT().equals("1")) out.print("Activo");
							else if (inqLoans.getE01DEAIDT().equals("2")) out.print("Inactivo");
							else if (inqLoans.getE01DEAIDT().equals("3")) out.print("Bloqueado MORA");
							else if (inqLoans.getE01DEAIDT().equals("4")) out.print("Bloqueo DEF MORA");
							else if (inqLoans.getE01DEAIDT().equals("5")) out.print("Bloqueo DEF MORA");
							else if (inqLoans.getE01DEAIDT().equals("6")) out.print("Cerrado");
							else if (inqLoans.getE01DEAIDT().equals("7")) out.print("Bloqueo CTA EMBARGADA");
							else if (inqLoans.getE01DEAIDT().equals("8")) out.print("Bloqueo MANUAL");
							else if (inqLoans.getE01DEAIDT().equals("0")) out.print("Bloqueo MORA EN OTRO");
							else out.print("Activo");%>" >
						</td>
						<td nowrap width="25%"> 
						</td>
							<td nowrap width="25%"> 
					</tr>
				
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Monto cupo credito :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEAOAM" name="inqLoans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="TRUE"/>  
						</td>
						<td nowrap width="25%"> 
						</td>
							<td nowrap width="25%"> 
					</tr>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Monto Utilizado :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEAMEP" name="inqLoans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="TRUE"/>  
						</td>
						<td nowrap width="25%"> 
						</td>
						<td nowrap width="25%"> 
						</td>
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"> 
							<div align="right">Saldo Disponible :</div>
						</td>
							<td nowrap width="25%"> 
							<eibsinput:text property="E01SALDIS" name="inqLoans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="TRUE"/>  
						</td>
						<td nowrap width="25%"> 
						</td>
						 <td nowrap width="25%"> 
						</td>
					</tr>
			 </table>
				</td>
			 </tr>
			</table>

<%}%>    
	<h4>Distribucion de Valores</h4>
	
<% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
	
	<table class="tableinfo">
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > 
							<div align="center"> </div>
						</td>
						<td nowrap > 
							<div align="center"><b> Principal</b></div>
						</td>
						<td nowrap > 
							<div align="center"><b>Reajuste</b></div>
						</td>
						<td nowrap > 
							<div align="center"><b>Interes</b></div>
						</td>
						 <td nowrap > 
							<div align="center"><b>Interes Mora</b></div>
						</td>
					 <td nowrap > 
							<div align="center"><b>Reajuste Mora</b></div>
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > 
							<div align="right"> Vigente</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCPVI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCRVI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCIVI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMVI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					 <td nowrap > 
							 <div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCXVI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
					 </td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right"> Vencido</div>
						</td>
					 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCPVE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCRVE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCIVE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMVE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					 <td nowrap > 
							 <div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCXVE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
					 </td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > 
							<div align="right"> Suspendido</div>
						</td>
					 <td nowrap > 
							<div align="center">
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCRSU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCISU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMSU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					 <td nowrap > 
							 <div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCXSU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
					 </td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right"> Castigado</div>
						</td>
					 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCPCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCRCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCICA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					 <td nowrap > 
							 <div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCXCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
					 </td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right"> Post Castigo</div>
						</td>
					 <td nowrap > 
							<div align="center">
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCRPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					 <td nowrap > 
							 <div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCXPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
					 </td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > 
							<div align="right"><b>Total</b></div>
						</td>
					 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCPTO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCRTO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCITO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMTO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					 <td nowrap > 
							 <div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCXTO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
					 </td>
					</tr>

				</table>
			</td>
		</tr> 
	</table>  
	
 <% } else { %>
	
	<table class="tableinfo">
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > 
							<div align="center"> </div>
						</td>
						<td nowrap > 
							<div align="center"><b> Principal</b></div>
						</td>
						<td nowrap > 
							<div align="center"><b>Interes</b></div>
						</td>
						 <td nowrap > 
							<div align="center"><b>Interes Mora</b></div>
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > 
							<div align="right"> Vigente</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCPVI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCIVI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMVI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right"> Vencido</div>
						</td>
					 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCPVE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCIVE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMVE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > 
							<div align="right"> Suspendido</div>
						</td>
					 <td nowrap > 
							<div align="center">
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCISU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMSU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right"> Castigado</div>
						</td>
					 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCPCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCICA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right"> Post Castigo</div>
						</td>
					 <td nowrap > 
							<div align="center">
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > 
							<div align="right"><b>Total</b></div>
						</td>
					 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCPTO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						<td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCITO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
						 <td nowrap > 
							<div align="center">
							<eibsinput:text name="inqLoans" property="E01DLCMTO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr> 
	</table>  
<% } %>
	

<jsp:include page="ESD0840_reevaluation_inquiry.jsp" flush="true">
	<jsp:param name="flag" value="<%=inqLoans.getH01FLGWK3()%>" />
</jsp:include>

	<h4>Informaci&oacute;n Adicional</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" > 
							<div align="right"> Suspension Devengo :</div>
						</td>
						<td nowrap width="25%" >
							<input type="text" name="E01DLCSUS" size="2" maxlength="1" value="<%= inqLoans.getE01DLCSUS().trim()%>" readonly>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Principal Vencido :</div>
						</td>
						<td nowrap width="25%" >
						<eibsinput:text name="inqLoans" property="E01DEAPDU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right"> Calificaci&oacute;n :</div>
						</td>
						<td nowrap >
							<input type="text" name="E01CALIFI" size="2" maxlength="1" value="<%= inqLoans.getE01CALIFI().trim()%>" readonly>
						</td>
						<td nowrap > 
							<div align="right">Inter&eacute;s Vencido :</div>
						</td>
						<td nowrap > 
						<eibsinput:text name="inqLoans" property="E01DEAIDU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > 
							<div align="right">Informa x Reestructuraci&oacute;n :</div>
						</td>
						<td nowrap >
							 <input type="hidden" name="E01DEAFLY" value="<%=inqLoans.getE01DEAFLY()%>" readonly>
							 <input type="radio" name="CE01DEAFLY" value="Y" disabled="disabled" readonly <%if(inqLoans.getE01DEAFLY().equals("Y")) out.print("checked");%>>S&iacute; 
							 <input type="radio" name="CE01DEAFLY" value="N" disabled="disabled" readonly <%if(!inqLoans.getE01DEAFLY().equals("Y")) out.print("checked");%>>No 
						</td>
						<td nowrap > 
							<div align="right">Previsi&oacute;n Principal :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCPPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  > 
							<div align="right">Cuotas Pagadas :</div>
						</td>
						<td nowrap >
							<input type="text" name="E01CUOPAG" size="6" maxlength="5" value="<%= inqLoans.getE01CUOPAG().trim()%>" readonly>
						</td>
						<td nowrap > 
							<div align="right">Previsi&oacute;n Intereses :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCPIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap > 
							<div align="right">Cuotas Vencidas :</div>
						</td>
						<td nowrap> 
							<input type="text" name="E01CUOVEN" size="6" maxlength="5" value="<%= inqLoans.getE01CUOVEN().trim()%>" readonly>
						</td>
						<td nowrap > 
							<div align="right">Intereses Contingencia :</div>
						</td>
						<td nowrap >
							<eibsinput:text name="inqLoans" property="E01DLCICO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Dias de Mora paso a Castigo :</div>
						</td>
						<td nowrap >         	      
						<eibsinput:text name="inqLoans" property="E01DLCCO2" size="6" maxlength="5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Saldo Te&oacute;rico Diario :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01SALTEO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right">Requiere Garant&iacute;as :</div>
						</td>
						<td nowrap > 
							 <input type="hidden" name="E01DEAHTM" value="<%=inqLoans.getE01DEAHTM()%>" readonly>
							 <input type="radio" name="CE01DEAHTM" value="1" disabled="disabled" readonly <%if(inqLoans.getE01DEAHTM().equals("1")) out.print("checked");%>>S&iacute; 
							 <input type="radio" name="CE01DEAHTM" value="0" disabled="disabled" readonly <%if(!inqLoans.getE01DEAHTM().equals("1")) out.print("checked");%>>No 
						</td>
						<td nowrap >
							<div align="right">Mora Contingencia :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCPCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">N&uacute;mero Modificaciones :</div>
						</td>
						<td nowrap >
							<input type="text" name="E01DEAXRC" size="2" maxlength="2" value="<%= inqLoans.getE01DEAXRC().trim()%>" readonly>
							<input type="text" name="E01DLCMNP" size="1" maxlength="2" value="<%= inqLoans.getE01DLCMNP().trim()%>" readonly>
						</td>
						<td nowrap >
							<div align="right">Fecha Ultima Modificaci&oacute;n :</div>
						</td>
						<td nowrap  >
							<eibsinput:date name="inqLoans"  fn_month="E01DEAXRM" fn_day="E01DEAXRD" fn_year="E01DEAXRY" readonly="true" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">N&uacute;mero Reestructuraciones :</div>
						</td>
						<td nowrap >
							<input type="text" name="E01DEARON" size="2" maxlength="2" value="<%= inqLoans.getE01DEARON().trim()%>" readonly>
							<input type="text" name="E01DLCMNR" size="1" maxlength="2" value="<%= inqLoans.getE01DLCMNR().trim()%>" readonly>
						</td>
						<td nowrap >
							<div align="right">Fecha Ultima Reestructuraci&oacute;n :</div>
						</td>
						<td nowrap  >
							<eibsinput:date name="inqLoans"  fn_month="E01DEAEXM" fn_day="E01DEAEXD" fn_year="E01DEAEXY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">Finalizaci&oacute;n Monitoreo Modificado :</div>
						</td>
						<td nowrap >
							<eibsinput:date name="inqLoans"  fn_month="E01FECFMM" fn_day="E01FECFMD" fn_year="E01FECFMY" readonly="True" /> 
						</td>
						<td nowrap >
							<div align="right">Finalizaci&oacute;n Monitoreo Reestructurado :</div>
						</td>
						<td nowrap  >
							<eibsinput:date name="inqLoans"  fn_month="E01FECFRM" fn_day="E01FECFRD" fn_year="E01FECFRY" readonly="True" /> 
						</td>
					</tr>										
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  > 
							<div align="right">L&iacute;nea de Cr&eacute;dito :</div>
						</td>
						<td nowrap  >
							<input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= inqLoans.getE01DEACMC().trim()%>" readonly>
							<input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= inqLoans.getE01DEACMN().trim()%>" readonly>
						</td>
						<td nowrap  >
							<div align="right">Ultimo Cambio Calificaci&oacute;n :</div>
						</td>
						<td nowrap  >
							<eibsinput:date name="inqLoans"  fn_month="E01DLCCOM" fn_day="E01DLCCOD" fn_year="E01DLCCOY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right"> D&iacute;as en Mora :</div>
						</td>
						<td nowrap  >
							<input type="text" name="E01MORDYS" size="6" maxlength="5" value="<%= inqLoans.getE01MORDYS().trim()%>" readonly>
						</td>
						<td nowrap > 
							<div align="right">Reincidencia por Mora : </div>
						</td>
						<td nowrap  > 
						<eibsinput:text name="inqLoans" property="E01DLCMRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS%>" readonly="true"/>    
						</td>
					</tr>
	<%if(inqLoans.getE01FLGHIP().equals("Y")){%>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Aplica Renta Exenta :</div>
						</td>            
						<td nowrap > 
							 <input type="hidden" name="E01DLCFRE" value="<%= inqLoans.getE01DLCFRE()%>" readonly>
							 <input type="radio" name="CE01DLCFRE" value="Y" disabled="disabled" readonly <%if(inqLoans.getE01DLCFRE().equals("Y")) out.print("checked");%>>S&iacute; 
							 <input type="radio" name="CE01DLCFRE" value="N" disabled="disabled" readonly <%if(!inqLoans.getE01DLCFRE().equals("Y")) out.print("checked");%>>No 
						</td>
						<td nowrap >
							<div align="right">Valor de la Vivienda :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCVVI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
	<%}%>
	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">Calificaci&oacute;n por Temporalidad : </div>
						</td>
						<td nowrap  >
							<input type="text" name="E01CDLCAL" size="5" maxlength="2" value="<%= inqLoans.getE01CDLCAL().trim()%>" readonly>
						</td>
						<td nowrap > 
							<div align="right">Detenci&oacute;n Mora Evento Cliente :</div>
						</td>
						<td nowrap  > 
						<eibsinput:text name="inqLoans" property="E01DLCCO6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<h4>Otros Saldos</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right"> Principal Pagado :</div>
						</td>
						<td nowrap width="25%" > 
						<eibsinput:text name="inqLoans" property="E01PRIPYM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap width="25%" > 
							<div align="right"> Promedio Principal :</div>
						</td>
						<td nowrap width="25%" > 
						<eibsinput:text name="inqLoans" property="E01DEAAVP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  >
							<div align="right">Valor Participado : </div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01VALPAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap > 
							<div align="right"> Principal D&iacute;a Ayer :</div>
						</td>
						<td nowrap > 
						<eibsinput:text name="inqLoans" property="E01DEAPRI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right">Interes Acumulado :</div>
						</td>
						<td nowrap > 
						<eibsinput:text name="inqLoans" property="E01DEAIAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap > 
							<div align="right">Inter&eacute;s de Ayer :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01YESINT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right">Inter&eacute;s Pagado :</div>
						</td>
						<td nowrap > 
						<eibsinput:text name="inqLoans" property="E01DEAIPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap > 
							<div align="right">Inter&eacute;s Pagado A&ntilde;o :</div>
						</td>
						<td nowrap > 
						<eibsinput:text name="inqLoans" property="E01DEAIPY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">Inter&eacute;s Ajustado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DEAIJL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap height="20"> 
							<div align="right">Inter&eacute;s Diario :</div>
						</td>
						<td nowrap height="20"> 
						<eibsinput:text name="inqLoans" property="E01DLYINT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  > 
							<div align="right">Mora Acumulada :</div>
						</td>
						<td nowrap  >
						<eibsinput:text name="inqLoans" property="E01DEAPIA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
			</td>         
						<td nowrap  > 
							<div align="right">Mora Pagada:</div>
						</td>
						<td nowrap  >
						<eibsinput:text name="inqLoans" property="E01DEAPIP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
					 </td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right">Impuestos Pagados Acumulado :</div>
						</td>
						<td nowrap  > 
						<eibsinput:text name="inqLoans" property="E01DEATPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap > 
							<div align="right">Impuestos Pagados  A&ntilde;o :</div>
						</td>
						<td nowrap  > 
						<eibsinput:text name="inqLoans" property="E01DEATPY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right">Comisiones Pagadas Acumuladas :</div>
						</td>
						<td nowrap height="20"> 
						<eibsinput:text name="inqLoans" property="E01DEACPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap > 
							<div align="right">Comisiones Pagadas A&ntilde;o :</div>
						</td>
						<td nowrap height="20"> 
						<eibsinput:text name="inqLoans" property="E01DEACPY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  > 
							<div align="right">Deducciones Pagadas Acumuladas :</div>
						</td>
						<td nowrap > 
						<eibsinput:text name="inqLoans" property="E01DEADEL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap  > 
							<div align="right">Deducciones Pagadas A&ntilde;o :</div>
						</td>
						<td nowrap > 
						<eibsinput:text name="inqLoans" property="E01DEADEY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right">IVA Pagado Acumulados :</div>
						</td>
						<td nowrap  > 
						<eibsinput:text name="inqLoans" property="E01DEAIVL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap > 
							<div align="right">IVA Pagado A&ntilde;o :</div>
						</td>
						<td nowrap  > 
						<eibsinput:text name="inqLoans" property="E01DEAIVY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap > 
							<div align="right">Cobranzas Pagadas Acumuladas :</div>
						</td>
						<td nowrap height="20"> 
						<eibsinput:text name="inqLoans" property="E01DLCCBL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap > 
							<div align="right">Cobranzas Pagadas A&ntilde;o :</div>
						</td>
						<td nowrap height="20"> 
						<eibsinput:text name="inqLoans" property="E01DLCCBY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
	<%if(inqLoans.getE01FLGSBS().equals("Y")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Int. Subsidio Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCASL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Int. Subsidio A&ntilde;o :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCASY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
	<%}%>	
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">Acumulado Interes DGI  :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCAV1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
					 <td nowrap >
							<div align="right">Pagado Interes DGI  :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCAV2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Ajustado Interes DGI  :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DEATDM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Mensual Interes DGI  :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DEAAVI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">Principal Condonado Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCPRL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Principal Condonado A&ntilde;o :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCPRY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
			 <% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">Reajuste Condonado Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCREL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Reajuste Condonado A&ntilde;o :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCREY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
	 <% } %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Interes Condonado Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCINL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Interes Condonado A&ntilde;o :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCINY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">Mora Condonado Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCMOL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Mora Condonado A&ntilde;o :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCMOY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
			 <% if (inqLoans.getH01FLGWK3().equals("R")) { %> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">Reaj/Mora Condonado Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCRXL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Reaj/Mora Condonado A&ntilde;o :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCRXY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
	 <% } %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Impuesto Condonado Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCIML" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Impuesto Condonado A&ntilde;o :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCIMY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap >
							<div align="right">Comision Condonado Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCCML" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Comision Condonado A&ntilde;o :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCCMY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Deducion Condonado Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCDEL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Deducion Condonado A&ntilde;o :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCDEY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Cobranza Condonado Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCCXL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Cobranza Condonado A&ntilde;o :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCCXY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Intereses Exento Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCINE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Mora Exento Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCMNE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Intereses Suspenso Exento Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCISE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Mora Suspenso Exento Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCMSE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					 <% if (inqLoans.getH01FLGWK3().equals("R")) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap >
							<div align="right">Reajuste Exento Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCRNE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap >
							<div align="right">Reajuste Suspenso Exento Acumulado :</div>
						</td>
						<td nowrap >
						<eibsinput:text name="inqLoans" property="E01DLCRSE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<% } %>
				</table>
			</td>
		</tr>
	</table>

	<h4>Tasas </h4>

	<table class="tableinfo">
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"> 
							<div align="right">Tasa Base / Spread Actual : </div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqLoans" property="E01DEARTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>      
						</td>
						<td nowrap width="25%"> 
							<div align="right">Tasa Flotante Actual :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqLoans" property="E01DEAFRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>      
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"> 
							<div align="right">Tasa Base / Spread Anterior : </div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text name="inqLoans" property="E01DEAPBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>      
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tasa Flotante Anterior :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text name="inqLoans" property="E01DEAPFR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>      
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"> 
							<div align="right">Tasa Efectiva Anual : </div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text name="inqLoans" property="E01DEASPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>      
						</td>
						<td nowrap width="25%" > 
							<div align="right">Pr&oacute;xima Tasa Flotante :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text name="inqLoans" property="E01DEANER" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>      
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	
	<h4>Fechas </h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"> 
							<div align="right">Fecha Valor :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEASDM" fn_day="E01DEASDD" fn_year="E01DEASDY" readonly="True" /> 
						</td>
						<td nowrap width="25%"> 
							<div align="right">Fecha Ultimo Cambio Contable :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEALGM" fn_day="E01DEALGD" fn_year="E01DEALGY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"> 
							<div align="right">Fecha Ultimo Cambio de Tasa :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEARCM" fn_day="E01DEARCD" fn_year="E01DEARCY" readonly="True" /> 
						</td>
						<td nowrap width="25%"> 
							<div align="right"> Fecha Ultimo Pago Capital :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEALPM" fn_day="E01DEALPD" fn_year="E01DEALPY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"> 
							<div align="right">Fecha Pr&oacute;ximo Cambio de Tasa :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEANRM" fn_day="E01DEANRD" fn_year="E01DEANRY" readonly="True" /> 
						</td>
						<td nowrap width="25%"> 
							<div align="right">Fecha Ultimo Pago Intereses :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEALIM" fn_day="E01DEALID" fn_year="E01DEALIY" readonly="True" /> 
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"> 
							<div align="right">Inter&eacute;s Pagado Hasta :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEAITM" fn_day="E01DEAITD" fn_year="E01DEAITY" readonly="True" /> 
						</td>
						<td nowrap width="25%"> 
							<div align="right">Principal Pagado Hasta :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEAPTM" fn_day="E01DEAPTD" fn_year="E01DEAPTY" readonly="True" /> 
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"> 
							<div align="right">Fecha Ultimo Condonado :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DLCUCM" fn_day="E01DLCUCD" fn_year="E01DLCUCY" readonly="True" /> 
						</td>
						<td nowrap width="25%"> 
							<div align="right">Fecha Suspension Devengo :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DLCSUM" fn_day="E01DLCSUD" fn_year="E01DLCSUY" readonly="True" /> 
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"> 
							<div align="right">Fecha Aceleracion :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DLCACM" fn_day="E01DLCACD" fn_year="E01DLCACY" readonly="True" /> 
						</td>
						<td nowrap width="25%"> 
							<div align="right">Fecha Gestion Cobranza :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DLCFCM" fn_day="E01DLCFCD" fn_year="E01DLCFCY" readonly="True" /> 
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"> 
							<div align="right">Fecha Castigo :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DLCCAM" fn_day="E01DLCCAD" fn_year="E01DLCCAY" readonly="True" /> 
						</td>
						<td nowrap width="25%"> 
							<div align="right">Fecha Regreso Vigente :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DLCVIM" fn_day="E01DLCVID" fn_year="E01DLCVIY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%">
							<div align="right">Fecha Ultimo Mantenimiento :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DEALMM" fn_day="E01DEALMD" fn_year="E01DEALMY" readonly="True" /> 
						</td>
						<td nowrap width="25%"> 
							<div align="right">Cambio Forma de Pago Convenio :</div>
						</td>
						<td nowrap width="25%">
						<eibsinput:date name="inqLoans"  fn_month="E01DEALSM" fn_day="E01DEALSD" fn_year="E01DEALSY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%">
							<div align="right">Fecha de Exenci&oacute;n Hasta :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqLoans"  fn_month="E01DLCEXM" fn_day="E01DLCEXD" fn_year="E01DLCEXY" readonly="True" /> 
						</td>
						<td nowrap width="25%"> 
							<div align="right">Mantenimiento por :</div>
						</td>
						<td nowrap width="25%"> 
							<input type="text" name="E01DEAUSR" size="15" maxlength="10" value="<%= inqLoans.getE01DEAUSR().trim()%>" readonly>
			</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br>
	</form>
</body>
</html>
