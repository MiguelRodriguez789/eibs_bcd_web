<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import = "datapro.eibs.master.*" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<html>
<head>
<title> Credilinea Basic Information for Inquiry,Maint,and Creation </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="RecData" class="datapro.eibs.beans.EPV015301Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

<%if(!RecData.getH01FLGWK1().equals("A")){ //Shows Menu if not from Approval
	userPO.setProdCode(RecData.getE01DEAPRO()); //Sets need Session attributes for othe servlets
	userPO.setAccNum(RecData.getE01DEAACC());
	userPO.setIdentifier(RecData.getE01DEAACC());
	userPO.setCusNum(RecData.getE01DEACUN());
	userPO.setCusName(RecData.getE01CUSNA1());
	userPO.setCurrency(RecData.getE01DEACCY());
	userPO.setAccOpt(RecData.getE01DEATYP());
	userPO.setHeader22("CreditLines");
	userPO.setPurpose("INQUIRY");
	userPO.setApplicationCode(RecData.getE01DEAACD());
	userPO.setType(RecData.getE01DEATYP());
	userPO.setSource("LOAN");
	userPO.setBank(RecData.getE01DEABNK());
	userPO.setOfficer(RecData.getE01DEAOFC() + " - " + RecData.getE01DSCOFC());	
%> 
	 builtNewMenu(cuplus_inq_opt);
	 initMenu();
<%}%>

 function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();
 }
 
 function reloadIFrame(name) {		// Esta funcion se llama desde los iframes
	if (isValidObject(document.getElementById(name))) {
		var iframe = document.getElementById(name);
		var source = iframe.src.replace("ACT=N", "ACT=S");;
		iframe.src = source;
	}
}
 

 </script>
</head>

<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">
	L&iacute;nea Cr&eacute;dito - <%=RecData.getE01DSCPRO()%>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cuplus_basic_information_approval.jsp, EPV0153"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0153" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
	<INPUT TYPE=HIDDEN NAME="E01DEAACD" id="E01DEAACD" VALUE="<%=RecData.getE01DEAACD()%>">
 
	<%int row = 0; %>
 <table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="15%" > 
							<div align="right"><b>Cliente :</b></div>
						</td>
						<td nowrap width="10%" > 
							<div align="left">
								<eibsinput:text property="E01DEACUN" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true" modified="F01DEACUN"/>
				</div>
						</td>
						<td nowrap width="10%" > 
							<div align="right"><b>Nombre :</b> </div>
						</td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01CUSNA1" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"> 
							<div align="right"><b>Tipo : </b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01DEATYP" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap width="15%"> 
							<div align="right"><b>Cuenta :</b></div>
						</td>
						<td nowrap width="10%"> 
							<div align="left"> 
								<input type="text" name="E01DEAACC" size="14" maxlength="12"  readonly value="<% if (RecData.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(RecData.getE01DEAACC().trim()); %>">
							</div>
						</td>
						<td nowrap width="10%"> 
							<div align="right"><b>Moneda : </b></div>
						</td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01DEACCY" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"> 
							<div align="right"><b>Producto : </b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01DEAPRO" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
 </table>
 
	<h4>Datos B&aacute;sicos de la Operaci&oacute;n </h4>
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Monto cupo credito :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEAOAM" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="TRUE"/>  
						</td>
						<td nowrap width="25%"><div align="right">Fecha de Apertura :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="RecData" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" readonly="true" modified="F01DEAODM;F01DEAODD;F01DEAODY"/> 
						</td>
					</tr>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Monto Utilizado :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEAPRI" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="TRUE"/>  
						</td>
						<td nowrap width="25%"><div align="right">T&eacute;rmino o Plazo :</div></td>
						<td nowrap width="25%"> 
							<input type="text" name="E01DEATRM" id="E01DEATRM" size="6" maxlength="5" value="<%= RecData.getE01DEATRM().trim()%>" readonly <% if (RecData.getF01DEATRM().equals("Y")) out.print("class=\"txtchanged\""); %> >
							<select name="E01DEATRC" disabled <% if (RecData.getF01DEATRC().equals("Y")) out.print("class=\"txtchanged\""); %> >
								<OPTION value=" " <% if (!(RecData.getE01DEATRC().equals("D") ||RecData.getE01DEATRC().equals("M")||RecData.getE01DEATRC().equals("Y"))) out.print("selected"); %>></OPTION>
								<OPTION value="D" <% if(RecData.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
								<OPTION value="M" <% if(RecData.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
								<OPTION value="Y" <% if(RecData.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
							</select>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Monto Diferido :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text property="E01DIFERI" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="TRUE"/>  
						</td>
						<td nowrap width="25%"><div align="right">Fecha de Vencimiento :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:date name="RecData"  fn_month="E01DEAMAM" fn_day="E01DEAMAD" fn_year="E01DEAMAY" required="True" readonly="true" modified="F01DEAMAM;F01DEAMAD;F01DEAMAY" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Saldo Disponible :</div></td>
						<td nowrap width="25%"> 
							<eibsinput:text property="E01DISPON" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="TRUE"/>  
						</td>
						<td nowrap width="25%" ><div align="right">Direcci&oacute;n  Correo :</div></td>
						<td nowrap width="25%" >
							<input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= RecData.getE01DEAMLA().trim()%>" readonly <%if (RecData.getF01DEAMLA().equals("Y")) out.print("class=\"txtchanged\""); %>>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Condici&oacute;n  Cr&eacute;dito :</div></td>
						<td width="25%" > 
							<input type="text" name="E01DEADLC" size="2" maxlength="1" readonly value="<%= RecData.getE01DEADLC().trim()%>" <% if (RecData.getF01DEADLC().equals("Y")) out.print("class=\"txtchanged\""); %> >
						</td> 
						<td nowrap width="25%" > 
							<div align="right">Tabla Tasa Flotante :</div>
						</td>
						<td nowrap> 
							<input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= RecData.getE01DEAFTB().trim()%>" readonly <% if (RecData.getF01DEAFTB().equals("Y")) out.print("class=\"txtchanged\""); %>>
							<select name="E01DEAFTY" disabled <% if (RecData.getF01DEAFTY().equals("Y")) out.print("class=\"txtchanged\""); %>> 
								<option value=" " <% if (!(RecData.getE01DEAFTY().equals("FP") ||RecData.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
								<option value="FP" <% if (RecData.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
								<option value="FS" <% if (RecData.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
							</select>
						</td>
					</tr>
					<%if(RecData.getE01FLGFLT().equals("2")){%>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap width="25%" ><div align="right">Manejo Puntos Adicional  :</div></td>
						<td nowrap width="25%" <% if (RecData.getF01DEAFLX().equals("2")) out.print("class=\"txtchanged\""); %> > 
							<select name="E01DEAFLX" disabled="disabled" >
								<OPTION value=" " <% if (!(RecData.getE01DEAFLX().equals("B") ||RecData.getE01DEAFLX().equals("E")||RecData.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
								<OPTION value="B" <% if(RecData.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
								<OPTION value="E" <% if(RecData.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
								<OPTION value="N" <% if(RecData.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
							</select>
						</td>
						<td nowrap width="25%" ><div align="right">Valor Tasa Adicional :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEARTX" name="RecData" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" modified="F01DEARTX" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Descripcion Tabla Flotante :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01FLTDSC" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
						</td>
						<td nowrap width="25%" ><div align="right">Tasa Flotante Base :</div></td>
						<td nowrap>
							<eibsinput:text property="E01FLTORG" name="RecData" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
						</td>
					</tr>
					<%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right">Per&iacute;odo Base :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEABAS" name="RecData" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" readonly="true" modified="F01DEABAS" />
						</td>
						<td nowrap width="25%" ><div align="right">Tasa Flotante :</div></td>
						<td nowrap>
							<eibsinput:text property="E01DEAFRT" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" modified="F01DEAFRT"/>  
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > <div align="right">Tasa Efectiva :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEASPR" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" modified="F01DEASPR"/>
						</td>
						<td nowrap width="25%" ><div align="right">Tasa Interes/Spread :</div></td>
						<td nowrap width="20%" > 
							<eibsinput:text property="E01DEARTE" name="RecData" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"  readonly="true" required="true" modified="F01DEARTE"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"><div align="right">Tasa/Cargo por Mora :</div></td>
						<td nowrap width="25%" > 
							<input type="text" class="txtright" name="E01DEAPEI" size="8" maxlength="7" value="<%= RecData.getE01DEAPEI().trim()%>" readonly <%if (RecData.getF01DEAPEI().equals("Y")) out.print("class=\"txtchanged\""); %> >
							<input type="text" name="E01DEAPIF" size="2" maxlength="1" value="<%= RecData.getE01DEAPIF().trim()%>" readonly <%if (RecData.getF01DEAPIF().equals("Y")) out.print("class=\"txtchanged\""); %> >
						</td>
						<td nowrap width="25%" ><div align="right">Tasa Definitiva :</div></td>
						<td nowrap width="20%" > 
							<eibsinput:text property="E01LNSRTE" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>        
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Ciclo Revisi&oacute;n de Tasa :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= RecData.getE01DEARRP().trim()%>" readonly <%if (RecData.getF01DEARRP().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha Revisi&oacute;n de Tasa :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:date name="RecData"  fn_month="E01DEARRM" fn_day="E01DEARRD" fn_year="E01DEARRY" readonly="true" modified="F01DEARRM;F01DEARRD;F01DEARRY" /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td align=right nowrap width="25%"><div align="right">Banco/Sucursal :</div></td>
						<td nowrap width="25%">
							<eibsinput:text property="E01DEABNK" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>"  readonly="true"/>
							<eibsinput:text property="E01DEABRN" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true" required="true"/>
					 	</td>   
						<td nowrap width="25%" ><div align="right">Numero Referencia :</div></td>
						<td nowrap width="25%" >
							<eibsinput:text property="E01DEAREF" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_REFERENCE %>"  readonly="true" modified="F01DEAREF"  /> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">L&iacute;nea de Cr&eacute;dito :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= RecData.getE01DEACMC().trim()%>" readonly <%if (RecData.getF01DEACMC().equals("Y")) out.print("class=\"txtchanged\""); %>>
							<input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= RecData.getE01DEACMN().trim()%>" readonly <%if (RecData.getF01DEACMN().equals("Y")) out.print("class=\"txtchanged\""); %>>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
						<td nowrap width="25%" ><div align="right">Centro de Costo :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEACCN" size="8" maxlength="8" value="<%= RecData.getE01DEACCN().trim()%>" readonly>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right"> Estado :</div></td>
						<td nowrap width="25%" > 
							<select name="E01DEAIDT" disabled <% if (RecData.getF01DEAIDT().equals("Y")) out.print("class=\"txtchanged\""); %>>
								<OPTION value=" " <% if (!(RecData.getE01DEAIDT().equals("1") ||RecData.getE01DEAIDT().equals("2")||RecData.getE01DEAIDT().equals("3")
											||RecData.getE01DEAIDT().equals("4") ||RecData.getE01DEAIDT().equals("5") ||RecData.getE01DEAIDT().equals("6")||RecData.getE01DEAIDT().equals("7"))) out.print("selected");;%>>Pendiente</OPTION>
								<OPTION value="1" <% if(RecData.getE01DEAIDT().equals("1")) out.print("selected");%>>Activo</OPTION>
								<OPTION value="2" <% if(RecData.getE01DEAIDT().equals("2")) out.print("selected");%>>Inactivo</OPTION>
								<OPTION value="3" <% if(RecData.getE01DEAIDT().equals("3")) out.print("selected");%>>Bloqueado</OPTION>
								<OPTION value="4" <% if(RecData.getE01DEAIDT().equals("4")) out.print("selected");%>>Bloqueo DEF</OPTION>
								<OPTION value="5" <% if(RecData.getE01DEAIDT().equals("5")) out.print("selected");%>>Cancelado</OPTION>
								<OPTION value="6" <% if(RecData.getE01DEAIDT().equals("6")) out.print("selected");%>>Cerrado</OPTION>
								<OPTION value="7" <% if(RecData.getE01DEAIDT().equals("7")) out.print("selected");%>>Bloqueo Manual</OPTION>
							</select>
						</td>
						<td nowrap width="25%" ><div align="right">Tabla de Parametros :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEATLN" size="3" maxlength="2" value="<%= RecData.getE01DEATLN().trim()%>" readonly <%if (RecData.getF01DEATLN().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">N&uacute;mero cuotas por Desembolso :</div></td>
						<td nowrap width="25%" >
							<input type="text" size="4" maxlength="3" name="E01DEAANT" value="<%=RecData.getE01DEAANT().trim()%>" readonly <% if (RecData.getF01DEAANT().equals("Y")) out.print("class=\"txtchanged\""); %>> 
						</td>
						<td nowrap width="25%" ><div align="right">Tabla de Cargos :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEAOFT" size="3" maxlength="2" value="<%= RecData.getE01DEAOFT().trim()%>" readonly <%if (RecData.getF01DEAOFT().equals("Y")) out.print("class=\"txtchanged\""); %>>
							<b>&nbsp; &nbsp; Personalizar</b>
							<a href="javascript: setComissionTable('true')"><img src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" height="19"><div align="right">Dia de Facturaci&oacute;n :</div></td>
						<td nowrap width="25%" height="19">
							<input type="text" size="3" maxlength="2" name="E01CLCFAC" value="<%=RecData.getE01CLCFAC().trim()%>" readonly <% if (RecData.getF01CLCFAC().equals("Y")) out.print("class=\"txtchanged\""); %>> 
						</td>
						<td nowrap width="25%" height="19"><div align="right">Dia de Pago :</div></td>
						<td nowrap width="27%" height="19"> 
							<input type="text" size="3" maxlength="2" name="E01CLCPAG" value="<%=RecData.getE01CLCPAG().trim()%>" readonly <% if (RecData.getF01CLCPAG().equals("Y")) out.print("class=\"txtchanged\""); %>> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Ciclo Pago de Intereses :</div></td>
						<td nowrap width="20%" > 
							<input type="text" size="4" maxlength="3" name="E01DEAIPD" value="<%= RecData.getE01DEAIPD().trim()%>" readonly <% if (RecData.getF01DEAIPD().equals("Y")) out.print("class=\"txtchanged\""); %>> 
						</td>
						<td nowrap width="25%" ><div align="right">Pr&oacute;xima Fecha de Pago :</div></td>
						<td nowrap width="20%" > 
							<eibsinput:date name="RecData"  fn_month="E01DEARDM" fn_day="E01DEARDD" fn_year="E01DEARDY" readonly="true" required="false" modified="F01DEARDD;F01DEARDM;F01DEARDY"/> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Ciclo Pago de Capital :</div></td>
						<td nowrap width="20%" > 
							<input type="text" name="E01DEAPPD" size="4" maxlength="3" value="<%= RecData.getE01DEAPPD().trim()%>" readonly <% if (RecData.getF01DEAPPD().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" ><div align="right">Pr&oacute;xima Fecha de Pago :</div></td>
						<td nowrap width="20%" > 
							<eibsinput:date name="RecData" fn_month="E01DEAHEM" fn_day="E01DEAHED" fn_year="E01DEAHEY" readonly="true" required="TRUE" modified="F01DEAHEM;F01DEAHED;F01DEAHEY"/> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Permite Pagos en Feriados : </div></td>
						<td nowrap width="25%" > 
							<div align="left">
								<input type="text" name="E01DEAHFQ" size="60" maxlength="60" readonly
									value="<% if (RecData.getE01DEAHFQ().equals("1")) out.print("Acepta Dias Feriados");
									else if (RecData.getE01DEAHFQ().equals("2")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Anterior");
									else if (RecData.getE01DEAHFQ().equals("3")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Siguiente");
									else out.print("");%>" <% if (RecData.getF01DEAHFQ().equals("Y")) out.print("class=\"txtchanged\""); %>>              
								<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
							</div>              
						</td>
						<td nowrap width="25%" ><div align="right">Cuenta de Pago :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEARAC" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true" modified="F01DEARAC"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Cuenta de Desembolso :</div></td>
						<td nowrap width="25%" > 
							<eibsinput:text property="E01DEAOAC" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true" modified="F01DEAOAC"/>
						</td>
						<td nowrap width="25%" ><div align="right">Forma de Desembolso :</div></td>
						<td nowrap width="25%"  > 
							<select name="E01DEAOPT" disabled <% if (RecData.getF01DEAOPT().equals("Y")) out.print("class=\"txtchanged\""); %>>
								<OPTION value=" " <% if (!(RecData.getE01DEAOPT().equals("1") ||RecData.getE01DEAOPT().equals("2"))) out.print("selected"); %>></OPTION>
								<OPTION value="1" <% if(RecData.getE01DEAOPT().equals("1")) out.print("selected");%>>Credito unico</OPTION>
								<OPTION value="2" <% if(RecData.getE01DEAOPT().equals("2")) out.print("selected");%>>Multiple credito</OPTION>
							</select>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Fuente de Recurso : </div></td>
						<td nowrap width="25%" >
							<eibsinput:cnofc name="RecData" flag="RS" property="E01DEAUC7" fn_code="E01DEAUC7" fn_description="" readonly="true" />
						</td>
						<td nowrap width="25%" ><div align="right">N&uacute;mero de Pagar&eacute; : </div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEAIVC" size="14" maxlength="12" value="<%= RecData.getE01DEAIVC().trim()%>" readonly >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Fecha de Suscripci&oacute;n : </div></td>
						<td nowrap width="25%" >
							<eibsinput:date name="RecData" fn_year="E01DEAPSY" fn_month="E01DEAPSM" fn_day="E01DEAPSD" readonly="true" />
						</td>
						<td nowrap width="25%" ><div align="right"></div></td>
						<td nowrap width="25%" > 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" id="Renovacion" ><div align="right">Dias de Mora para Bloqueo Automatico :</div></td>
						<td nowrap width="25%"  id="RenovacionDias"> 
							<eibsinput:text name="RecData" property="E01DEAPRR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS%>" readonly="true" modified="F01DEAPRR"/>
						</td>
						<td nowrap width="25%" ><div align="right">Monto M&iacute;nimo de Pago :</div></td>
						<td nowrap width="25%"  id="RenovacionDias"> 
							<eibsinput:text name="RecData" property="E01DEAMPA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" modified="F01DEAMPA"/>
					 </td>
					</tr>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Renovacion Automatica :</div></td>
						<td nowrap width="25%" >
							<input type="hidden" name="E01DEAROC" value="<%= RecData.getE01DEAROC()%>" <% if (RecData.getF01DEAROC().equals("Y")) out.print("class=\"txtchanged\""); %> >
							<input type="radio" name="CE01DEAROC" value="Y" onClick="document.forms[0].E01DEAROC.value='Y'"
							<%if(RecData.getE01DEAROC().equals("Y")) out.print("checked");%> disabled  <% if (RecData.getF01DEAROC().equals("Y")) out.print("class=\"txtchanged\""); %>>
							S&iacute; 
							<input type="radio" name="CE01DEAROC" value="N" onClick="document.forms[0].E01DEAROC.value='N'" 
							<%if(RecData.getE01DEAROC().equals("N")) out.print("checked");%>  disabled <% if (RecData.getF01DEAROC().equals("Y")) out.print("class=\"txtchanged\""); %>>
							No <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" width="16" height="20"  >
						</td>
						<%if(RecData.getE01DEAROC().equals("Y")){%>
						<td nowrap width="25%" id="Renovacion" ><div align="right">Meses de Plazo para Renovaci&oacute;n :</div></td>
						<td nowrap width="25%"  id="RenovacionDias"> 
							<eibsinput:text name="RecData" property="E01DEAROY" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS%>" readonly="true" modified="F01DEAROY"/>
					 	</td>
					 	<%}else{%>
						<td nowrap width="25%" id="Renovacion" ></td>
						<td nowrap width="25%"  id="RenovacionDias"></td>
					 	<%}%>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Per&iacute;odo de Gracia :</div></td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEAGPD" size="3" maxlength="2" value="<%= RecData.getE01DEAGPD().trim()%>" readonly <% if (RecData.getF01DEAGPD().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" ><div align="right">Nro Cambios de Fecha :</div></td>
						<td nowrap width="27%" > 
							<input type="text" name="E01DEACRR" size="3" maxlength="2" value="<%= RecData.getE01DEACRR().trim()%>" readonly >
						</td>
					</tr>
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
						</div>            </td>
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
				<select id="E01DEATX1" name="E01DEATX1" disabled="disabled" <% if (RecData.getF01DEATX1().equals("Y")) out.print("class=\"txtchanged\""); %>>
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(RecData.getE01DEATX1().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(RecData.getE01DEATX1().equals("0")) out.print("selected");%>> NO </option>
				</select>        
							</div>
						</td>
						<td nowrap width="10%"  > 
							<div align="center"> 
				<select id="E01DEATX2" name="E01DEATX2" disabled="disabled" <% if (RecData.getF01DEATX2().equals("Y")) out.print("class=\"txtchanged\""); %>>
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(RecData.getE01DEATX2().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(RecData.getE01DEATX2().equals("0")) out.print("selected");%>> NO </option>
				</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
				<select id="E01DEATX3" name="E01DEATX3" disabled="disabled" <% if (RecData.getF01DEATX3().equals("Y")) out.print("class=\"txtchanged\""); %>>
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(RecData.getE01DEATX3().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(RecData.getE01DEATX3().equals("0")) out.print("selected");%>> NO </option>
				</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
			<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA")) || currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %> 
				<select id="E01DEATX4" name="E01DEATX4" disabled="disabled" <% if (RecData.getF01DEATX4().equals("Y")) out.print("class=\"txtchanged\""); %>>
						<option value=" " selected> &nbsp; </option>
						<option value="1" <% if(RecData.getE01DEATX4().equals("1")) out.print("selected");%>> SI </option>
						<option value="0" <% if(RecData.getE01DEATX4().equals("0")) out.print("selected");%>> NO </option>
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


	<br>
	<!-- Seguros Financiados -->
	<% session.setAttribute("EMPSG","A"); %>
	<iframe frameborder="0" scrolling="no" style="height: 200px;" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&appType=CP&E01PSGCUN=<%=RecData.getE01DEACUN()%>&E01PSGNUM=<%=RecData.getE01DEAOFN()%>"></iframe>  

	<br>
	<!-- Cargos Adicionales -->
	<% session.setAttribute("EMPCA","A"); %>
	<iframe frameborder="0" scrolling="no" style="height: 200px;" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&appType=CP&E01PVHCUN=<%=RecData.getE01DEACUN()%>&E01PVHNUM=<%=RecData.getE01DEAOFN() %>"> </iframe>  

	<h4>Garantias</h4>
	<TABLE id="mainTable" class="tableinfo" style="height:106px;">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="98%">
					<tr id="trdark">
						<th nowrap width="16%" align="center">Cuenta</th>
						<th nowrap width="7%"  align="center">Prod</th>
						<th nowrap width="30%" align="center">Nombre</th>
						<th nowrap width="7%"  align="center">Moneda</th>
						<th nowrap width="20%" align="center">Monto Garantizado</th>
						<th nowrap width="20%" align="center">Valor del bien</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr  height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:106px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<% for (int i=1;i<10;i++) { %> 
						<tr id="trclear"> 
							<td nowrap width="16%" align="center"> 
								<%= i %>
								<input type=text name="<%="E01CLACB"+i%>" size="13" maxlength="12" value="<%=RecData.getFieldString("E01CLACB"+i) %>" class="context-menu-help garantiaInq" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E01DEABNK.value,'',document.forms[0].E01DEACUN.value,'','91')" readonly >      
							</td>
							<td nowrap width="7%"  align="center"> 
								<input type="text" name="<%="E01CLTYB"+i %>" size="5" maxlength="4" value="<%=RecData.getFieldString("E01CLTYB"+i) %>" readonly>
							</td>
							<td nowrap width="30%" align="center"> 
								<input type="text" name="<%="E01CLDSC"+i %>" size="46" maxlength="45" value="<%=RecData.getFieldString("E01CLDSC"+i) %>" readonly> 
							</td>
							<td nowrap width="7%"  align="center"> 
								<input type="text" name="<%="E01CLCCY"+i %>" size="4" maxlength="3" value="<%=RecData.getFieldString("E01CLCCY"+i) %>" readonly>  
							</td>
							<td nowrap width="20%" align="center"> 
								<input type="text" class="txtright" name="<%="E01CLAMT"+i %>" size="19" maxlength="18" value="<%=RecData.getFieldString("E01CLAMT"+i) %>" onclick="this.select();" onkeypress="enterDecimal(event, 2)" onblur=" this.value = formatCCY(this.value);" readonly >  
							</td>
							<td nowrap width="20%" align="center"> 
								<input type="text" class="txtright" name="<%="E01CLBOP"+i %>" size="19" maxlength="18" value="<%=RecData.getFieldString("E01CLBOP"+i) %>" readonly > 
							</td>
						</tr> 
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>


	<%if (!userPO.getHeader1().equals("APPROVAL")&& !userPO.getHeader1().equals("INQMENU")) {%>
			<div align="center"> 
			 <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(200);">
		</div>  
		<%}if(userPO.getHeader1().equals("INQMENU")){ %>
			<div align="center"> 
					 <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(150);">
		</div>
		<%}%>

 </form>
</body>
<script type="text/javascript">

function setComissionTable(readOnly) {
	var notMissingInfo = true;
	var cun = getElement('E01DEACUN').value;
	var apcd = getElement('E01DEAACD').value;
	var bank = getElement('E01DEABNK').value;
	var type = getElement('E01DEATYP').value;
	var table = getElement('E01DEAOFT').value;
	var alertMessage = "Por Favor Ingresse : ";
	
	if(readOnly === "true" ){	
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1200&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table+"&readOnly="+readOnly;
	}else{
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table;
		
		if(trim(bank) == "") {
			alert(alertMessage + "Banco")
			notMissingInfo = false;			
		}
		
		if(trim(table) == "") {
			alert(alertMessage + "Tabla de Cargos")
			notMissingInfo = false;			
		}		
	}
	
	if(notMissingInfo){			
		CenterWindow(page, 1200, 1000, 2);
	}	
}

</script>

</HTML>



