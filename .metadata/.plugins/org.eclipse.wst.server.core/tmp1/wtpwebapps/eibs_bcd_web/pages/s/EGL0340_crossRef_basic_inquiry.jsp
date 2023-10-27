<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Transacciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>




<jsp:useBean id="crossRef" class="datapro.eibs.beans.EGL034002Message" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

</head>

<script type="text/javascript">
<% if (userPO.getOption().equals("LN")){
		if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
		 	builtNewMenu(ln_i_1_opt);
<%   
		} else {
%>
			builtNewMenu(ln_i_2_opt);
<%		}
	}
%>			

</script>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 
%> 

<h3 align="center">Consulta de Referencias Cruzadas<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="crossRef_basic_inquiry.jsp,EGL0340"></h3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5"> 
<INPUT TYPE=HIDDEN NAME="E02GLMACD" value="<%= crossRef.getE02GLMACD().trim()%>">
 <% int row = 0;%>

<table class="tableinfo" id="trdark">
	<tr id="trdark">
		<td align="right" nowrap width="20%">Cuenta Contable :</td>
		<td align="right" nowrap>
			<div align="left">
				<eibsinput:text property="E02GLMBNK" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" />
				<eibsinput:text property="E02GLMCCY" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true" />
				<eibsinput:text property="E02GLMGLN" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" />
				Producto : 
				<eibsinput:text property="E02GLMATY" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true" />
			</div>
		</td>
	</tr>
	<tr id="trdark">
		<td align="right" nowrap width="20%">Descripción :</td>
		<td align="right" nowrap >
			<div align="left">
				<eibsinput:text property="E02GLMDSC" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
			</div>
		</td>
	</tr>
</table>


<% if (crossRef.getE02GLMACD().equals("10")) { %>
<H4>Modulo de Prestamos</H4>

<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Periodificación</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Interés  Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" readonly>
		  <eibsinput:text property="D02GLMXDR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Interés Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" readonly>
		  <eibsinput:text property="D02GLMXCR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Interés  de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXLR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLR() %>" readonly>
		  <eibsinput:text property="D02GLMXLR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Interés de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXLC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLC() %>" readonly>
		  <eibsinput:text property="D02GLMXLC" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMRIN" size="17" maxlength="16" value="<%= crossRef.getE02GLMRIN() %>" readonly>
		  <eibsinput:text property="D02GLMRIN" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMREX" size="17" maxlength="16" value="<%= crossRef.getE02GLMREX() %>" readonly>
		  <eibsinput:text property="D02GLMREX" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Reajuste Moroso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG09" size="17" maxlength="16" value="<%= crossRef.getE02GLXG09() %>" readonly>
		  <eibsinput:text property="D02GLXG09" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Reajuste Moroso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG10" size="17" maxlength="16" value="<%= crossRef.getE02GLXG10() %>" readonly>
		  <eibsinput:text property="D02GLXG10" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% } %>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Vencimiento Cuotas</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Principal Activo Vencido :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG05" size="17" maxlength="16" value="<%= crossRef.getE02GLXG05() %>" readonly>
		  <eibsinput:text property="D02GLXG05" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Interés Activo Vencido :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG06" size="17" maxlength="16" value="<%= crossRef.getE02GLXG06() %>" readonly>
		  <eibsinput:text property="D02GLXG06" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Reajuste Activo Vencido :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG07" size="17" maxlength="16" value="<%= crossRef.getE02GLXG07() %>" readonly>
		  <eibsinput:text property="D02GLXG07" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Reajuste Moroso Activo Vencido :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG08" size="17" maxlength="16" value="<%= crossRef.getE02GLXG08() %>" readonly>
		  <eibsinput:text property="D02GLXG08" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% } %>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Suspension de Devengo </TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Interés  Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG01" size="17" maxlength="16" value="<%= crossRef.getE02GLXG01() %>" readonly>
		  <eibsinput:text property="D02GLXG01" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Interés Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG02" size="17" maxlength="16" value="<%= crossRef.getE02GLXG02() %>" readonly>
		  <eibsinput:text property="D02GLXG02" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Interés  de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX19" size="17" maxlength="16" value="<%= crossRef.getE02GLMX19() %>" readonly>
		  <eibsinput:text property="D02GLMX19" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Interés de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX20" size="17" maxlength="16" value="<%= crossRef.getE02GLMX20() %>" readonly>
		  <eibsinput:text property="D02GLMX20" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG03" size="17" maxlength="16" value="<%= crossRef.getE02GLXG03() %>" readonly>
		  <eibsinput:text property="D02GLXG03" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG04" size="17" maxlength="16" value="<%= crossRef.getE02GLXG04() %>" readonly>
		  <eibsinput:text property="D02GLXG04" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Reajuste Moroso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" readonly>
		  <eibsinput:text property="D02GLMX21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Reajuste Moroso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" readonly>
		  <eibsinput:text property="D02GLMX22" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% } %>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Cuentas de Recupero</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Interés  en Suspenso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" readonly>
		  <eibsinput:text property="D02GLMXSO" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Interés  de Mora en suspenso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" readonly>
		  <eibsinput:text property="D02GLMXSD" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Reajuste en Suspenso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG14" size="17" maxlength="16" value="<%= crossRef.getE02GLXG14() %>" readonly>
		  <eibsinput:text property="D02GLXG14" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Reajuste Moroso en Suspenso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX18" size="17" maxlength="16" value="<%= crossRef.getE02GLMX18() %>" readonly>
		  <eibsinput:text property="D02GLMX18" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% } %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Recupero Periodo Actual :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG15" size="17" maxlength="16" value="<%= crossRef.getE02GLXG15() %>" readonly>
		  <eibsinput:text property="D02GLXG15" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Recupero Periodo Anterior :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG13" size="17" maxlength="16" value="<%= crossRef.getE02GLXG13() %>" readonly>
		  <eibsinput:text property="D02GLXG13" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Recupero Interes de Mora Post Castigo :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG54" size="17" maxlength="16" value="<%= crossRef.getE02GLXG54() %>" readonly>
		  <eibsinput:text property="D02GLXG54" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Recupero Reajuste Moroso Post Castigo :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG55" size="17" maxlength="16" value="<%= crossRef.getE02GLXG55() %>" readonly>
		  <eibsinput:text property="D02GLXG55" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% } %>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Referencias Adicionales</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta de Interés  Pagado por Anticipado :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG18" size="17" maxlength="16" value="<%= crossRef.getE02GLXG18() %>" readonly>
		  <eibsinput:text property="D02GLXG18" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Paso a Prestamo Vencido :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" readonly>
		  <eibsinput:text property="D02GLMXSM" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Paso a Prestamo Vigente :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" readonly>
		  <eibsinput:text property="D02GLMXSR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta para Condonaciones :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG49" size="17" maxlength="16" value="<%= crossRef.getE02GLXG49() %>" readonly>
		  <eibsinput:text property="D02GLXG49" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Pendientes por Cobrar :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG32" size="17" maxlength="16" value="<%= crossRef.getE02GLXG32() %>" readonly>
		  <eibsinput:text property="D02GLXG32" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Gastos de Cobranzas :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX26" size="17" maxlength="16" value="<%= crossRef.getE02GLMX26() %>" readonly>
		  <eibsinput:text property="D02GLMX26" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta para Reverso de Pagos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX32" size="17" maxlength="16" value="<%= crossRef.getE02GLMX32() %>" readonly>
		  <eibsinput:text property="D02GLMX32" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Pendiente por Cobrar Seguros :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX27" size="17" maxlength="16" value="<%= crossRef.getE02GLMX27() %>" readonly>
		  <eibsinput:text property="D02GLMX27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Pendiente por Cobrar Otros Conceptos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG33" size="17" maxlength="16" value="<%= crossRef.getE02GLXG33() %>" readonly>
		  <eibsinput:text property="D02GLXG33" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Provision</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Principal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG41" size="17" maxlength="16" value="<%= crossRef.getE02GLXG41() %>" readonly>
		  <eibsinput:text property="D02GLXG41" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito por Principal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG42" size="17" maxlength="16" value="<%= crossRef.getE02GLXG42() %>" readonly>
		  <eibsinput:text property="D02GLXG42" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Intereses Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG43" size="17" maxlength="16" value="<%= crossRef.getE02GLXG43() %>" readonly>
		  <eibsinput:text property="D02GLXG43" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito por Intereses Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG44" size="17" maxlength="16" value="<%= crossRef.getE02GLXG44() %>" readonly>
		  <eibsinput:text property="D02GLXG44" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Intereses de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG56" size="17" maxlength="16" value="<%= crossRef.getE02GLXG56() %>" readonly>
		  <eibsinput:text property="D02GLXG56" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Intereses de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG57" size="17" maxlength="16" value="<%= crossRef.getE02GLXG57() %>" readonly>
		  <eibsinput:text property="D02GLXG57" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Otros Cargos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG45" size="17" maxlength="16" value="<%= crossRef.getE02GLXG45() %>" readonly>
		  <eibsinput:text property="D02GLXG45" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito por Otros Cargos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG46" size="17" maxlength="16" value="<%= crossRef.getE02GLXG46() %>" readonly>
		  <eibsinput:text property="D02GLXG46" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Castigo</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Principal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG16" size="17" maxlength="16" value="<%= crossRef.getE02GLXG16() %>" readonly>
		  <eibsinput:text property="D02GLXG16" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito por Principal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG17" size="17" maxlength="16" value="<%= crossRef.getE02GLXG17() %>" readonly>
		  <eibsinput:text property="D02GLXG17" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Intereses Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG11" size="17" maxlength="16" value="<%= crossRef.getE02GLXG11() %>" readonly>
		  <eibsinput:text property="D02GLXG11" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito por Intereses Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG12" size="17" maxlength="16" value="<%= crossRef.getE02GLXG12() %>" readonly>
		  <eibsinput:text property="D02GLXG12" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Intereses de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG58" size="17" maxlength="16" value="<%= crossRef.getE02GLXG58() %>" readonly>
		  <eibsinput:text property="D02GLXG58" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Intereses de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG59" size="17" maxlength="16" value="<%= crossRef.getE02GLXG59() %>" readonly>
		  <eibsinput:text property="D02GLXG59" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Otros Cargos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG47" size="17" maxlength="16" value="<%= crossRef.getE02GLXG47() %>" readonly>
		  <eibsinput:text property="D02GLXG47" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito por Otros Cargos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG48" size="17" maxlength="16" value="<%= crossRef.getE02GLXG48() %>" readonly>
		  <eibsinput:text property="D02GLXG48" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito Cuenta Castigo no Informado :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG19" size="17" maxlength="16" value="<%= crossRef.getE02GLXG19() %>" readonly>
		  <eibsinput:text property="D02GLXG19" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito Cuenta Castigo no Informado :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG20" size="17" maxlength="16" value="<%= crossRef.getE02GLXG20() %>" readonly>
		  <eibsinput:text property="D02GLXG20" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Provision Individual :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX20" size="17" maxlength="16" value="<%= crossRef.getE02GLMX28() %>" readonly>
		  <eibsinput:text property="D02GLMX28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Provision Global :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX29" size="17" maxlength="16" value="<%= crossRef.getE02GLMX29() %>" readonly>
		  <eibsinput:text property="D02GLMX29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Uso Provision :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX30" size="17" maxlength="16" value="<%= crossRef.getE02GLMX30() %>" readonly>
		  <eibsinput:text property="D02GLMX30" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta de Responsabilidad :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX31" size="17" maxlength="16" value="<%= crossRef.getE02GLMX31() %>" readonly>
		  <eibsinput:text property="D02GLMX31" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Interes de Mora Post Castigo :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG50" size="17" maxlength="16" value="<%= crossRef.getE02GLXG50() %>" readonly>
		  <eibsinput:text property="D02GLXG50" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito por Interes de Mora Post Castigo :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG51" size="17" maxlength="16" value="<%= crossRef.getE02GLXG51() %>" readonly>
		  <eibsinput:text property="D02GLXG51" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Reajuste Moroso Post Castigo:</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG52" size="17" maxlength="16" value="<%= crossRef.getE02GLXG52() %>" readonly>
		  <eibsinput:text property="D02GLXG52" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Reajuste Moroso Post Castigo:</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG53" size="17" maxlength="16" value="<%= crossRef.getE02GLXG53() %>" readonly>
		  <eibsinput:text property="D02GLXG53" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% } %>

	<% if (crossRef.getH02FLGWK3().equals("H")) {%>

	<% if (crossRef.getE02GLMCLS().equals("1") ||crossRef.getE02GLMCLS().equals("6") || crossRef.getE02GLMCLS().equals("8")) { //activo %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>HIPOTECARIOS ACTIVOS</TH>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Distribucion Fondos:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG21" size="17" maxlength="16" value="<%= crossRef.getE02GLXG21() %>" readonly>
   		    <eibsinput:text property="D02GLXG21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Comisiones Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG22" size="17" maxlength="16" value="<%= crossRef.getE02GLXG22() %>" readonly>
   		    <eibsinput:text property="D02GLXG22" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Amortizacion Directa Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG23" size="17" maxlength="16" value="<%= crossRef.getE02GLXG23() %>" readonly>
   		    <eibsinput:text property="D02GLXG23" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Responsabilidad Amortizacion Directa Letras Hipotecarias :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG24" size="17" maxlength="16" value="<%= crossRef.getE02GLXG24() %>" readonly>
   		    <eibsinput:text property="D02GLXG24" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Comision Letras Hipotecarias Suspendidas Vigentes:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG25" size="17" maxlength="16" value="<%= crossRef.getE02GLXG25() %>" readonly>
   		    <eibsinput:text property="D02GLXG25" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Comision Letras Hipotecarias Suspendidas Vencidas:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG26" size="17" maxlength="16" value="<%= crossRef.getE02GLXG26() %>" readonly>
   		    <eibsinput:text property="D02GLXG26" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Interes Suspendido Vigente:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG27" size="17" maxlength="16" value="<%= crossRef.getE02GLXG27() %>" readonly>
   		    <eibsinput:text property="D02GLXG27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Reajuste Suspendido Vigente:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG28" size="17" maxlength="16" value="<%= crossRef.getE02GLXG28() %>" readonly>
   		    <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Dividendos Vigentes:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG29" size="17" maxlength="16" value="<%= crossRef.getE02GLXG29() %>" readonly>
   		    <eibsinput:text property="D02GLXG29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Dividendos Vencidos:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG30" size="17" maxlength="16" value="<%= crossRef.getE02GLXG30() %>" readonly>
   		    <eibsinput:text property="D02GLXG30" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Dividendos Acelerados:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG31" size="17" maxlength="16" value="<%= crossRef.getE02GLXG31() %>" readonly>
   		    <eibsinput:text property="D02GLXG31" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Castigos del año:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG32" size="17" maxlength="16" value="<%= crossRef.getE02GLXG32() %>" readonly>
   		    <eibsinput:text property="D02GLXG32" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Seguros Vigentes:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG33" size="17" maxlength="16" value="<%= crossRef.getE02GLXG33() %>" readonly>
   		    <eibsinput:text property="D02GLXG33" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Seguros Vencidos:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG34" size="17" maxlength="16" value="<%= crossRef.getE02GLXG34() %>" readonly>
   		    <eibsinput:text property="D02GLXG34" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Seguros Castigados:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG35" size="17" maxlength="16" value="<%= crossRef.getE02GLXG35() %>" readonly>
   		    <eibsinput:text property="D02GLXG35" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Comision Letras Hipotecarias Suspendidas Castigadas:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG36" size="17" maxlength="16" value="<%= crossRef.getE02GLXG36() %>" readonly>
   		    <eibsinput:text property="D02GLXG36" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Fondo de Amortizaci&oacute;n Extraordinaria:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG37" size="17" maxlength="16" value="<%= crossRef.getE02GLXG37() %>" readonly>
   		    <eibsinput:text property="D02GLXG37" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Fondo de Inter&eacute;s Ordinario:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG38" size="17" maxlength="16" value="<%= crossRef.getE02GLXG38() %>" readonly>
   		    <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Reajuste Suspendido Castigado:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG39" size="17" maxlength="16" value="<%= crossRef.getE02GLXG39() %>" readonly>
   		    <eibsinput:text property="D02GLXG39" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Interés Suspendido Castigado:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG40" size="17" maxlength="16" value="<%= crossRef.getE02GLXG40() %>" readonly>
   		    <eibsinput:text property="D02GLXG40" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<% } %>

	<% if (crossRef.getE02GLMCLS().equals("2")) { // pasivo %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>HIPOTECARIOS PASIVOS</TH>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Cupones y Letras Sorteadas:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG21" size="17" maxlength="16" value="<%= crossRef.getE02GLXG21() %>" readonly>
   		    <eibsinput:text property="D02GLXG21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Pago DCV:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG22" size="17" maxlength="16" value="<%= crossRef.getE02GLXG22() %>" readonly>
   		    <eibsinput:text property="D02GLXG22" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Amortización Ordinaria Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG23" size="17" maxlength="16" value="<%= crossRef.getE02GLXG23() %>" readonly>
   		    <eibsinput:text property="D02GLXG23" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Interés Ordinario Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG24" size="17" maxlength="16" value="<%= crossRef.getE02GLXG24() %>" readonly>
   		    <eibsinput:text property="D02GLXG24" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Amortización Extraordinaria Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG25" size="17" maxlength="16" value="<%= crossRef.getE02GLXG25() %>" readonly>
   		    <eibsinput:text property="D02GLXG25" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Responsabilidad Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG26" size="17" maxlength="16" value="<%= crossRef.getE02GLXG26() %>" readonly>
   		    <eibsinput:text property="D02GLXG26" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Pagar&eacute; Cup&oacute;n: </td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG27" size="17" maxlength="16" value="<%= crossRef.getE02GLXG27() %>" readonly>
   		    <eibsinput:text property="D02GLXG27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Responsabilidad Pagar&eacute; Cup&oacute;n:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG28" size="17" maxlength="16" value="<%= crossRef.getE02GLXG28() %>" readonly>
   		    <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Reserva T&eacute;cnica:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG29" size="17" maxlength="16" value="<%= crossRef.getE02GLXG29() %>" readonly>
   		    <eibsinput:text property="D02GLXG29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Responsabilidad Reserva T&eacute;cnica:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG30" size="17" maxlength="16" value="<%= crossRef.getE02GLXG30() %>" readonly>
   		    <eibsinput:text property="D02GLXG30" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<% } %>

	<% } %>
	
	<% if (crossRef.getH02FLGWK3().equals("V")) {%>
	
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Periodo de Exencion de Renta Gravable </TH>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Interés  Normal:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG21" size="17" maxlength="16" value="<%= crossRef.getE02GLXG21() %>" readonly>
           	<eibsinput:text property="D02GLXG21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Interés Mora:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG22" size="17" maxlength="16" value="<%= crossRef.getE02GLXG22() %>" readonly>
            <eibsinput:text property="D02GLXG22" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Interés  Suspenso:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG23" size="17" maxlength="16" value="<%= crossRef.getE02GLXG23() %>" readonly>
            <eibsinput:text property="D02GLXG23" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Interés  Mora Suspenso :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG24" size="17" maxlength="16" value="<%= crossRef.getE02GLXG24() %>" readonly>
            <eibsinput:text property="D02GLXG24" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Interés Corrección Monetaria :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG25" size="17" maxlength="16" value="<%= crossRef.getE02GLXG25() %>" readonly>
   		    <eibsinput:text property="D02GLXG25" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Suspenso Corrección Monetaria :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG26" size="17" maxlength="16" value="<%= crossRef.getE02GLXG26() %>" readonly>
   		    <eibsinput:text property="D02GLXG26" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	
	<% } %>

	<% } %>
	
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Comision Ley MiPYME </TH>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito Cuenta x Cobrar Comision :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG27" size="17" maxlength="16" value="<%= crossRef.getE02GLXG27() %>" readonly>
           	<eibsinput:text property="D02GLXG27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito Cuenta en Suspenso x Comision :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG28" size="17" maxlength="16" value="<%= crossRef.getE02GLXG28() %>" readonly>
            <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito Cuenta en Suspenso x Comision :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG29" size="17" maxlength="16" value="<%= crossRef.getE02GLXG29() %>" readonly>
            <eibsinput:text property="D02GLXG29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
<%-- 
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito Cuenta en Suspenso x Impuesto :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG30" size="17" maxlength="16" value="<%= crossRef.getE02GLXG30() %>" readonly>	
            <eibsinput:text property="D02GLXG30" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito Cuenta en Suspenso x Impuesto :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG31" size="17" maxlength="16" value="<%= crossRef.getE02GLXG31() %>" readonly>
             <eibsinput:text property="D02GLXG31" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
--%>
	<% } %>
</table>


<% if (crossRef.getE02GLMACD().equals("50") || crossRef.getE02GLMACD().equals("51")) { %>
<H4>Modulo de Cobranzas</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Comisiones por Cobrar :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" readonly>
   		    <eibsinput:text property="D02GLMXDR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Contrapartida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" readonly>
   		    <eibsinput:text property="D02GLMXCR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Retenciones de Impuestos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" readonly>
   		    <eibsinput:text property="D02GLMX16" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Otras Retenciones :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX17" size="17" maxlength="16" value="<%= crossRef.getE02GLMX17() %>" readonly>
   		    <eibsinput:text property="D02GLMX17" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Intereses de Terceros :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" readonly>
   		    <eibsinput:text property="D02GLMXST" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Gastos del Corresponsal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" readonly>
   		    <eibsinput:text property="D02GLMXIE" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("40") || crossRef.getE02GLMACD().equals("41") 
  		|| crossRef.getE02GLMACD().equals("42") || crossRef.getE02GLMACD().equals("43")) { %>
<H4>Modulo de Cartas de Credito</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Comisiones por Cobrar :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" readonly>
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Contrapartida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" readonly>
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Debito Aceptaciones:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" readonly>
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Credito Aceptaciones :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" readonly>
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Garantia Efectivo :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" readonly>
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Aceptaciones Descontadas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" readonly>
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Refinanciamientos (Prestamos) :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" readonly>
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Debito Pagos Diferidos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" readonly>
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Credito Pagos Diferidos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" readonly>
			<input type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Periodificación de Interes</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Debito por Intereses :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" readonly>
			<input type="text" name="D02GLMX21" size="62" maxlength="60" value="<%= crossRef.getD02GLMX21() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Credito por Intereses :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" readonly>
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("01") || crossRef.getE02GLMACD().equals("02") || crossRef.getE02GLMACD().equals("03") || crossRef.getE02GLMACD().equals("04")) { %>
<H4>Modulo de Depositos a la Vista</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Creditos</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Credito de Interes :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" readonly>
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cargos por Servicio Saldo Minimo :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" readonly>
			<input type="text" name="D02GLMXSM" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSM() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cargos por Servicio Diferidos/Sobregiro :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" readonly>
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cargos por Servicio Suspension Pagos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" readonly>
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cargos por Servicio Cuentas Inactivas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" readonly>
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cargos por Servicio Varios :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" readonly>
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes por Sobregiro :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" readonly>
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantias (Contingencia) :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" readonly>
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Comisiones por Cancelaciones :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCC() %>" readonly>
			<input type="text" name="D02GLMXCC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cheques Certificados :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX17" size="17" maxlength="16" value="<%= crossRef.getE02GLMX17() %>" readonly>
			<input type="text" name="D02GLMX17" size="62" maxlength="60" value="<%= crossRef.getD02GLMX17() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes en Suspenso por Sobregiros :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXLC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLC() %>" readonly>
			<input type="text" name="D02GLMXLC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TD align="right" width="30%">Cargo de Timbres por Cheque :</TD>
		<TD align="left" width="70%" nowrap>
			<INPUT type="text" name="E02GLMX28" size="17" maxlength="16" value="<%= crossRef.getE02GLMX28() %>" readonly>
			<INPUT type="text" name="D02GLMX28" size="62" maxlength="60" value="<%= crossRef.getD02GLMX28() %>" readonly>
		</TD>
	</TR>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TD align="right" width="30%">Cuenta Crédito por Cancelación :</TD>
		<TD align="left" width="70%" nowrap>
			<INPUT type="text" name="E02GLMX32" size="17" maxlength="16" value="<%= crossRef.getE02GLMX32() %>" readonly>
			<INPUT type="text" name="D02GLMX32" size="62" maxlength="60" value="<%= crossRef.getD02GLMX32() %>" readonly>
		</TD>
	</TR>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Debitos</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta por Contra Sobregiro Garantizado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXLR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLR() %>" readonly>
			<input type="text" name="D02GLMXLR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta por Contra Sobregiro No Garantizado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXOD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXOD() %>" readonly>
			<input type="text" name="D02GLMXOD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXOD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta por Contra Sobregiro Mayor 66 Dias :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXO2" size="17" maxlength="16" value="<%= crossRef.getE02GLMXO2() %>" readonly>
			<input type="text" name="D02GLMXO2" size="62" maxlength="60" value="<%= crossRef.getD02GLMXO2() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Gastos Intereses (MMK,SAV,NOW) :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" readonly>
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantias (Contingencia) :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" readonly>
			<input type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro a Cobrar :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" readonly>
			<input type="text" name="D02GLMX16" size="62" maxlength="60" value="<%= crossRef.getD02GLMX16() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Por Contra Cuentas Inactivas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX19" size="17" maxlength="16" value="<%= crossRef.getE02GLMX19() %>" readonly>
			<input type="text" name="D02GLMX19" size="62" maxlength="60" value="<%= crossRef.getD02GLMX19() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Por Contra Cuentas Dormidas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX20" size="17" maxlength="16" value="<%= crossRef.getE02GLMX20() %>" readonly>
			<input type="text" name="D02GLMX20" size="62" maxlength="60" value="<%= crossRef.getD02GLMX20() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Gastos por Bonificaciones : </td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG01" size="17" maxlength="16" value="<%= crossRef.getE02GLXG01() %>" readonly>
			<input type="text" name="D02GLXG01" size="62" maxlength="60" value="<%= crossRef.getD02GLXG01() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Intereses de Sobregiros</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contingencias Debito :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX26" size="17" maxlength="16" value="<%= crossRef.getE02GLMX26() %>" readonly>
			<input type="text" name="D02GLMX26" size="62" maxlength="60" value="<%= crossRef.getD02GLMX26() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contingencias Credito :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX27" size="17" maxlength="16" value="<%= crossRef.getE02GLMX27() %>" readonly>
			<input type="text" name="D02GLMX27" size="62" maxlength="60" value="<%= crossRef.getD02GLMX27() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Traslado a Dirección Nacional del Tesoro</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito por Traslado :</td>
		<td align="left" width="60%" nowrap><input type="text"
			name="E02GLMX30" size="17" maxlength="16"
			value="<%= crossRef.getE02GLMX30() %>" onkeypress="enterInteger(event)"
            class="context-menu-help"
			onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX30','','')">
		<input type="text" name="D02GLMX30" size="62" maxlength="60"
			value="<%= crossRef.getD02GLMX30() %>" readonly></td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito por Traslado :</td>
		<td align="left" width="60%" nowrap><input type="text" readonly 
			name="E02GLMX31" size="17" maxlength="16"
			value="<%= crossRef.getE02GLMX31() %>" onkeypress="enterInteger(event)"
            class="context-menu-help"
			onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX31','','')">
		<input type="text" name="D02GLMX31" size="62" maxlength="60"
			value="<%= crossRef.getD02GLMX31() %>" readonly></td>
	</tr>



	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Otras Entradas</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Diferidos a 24 Horas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" readonly>
			<input type="text" name="D02GLMX21" size="62" maxlength="60" value="<%= crossRef.getD02GLMX21() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Diferidos a 48 Horas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" readonly>
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Diferidos a 72 Horas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX23" size="17" maxlength="16" value="<%= crossRef.getE02GLMX23() %>" readonly>
			<input type="text" name="D02GLMX23" size="62" maxlength="60" value="<%= crossRef.getD02GLMX23() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Diferidos a 96 Horas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX24" size="17" maxlength="16" value="<%= crossRef.getE02GLMX24() %>" readonly>
			<input type="text" name="D02GLMX24" size="62" maxlength="60" value="<%= crossRef.getD02GLMX24() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Diferidos Mas 96 Horas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX25" size="17" maxlength="16" value="<%= crossRef.getE02GLMX25() %>" readonly>
			<input type="text" name="D02GLMX25" size="62" maxlength="60" value="<%= crossRef.getD02GLMX25() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("06")) { %>
<H4>Modulo de Cuotas de Participacion</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta por Capitalizacion :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG01" size="17" maxlength="16" value="<%= crossRef.getE02GLXG01() %>" readonly>
			<input type="text" name="D02GLXG01" size="62" maxlength="60" value="<%= crossRef.getD02GLXG01() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("90") || crossRef.getE02GLMACD().equals("91") || crossRef.getE02GLMACD().equals("92")) { %>
<H4>Modulo de Amortización / Garantias / Lineas de Credito / Otros
Productos</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%">(*)</td>
		<td align="right" width="28%">Cuenta Contarpartida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" readonly>
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%">(**)</td>
		<td align="right" width="28%">Cuenta Amortización :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" readonly>
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" width="28%">Cuenta de Debito Monto Usado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" readonly>
			<input type="text" name="D02GLMX21" size="62" maxlength="60" value="<%= crossRef.getD02GLMX21() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" width="28%">Cuenta de Credito Monto Usado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" readonly>
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" colspan="2"></td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" valign="top" width="2%">(*)</td>
		<td align="left" colspan="2">Cuenta de Contrapartida sera usada para GARANTIAS, LINEAS DE CREDITO Y OTROS.</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" valign="top" width="2%">(**)</td>
		<td align="left" colspan="2">La Cuenta de Ingresos x Comision o Gastos Prepagados serán utilizadas para la Amortización Diaria;
		Ingresos y Egresos serán afectados a diario de acuerdo a la clasificación de la Cuenta Principal Utilizada. (Cuenta Contable
		Reflejada Arriba)</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" valign="top" width="2%">(**)</td> 
		<td align="left" colspan="2">Lineas de Credito usaran la cuenta de Amortización para incluir la cuenta de Ingresos por Comisión.</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("11") || crossRef.getE02GLMACD().equals("12") || crossRef.getE02GLMACD().equals("14") || crossRef.getE02GLMACD().equals("15")) { %>
<H4>Modulo de Contratos</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Periodificación de Interes</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Debito por Interes Normal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" 	name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" readonly>
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito por Interes Normal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" readonly>
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Debito por Interes Certificado Vencido :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXLR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLR() %>" readonly>
			<input type="text" name="D02GLMXLR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito por Interes Certificado Vencido :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXLC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLC() %>" readonly>
			<input type="text" name="D02GLMXLC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Entradas Garantias</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Debito Contingencia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" readonly>
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Credito Contingencia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" readonly>
			<input type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Debito Monto Usado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" readonly>
			<input type="text" name="D02GLMX21" size="62" maxlength="60" value="<%= crossRef.getD02GLMX21() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Credito Monto Usado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" readonly>
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Referencias Adicionales</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Operación dada en Garantia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" readonly>
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Origen del Contrato :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" readonly>
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Contratos Vencidos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" readonly>
			<input type="text" name="D02GLMXSM" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSM() %>" readonly>
		</td>
	</tr>

</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("13")) { %>
<H4>Modulo de Inversiones (Papel Comercial)</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Periodificación de Interes</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Debito por Interes :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" readonly>
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Credito por Interes :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" readonly>
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Custodio (Contingencias)</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Debito :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" readonly>
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Credito :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" readonly>
			<input type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Otras Entradas</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Amortización de Prima :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" readonly>
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Amortización de Descuento :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" readonly>
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Ajuste de Precio de Mercado :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" readonly>
			<input type="text" name="D02GLMXSM" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSM() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%" nowrap>Contrapartida Ajuste por Ganancias :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" readonly>
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%" nowrap>Contrapartida Ajuste por Perdidas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXCC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCC() %>" readonly>
			<input type="text" name="D02GLMXCC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Ganancias por Ventas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" readonly>
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Perdidas por Ventas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXLC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLC() %>" readonly>
			<input type="text" name="D02GLMXLC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Inversiones Vencidas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" readonly>
			<input type="text" name="D02GLMX16" size="62" maxlength="60" value="<%= crossRef.getD02GLMX16() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Ganancias Realizadas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXO2" size="17" maxlength="16" value="<%= crossRef.getE02GLMXO2() %>" readonly>
			<input type="text" name="D02GLMXO2" size="62" maxlength="60" value="<%= crossRef.getD02GLMXO2() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Perdidas Realizadas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXLR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLR() %>" readonly>
			<input type="text" name="D02GLMXLR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLR() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("19")) { %>
<H4>Modulo de Proyectos de Constructor</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Solicitud</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito por Solicitud Recibida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" readonly>
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Aprobación Solicitud</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Debito Solicitud Aprobada :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" readonly>
			<input type="text" name="D02GLMXSM" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSM() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito Solicitud Aprobada :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" readonly>
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Protocolización</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Debito Protocolizado por Utilizar :
		</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" readonly>
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito Protocolizado por Utilizar
		:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" readonly>
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Referencias Adicionales</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contribución :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" readonly>
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Anticipos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" readonly>
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Prima Fondo de Garantia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" readonly>
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Retención Fiel Cumplimiento :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCC() %>" readonly>
			<input type="text" name="D02GLMXCC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Pago de Valuaciones :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" readonly>
			<input type="text" name="D02GLMX16" size="62" maxlength="60" value="<%= crossRef.getD02GLMX16() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Comisiones y Otros :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXOD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXOD() %>" readonly>
			<input type="text" name="D02GLMXOD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXOD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Honorarios Inspector :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXO2" size="17" maxlength="16" value="<%= crossRef.getE02GLMXO2() %>" readonly>
			<input type="text" name="D02GLMXO2" size="62" maxlength="60" value="<%= crossRef.getD02GLMXO2() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Retención Fiel Cumplimiento Inspector :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" readonly>
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contrapartida Adicional :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX17" size="17" maxlength="16" value="<%= crossRef.getE02GLMX17() %>" readonly>
			<input type="text" name="D02GLMX17" size="62" maxlength="60" value="<%= crossRef.getD02GLMX17() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("10") || crossRef.getE02GLMACD().equals("11") || crossRef.getE02GLMACD().equals("12") || crossRef.getE02GLMACD().equals("13") || crossRef.getE02GLMACD().equals("14") || crossRef.getE02GLMACD().equals("15")) { %>
<H4>Referencias sobre Contratos</H4>
<table class="tableinfo">
<% if (crossRef.getE02GLMACD().equals("10")) {%>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Renovación Reestructuración</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Debito Contingencia :</td>
		<td align="left" width="60%" nowrap>
			<input type="text" name="E02GLMXO2" size="17" maxlength="16" value="<%= crossRef.getE02GLMXO2() %>" readonly>
            <eibsinput:text property="D02GLMXO2" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Credito Contingencia :</td>
		<td align="left" width="60%" nowrap>
			<input type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" readonly>
            <eibsinput:text property="D02GLMX16" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Entradas Garantias</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Debito Contingencia :</td>
		<td align="left" width="60%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" readonly>
            <eibsinput:text property="D02GLMXIE" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Credito Contingencia :</td>
		<td align="left" width="60%" nowrap>
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" readonly>
            <eibsinput:text property="D02GLMDFP" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
<% }%>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Contratos a Futuro</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Debito Contingencia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" readonly>
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito Contingencia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXOD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXOD() %>" readonly>
			<input type="text" name="D02GLMXOD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXOD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Proyeccion Intereses</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Intereses Debito :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX23" size="17" maxlength="16" value="<%= crossRef.getE02GLMX23() %>" readonly>
			<input type="text" name="D02GLMX23" size="62" maxlength="60" value="<%= crossRef.getD02GLMX23() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Intereses Creditos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX24" size="17" maxlength="16" value="<%= crossRef.getE02GLMX24() %>" readonly>
			<input type="text" name="D02GLMX24" size="62" maxlength="60" value="<%= crossRef.getD02GLMX24() %>" readonly>
		</td>
	</tr>

	<% if (!crossRef.getE02GLMACD().equals("10")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Registro de Custodia :</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Debito Custodia Magnetica :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX26" size="17" maxlength="16" value="<%= crossRef.getE02GLMX26() %>" readonly>
			<input type="text" name="D02GLMX26" size="62" maxlength="60" value="<%= crossRef.getD02GLMX26() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito Custodia Magnetica :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX27" size="17" maxlength="16" value="<%= crossRef.getE02GLMX27() %>" readonly>
			<input type="text" name="D02GLMX27" size="62" maxlength="60" value="<%= crossRef.getD02GLMX27() %>" readonly>
		</td>
	</tr>
	<% } %>

	<%if(currUser.getE01INT().equals("03")){%>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Politica Habitacional (Cuentas de
		Orden)</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contrapartida Principal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG01" size="17" maxlength="16" value="<%= crossRef.getE02GLXG01() %>" readonly>
			<input type="text" name="D02GLXG01" size="62" maxlength="60" value="<%= crossRef.getD02GLXG01() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Contable Fideicomiso:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG02" size="17" maxlength="16" value="<%= crossRef.getE02GLXG02() %>" readonly>
			<input type="text" name="D02GLXG02" size="62" maxlength="60" value="<%= crossRef.getD02GLXG02() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Disponibilidad :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG03" size="17" maxlength="16" value="<%= crossRef.getE02GLXG03() %>" readonly>
			<input type="text" name="D02GLXG03" size="62" maxlength="60" value="<%= crossRef.getD02GLXG03() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Aporte FAOV por Pagar :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG04" size="17" maxlength="16" value="<%= crossRef.getE02GLXG04() %>" readonly>
			<input type="text" name="D02GLXG04" size="62" maxlength="60" value="<%= crossRef.getD02GLXG04() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contrapartida por Seguros :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG05" size="17" maxlength="16" value="<%= crossRef.getE02GLXG05() %>" readonly>
			<input type="text" name="D02GLXG05" size="62" maxlength="60" value="<%= crossRef.getD02GLXG05() %>" readonly></td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG06" size="17" maxlength="16" value="<%= crossRef.getE02GLXG06() %>" readonly>
			<input type="text" name="D02GLXG06" size="62" maxlength="60" value="<%= crossRef.getD02GLXG06() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Intermediación Financiera :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG07" size="17" maxlength="16" value="<%= crossRef.getE02GLXG07() %>" readonly>
			<input type="text" name="D02GLXG07" size="62" maxlength="60" value="<%= crossRef.getD02GLXG07() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Ingresos por Intermediación :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG08" size="17" maxlength="16" value="<%= crossRef.getE02GLXG08() %>" readonly>
			<input type="text" name="D02GLXG08" size="62" maxlength="60" value="<%= crossRef.getD02GLXG08() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Obligaciones con BANAVIH :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG09" size="17" maxlength="16" value="<%= crossRef.getE02GLXG09() %>" readonly>
			<input type="text" name="D02GLXG09" size="62" maxlength="60" value="<%= crossRef.getD02GLXG09() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Gastos BANAVIH :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG10" size="17" maxlength="16" value="<%= crossRef.getE02GLXG10() %>" readonly>
			<input type="text" name="D02GLXG10" size="62" maxlength="60" value="<%= crossRef.getD02GLXG10() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Rendimientos no Cobrados :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG11" size="17" maxlength="16" value="<%= crossRef.getE02GLXG11() %>" readonly>
			<input type="text" name="D02GLXG11" size="62" maxlength="60" value="<%= crossRef.getD02GLXG11() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Costos Operativos BANAVIH :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG12" size="17" maxlength="16" value="<%= crossRef.getE02GLXG12() %>" readonly>
			<input type="text" name="D02GLXG12" size="62" maxlength="60" value="<%= crossRef.getD02GLXG12() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Fideicomiso de Inversion :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG13" size="17" maxlength="16" value="<%= crossRef.getE02GLXG13() %>" readonly>
			<input type="text" name="D02GLXG13" size="62" maxlength="60" value="<%= crossRef.getD02GLXG13() %>" readonly>
		</td>
	</tr>
	<% } %>
</table>
<% } %> 

<% if (crossRef.getE02GLMPRV().equals("Y") && !crossRef.getE02GLMACD().equals("10")) { %>
<H4>Cuentas para Previsiones</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Año Actual</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Debito Principal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG41" size="17" maxlength="16" value="<%= crossRef.getE02GLXG41() %>" readonly>
			<input type="text" name="D02GLXG41" size="62" maxlength="60" value="<%= crossRef.getD02GLXG41() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito Principal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX31" size="17" maxlength="16" value="<%= crossRef.getE02GLMX31() %>" readonly>
			<input type="text" name="D02GLMX31" size="62" maxlength="60" value="<%= crossRef.getD02GLMX31() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Debito Intereses :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG42" size="17" maxlength="16" value="<%= crossRef.getE02GLXG42() %>" readonly>
			<input type="text" name="D02GLXG42" size="62" maxlength="60" value="<%= crossRef.getD02GLXG42() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito Intereses :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX20" size="17" maxlength="16" value="<%= crossRef.getE02GLMX20() %>" readonly>
			<input type="text" name="D02GLMX20" size="62" maxlength="60" value="<%= crossRef.getD02GLMX20() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Año Pasado</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Debito Principal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX28" size="17" maxlength="16" value="<%= crossRef.getE02GLMX28() %>" readonly>
			<input type="text" name="D02GLMX28" size="62" maxlength="60" value="<%= crossRef.getD02GLMX28() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito Principal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX29" size="17" maxlength="16" value="<%= crossRef.getE02GLMX29() %>" readonly>
			<input type="text" name="D02GLMX29" size="62" maxlength="60" value="<%= crossRef.getD02GLMX29() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMRVF().equals("Y")) { %>
<H4>Cuentas de Revaluación Moneda Extranjera</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta de Ingreso :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMRIN" size="17" maxlength="16" value="<%= crossRef.getE02GLMRIN() %>" readonly>
			<input type="text" name="D02GLMRIN" size="62" maxlength="60" value="<%= crossRef.getD02GLMRIN() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta de Egreso :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMREX" size="17" maxlength="16" value="<%= crossRef.getE02GLMREX() %>" readonly>
			<input type="text" name="D02GLMREX" size="62" maxlength="60" value="<%= crossRef.getD02GLMREX() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMRVF().equals("4")) { %>
<H4>Cuentas de Diferencial Cambiario</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta de Diferencial Cambiario :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMRIN" size="17" maxlength="16" value="<%= crossRef.getE02GLMRIN() %>" readonly>
			<input type="text" name="D02GLMRIN" size="62" maxlength="60" value="<%= crossRef.getD02GLMRIN() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 
        
<% if (crossRef.getE02GLMACD().equals("65") ||
				 crossRef.getE02GLMACD().equals("66") ||
				 crossRef.getE02GLMACD().equals("67") ||
				 crossRef.getE02GLMACD().equals("68") ||				 
				 crossRef.getE02GLMACD().equals("69")) { %>
<h4>Cuentas de Inversiones</h4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Cuenta Compensacion :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMX32" size="17" maxlength="16" value="<%= crossRef.getE02GLMX32() %>" readonly>
			<input type="text" name="D02GLMX32" size="62" maxlength="60" value="<%= crossRef.getD02GLMX32() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Ganancias/Perdidas Ingresos :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" readonly>
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Ganancias/Perdidas Gastos :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" readonly>
			<input type="text" name="D02GLMXSM" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSM() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Debito Interes Devengos :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" readonly>
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Credito Interes Devengos :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" readonly>
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Debito Ordenes de Venta Pendientes :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" readonly>
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Credito Ordenes de Venta Pendientes :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" readonly>
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Debito Ordenes de Compra Pendientes :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXLR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLR() %>" readonly>
			<input type="text" name="D02GLMXLR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLR() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Credito Ordenes de Compra Pendientes :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXO2" size="17" maxlength="16" value="<%= crossRef.getE02GLMXO2() %>" readonly>
			<input type="text" name="D02GLMXO2" size="62" maxlength="60" value="<%= crossRef.getD02GLMXO2() %>" readonly>
		</div>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Comision acumulada de custodia Debito :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMX17" size="17" maxlength="16" value="<%= crossRef.getE02GLMX17() %>" readonly>
			<input type="text" name="D02GLMX17" size="62" maxlength="60" value="<%= crossRef.getD02GLMX17() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Comision acumulada de custodia Credito :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMX18" size="17" maxlength="16" value="<%= crossRef.getE02GLMX18() %>" readonly>
			<input type="text" name="D02GLMX18" size="62" maxlength="60" value="<%= crossRef.getD02GLMX18() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Cuenta Comision del Comisionista :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" readonly>
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Cuenta Gastos del Comisionista :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXCC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCC() %>" readonly>
			<input type="text" name="D02GLMXCC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCC() %>" readonly>
		</div>
		</td>
	</tr>

</table>

<H4>Posicion Banco</H4>
<TABLE class="tableinfo">
	<TBODY>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<TD align="right" width="30%">
			<DIV align="right">Cuenta Valor Nominal :</DIV>
			</TD>
			<TD align="left" width="70%" nowrap>
			<DIV align="left">
				<INPUT type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" readonly>
				<INPUT type="text" name="D02GLMDFP0" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
			</DIV>
			</TD>
		</TR>
		<TR id="trclear">
			<TD align="right" width="30%">
			<DIV align="right">Cuenta Prima/Descuento :</DIV>
			</TD>
			<TD align="left" width="70%" nowrap>
			<DIV align="left">
				<INPUT type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" readonly> 
				<INPUT type="text" name="D02GLMX160" size="62" maxlength="60" value="<%= crossRef.getD02GLMX16() %>" readonly>
			</DIV>
			</TD>
		</TR>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<TD align="right" width="30%">
			<DIV align="right">Devengo de Intereses tiempo de compra :</DIV>
			</TD>
			<TD align="left" width="70%" nowrap>
			<DIV align="left">
				<INPUT type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" readonly>
				<INPUT type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
			</DIV>
			</TD>
		</TR>
		<TR id="trclear">
			<TD align="right" width="30%">
			<DIV align="right">Cuenta Debito en poder del Banco :</DIV>
			</TD>
			<TD align="left" width="70%" nowrap>
			<DIV align="left">
				<INPUT type="text" name="E02GLMX19" size="17" maxlength="16" value="<%= crossRef.getE02GLMX19() %>" readonly>
				<INPUT type="text" name="D02GLMX19" size="62" maxlength="60" value="<%= crossRef.getD02GLMX19() %>" readonly>
			</DIV>
			</TD>
		</TR>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<TD align="right" width="30%">
			<DIV align="right">Cuenta Credito en poder del Banco:</DIV>
			</TD>
			<TD align="left" width="70%" nowrap>
			<DIV align="left">
				<INPUT type="text" name="E02GLMX20" size="17" maxlength="16" value="<%= crossRef.getE02GLMX20() %>" readonly>
				<INPUT type="text" name="D02GLMX20" size="62" maxlength="60" value="<%= crossRef.getD02GLMX20() %>" readonly>
			</DIV>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<% } %> 

<% if (!crossRef.getE02GLMREV().equals("N") && !crossRef.getE02GLMACD().equals("10")) { %>
<H4>Cuentas de Reajuste/Corrección Monetaria</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Debito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMRIN" size="17" maxlength="16" value="<%= crossRef.getE02GLMRIN() %>" readonly>
   		    <eibsinput:text property="D02GLMRIN" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
   		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Credito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMREX" size="17" maxlength="16" value="<%= crossRef.getE02GLMREX() %>" readonly>
   		    <eibsinput:text property="D02GLMREX" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
        </td>
	</tr>
</table>
<% } %>

</form>
</body>
</html>
