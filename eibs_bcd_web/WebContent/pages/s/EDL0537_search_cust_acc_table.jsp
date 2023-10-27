<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>

<title>Consulta Calificaci&oacute;n de Provisi&oacute;n</title>

<META name="GENERATOR" content="IBM WebSphere Studio">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EDL0537Record"
	class="datapro.eibs.beans.EDL053701Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"
	scope="session" />

<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="javascript">

function goNew() 
{
	document.getElementById("SCREEN").value="2";
	document.forms[0].submit();
}

</SCRIPT>

<%
		if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

</head>
<body >
<h3 align="center">Consulta  Simulaci&oacute;n de Calificaci&oacute;n y Provisi&oacute;n<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="search_cust_acc_table.jsp ,EDL0537"></h3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0537">
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN">
<INPUT TYPE=HIDDEN NAME="OPTION" VALUE="<%=userPO.getOption()%>"> 
<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="30%">
		<div align="center"><a href="javascript:goNew()"><b>Volver a la Lista de Pr&eacute;stamos</b></a></div>
		</td>
		<td class=TDBKG width="30%">
		<div align="center"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</td>
	</tr>
</table>

<table class="tableinfo">
	<tr >
	<td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0"class="tbhead">
			<%
			if (!EDL0537Record.getE01CPVCUN().equals("0")) {
			%>
			<tr id="trdark">
				<td nowrap width="10%">Cliente :</td>
				<td nowrap width="10%"><eibsinput:text name="EDL0537Record"
					property="E01CPVCUN"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
					<input type="text" name="E01DESCRP" readonly size="45" maxlength="45" value="<%= EDL0537Record.getE01DESCRP().trim()%>"></td>
				<%
				}
				%>
				<td nowrap width="20%"></td>
				<td nowrap width="10%">N&uacute;mero de Pr&eacute;stamo :</td>
				<td nowrap width="10%"><eibsinput:text name="EDL0537Record"
					property="E01CPVACC"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/></td>
				<td nowrap width="20%"></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="5%">Fecha Apertura  :
				</td>
				<td nowrap width="5%">D&iacute;a :</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVODD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_MONTH %>" readonly="true"/></td>
				<td nowrap width="5%"> Mes :</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVODM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="5%"> Año :</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVODY"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_YEAR %>" readonly="true"/></td>
				<td nowrap width="10%"></td>
				<td nowrap width="10%" align="right">Fecha de Proceso Provisi&oacute;n: </td>
				<td nowrap width="5%" align="left">Año :</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVDTY" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_YEAR %>" readonly="true"/></td>
				<td nowrap width="5%" align="right">Mes :</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVDTM" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_MONTH %>" readonly="true"/></td>
				<td nowrap width="5%" align="right">D&iacute;a :</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVDTD" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAY %>" readonly="true"/></td>
				<td nowrap width="5%"></td>
			</tr>
		</table>
  	</td>	
	</tr>
</table>
<H4>Datos B&aacute;sicos al Momento del Calculo de Provisi&oacute;n</H4>
  <%int row = 0; %>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing=0 cellpadding=2 width="100%" border="0">
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Saldo del Pr&eacute;stamo :</div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVPRI" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="68%">
				<div align="right">Valor de Intereses :</div>
				</td>
				<td nowrap align="left" width="25%"><eibsinput:text
					property="E01CPVMEI" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Valor de Otros Cargos :</div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVOTC" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
					<% 
					if (EDL0537Record.getE01CPVCPR().equals("M")) { %>
					<eibsinput:text
					property="E01CPVNEA" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
					<% } %>
					
					</td>
				<td nowrap width="68%">
				<div align="right">Valor de Exposici&oacute;n :</div>
				</td>
				<td nowrap align="left" width="25%"><eibsinput:text
					property="E01CPVTEX" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">D&iacute;as de Mora :</div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVMOR" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="68%">
				<div align="right">Tabla Provisi&oacute;n : </div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVTBL" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo de Producto :</div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVTYP" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="68%">
				<div align="right">C&oacute;digo del Producto :</div>
				</td>
				<td nowrap align="left" width="25%"><eibsinput:text
					property="E01CPVPRO" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap width="5%">
				<div align="right">L&iacute;nea de Cr&eacute;dito:</div>
			  </td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVCMN" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="68%">
				<div align="right">Segmento :</div>
				</td>
				<td>
				<eibsinput:text property="E01CPVSEG"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/>
				</td>
			
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap width="5%">
				<div align="right">Metodologia :</div>
			  </td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVMCA" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="68%">
				<div align="right">Modalidad : </div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E01CPVCPR" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
			
			</tr>
		</table>
	</td>
</tr>
</table>
<p>&nbsp;</p>
<table class=tbenter>
  <tr>
    <td nowrap><h4>Provisi&oacute;n   del Préstamo </h4></td>
  </tr>
</table>
<table class="tableinfo">
  <tr bordercolor="#FFFFFF">
    <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n   Capital   :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E01CPVPVP"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right">Provisi&oacute;n   Interes  :</div></td>
        <td nowrap width="23%"><eibsinput:text property="E01CPVPVI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
      </tr>
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n  Otros :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E01CPVPVO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
					<% 
					if (EDL0537Record.getE01CPVCPR().equals("M")) { %>
					<eibsinput:text
					property="E01CPVXR1" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
					<% } %>
					</td>
        <td nowrap width="52%"><div align="right">%PDI Ponderada :</div></td>
        <td nowrap width="23%">				<eibsinput:text property="E01CPVFDC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/></td>
      </tr>
	   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Provisi&oacute;n CIP Capital :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPIC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Provisi&oacute;n CCI Capital :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVCIC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
		  </tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Provisi&oacute;n CIP Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPII"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Provisi&oacute;n CCI Inter&eacute;s :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVCII"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Provisi&oacute;n CIP Otros Cargos :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPIO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Provisi&oacute;n CCI Otros Cargos :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVCIO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Monto Garantizado : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVAUG"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Faltante por Garantizar  :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVPNG"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Porcentaje Minimo PDI  <br> 
				  Entre todas las Garantias :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPMP"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Tipo Garantia del % Minimo PDI :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVTGR"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Perdida Esperada <br>Capital Matriz A  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPAC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Perdida Esperada <br>
				  Capital Matriz B  :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVPBC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Perdida Esperada <br>
				Inter&eacute;s Matriz A  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPAI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Perdida Esperada <br>
				  Inter&eacute;s Matriz B  :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVPBI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Perdida Esperada <br>
				Otros Matriz A  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPAO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Perdida Esperada <br>
				  Otros Matriz B  :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVPBO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Suspensi&oacute;n  de Causaci&oacute;n :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVSUS"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">% Probabilidad Incumplimiento Matriz A :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPIA"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">% Probabilidad Incumplimiento Matriz B :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVPIB"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/></td>
		  </tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">CCI Capital Mes Anterior :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVCCA"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">CCI Intereses Mes Anterior :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVCIA"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">CCI Otros Cargos Mes Anterior :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVCOA"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Valor Exposici&oacute;n Mes Anterior :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVVEA"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
<table class=tbenter>
  <tr>
    <td nowrap><h4>Provisi&oacute;n Adicional del Pr&eacute;stamo. Banco + Super. </h4></td>
  </tr>
</table>
<table class="tableinfo">
  <tr bordercolor="#FFFFFF">
    <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n  Adicional Total Capital   :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E01CPVPAPC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right">Provisi&oacute;n  Adicional Total Interes  :</div></td>
        <td nowrap width="23%"><eibsinput:text property="E01CPVPAPI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
      </tr>
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n Adicional Total Otros :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E01CPVPAPO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right"></div></td>
        <td nowrap width="23%">
        </td>
      </tr>
	  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n  Individual/Masiva Capital   :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E01CPVMADP"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right">Provisi&oacute;n  Individual/Masiva Interes  :</div></td>
        <td nowrap width="23%"><eibsinput:text property="E01CPVMADI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
      </tr>
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n Individual/Masiva Otros :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E01CPVMADO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right"></div></td>
        <td nowrap width="23%">
        </td>
      </tr>
	    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n  SFC Capital   :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E01CPVSADP"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right">Provisi&oacute;n  SFC Interes  :</div></td>
        <td nowrap width="23%"><eibsinput:text property="E01CPVSADI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
      </tr>
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n SFC Otros :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E01CPVSADO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right"></div></td>
        <td nowrap width="23%">
        </td>
      </tr>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Informaci&oacute;n Calculo Microcrédito/Vivienda</h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
      <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
	   <% if (EDL0537Record.getE01CPVCPR().equals("M")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">% M&iacute;nimo  Garant&iacute;a : </div></td>
            <td nowrap width="5%"> <input type="text" name="E01CPVPR1" size="10" maxlength="10" value="<%= EDL0537Record.getE01CPVPR1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>% M&iacute;nimo Provisi&oacute;n :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVPR2" size="10" maxlength="10" value="<%= EDL0537Record.getE01CPVPR2().trim()%>" readonly></td>
          </tr>
		  <% } %>
		  
		   <% if (EDL0537Record.getE01CPVCPR().equals("H")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>% Provisi&oacute;n parte Garantizada : </p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVPR3" size="10" maxlength="10" value="<%= EDL0537Record.getE01CPVPR3().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>% Provisi&oacute;n parte No Garantizada : </p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVPR4" size="10" maxlength="10" value="<%= EDL0537Record.getE01CPVPR4().trim()%>" readonly></td>
          </tr>
  		  <% } %>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Capital Idóneo : </p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVCID" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVCID().trim()%>" readonly></td>
		 <% if (EDL0537Record.getE01CPVCPR().equals("H")) { %>
            <td nowrap width="52%"><div align="right">
              <p>Capital No Id&oacute;neo :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVCNI" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVCNI().trim()%>" readonly></td>
		 <% } %>	
		   </tr>
		   <% if (EDL0537Record.getE01CPVCPR().equals("M")) { %>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Capital No Id&oacute;neo : </p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVCNI" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVCNI().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>
		  <% } %>
		  <% if (EDL0537Record.getE01CPVCPR().equals("M")) { %>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="5%"></td>
            <td nowrap width="52%"><div align="right">
              <p>Capital :</p>
            </div></td>
            <td nowrap width="23%"><eibsinput:text
					property="E01CPVPRI" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
		  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Mínimo de Provisión Neto de Garantía Capital:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVMGC" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMGC().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Mínimo de Provisión Capital :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVMPC" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMPC().trim()%>" readonly></td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Capital :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVPRC" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVPRC().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="5%"></td>
            <td nowrap width="52%"><div align="right">
              <p>Interés :</p>
            </div></td>
            <td nowrap width="23%"><eibsinput:text
					property="E01CPVMEI" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Mínimo de Provisión Neto de Garantía Interés:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVMGI" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMGI().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Mínimo de Provisión  Interés:</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVMPI" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMPI().trim()%>" readonly></td>
          </tr>
		  	  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Interés :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVMII" size="15" maxlength="15" value="<%= EDL0537Record.getE01CPVMII().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="5%"></td>
            <td nowrap width="52%"><div align="right">
              <p>Otros :</p>
            </div></td>
            <td nowrap width="23%"><eibsinput:text
					property="E01CPVOTC" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Mínimo de Provisión Neto de Garantía Otros:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVMG2" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMG2().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Mínimo de Provisión Otros :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVMP2" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMP2().trim()%>" readonly></td>
          </tr>		  	
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Otros :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVXR2" size="15" maxlength="15" value="<%= EDL0537Record.getE01CPVXR2().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>	  
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="5%"></td>
            <td nowrap width="52%"><div align="right">
              <p>Otros Mipyme:</p>
            </div></td>
            <td nowrap width="23%"><eibsinput:text
					property="E01CPVNEA" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Mínimo de Provisión Neto de Garantía Otros:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVMG1" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMG1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Mínimo de Provisión Otros :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVMP1" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMP1().trim()%>" readonly></td>
          </tr>		  	
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Otros :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVXR1" size="15" maxlength="15" value="<%= EDL0537Record.getE01CPVXR1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>	  
          <% } %>
		   <% if (EDL0537Record.getE01CPVCPR().equals("H")) { %>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Capital :</p>
            </div></td>
            <td nowrap width="5%"><eibsinput:text
					property="E01CPVPRI" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>
                   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte Garantizada Capital:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVMGC" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMGC().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte No Garantizada Capital :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVMPC" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMPC().trim()%>" readonly></td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Capital :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVPRC" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVPRC().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="5%"></td>
            <td nowrap width="52%"><div align="right">
              <p>Interés :</p>
            </div></td>
            <td nowrap width="23%"><eibsinput:text
					property="E01CPVMEI" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte Garantizada Inter&eacute;s:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVMGI" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMGI().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte No Garantizada Inter&eacute;s :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVMPI" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMPI().trim()%>" readonly></td>
          </tr>
		  	  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Interés :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVMII" size="15" maxlength="15" value="<%= EDL0537Record.getE01CPVMII().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="5%"></td>
            <td nowrap width="52%"><div align="right">
              <p>Otros :</p>
            </div></td>
            <td nowrap width="23%"><eibsinput:text
					property="E01CPVOTC" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte Garantizada Otros:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVMG1" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMG1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte No Garantizada Otros :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVMP1" size="16" maxlength="16" value="<%= EDL0537Record.getE01CPVMP1().trim()%>" readonly></td>
          </tr>		  	
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Otros :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVXR1" size="15" maxlength="15" value="<%= EDL0537Record.getE01CPVXR1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>	  
          <% } %>
      </table></td>
    </tr>
</table>
<% if (EDL0537Record.getE01CPVMCA().equals("D")) { %>
<p>&nbsp;</p>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Informaci&oacute;n Calculo Valores Desacumulativa</h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
      <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Valor PNR Capital : </div></td>
            <td nowrap width="5%"> <input type="text" name="E01PRXPCA" size="22" maxlength="22" value="<%= EDL0537Record.getE01PRXPCA().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Valor PNR Interes : </div></td>
            <td nowrap width="23%"><input type="text" name="E01PRXPIN" size="22" maxlength="22" value="<%= EDL0537Record.getE01PRXPIN().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Valor PNR Otros  :</div></td>
            <td nowrap width="5%"><input type="text" name="E01PRXPOT" size="22" maxlength="22" value="<%= EDL0537Record.getE01PRXPOT().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right"></div></td>
            <td nowrap width="23%"></td>
          </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Valor CIC Capital : </div></td>
            <td nowrap width="5%"> <input type="text" name="E01PRXCCA" size="22" maxlength="22" value="<%= EDL0537Record.getE01PRXCCA().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Valor CIC Interes : </div></td>
            <td nowrap width="23%"><input type="text" name="E01PRXCIN" size="22" maxlength="22" value="<%= EDL0537Record.getE01PRXCIN().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Valor CIC Otros  :</div></td>
            <td nowrap width="5%"><input type="text" name="E01PRXCOT" size="22" maxlength="22" value="<%= EDL0537Record.getE01PRXCOT().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right"></div></td>
            <td nowrap width="23%"></td>
          </tr>
      </table></td>
    </tr>
</table>
<% } %>
<p>&nbsp;</p>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Informaci&oacute;n Calculo Variable Alfa </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
      <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Cartera Vencida : </div></td>
            <td nowrap width="5%"> <input type="text" name="E01CPVVRA" size="22" maxlength="22" value="<%= EDL0537Record.getE01CPVVRA().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Valor IPC : </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVIPC" size="22" maxlength="22" value="<%= EDL0537Record.getE01CPVIPC().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Cartera Vencida Deflactada  :</div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVVRD" size="22" maxlength="22" value="<%= EDL0537Record.getE01CPVVRD().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Tasa Anual Crecimiento  :</div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVTCR" size="15" maxlength="15" value="<%= EDL0537Record.getE01CPVTCR().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Variacion Semestral :</div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVVSM" size="15" maxlength="15" value="<%= EDL0537Record.getE01CPVVSM().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Promedio Movil Semestral  :</div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVPMS" size="15" maxlength="15" value="<%= EDL0537Record.getE01CPVPMS().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Aplica Provision Adicional  :</div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVST1" size="2" maxlength="2" value="<%= EDL0537Record.getE01CPVST1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right"></div></td>
            <td nowrap width="23%">&nbsp;</td>
          </tr>
      </table></td>
    </tr>
</table>
<p>&nbsp;</p>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Informaci&oacute;n  de Garant&iacute;as</h4>
		</td>
	</tr>
</table>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Garant&iacute;a 1. </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo Garantia Super :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01GARTI1"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01GARAM1"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">	   <% if (!EDL0537Record.getE01CPVCPR().equals("M")) { %> %PDI : <% } else { %> Porcentaje : <% } %></div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E01GARPD1"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
				</td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		    
		  
		</table>
		</td>
	</tr>
</table>
  <%  if (!(EDL0537Record.getE01GARTI2().trim().equals(""))) {%>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Garant&iacute;a 2. </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo Garantia Super :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01GARTI2"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01GARAM2"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E01GARPD2"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
				</td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		    
		  
		</table>
		</td>
	</tr>
</table>
 <% } %>
  <%  if (!(EDL0537Record.getE01GARTI3().trim().equals(""))) {%>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Garant&iacute;a 3. </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo Garantia Super :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01GARTI3"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01GARAM3"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E01GARPD3"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
				</td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		    
		  
		</table>
		</td>
	</tr>
</table>
<% } %>
  <%  if (!(EDL0537Record.getE01GARTI4().trim().equals(""))) {%>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Garant&iacute;a 4. </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo Garantia Super :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01GARTI4"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01GARAM4"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E01GARPD4"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
				</td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		    
		  
		</table>
		</td>
	</tr>
</table>
<% } %>
  <%  if (!(EDL0537Record.getE01GARTI5().trim().equals(""))) {%>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Garant&iacute;a 5. </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo Garantia Super :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01GARTI5"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01GARAM5"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E01GARPD5"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
				</td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		    
		  
		</table>
		</td>
	</tr>
</table>
<% } %>
  <%  if (!(EDL0537Record.getE01GARTI6().trim().equals(""))) {%>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Garant&iacute;a 6. </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo Garantia Super :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01GARTI6"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01GARAM6"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E01GARPD6"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
				</td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		    
		  
		</table>
		</td>
	</tr>
</table>
<% } %>
  <%  if (!(EDL0537Record.getE01GARTI7().trim().equals(""))) {%>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Garant&iacute;a 7. </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo Garantia Super :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01GARTI7"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01GARAM7"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E01GARPD7"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
				</td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		    
		  
		</table>
		</td>
	</tr>
</table>
<% } %>
  <%  if (!(EDL0537Record.getE01GARTI8().trim().equals(""))) {%>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Garant&iacute;a 8. </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo Garantia Super :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01GARTI8"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01GARAM8"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E01GARPD8"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
				</td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		    
		  
		</table>
		</td>
	</tr>
</table>
<% } %>
  <%  if (!(EDL0537Record.getE01GARTI9().trim().equals(""))) {%>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Garant&iacute;a 9. </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo Garantia Super :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01GARTI9"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01GARAM9"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E01GARPD9"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
				</td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		    
		  
		</table>
		</td>
	</tr>
</table>
<% } %>
  <%  if (!(EDL0537Record.getE01GARTI0().trim().equals(""))) {%>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Garant&iacute;a 10. </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo Garantia Super :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01GARTI0"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E01GARAM0"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E01GARPD0"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
				</td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		    
		  
		</table>
		</td>
	</tr>
</table>
<% } %>
<p>&nbsp;</p>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Informaci&oacute;n  Variables Calificaci&oacute;n Consumo. </h4>
	  </td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			   <td nowrap width="5%" align="right">
			    Incumplimiento Y/N :</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVINC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="5%">
					<div align="right">AMB (Altura de Mora Actual entre 31-60 d&iacute;as):</div>				</td> 
				<td nowrap width="5%">
					<eibsinput:text property="E01CPVAMB"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			   <td nowrap width="5%" align="right">AMC (Altura de Mora Actual entre 61-90 d&iacute;as) :</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVAMC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
					<div align="right">MMB (M&aacute;xima Altura de Mora  entre 31-60 d&iacute;as) :</div>				</td> 
				<td nowrap width="5%"><eibsinput:text property="E01CPVMMB"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			   <td nowrap width="5%" align="right">MMC (M&aacute;xima Altura de Mora  entre 61-90 d&iacute;as) :</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVMMC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
					<div align="right">MMD (M&aacute;xima Altura de Mora mayor a 90 d&iacute;as) :</div>				</td> 
				<td nowrap width="5%"><eibsinput:text property="E01CPVMMD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			   <td nowrap width="5%" align="right">CRB   (Cr&eacute;ditos Activos):</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVCRB"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
					<div align="right">GI (Garant&iacute;a id&oacute;nea):</div>				</td> 
				<td nowrap width="5%"><eibsinput:text property="E01CPVCGI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			   <td nowrap width="5%" align="right">CAR (Comportamiento Anual Regular)  :</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVCAR"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
					<div align="right">CAM (Comportamiento Anual Malo) :</div>				</td> 
				<td nowrap width="5%"><eibsinput:text property="E01CPVCAM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">N&uacute;mero de Trimestres :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVNTE"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right">Primer  Trimestre  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVT01"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Segundo  Trimestre :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVT02"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right">Tercer  Trimestre :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVT03"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Sumario de  Trimestres :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVTSU"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right">Prenda  (Garant&iacute;a Prenda):</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPRE"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Hipoteca (Garant&iacute;a   Hipoteca)  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVHIP"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right">PR (&quot;Prepago&quot;) :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPRT"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">IP   (Indicador de Prepago):</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVTIP"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right"></div>				</td>
				<td nowrap width="5%"></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">% Z :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVVLZ"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right">Puntaje :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPUN"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Maxima Altura Mora Ultimos 36 Meses  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVMAX"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right"></div>				</td>
				<td nowrap width="5%"></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Mora Trimestre 1  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVMO1"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="5%"><div align="right">Indicador Trimestre 1  :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVTX1"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
			</tr>			
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Mora Trimestre 2  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVMO2"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="5%"><div align="right">Indicador Trimestre 2  :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVTX2"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
			</tr>	
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Mora Trimestre 3  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVMO3"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="5%"><div align="right">Indicador Trimestre 3  :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVTX3"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
			</tr>	
		</table>
		</td>
	</tr>
</table>
<p>&nbsp;</p>

<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Informaci&oacute;n de Calificaciones </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
      <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n del Modelo(Objetiva) :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E01CPVCRO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
            </td>
            <td nowrap width="52%"><div align="right">Calificaci&oacute;n Homologada(De la Objetiva) :</div></td>
            <td nowrap width="23%"><eibsinput:text property="E01CPVCRH"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>		
					</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Modificado Inicial :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E01CPVTI8"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
			F.I:<%= Util.formatDate(EDL0537Record.getE01CPVSID(),EDL0537Record.getE01CPVSIM(),EDL0537Record.getE01CPVSIY())%>
			F.V:<%= Util.formatDate(EDL0537Record.getE01CPVSFD(),EDL0537Record.getE01CPVSFM(),EDL0537Record.getE01CPVSFY())%>
            </td>
            <td nowrap width="52%"><div align="right">
			Calificaci&oacute;n Reestructurado Inicial :<br>
            </div></td>
            <td nowrap width="23%"><eibsinput:text property="E01CPVREI" name="EDL0537Record" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
			F.I:<%= Util.formatDate(EDL0537Record.getE01CPVRID(),EDL0537Record.getE01CPVRIM(),EDL0537Record.getE01CPVRIY())%>
			F.V:<%= Util.formatDate(EDL0537Record.getE01CPVRFD(),EDL0537Record.getE01CPVRFM(),EDL0537Record.getE01CPVRFY())%>	
			<br>
			
			<br>
			
				
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Modificado Mejorada :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E01CPVTI9"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
					->Homologada:<eibsinput:text property="E01CPVCRS"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/></td>
            <td nowrap width="52%"><div align="right">Calificaci&oacute;n Reestructurado Mejorada :</div></td>
				<td nowrap width="23%"><eibsinput:text property="E01CPVTI7"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
					->Homologada:<eibsinput:text property="E01CPVREE"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
					</td>
          </tr> 
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right"></div></td>
            <td nowrap width="5%">&nbsp;</td>
            <td nowrap width="52%"><div align="right">Cantidad Cuotas Pagas Correctamente:</div></td>
            <td nowrap width="23%"><eibsinput:text property="E01CPVCAN"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>		</td>
          </tr> 
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Papeles :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E01CPVRDE"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
			F.I:<%= Util.formatDate(EDL0537Record.getE01CPVPID(),EDL0537Record.getE01CPVPIM(),EDL0537Record.getE01CPVPIY())%>
			F.V:<%= Util.formatDate(EDL0537Record.getE01CPVPFD(),EDL0537Record.getE01CPVPFM(),EDL0537Record.getE01CPVPFY())%></td>
            <td nowrap width="52%"><div align="right"></div></td>
            <td nowrap width="23%">&nbsp;</td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Otorgamiento :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E01CPVOTO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
			F.I:<%= Util.formatDate(EDL0537Record.getE01CPVOID(),EDL0537Record.getE01CPVOIM(),EDL0537Record.getE01CPVOIY())%>
			F.V:<%= Util.formatDate(EDL0537Record.getE01CPVOFD(),EDL0537Record.getE01CPVOFM(),EDL0537Record.getE01CPVOFY())%>		
            </td>
            <td nowrap width="52%"><div align="right">Calificaci&oacute;n Evaluaci&oacute;n :</div></td>
            <td nowrap width="23%"><eibsinput:text property="E01CPVEVA"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
			F.I:<%= Util.formatDate(EDL0537Record.getE01CPVEID(),EDL0537Record.getE01CPVEIM(),EDL0537Record.getE01CPVEIY())%>
			F.V:<%= Util.formatDate(EDL0537Record.getE01CPVEFD(),EDL0537Record.getE01CPVEFM(),EDL0537Record.getE01CPVEFY())%>		
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right"></div></td>
            <td nowrap width="5%">
            </td>
            <td nowrap width="52%"><div align="right">La Peor Calificaci&oacute;n del Modelo(Objetiva) <br>
Alineada por Modalidad  :</div></td>
            <td nowrap width="23%"><eibsinput:text property="E01CPVCS3"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Definitiva :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E01CPVCRE"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/></td>
            <td nowrap width="52%"><div align="right">Calificaci&oacute;n Ley de Victima:</div></td>
            <td nowrap width="23%"><eibsinput:text property="E01CPVCVI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/></td>
          </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Excepci&oacute;n :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E01CPVEXE"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/></td>
            <td nowrap width="52%"><div align="right"></div></td>
            <td nowrap width="23%"></td>
          </tr>
      </table></td>
      </table>
<p>&nbsp;</p>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Informaci&oacute;n Adicional </h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
      <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Condici&oacute;n del Registro  :</div></td>
            <td nowrap width="5%">
			
			 <input type="text" readonly name="E01CPVSTS" size="15" maxlength="15" 
				       value="<% if (EDL0537Record.getE01CPVSTS().equals("")) out.print("REGULAR");
							else if (EDL0537Record.getE01CPVSTS().equals("C")) out.print("CANCELADO");
							else if (EDL0537Record.getE01CPVSTS().equals("R")) out.print("REESTRUCTURADO");
							else if (EDL0537Record.getE01CPVSTS().equals("A")) out.print("CASTIGADO"); %>" >
            </td>
            <td nowrap width="52%"><div align="right">Tipo Producto   :</div></td>
            <td nowrap width="23%">
					   <input type="text" readonly name="E01CPVACD" size="30" maxlength="30" 
				       value="<% if (EDL0537Record.getE01CPVACD().equals("10")) out.print("PRESTAMO O DESCUENTO");
							else if (EDL0537Record.getE01CPVACD().equals("70")) out.print("PRODUCTO EXTERNO DEL ACTIVO");
							else out.print("CUENTA CORRIENTE"); %>" >		
			</td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Banco :</div></td>
            <td nowrap width="5%"><input type="text" name="E01CPVBNK" size="03" maxlength="03" value="<%= EDL0537Record.getE01CPVBNK().trim()%>" readonly>            </td>
            <td nowrap width="52%"><div align="right">Agencia :</div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVBRN" size="03" maxlength="03" value="<%= EDL0537Record.getE01CPVBRN().trim()%>" readonly>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Moneda  :</div></td>
            <td nowrap width="5%">
              <input type="text" name="E01CPVCCY" size="4" maxlength="4" value="<%= EDL0537Record.getE01CPVCCY().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Plazo Parámetro<br> Circular 047 :</div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVPLA" size="4" maxlength="4" value="<%= EDL0537Record.getE01CPVPLA().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Fecha desde Desembolso <br> Circular 047 :</div></td>
            <td nowrap width="5%"><%= Util.formatDate(EDL0537Record.getE01CPVFED(),EDL0537Record.getE01CPVFEM(),EDL0537Record.getE01CPVFEY())%></td>
            <td nowrap width="52%"><div align="right">Plazo Remanente Pr&eacute;stamo :</div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVPLR" size="4" maxlength="4" value="<%= EDL0537Record.getE01CPVPLR().trim()%>" readonly></td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Ajuste Por Plazo AxP :</div></td>
            <td nowrap width="5%">
            <input type="text" name="E01CPVAXP" size="15" maxlength="15" value="<%= EDL0537Record.getE01CPVAXP().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Cliente Ley de Victima : </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVVIC" size="2" maxlength="2" value="<%= EDL0537Record.getE01CPVVIC().trim()%>" readonly></td>
          </tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Fecha  del Hecho<br> Ley de Victima :</div></td>
            <td nowrap width="5%">
			<%= Util.formatDate(EDL0537Record.getE01CPVVID(),EDL0537Record.getE01CPVVIM(),EDL0537Record.getE01CPVVIY())%>
            <td nowrap width="52%"><div align="right">Mora de la fecha del Hecho<br> Ley de Victima : </div></td>
            <td nowrap width="23%"><input type="text" name="E01CPVMVI" size="5" maxlength="5" value="<%= EDL0537Record.getE01CPVMVI().trim()%>" readonly></td>
          </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n por Temporalidad :</div></td>
            <td nowrap width="5%">
			<eibsinput:text property="E01CPVTEM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
            <td nowrap width="52%"><div align="right">Contador Suspensi&oacute;n : </div></td>
            <td nowrap width="23%"><eibsinput:text
					property="E01CPVCOS" name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
		   </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Pr&eacute;stamo Libranza  :</div></td>
            <td nowrap width="5%">
			<input type="text" name="E01CPVLIB" size="2" maxlength="2" value="<%= EDL0537Record.getE01CPVLIB().trim()%>" readonly>
            <td nowrap width="52%"><div align="right"></div></td>
            <td nowrap width="23%">&nbsp;</td>
		   </tr>
      </table></td>
    </tr>
</table>
<p>&nbsp;</p>

<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Informaci&oacute;n Contable</h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<h4>PROCICLICO</h4>				</td>
				<td nowrap width="5%">				</td>
				<td nowrap width="5%">
				<h4>REINTEGRO PROCICLICO </h4>				</td>
				<td nowrap width="5%">				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Provisi&oacute;n CIP Capital :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPICM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro CIP Capital : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPVCD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Provisi&oacute;n CIP Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPIIM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro CIP Inter&eacute;s : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPVID"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Movimiento Provisi&oacute;n CIP Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPIOM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro CIP Otros : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPVOD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n CIP Capital :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVPCCD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro CIP Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRPCD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n CIP Capital :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPCCC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIP Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRPCC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Debito Gasto Provisi&oacute;n CIP Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPCID"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro CIP Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRPID"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n CIP Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPCIC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIP Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRPIC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n CIP Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPCOD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro CIP Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRPOD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Cr&eacute;dito Provisi&oacute;n CIP Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVPCOC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIP Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRPOC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<h4>CONTRACICLICO</h4>				</td>
				<td nowrap width="5%">				</td>
				<td nowrap width="5%">
				<h4>REINTEGRO CONTRACICLICO </h4>				</td>
				<td nowrap width="5%">				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Provisi&oacute;n CIC Capital :</div>				</td>
				<td nowrap width="5%">
					<eibsinput:text property="E01CPVCICM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro CIC Capital : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVCVCD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Provisi&oacute;n CIC Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVCIIM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro CIC Interes : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVCVID"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Movimiento Provisi&oacute;n CIC Otros :</div>				</td>
				<td nowrap width="5%">
			    <eibsinput:text property="E01CPVCIOM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro CIC Otros : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVCVOD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">D&eacute;bito Gasto Provisi&oacute;n CIC Capital :</div>				</td>
				<td nowrap width="5%">
					<eibsinput:text property="E01CPVCCCD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">D&eacute;bito Reintegro CIC Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRCCD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n CIC Capital :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVCCCC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIC Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRCCC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right"> D&eacute;bito Gasto Provisi&oacute;n CIC Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVCCID"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro CIC Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRCID"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n CIC Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
					<eibsinput:text property="E01CPVCCIC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIC Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRCIC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n CIC Otros :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVCCOD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro CIC Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRCOD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Cr&eacute;dito Provisi&oacute;n CIC Otros :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVCCOC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIC Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRCOC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<h4>PROVISION ADICIONAL </h4>				</td>
				<td nowrap width="5%">				</td>
				<td nowrap width="5%">
				<h4>REINTEGRO PROV. ADICIONAL </h4>				</td>
				<td nowrap width="5%">				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Adicional Capital :</div>				</td>
				<td nowrap width="5%">
					<eibsinput:text property="E01CPVCICM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro Adicional Capital : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVVREC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Adicional Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVCIIM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro Adicional Interes : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVVREI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Movimiento Adicional  Otros :</div>				</td>
				<td nowrap width="5%">
			    <eibsinput:text property="E01CPVCIOM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro Adicional Otros : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVVREO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">D&eacute;bito  Provisi&oacute;n Adicional Capital :</div>				</td>
				<td nowrap width="5%">
					<eibsinput:text property="E01CPVCDEC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">D&eacute;bito Reintegro Adicional Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVGLCD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n Adicional Capital :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVCCRC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Adicional Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVGLCC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right"> D&eacute;bito Provisi&oacute;n Adicional Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVCDEI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Adicional Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVGLID"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n Adicional Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
					<eibsinput:text property="E01CPVCCRI"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Adicional Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVGLIC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Provisi&oacute;n Adicional Otros :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVCDEO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Adicional Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVGLOD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Cr&eacute;dito Provisi&oacute;n Adicional Otros :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVCCRO"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Adicional Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVGLOC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<p>&nbsp;</p>
<table class=tbenter>
	<tr>
		<td nowrap>
		<h4>Informaci&oacute;n Contable</h4>
		</td>
	</tr>
</table>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
			   <h4>MICROCREDITO/VIVIENDA</h4>				</td>
				<td nowrap width="5%">				</td>
				<td nowrap width="5%">
				<h4>REINTEGRO  </h4>				</td>
				<td nowrap width="5%">				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Provisi&oacute;n  Capital :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXICM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro Capital : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXVCD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Provisi&oacute;n  Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXIIM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro Inter&eacute;s : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXVID"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Movimiento Provisi&oacute;n  Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXIOM"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro Otros : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXVOD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Movimiento Provisi&oacute;n  Otros Mipyme:</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXIO1"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro Otros Mipyme : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXVO1"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n Capital :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E01CPVXCCD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRXCD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n Capital :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXCCC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRXCC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Debito Gasto Provisi&oacute;n Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXCID"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRXID"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXCIC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRXIC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXCOD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRXOD"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Cr&eacute;dito Provisi&oacute;n Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXCOC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRXOC"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n Otros Mipyme:</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXC1D"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Otros Mipyme:</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRX1D"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Cr&eacute;dito Provisi&oacute;n Otros Mipyme:</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVXC1C"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Otros Mipyme:</div></td>
				<td nowrap width="5%"><eibsinput:text property="E01CPVRX1C"
					name="EDL0537Record"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>
