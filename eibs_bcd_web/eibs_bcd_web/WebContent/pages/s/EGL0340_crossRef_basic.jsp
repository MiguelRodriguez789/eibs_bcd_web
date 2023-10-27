<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>General Ledger Cross References</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="crossRef" class="datapro.eibs.beans.EGL034002Message" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

</head>

<body>

<% 
	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
%>
<SCRIPT type="text/javascript">
            showErrors();
     	</SCRIPT>
<%
 	}
%>


<h3 align="center">Mantenimiento Referencias Cruzadas<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="crossRef_basic,EGL0340"></h3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340">
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="5"> 
<INPUT TYPE=HIDDEN 	NAME="E02GLMACD" ID="E02GLMACD" value="<%= crossRef.getE02GLMACD().trim()%>">
<INPUT TYPE=HIDDEN NAME="CNTBCU" ID="CNTBCU" value="<%= currUser.getE01BCU().trim()%>">

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
<% if (crossRef.getH02FLGWK3().equals("G")) { %>
<H4>Modulo de Descuento de Documentos</H4>
<% } else { %>
<H4>Modulo de Prestamos</H4>
<% } %>

<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Periodificación</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Interés  Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXDR','','')">
		  <eibsinput:text property="D02GLMXDR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Interés Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
		  <eibsinput:text property="D02GLMXCR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Interés  de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXLR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLR() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXLR','','')">
		  <eibsinput:text property="D02GLMXLR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Interés de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXLC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLC() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXLC','','')">
		  <eibsinput:text property="D02GLMXLC" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMRIN" size="17" maxlength="16" value="<%= crossRef.getE02GLMRIN() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMRIN','','')">
		  <eibsinput:text property="D02GLMRIN" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMREX" size="17" maxlength="16" value="<%= crossRef.getE02GLMREX() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMREX','','')">
		  <eibsinput:text property="D02GLMREX" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Reajuste Moroso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG09" size="17" maxlength="16" value="<%= crossRef.getE02GLXG09() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG09','','')">
		  <eibsinput:text property="D02GLXG09" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Reajuste Moroso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG10" size="17" maxlength="16" value="<%= crossRef.getE02GLXG10() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG10','','')">
		  <eibsinput:text property="D02GLXG10" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% } %>
<% if (crossRef.getH02FLGWK3().equals("G")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Retencion / Excedente</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Retencion :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
		  <eibsinput:text property="D02GLMXIE" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta de Excedente :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMDFP','','')">
		  <eibsinput:text property="D02GLMDFP" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% } %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Vencimiento Cuotas</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Principal Activo Vencido :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG05" size="17" maxlength="16" value="<%= crossRef.getE02GLXG05() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG05','','')">
		  <eibsinput:text property="D02GLXG05" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Interés Activo Vencido :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG06" size="17" maxlength="16" value="<%= crossRef.getE02GLXG06() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG06','','')">
		  <eibsinput:text property="D02GLXG06" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Reajuste Activo Vencido :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG07" size="17" maxlength="16" value="<%= crossRef.getE02GLXG07() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG07','','')">
		  <eibsinput:text property="D02GLXG07" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Reajuste Moroso Activo Vencido :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG08" size="17" maxlength="16" value="<%= crossRef.getE02GLXG08() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG08','','')">
		  <eibsinput:text property="D02GLXG08" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% } %>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Suspension de Devengo </TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Interés  Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG01" size="17" maxlength="16" value="<%= crossRef.getE02GLXG01() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG01','','')">
		  <eibsinput:text property="D02GLXG01" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Interés Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG02" size="17" maxlength="16" value="<%= crossRef.getE02GLXG02() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG02','','')">
		  <eibsinput:text property="D02GLXG02" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Interés  de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX19" size="17" maxlength="16" value="<%= crossRef.getE02GLMX19() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX19','','')">
		  <eibsinput:text property="D02GLMX19" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Interés de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX20" size="17" maxlength="16" value="<%= crossRef.getE02GLMX20() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX20','','')">
		  <eibsinput:text property="D02GLMX20" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG03" size="17" maxlength="16" value="<%= crossRef.getE02GLXG03() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG03','','')">
		  <eibsinput:text property="D02GLXG03" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG04" size="17" maxlength="16" value="<%= crossRef.getE02GLXG04() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG04','','')">
		  <eibsinput:text property="D02GLXG04" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Reajuste Moroso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX21','','')">
		  <eibsinput:text property="D02GLMX21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Reajuste Moroso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX22','','')">
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
		  <input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSO','','')">
		  <eibsinput:text property="D02GLMXSO" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Interés  de Mora en suspenso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSD','','')">
		  <eibsinput:text property="D02GLMXSD" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Reajuste en Suspenso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG14" size="17" maxlength="16" value="<%= crossRef.getE02GLXG14() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG14','','')">
		  <eibsinput:text property="D02GLXG14" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Reajuste Moroso en Suspenso :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX18" size="17" maxlength="16" value="<%= crossRef.getE02GLMX18() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX18','','')">
		  <eibsinput:text property="D02GLMX18" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% } %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Recupero Periodo Actual :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG15" size="17" maxlength="16" value="<%= crossRef.getE02GLXG15() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG15','','')">
		  <eibsinput:text property="D02GLXG15" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Recupero Periodo Anterior :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG13" size="17" maxlength="16" value="<%= crossRef.getE02GLXG13() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG13','','')">
		  <eibsinput:text property="D02GLXG13" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Recupero Interes de Mora Post Castigo :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG54" size="17" maxlength="16" value="<%= crossRef.getE02GLXG54() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG54','','')">
		  <eibsinput:text property="D02GLXG54" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Ingreso por Recupero Reajuste Moroso Post Castigo :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG55" size="17" maxlength="16" value="<%= crossRef.getE02GLXG55() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG55','','')">
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
		  <input type="text" name="E02GLXG18" size="17" maxlength="16" value="<%= crossRef.getE02GLXG18() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG18','','')">
		  <eibsinput:text property="D02GLXG18" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Paso a Prestamo Vencido :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSM','','')">
		  <eibsinput:text property="D02GLMXSM" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Paso a Prestamo Vigente :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSR','','')">
		  <eibsinput:text property="D02GLMXSR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta para Condonaciones :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG49" size="17" maxlength="16" value="<%= crossRef.getE02GLXG49() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG49','','')">
		  <eibsinput:text property="D02GLXG49" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Pendientes por Cobrar :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG32" size="17" maxlength="16" value="<%= crossRef.getE02GLXG32() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG32','','')">
		  <eibsinput:text property="D02GLXG32" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Gastos de Cobranzas :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX26" size="17" maxlength="16" value="<%= crossRef.getE02GLMX26() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX26','','')">
		  <eibsinput:text property="D02GLMX26" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta para Reverso de Pagos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX32" size="17" maxlength="16" value="<%= crossRef.getE02GLMX32() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX32','','')">
		  <eibsinput:text property="D02GLMX32" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Pendiente por Cobrar Seguros :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX27" size="17" maxlength="16" value="<%= crossRef.getE02GLMX27() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX27','','')">
		  <eibsinput:text property="D02GLMX27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Pendiente por Cobrar Otros Conceptos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG33" size="17" maxlength="16" value="<%= crossRef.getE02GLXG33() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG33','','')">
		  <eibsinput:text property="D02GLXG33" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Provision</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Principal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG41" size="17" maxlength="16" value="<%= crossRef.getE02GLXG41() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG41','','')">
		  <eibsinput:text property="D02GLXG41" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Principal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG42" size="17" maxlength="16" value="<%= crossRef.getE02GLXG42() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG42','','')">
		  <eibsinput:text property="D02GLXG42" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Intereses Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG43" size="17" maxlength="16" value="<%= crossRef.getE02GLXG43() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG43','','')">
		  <eibsinput:text property="D02GLXG43" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Intereses Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG44" size="17" maxlength="16" value="<%= crossRef.getE02GLXG44() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG44','','')">
		  <eibsinput:text property="D02GLXG44" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Intereses de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG56" size="17" maxlength="16" value="<%= crossRef.getE02GLXG56() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG56','','')">
		  <eibsinput:text property="D02GLXG56" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Intereses de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG57" size="17" maxlength="16" value="<%= crossRef.getE02GLXG57() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG57','','')">
		  <eibsinput:text property="D02GLXG57" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Otros Cargos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG45" size="17" maxlength="16" value="<%= crossRef.getE02GLXG45() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG45','','')">
		  <eibsinput:text property="D02GLXG45" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Otros Cargos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG46" size="17" maxlength="16" value="<%= crossRef.getE02GLXG46() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG46','','')">
		  <eibsinput:text property="D02GLXG46" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Castigo</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Principal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG16" size="17" maxlength="16" value="<%= crossRef.getE02GLXG16() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG16','','')">
		  <eibsinput:text property="D02GLXG16" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Principal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG17" size="17" maxlength="16" value="<%= crossRef.getE02GLXG17() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG17','','')">
		  <eibsinput:text property="D02GLXG17" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Intereses Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG11" size="17" maxlength="16" value="<%= crossRef.getE02GLXG11() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG11','','')">
		  <eibsinput:text property="D02GLXG11" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Intereses Normal :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG12" size="17" maxlength="16" value="<%= crossRef.getE02GLXG12() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG12','','')">
		  <eibsinput:text property="D02GLXG12" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Intereses de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG58" size="17" maxlength="16" value="<%= crossRef.getE02GLXG58() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG58','','')">
		  <eibsinput:text property="D02GLXG58" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Intereses de Mora :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG59" size="17" maxlength="16" value="<%= crossRef.getE02GLXG59() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG59','','')">
		  <eibsinput:text property="D02GLXG59" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Otros Cargos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG47" size="17" maxlength="16" value="<%= crossRef.getE02GLXG47() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG47','','')">
		  <eibsinput:text property="D02GLXG47" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Otros Cargos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG48" size="17" maxlength="16" value="<%= crossRef.getE02GLXG48() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG48','','')">
		  <eibsinput:text property="D02GLXG48" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito Cuenta Castigo no Informado :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG19" size="17" maxlength="16" value="<%= crossRef.getE02GLXG19() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG19','','')">
		  <eibsinput:text property="D02GLXG19" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito Cuenta Castigo no Informado :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG20" size="17" maxlength="16" value="<%= crossRef.getE02GLXG20() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG20','','')">
		  <eibsinput:text property="D02GLXG20" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Provision Individual :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX28" size="17" maxlength="16" value="<%= crossRef.getE02GLMX28() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX28','','')">
		  <eibsinput:text property="D02GLMX28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Provision Global :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX29" size="17" maxlength="16" value="<%= crossRef.getE02GLMX29() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX29','','')">
		  <eibsinput:text property="D02GLMX29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Uso Provision :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX30" size="17" maxlength="16" value="<%= crossRef.getE02GLMX30() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX30','','')">
		  <eibsinput:text property="D02GLMX30" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta de Responsabilidad :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMX31" size="17" maxlength="16" value="<%= crossRef.getE02GLMX31() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX31','','')">
		  <eibsinput:text property="D02GLMX31" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito por Interes de Mora Post Castigo :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG50" size="17" maxlength="16" value="<%= crossRef.getE02GLXG50() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG50','','')">
		  <eibsinput:text property="D02GLXG50" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito por Interes de Mora Post Castigo :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG51" size="17" maxlength="16" value="<%= crossRef.getE02GLXG51() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG51','','')">
		  <eibsinput:text property="D02GLXG51" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Débito por Reajuste Moroso Post Castigo:</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG52" size="17" maxlength="16" value="<%= crossRef.getE02GLXG52() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG52','','')">
		  <eibsinput:text property="D02GLXG52" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Crédito por Reajuste Moroso Post Castigo:</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLXG53" size="17" maxlength="16" value="<%= crossRef.getE02GLXG53() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG53','','')">
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
			<input type="text" name="E02GLXG21" size="17" maxlength="16" value="<%= crossRef.getE02GLXG21() %>" onkeypress="enterInteger(event)"
           		class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG21','','')">
   		    <eibsinput:text property="D02GLXG21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Comisiones Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG22" size="17" maxlength="16" value="<%= crossRef.getE02GLXG22() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG22','','')">
   		    <eibsinput:text property="D02GLXG22" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Amortizacion Directa Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG23" size="17" maxlength="16" value="<%= crossRef.getE02GLXG23() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG23','','')">
   		    <eibsinput:text property="D02GLXG23" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Responsabilidad Amortizacion Directa Letras Hipotecarias :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG24" size="17" maxlength="16" value="<%= crossRef.getE02GLXG24() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG24','','')">
   		    <eibsinput:text property="D02GLXG24" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Comision Letras Hipotecarias Suspendidas Vigentes:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG25" size="17" maxlength="16" value="<%= crossRef.getE02GLXG25() %>" onkeypress="enterInteger(event)"
           	 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG25','','')">
   		    <eibsinput:text property="D02GLXG25" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Comision Letras Hipotecarias Suspendidas Vencidas:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG26" size="17" maxlength="16" value="<%= crossRef.getE02GLXG26() %>" onkeypress="enterInteger(event)"
    	       	 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG26','','')">
   		    <eibsinput:text property="D02GLXG26" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Interes Suspendido Vigente:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG27" size="17" maxlength="16" value="<%= crossRef.getE02GLXG27() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG27','','')">
   		    <eibsinput:text property="D02GLXG27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Reajuste Suspendido Vigente:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG28" size="17" maxlength="16" value="<%= crossRef.getE02GLXG28() %>" onkeypress="enterInteger(event)"
				class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG28','','')">
   		    <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Dividendos Vigentes:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG29" size="17" maxlength="16" value="<%= crossRef.getE02GLXG29() %>" onkeypress="enterInteger(event)"
           	 	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG29','','')">
   		    <eibsinput:text property="D02GLXG29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Dividendos Vencidos:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG30" size="17" maxlength="16" value="<%= crossRef.getE02GLXG30() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG30','','')">
   		    <eibsinput:text property="D02GLXG30" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Dividendos Acelerados:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG31" size="17" maxlength="16" value="<%= crossRef.getE02GLXG31() %>" onkeypress="enterInteger(event)"
           		 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG31','','')">
   		    <eibsinput:text property="D02GLXG31" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Castigos del año:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG32" size="17" maxlength="16" value="<%= crossRef.getE02GLXG32() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG32','','')">
   		    <eibsinput:text property="D02GLXG32" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Seguros Vigentes:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG33" size="17" maxlength="16" value="<%= crossRef.getE02GLXG33() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG33','','')">
   		    <eibsinput:text property="D02GLXG33" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Seguros Vencidos:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG34" size="17" maxlength="16" value="<%= crossRef.getE02GLXG34() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG34','','')">
   		    <eibsinput:text property="D02GLXG34" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Constituci&oacute;n Seguros Castigados:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG35" size="17" maxlength="16" value="<%= crossRef.getE02GLXG35() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG35','','')">
   		    <eibsinput:text property="D02GLXG35" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Comision Letras Hipotecarias Suspendidas Castigadas:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG36" size="17" maxlength="16" value="<%= crossRef.getE02GLXG36() %>" onkeypress="enterInteger(event)"
           		 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG36','','')">
   		    <eibsinput:text property="D02GLXG36" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Fondo de Amortizaci&oacute;n Extraordinaria:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG37" size="17" maxlength="16" value="<%= crossRef.getE02GLXG37() %>" onkeypress="enterInteger(event)"
           		 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG37','','')">
   		    <eibsinput:text property="D02GLXG37" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Fondo de Inter&eacute;s Ordinario:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG38" size="17" maxlength="16" value="<%= crossRef.getE02GLXG38() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG38','','')">
   		    <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Reajuste Suspendido Castigado:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG39" size="17" maxlength="16" value="<%= crossRef.getE02GLXG39() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG39','','')">
   		    <eibsinput:text property="D02GLXG39" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Interés Suspendido Castigado:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG40" size="17" maxlength="16" value="<%= crossRef.getE02GLXG40() %>" onkeypress="enterInteger(event)"
           		 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG40','','')">
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
			<input type="text" name="E02GLXG21" size="17" maxlength="16" value="<%= crossRef.getE02GLXG21() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG21','','')">
   		    <eibsinput:text property="D02GLXG21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Pago DCV:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG22" size="17" maxlength="16" value="<%= crossRef.getE02GLXG22() %>" onkeypress="enterInteger(event)"
				class="context-menu-help"  onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG22','','')">
   		    <eibsinput:text property="D02GLXG22" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Amortización Ordinaria Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG23" size="17" maxlength="16" value="<%= crossRef.getE02GLXG23() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG23','','')">
   		    <eibsinput:text property="D02GLXG23" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Interés Ordinario Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG24" size="17" maxlength="16" value="<%= crossRef.getE02GLXG24() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG24','','')">
   		    <eibsinput:text property="D02GLXG24" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Amortización Extraordinaria Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG25" size="17" maxlength="16" value="<%= crossRef.getE02GLXG25() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG25','','')">
   		    <eibsinput:text property="D02GLXG25" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Responsabilidad Letras Hipotecarias:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG26" size="17" maxlength="16" value="<%= crossRef.getE02GLXG26() %>" onkeypress="enterInteger(event)"
           		 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG26','','')">
   		    <eibsinput:text property="D02GLXG26" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Pagar&eacute; Cup&oacute;n: </td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG27" size="17" maxlength="16" value="<%= crossRef.getE02GLXG27() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG27','','')">
   		    <eibsinput:text property="D02GLXG27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Responsabilidad Pagar&eacute; Cup&oacute;n:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG28" size="17" maxlength="16" value="<%= crossRef.getE02GLXG28() %>" onkeypress="enterInteger(event)"
           		 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG28','','')">
   		    <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Reserva T&eacute;cnica:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG29" size="17" maxlength="16" value="<%= crossRef.getE02GLXG29() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG29','','')">
   		    <eibsinput:text property="D02GLXG29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Responsabilidad Reserva T&eacute;cnica:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG30" size="17" maxlength="16" value="<%= crossRef.getE02GLXG30() %>" onkeypress="enterInteger(event)"
           		 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG30','','')">
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
			<input type="text" name="E02GLXG21" size="17" maxlength="16" value="<%= crossRef.getE02GLXG21() %>" onkeypress="enterInteger(event)"
           		class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG21','','')">
   		    <eibsinput:text property="D02GLXG21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Interés Mora:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG22" size="17" maxlength="16" value="<%= crossRef.getE02GLXG22() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG22','','')">
   		    <eibsinput:text property="D02GLXG22" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Interés  Suspenso:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG23" size="17" maxlength="16" value="<%= crossRef.getE02GLXG23() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG23','','')">
   		    <eibsinput:text property="D02GLXG23" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Interés  Mora Suspenso :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG24" size="17" maxlength="16" value="<%= crossRef.getE02GLXG24() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG24','','')">
   		    <eibsinput:text property="D02GLXG24" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	
	<% if (!crossRef.getE02GLMREV().equals("N")) { %>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Interés Corrección Monetaria :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG25" size="17" maxlength="16" value="<%= crossRef.getE02GLXG25() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG25','','')">
   		    <eibsinput:text property="D02GLXG25" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Suspenso Corrección Monetaria :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG26" size="17" maxlength="16" value="<%= crossRef.getE02GLXG26() %>" onkeypress="enterInteger(event)"
				class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG26','','')">
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
			<input type="text" name="E02GLXG27" size="17" maxlength="16" value="<%= crossRef.getE02GLXG27() %>" onkeypress="enterInteger(event)"
           		class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG27','','')">
   		    <eibsinput:text property="D02GLXG27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito Cuenta en Suspenso x Comision :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG28" size="17" maxlength="16" value="<%= crossRef.getE02GLXG28() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG28','','')">
   		    <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito Cuenta en Suspenso x Comision :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG29" size="17" maxlength="16" value="<%= crossRef.getE02GLXG29() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG29','','')">
   		    <eibsinput:text property="D02GLXG29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Cupo Rotativo </TH>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Contrapartida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG53" size="17" maxlength="16" value="<%= crossRef.getE02GLXG53() %>" onkeypress="enterInteger(event)"
           		class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG53','','')">
   		    <eibsinput:text property="D02GLXG53" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap></td>
		<td align="left" width="70%" nowrap>
			
		</td>
	</tr>
<%-- 
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito x Utilizaciones :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG55" size="17" maxlength="16" value="<%= crossRef.getE02GLXG55() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG55','','')">
   		    <eibsinput:text property="D02GLXG55" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap></td>
		<td align="left" width="70%" nowrap>
			
		</td>
	</tr>
	 
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Credito Cuenta en Suspenso x Impuesto :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG30" size="17" maxlength="16" value="<%= crossRef.getE02GLXG30() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG30','','')">
   		    <eibsinput:text property="D02GLXG30" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Debito Cuenta en Suspenso x Impuesto :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG31" size="17" maxlength="16" value="<%= crossRef.getE02GLXG31() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG31','','')">
   		    <eibsinput:text property="D02GLXG31" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
--%>

</table>
<% } %>


<% if (crossRef.getE02GLMACD().equals("50") || crossRef.getE02GLMACD().equals("51")) { %>
<H4>Modulo de Cobranzas</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Comisiones por Cobrar :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" onkeypress="enterInteger(event)"
           		 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXDR','','')">
   		    <eibsinput:text property="D02GLMXDR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Contrapartida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
   		    <eibsinput:text property="D02GLMXCR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Retenciones de Impuestos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX16','','')">
   		    <eibsinput:text property="D02GLMX16" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Otras Retenciones :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX17" size="17" maxlength="16" value="<%= crossRef.getE02GLMX17() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX17','','')">
   		    <eibsinput:text property="D02GLMX17" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Intereses de Terceros :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" onkeypress="enterInteger(event)"
           		class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXST','','')">
   		    <eibsinput:text property="D02GLMXST" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Gastos del Corresponsal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
   		    <eibsinput:text property="D02GLMXIE" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("40") || crossRef.getE02GLMACD().equals("41") 
  		|| crossRef.getE02GLMACD().equals("42") || crossRef.getE02GLMACD().equals("43")) { %>
<H4>Modulo de Cartas de Crédito</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Comisiones por Cobrar :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXDR','','')">
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td align="right" width="30%">Cuenta Contrapartida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Débito Aceptaciones:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSD','','')">
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Crédito Aceptaciones :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXST','','')">
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Garantia Efectivo :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSR','','')">
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Aceptaciones Descontadas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSO','','')">
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Refinanciamientos (Prestamos) :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSS','','')">
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Débito Pagos Diferidos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Crédito Pagos Diferidos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMDFP','','')">
			<input type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Periodificación de Interes</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Débito por Intereses :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX21','','')">
			<input type="text" name="D02GLMX21" size="62" maxlength="60" value="<%= crossRef.getD02GLMX21() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Crédito por Intereses :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX22','','')">
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("01") || crossRef.getE02GLMACD().equals("02") || crossRef.getE02GLMACD().equals("03") || crossRef.getE02GLMACD().equals("04")) { %>
<H4>Modulo de Depositos a la Vista</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Créditos</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Crédito de Interes :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cargos por Servicio Saldo Minimo :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSM','','')">
			<input type="text" name="D02GLMXSM" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSM() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cargos por Servicio Diferidos/Sobregiro :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSR','','')">
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cargos por Servicio Suspension Pagos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" onkeypress="enterInteger(event)"
           		 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSS','','')">
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cargos por Servicio Cuentas Inactivas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSD','','')">
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cargos por Servicio Varios :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXST','','')">
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cuenta Pendientes por Cobrar :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG32" size="17" maxlength="16" value="<%= crossRef.getE02GLXG32() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG32','','')">
			<input type="text" name="D02GLXG32" size="62" maxlength="60" value="<%= crossRef.getD02GLXG32() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantias (Contingencia) :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXDR','','')">
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Comisiones por Cancelaciones :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCC() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCC','','')">
			<input type="text" name="D02GLMXCC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cheques Certificados :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX17" size="17" maxlength="16" value="<%= crossRef.getE02GLMX17() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX17','','')">
			<input type="text" name="D02GLMX17" size="62" maxlength="60" value="<%= crossRef.getD02GLMX17() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TD align="right" width="30%">Cargo de Timbres por Cheque :</TD>
		<TD align="left" width="70%" nowrap>
			<INPUT type="text" name="E02GLMX28" size="17" maxlength="16" value="<%= crossRef.getE02GLMX28() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX28','','')">
			<INPUT type="text" name="D02GLMX28" size="62" maxlength="60" value="<%= crossRef.getD02GLMX28() %>" readonly>
		</TD>
	</TR>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TD align="right" width="30%">Cuenta Crédito por Cancelación :</TD>
		<TD align="left" width="70%" nowrap>
			<INPUT type="text" name="E02GLMX32" size="17" maxlength="16" value="<%= crossRef.getE02GLMX32() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX32','','')">
			<INPUT type="text" name="D02GLMX32" size="62" maxlength="60" value="<%= crossRef.getD02GLMX32() %>" readonly>
		</TD>
	</TR>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Débitos</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta por Contra Sobregiro Garantizado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXLR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXLR','','')">
			<input type="text" name="D02GLMXLR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta por Contra Sobregiro No Garantizado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXOD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXOD() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXOD','','')">
			<input type="text" name="D02GLMXOD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXOD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Gastos Intereses (MMK,SAV,NOW) :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantias (Contingencia) :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMDFP','','')">
			<input type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Por Contra Cuentas Inactivas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX19" size="17" maxlength="16" value="<%= crossRef.getE02GLMX19() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX19','','')">
			<input type="text" name="D02GLMX19" size="62" maxlength="60" value="<%= crossRef.getD02GLMX19() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Por Contra Cuentas Dormidas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX20" size="17" maxlength="16" value="<%= crossRef.getE02GLMX20() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX20','','')">
			<input type="text" name="D02GLMX20" size="62" maxlength="60" value="<%= crossRef.getD02GLMX20() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Gastos por Bonificaciones : </td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG01" size="17" maxlength="16" value="<%= crossRef.getE02GLXG01() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG01','','')">
			<input type="text" name="D02GLXG01" size="62" maxlength="60" value="<%= crossRef.getD02GLXG01() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Condonacion de Impagos:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG33" size="17" maxlength="16" value="<%= crossRef.getE02GLXG33() %>" onkeypress="enterInteger(event)"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG33','','')">
   		    <eibsinput:text property="D02GLXG33" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Debito por Intereses de Sobregiros</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro Dias Ciclo 1 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX16','','')">
			<input type="text" name="D02GLMX16" size="62" maxlength="60" value="<%= crossRef.getD02GLMX16() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro Dias Ciclo 2 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG13" size="17" maxlength="16" value="<%= crossRef.getE02GLXG13() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG13','','')">
			<input type="text" name="D02GLXG13" size="62" maxlength="60" value="<%= crossRef.getD02GLXG13() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro Dias Ciclo 3 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG14" size="17" maxlength="16" value="<%= crossRef.getE02GLXG14() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG14','','')">
			<input type="text" name="D02GLXG14" size="62" maxlength="60" value="<%= crossRef.getD02GLXG14() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro Dias Ciclo 4 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG15" size="17" maxlength="16" value="<%= crossRef.getE02GLXG15() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG15','','')">
			<input type="text" name="D02GLXG15" size="62" maxlength="60" value="<%= crossRef.getD02GLXG15() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro Dias Ciclo 5 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG16" size="17" maxlength="16" value="<%= crossRef.getE02GLXG16() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG16','','')">
			<input type="text" name="D02GLXG16" size="62" maxlength="60" value="<%= crossRef.getD02GLXG16() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Suspenso :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG30" size="17" maxlength="16" value="<%= crossRef.getE02GLXG30() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG30','','')">
			<input type="text" name="D02GLXG30" size="62" maxlength="60" value="<%= crossRef.getD02GLXG30() %>" readonly>
		</td>
	</tr>


	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Credito por Intereses de Sobregiros</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro Dias Ciclo 1 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSO','','')">
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro Dias Ciclo 2 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG21" size="17" maxlength="16" value="<%= crossRef.getE02GLXG21() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG21','','')">
			<input type="text" name="D02GLXG21" size="62" maxlength="60" value="<%= crossRef.getD02GLXG21() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro Dias Ciclo 3 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG22" size="17" maxlength="16" value="<%= crossRef.getE02GLXG22() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG22','','')">
			<input type="text" name="D02GLXG22" size="62" maxlength="60" value="<%= crossRef.getD02GLXG22() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro Dias Ciclo 4 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG23" size="17" maxlength="16" value="<%= crossRef.getE02GLXG23() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG23','','')">
			<input type="text" name="D02GLXG23" size="62" maxlength="60" value="<%= crossRef.getD02GLXG23() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro Dias Ciclo 5 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG24" size="17" maxlength="16" value="<%= crossRef.getE02GLXG24() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG24','','')">
			<input type="text" name="D02GLXG24" size="62" maxlength="60" value="<%= crossRef.getD02GLXG24() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Suspenso :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXLC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLC() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXLC','','')">
			<input type="text" name="D02GLMXLC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLC() %>" readonly>
		</td>
	</tr>


	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Debito por Intereses de Sobregiros en Contingencia</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Contingencia Dias Ciclo 1 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX26" size="17" maxlength="16" value="<%= crossRef.getE02GLMX26() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX26','','')">
			<input type="text" name="D02GLMX26" size="62" maxlength="60" value="<%= crossRef.getD02GLMX26() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Contingencia Dias Ciclo 2 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG17" size="17" maxlength="16" value="<%= crossRef.getE02GLXG17() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG17','','')">
			<input type="text" name="D02GLXG17" size="62" maxlength="60" value="<%= crossRef.getD02GLXG17() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Contingencia Dias Ciclo 3 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG18" size="17" maxlength="16" value="<%= crossRef.getE02GLXG18() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG18','','')">
			<input type="text" name="D02GLXG18" size="62" maxlength="60" value="<%= crossRef.getD02GLXG18() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Contingencia Dias Ciclo 4 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG19" size="17" maxlength="16" value="<%= crossRef.getE02GLXG19() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG19','','')">
			<input type="text" name="D02GLXG19" size="62" maxlength="60" value="<%= crossRef.getD02GLXG19() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Contingencia Dias Ciclo 5 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG20" size="17" maxlength="16" value="<%= crossRef.getE02GLXG20() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG20','','')">
			<input type="text" name="D02GLXG20" size="62" maxlength="60" value="<%= crossRef.getD02GLXG20() %>" readonly>
		</td>
	</tr>


	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Debito por Intereses de Sobregiros en Contingencia</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Contingencia Dias Ciclo 1 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX27" size="17" maxlength="16" value="<%= crossRef.getE02GLMX27() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX27','','')">
			<input type="text" name="D02GLMX27" size="62" maxlength="60" value="<%= crossRef.getD02GLMX27() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Contingencia Dias Ciclo 2 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG26" size="17" maxlength="16" value="<%= crossRef.getE02GLXG26() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG26','','')">
			<input type="text" name="D02GLXG26" size="62" maxlength="60" value="<%= crossRef.getD02GLXG26() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Contingencia Dias Ciclo 3 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG27" size="17" maxlength="16" value="<%= crossRef.getE02GLXG27() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG27','','')">
			<input type="text" name="D02GLXG27" size="62" maxlength="60" value="<%= crossRef.getD02GLXG27() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Contingencia Dias Ciclo 4 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG28" size="17" maxlength="16" value="<%= crossRef.getE02GLXG28() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG28','','')">
			<input type="text" name="D02GLXG28" size="62" maxlength="60" value="<%= crossRef.getD02GLXG28() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Interes de Sobregiro en Contingencia Dias Ciclo 5 :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG29" size="17" maxlength="16" value="<%= crossRef.getE02GLXG29() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG29','','')">
			<input type="text" name="D02GLXG29" size="62" maxlength="60" value="<%= crossRef.getD02GLXG29() %>" readonly>
		</td>
	</tr>


	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Retencion Contingente Cuentas AFC</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contingencias Débito :</td>
		<td align="left" width="60%" nowrap><input type="text"
			name="E02GLMX18" size="17" maxlength="16"
			value="<%= crossRef.getE02GLMX18() %>" onkeypress="enterInteger(event)"
            class="context-menu-help"
			onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX18','','')">
		<input type="text" name="D02GLMX18" size="62" maxlength="60"
			value="<%= crossRef.getD02GLMX18() %>" readonly></td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contingencias Crédito :</td>
		<td align="left" width="60%" nowrap><input type="text"
			name="E02GLMX29" size="17" maxlength="16"
			value="<%= crossRef.getE02GLMX29() %>" onkeypress="enterInteger(event)"
            class="context-menu-help"
			onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX29','','')">
		<input type="text" name="D02GLMX29" size="62" maxlength="60"
			value="<%= crossRef.getD02GLMX29() %>" readonly></td>
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
		<td align="left" width="60%" nowrap><input type="text"
			name="E02GLMX31" size="17" maxlength="16"
			value="<%= crossRef.getE02GLMX31() %>" onkeypress="enterInteger(event)"
            class="context-menu-help"
			onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX31','','')">
		<input type="text" name="D02GLMX31" size="62" maxlength="60"
			value="<%= crossRef.getD02GLMX31() %>" readonly></td>
	</tr>

	
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Traslado a ICETEX</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito por Traslado :</td>
		<td align="left" width="60%" nowrap><input type="text"
			name="E02GLXG05" size="17" maxlength="16"
			value="<%= crossRef.getE02GLXG05() %>" onkeypress="enterInteger(event)"
            class="context-menu-help"
			onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG05','','')">
		<input type="text" name="D02GLXG05" size="62" maxlength="60"
			value="<%= crossRef.getD02GLXG05() %>" readonly></td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito por Traslado :</td>
		<td align="left" width="60%" nowrap><input type="text"
			name="E02GLXG06" size="17" maxlength="16"
			value="<%= crossRef.getE02GLXG06() %>" onkeypress="enterInteger(event)"
            class="context-menu-help"
			onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG06','','')">
		<input type="text" name="D02GLXG06" size="62" maxlength="60"
			value="<%= crossRef.getD02GLXG06() %>" readonly></td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito por Interes :</td>
		<td align="left" width="60%" nowrap><input type="text"
			name="E02GLXG07" size="17" maxlength="16"
			value="<%= crossRef.getE02GLXG07() %>" onkeypress="enterInteger(event)"
            class="context-menu-help"
			onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG07','','')">
		<input type="text" name="D02GLXG07" size="62" maxlength="60"
			value="<%= crossRef.getD02GLXG07() %>" readonly></td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito por Interes :</td>
		<td align="left" width="60%" nowrap><input type="text"
			name="E02GLXG08" size="17" maxlength="16"
			value="<%= crossRef.getE02GLXG08() %>" onkeypress="enterInteger(event)"
            class="context-menu-help"
			onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG08','','')">
		<input type="text" name="D02GLXG08" size="62" maxlength="60"
			value="<%= crossRef.getD02GLXG08() %>" readonly></td>
	</tr>
	

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Otras Entradas</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Diferidos a 24 Horas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX21','','')">
			<input type="text" name="D02GLMX21" size="62" maxlength="60" value="<%= crossRef.getD02GLMX21() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Diferidos a 48 Horas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX22','','')">
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Diferidos a 72 Horas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX23" size="17" maxlength="16" value="<%= crossRef.getE02GLMX23() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX23','','')">
			<input type="text" name="D02GLMX23" size="62" maxlength="60" value="<%= crossRef.getD02GLMX23() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Diferidos a 96 Horas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX24" size="17" maxlength="16" value="<%= crossRef.getE02GLMX24() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX24','','')">
			<input type="text" name="D02GLMX24" size="62" maxlength="60" value="<%= crossRef.getD02GLMX24() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Diferidos Mas 96 Horas :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX25" size="17" maxlength="16" value="<%= crossRef.getE02GLMX25() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX25','','')">
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
			<input type="text" name="E02GLXG01" size="17" maxlength="16" value="<%= crossRef.getE02GLXG01() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG01','','')">
			<input type="text" name="D02GLXG01" size="62" maxlength="60" value="<%= crossRef.getD02GLXG01() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("90") || crossRef.getE02GLMACD().equals("92")) { %>
<H4>Modulo de Amortización / Garantias / Lineas de Crédito / Otros
Productos</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%">(*)</td>
		<td align="right" width="28%">Cuenta Contrapartida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXDR','','')">
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%">(**)</td>
		<td align="right" width="28%">Cuenta Amortización :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" width="28%">Cuenta de Débito Monto Usado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX21','','')">
			<input type="text" name="D02GLMX21" size="62" maxlength="60" value="<%= crossRef.getD02GLMX21() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" width="28%">Cuenta de Crédito Monto Usado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX22','','')">
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" colspan="2"></td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" valign="top" width="2%">(*)</td>
		<td align="left" colspan="2">Cuenta de Contrapartida sera usada para GARANTIAS, LINEAS DE Crédito Y OTROS.</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" valign="top" width="2%">(**)</td>
		<td align="left" colspan="2">La Cuenta de Ingresos x Comision o Gastos Prepagados serán utilizadas para la Amortización Diaria;
		Ingresos y Egresos serán afectados a diario de acuerdo a la clasificación de la Cuenta Principal Utilizada. (Cuenta Contable
		Reflejada Arriba)</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" valign="top" width="2%">(**)</td> 
		<td align="left" colspan="2">Lineas de Crédito usaran la cuenta de Amortización para incluir la cuenta de Ingresos por Comisión.</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("91")) { %>
<H4>Módulo de Garantias</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Contrapartida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXDR','','')">
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
<%-- 
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Contrapartida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
--%>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuentas Futuras :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSD','','')">
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantía Idónea Utilizada Comercial :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXST','','')">
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantía Idónea Utilizada Consumo :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSR','','')">
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantía Idónea Utilizada Vivienda :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSO','','')">
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantía Idónea Utilizada Microcrédito  :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX22','','')">
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantía NO Idónea Utilizada Comercial :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSS','','')">
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantía NO Idónea Utilizada Consumo :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantía NO Idónea Utilizada Vivienda :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMDFP','','')">
			<input type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantía NO Idónea Utilizada Microcrédito :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX23" size="17" maxlength="16" value="<%= crossRef.getE02GLMX23() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX23','','')">
			<input type="text" name="D02GLMX23" size="62" maxlength="60" value="<%= crossRef.getD02GLMX23() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Pendiente por Cancelar :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX21','','')">
			<input type="text" name="D02GLMX21" size="62" maxlength="60" value="<%= crossRef.getD02GLMX21() %>" readonly>
		</td>
	</tr>
	<%-- 
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito Pendiente por Cancelar NO Idonea :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX22','','')">
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito Pendiente por Cancelar NO Idonea :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX23" size="17" maxlength="16" value="<%= crossRef.getE02GLMX23() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX22','','')">
			<input type="text" name="D02GLMX23" size="62" maxlength="60" value="<%= crossRef.getD02GLMX23() %>" readonly>
		</td>
	</tr>
--%>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito Titularizacion :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX24" size="17" maxlength="16" value="<%= crossRef.getE02GLMX24() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX23','','')">
			<input type="text" name="D02GLMX24" size="62" maxlength="60" value="<%= crossRef.getD02GLMX24() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito Titularizacion :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX25" size="17" maxlength="16" value="<%= crossRef.getE02GLMX25() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX24','','')">
			<input type="text" name="D02GLMX25" size="62" maxlength="60" value="<%= crossRef.getD02GLMX25() %>" readonly>
		</td>
	</tr>
</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("70") || crossRef.getE02GLMACD().equals("71")) { %>
<H4>Modulo Productos Externos a eIBS</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" width="28%">Débito: Cuentas por Cobrara Intereses :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXDR','','')">
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" width="28%">Crédito: Ingreso por Intereses :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" width="28%">Débito: Intereses Contingentes :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX21','','')">
			<input type="text" name="D02GLMX21" size="62" maxlength="60" value="<%= crossRef.getD02GLMX21() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" width="28%">Crédito: Por Contra Intereses Contingentes :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX22','','')">
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="2%"></td>
		<td align="right" colspan="2"></td>
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
		<td align="right" width="30%">Débito por Interes Normal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" 	name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXDR','','')">
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito por Interes Normal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito por Interes Certificado Vencido :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXLR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXLR','','')">
			<input type="text" name="D02GLMXLR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito por Interes Certificado Vencido :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXLC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLC() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXLC','','')">
			<input type="text" name="D02GLMXLC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Entradas Garantias</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Débito Contingencia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Crédito Contingencia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMDFP','','')">
			<input type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Débito Monto Usado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX21" size="17" maxlength="16" value="<%= crossRef.getE02GLMX21() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX21','','')">
			<input type="text" name="D02GLMX21" size="62" maxlength="60" value="<%= crossRef.getD02GLMX21() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Crédito Monto Usado :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX22" size="17" maxlength="16" value="<%= crossRef.getE02GLMX22() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX22','','')">
			<input type="text" name="D02GLMX22" size="62" maxlength="60" value="<%= crossRef.getD02GLMX22() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Referencias Adicionales</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Operación dada en Garantia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSO','','')">
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Origen del Contrato :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSR','','')">
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Contratos Vencidos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSM','','')">
			<input type="text" name="D02GLMXSM" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSM() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Anulación de Certificados :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXO2" size="17" maxlength="16" value="<%= crossRef.getE02GLMXO2() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXO2','','')">
			<input type="text" name="D02GLMXO2" size="62" maxlength="60" value="<%= crossRef.getD02GLMXO2() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TD align="right" width="30%">
		<DIV align="right">Cuenta Remanentes por Pago Cuenta Inactiva/Bloqueada :</DIV>
		</TD>
		<TD align="left" width="70%" nowrap>
		<DIV align="left">
			<INPUT type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
			<INPUT type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</DIV>
		</TD>
	</TR>

	<% if (crossRef.getE02GLMACD().equals("12")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%" nowrap>Cancelación de Bonos :</td>
		<td align="left" width="70%" nowrap>
		  <input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" onkeypress="enterInteger(event)"
            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSD','','')">
		  <eibsinput:text property="D02GLMXSD" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
		</td>

	</tr>
	<% } %>




</table>
<% } %> 

<% if (crossRef.getE02GLMACD().equals("13")) { %>
<H4>Modulo de Inversiones (Papel Comercial)</H4>
<table class="tableinfo">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Periodificación de Interes</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Débito por Interes :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXDR','','')">
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Crédito por Interes :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Custodio (Contingencias)</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Débito :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Crédito :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMDFP','','')">
			<input type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Otras Entradas</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Amortización de Prima :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSD','','')">
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Amortización de Descuento :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSO','','')">
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Ajuste de Precio de Mercado :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSM','','')">
			<input type="text" name="D02GLMXSM" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSM() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%" nowrap>Contrapartida Ajuste por Ganancias :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSR','','')">
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%" nowrap>Contrapartida Ajuste por Perdidas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXCC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCC() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCC','','')">
			<input type="text" name="D02GLMXCC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Ganancias por Ventas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSS','','')">
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Perdidas por Ventas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXLC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLC() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXLC','','')">
			<input type="text" name="D02GLMXLC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Inversiones Vencidas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX16','','')">
			<input type="text" name="D02GLMX16" size="62" maxlength="60" value="<%= crossRef.getD02GLMX16() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Ganancias Realizadas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXO2" size="17" maxlength="16" value="<%= crossRef.getE02GLMXO2() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXO2','','')">
			<input type="text" name="D02GLMXO2" size="62" maxlength="60" value="<%= crossRef.getD02GLMXO2() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="21%">Cuenta de Perdidas Realizadas :</td>
		<td align="left" nowrap width="79%">
			<input type="text" name="E02GLMXLR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXLR','','')">
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
		<td align="right" width="30%">Crédito por Solicitud Recibida :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
			<input type="text" name="D02GLMXCR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCR() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Aprobación Solicitud</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito Solicitud Aprobada :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSM','','')">
			<input type="text" name="D02GLMXSM" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSM() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito Solicitud Aprobada :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSR','','')">
			<input type="text" name="D02GLMXSR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Protocolización</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito Protocolizado por Utilizar :
		</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSS','','')">
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito Protocolizado por Utilizar
		:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSD','','')">
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Referencias Adicionales</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contribución :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXST','','')">
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Anticipos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSO','','')">
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Prima Fondo de Garantia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXDR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXDR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXDR','','')">
			<input type="text" name="D02GLMXDR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXDR() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Retención Fiel Cumplimiento :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXCC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCC() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCC','','')">
			<input type="text" name="D02GLMXCC" size="62" maxlength="60" value="<%= crossRef.getD02GLMXCC() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Pago de Valuaciones :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX16','','')">
			<input type="text" name="D02GLMX16" size="62" maxlength="60" value="<%= crossRef.getD02GLMX16() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Comisiones y Otros :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXOD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXOD() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXOD','','')">
			<input type="text" name="D02GLMXOD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXOD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Honorarios Inspector :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXO2" size="17" maxlength="16" value="<%= crossRef.getE02GLMXO2() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXO2','','')">
			<input type="text" name="D02GLMXO2" size="62" maxlength="60" value="<%= crossRef.getD02GLMXO2() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Retención Fiel Cumplimiento Inspector :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contrapartida Adicional :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX17" size="17" maxlength="16" value="<%= crossRef.getE02GLMX17() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX17','','')">
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
		<td align="right" width="30%">Cuenta Débito Contingencia :</td>
		<td align="left" width="60%" nowrap>
			<input type="text" name="E02GLMXO2" size="17" maxlength="16" value="<%= crossRef.getE02GLMXO2() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXO2','','')">
			<input type="text" name="D02GLMXO2" size="62" maxlength="60" value="<%= crossRef.getD02GLMXO2() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Crédito Contingencia :</td>
		<td align="left" width="60%" nowrap>
			<input type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX16','','')">
			<input type="text" name="D02GLMX16" size="62" maxlength="60" value="<%= crossRef.getD02GLMX16() %>" readonly>
		</td>
	</tr>
<%-- 
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Entradas Garantias</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantia Idonea :</td>
		<td align="left" width="60%" nowrap>
			<input type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
			<input type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Garantia NO Idonea :</td>
		<td align="left" width="60%" nowrap>
			<input type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMDFP','','')">
			<input type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
		</td>
	</tr>
--%>
<% }%>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Contratos a Futuro</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito Contingencia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXST','','')">
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito Contingencia :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMXOD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXOD() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXOD','','')">
			<input type="text" name="D02GLMXOD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXOD() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Proyeccion Intereses</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Intereses Débito :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX23" size="17" maxlength="16" value="<%= crossRef.getE02GLMX23() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX23','','')">
			<input type="text" name="D02GLMX23" size="62" maxlength="60" value="<%= crossRef.getD02GLMX23() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Intereses Créditos :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX24" size="17" maxlength="16" value="<%= crossRef.getE02GLMX24() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX24','','')">
			<input type="text" name="D02GLMX24" size="62" maxlength="60" value="<%= crossRef.getD02GLMX24() %>" readonly>
		</td>
	</tr>

	<% if (!crossRef.getE02GLMACD().equals("10")) { %>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Registro de Custodia :</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito Custodia Magnetica :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX26" size="17" maxlength="16" value="<%= crossRef.getE02GLMX26() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX26','','')">
			<input type="text" name="D02GLMX26" size="62" maxlength="60" value="<%= crossRef.getD02GLMX26() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito Custodia Magnetica :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX27" size="17" maxlength="16" value="<%= crossRef.getE02GLMX27() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX27','','')">
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
			<input type="text" name="E02GLXG01" size="17" maxlength="16" value="<%= crossRef.getE02GLXG01() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG01','','')">
			<input type="text" name="D02GLXG01" size="62" maxlength="60" value="<%= crossRef.getD02GLXG01() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta Contable Fideicomiso:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG02" size="17" maxlength="16" value="<%= crossRef.getE02GLXG02() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG02','','')">
			<input type="text" name="D02GLXG02" size="62" maxlength="60" value="<%= crossRef.getD02GLXG02() %>" readonly>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Disponibilidad :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG03" size="17" maxlength="16" value="<%= crossRef.getE02GLXG03() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG03','','')">
			<input type="text" name="D02GLXG03" size="62" maxlength="60" value="<%= crossRef.getD02GLXG03() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Aporte FAOV por Pagar :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG04" size="17" maxlength="16" value="<%= crossRef.getE02GLXG04() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG04','','')">
			<input type="text" name="D02GLXG04" size="62" maxlength="60" value="<%= crossRef.getD02GLXG04() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Contrapartida por Seguros :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG05" size="17" maxlength="16" value="<%= crossRef.getE02GLXG05() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG05','','')">
			<input type="text" name="D02GLXG05" size="62" maxlength="60" value="<%= crossRef.getD02GLXG05() %>" readonly></td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">:</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG06" size="17" maxlength="16" value="<%= crossRef.getE02GLXG06() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG06','','')">
			<input type="text" name="D02GLXG06" size="62" maxlength="60" value="<%= crossRef.getD02GLXG06() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Intermediación Financiera :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG07" size="17" maxlength="16" value="<%= crossRef.getE02GLXG07() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG07','','')">
			<input type="text" name="D02GLXG07" size="62" maxlength="60" value="<%= crossRef.getD02GLXG07() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Ingresos por Intermediación :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG08" size="17" maxlength="16" value="<%= crossRef.getE02GLXG08() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG08','','')">
			<input type="text" name="D02GLXG08" size="62" maxlength="60" value="<%= crossRef.getD02GLXG08() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Obligaciones con BANAVIH :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG09" size="17" maxlength="16" value="<%= crossRef.getE02GLXG09() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG09','','')">
			<input type="text" name="D02GLXG09" size="62" maxlength="60" value="<%= crossRef.getD02GLXG09() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Gastos BANAVIH :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG10" size="17" maxlength="16" value="<%= crossRef.getE02GLXG10() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG10','','')">
			<input type="text" name="D02GLXG10" size="62" maxlength="60" value="<%= crossRef.getD02GLXG10() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Rendimientos no Cobrados :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG11" size="17" maxlength="16" value="<%= crossRef.getE02GLXG11() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG11','','')">
			<input type="text" name="D02GLXG11" size="62" maxlength="60" value="<%= crossRef.getD02GLXG11() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Costos Operativos BANAVIH :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG12" size="17" maxlength="16" value="<%= crossRef.getE02GLXG12() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG12','','')">
			<input type="text" name="D02GLXG12" size="62" maxlength="60" value="<%= crossRef.getD02GLXG12() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Fideicomiso de Inversion :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG13" size="17" maxlength="16" value="<%= crossRef.getE02GLXG13() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG13','','')">
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
		<td align="right" width="30%">Débito Principal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG41" size="17" maxlength="16" value="<%= crossRef.getE02GLXG41() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG41','','')">
			<input type="text" name="D02GLXG41" size="62" maxlength="60" value="<%= crossRef.getD02GLXG41() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito Principal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX31" size="17" maxlength="16" value="<%= crossRef.getE02GLMX31() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX31','','')">
			<input type="text" name="D02GLMX31" size="62" maxlength="60" value="<%= crossRef.getD02GLMX31() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito Intereses :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLXG42" size="17" maxlength="16" value="<%= crossRef.getE02GLXG42() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLXG42','','')">
			<input type="text" name="D02GLXG42" size="62" maxlength="60" value="<%= crossRef.getD02GLXG42() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito Intereses :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX20" size="17" maxlength="16" value="<%= crossRef.getE02GLMX20() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX20','','')">
			<input type="text" name="D02GLMX20" size="62" maxlength="60" value="<%= crossRef.getD02GLMX20() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<TH align="left" colspan=2>Año Pasado</TH>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Débito Principal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX28" size="17" maxlength="16" value="<%= crossRef.getE02GLMX28() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX28','','')">
			<input type="text" name="D02GLMX28" size="62" maxlength="60" value="<%= crossRef.getD02GLMX28() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito Principal :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMX29" size="17" maxlength="16" value="<%= crossRef.getE02GLMX29() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX29','','')">
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
			<input type="text" name="E02GLMRIN" size="17" maxlength="16" value="<%= crossRef.getE02GLMRIN() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,document.forms[0].CNTBCU.value,'D02GLMRIN','','')">
			<input type="text" name="D02GLMRIN" size="62" maxlength="60" value="<%= crossRef.getD02GLMRIN() %>" readonly>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Cuenta de Egreso :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMREX" size="17" maxlength="16" value="<%= crossRef.getE02GLMREX() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,document.forms[0].CNTBCU.value,'D02GLMREX','','')">
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
			<input type="text" name="E02GLMRIN" size="17" maxlength="16" value="<%= crossRef.getE02GLMRIN() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,'<%= currUser.getE01HCU() %>','D02GLMRIN','','')">
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
			<input type="text" name="E02GLMX32" size="17" maxlength="16" value="<%= crossRef.getE02GLMX32() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX32','','')">
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
			<input type="text" name="E02GLMXCR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCR','','')">
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
			<input type="text" name="E02GLMXSM" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSM() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSM','','')">
			<input type="text" name="D02GLMXSM" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSM() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Débito Interes Devengos :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXSS" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSS() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSS','','')">
			<input type="text" name="D02GLMXSS" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSS() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Crédito Interes Devengos :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXSD" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSD() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSD','','')">
			<input type="text" name="D02GLMXSD" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSD() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Débito Ordenes de Venta Pendientes :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXST" size="17" maxlength="16" value="<%= crossRef.getE02GLMXST() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXST','','')">
			<input type="text" name="D02GLMXST" size="62" maxlength="60" value="<%= crossRef.getD02GLMXST() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Crédito Ordenes de Venta Pendientes :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXSO" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSO() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSO','','')">
			<input type="text" name="D02GLMXSO" size="62" maxlength="60" value="<%= crossRef.getD02GLMXSO() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Débito Ordenes de Compra Pendientes :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXLR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXLR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXLR','','')">
			<input type="text" name="D02GLMXLR" size="62" maxlength="60" value="<%= crossRef.getD02GLMXLR() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Crédito Ordenes de Compra Pendientes :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMXO2" size="17" maxlength="16" value="<%= crossRef.getE02GLMXO2() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXO2','','')">
			<input type="text" name="D02GLMXO2" size="62" maxlength="60" value="<%= crossRef.getD02GLMXO2() %>" readonly>
		</div>
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Comision Acumulada de Custodia Débito :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMX17" size="17" maxlength="16" value="<%= crossRef.getE02GLMX17() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX17','','')">
			<input type="text" name="D02GLMX17" size="62" maxlength="60" value="<%= crossRef.getD02GLMX17() %>" readonly>
		</div>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">
		<div align="right">Comision Acumulada de Custodia Crédito :</div>
		</td>
		<td align="left" width="70%" nowrap>
		<div align="left">
			<input type="text" name="E02GLMX18" size="17" maxlength="16" value="<%= crossRef.getE02GLMX18() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX18','','')">
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
			<input type="text" name="E02GLMXSR" size="17" maxlength="16" value="<%= crossRef.getE02GLMXSR() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXSR','','')">
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
			<input type="text" name="E02GLMXCC" size="17" maxlength="16" value="<%= crossRef.getE02GLMXCC() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXCC','','')">
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
				<INPUT type="text" name="E02GLMDFP" size="17" maxlength="16" value="<%= crossRef.getE02GLMDFP() %>" onkeypress="enterInteger(event)"
	                class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMDFP0','','')">
				<INPUT type="text" name="D02GLMDFP" size="62" maxlength="60" value="<%= crossRef.getD02GLMDFP() %>" readonly>
			</DIV>
			</TD>
		</TR>
		<TR id="trclear">
			<TD align="right" width="30%">
			<DIV align="right">Cuenta Prima/Descuento :</DIV>
			</TD>
			<TD align="left" width="70%" nowrap>
			<DIV align="left">
				<INPUT type="text" name="E02GLMX16" size="17" maxlength="16" value="<%= crossRef.getE02GLMX16() %>" onkeypress="enterInteger(event)" 
			      class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX160','','')">
				<INPUT type="text" name="D02GLMX16" size="62" maxlength="60" value="<%= crossRef.getD02GLMX16() %>" readonly>
			</DIV>
			</TD>
		</TR>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<TD align="right" width="30%">
			<DIV align="right">Devengo de Intereses Tiempo de Compra :</DIV>
			</TD>
			<TD align="left" width="70%" nowrap>
			<DIV align="left">
				<INPUT type="text" name="E02GLMXIE" size="17" maxlength="16" value="<%= crossRef.getE02GLMXIE() %>" onkeypress="enterInteger(event)"
		            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMXIE','','')">
				<INPUT type="text" name="D02GLMXIE" size="62" maxlength="60" value="<%= crossRef.getD02GLMXIE() %>" readonly>
			</DIV>
			</TD>
		</TR>
		<TR id="trclear">
			<TD align="right" width="30%">
			<DIV align="right">Cuenta Débito en Poder del Banco :</DIV>
			</TD>
			<TD align="left" width="70%" nowrap>
			<DIV align="left">
				<INPUT type="text" name="E02GLMX19" size="17" maxlength="16" value="<%= crossRef.getE02GLMX19() %>" onkeypress="enterInteger(event)"
		            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX19','','')">
				<INPUT type="text" name="D02GLMX19" size="62" maxlength="60" value="<%= crossRef.getD02GLMX19() %>" readonly>
			</DIV>
			</TD>
		</TR>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<TD align="right" width="30%">
			<DIV align="right">Cuenta Crédito en Poder del Banco:</DIV>
			</TD>
			<TD align="left" width="70%" nowrap>
			<DIV align="left">
				<INPUT type="text" name="E02GLMX20" size="17" maxlength="16" value="<%= crossRef.getE02GLMX20() %>" onkeypress="enterInteger(event)"
		            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMX20','','')">
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
		<td align="right" width="30%">Débito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMRIN" size="17" maxlength="16" value="<%= crossRef.getE02GLMRIN() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMRIN','','')">
   		    <eibsinput:text property="D02GLMRIN" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
   		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td align="right" width="30%">Crédito por Reajuste :</td>
		<td align="left" width="70%" nowrap>
			<input type="text" name="E02GLMREX" size="17" maxlength="16" value="<%= crossRef.getE02GLMREX() %>" onkeypress="enterInteger(event)"
	            class="context-menu-help" onmousedown="init(ledgerHelp,this.name,getElement('E02GLMBNK').value,getElement('E02GLMCCY').value,'D02GLMREX','','')">
   		    <eibsinput:text property="D02GLMREX" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
        </td>
	</tr>
</table>
<% } %>

<br>
<div align="center">
	<input id="EIBSBTN" type=submit  name="Submit" value="Enviar">
</div>

</form>
</body>
</html>
