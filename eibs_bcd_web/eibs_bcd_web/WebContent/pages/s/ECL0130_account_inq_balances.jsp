<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Consulta de Saldos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtBalances" class="datapro.eibs.beans.EDD009001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body >

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<H3 align="center">Operaciones del Cliente<br>Consulta de Saldos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="account_inq_balances.jsp, ECL0130"> 
  </H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="3">
  <h4><%=rtBalances.getE01DSCAST()  %></h4>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			class="tbhead">
			<tr id="trdark">
				<td nowrap width="14%">
				<div align="right"><b>Identificación del Cliente :</b></div>
				</td>
				<td nowrap width="20%">
				<div align="left">
              		<input type="text" name="CUSIDT" size="2" maxlength="1" value="<%= userPO.getHeader1().trim()%>" readonly>
              		<input type="text" name="CUSIDN" size="10" maxlength="9" value="<%= userPO.getHeader2().trim()%>" readonly>
				</div>
				</td>
				<td nowrap width="12%">
				<div align="right"><b>Nombre del Cliente :</b></div>
				</td>
				<td nowrap width="12%">
				<div align="left">
					<input type="text" name="CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
				</div>
				</td>
				<td nowrap>
				</td>
				<td nowrap></td>
			</tr>
			<%if(currUser.getE01INT().equals("03")){%>
			<TR id="trdark">
				<TD nowrap width="14%" align="right" colspan="3"><B>Código de Cuenta Cliente :</B></TD>
				<TD nowrap width="33%"><INPUT type="text" name="E01FMTBCC_A"
					size="5"
					value="<%=rtBalances.getE01CTACCC().trim().substring(0,4) %>"
					readonly maxlength="4"> <INPUT type="text" name="E01FMTBCC_B"
					size="5"
					value="XXXX"
					readonly maxlength="4"> <INPUT type="text" name="E01FMTBCC_C"
					size="3"
					value="XX"
					readonly maxlength="2"> <INPUT type="text" name="E01FMTBCC_A0"
					size="11"
					value="XXXXXX<%=rtBalances.getE01CTACCC().trim().substring(16,20) %>"
					readonly maxlength="10"></TD>
				<TD nowrap width="11%"></TD>
				<TD nowrap width="21%"></TD>
			</TR>
			<% } %>
		</table>
		</td>
	</tr>
</table>
<h4>Saldos</h4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right">Saldo en Libros :</div>
				</td>
				<td nowrap width="22%"><input type="text" name="E01ACMMGB" size="17"
					maxlength="17" value="<%= rtBalances.getE01ACMMGB().trim()%>"
					readonly></td></tr>
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Saldo Diferido :</div>
				</td>
				<td nowrap width="22%"><input type="text" name="E01UNCBAL" size="17"
					maxlength="17" value="<%= rtBalances.getE01UNCBAL().trim()%>"
					readonly></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%" height="23">
				<div align="right">Saldo Neto :</div>
				</td>
				<td nowrap width="22%" height="23"><input type="text"
					name="E01ACMMNB" size="17" maxlength="17"
					value="<%= rtBalances.getE01ACMMNB().trim()%>" readonly></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%" height="19">
				<div align="right">Saldo Retenido :</div>
				</td>
				<td nowrap width="22%" height="19"><input type="text" size="17"
					maxlength="17" name="E01ACMHAM"
					value="<%= rtBalances.getE01ACMHAM().trim()%>" readonly></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right"><B>Saldo Disponible :</B></div>
				</td>
				<td nowrap width="22%"><input type="text" name="E01AVALBL" size="17"
					maxlength="17" value="<%= rtBalances.getE01AVALBL().trim()%>"
					readonly style="font-weight : bold"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<H4>Diferidos</H4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="30%">
				<div align="right">Diferido 1 D&iacute;a :</div>
				</td>
				<td nowrap width="21%"><input type="text" name="E01ACMUL1" size="15"
					maxlength="15" value="<%= rtBalances.getE01ACMUL1().trim()%>"
					readonly></td>
				<td nowrap width="25%">
				<div align="right">Diferido 3 D&iacute;as :</div>
				</td>
				<td nowrap width="24%"><input type="text" name="E01ACMUL3" size="15"
					maxlength="15" value="<%= rtBalances.getE01ACMUL3().trim()%>"
					readonly></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%">
				<div align="right">Diferido 2 D&iacute;as :</div>
				</td>
				<td nowrap width="21%"><input type="text" name="E01ACMUL2" size="15"
					maxlength="15" value="<%= rtBalances.getE01ACMUL2().trim()%>"
					readonly></td>
				<td nowrap width="25%">
				<div align="right">Diferido + 3 D&iacute;as :</div>
				</td>
				<td nowrap width="24%"><input type="text" name="E01ACMFL1" size="15"
					maxlength="15" value="<%= rtBalances.getE01ACMFL1().trim()%>"
					readonly></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="30%">
				<div align="right">Diferido Indefinido :</div>
				</td>
				<td nowrap width="21%"><input type="text" name="E01ACMFL2" size="15"
					maxlength="15" value="<%= rtBalances.getE01ACMFL2().trim()%>"
					readonly></td>
				<td nowrap width="25%">
				<div align="right"></div>
				</td>
				<td nowrap width="24%">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<h4>Fechas</h4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right">Fecha de Apertura :</div>
				</td>
				<td nowrap width="16%">
		   		  <eibsinput:date name="rtBalances" fn_year="E01OPNDTY" fn_month="E01OPNDTM" fn_day="E01OPNDTD" readonly="true"/>
				</td>
				<td nowrap width="27%">
				</td>
				<td nowrap width="28%"></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Ultima Transacci&oacute;n :</div>
				</td>
				<td nowrap width="16%">
		   		  <eibsinput:date name="rtBalances" fn_year="E01LSTRDY" fn_month="E01LSTRDM" fn_day="E01LSTRDD" readonly="true"/>
				</td>
				<td nowrap width="27%">
				<div align="right">Ultimo Dep&oacute;sito :</div>
				</td>
				<td nowrap width="28%">
		   		  <eibsinput:date name="rtBalances" fn_year="E01LSTDDY" fn_month="E01LSTDDM" fn_day="E01LSTDDD" readonly="true"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type="submit" name="Submit" value="Movimientos">
  </div>
</form>
</body>
</html>
