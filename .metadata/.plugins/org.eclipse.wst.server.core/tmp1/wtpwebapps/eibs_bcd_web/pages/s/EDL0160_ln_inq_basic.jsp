<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.*" %>
<%@ page import = "java.math.BigDecimal" %> 
<html>
<head>
<title>Información Básica</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="inqBasic" class="datapro.eibs.beans.EDL016002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-paymentplan.jsp"></script>

<SCRIPT type="text/javascript">

function goReserva(cun,nro) {
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0075?SCREEN=102&PURPOSE=INQUIRY&E01RESCUN="+cun+"&E01RESNRE="+nro;
	CenterWindow(url, 1100, 700, 2);		
}

<% if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){%>
	builtNewMenu(ln_i_1_opt);
<% } else  { %>
	builtNewMenu(ln_i_2_opt);
<% } %>

//Field Used to Set Readonly
//The "Condiciones de Pago" in ln-paymentplan.js
window.inquiry = true;

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

<h3 align="center">Informaci&oacute;n B&aacute;sica - <%=inqBasic.getE02DSCPRO()%> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_inq_basic.jsp,EDL0160"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0160" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
	<table border="0" cellspacing="0" cellpadding="0" width="100%" style="visibility: <%= inqBasic.getE02PENDAP().equals("") ? "hidden" : "visible" %>">
		<tr>
			<td align="right" valign="top" width="85%" style="color:red;font-size:12;"><b><%=inqBasic.getE02PENDAP()%></b></td>
			<td width="5%"><h6>&nbsp;</h6></td>
		</tr>
	</table>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="14%" > 
							<div align="right"><b>Cliente :</b></div>
						</td>
						<td nowrap width="9%" > 
							<div align="left"> 
								<input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="right"><b>Nombre :</b></div>
						</td>
						<td nowrap > 
							<div align="left"> 
								<input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
							</div>
						</td>
						<td nowrap > 
							<div align="right"><b>Producto : </b></div>
						</td>
						<td nowrap ><b> 
							<input type="text" name="E02PTYP" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
							<input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
							</b></td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="14%"> 
							<div align="right"><b>Cuenta :</b></div>
						</td>
						<td nowrap width="9%"> 
							<div align="left"> 
								<input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="12%"> 
							<div align="right"><b>Oficial :</b></div>
						</td>
						<td nowrap width="33%"> 
							<div align="left"> 
								<input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
							</div>
						</td>
						<td nowrap width="11%"> 
							<div align="right"><b>Moneda :</b></div>
						</td>
						<td nowrap width="21%"> 
							<div align="left"> 
								<input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
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
			<h4>Informaci&oacute;n B&aacute;sica</h4>
			</td>
			<td nowrap align=left> 
			<b>CREDITO :<font color="#ff6600"> <% 	if (inqBasic.getE02COLATR().trim().equals("") )
														out.print("SIN GARANTIA");
													else
														out.print(inqBasic.getE02COLATR());
												%></font></b>
			</td>
			<td nowrap align=right> 
			<b>ESTADO :</b>
			</td>
			<td nowrap> 
			<b><font color="#ff6600"><%= inqBasic.getE02STATUS().trim()%></font></b>
			</td>
		</tr>
	</table>
	
	<%int row = 0; %>
	<table class="tableinfo">
		<tr> 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Monto Original :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEAOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/> 
						</td>
						<td nowrap width="25%"><div align="right">Fecha de Apertura :</div></td>
						<td nowrap> 
							<eibsinput:date name="inqBasic"  fn_month="E02DEAODM" fn_day="E02DEAODD" fn_year="E02DEAODY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Tipo de Inter&eacute;s :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEAICT" size="1" maxlength="1" value="<%= inqBasic.getE02DEAICT().trim()%>">
							<input type="text" readonly name="D02DEAICT" size="40" maxlength="40" value="<% if (inqBasic.getE02DEAICT().equals("S")) out.print("Al Vencimiento Calendario");
							else if (inqBasic.getE02DEAICT().equals("M")) out.print("Al Vencimiento Comercial");
							else if (inqBasic.getE02DEAICT().equals("P")) out.print("Prepagados Calendario");
							else if (inqBasic.getE02DEAICT().equals("A")) out.print("Prepagados Comerciales");
							else if (inqBasic.getE02DEAICT().equals("D")) out.print("Descontados Calendario");
							else if (inqBasic.getE02DEAICT().equals("T")) out.print("Descontados Comerciales");
							else if (inqBasic.getE02DEAICT().equals("R")) out.print("Capitalizados(CD's)");
							else if (inqBasic.getE02DEAICT().equals("1")) out.print("Al Vencimiento Calendario");
							else if (inqBasic.getE02DEAICT().equals("2")) out.print("Al Vencimiento Comercial");
							else if (inqBasic.getE02DEAICT().equals("3")) out.print("Prepagados Calendario");
							else if (inqBasic.getE02DEAICT().equals("4")) out.print("Prepagados Comerciales");
							else if (inqBasic.getE02DEAICT().equals("5")) out.print("Descontados Calendario");
							else if (inqBasic.getE02DEAICT().equals("6")) out.print("Descontados Comerciales");
							else if (inqBasic.getE02DEAICT().equals("7")) out.print("Capitalizados (CD's)");
							else if (inqBasic.getE02DEAICT().equals("8")) out.print("Regla 78");
							else out.print("");%>" >
						</td>
						<td nowrap width="25%"><div align="right">Fecha de Vencimiento :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqBasic"  fn_month="E02DEAMDM" fn_day="E02DEAMDD" fn_year="E02DEAMDY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Clase de Cr&eacute;dito :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEACLF" size="1" maxlength="1" value="<%= inqBasic.getE02DEACLF().trim()%>">
							<input type="text" readonly name="D02DEACLF" size="40" maxlength="40" value="<% if (inqBasic.getE02DEACLF().equals("A")) out.print("Arrendamiento Financiero");
							else if (inqBasic.getE02DEACLF().equals("C")) out.print("Préstamos de Consumo");
							else if (inqBasic.getE02DEACLF().equals("D")) out.print("Préstamos sobre Saldo Disoluto");
							else if (inqBasic.getE02DEACLF().equals("F")) out.print("Préstamo de Fomento");
							else if (inqBasic.getE02DEACLF().equals("L")) out.print("Préstamo Regular");
							else if (inqBasic.getE02DEACLF().equals("H")) out.print("Hipotecarios");
							else if (inqBasic.getE02DEACLF().equals("K")) out.print("Relacionado");
							else if (inqBasic.getE02DEACLF().equals("M")) out.print("Microcredito");
							else if (inqBasic.getE02DEACLF().equals("P")) out.print("Politica Habitacional");
							else if (inqBasic.getE02DEACLF().equals("G")) out.print("Descuento Documentos(Factoring)");
							else if (inqBasic.getE02DEACLF().equals("V")) out.print("Valores al Cobro");
							else if (inqBasic.getE02DEACLF().equals("O")) out.print("Para Control de Sobregiros");
							else if (inqBasic.getE02DEACLF().equals("R")) out.print("Préstamo Reestructurado");
							else if (inqBasic.getE02DEACLF().equals("I")) out.print("Cupo Rotativo");
							else if (inqBasic.getE02DEACLF().equals("J")) out.print("Préstamo Revolvente");
							else if (inqBasic.getE02DEACLF().equals("S")) out.print("Préstamo Avalado");
							else if (inqBasic.getE02DEACLF().equals("T")) out.print("Deuda de Tarjeta en Recuperacion");
							else if (inqBasic.getE02DEACLF().equals("X")) out.print("Préstamo Regular Refinanciado");
							else out.print("Proyectos de Constructor");%>" >
						</td>
						<td nowrap width="25%"><div align="right">Tipo Pr&eacute;stamo S&uacute;per :</div></td>
						<td nowrap width="25%"> 
							<input type="text" name="E02DEAPSU" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPSU().trim()%>" readonly >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<% if (currUser.getE01INT().trim().equals("07")) {%>
						<td nowrap width="25%"><div align="right">Condici&oacute;n de Cr&eacute;dito :</div></td>
							<td width="25%" > 
								<input type="text" readonly name="E02DEADLC" size="2" maxlength="1" value="<%= inqBasic.getE02DEADLC().trim()%>">
							</td>
						<% } else  if (currUser.getE01INT().trim().equals("18")){%> 
							<td nowrap width="25%" ><div align="right">Condici&oacute;n  Cr&eacute;dito :</div></td>
							<td width="25%" > 
								<input type="text" readonly name="E02DEADLC" size="1" maxlength="1" value="<%= inqBasic.getE02DEADLC().trim()%>">
								<input type="text" readonly name="E02DEADLC" size="20" 
								value="<% if (inqBasic.getE02DEADLC().equals("1")) out.print("Vigente");
								else if (inqBasic.getE02DEADLC().equals("2")) out.print("Vencido");
								else if (inqBasic.getE02DEADLC().equals("3")) out.print("Castigado");
								else if (inqBasic.getE02DEADLC().equals("4")) out.print("Castigado N/Inf");
								else out.print("");%>" >
							</td> 
						<% } else  if (currUser.getE01INT().trim().equals("05")){%> 
							<td nowrap width="25%" ><div align="right">Condici&oacute;n  Cr&eacute;dito :</div></td>
							<td width="25%" > 
								<input type="text" readonly name="E02DEADLC" size="1" maxlength="1" value="<%= inqBasic.getE02DEADLC().trim()%>">
								<input type="text" readonly name="E02DSCDLC" size="25" maxlength="25" value="<%= inqBasic.getE02DSCDLC().trim()%>">
							</td> 
						<% } else  {%> 
							<td nowrap width="25%" ><div align="right">Condici&oacute;n  Cr&eacute;dito :</div></td>
							<td width="25%" > 
								<input type="text" readonly name="E02DEADLC" size="1" maxlength="1" value="<%= inqBasic.getE02DEADLC().trim()%>">
								<input type="text" readonly name="E02DEADLC" size="20" 
									value="<% if (inqBasic.getE02DEADLC().equals("1")) out.print("Vigente");
									else if (inqBasic.getE02DEADLC().equals("2")) out.print("Vencido");
									else if (inqBasic.getE02DEADLC().equals("3")) out.print("Castigado");
									else if (inqBasic.getE02DEADLC().equals("4")) out.print("Castigado N/Inf");
									else if (inqBasic.getE02DEADLC().equals("5")) out.print("Acelerado");
									else if (inqBasic.getE02DEADLC().equals("6")) out.print("Vencido Anticipado");
									else if (inqBasic.getE02DEADLC().equals("7")) out.print("Ejecución Prejudicial");
									else out.print("");%>" >
							</td>
						<% }%>   
						<td nowrap width="25%"><div align="right">T&eacute;rmino o Plazo :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEATRM" size="5" maxlength="5" value="<%= inqBasic.getE02DEATRM().trim()%>">
							<input type="text" readonly name="E02DEATRC" size="10" 
							value="<% if (inqBasic.getE02DEATRC().equals("D")) out.print("D&iacute;a(s)");
							else if (inqBasic.getE02DEATRC().equals("M")) out.print("Mes(es)");
							else if (inqBasic.getE02DEATRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" >
						</td>
					</tr>
					<% if(inqBasic.getE02FLGFLT().equals("2")) { %>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap width="25%" ><div align="right">Tipo de Tabla Conversion :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E02TYPTBL" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="True" />
						</td>
						<td nowrap width="25%" ><div align="right">Tasa Flotante Base :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E02DEACRT" name="inqBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="True" />
						</td>
					</tr>          
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap width="25%" ><div align="right">Manejo Puntos Adicional  :</div></td>
						<td nowrap width="25%" > 
							<input type="text" readonly name="E02DEAFLX" size="1" maxlength="1" value="<%= inqBasic.getE02DEAFLX().trim()%>">
							<input type="text" readonly name="D02DEAFLX" size="25" maxlength="25" 
							value="<% if (inqBasic.getE02DEAFLX().equals("B")) out.print("+/- Tasa Base");
							else if (inqBasic.getE02DEAFLX().equals("E")) out.print("+/- Tasa Efectiva");
							else if (inqBasic.getE02DEAFLX().equals("N")) out.print("+/- Tasa Nominal");
							else out.print("");%>" >
						</td>
						<td nowrap width="25%" ><div align="right">Valor Tasa Adicional :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E02DEARTX" name="inqBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="True" />
						</td>
					</tr>
					<% } %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Tabla de Tasa Flotante :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEAFTB" size="2" maxlength="2" value="<%= inqBasic.getE02DEAFTB().trim()%>">
							<input type="text" readonly name="E02DEAFTY" size="2" 
							value="<% if (inqBasic.getE02DEAFTY().equals("FP")) out.print("FP");
							else if (inqBasic.getE02DEAFTY().equals("FS")) out.print("FS");
							else out.print("");%>" >
							<input type="text" readonly name="E02FLTDSC" size="40" maxlength="40" value="<%= inqBasic.getE02FLTDSC().trim()%>">
						</td>
						<td nowrap width="25%"><div align="right">Tasa Flotante :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEAFRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">C&aacute;lculo Inter&eacute;s Normal :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEAIFL" size="1" maxlength="1" value="<%= inqBasic.getE02DEAIFL().trim()%>">
							<input type="text" readonly name="D02DEAIFL" size="40" maxlength="40" 
							value="<% if (inqBasic.getE02DEAIFL().equals("1")) out.print("Capital Vigente");
							else if (inqBasic.getE02DEAIFL().equals("2")) out.print("Capital Original");
							else if (inqBasic.getE02DEAIFL().equals("3")) out.print("Capital Vigente - Capital Vencido");
							else if (inqBasic.getE02DEAIFL().equals("N")) out.print("No Calcula Intereses");
							else out.print("");%>" >
						</td>
						<td nowrap width="25%"><div align="right">Tasa de Inter&eacute;s/Spread :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEARTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">C&aacute;lculo Inter&eacute;s Mora :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEAPCL" size="1" maxlength="1" value="<%= inqBasic.getE02DEAPCL().trim()%>">
							<input type="text" readonly name="D02DEAPCL" size="40" maxlength="40" 
							value="<% if (inqBasic.getE02DEAPCL().equals("1")) out.print("Capital Vencido");
							else if (inqBasic.getE02DEAPCL().equals("2")) out.print("Capital Original");
							else if (inqBasic.getE02DEAPCL().equals("3")) out.print("Capital Vigente");
							else if (inqBasic.getE02DEAPCL().equals("4")) out.print("Capital + Interes Vencido");
							else if (inqBasic.getE02DEAPCL().equals("5")) out.print("Capital + Interes + Seguro Vencido");
							else if (inqBasic.getE02DEAPCL().equals("6")) out.print("Capital + Seguro Vencido");
							else out.print("No Calcula Intereses de Mora");%>" >
						</td>
						<td nowrap width="25%"><div align="right">Tasa Definitiva:</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text property="E02LNSRTE" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>                          
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Inter&eacute;s de Mora :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEAPEI" size="7" maxlength="7" value="<%= inqBasic.getE02DEAPEI().trim()%>">
							<input type="text" readonly name="E02DEAPIF" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPIF().trim()%>">
							<input type="text" readonly name="D02DEAPIF" size="25" maxlength="25" 
							value='<% if (inqBasic.getE02DEAPIF().equals("%")) out.print("Porcentaje");
							else if (inqBasic.getE02DEAPIF().equals("F")) out.print("Cargo Fijo");
							else if (inqBasic.getE02DEAPIF().equals("A")) out.print("Suma a Tasa Base");
							else if (inqBasic.getE02DEAPIF().equals("E")) out.print("Mult a Tasa Efectiva");
							else if (inqBasic.getE02DEAPIF().equals("M")) out.print("Mult a tasa Base");
							else if (inqBasic.getE02DEAPIF().equals("X")) out.print("Usa Tasa Max Permitida");
							else if (inqBasic.getE02DEAPIF().equals("Y")) out.print("Usa Tasa Efectiva");
							else out.print("N/A");%>'>
						</td>
						<td nowrap width="25%"><div align="right">Tasa M&iacute;nima Permitida :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEAMIR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>                          
					</tr>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Per&iacute;odo Base :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEABAS" size="3" maxlength="3" value="<%= inqBasic.getE02DEABAS().trim()%>" >
						</td>
						<td nowrap width="25%"><div align="right">Tasa M&aacute;xima Permitida :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEAMXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>                          
					</tr>    
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tabla Tasas Matriz :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E02DEARTB" size="3" maxlength="2" value="<%= inqBasic.getE02DEARTB().trim() %>" readonly>
						</td>
						<td nowrap width="25%"><div align="right">Tasa Efectiva Anual :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEASPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>                          
					</tr>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Tabla de Parametros :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEATLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>" readonly="true"/>
						</td>
						<td nowrap width="25%"><div align="right">Numero de Oferta :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEAOFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Tabla de Cargos :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEAOFT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>" readonly="true" />
						</td>
						<td nowrap width="25%"><div align="right">Per&iacute;odo de Gracia :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEAGPD" size="2" maxlength="2" value="<%= inqBasic.getE02DEAGPD().trim()%>" readonly/> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Ciclo Revison de Tasa :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEARRP" size="3" maxlength="3" value="<%= inqBasic.getE02DEARRP().trim()%>" >
						</td>
						<td nowrap width="25%"><div align="right">Proximo Cambio de tasa :</div></td>
						<td nowrap width="25%">
							<eibsinput:date name="inqBasic"  fn_month="E02DEARRM" fn_day="E02DEARRD" fn_year="E02DEARRY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Ciclo Envio Estado de Cuenta :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEASTC" size="3" maxlength="3" value="<%= inqBasic.getE02DEASTC().trim()%>" >
						</td>
						<td nowrap width="25%"><div align="right">Proximo Envio Estado de Cuenta :</div></td>
						<td nowrap width="25%">
							<eibsinput:date name="inqBasic"  fn_month="E02DEAEDM" fn_day="E02DEAEDD" fn_year="E02DEAEDY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Ciclo Revisi&oacute;n del Prestamo :</div></td>
						<td nowrap width="25%"> 
							<input type="text" name="E02DLCRVC" size="3" maxlength="3" value="<%= inqBasic.getE02DLCRVC().trim()%>"  readonly>
							<select name="E02DLCRVT" id="E02DLCRVT" disabled="disabled" >
								<option value=" " <% if (!(inqBasic.getE02DLCRVT().equals("D") ||inqBasic.getE02DLCRVT().equals("M")||inqBasic.getE02DLCRVT().equals("Y"))) out.print("selected"); %>></OPTION>
								<option value="D" <% if(inqBasic.getE02DLCRVT().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
								<option value="M" <% if(inqBasic.getE02DLCRVT().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
								<option value="Y" <% if(inqBasic.getE02DLCRVT().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
							</select>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha Revisi&oacute;n del Prestamo :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqBasic"  fn_month="E02DLCRDM" fn_day="E02DLCRDD" fn_year="E02DLCRDY" readonly="true"/> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Nro Cambios Contables :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEAGLC" size="3" maxlength="2" value="<%= inqBasic.getE02DEAGLC().trim()%>">
						</td>
						<td nowrap width="25%"><div align="right">Ultimo Cambio Contable :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqBasic"  fn_month="E02DEALGM" fn_day="E02DEALGD" fn_year="E02DEALGY" readonly="True" /> 
						</td>                          
					</tr>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">Banco / Sucursal :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEABNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
							/ 
							<eibsinput:text name="inqBasic" property="E02DEABRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
						</td>
						<td nowrap width="25%"><div align="right">Cuenta Contable :</div></td>
						<td nowrap width="25%">
							<eibsinput:text name="inqBasic" property="E02DEAGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"><div align="right">L&iacute;nea de Cr&eacute;dito :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEACMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true" /> 
							<eibsinput:text name="inqBasic" property="E02DEACMN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CREDIT_LINE %>" readonly="true" /> 
						</td>
						<td nowrap width="25%"><div align="right">Centro de Costos :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEACCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER %>" readonly="true"/> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Contrapartida Contable :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEAOFB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
							<eibsinput:text name="inqBasic" property="E02DEAOCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
							<eibsinput:text name="inqBasic" property="E02DEAOCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							<eibsinput:text name="inqBasic" property="E02DEAOGL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" readonly="true"/>
						</td>
						<td nowrap width="25%"><div align="right">Contrapartida Cta Corriente :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEAOAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tipo de Relaci&oacute;n 1 :</div></td>
						<td nowrap width="25%" >
							<input type="text" readonly name="E02DEAPAR" size="1" maxlength="1" value="<%= inqBasic.getE02DEAPAR().trim()%>">
							<input type="text" readonly name="D02DEAPAR" size="25" maxlength="25" value='<% if (inqBasic.getE02DEAPAR().equals("A")) out.print("Arrendamiento con Capitalización");
							else if (inqBasic.getE02DEAPAR().equals("B")) out.print("Arrendamiento con Capitalización");
							else if (inqBasic.getE02DEAPAR().equals("F")) out.print("Fondeo");
							else if (inqBasic.getE02DEAPAR().equals("G")) out.print("Administración de Fondos");
							else if (inqBasic.getE02DEAPAR().equals("P")) out.print("Participación");
							else if (inqBasic.getE02DEAPAR().equals("O")) out.print("Proyectos de Constructor");
							else if (inqBasic.getE02DEAPAR().equals("S")) out.print("Sindicación");
							else if (inqBasic.getE02DEAPAR().equals("T")) out.print("Indexado a Certificado");
							else if (inqBasic.getE02DEAPAR().equals("1")) out.print("Tasa más alta de Certificado");
							else if (inqBasic.getE02DEAPAR().equals("2")) out.print("Tasa más alta de Ahorros");
							else if (inqBasic.getE02DEAPAR().equals("3")) out.print("Tasa más alta de CDS / Ahorros");
							else out.print("N/A");%>'>
							<eibsinput:text name="inqBasic" property="E02DEAPAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="25%" ><div align="right">N&uacute;mero de Referencia :</div></td>
						<td nowrap width="25%" >
							<input type="text" readonly name="E02DEAREF" size="12" maxlength="12" value="<%= inqBasic.getE02DEAREF().trim()%>">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tipo de Relaci&oacute;n 2 :</div></td>
						<td nowrap width="25%" >
							<input type="text" readonly name="E02DEARET" size="1" maxlength="1" value="<%= inqBasic.getE02DEARET().trim()%>">
							<input type="text" readonly name="D02DEARET" size="25" maxlength="25" 
							value='<% if (inqBasic.getE02DEARET().equals("P")) out.print("Pago sobre Préstamos");
							else if (inqBasic.getE02DEARET().equals("R")) out.print("Crédito Retanqueado");
							else if (inqBasic.getE02DEARET().equals("E")) out.print("Crédito Reestructurado");
							else if (inqBasic.getE02DEARET().equals("F")) out.print("Refinanciar sobre otro Crédito");
							else if (inqBasic.getE02DEARET().equals("D")) out.print("Financiar Documentaria");
							else if (inqBasic.getE02DEARET().equals("U")) out.print("Crédito Negociado");
							else if (inqBasic.getE02DEARET().equals("V")) out.print("Novado");
							else out.print("N/A");%>'>
							<eibsinput:text name="inqBasic" property="E02DEAREA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="25%" ><div align="right">Uso de Domicilio :</div></td>
						<td nowrap width="25%"  height="19">
						<select name="E02DEAWHF" id="E02DEAWHF" disabled >
							<option value=" " <% if (!(inqBasic.getE02DEAWHF().equals("R") || inqBasic.getE02DEAWHF().equals("C"))) out.print("selected"); %>></option>
							<option value="R" <% if (inqBasic.getE02DEAWHF().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
							<option value="C" <% if (inqBasic.getE02DEAWHF().equals("C")) out.print("selected"); %>>Correo Eléctronico</option>
						</select>
						<input type="text" readonly name="E02DEAMLA" size="2" maxlength="2" value="<%= inqBasic.getE02DEAMLA().trim()%>"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Amort. Nic 39 :</div></td>
						<td nowrap width="25%" >
							 <eibsinput:text name="inqBasic" property="E02DEABRK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" readonly="true"/> 
							 <eibsinput:text name="inqBasic" property="E02DSCBRK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/> 
						</td>
						<td nowrap width="25%" ><div align="right">Tasa TIR % :</div></td>
						<td nowrap width="25%" >
							<eibsinput:text name="inqBasic" property="E02TIR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right">Clave de Descuento :</div></td>
						<td nowrap width="25%" >
							<input type="text" readonly name="E02DEACUI" size="6" value="<%= inqBasic.getE02DEACUI().trim()%>">
							<eibsinput:text name="inqBasic" property="D02DEACUI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/> 
						</td>
						<td nowrap width="25%" ><div align="right">Fecha Reestruc/Refinanc :</div></td>
						<td nowrap width="25%" >
							<eibsinput:date name="inqBasic"  fn_month="E02DEAEXM" fn_day="E02DEAEXD" fn_year="E02DEAEXY" onchange="setRecalculate()"  readonly="true"/> 
						</td>
					</tr>
					<% if(!inqBasic.getE02DLCTPR().equals("") || !inqBasic.getE02DLCCDR().equals("")){ %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Tipo Reestruc :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DLCTPR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
							<eibsinput:text name="inqBasic" property="E02DSCTPR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true" />
						</td>
						<td nowrap width="25%"><div align="right">Condicion Reestruc :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text name="inqBasic" property="E02DLCCDR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
							<eibsinput:text name="inqBasic" property="E02DSCCDR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true" />
						</td>
					</tr>
			 		<%}%>
			 		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Intereses del periodo de Gracia :</div></td>
						<td nowrap width="25%" >
							<input type="text" readonly name="E02DLCIGF" size="1" maxlength="1" value="<%= inqBasic.getE02DLCIGF().trim()%>">
							<input type="text" readonly name="D02DLCIGF" size="35" maxlength="35" 
							value="<% if (inqBasic.getE02DLCIGF().equals("")) out.print("Interes Deudor");
							else if (inqBasic.getE02DLCIGF().equals("1")) out.print("Prepaga los Intereses");
							else if (inqBasic.getE02DLCIGF().equals("2")) out.print("Cobrar en la Primera Cuota");
							else if (inqBasic.getE02DLCIGF().equals("3")) out.print("Cobrar en NN Cuotas");
							else if (inqBasic.getE02DLCIGF().equals("4")) out.print("Cobra en todas las Cuotas<");
							else out.print(" ");%>" >
						</td>
						<td nowrap width="25%" ><div align="right">Numero de Meses a Diferir :</div></td>
						<td nowrap width="25%"  >
							<eibsinput:text property="E02DLCIGN" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" readonly="true"/> 
						</td>
					</tr>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Valor Interes Periodo de Gracia :</div></td>
						<td nowrap width="25%" >
							<eibsinput:text property="E02DLCIGA" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/> 
						</td>
						<td nowrap width="25%"><div align="right">Accion por Cambio de Tasa :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEAXRF" size="1" maxlength="1" value="<%= inqBasic.getE02DEAXRF().trim()%>">
							<input type="text" readonly name="D02DEAXRF" size="25" maxlength="25" value='<% if (inqBasic.getE02DEAXRF().equals("T")) out.print("Cambia el Plazo");
							else  out.print("Cambia la Cuota");%>'>
						</td>
			 		</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Fuente de Recurso :</div></td>
						<td nowrap width="25%" >
							<input type="text" size="5" maxlength="4" name="E02DEAUC7" readonly value="<%=inqBasic.getE02DEAUC7().trim()%>">
							<input type="text" name="D02DEAUC7" size="48" maxlength="45" readonly value="<%= inqBasic.getD02DEAUC7().trim()%>">
						</td>
						<td nowrap width="25%" ><div align="right">Numero de Pagar&eacute; :</div></td>
						<td nowrap width="25%" >
							<input type="text" name="E02DEAIVC" size="14" maxlength="12" readonly value="<%= inqBasic.getE02DEAIVC().trim()%>">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Indice de Cobertura de la Garantía :</div></td>
						<td nowrap width="25%" >
							<input type="text" name="E02DEAA01" size="10" maxlength="9" value="<%= inqBasic.getE02DEAA01().trim()%>" readonly>
						</td>
						<td nowrap width="25%" ><div align="right">Tasa de Cambio :</div></td>
						<td nowrap width="25%" >
							<eibsinput:text name="inqBasic" property="E02DEAEXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" readonly="true"/>
						</td>
					</tr>
					<% if (currUser.getE01INT().equals("05")){ %>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
						<td nowrap width="25%"><div align="right">Registra FG :</div> <!-- FNG --></td>
				 		<td nowrap width="25%"> 
							<input type="radio" name="E02DLCFL6" value="Y" <%if (inqBasic.getE02DLCFL6().equals("Y")) out.print("checked"); %> disabled="disabled"> Si 
							<input type="radio" name="E02DLCFL6" value="N" <%if (!inqBasic.getE02DLCFL6().equals("Y")) out.print("checked"); %> disabled="disabled"> No
						</td>            
				 		<td nowrap width="25%" ><div align="right">Numero de Reserva :</div></td>
				 		<td nowrap width="25%" > 
							<eibsinput:text property="E02DLCRF1" maxlength="12" size="14" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" readonly="true" />
							<% if (!inqBasic.getE02DLCRF1().trim().equals("")) { %>  
							<a href="javascript:goReserva('<%=userPO.getCusNum().trim()%>','<%=inqBasic.getE02DLCRF1().trim()%>')"><img id="milagrosoRates" src="<%=request.getContextPath()%>/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
							<% } %>       
				 		</td>
			 		</tr>	
					<% } %>       
			 		<% if(!inqBasic.getE02DLCPLF().isEmpty()|| !inqBasic.getE02DLCPLF().equals("")){ %>
			 		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Entidad de Fomento : </div></td>
						<td width="25%" colspan="3">
							<eibsinput:text name="inqBasic" property="E02DLCPLF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
							<eibsinput:text name="inqBasic" property="E02DSCPLF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
						</td>
					</tr>       
					<% } %>
					<% if(inqBasic.getE02DEACLF().equals("S")){ %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Entidad Avaladora : </div></td>
						<td width="25%">
							<eibsinput:text name="inqBasic" property="E02DLCCAV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" readonly="true" />
							<eibsinput:text name="inqBasic" property="E02DSCCAV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
						</td>
						<td nowrap width="25%" ></td>
						<td nowrap width="25%" ></td>
					</tr>
			 		<%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Concurso de Acreedores :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DLCCAC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
							<eibsinput:text name="inqBasic" property="E02DSCCAC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true" />
						</td>
						<td nowrap width="25%"><div align="right">Codigo Acuerdo Informal :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DLCCAI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
							<eibsinput:text name="inqBasic" property="E02DSCCAI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<% //Mexico G.A.T and C.A.T
	if(currUser.getE01INT().equals("04")){ %>  
	<H4>Información de Indicadores Financieros</H4>
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" > 
						<td nowrap width="25%"> 
							<div align="right" style="visibility: <%= inqBasic.getE02DEAACD().equals("10") ? "" : "hidden" %>">
								Costo Anual Total (C.A.T) :
							</div>
						</td>
						<td nowrap width="25%" > 
							<div align="left" style="visibility: <%= inqBasic.getE02DEAACD().equals("10") ? "" : "hidden" %>"> 
								<input type="text" name="E02DEAPCT1" size="9" maxlength="7" value="<%=   new BigDecimal(inqBasic.getE02DEAPCT1()).setScale(1, BigDecimal.ROUND_HALF_UP) %>" readonly>
								</div>
						</td> 
						<td nowrap width="25%"> 
							<div align="right" style="visibility: <%= (inqBasic.getE02DEAACD().equals("11") ||  inqBasic.getE02DEAACD().equals("12") || inqBasic.getE02DEAACD().equals("CD")) ? "" : "hidden" %>">
								Tasa Neta :
							</div>
						</td>
						<td nowrap width="32%" > 
							<div align="left" style="visibility: <%= (inqBasic.getE02DEAACD().equals("11") ||  inqBasic.getE02DEAACD().equals("12") || inqBasic.getE02DEAACD().equals("CD")) ? "" : "hidden" %>">
									<input type="text" name="E02DEARTZ" size="9" maxlength="7" value="<%= new BigDecimal(inqBasic.getE02DEARTZ()).setScale(4, BigDecimal.ROUND_HALF_UP)%>" readonly>
				</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<% } %>

<% if (!inqBasic.getE02DEACLF().equals("G")  && !inqBasic.getE02DEACLF().equals("V")) { %>
	<h4>Informaci&oacute;n Adicional</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Ciclo / Fecha Refinancia Int. :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEAXRC" size="3" maxlength="3" value="<%= inqBasic.getE02DEAXRC().trim()%>" >
							/ 
							<eibsinput:date name="inqBasic"  fn_month="E02DEAXRM" fn_day="E02DEAXRD" fn_year="E02DEAXRY" readonly="True" /> 
						</td>
						<td nowrap width="25%" ><div align="right">Refinanciar Hasta :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqBasic"  fn_month="E02DEAPCM" fn_day="E02DEAPCD" fn_year="E02DEAPCY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right">Monto Pago Final :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text name="inqBasic" property="E02DEABAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/> 
						</td>
						<td nowrap width="25%" ><div align="right">Fecha Pago Final :</div></td>
						<td nowrap  width="25%"> 
							<eibsinput:date name="inqBasic"  fn_month="E02DEABAM" fn_day="E02DEABAD" fn_year="E02DEABAY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right">Mes Excluido en Pago :</div></td>
						<td nowrap width="25%" > 
							<input type="text" readonly name="E02DEARPT" size="2" maxlength="2" value="<%= inqBasic.getE02DEARPT().trim()%>" >
						</td>
						<td nowrap width="25%" ><div align="right">Cobro de FECI :</div></td>
						<td nowrap width="25%"> 
							<input type="text" readonly name="E02DEATX2" size="2" maxlength="2" value="<%= inqBasic.getE02DEATX2().trim()%>" >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Calcula Cifras Decimales :</div></td>
						<td nowrap width="25%" > 
							<input type="radio" name="E02DEA2TC" value="Y" <%if (inqBasic.getE02DEA2TC().equals("Y")) out.print("checked"); %> disabled="disabled"> Si 
							<input type="radio" name="E02DEA2TC" value="N" <%if (!inqBasic.getE02DEA2TC().equals("Y")) out.print("checked"); %> disabled="disabled"> No
						</td>
						<td nowrap width="25%" ><div align="right">Ciclo/ Pr&oacute;x. Incr. Pago :</div></td>
						<td nowrap  width="25%">
							<input type="text" readonly name="E02DEAPCU" size="3" maxlength="3" value="<%= inqBasic.getE02DEAPCU().trim()%>" >
							/ 
							<eibsinput:date name="inqBasic"  fn_month="E02DEALSM" fn_day="E02DEALSD" fn_year="E02DEALSY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Abonos a Capital :</div></td>
						<td nowrap width="25%" > 
							<input type="text" readonly name="E02DLCABC" size="3" maxlength="3" value="<%= inqBasic.getE02DLCABC().trim()%>" >
							<input type="text" readonly name="E02DLCABF" size="2" maxlength="1" value="<%= inqBasic.getE02DLCABF().trim()%>" >
						</td>
						<td nowrap width="25%" ><div align="right">Ciclo/ Pr&oacute;x. Abono Capital :</div></td>
						<td nowrap  width="25%">
							<input type="text" readonly name="E02DLCABC" size="3" maxlength="3" value="<%= inqBasic.getE02DLCABC().trim()%>" >
							/ 
							<eibsinput:date name="inqBasic"  fn_month="E02DLCABM" fn_day="E02DLCABD" fn_year="E02DLCABY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Cuenta Contable a Debitar :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEAREB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
							<eibsinput:text name="inqBasic" property="E02DEARPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
							<eibsinput:text name="inqBasic" property="E02DEARPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							<eibsinput:text name="inqBasic" property="E02DEARGL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" readonly="true"/>
						</td>
						<td nowrap width="25%" ><div align="right">Cuenta Detalle a Debitar :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DEARAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
						</td> 	
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Codigo de Convenio :</div></td>
						<td nowrap width="25%">
							<input type="text" size="5" maxlength="4" name="E02DEACNV" readonly value="<%=inqBasic.getE02DEACNV().trim()%>">
							<input type="text" name="D02DEACNV" size="48" maxlength="45" readonly value="<%= inqBasic.getD02DEACNV().trim()%>">
						</td>
						<td nowrap width="25%" height="19"><div align="right">Autoriza Sobregiro :</div></td>
						<td nowrap width="25%" height="19">
							<input type="text" readonly name="E02DEAODA" size="2"  value="<%= inqBasic.getE02DEAODA().trim()%>"  maxlength="2">
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Pagaduria :</div></td>
						<td nowrap width="25%">
							<input type="text" size="4" maxlength="3" name="E02DEAPGD " readonly value="<%=inqBasic.getE02DEAPGD ().trim()%>">
							<input type="text" name="D02DEAPGD" size="48" maxlength="45" readonly value="<%= inqBasic.getD02DEAPGD().trim()%>">
						</td>
						<td nowrap width="25%" ><div align="right">Interes Incluidos en la Cuota : </div></td>
						<td nowrap width="25%"> 
							<input type="radio" name="E02DEAIIP" value="Y" <%if (inqBasic.getE02DEAIIP().equals("Y")) out.print("checked"); %> disabled="disabled"> Si 
							<input type="radio" name="E02DEAIIP" value="N" <%if (!inqBasic.getE02DEAIIP().equals("Y")) out.print("checked"); %> disabled="disabled"> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Novedad del Convenio :</div></td>
						<td nowrap width="25%">
							<input type="text" size="5" maxlength="4" name="E02DEAUC6" readonly value="<%=inqBasic.getE02DEAUC6().trim()%>">
							<input type="text" name="D02DEAUC6" size="48" maxlength="45" readonly value="<%= inqBasic.getD02DEAUC6().trim()%>">
						</td>
						<td nowrap width="25%" ><div align="right">Fecha Ultima Novedad : </div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqBasic"  fn_month="E02DEADXM" fn_day="E02DEADXD" fn_year="E02DEADXY" readonly="True" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Autoriza Pagos en Feriados :</div></td>
						<td nowrap width="25%">
							<input type="text" readonly name="E02DEAHFQ" size="1" maxlength="1" value="<%= inqBasic.getE02DEAHFQ().trim()%>">
							<input type="text" readonly name="D02DEAHFQ" size="60" maxlength="60" 
							value="<% if (inqBasic.getE02DEAHFQ().trim().equals("1")) out.print("Acepta Dias Feriados");
							else if (inqBasic.getE02DEAHFQ().trim().equals("2")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Anterior");
							else if (inqBasic.getE02DEAHFQ().trim().equals("3")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Siguiente");
							else out.print("");%>" >
						</td>
						<td nowrap width="25%">
							<div align="right">Forma de Pago :</div>
						</td>
						<td nowrap width="25%">
							<input type="text" readonly name="E02DEAPVI" size="1" maxlength="1" value="<%= inqBasic.getE02DEAPVI().trim()%>">
							<input type="text" readonly size="25" value=' <% if (inqBasic.getE02DEAPVI().equals("")) out.print("Caja");
																else if (inqBasic.getE02DEAPVI().equals("1")) out.print("Automatico");
																else if (inqBasic.getE02DEAPVI().equals("2")) out.print("Convenio");
																else if(inqBasic.getE02DEAPVI().equals("3")) out.print("M&uacute;ltiple Cuentas");
																else if(inqBasic.getE02DEAPVI().equals("4")) out.print("PAC Multibanco");
																else out.print(" ");%>'>
						</td>
					</tr>
					<% if (inqBasic.getE02DEAPVI().equals("3")) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Intento Cobro : </div></td>
						<td nowrap width="25%"> 
							<eibsinput:text property="E02DLCCMC" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" />
						</td>
						<td nowrap width="25%"></td>
						<td nowrap width="25%"></td>
					</tr>
					<% } %>
					<% if (inqBasic.getE02DEAPVI().equals("3")) { %>
					<tr>
						<td colspan="10">
							<table style="width: 100%">
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
								<tr  height="95%">    
									<td nowrap="nowrap" valign="top">      
										<div id="dataDiv1" style="height:106px; width: 100%; overflow:auto;"> 
											<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
												<% for (int i=1;i<10;i++) { %>
												<tr id="trclear"> 
													<td nowrap width="15%" align="center">
														<%= i %>
														<input type=text name="<%="E02PGACC"+i%>" size="13" maxlength="12" value="<%=inqBasic.getFieldString("E02PGACC"+i) %>" readonly> 
													</td>
													<td nowrap width="50%" align="center">
														<input type=text name="<%="E02PGNME"+i%>" size="60" maxlength="60" value="<%=inqBasic.getFieldString("E02PGNME"+i) %>" readonly> 
													</td>
													<td nowrap width="10%" align="center">
														<input type=text name="<%="E02PGTYP"+i%>" size="5" maxlength="4" value="<%=inqBasic.getFieldString("E02PGTYP"+i) %>" readonly> 
													</td>
													<td nowrap width="10%" align="center">
														<input type=text name="<%="E02PGPRD"+i%>" size="5" maxlength="4" value="<%=inqBasic.getFieldString("E02PGPRD"+i) %>" readonly> 
													</td>
													<td nowrap width="15%" align="center">
														<input type=text name="<%="E02PGPER"+i%>" size="8" maxlength="7" value="<%=inqBasic.getFieldString("E02PGPER"+i) %>" readonly> 
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
					<% } %>           	
				</table>
			</td>
		</tr>
	</table>

	<h4>Impuestos </h4>
	<table class="tableinfo" >
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="15%" > 
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
							<div align="center"> 
								<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %>  
									FECI 
								<% } else if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) {%>
									ITE
								<% } %>
							 </div>     
						</td>
						<td nowrap width="10%" > 
							<div align="center"> </div>
						</td>
				</tr>        
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="15%" > 
							<div align="center"> </div>
						</td>
						<td nowrap width="10%"  > 
							<div align="center"> 
				<select id="E02DEATX1" name="E02DEATX1" disabled>
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(inqBasic.getE02DEATX1().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(inqBasic.getE02DEATX1().equals("0")) out.print("selected");%>> NO </option>
				</select>        
							</div>
						</td>
						<td nowrap width="10%"  > 
							<div align="center"> 
				<select id="E02DEATX2" name="E02DEATX2" disabled>
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(inqBasic.getE02DEATX2().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(inqBasic.getE02DEATX2().equals("0")) out.print("selected");%>> NO </option>
				</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
				<select id="E02DEATX3" name="E02DEATX3" disabled>
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(inqBasic.getE02DEATX3().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(inqBasic.getE02DEATX3().equals("0")) out.print("selected");%>> NO </option>
				</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA")) || currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %> 
				<select id="E02DEATX4" name="E02DEATX4" disabled>
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(inqBasic.getE02DEATX4().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(inqBasic.getE02DEATX4().equals("0")) out.print("selected");%>> NO </option>
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

	<h4>Prioridad de Pagos </h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" readonly name="E02DEAPP1" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPP1().trim()%>">
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" readonly name="E02DEAPP2" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPP2().trim()%>">
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<input type="text" readonly name="E02DEAPP3" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPP3().trim()%>">
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" readonly name="E02DEAPP4" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPP4().trim()%>">
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<input type="text" readonly name="E02DEAPP5" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPP5().trim()%>">
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" readonly name="E02DEAPP6" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPP6().trim()%>">
							</div>
						</td>
			 <%if(currUser.getE01INT().equals("07")){%> 
							<td nowrap width="12%"  > 
								<div align="center"> 
									<input type="text" readonly name="E02DEAPP7" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPP7().trim()%>">
								</div>
							</td>
				<% } %>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" readonly name="E02DEAPP8" size="2" maxlength="1" value="<%= inqBasic.getE02DEAPP8().trim()%>">
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="12%" > 
							<div align="center">Principal</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center">Intereses</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center">Mora</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center">Comisiones</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center">Impuestos</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center">Deducciones</div>
						</td>
			 <%if(currUser.getE01INT().equals("07")){%> 
							<td nowrap width="12%" > 
								<div align="center">FECI</div>
							</td>
				<% } %>
						<td nowrap width="12%" > 
							<div align="center">Cobranzas</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

<% if (!inqBasic.getE02DLCRES().equals("")) { %>
	<h4>Cobranza</h4> 
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Situaci&oacute;n de Cobranza :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DLCRES" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
							<eibsinput:text name="inqBasic" property="E02DSCRES" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
						</td>
						<td nowrap width="25%"><div align="right">Porcentaje Cobranza :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text name="inqBasic" property="E02DLCPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Usuario :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text name="inqBasic" property="E02DLCFCU" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_USER%>" readonly="true" />
							<eibsinput:text name="inqBasic" property="E02DSCFCU" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
						</td>
						<td nowrap width="25%"><div align="right">Calcula IVA :</div></td>
						<td nowrap width="25%" > 
							<input type="text" readonly name="E02DLCFL7" size="2"  value="<%= inqBasic.getE02DLCFL7().trim()%>"  maxlength="2">
						</td>
					</tr>	
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"> 
							<div align="right">Fecha Registro :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="inqBasic"  fn_month="E02DLCFCM" fn_day="E02DLCFCD" fn_year="E02DLCFCY" readonly="True" /> 
						</td>
						<td nowrap width="25%"> 
							<div align="right"></div>
						</td>
						<td nowrap width="25%" > 
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
 	<% } %>
	
	<% if (inqBasic.getE02FLGSBS().equals("Y")) { %>
	<H4>Subsidio</H4>
	<table  class="tableinfo" >
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Entidad : </div></td>
						<td nowrap width="75%" >
							<eibsinput:text name="inqBasic" property="E02DLCCFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" readonly="true" />
							<eibsinput:text name="inqBasic" property="E02DSCCFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Referencia Subsidio: </div></td>
						<td nowrap width="75%" >
							<eibsinput:text name="inqBasic" property="E02DLCNRS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="12" maxlength="12" readonly="true" />
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Terminaci&oacute;n Por : </div></td>
						<td nowrap width="25%"> 
							<select name="E02DLCFFS" disabled="disabled">
								<OPTION value=" " <% if (!(inqBasic.getE02DLCFFS().equals("1") ||inqBasic.getE02DLCFFS().equals("2")||inqBasic.getE02DLCFFS().equals("3")|| inqBasic.getE02DLCFFS().equals("4") || inqBasic.getE02DLCFFS().equals("5") || inqBasic.getE02DLCFFS().equals("6") || inqBasic.getE02DLCFFS().equals("7") || inqBasic.getE02DLCFFS().equals("8") ))  out.print("selected"); %>></OPTION>
								<OPTION value="1" <% if(inqBasic.getE02DLCFFS().equals("1")) out.print("selected");%>>Mora</OPTION>
								<OPTION value="2" <% if(inqBasic.getE02DLCFFS().equals("2")) out.print("selected");%>>Pago Anticipado</OPTION>
								<OPTION value="3" <% if(inqBasic.getE02DLCFFS().equals("3")) out.print("selected");%>>Cesion de Contrato</OPTION>
								<OPTION value="4" <% if(inqBasic.getE02DLCFFS().equals("4")) out.print("selected");%>>Reestructuracion</OPTION>
								<OPTION value="5" <% if(inqBasic.getE02DLCFFS().equals("5")) out.print("selected");%>>Aceleracion</OPTION>
								<OPTION value="6" <% if(inqBasic.getE02DLCFFS().equals("6")) out.print("selected");%>>Peticion Cliente</OPTION>
								<OPTION value="7" <% if(inqBasic.getE02DLCFFS().equals("7")) out.print("selected");%>>Fallecimiento Cliente</OPTION>
								<OPTION value="8" <% if(inqBasic.getE02DLCFFS().equals("8")) out.print("selected");%>>Acto Administrativo FONVIVIENDA</OPTION>
							</select>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Fecha de Expiraci&oacute;n : </div></td>
						<td nowrap width="75%" >
							<eibsinput:date name="inqBasic" fn_month="E02DLCFSM" fn_day="E02DLCFSD" fn_year="E02DLCFSY" readonly="true" />
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tasa del Cliente : </div></td>
						<td nowrap width="75%" >
							<eibsinput:text name="inqBasic" property="E02LNSRTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
						</td>
					</tr>           
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tasa Subsidio : </div></td>
						<td nowrap width="75%" >
							<eibsinput:text name="inqBasic" property="E02DLCRFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
						</td>
					</tr>           
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tasa Total del Prestamo : </div></td>
						<td nowrap width="75%" >
							<eibsinput:text name="inqBasic" property="E02TOTRTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tasa Efectiva Subsidio : </div></td>
						<td nowrap width="75%" >
							<eibsinput:text name="inqBasic" property="E02DLCRXS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
						</td>
					</tr>           
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Valor de la Vivienda : </div></td>
						<td nowrap width="75%" >
							<eibsinput:text name="inqBasic" property="E02DLCVVI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
						</td>
					</tr> 
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<table id="subsidio" align="center" style="border: 0px; display: table; height:100%; width: 100%;" >
					<tr height="5%"> 
						<td NOWRAP valign="top" width="100%">
							<table id="headTable" width="100%"> 
								<tr id="trdark"> 
									<th nowrap width="20%" align="center"></th>
									<th nowrap width="10%" align="center">INTERESES</th>
									<th nowrap width="10%" align="center">ACUMULADO</th>
									<th nowrap width="10%" align="center">PAGADO</th>
									<th nowrap width="10%" align="center">SALDO</th>
									<th nowrap width="20%" align="center"></th>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="6">       		
							<div id="dataDiv1" style="width: 100%; height:100px; overflow:auto;"> 
								<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
								<% String intType = "";
								   String aType = "";
								   String pType = "";
								   String sType = "";
								   for (int i=1;i<=3;i++) {
								     if (i==1) {
								       intType = "Cliente :";
								       aType = "E02CLIIAC";
								       pType = "E02CLIIPG";
								       sType = "E02CLIISL";
								     } else if(i==2) {
								       intType = "Subsidio :";
								       aType = "E02SBSIAC";
								       pType = "E02SBSIPG";
								       sType = "E02SBSISL";
								     } else if(i==3) {
								       intType = "Total :";
								       aType = "E02TOTIAC";
								       pType = "E02TOTIPG";
								       sType = "E02TOTISL";
								     } 
								%>
									<tr id="trclear"> 
										<td width="20%"></td>
										<td width="10%" align="right" style="font-weight: bold;"><font style="bold"><%=intType%></font></td>
										<td width="10%" align="center">
											<input type=text name="<%=aType%>" maxlength="10" size="12" value="<%=inqBasic.getFieldString(aType) %>" readonly style="text-align:right;"> 
										</td>
										<td width="10%" align="center">
											<input type=text name="<%=pType%>" maxlength="10" size="12" value="<%=inqBasic.getFieldString(pType) %>" readonly style="text-align:right;"> 
										</td>
										<td width="10%" align="center">
											<input type=text name="<%=sType%>" maxlength="10" size="12" value="<%=inqBasic.getFieldString(sType) %>" readonly style="text-align:right;"> 
										</td>
										<td width="20%"></td>
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
<% } %>
	
<% if (!inqBasic.getE02DLIREF().equals("")) { %>
	<h4>Contrato Swap</h4> 
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="30%"> 
							<div align="right">Número de Contrato Swap :</div>
						</td>
						<td nowrap width="70%"> 
							<eibsinput:text property="E02DLIREF" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" maxlength="20" size="21" readonly="true" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="30%"> 
							<div align="right">Valor Compensación Swap :</div>
						</td>
						<td nowrap width="70%"> 
							<eibsinput:text property="E02DLIDPM" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="30%"> 
							<div align="right">Monto Swap Acumulado :</div>
						</td>
						<td nowrap width="70%"> 
							<eibsinput:text property="E02DLILTD" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="30%"> 
							<div align="right">Monto Swap A&ntilde;o :</div>
						</td>
						<td nowrap width="70%"> 
							<eibsinput:text property="E02DLIYTD" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /> 
						</td>
					</tr>

					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="30%"> 
							<div align="right">Fecha Inicio Swap :</div>
						</td>
						<td nowrap width="70%"> 
							<eibsinput:date name="inqBasic"  fn_month="E02DLIUCM" fn_day="E02DLIUCD" fn_year="E02DLIUCY" readonly="true" /> 
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
 <% } %>
	
 <% if (!inqBasic.getE02DLCTFL().equals("")) { 
			String titdsc = "";
			if (inqBasic.getE02DLCTFL().equals("T")){
				titdsc = "Venta Cartera Administrada";
			}else if (inqBasic.getE02DLCTFL().equals("D")){
				titdsc = "Destitularizado";
			}else if (inqBasic.getE02DLCTFL().equals("V")){
				titdsc = "Venta Cartera No Administrada";
			}
	%>
	<h4>Venta de Cartera</h4> 
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="50%"> 
							<div align="right">Tipo de Venta :</div>
						</td>
						<td nowrap width="50%"> 
							<eibsinput:text property="E02DLCTFL" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" value="<%=titdsc%>" readonly="true" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="50%"> 
							<div align="right">Entidad Compradora :</div>
						</td>
						<td nowrap width="50%"> 
							<eibsinput:text property="E02DLCTCD" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" /> 
							<eibsinput:text property="E02DSCTCD" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="50%"> 
							<div align="right">Portafolio :</div>
						</td>
						<td nowrap width="50%"> 
							<eibsinput:text property="E02DLCTPF" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" /> 
							<eibsinput:text property="E02DSCTPF" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="50%"> 
							<div align="right">Universalidad :</div>
						</td>
						<td nowrap width="50%"> 
							<eibsinput:text property="E02DLCTUN" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" /> 
							<eibsinput:text property="E02DSCTUN" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" /> 
						</td>
					</tr>

					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="50%"> 
							<div align="right">Motivo :</div>
						</td>
						<td nowrap width="50%"> 
							<input type="text" readonly name="E02DLCTMT" size="1" maxlength="1" value="<%= inqBasic.getE02DLCTMT().trim()%>">
				<input type="text" readonly size="25"  value=' <% if (inqBasic.getE02DLCTMT().equals("1")) out.print("Normal");
																else if (inqBasic.getE02DLCTMT().equals("2")) out.print("Cesion");
																else if (inqBasic.getE02DLCTMT().equals("3")) out.print("Sustitucion");
																else if(inqBasic.getE02DLCTMT().equals("4")) out.print("Recompras");
																else if(inqBasic.getE02DLCTMT().equals("5")) out.print("Readquision");
																else out.print(" ");%>'>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="50%"> 
							<div align="right">Fecha Venta :</div>
						</td>
						<td nowrap width="50%"> 
							<eibsinput:date name="inqBasic"  fn_month="E02DLCTDM" fn_day="E02DLCTDD" fn_year="E02DLCTDY" readonly="true" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="50%"> 
							<div align="right">Usuario Venta :</div>
						</td>
						<td nowrap width="50%"> 
							<eibsinput:text property="E02DLCTUS" name="inqBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_USER%>" readonly="true" /> 
						</td>
					</tr>                    
				</table>
			</td>
		</tr>
	</table>
	<% } %>  
	
	<%--HTML LOADED INTO DIV THROUGH AJAX Call JSPAYMENT within page or ln-paymentplan.js --%>
	<div  id="planPago"></div>  
	
	<!-- Destino de Fondos -->
	<p align="center">&nbsp; </p>
	<% session.setAttribute("EMPDF","A"); %>
	<iframe id="ifrempdf" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1168?SCREEN=101&ACT=N&E01PDFCUN=<%=inqBasic.getE02DEACUN().trim()%>&E01PDFNUM=<%=inqBasic.getE02DEAOFN().trim()%>"></iframe>

	<!-- Desembolso -->
	<% session.setAttribute("EMPDS","A"); %>
	<iframe id="ifrempds" frameborder="0" scrolling="no" height="300" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=102&ACT=S&E02DSBCUN=<%=inqBasic.getE02DEACUN().trim()%>&E02DSBNUM=<%=inqBasic.getE02DEAOFN().trim()%>&prdCode=<%=inqBasic.getE02DEAPRO().trim()%>&E02DSBACC=<%=inqBasic.getE02DEAACC().trim()%>"></iframe>  

	<p align="center">&nbsp; </p>
	<% } %>
	</form>
</body>
</html>
						 