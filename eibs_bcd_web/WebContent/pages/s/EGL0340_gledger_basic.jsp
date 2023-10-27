<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Contabilidad</title>

<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>
<%@ page import = "datapro.eibs.master.Util" %>
<jsp:useBean id="gLedger" class="datapro.eibs.beans.EGL034001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<H3 align="center">
<% if (userPO.getPurpose().equals("NEW")) out.print("Apertura al Maestro de Contabilidad");
   else out.print("Mantenimiento al Maestro de Contabilidad"); %>
   <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="gledger_basic.jsp, EGL0340"></H3>
	
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340">
<INPUT TYPE=HIDDEN NAME="SCREEN" value="3"> 
<INPUT TYPE=HIDDEN NAME="E01GLMFR1" value="<%= gLedger.getE01GLMFR1().trim()%>">
<INPUT TYPE=HIDDEN NAME="E01GLMACD" value="<%= gLedger.getE01GLMACD().trim()%>">
<INPUT TYPE=HIDDEN NAME="E01GLMFR3" value="<%= gLedger.getE01GLMFR3().trim()%>">
<INPUT TYPE=HIDDEN NAME="E01GLMRIN" value="<%= gLedger.getE01GLMRIN().trim()%>">
<INPUT TYPE=HIDDEN NAME="E01GLMREX" value="<%= gLedger.getE01GLMREX().trim()%>">
<INPUT TYPE=HIDDEN NAME="E01GLMFRB" VALUE="<%= gLedger.getE01GLMFRB()%>">


 <% int row = 0;%>
<H4>Datos B&aacute;sicos</H4>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Numero de Cuenta Contable :</div>
				</td>
				<td nowrap width="30%">
					<eibsinput:text property="E01GLMBNK" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" />
					<eibsinput:text property="E01GLMCCY" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true" />
					<eibsinput:text property="E01GLMGLN" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" />
				</td>
				<td nowrap width="20%"></td>
				<td nowrap width="30%"></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%"> 
                    <div align="right">Estado Cuenta :</div>
                </td>
                  <td nowrap width="30%">
                    <INPUT type="radio" name="rbestado" value="1" <% if (gLedger.getE01GLMFR1().equals("1") || gLedger.getE01GLMFR1().equals("")) out.print("checked");%> onclick="chgesta(this.value)">Activo
                    <INPUT type="radio" name="rbestado" value="2" <% if (gLedger.getE01GLMFR1().equals("2")) out.print("checked");%> onclick="chgesta(this.value)">Inactivo
                    <INPUT type="radio" name="rbestado" value="3" <% if (gLedger.getE01GLMFR1().equals("3")) out.print("checked");%> onclick="chgesta(this.value)">Cerrado
               </td>
               <td nowrap width="20%"></td>
			   <td nowrap width="30%"></td>
            </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%"> 
				    <div align="right">Descripción de la Cuenta :</div>
				</td>
				<td nowrap width="30%"> 
					<eibsinput:text property="E01GLMDSC" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" />
				</td>
				<td nowrap width="20%"></td>
				<td nowrap width="30%"></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
				<div align="right">Tipo de Producto :</div>
				</td>
				<td nowrap width="30%">
                	 <eibsinput:cnofc property="E01GLMATY" name="gLedger" flag="04" fn_code="E01GLMATY" />
				</td>
				<td nowrap width="20%">
				<div align="right">Clase de la Cuenta :</div>
				</td>
				<td nowrap width="30%">
                	 <eibsinput:cnofc property="E01GLMCLS" name="gLedger" flag="01" fn_code="E01GLMCLS" size="3" maxlength="2"/>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Requiere Centro de Costo :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" name="E01GLMCCN" value="Y" <%if(gLedger.getE01GLMCCN().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" name="E01GLMCCN" value="N" <%if(!gLedger.getE01GLMCCN().equals("Y")) out.print("checked");%>> No
				</td>
				<td nowrap width="20%">
					<div align="right">Cuenta Reconciliable :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" name="E01GLMRCL" value="Y" <%if(gLedger.getE01GLMRCL().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" name="E01GLMRCL" value="N" <%if(!gLedger.getE01GLMRCL().equals("Y")) out.print("checked");%>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Estado de Cuenta Diario :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" name="E01GLMDST" value="1" <%if(gLedger.getE01GLMDST().equals("1")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" name="E01GLMDST" value="N" <%if(!gLedger.getE01GLMDST().equals("1")) out.print("checked");%>> No
				</td>
				<td nowrap width="20%">
					<div align="right">Nivel de Libro Diario :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" name="E01GLMRMA" value="D" <%if(gLedger.getE01GLMRMA().equals("D")) out.print("checked");%>> Detalle 
					<INPUT type="radio" name="E01GLMRMA" value="T" <%if(!gLedger.getE01GLMRMA().equals("D")) out.print("checked");%>> Total
				</td>
			</tr>
			<%if(currUser.getE01INT().equals("04")){%>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<td nowrap width="20%">
						<div align="right">Codigo Agrupador SAT :</div>
					</td>
					<td nowrap width="30%">
						<input type="text" name="E01GLMFRD" size="4" maxlength="3" value="<%=gLedger.getE01GLMFRD()%>" onkeypress="enterInteger(event)"> <b>.</b>
						<input type="text" name="E01GLMFRE" size="3" maxlength="2" value="<%=gLedger.getE01GLMFRE()%>" onkeypress="enterInteger(event)">
					</td>
					<td nowrap width="20%">
						<div align="right">Nivel del SAT :</div>
					</td>
					<td nowrap width="30%">
						<input type="text" name="E01GLMFRF" size="2" maxlength="1" value="<%= gLedger.getE01GLMFRF()%>" onkeypress="enterInteger(event)">
					</td>
				</tr>
			<% } %>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Cuenta I.B.F :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" name="E01GLMIBF" value="IB" <%if(gLedger.getE01GLMRMA().equals("IB")) out.print("checked");%>> Sí 
					<INPUT type="radio" name="E01GLMIBF" value="" 	<%if(!gLedger.getE01GLMRMA().equals("IB")) out.print("checked");%>> No
				</td>
				<td nowrap width="20%">
					<div align="right">Cuenta de Tesorería :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" name="E01GLMMEF" value="Y" <%if(gLedger.getE01GLMMEF().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" name="E01GLMMEF" value="N" <%if(!gLedger.getE01GLMMEF().equals("Y")) out.print("checked");%>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Reconciliación/Clientes :</div>
				</td>
				<td nowrap width="30%">
					<SELECT name="E01GLMCPF">
						<OPTION value=" " <%if (!(gLedger.getE01GLMCPF().equals("1") ||gLedger.getE01GLMCPF().equals("2")||gLedger.getE01GLMCPF().equals("3")||gLedger.getE01GLMCPF().equals("4")||gLedger.getE01GLMCPF().equals("5")||gLedger.getE01GLMCPF().equals("6")||gLedger.getE01GLMCPF().equals("7")||gLedger.getE01GLMCPF().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="1" <%if (gLedger.getE01GLMCPF().equals("1")) out.print("selected"); %>>Reconciliación Bancaria</OPTION>						
						<OPTION value="2" <%if (gLedger.getE01GLMCPF().equals("2")) out.print("selected"); %>>Referencia</OPTION>
						<OPTION value="3" <%if (gLedger.getE01GLMCPF().equals("3")) out.print("selected"); %>>Nro Cliente</OPTION>
						<OPTION value="4" <%if (gLedger.getE01GLMCPF().equals("4")) out.print("selected"); %>>Referencia-Nro Cliente</OPTION>
						<OPTION value="5" <%if (gLedger.getE01GLMCPF().equals("5")) out.print("selected"); %>>Referencia-Fecha Referencia</OPTION>
						<OPTION value="6" <%if (gLedger.getE01GLMCPF().equals("6")) out.print("selected"); %>>Referencia-Nro Cliente-Fecha Referencia</OPTION>
						<OPTION value="7" <%if (gLedger.getE01GLMCPF().equals("7")) out.print("selected"); %>>Nro Cliente-Fecha Referencia</OPTION>
 						<OPTION value="N" <%if (gLedger.getE01GLMCPF().equals("N")) out.print("selected"); %>>Ninguna</OPTION>					</SELECT>
				</td>
				<td nowrap width="20%">
					<div align="right">Control de Previsiones :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" name="E01GLMPRV" value="Y" <%if(gLedger.getE01GLMPRV().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" name="E01GLMPRV" value="N" <%if(!gLedger.getE01GLMPRV().equals("Y")) out.print("checked");%>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Validar Contrato para Reconciliación:</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" name="E01GLMSUM" value="Y" <%if(gLedger.getE01GLMSUM().equals("Y")) out.print("checked");%>> Sí 
					<INPUT type="radio" name="E01GLMSUM" value="N" 	<%if(!gLedger.getE01GLMSUM().equals("Y")) out.print("checked");%>> No
				</td>
				<td nowrap width="20%">
					
				</td>
				  <td nowrap width="20%">
					
				</td>
				<td nowrap width="30%">
					
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Cuenta Reajuste :</div>
				</td>
				<td nowrap width="30%">
					<SELECT name="E01GLMREV">
						<OPTION value="N" <%if (!(gLedger.getE01GLMREV().equals("1") ||gLedger.getE01GLMREV().equals("2")||gLedger.getE01GLMREV().equals("3") ||gLedger.getE01GLMREV().equals("4")||gLedger.getE01GLMREV().equals("5")||gLedger.getE01GLMREV().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="1" <%if (gLedger.getE01GLMREV().equals("1")) out.print("selected"); %>>Mant./Valor Nicaragua</OPTION>
						<%if(currUser.getE01INT().equals("05")){%>
						<OPTION value="2" <%if (gLedger.getE01GLMREV().equals("2")) out.print("selected"); %>>Reajuste UVR</OPTION>
						<% } else { %>
						<OPTION value="2" <%if (gLedger.getE01GLMREV().equals("2")) out.print("selected"); %>>Reajuste UF/Chile</OPTION>
						<% }%>
						<OPTION value="3" <%if (gLedger.getE01GLMREV().equals("3")) out.print("selected"); %>>Reajuste IPV/Chile</OPTION>
						<OPTION value="4" <%if (gLedger.getE01GLMREV().equals("4")) out.print("selected"); %>>Reajuste USD/Chile</OPTION>
						<OPTION value="5" <%if (gLedger.getE01GLMREV().equals("5")) out.print("selected"); %>>Valor Ajuste/PERU</OPTION>
						<OPTION value="N" <%if (gLedger.getE01GLMREV().equals("N")) out.print("selected"); %>>No Aplica</OPTION>
					</SELECT>
				</td>
				<td nowrap width="20%">
					<div align="right">Sensibilidad de Tasas :</div>
				</td>
				<td nowrap width="30%" >
					<input type="text" name="E01GLMFR6" size="6" maxlength="6" value="<%= gLedger.getE01GLMFR6().trim()%>">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Cuenta Contrapartida :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMXOF" size="17" maxlength="16" value="<%= gLedger.getE01GLMXOF()%>" onkeypress="enterInteger(event)"> 
					<a href="javascript:GetLedger('E01GLMXOF',document.forms[0].E01GLMBNK.value,document.forms[0].E01GLMCCY.value,'')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
				</td>
				<td nowrap width="20%">
					<div align="right">Nivel de Contabilización :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMACL" size="2" maxlength="1" value="<%= gLedger.getE01GLMACL().trim()%>" onkeypress="enterInteger(event)">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">

				<td nowrap width="20%">
					<div align="right">Numero Cuenta Presupuesto :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMBUN" size="17" maxlength="16" value="<%= gLedger.getE01GLMBUN()%>" onkeypress="enterInteger(event)"> 
					<a href="javascript:GetBudget('E01GLMBUN',document.forms[0].E01GLMBNK.value,document.forms[0].E01GLMCCY.value)">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
				</td>
				<td nowrap width="20%">
					<div align="right">Grupo Presupuesto Promedio :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMFL1" size="2" maxlength="1" value="<%= gLedger.getE01GLMFL1().trim()%>">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Cuenta Equivalente :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMHOA" size="21" maxlength="20" value="<%= gLedger.getE01GLMHOA()%>">
				</td>
				<td nowrap width="20%">
					<div align="right">Requiere Origen y Destino :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" name="E01GLMFL2" value="Y" <%if(gLedger.getE01GLMFL2().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" name="E01GLMFL2" value="N" <%if(!gLedger.getE01GLMFL2().equals("Y")) out.print("checked");%>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Descripción Equivalente :</div>
				</td>
				<td nowrap width="30%">
					<eibsinput:text property="E01GLMHDS" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
				</td>
				<td nowrap width="20%">
					<div align="right">Códigos de Usuario :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMCIC" size="4" maxlength="4" value="<%= gLedger.getE01GLMCIC().trim()%>">
						<a href="javascript:GetCodeCNOFC('E01GLMCIC','21')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 	 
				</td>
			</tr>
			
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
 				<td nowrap width="20%">
					<div align="right">Cuenta de Impuestos:</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" name="E01GLMFR5" value="Y" <%if(gLedger.getE01GLMFR5().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" name="E01GLMFR5" value="N" <%if(!gLedger.getE01GLMFR5().equals("Y")) out.print("checked");%>> No
				</td>
				<td nowrap width="20%">
					<div align="right">Oficina Centralizadora :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMCBR" size="5" maxlength="5" value="<%= gLedger.getE01GLMCBR().trim()%>" onchange="chgvali()">
					<a href="javascript:GetBranch('E01GLMCBR','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
			
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
 				<td nowrap width="20%">
					<div align="right">Dia Traslado (0 Todos los dias) :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="DIATRASLADO" size="2" maxlength="2" onkeypress=" enterInteger(event)" value="<%= gLedger.getE01GLMFR3().length() > 2 ? gLedger.getE01GLMFR3().substring(1,3) : "" %>"> 
				</td>
				<td nowrap width="20%">
					<div align="right">Saldos a tomar (D)iario - (M)ensual:</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="SALDOS" size="1" maxlength="1" value="<%= gLedger.getE01GLMFR3().length() > 0 ? gLedger.getE01GLMFR3().substring(0,1) : "" %>">
				</td>
			</tr>




<%--
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">

				<td nowrap width="20%">
					<div align="right">Cuenta de Encaje :</div>  
				</td>
				<td nowrap width="30%">
				    <input type="text" name="E01GLMFR2" size="5" maxlength="5" value="<%= gLedger.getE01GLMFR2().trim()%>"> 
						<a href="javascript:GetCodeCNOFC('E01GLMFR2','ES')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 	
				</td>
				<td nowrap width="20%">
					<div align="right">Temporalidad de Cartera :</div>
				</td>
				<td nowrap width="30%">
				    <input type="text" name="E01GLMFR7" size="6" maxlength="6" value="<%= gLedger.getE01GLMFR7().trim()%>"> 
						<a href="javascript:GetCodeCNOFC('E01GLMFR7','OT')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 	
				</td>
			</tr>

			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Posición de Apalancamiento :</div>
				</td>
  			   <td nowrap width="30%">
					<SELECT name="E01GLMFRC">
						<OPTION value=" " <%if (!(gLedger.getE01GLMFRC().equals("1") ||gLedger.getE01GLMFRC().equals("2")||gLedger.getE01GLMFRC().equals("3")||gLedger.getE01GLMFRC().equals("4")||gLedger.getE01GLMFRC().equals("5")||gLedger.getE01GLMFRC().equals("6")||gLedger.getE01GLMFRC().equals("7")||gLedger.getE01GLMFRC().equals("8"))) out.print("selected"); %>></OPTION>
						<OPTION value="1" <%if (gLedger.getE01GLMFRC().equals("1")) out.print("selected"); %>>Activo M/E</OPTION>
						<OPTION value="2" <%if (gLedger.getE01GLMFRC().equals("2")) out.print("selected"); %>>Activo M/E Posicion.Bruta</OPTION>
						<OPTION value="3" <%if (gLedger.getE01GLMFRC().equals("3")) out.print("selected"); %>>Otros Derechos M/E</OPTION>
						<OPTION value="4" <%if (gLedger.getE01GLMFRC().equals("4")) out.print("selected"); %>>Otros Derechos M/E P.Bruta</OPTION>
						<OPTION value="5" <%if (gLedger.getE01GLMFRC().equals("5")) out.print("selected"); %>>Pasivo M/E</OPTION>
                        <OPTION value="6" <%if (gLedger.getE01GLMFRC().equals("6")) out.print("selected"); %>>Pasivos M/E Posicion Bruta</OPTION>
                        <OPTION value="7" <%if (gLedger.getE01GLMFRC().equals("7")) out.print("selected"); %>>Otras Obligaciones M/E</OPTION>
 						<OPTION value="8" <%if (gLedger.getE01GLMFRC().equals("8")) out.print("selected"); %>>Otras Obligaciones M/E P.Bruta</OPTION>					</SELECT>					
				</td>
				<td nowrap width="20%">
				</td>
				<td nowrap width="30%">
 				</td>

			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Clasificación Provisión Iva:</div>
				</td>
				<td nowrap width="30%">
                    <SELECT name="E01GLMFRA">
						<OPTION value=" " <%if (!(gLedger.getE01GLMFRA().equals("1") ||gLedger.getE01GLMFRA().equals("2")||gLedger.getE01GLMFRA().equals("3") ||gLedger.getE01GLMFRA().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="1" <%if (gLedger.getE01GLMFRA().equals("1")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="2" <%if (gLedger.getE01GLMFRA().equals("2")) out.print("selected"); %>>No</OPTION>
					</SELECT> 
				</td>	
  			   <td nowrap width="20%">
					<div align="right">Autoretención :</div>
				</td>
				<td nowrap width="30%">
					  <%
              	boolean bCRE = (gLedger.getE01GLMFRB().indexOf("C") > -1);
              	boolean bCOM = (gLedger.getE01GLMFRB().indexOf("O") > -1);
              	boolean bINT = (gLedger.getE01GLMFRB().indexOf("I") > -1);
              	boolean bDER = (gLedger.getE01GLMFRB().indexOf("D") > -1);
              %>
              <INPUT type="checkbox" name="CRE" value="C" <% if (bCRE == true) out.print("checked"); %> >Cree
              <INPUT type="checkbox" name="COM" value="O" <% if (bCOM == true) out.print("checked"); %> >Comision
              <INPUT type="checkbox" name="INT" value="I" <% if (bINT == true) out.print("checked"); %> >Interes.Cartera
              <INPUT type="checkbox" name="DER" value="D" <% if (bDER == true) out.print("checked"); %> >Derivados
				</td>
			</tr>
--%>			
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Codigo Entidad Titularizada :</div>
				</td>
				<td nowrap width="30%">
					<eibsinput:help name="gLedger" property="E01GLMFR9" fn_param_one="E01GLMFR9" fn_param_three="K"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" onchange="showTitular()"/>
				</td>
				<td nowrap width="20%">
					<div align="right"><% if (!currUser.getE01INT().equals("04")) { out.print("Codigo MISPYG :"); } %></div>
				</td>
				<td nowrap width="30%">
					<% if (!currUser.getE01INT().equals("04")) { %>
                	 	<eibsinput:cnofc property="E01GLMFR4" name="gLedger" flag="PG" fn_code="E01GLMFR4" size="4" maxlength="5"/>
                	<% } %>
				</td>
			</tr>
          <tr id="TITULAR1" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: <%= !gLedger.getE01GLMFR9().isEmpty() ? "" : "none"%>" >
			<td nowrap width="20%">
				<div align="right">Numero de Cuenta Externa :</div>
			</td>
			<td nowrap width="30%">
				<input type="text" name="E01GLMTIA" size="21" maxlength="20" value="<%= gLedger.getE01GLMTIA()%>" >
			</td>
 			   <td nowrap width="20%">
              <div align="right">Descripcion Cuenta :</div>
			</td>
			<td nowrap width="30%">
				<eibsinput:text property="E01GLMTIS" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"/>
			</td>
         </tr>
		</table>
		</td>
	</tr>
</table>

<H4>Códigos de Usuarios</H4>

<table class="tableinfo">
	<tr>
		<td nowrap align="center">
		<table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="11%">
					<div align="right"><%= ParametersServices.getCnofTableDesc(request, "U1") %> :</div>
				</td>
				<td nowrap width="22%">
					<input type="text" name="E01GLMUC1" size="10" maxlength="5" value="<%= gLedger.getE01GLMUC1().trim()%>" style="text-align: center;">
					<a href="javascript:GetCodeCNOFC('E01GLMUC1','U1')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
				</td>
				<td nowrap width="12%">
					<div align="right"><%= ParametersServices.getCnofTableDesc(request, "U2") %> :</div>
				</td>
				<td nowrap width="22%">
					<input type="text" name="E01GLMUC2" size="10" maxlength="5" value="<%= gLedger.getE01GLMUC2().trim()%>" style="text-align: center;">
					<a href="javascript:GetCodeCNOFC('E01GLMUC2','U2')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
				</td>
				<td nowrap width="11%">
					<div align="right"><%= ParametersServices.getCnofTableDesc(request, "U3") %> :</div>
				</td>
				<td nowrap width="22%">
					<input type="text" name="E01GLMUC3" size="10" maxlength="5" value="<%= gLedger.getE01GLMUC3().trim()%>" style="text-align: center;">
					<a href="javascript:GetCodeCNOFC('E01GLMUC3','U3')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="11%">
					<div align="right"><%= ParametersServices.getCnofTableDesc(request, "U4") %> :</div>
				</td>
				<td nowrap width="22%">
					<input type="text" name="E01GLMUC4" size="10" maxlength="5" value="<%= gLedger.getE01GLMUC4().trim()%>" style="text-align: center;">
					<a href="javascript:GetCodeCNOFC('E01GLMUC4','U4')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
				</td>
				<td nowrap width="12%">
					<div align="right"><%= ParametersServices.getCnofTableDesc(request, "U5") %> :</div>
				</td>
				<td nowrap width="22%">
					<input type="text" name="E01GLMUC5" size="10" maxlength="5" value="<%= gLedger.getE01GLMUC5().trim()%>" style="text-align: center;">
					<a href="javascript:GetCodeCNOFC('E01GLMUC5','U5')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
				</td>
				<td nowrap width="11%">
					<div align="right"><%= ParametersServices.getCnofTableDesc(request, "U6") %> :</div>
				</td>
				<td nowrap width="22%">
					<input type="text" name="E01GLMUC6" size="10" maxlength="5" value="<%= gLedger.getE01GLMUC6().trim()%>" style="text-align: center;">
					<a href="javascript:GetCodeCNOFC('E01GLMUC6','U6')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="11%">
					<div align="right"><%= ParametersServices.getCnofTableDesc(request, "U7") %> :</div>
				</td>
				<td nowrap width="22%">
					<input type="text" name="E01GLMUC7" size="10" maxlength="5" value="<%= gLedger.getE01GLMUC7().trim()%>" style="text-align: center;">
					<a href="javascript:GetCodeCNOFC('E01GLMUC7','U7')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
				</td>
				<td nowrap width="12%">
					<div align="right"><%= ParametersServices.getCnofTableDesc(request, "U8") %> :</div>
				</td>
				<td nowrap width="22%">
					<input type="text" name="E01GLMUC8" size="10" maxlength="5" value="<%= gLedger.getE01GLMUC8().trim()%>" style="text-align: center;">
					<a href="javascript:GetCodeCNOFC('E01GLMUC8','U8')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
				</td>
				<td nowrap width="11%">
					<div align="right"><%= ParametersServices.getCnofTableDesc(request, "U9") %> :</div>
				</td>
				<td nowrap width="22%">
					<input type="text" name="E01GLMUC9" size="10" maxlength="5" value="<%= gLedger.getE01GLMUC9().trim()%>" style="text-align: center;">
					<a href="javascript:GetCodeCNOFC('E01GLMUC9','U9')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>			

<br>
<div align="center">
	<input id="EIBSBTN" type=button name="Submit" OnClick="CheckCampo()" value="Enviar">
</div>


</form>
</body>
	<SCRIPT type="text/javascript">
 function CheckCampo(){
    
    document.forms[0].E01GLMFRB.value = getElementChecked("CRE") == null ? "" : getElementChecked("CRE").value +
                                        getElementChecked("COM") == null ? "" : getElementChecked("COM").value +
									    getElementChecked("INT") == null ? "" : getElementChecked("INT").value + 
									    getElementChecked("DER") == null ? "" : getElementChecked("DER").value;
				 
 	if  (document.forms[0].E01GLMCBR.value == 0){
		document.forms[0].submit();
 		return;
 	}
	if ((document.forms[0].SALDOS.value == '')){
		alert("Debe ingresar el saldo a tomar M o D");
		document.forms[0].SALDOS.value='';
		document.forms[0].SALDOS.focus();
	} else {
		if ((document.forms[0].SALDOS.value.toUpperCase() != 'D') && (document.forms[0].SALDOS.value.toUpperCase() != 'M')) {
			alert("Solo se debe ingresar M o D");
			document.forms[0].SALDOS.value='';
			document.forms[0].SALDOS.focus();
		} else {
			if (document.forms[0].DIATRASLADO.value > 31) {
				alert("Debe ingresar numero de dias validos para un mes 0-31");
				document.forms[0].DIATRASLADO.focus();
			} else {
				if (document.forms[0].DIATRASLADO.value.length == 1) {
					document.forms[0].DIATRASLADO.value = "0" + document.forms[0].DIATRASLADO.value;
				}
				document.forms[0].E01GLMFR3.value = document.forms[0].SALDOS.value + document.forms[0].DIATRASLADO.value;
 				document.forms[0].submit();
			}

		}
	}
									 
}

 function chgvali() {
 	if  (document.forms[0].E01GLMCBR.value !=0)  {
	  	document.forms[0].SALDOS.readonly = false;
	  	document.forms[0].SALDOS.disabled = false;
	  	document.forms[0].DIATRASLADO.readonly = false;
	  	document.forms[0].DIATRASLADO.disabled = false;	
	  	
 		}
 	else{
	  	document.forms[0].SALDOS.readonly = false;
	  	document.forms[0].SALDOS.disabled = false;
	  	document.forms[0].SALDOS.value = ' '; 
	  	document.forms[0].DIATRASLADO.readonly = false;
	  	document.forms[0].DIATRASLADO.disabled = false;
	  	document.forms[0].DIATRASLADO.value = 0; 	  	

 		}
	}
	
function chgesta(p) {
	
		document.forms[0].E01GLMFR1.value = p;
	}	
	
function showTitular() {
		if(document.forms[0].E01GLMFR9.value != null &&  trim(document.forms[0].E01GLMFR9.value).trim() != ""){
			document.getElementById("TITULAR1").style.display = 'table-row';
		}else{
			document.getElementById("TITULAR1").style.display = 'none';
		}
	}		

		chgvali('<%= (gLedger.getE01GLMCBR())%>');
	</SCRIPT>
</html>
