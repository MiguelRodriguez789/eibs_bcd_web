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
 
 <h3 align="center">Consulta  Estadistica Simulaci&oacute;n Provisi&oacute;n Producto o Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_calificacion_proceso_consult_estadis, EDL0520" ></h3>
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

<H4>Datos </H4>
  <%int row = 0; %>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing=0 cellpadding=2 width="20%" border="0">
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Total Estimado x Modalidad </div>
				</td>
				<td nowrap width="5%" align="center"># <br>Productos</td>
				<td nowrap width="5%">
				<div align="center">Suma de <br>Saldo Capital </div>
				</td>
				<td nowrap align="center" width="5%">Provision <br>Actual Capital</td>
				<td nowrap align="center" width="5%">Provision <br>Simulada Capital</td>
				<td nowrap align="center" width="5%">Sumatoria<br> Diferencia 
				  Capital</td>
				<td nowrap align="center" width="5%">Provision <br>Actual Interes</td>
				<td nowrap align="center" width="5%">Provision <br>Simulada Interes</td>
				<td nowrap align="center" width="5%">Sumatoria <br>Diferencia Interes</td>
				<td nowrap align="center" width="5%">Provision <br>Actual Otros</td>
				<td nowrap align="center" width="5%">Provision <br>Simulada Otros</td>
				<td nowrap align="center" width="5%">Sumatoria <br> Diferencia Otros</td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Total Cartera Microcr&eacute;dito</div>
				</td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TOTMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TOCMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPCMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			   <td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSCMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DICMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPIMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSIMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DIIMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPOMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSOMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DIOMIC" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Total Cartera Consumo</div>
				</td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TOTCON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TOCCON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPCCON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSCCON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DICCON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPICON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSICON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DIICON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPOCON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSOCON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DIOCON" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%">
				<div align="right">Total Cartera Comercial</div>
				</td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TOTCOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TOCCOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPCCOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSCCOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DICCOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPICOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSICOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DIICOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPOCOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSOCOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DIOCOM" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			</tr>
			 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap width="5%">
				<div align="right">Total Cartera Vivienda </div>
			  </td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TOTVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TOCVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPCVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSCVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DICVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPIVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSIVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DIIVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TPOVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02TSOVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02DIOVIV" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap width="5%">
				<div align="right">Totales:</div>
			  </td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTOT" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTO1" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTO2" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTO5" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTO8" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTO3" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTO6" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTO9" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTO4" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTO7" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
				<td nowrap width="5%" align="left">
				<eibsinput:text	property="E02SUMTO0" name="Main_Incum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/></td>
			
			</tr>
		</table>
	</td>
</tr>
</table>
<p>&nbsp;</p>
</form>
</body>
</html>