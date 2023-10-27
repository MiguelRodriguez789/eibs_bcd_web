<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Mantenimiento de Incumplimientos</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "Main_Incum" class= "datapro.eibs.beans.EDL052002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="Javascript">
function cancel(){
	document.forms[0].SCREEN.value = 10;
	document.forms[0].submit();
}
</script>
</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %> 
 
 <h3 align="center">Consulta  Pr&eacute;stamo Simulaci&oacute;n Provisi&oacute;n Producto o Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_calificacion_proceso_consult, EDL0520" ></h3>
 <hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0520">
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN">
<INPUT TYPE=HIDDEN NAME="OPTION" VALUE="<%=userPO.getOption()%>"> 
<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="30%">
		<div align="center"><a href="javascript:cancel()"><b>Volver a la Lista de Pr&eacute;stamos Simulaci&oacute;n </b></a></div>
		</td>
		<td class=TDBKG width="30%">
		<div align="center"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</td>
	</tr>
</table>

<H4>Datos B&aacute;sicos al Momento del Calculo de Provisi&oacute;n</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0"class="tbhead">
          <%
			if (!Main_Incum.getE02CPVCUN().equals("0")) {
			%>
          <tr id="trdark">
            <td nowrap width="10%">Cliente :</td>
            <td nowrap width="10%"><eibsinput:text name="Main_Incum"
					property="E02CPVCUN"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
                <input type="text" name="E02DESCRP" size="45" readonly maxlength="45" value="<%= Main_Incum.getE02DESCRP().trim()%>"></td>
            <%
				}
				%>
            <td nowrap width="20%"></td>
            <td nowrap width="10%">N&uacute;mero de Pr&eacute;stamo :</td>
            <td nowrap width="10%"><eibsinput:text name="Main_Incum"
					property="E02CPVACC"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/></td>
            <td nowrap width="20%"></td>
          </tr>
        </table>
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr id="trdark">
              <td nowrap width="5%">Fecha Apertura  : </td>
              <td nowrap width="5%">D&iacute;a :</td>
              <td nowrap width="5%"><eibsinput:text property="E02CPVODD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_MONTH %>" readonly="true"/></td>
              <td nowrap width="5%"> Mes :</td>
              <td nowrap width="5%"><eibsinput:text property="E02CPVODM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
              <td nowrap width="5%"> Año :</td>
              <td nowrap width="5%"><eibsinput:text property="E02CPVODY"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_YEAR %>" readonly="true"/></td>
              <td nowrap width="10%"></td>
              <td nowrap width="10%" align="right">Fecha de Proceso Provisi&oacute;n: </td>
              <td nowrap width="5%" align="left">Año :</td>
              <td nowrap width="5%" align="left"><eibsinput:text
					property="E02CPVDTY" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_YEAR %>" readonly="true"/></td>
              <td nowrap width="5%" align="right">Mes :</td>
              <td nowrap width="5%" align="left"><eibsinput:text
					property="E02CPVDTM" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_MONTH %>" readonly="true"/></td>
              <td nowrap width="5%" align="right">D&iacute;a :</td>
              <td nowrap width="5%" align="left"><eibsinput:text
					property="E02CPVDTD" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAY %>" readonly="true"/></td>
              <td nowrap width="5%"></td>
            </tr>
        </table></td>
    </tr>
  </table>
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
					property="E02CPVPRI" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="68%">
				<div align="right">Valor de Intereses :</div>
				</td>
				<td nowrap align="left" width="25%"><eibsinput:text
					property="E02CPVMEI" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Valor de Otros Cargos :</div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E02CPVOTC" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
					<% 
					if (Main_Incum.getE02CPVCPR().equals("M")) { %>
					<eibsinput:text
					property="E02CPVNEA" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
					<% } %>
					
					</td>
				<td nowrap width="68%">
				<div align="right">Valor de Exposici&oacute;n :</div>
				</td>
				<td nowrap align="left" width="25%"><eibsinput:text
					property="E02CPVTEX" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">D&iacute;as de Mora :</div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E02CPVMOR" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="68%">
				<div align="right">Tabla Provisi&oacute;n : </div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E02CPVTBL" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Tipo de Producto :</div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E02CPVTYP" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="68%">
				<div align="right">C&oacute;digo del Producto :</div>
				</td>
				<td nowrap align="left" width="25%"><eibsinput:text
					property="E02CPVPRO" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap width="5%">
				<div align="right">L&iacute;nea de Cr&eacute;dito:</div>
			  </td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E02CPVCMN" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="68%">
				<div align="right">Segmento :</div>
				</td>
				<td>
				<eibsinput:text property="E02CPVSEG"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/>
				</td>
			
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap width="5%">
				<div align="right">Metodologia :</div>
			  </td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E02CPVMCA" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="68%">
				<div align="right">Modalidad : </div>
				</td>
				<td nowrap width="5%" align="left"><eibsinput:text
					property="E02CPVCPR" name="Main_Incum"
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
        <td nowrap width="5%"><eibsinput:text property="E02CPVPVP"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right">Provisi&oacute;n   Interes  :</div></td>
        <td nowrap width="23%"><eibsinput:text property="E02CPVPVI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
      </tr>
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n  Otros :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E02CPVPVO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
					<% 
					if (Main_Incum.getE02CPVCPR().equals("M")) { %>
					<eibsinput:text
					property="E02CPVXR1" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
					<% } %>
					</td>
        <td nowrap width="52%"><div align="right">%PDI Ponderada :</div></td>
        <td nowrap width="23%">				<eibsinput:text property="E02CPVFDC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/></td>
      </tr>
	   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Provisi&oacute;n CIP Capital :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPIC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Provisi&oacute;n CCI Capital :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVCIC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
		  </tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Provisi&oacute;n CIP Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPII"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Provisi&oacute;n CCI Inter&eacute;s :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVCII"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Provisi&oacute;n CIP Otros Cargos :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPIO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Provisi&oacute;n CCI Otros Cargos :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVCIO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Monto Garantizado : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVAUG"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Faltante por Garantizar  :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVPNG"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Porcentaje Minimo PDI  <br> 
				  Entre todas las Garantias :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPMP"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Tipo Garantia del % Minimo PDI :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVTGR"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Perdida Esperada <br>Capital Matriz A  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPAC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Perdida Esperada <br>
				  Capital Matriz B  :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVPBC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Perdida Esperada <br>
				Inter&eacute;s Matriz A  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPAI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Perdida Esperada <br>
				  Inter&eacute;s Matriz B  :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVPBI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Perdida Esperada <br>
				Otros Matriz A  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPAO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Perdida Esperada <br>
				  Otros Matriz B  :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVPBO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Suspensi&oacute;n  de Causaci&oacute;n :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVSUS"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right"></div>				</td>
				<td nowrap width="23%"></td>
			</tr>
		 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">% Probabilidad Incumplimiento Matriz A :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPIA"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">% Probabilidad Incumplimiento Matriz B :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVPIB"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/></td>
		  </tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">CCI Capital Mes Anterior :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVCCA"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">CCI Intereses Mes Anterior :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVCIA"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">CCI Otros Cargos Mes Anterior :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVCOA"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Valor Exposici&oacute;n Mes Anterior :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVVEA"
					name="Main_Incum"
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
        <td nowrap width="5%"><eibsinput:text property="E02CPVPAPC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right">Provisi&oacute;n  Adicional Total Interes  :</div></td>
        <td nowrap width="23%"><eibsinput:text property="E02CPVPAPI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
      </tr>
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n Adicional Total Otros :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E02CPVPAPO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right"></div></td>
        <td nowrap width="23%">
        </td>
      </tr>
	  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n  Individual/Masiva Capital   :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E02CPVMADP"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right">Provisi&oacute;n  Individual/Masiva Interes  :</div></td>
        <td nowrap width="23%"><eibsinput:text property="E02CPVMADI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
      </tr>
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n Individual/Masiva Otros :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E02CPVMADO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right"></div></td>
        <td nowrap width="23%">
        </td>
      </tr>
	    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n  SFC Capital   :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E02CPVSADP"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
        <td nowrap width="52%"><div align="right">Provisi&oacute;n  SFC Interes  :</div></td>
        <td nowrap width="23%"><eibsinput:text property="E02CPVSADI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
      </tr>
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        <td nowrap width="5%"><div align="right">Provisi&oacute;n SFC Otros :</div></td>
        <td nowrap width="5%"><eibsinput:text property="E02CPVSADO"
					name="Main_Incum"
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
	   <% if (Main_Incum.getE02CPVCPR().equals("M")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">% M&iacute;nimo  Garant&iacute;a : </div></td>
            <td nowrap width="5%"> <input type="text" name="E02CPVPR1" size="10" maxlength="10" value="<%= Main_Incum.getE02CPVPR1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>% M&iacute;nimo Provisi&oacute;n :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVPR2" size="10" maxlength="10" value="<%= Main_Incum.getE02CPVPR2().trim()%>" readonly></td>
          </tr>
		  <% } %>
		  
		   <% if (Main_Incum.getE02CPVCPR().equals("H")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>% Provisi&oacute;n parte Garantizada : </p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVPR3" size="10" maxlength="10" value="<%= Main_Incum.getE02CPVPR3().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>% Provisi&oacute;n parte No Garantizada : </p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVPR4" size="10" maxlength="10" value="<%= Main_Incum.getE02CPVPR4().trim()%>" readonly></td>
          </tr>
  		  <% } %>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Capital Idóneo : </p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVCID" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVCID().trim()%>" readonly></td>
		 <% if (Main_Incum.getE02CPVCPR().equals("H")) { %>
            <td nowrap width="52%"><div align="right">
              <p>Capital No Id&oacute;neo :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVCNI" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVCNI().trim()%>" readonly></td>
		 <% } %>	
		   </tr>
		   <% if (Main_Incum.getE02CPVCPR().equals("M")) { %>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Capital No Id&oacute;neo : </p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVCNI" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVCNI().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>
		  <% } %>
		  <% if (Main_Incum.getE02CPVCPR().equals("M")) { %>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="5%"></td>
            <td nowrap width="52%"><div align="right">
              <p>Capital :</p>
            </div></td>
            <td nowrap width="23%"><eibsinput:text
					property="E02CPVPRI" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
		  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Mínimo de Provisión Neto de Garantía Capital:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVMGC" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMGC().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Mínimo de Provisión Capital :</p>
            </div></td>

            <td nowrap width="23%"><input type="text" name="E02CPVMPC" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMPC().trim()%>" readonly></td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Capital :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVPRC" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVPRC().trim()%>" readonly></td>
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
					property="E02CPVMEI" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Mínimo de Provisión Neto de Garantía Interés:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVMGI" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMGI().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Mínimo de Provisión  Interés:</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVMPI" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMPI().trim()%>" readonly></td>
          </tr>
		  	  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Interés :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVMII" size="15" maxlength="15" value="<%= Main_Incum.getE02CPVMII().trim()%>" readonly></td>
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
					property="E02CPVOTC" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Mínimo de Provisión Neto de Garantía Otros:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVMG2" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMG2().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Mínimo de Provisión Otros :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVMP2" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMP2().trim()%>" readonly></td>
          </tr>		  	
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Otros :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVXR2" size="15" maxlength="15" value="<%= Main_Incum.getE02CPVXR2().trim()%>" readonly></td>
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
					property="E02CPVNEA" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Mínimo de Provisión Neto de Garantía Otros:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVMG1" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMG1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Mínimo de Provisión Otros :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVMP1" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMP1().trim()%>" readonly></td>
          </tr>		  	
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Otros :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVXR1" size="15" maxlength="15" value="<%= Main_Incum.getE02CPVXR1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>	  
          <% } %>
		   <% if (Main_Incum.getE02CPVCPR().equals("H")) { %>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Capital :</p>
            </div></td>
            <td nowrap width="5%"><eibsinput:text
					property="E02CPVPRI" name="Main_Incum"
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
            <td nowrap width="5%"><input type="text" name="E02CPVMGC" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMGC().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte No Garantizada Capital :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVMPC" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMPC().trim()%>" readonly></td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Capital :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVPRC" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVPRC().trim()%>" readonly></td>
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
					property="E02CPVMEI" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte Garantizada Inter&eacute;s:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVMGI" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMGI().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte No Garantizada Inter&eacute;s :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVMPI" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMPI().trim()%>" readonly></td>
          </tr>
		  	  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Interés :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVMII" size="15" maxlength="15" value="<%= Main_Incum.getE02CPVMII().trim()%>" readonly></td>
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
					property="E02CPVOTC" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte Garantizada Otros:</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVMG1" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMG1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p>Valor Provisi&oacute;n Sobre la parte No Garantizada Otros :</p>
            </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVMP1" size="16" maxlength="16" value="<%= Main_Incum.getE02CPVMP1().trim()%>" readonly></td>
          </tr>		  	
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">
              <p>Total Provisión Otros :</p>
            </div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVXR1" size="15" maxlength="15" value="<%= Main_Incum.getE02CPVXR1().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">
              <p></p>
            </div></td>
            <td nowrap width="23%"></td>
          </tr>	  
          <% } %>
      </table></td>
    </tr>
</table>
<% if (Main_Incum.getE02CPVMCA().equals("D")) { %>
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
            <td nowrap width="5%"> <input type="text" name="E02PRXPCA" size="22" maxlength="22" value="<%= Main_Incum.getE02PRXPCA().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Valor PNR Interes : </div></td>
            <td nowrap width="23%"><input type="text" name="E02PRXPIN" size="22" maxlength="22" value="<%= Main_Incum.getE02PRXPIN().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Valor PNR Otros  :</div></td>
            <td nowrap width="5%"><input type="text" name="E02PRXPOT" size="22" maxlength="22" value="<%= Main_Incum.getE02PRXPOT().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right"></div></td>
            <td nowrap width="23%"></td>
          </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Valor CIC Capital : </div></td>
            <td nowrap width="5%"> <input type="text" name="E02PRXCCA" size="22" maxlength="22" value="<%= Main_Incum.getE02PRXCCA().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Valor CIC Interes : </div></td>
            <td nowrap width="23%"><input type="text" name="E02PRXCIN" size="22" maxlength="22" value="<%= Main_Incum.getE02PRXCIN().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Valor CIC Otros  :</div></td>
            <td nowrap width="5%"><input type="text" name="E02PRXCOT" size="22" maxlength="22" value="<%= Main_Incum.getE02PRXCOT().trim()%>" readonly></td>
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
            <td nowrap width="5%"> <input type="text" name="E02CPVVRA" size="22" maxlength="22" value="<%= Main_Incum.getE02CPVVRA().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Valor IPC : </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVIPC" size="22" maxlength="22" value="<%= Main_Incum.getE02CPVIPC().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Cartera Vencida Deflactada  :</div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVVRD" size="22" maxlength="22" value="<%= Main_Incum.getE02CPVVRD().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Tasa Anual Crecimiento  :</div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVTCR" size="15" maxlength="15" value="<%= Main_Incum.getE02CPVTCR().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Variacion Semestral :</div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVVSM" size="15" maxlength="15" value="<%= Main_Incum.getE02CPVVSM().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Promedio Movil Semestral  :</div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVPMS" size="15" maxlength="15" value="<%= Main_Incum.getE02CPVPMS().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Aplica Provision Adicional  :</div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVST1" size="2" maxlength="2" value="<%= Main_Incum.getE02CPVST1().trim()%>" readonly></td>
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
				<td nowrap width="5%"><eibsinput:text property="E02GARTI1"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02GARAM1"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E02GARPD1"
					name="Main_Incum"
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
  <%  if (!(Main_Incum.getE02GARTI2().trim().equals(""))) {%>
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
				<td nowrap width="5%"><eibsinput:text property="E02GARTI2"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02GARAM2"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E02GARPD2"
					name="Main_Incum"
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
  <%  if (!(Main_Incum.getE02GARTI3().trim().equals(""))) {%>
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
				<td nowrap width="5%"><eibsinput:text property="E02GARTI3"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02GARAM3"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E02GARPD3"
					name="Main_Incum"
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
  <%  if (!(Main_Incum.getE02GARTI4().trim().equals(""))) {%>
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
				<td nowrap width="5%"><eibsinput:text property="E02GARTI4"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02GARAM4"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E02GARPD4"
					name="Main_Incum"
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
  <%  if (!(Main_Incum.getE02GARTI5().trim().equals(""))) {%>
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
				<td nowrap width="5%"><eibsinput:text property="E02GARTI5"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02GARAM5"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E02GARPD5"
					name="Main_Incum"
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
  <%  if (!(Main_Incum.getE02GARTI6().trim().equals(""))) {%>
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
				<td nowrap width="5%"><eibsinput:text property="E02GARTI6"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02GARAM6"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E02GARPD6"
					name="Main_Incum"
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
  <%  if (!(Main_Incum.getE02GARTI7().trim().equals(""))) {%>
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
				<td nowrap width="5%"><eibsinput:text property="E02GARTI7"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02GARAM7"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E02GARPD7"
					name="Main_Incum"
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
  <%  if (!(Main_Incum.getE02GARTI8().trim().equals(""))) {%>
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
				<td nowrap width="5%"><eibsinput:text property="E02GARTI8"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02GARAM8"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E02GARPD8"
					name="Main_Incum"
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
  <%  if (!(Main_Incum.getE02GARTI9().trim().equals(""))) {%>
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
				<td nowrap width="5%"><eibsinput:text property="E02GARTI9"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02GARAM9"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E02GARPD9"
					name="Main_Incum"
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
  <%  if (!(Main_Incum.getE02GARTI0().trim().equals(""))) {%>
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
				<td nowrap width="5%"><eibsinput:text property="E02GARTI0"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="52%">
				<div align="right">Monto Garantizado al Prestamo   :</div>				</td>
				<td nowrap width="23%"><eibsinput:text property="E02GARAM0"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="23%"></td>
			</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="52%">
				<div align="right">%PDI :</div>				</td>
				<td nowrap width="23%">
				<eibsinput:text property="E02GARPD0"
					name="Main_Incum"
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
				<td nowrap width="5%"><eibsinput:text property="E02CPVINC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" readonly="true"/></td>
				<td nowrap width="5%">
					<div align="right">AMB (Altura de Mora Actual entre 31-60 d&iacute;as):</div>				</td> 
				<td nowrap width="5%">
					<eibsinput:text property="E02CPVAMB"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			   <td nowrap width="5%" align="right">AMC (Altura de Mora Actual entre 61-90 d&iacute;as) :</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVAMC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
					<div align="right">MMB (M&aacute;xima Altura de Mora  entre 31-60 d&iacute;as) :</div>				</td> 
				<td nowrap width="5%"><eibsinput:text property="E02CPVMMB"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			   <td nowrap width="5%" align="right">MMC (M&aacute;xima Altura de Mora  entre 61-90 d&iacute;as) :</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVMMC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
					<div align="right">MMD (M&aacute;xima Altura de Mora mayor a 90 d&iacute;as) :</div>				</td> 
				<td nowrap width="5%"><eibsinput:text property="E02CPVMMD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			   <td nowrap width="5%" align="right">CRB   (Cr&eacute;ditos Activos):</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVCRB"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
					<div align="right">GI (Garant&iacute;a id&oacute;nea):</div>				</td> 
				<td nowrap width="5%"><eibsinput:text property="E02CPVCGI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			   <td nowrap width="5%" align="right">CAR (Comportamiento Anual Regular)  :</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVCAR"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
					<div align="right">CAM (Comportamiento Anual Malo) :</div>				</td> 
				<td nowrap width="5%"><eibsinput:text property="E02CPVCAM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">N&uacute;mero de Trimestres :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVNTE"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right">Primer  Trimestre  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVT01"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Segundo  Trimestre :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVT02"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right">Tercer  Trimestre :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVT03"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Sumario de  Trimestres :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVTSU"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right">Prenda  (Garant&iacute;a Prenda):</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPRE"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Hipoteca (Garant&iacute;a   Hipoteca)  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVHIP"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right">PR (&quot;Prepago&quot;) :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPRT"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">IP   (Indicador de Prepago):</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVTIP"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right"></div>				</td>
				<td nowrap width="5%"></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">% Z :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVVLZ"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right">Puntaje :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPUN"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Maxima Altura Mora Ultimos 36 Meses  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVMAX"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="5%">
				<div align="right"></div>				</td>
				<td nowrap width="5%"></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Mora Trimestre 1  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVMO1"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="5%"><div align="right">Indicador Trimestre 1  :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVTX1"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
			</tr>			
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Mora Trimestre 2  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVMO2"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="5%"><div align="right">Indicador Trimestre 2  :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVTX2"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
			</tr>	
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Mora Trimestre 3  :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVMO3"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
				<td nowrap width="5%"><div align="right">Indicador Trimestre 3  :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVTX3"
					name="Main_Incum"
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
            <td nowrap width="5%"><eibsinput:text property="E02CPVCRO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
            </td>
            <td nowrap width="52%"><div align="right">Calificaci&oacute;n Homologada(De la Objetiva) :</div></td>
            <td nowrap width="23%"><eibsinput:text property="E02CPVCRH"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>		
					</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Modificado Inicial :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E02CPVTI8"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
			F.I:<%= Util.formatDate(Main_Incum.getE02CPVSID(),Main_Incum.getE02CPVSIM(),Main_Incum.getE02CPVSIY())%>
			F.V:<%= Util.formatDate(Main_Incum.getE02CPVSFD(),Main_Incum.getE02CPVSFM(),Main_Incum.getE02CPVSFY())%>
            </td>
            <td nowrap width="52%"><div align="right">
			Calificaci&oacute;n Reestructurado Inicial :<br>
            </div></td>
            <td nowrap width="23%"><eibsinput:text property="E02CPVREI" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
			F.I:<%= Util.formatDate(Main_Incum.getE02CPVRID(),Main_Incum.getE02CPVRIM(),Main_Incum.getE02CPVRIY())%>
			F.V:<%= Util.formatDate(Main_Incum.getE02CPVRFD(),Main_Incum.getE02CPVRFM(),Main_Incum.getE02CPVRFY())%>	
			<br>
			
			<br>
			
				
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Modificado Mejorada :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E02CPVTI9"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
					->Homologada:<eibsinput:text property="E02CPVCRS"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/></td>
            <td nowrap width="52%"><div align="right">Calificaci&oacute;n Reestructurado Mejorada :</div></td>
				<td nowrap width="23%"><eibsinput:text property="E02CPVTI7"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
					->Homologada:<eibsinput:text property="E02CPVREE"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
					</td>
          </tr> 
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right"></div></td>
            <td nowrap width="5%">&nbsp;</td>
            <td nowrap width="52%"><div align="right">Cantidad Cuotas Pagas Correctamente:</div></td>
            <td nowrap width="23%"><eibsinput:text property="E02CPVCAN"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>		</td>
          </tr> 
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Papeles :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E02CPVRDE"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
			F.I:<%= Util.formatDate(Main_Incum.getE02CPVPID(),Main_Incum.getE02CPVPIM(),Main_Incum.getE02CPVPIY())%>
			F.V:<%= Util.formatDate(Main_Incum.getE02CPVPFD(),Main_Incum.getE02CPVPFM(),Main_Incum.getE02CPVPFY())%></td>
            <td nowrap width="52%"><div align="right"></div></td>
            <td nowrap width="23%">&nbsp;</td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Otorgamiento :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E02CPVOTO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
			F.I:<%= Util.formatDate(Main_Incum.getE02CPVOID(),Main_Incum.getE02CPVOIM(),Main_Incum.getE02CPVOIY())%>
			F.V:<%= Util.formatDate(Main_Incum.getE02CPVOFD(),Main_Incum.getE02CPVOFM(),Main_Incum.getE02CPVOFY())%>		
            </td>
            <td nowrap width="52%"><div align="right">Calificaci&oacute;n Evaluaci&oacute;n :</div></td>
            <td nowrap width="23%"><eibsinput:text property="E02CPVEVA"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
			F.I:<%= Util.formatDate(Main_Incum.getE02CPVEID(),Main_Incum.getE02CPVEIM(),Main_Incum.getE02CPVEIY())%>
			F.V:<%= Util.formatDate(Main_Incum.getE02CPVEFD(),Main_Incum.getE02CPVEFM(),Main_Incum.getE02CPVEFY())%>		
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right"></div></td>
            <td nowrap width="5%">
            </td>
            <td nowrap width="52%"><div align="right">La Peor Calificaci&oacute;n del Modelo(Objetiva) <br>
Alineada por Modalidad  :</div></td>
            <td nowrap width="23%"><eibsinput:text property="E02CPVCS3"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Definitiva :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E02CPVCRE"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/></td>
            <td nowrap width="52%"><div align="right">Calificaci&oacute;n Ley de Victima:</div></td>
            <td nowrap width="23%"><eibsinput:text property="E02CPVCVI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/></td>
          </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n Excepci&oacute;n :</div></td>
            <td nowrap width="5%"><eibsinput:text property="E02CPVEXE"
					name="Main_Incum"
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
			
			 <input type="text" readonly name="E02CPVSTS" size="15" maxlength="15" 
				       value="<% if (Main_Incum.getE02CPVSTS().equals("")) out.print("REGULAR");
							else if (Main_Incum.getE02CPVSTS().equals("C")) out.print("CANCELADO");
							else if (Main_Incum.getE02CPVSTS().equals("R")) out.print("REESTRUCTURADO");
							else if (Main_Incum.getE02CPVSTS().equals("A")) out.print("CASTIGADO"); %>" >
            </td>
            <td nowrap width="52%"><div align="right">Tipo Producto   :</div></td>
            <td nowrap width="23%">
					   <input type="text" readonly name="E02CPVACD" size="30" maxlength="30" 
				       value="<% if (Main_Incum.getE02CPVACD().equals("10")) out.print("PRESTAMO O DESCUENTO");
							else if (Main_Incum.getE02CPVACD().equals("70")) out.print("PRODUCTO EXTERNO DEL ACTIVO");
							else out.print("CUENTA CORRIENTE"); %>" >		
					</td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Banco :</div></td>
            <td nowrap width="5%"><input type="text" name="E02CPVBNK" size="03" maxlength="03" value="<%= Main_Incum.getE02CPVBNK().trim()%>" readonly>            </td>
            <td nowrap width="52%"><div align="right">Agencia :</div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVBRN" size="03" maxlength="03" value="<%= Main_Incum.getE02CPVBRN().trim()%>" readonly>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Moneda  :</div></td>
            <td nowrap width="5%">
              <input type="text" name="E02CPVCCY" size="4" maxlength="4" value="<%= Main_Incum.getE02CPVCCY().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Plazo Parámetro<br> Circular 047 :</div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVPLA" size="4" maxlength="4" value="<%= Main_Incum.getE02CPVPLA().trim()%>" readonly></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Fecha desde Desembolso <br> Circular 047 :</div></td>
            <td nowrap width="5%"><%= Util.formatDate(Main_Incum.getE02CPVFED(),Main_Incum.getE02CPVFEM(),Main_Incum.getE02CPVFEY())%></td>
            <td nowrap width="52%"><div align="right">Plazo Remanente Pr&eacute;stamo :</div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVPLR" size="4" maxlength="4" value="<%= Main_Incum.getE02CPVPLR().trim()%>" readonly></td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Ajuste Por Plazo AxP :</div></td>
            <td nowrap width="5%">
            <input type="text" name="E02CPVAXP" size="15" maxlength="15" value="<%= Main_Incum.getE02CPVAXP().trim()%>" readonly></td>
            <td nowrap width="52%"><div align="right">Cliente Ley de Victima : </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVVIC" size="2" maxlength="2" value="<%= Main_Incum.getE02CPVVIC().trim()%>" readonly></td>
          </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Fecha  del Hecho<br> Ley de Victima :</div></td>
            <td nowrap width="5%">
			<%= Util.formatDate(Main_Incum.getE02CPVVID(),Main_Incum.getE02CPVVIM(),Main_Incum.getE02CPVVIY())%>
            <td nowrap width="52%"><div align="right">Mora de la fecha del Hecho<br> Ley de Victima : </div></td>
            <td nowrap width="23%"><input type="text" name="E02CPVMVI" size="5" maxlength="5" value="<%= Main_Incum.getE02CPVMVI().trim()%>" readonly></td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Calificaci&oacute;n por Temporalidad :</div></td>
            <td nowrap width="5%">
            <eibsinput:text property="E02CPVTEM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
            <td nowrap width="52%"><div align="right">Contador Suspensi&oacute;n : </div></td>
            <td nowrap width="23%"><eibsinput:text
					property="E02CPVCOS" name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" readonly="true"/></td>
		  </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%"><div align="right">Pr&eacute;stamo Libranza  :</div></td>
            <td nowrap width="5%">
			<input type="text" name="E02CPVLIB" size="2" maxlength="2" value="<%= Main_Incum.getE02CPVLIB().trim()%>" readonly>
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
				<td nowrap width="5%"><eibsinput:text property="E02CPVPICM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro CIP Capital : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPVCD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Provisi&oacute;n CIP Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPIIM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro CIP Inter&eacute;s : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPVID"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Movimiento Provisi&oacute;n CIP Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPIOM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro CIP Otros : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPVOD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n CIP Capital :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVPCCD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro CIP Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRPCD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n CIP Capital :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPCCC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIP Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRPCC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Debito Gasto Provisi&oacute;n CIP Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPCID"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro CIP Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRPID"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n CIP Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPCIC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIP Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRPIC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n CIP Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPCOD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro CIP Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRPOD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Cr&eacute;dito Provisi&oacute;n CIP Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVPCOC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIP Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRPOC"
					name="Main_Incum"
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
					<eibsinput:text property="E02CPVCICM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro CIC Capital : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVCVCD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Provisi&oacute;n CIC Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVCIIM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro CIC Interes : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVCVID"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Movimiento Provisi&oacute;n CIC Otros :</div>				</td>
				<td nowrap width="5%">
			    <eibsinput:text property="E02CPVCIOM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro CIC Otros : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVCVOD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">D&eacute;bito Gasto Provisi&oacute;n CIC Capital :</div>				</td>
				<td nowrap width="5%">
					<eibsinput:text property="E02CPVCCCD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">D&eacute;bito Reintegro CIC Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRCCD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n CIC Capital :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVCCCC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIC Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRCCC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right"> D&eacute;bito Gasto Provisi&oacute;n CIC Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVCCID"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro CIC Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRCID"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n CIC Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
					<eibsinput:text property="E02CPVCCIC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIC Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRCIC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n CIC Otros :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVCCOD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro CIC Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRCOD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Cr&eacute;dito Provisi&oacute;n CIC Otros :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVCCOC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro CIC Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRCOC"
					name="Main_Incum"
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
					<eibsinput:text property="E02CPVCICM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro Adicional Capital : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVVREC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Adicional Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVCIIM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro Adicional Interes : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVVREI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Movimiento Adicional  Otros :</div>				</td>
				<td nowrap width="5%">
			    <eibsinput:text property="E02CPVCIOM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Movimiento Reintegro Adicional Otros : </div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVVREO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">D&eacute;bito  Provisi&oacute;n Adicional Capital :</div>				</td>
				<td nowrap width="5%">
					<eibsinput:text property="E02CPVCDEC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">D&eacute;bito Reintegro Adicional Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVGLCD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n Adicional Capital :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVCCRC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Adicional Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVGLCC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right"> D&eacute;bito Provisi&oacute;n Adicional Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVCDEI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Adicional Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVGLID"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n Adicional Inter&eacute;s :</div>				</td>
				<td nowrap width="5%">
					<eibsinput:text property="E02CPVCCRI"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Adicional Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVGLIC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Provisi&oacute;n Adicional Otros :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVCDEO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Adicional Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVGLOD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Cr&eacute;dito Provisi&oacute;n Adicional Otros :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVCCRO"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Adicional Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVGLOC"
					name="Main_Incum"
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
				<td nowrap width="5%"><eibsinput:text property="E02CPVXICM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro Capital : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXVCD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Movimiento Provisi&oacute;n  Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXIIM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro Inter&eacute;s : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXVID"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Movimiento Provisi&oacute;n  Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXIOM"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro Otros : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXVOD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Movimiento Provisi&oacute;n  Otros Mipyme:</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXIO1"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
					<td nowrap width="5%">
					<div align="right">Movimiento Reintegro Otros Mipyme : </div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXVO1"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n Capital :</div>				</td>
				<td nowrap width="5%">
				<eibsinput:text property="E02CPVXCCD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>				</td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRXCD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n Capital :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXCCC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Capital :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRXCC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Debito Gasto Provisi&oacute;n Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXCID"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRXID"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right">Cr&eacute;dito Provisi&oacute;n Inter&eacute;s :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXCIC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Inter&eacute;s :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRXIC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXCOD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRXOD"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Cr&eacute;dito Provisi&oacute;n Otros :</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXCOC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Otros :</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRXOC"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
					<div align="right"> D&eacute;bito Gasto Provisi&oacute;n Otros Mipyme:</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXC1D"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right"> D&eacute;bito Reintegro Otros Mipyme:</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRX1D"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Cr&eacute;dito Provisi&oacute;n Otros Mipyme:</div>				</td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVXC1C"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
					<td nowrap width="5%"><div align="right">Cr&eacute;dito Reintegro Otros Mipyme:</div></td>
				<td nowrap width="5%"><eibsinput:text property="E02CPVRX1C"
					name="Main_Incum"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>