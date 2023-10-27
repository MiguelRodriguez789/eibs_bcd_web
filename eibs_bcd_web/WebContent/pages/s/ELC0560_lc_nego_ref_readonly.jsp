<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Negociaciones de Cartas de Creditos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC056001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>
<script type="text/javascript">
	builtNewMenu(lc_nego_apr);
	initMenu();
</script>
</head>

<body>

<h3 align="center">Pago/Negociaci�n de Cartas de Cr�dito
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF"
title="ELC0560_lc_nego_ref_readonly.jsp"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0560" >
    <input name="SCREEN" type="HIDDEN" value="3" readonly="readonly">


    <table class="tableinfo">
    <tr bgcolor="#ffffff">
      <td nowrap height="79" width="100%">
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		  <tr id="trdark">
              <td align="right" valign="top" height="29"><B>Tipo de Negociaci&oacute;n: </B></td>
			  <td nowrap valign="top" height="29"><input name="E01OPCODE" type="text" value="<%= msg01.getE01OPCODE()%>" size="4" maxlength="1" readonly>
                  <input name="E01OPCDSC" type="text" value="<%= msg01.getE01OPCDSC()%>" size="31" maxlength="30" readonly></td>
			  <td nowrap align="right" valign="top" height="29"><B>Producto: </B></td>
			  <td nowrap align="left" valign="top" height="29"><input name="E01LCMPRO" type="text"
				   value="<%= msg01.getE01LCMPRO()%>" size="8" maxlength="8" readonly></td>
          </tr>
		  <tr id="trclear">
			  <td align="right" valign="top" height="24" width="128"><B>Carta de Cr�dito: </B></td>
			  <td nowrap valign="top" height="24" width="284"><input name="E01LCRNUM" type="text"
					value="<%= msg01.getE01LCRNUM()%>" size="23" maxlength="12" readonly></td>
		      <td nowrap align="right" valign="top" height="24" width="56"><B>Moneda: </B></td>
			  <td nowrap align="left" valign="top" height="24" width="291"><input name="E01LCMCCY" type="text"
					value="<%= msg01.getE01LCMCCY()%>" size="8" maxlength="3" readonly>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Monto: </B><input name="E01DRWAMN" type="text" value="<%= msg01.getE01DRWAMN()%>"
					size="18" maxlength="15" readonly></td>
		  </tr>
		  <tr id="trdark">
              <td align="right" valign="top" height="24"><B>Cliente: </B></td>
			  <td nowrap valign="top" height="24" align="left"><input name="E01LCMCUN" type="text" value="<%= msg01.getE01LCMCUN()%>" size="20" maxlength="9" readonly></td>
			  <td nowrap align="right" valign="top" height="24"><B>Nombre: </B></td>
			  <td nowrap align="left" valign="top" height="24"><input name="E01CUSNA1" type="text" value="<%= msg01.getE01CUSNA1()%>" size="46" maxlength="45" readonly></td>
		  </tr>
		  <TR id="trclear">
              <TD nowrap align="right" valign="top" height="24"><B>Mensaje Swift: </B></TD>
              <TD nowrap align="left" valign="top" height="24">
                  <INPUT type="hidden" name="E01SWFMTP" size="3" maxlength="3" value="<%= msg01.getE01SWFMTP()%>" readonly>
                      <SELECT name="msgtyp" disabled>
			              <OPTION value="" selected></OPTION>
			              <OPTION value="732" <%=msg01.getE01SWFMTP().equals("732")?"selected":"" %>>MT732</OPTION>
			              <OPTION value="742" <%=msg01.getE01SWFMTP().equals("742")?"selected":"" %>>MT742</OPTION>
			              <OPTION value="752" <%=msg01.getE01SWFMTP().equals("752")?"selected":"" %>>MT752</OPTION>
			              <OPTION value="754" <%=msg01.getE01SWFMTP().equals("754")?"selected":"" %>>MT754</OPTION>
			              <OPTION value="756" <%=msg01.getE01SWFMTP().equals("756")?"selected":"" %>>MT756</OPTION>
		              </SELECT>
              </TD>
              <TD align="right" valign="top" height="24"><B>Banco Receptor: </B></TD>
              <TD colspan=3 nowrap valign="top" height="24" align="left"><INPUT type="text" name="E01SWFRCV" size="14" maxlength="12" value="<%= msg01.getE01SWFRCV()%>" readonly></TD>
          </TR>
		            
		</table>
	  </td>
	  </tr>
	</table>



<p><b>Cuenta D&eacute;bito Principal</b></p>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <tr id="trdark">
    <td align="center" valign="top" height="24" width="230">Concepto</td>
    <td nowrap valign="top" height="24" align="center" width="51">Banco</td>
    <td nowrap valign="top" height="24" align="center" width="61">Agencia</td>
    <td nowrap align="center" valign="top" height="24" width="47">Mda</td>
    <td nowrap align="center" valign="top" height="24" width="128">Cuenta Contable</td>
    <td nowrap align="center" valign="top" height="24" width="132">Cuenta</td>
    <td nowrap align="center" valign="top" height="24" width="114">Centro de Costo</td>
  </tr>
  <tr id="trclear">
    <td width="230" height="24" align="left" valign="top" nowrap><input name="E01CONCDR" type="text" value="<%= msg01.getE01CONCDR()%>" size="4" maxlength="2" readonly="readonly">
        <input name="E01CONCDD" type="text" value="<%=msg01.getE01CONCDD()%>" size="25" maxlength="25" readonly="readonly"
				></td>
    <td width="51" height="24" align="center" valign="top" nowrap><input name="E01CUSBNK" type="text" value="<%= msg01.getE01CUSBNK()%>" size="4" maxlength="2" readonly="readonly"></td>
    <td width="61" height="24" align="center" valign="top" nowrap><input name="E01CUSBRN" type="text" onKeyPress="enterInteger(event)" value="<%= msg01.getE01CUSBRN()%>" size="6" maxlength="3" readonly="readonly" ></td>
    <td width="47" height="24" align="center" valign="top" nowrap><input name="E01CUSCCY" type="text" value="<%= msg01.getE01CUSCCY()%>" size="6" maxlength="3" readonly="readonly" ></td>
    <td width="128" height="24" align="center" valign="top" nowrap><input name="E01CUSGLN" type="text" onKeyPress="enterInteger(event)" value="<%= msg01.getE01CUSGLN()%>" size="20" maxlength="16" readonly="readonly"
			></td>
    <td width="132" height="24" align="center" valign="top" nowrap><input name="E01CUSACC" type="text" value="<%= msg01.getE01CUSACC()%>" size="18" maxlength="12" readonly="readonly" ></td>
    <td width="114" height="24" align="center" valign="top" nowrap><input name="E01CUSCCN" type="text" value="<%= msg01.getE01CUSCCN()%>" size="13" maxlength="8" readonly="readonly"></td>
  </tr>
</table>
<p><b>Cuenta D&eacute;bito Comisiones e Impuestos </b></p>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <tr id="trdark">
    <td align="center" valign="top" height="24" colspan="2">Concepto</td>
    <td nowrap valign="top" height="24" align="center" width="51">Banco</td>
    <td nowrap valign="top" height="24" align="center" width="61">Agencia</td>
    <td nowrap align="center" valign="top" height="24" width="47">Mda</td>
    <td nowrap align="center" valign="top" height="24" width="128">Cuenta Contable</td>
    <td nowrap align="center" valign="top" height="24" width="132">Cuenta</td>
    <td nowrap align="center" valign="top" height="24" width="114">Centro de Costo</td>
  </tr>
  <tr id="trclear">
    <td width="230" height="24" align="left" valign="top" nowrap><input name="E01CONDCO" type="text" value="<%=msg01.getE01CONDCO()%>" size="4" maxlength="2" readonly="readonly">
        <input name="E01CONDCB" type="text" value="<%=msg01.getE01CONDCB()%>" size="25" maxlength="25" readonly="readonly"
				></td>
    <td nowrap valign="top" height="24" align="center" width="51"><input name="E01DEBBK2" type="text" value="<%=msg01.getE01DEBBK2()%>" size="4" maxlength="2" readonly="readonly"></td>
    <td nowrap valign="top" height="24" align="center" width="61"><input name="E01DEBBR2" type="text" onKeyPress="enterInteger(event)" value="<%=msg01.getE01DEBBR2()%>" size="6" maxlength="3" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="47"><input name="E01DEBCY2" type="text" value="<%=msg01.getE01DEBCY2()%>" size="6" maxlength="3" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="128"><input name="E01DEBGL2" type="text" onKeyPress="enterInteger(event)" value="<%=msg01.getE01DEBGL2()%>" size="20" maxlength="16" readonly="readonly"
			></td>
    <td nowrap align="center" valign="top" height="24" width="132"><input name="E01DEBAC2" type="text" value="<%=msg01.getE01DEBAC2()%>" size="18" maxlength="12" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="114"><input name="E01DEBCC2" type="text" value="<%=msg01.getE01DEBCC2()%>" size="13" maxlength="8" readonly="readonly"></td>
  </tr>
</table>
<p><b>Cuenta Cr&eacute;dito</b></p>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <tr id="trdark">
    <td align="center" valign="top" height="24" width="230">Concepto</td>
    <td nowrap valign="top" height="24" align="center" width="51">Banco</td>
    <td nowrap valign="top" height="24" align="center" width="61">Agencia</td>
    <td nowrap align="center" valign="top" height="24" width="47">Mda</td>
    <td nowrap align="center" valign="top" height="24" width="128">Cuenta Contable</td>
    <td nowrap align="center" valign="top" height="24" width="132">Cuenta</td>
    <td nowrap align="center" valign="top" height="24" width="114">Centro de Costo</td>
  </tr>
  <tr id="trclear">
    <td width="230" height="24" align="left" valign="top" nowrap><input name="E01CONCCR" type="text" value="<%= msg01.getE01CONCCR()%>" size="4" maxlength="2" readonly="readonly">
        <input name="E01CONCCD" type="text" value="<%= msg01.getE01CONCCD()%>" size="25" maxlength="25" readonly="readonly"
				></td>
    <td nowrap valign="top" height="24" align="center" width="51"><input name="E01PMTBNK" type="text" value="<%= msg01.getE01PMTBNK()%>" size="4" maxlength="2" readonly="readonly"></td>
    <td nowrap valign="top" height="24" align="center" width="61"><input name="E01PMTBRN" type="text" onKeyPress="enterInteger(event)" value="<%= msg01.getE01PMTBRN()%>" size="6" maxlength="3" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="47"><input name="E01PMTCCY" type="text" value="<%= msg01.getE01PMTCCY()%>" size="6" maxlength="3" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="128"><input name="E01PMTGLN" type="text" onKeyPress="enterInteger(event)" value="<%= msg01.getE01PMTGLN()%>" size="20" maxlength="16" readonly="readonly"
			></td>
    <td nowrap align="center" valign="top" height="24" width="132"><input name="E01PMTACC" type="text" value="<%= msg01.getE01PMTACC()%>" size="18" maxlength="12" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="114"><input name="E01PMTCCN" type="text" value="<%= msg01.getE01PMTCCN()%>" size="13" maxlength="8" readonly="readonly"></td>
  </tr>
</table>
<% if(msg01.getH01FLGWK3().equals("Y")){ %>
<p><b>Cuenta Cr�dito Banco Corresponsal </b></p>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <tr id="trdark">
    <td align="center" valign="top" height="24" width="230">Concepto</td>
    <td nowrap valign="top" height="24" align="center" width="51">Banco</td>
    <td nowrap valign="top" height="24" align="center" width="61">Agencia</td>
    <td nowrap align="center" valign="top" height="24" width="47">Mda</td>
    <td nowrap align="center" valign="top" height="24" width="128">Cuenta Contable</td>
    <td nowrap align="center" valign="top" height="24" width="132">Cuenta</td>
    <td nowrap align="center" valign="top" height="24" width="114">Centro de Costo</td>
  </tr>
  <tr id="trclear">
    <td width="230" height="24" align="left" valign="top" nowrap><input name="E01CONCBC" type="text" value="<%=msg01.getE01CONCBC()%>" size="4" maxlength="2" readonly="readonly">
        <input name="E01CONCBD" type="text"  value="<%=msg01.getE01CONCBD()%>" size="25" maxlength="25" readonly="readonly"
				></td>
    <td nowrap valign="top" height="24" align="center" width="51"><input name="E01CRPBNK" type="text" value="<%=msg01.getE01CRPBNK()%>" size="4" maxlength="2" readonly="readonly"></td>
    <td nowrap valign="top" height="24" align="center" width="61"><input name="E01CRPBRN" type="text" onKeyPress="enterInteger(event)" value="<%=msg01.getE01CRPBRN()%>" size="6" maxlength="3" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="47"><input name="E01CRPCCY" type="text" value="<%=msg01.getE01CRPCCY()%>" size="6" maxlength="3" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="128"><input name="E01CRPGLN" type="text" onKeyPress="enterInteger(event)" value="<%=msg01.getE01CRPGLN()%>" size="20" maxlength="16" readonly="readonly"
			></td>
    <td nowrap align="center" valign="top" height="24" width="132"><input name="E01CRPACC" type="text" value="<%=msg01.getE01CRPACC()%>" size="18" maxlength="12" readonly="readonly" ></td>
    <td nowrap align="center" valign="top" height="24" width="114"><input name="E01CRPCCN" type="text" value="<%=msg01.getE01CRPCCN()%>" size="13" maxlength="8" readonly="readonly"></td>
  </tr>
</table>
<% } %>
<p></p>
<%int i = 0;%>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
	<tr id="<%out.print((i++%2==0 ? "trdark" : "trclear"));%>">
		<td align="right">Forma / V�a de Pago: </td>
		<td nowrap valign="top" align="left" width="115"><select
			name="E01PMTVIA" disabled>
			<option value="">&nbsp;</option>
				<!--	<OPTION value="1" <%if (msg01.getE01PMTVIA().equals("1")) { out.print("selected"); }%>>Cheque Oficial</OPTION>-->
			<option value="2" <%if (msg01.getE01PMTVIA().equals("2")) { out.print("selected"); }%>>Dep�sito Cta. Cte.</option>
			<option value="3" <%if (msg01.getE01PMTVIA().equals("3")) { out.print("selected"); }%>>Cuenta Contable</option>
			<option value="5" <%if (msg01.getE01PMTVIA().equals("5")) { out.print("selected"); }%>>Swift</option>
			</select></td>
		<td nowrap align="right">Formato Swift: </td>
		<td nowrap align="left">
		<select name="E01SWFFMT" disabled>
			<option value="">&nbsp;</option>
			<option value="103" <%if (msg01.getE01SWFFMT().equals("103")) { out.print("selected"); }%>>MT103</option>
			<option value="202" <%if (msg01.getE01SWFFMT().equals("202")) { out.print("selected"); }%>>MT202</option>
		</select></td>
	</tr>
	<tr id="<%out.print((i++%2==0 ? "trdark" : "trclear"));%>">
		<td align="right">Debitar Comisiones a Cta. del Beneficiario: </td>
		<td nowrap valign="top" align="left">
			<input name="E01DEBFLG" type="radio" value="Y" readonly="readonly" <%if (msg01.getE01DEBFLG().equals("Y")) out.print("checked"); %> disabled> Si
			<input name="E01DEBFLG" type="radio" value="N" readonly="readonly" <%if (msg01.getE01DEBFLG().equals("N")) out.print("checked"); %> disabled> No				</td>
		<td nowrap align="right">BIC Banco Beneficiario: </td>
		<td nowrap align="left">
			<input name="E01CRPBID" type="text" size="16" maxlength="12" readonly="readonly"></td>
	</tr>
	<tr id="<%out.print((i++%2==0 ? "trdark" : "trclear"));%>">
	  <td nowrap align="right" valign="top" height="24">Cancelar Saldo Remanente: </td>
	  <td nowrap align="left" valign="top" height="24"><input name="E01CANBAL" type="radio" value="Y" readonly="readonly" <%if (msg01.getE01CANBAL().equals("Y")) out.print("checked"); %> disabled>
	    Si
	    <input name="E01CANBAL" type="radio" value="N" readonly="readonly" <%if (msg01.getE01CANBAL().equals("N")) out.print("checked"); %> disabled>
	    No </td>
		<td nowrap align="right">Garant�a en Efectivo: </td>
		<td nowrap align="left"><input name="E01CSHAMN" type="text" size="18" maxlength="15" readonly="readonly"></td>
	</tr>
	<tr id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
		<td nowrap align="right" valign="top" height="24">Fecha de Embarque: </td>
		<td nowrap align="left" valign="top" height="24">
		<eibsinput:date name="msg01" fn_month="E01DRFDTM" fn_day="E01DRFDTD" fn_year="E01DRFDTY" readonly="true"/>
		</td>
		<td nowrap align="right">Fecha Valor: </td>
		<td nowrap align="left">
		<eibsinput:date name="msg01" fn_month="E01VALDTM" fn_day="E01VALDTD" fn_year="E01VALDTY" readonly="true"/>
		</td>
	</tr>
	<tr id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
		<td nowrap align="right" valign="top" height="24">Plazo (Nro. de Dias): </td>
		<td nowrap align="left" valign="top" height="24">
		<input name="E01NUMDYS" value="<%=msg01.getE01NUMDYS()%>" size="4" maxlength="4" readonly="readonly" >
		</td>
		<td nowrap align="right">Fecha de Vencimiento: </td>
		<td nowrap align="left">
		<eibsinput:date name="msg01" fn_month="E01MATDTM" fn_day="E01MATDTD" fn_year="E01MATDTY" readonly="true"/>
		</td>
	</tr>
	<tr id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
		<td nowrap align="right" valign="top" height="24">Codigo de Producto: </td>
		<td nowrap align="left" valign="top" height="24">
		<input name="E01NEWPRO" value="<%=msg01.getE01NEWPRO()%>" size="4" maxlength="4" readonly="readonly" >
				</td>
		<td nowrap align="right">Base Anual: </td>
		<td nowrap align="left">
		<input name="E01PERBAS" value="<%=msg01.getE01PERBAS()%>" size="4" maxlength="4" readonly="readonly" ></td>
	</tr>

	<tr id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
	  <td align="right" nowrap>Tabla / Tipo de Tasa Flotante: </td>
	  <td nowrap><input name="E01BNKFLT" type="text" value="<%= msg01.getE01BNKFLT().trim()%>" size="2" maxlength="2" readonly="readonly">
          <select name="E01INTTYP" disabled>
            <option value=""> </option>
            <option value="FP" <% if(msg01.getE01INTTYP().equals("FP")) out.print("selected");%>>Tasa Primaria</option>
            <option value="FS" <% if(msg01.getE01INTTYP().equals("FS")) out.print("selected");%>>Tasa Secundaria</option>
        </select></td>
	  <td height="24" align="right" valign="top" nowrap>Tasa / Sobretasa: </td>
	  <td height="24" align="left" valign="top" nowrap><input name="E01INTRTE" type="text" value="<%=msg01.getE01INTRTE()%>" size="10" maxlength="9" readonly="readonly"></td>
    </tr>
	<tr id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
	  <td height="24" align="right" valign="top" nowrap>Tipo de Inter&eacute;s: </td>
	  <td height="24" align="left" valign="top" nowrap><input name="E01INTFLG" type="text" value="<%=msg01.getE01INTFLG()%>" size="1" maxlength="1" readonly="readonly"></td>
	  <td nowrap align="right">Intereses Pre-Pagados: </td>
	  <td nowrap><input name="E01DISCNT" type="radio" value="Y" readonly="readonly" <% if(msg01.getE01DISCNT().equals("Y")) out.print("checked");%> disabled>
	    Si
	    <input name="E01DISCNT" type="radio" value="N" readonly="readonly" <% if(msg01.getE01DISCNT().equals("N")) out.print("checked");%> disabled>
	    No </td>
	</tr>
	<tr id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
	  <td align="right" nowrap>Tasa de Inter&eacute;s de Mora: </td>
	  <td nowrap><input name="E01PENINT" type="text" value="<%=msg01.getE01PENINT()%>" size="9" maxlength="7" readonly="readonly"></td>
	  <td height="24" align="right" valign="top" nowrap>Factor / Porcentaje de Mora: </td>
	  <td height="24" align="left" valign="top" nowrap><select name="E01PENFLG" disabled>
        <option value=""> </option>
        <option value="F" <% if(msg01.getE01PENFLG().equals("%")) out.print("selected");%>>Monto Fijo</option>
        <option value="%" <% if(msg01.getE01PENFLG().equals("%")) out.print("selected");%>>porcentaje</option>
      </select></td>
    </tr>
	<tr id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
	  <td align="right" nowrap>C&aacute;lculo de Inter&eacute;s Normal: </td>
	  <td nowrap>
	  <select name="E01INCLTP" disabled>
          <option value=""> </option>
          <option value="1" <% if(msg01.getE01INCLTP().equals("1")) out.print("selected");%>>Sobre Capital Vigente</option>
          <option value="2" <% if(msg01.getE01INCLTP().equals("2")) out.print("selected");%>>Sobre Capital Original</option>
          <option value="3" <% if(msg01.getE01INCLTP().equals("3")) out.print("selected");%>>Sobre Capital Vigente menos Vencido </option>
          <option value="N" <% if(msg01.getE01INCLTP().equals("N")) out.print("selected");%>>No Calcula Intereses</option>
      </select>
	  </td>
	  <td align="right" nowrap>C&aacute;lculo de Inter&eacute;s de Mora: </td>
	  <td nowrap><select name="E01PNCLTP" disabled>
          <option value=""> </option>
          <option value="1" <% if(msg01.getE01PNCLTP().equals("1")) out.print("selected");%>>Sobre Capital Vencido</option>
          <option value="2" <% if(msg01.getE01PNCLTP().equals("2")) out.print("selected");%>>Sobre Capital Original</option>
          <option value="3" <% if(msg01.getE01PNCLTP().equals("3")) out.print("selected");%>>Sobre Capital Vigente</option>
          <option value="4" <% if(msg01.getE01PNCLTP().equals("4")) out.print("selected");%>>Sobre Capital Vencido + Int.Vencido</option>
          <option value="N" <% if(msg01.getE01PNCLTP().equals("N")) out.print("selected");%>>No Calcula Mora</option>
      </select></td>
	</tr>
	<tr id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
	  <td align="right" nowrap>Ciclo de Pago de Intereses: </td>
	  <td nowrap><input name="E01INPDYS" type="text" value="<%=msg01.getE01INPDYS()%>" size="3" maxlength="3" readonly="readonly">
	  <a href="javascript:GetCode('E01INPDYS','STATIC_payment_cycle.jsp')"></a></td>
	  <td height="24" align="right" valign="top" nowrap>Fecha Pr&oacute;ximo Pago de Intereses: </td>
	  <td height="24" align="left" valign="top" nowrap>
		<eibsinput:date name="msg01" fn_month="E01NXIPDM" fn_day="E01NXIPDD" fn_year="E01NXIPDY" readonly="true"/>
        </td>
    </tr>
	<TR id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
      <td align="right" nowrap>Ciclo de Pago de Principal: </td>
	  <td nowrap><input name="E01PRPDYS" type="text" value="<%=msg01.getE01PRPDYS()%>" size="3" maxlength="3" readonly="readonly">
      </td>
	  <td height="24" align="right" valign="top" nowrap>Fecha Pr&oacute;ximo Pago de Principal: </td>
	  <td height="24" align="left" valign="top" nowrap>
		<eibsinput:date name="msg01" fn_month="E01NXPPDM" fn_day="E01NXPPDD" fn_year="E01NXPPDY" readonly="true"/>
      </td>
    </TR>
    <TR id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
	  <TD align="right" nowrap>Ciclo de Revisi&oacute;n de Tasa: </TD>
	  <TD nowrap><INPUT type="text" name="E01RTEREV" value="<%=msg01.getE01RTEREV()%>" size="3" maxlength="3" readonly="readonly">
	  <TD height="24" align="right" valign="top" nowrap>Fecha Pr&oacute;xima Revisi&oacute;n de Tasa: </TD>
	  <TD height="24" align="left" valign="top" nowrap>
		<eibsinput:date name="msg01" fn_month="E01NXRRDM" fn_day="E01NXRRDD" fn_year="E01NXRRDY" readonly="true"/>
	  </TD>
    </TR>
    <TR id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
      <TD align="right">L&iacute;nea de Cr�dito: </TD>
      <TD nowrap>
      		<INPUT name="E01LNECMC" size="10" maxlength="9" value="<%= msg01.getE01LNECMC().trim()%>" readonly="readonly">
            <INPUT name="E01LNECMN" size="4" maxlength="4" value="<%= msg01.getE01LNECMN().trim()%>" readonly="readonly">
	  </TD>
    </TR>
    
	<TR id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
	    <% if(msg01.getH01FLGWK3().equals("Y")) { %> 
		<td align="right">Monto Debitado Por Corresponsal: </td>
		<% } else { %> 
		<td align="right">Cargos del Banco Corresponsal: </td>
		<% } %>
		<td nowrap align="left">
			<input type="text" name="E01DEBCRP" size="18" maxlength="17" value="<%=msg01.getE01DEBCRP()%>" readonly>
		</td>
		<td nowrap align="right">Cargos Banco Corresponsal x Cta. de: </td>
		<td nowrap align="left"><select name="E01CRPPBY" disabled>
			<option value="">&nbsp;</option>
			<option value="A"
				<%if (msg01.getE01CRPPBY().equals("A")) { out.print("selected"); }%>>Aplicante</option>
			<option value="B"
				<%if (msg01.getE01CRPPBY().equals("B")) { out.print("selected"); }%>>Beneficiario</option>
		</select></td>
	</TR>
	
	<TR id="<%out.print((i++ %2==0 ? "trdark" : "trclear"));%>">
		<TD colspan="4" align="CENTER">
			<TABLE width="100%">
				<TR id="trclear" >
					<TD width="10%" nowrap align="CENTER">Monto FOB : </TD>
					<TD width="15%"><INPUT type="text" name="E01LCCFOB" size="18" maxlength="17" value="<%=msg01.getE01LCCFOB()%>" readonly="readonly"></TD>
					<TD width="10%" nowrap align="CENTER">Monto Seguro : </TD>
					<TD width="15%"><INPUT type="text" name="E01LCCCOF" size="18" maxlength="17" value="<%=msg01.getE01LCCCOF()%>" readonly="readonly"></TD>
					<TD width="10%" nowrap align="CENTER">Monto Flete : </TD>
					<TD width="15%"><INPUT type="text" name="E01LCCCOI" size="18" maxlength="17" value="<%=msg01.getE01LCCCOI()%>" readonly="readonly"></TD>
				</TR>
			</TABLE>
		</TD>	
	</TR>
</table>

<%--
<p><b>Tipos de Cambio</b></p>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <tr id="trdark">
			<td>Moneda</td>
			<td>T/C Compra</td>
			<td>T/C Venta</td>
			<td>Moneda</td>
			<td>T/C Compra</td>
			<td>T/C Venta</td>
  </tr>
  <tr>
    <td><input name="E01FXCCY1" type="text" value="<%=msg01.getE01FXCCY1()%>" size="9" maxlength="3" readonly="readonly"></td>
    <td><input name="E01FXRPU1" type="text" value="<%=msg01.getE01FXRPU1()%>" size="20" maxlength="11" readonly="readonly"></td>
    <td><input name="E01FXRSA1" type="text" value="<%=msg01.getE01FXRSA1()%>" size="20" maxlength="11" readonly="readonly"></td>
    <td><input name="E01FXCCY2" type="text" value="<%=msg01.getE01FXCCY2()%>" size="9" maxlength="3" readonly="readonly"></td>
    <td><input name="E01FXRPU2" type="text" value="<%=msg01.getE01FXRPU2()%>" size="20" maxlength="11" readonly="readonly"></td>
    <td><input name="E01FXRSA2" type="text" value="<%=msg01.getE01FXRSA2()%>" size="20" maxlength="11" readonly="readonly"></td>
  </tr>
  <tr>
    <td><input name="E01FXCCY3" type="text" value="<%=msg01.getE01FXCCY3()%>" size="9" maxlength="3" readonly="readonly"></td>
    <td><input name="E01FXRPU3" type="text" value="<%=msg01.getE01FXRPU3()%>" size="20" maxlength="11" readonly="readonly"></td>
    <td><input name="E01FXRSA3" type="text" value="<%=msg01.getE01FXRSA3()%>" size="20" maxlength="11" readonly="readonly"></td>
    <td><input name="E01FXCCY4" type="text" value="<%=msg01.getE01FXCCY4()%>" size="9" maxlength="3" readonly="readonly"></td>
    <td><input name="E01FXRPU4" type="text" value="<%=msg01.getE01FXRPU4()%>" size="20" maxlength="11" readonly="readonly"></td>
    <td><input name="E01FXRSA4" type="text" value="<%=msg01.getE01FXRSA4()%>" size="20" maxlength="11" readonly="readonly"></td>
  </tr>
</table>
--%>

<%	i = 0;	%>
<p><b>Comisiones y Gastos</b></p>
<% if(msg01.getH01FLGWK3().equals("Y")){ %>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <tbody>
    <tr id="trdark">
			<td>&nbsp;</td>
    <td colspan="2" align="center"><b>Nuestros</b></td><td colspan="2" align="center"><b>Banco Corresponsal</b></td>

	</tr>
    <tr id="trdark">
      <td nowrap align="left"><b>Comisi&oacute;n</b></td>
      <td nowrap align="center"><b>Monto</b></td>
      <td nowrap align="center"><b>Por</b></td>
      <td nowrap align="center"><b>Monto</b></td>
      <td nowrap align="center"><b>Por</b></td>
 	</tr>
 	
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Emisi&oacute;n</td>
	    <td align="center"><input name="E01ISSFEE" type="text" id="E01ISSFEE" value="<%=msg01.getE01ISSFEE()%>" readonly></td><td align="center"><select name="E01ISSPBY" disabled>
			<option value="A" <%if(msg01.getE01ISSPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01ISSPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01ISSPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input name="E01CRPISS" type="text" id="E01CRPISS" value="<%=msg01.getE01CRPISS()%>" readonly></td><td align="center"><select name="E01ISSCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01ISSCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01ISSCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01ISSCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Aviso</td>
	    <td align="center"><input name="E01ADVCOM" type="text" value="<%=msg01.getE01ADVCOM()%>" readonly></td><td align="center"><select name="E01ADVPBY" disabled>
			<option value="A" <%if(msg01.getE01ADVPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01ADVPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01ADVPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPADV" value="<%=msg01.getE01CRPADV()%>" readonly></td><td align="center"><select name="E01ADVCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01ADVCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01ADVCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01ADVCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
	
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Confirmaci&oacute;n</td>
	    <td align="center"><input type="text" name="E01CNFCOM" value="<%=msg01.getE01CNFCOM()%>" readonly></td><td align="center"><select name="E01CNFPBY" disabled>
			<option value="A" <%if(msg01.getE01CNFPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01CNFPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01CNFPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPCNF" value="<%=msg01.getE01CRPCNF()%>" readonly></td><td align="center"><select name="E01CNFCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01CNFCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01CNFCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01CNFCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
    
    <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Enmienda</td>
	    <td align="center"><input type="text" name="E01AMDFEE" value="<%=msg01.getE01AMDFEE()%>" readonly></td><td align="center"><select name="E01AMDPBY" disabled>
			<option value="A" <%if(msg01.getE01AMDPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01AMDPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01AMDPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPAMD" value="<%=msg01.getE01CRPAMD()%>" readonly></td><td align="center"><select name="E01AMDCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01AMDCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01AMDCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01AMDCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
    
    <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Aviso de Enmienda</td>
	    <td align="center"><input type="text" name="E01ADVAMF" value="<%=msg01.getE01ADVAMF()%>" readonly></td><td align="center"><select name="E01AAMPBY" disabled>
			<option value="A" <%if(msg01.getE01AAMPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01AAMPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01AAMPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPAAM" value="<%=msg01.getE01CRPAAM()%>" readonly></td><td align="center"><select name="E01AAMCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01AAMCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01AAMCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01AAMCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
	
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Discrepancia</td>
	    <td align="center"><input type="text" name="E01DISCOM" value="<%=msg01.getE01DISCOM()%>" readonly></td><td align="center"><select name="E01DISPBY" disabled>
			<option value="A" <%if(msg01.getE01DISPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01DISPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01DISPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPDIS" value="<%=msg01.getE01CRPDIS()%>" readonly></td><td align="center"><select name="E01DISCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01DISCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01DISCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01DISCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
	
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Extensi�n de Validez</td>
	    <td align="center"><input type="text" name="E01EOVCOM" value="<%=msg01.getE01EOVCOM()%>" readonly></td><td align="center"><select name="E01EOVPBY" disabled>
			<option value="A" <%if(msg01.getE01EOVPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01EOVPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01EOVPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPEOV" value="<%=msg01.getE01CRPEOV()%>" readonly></td><td align="center"><select name="E01EOVCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01EOVCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01EOVCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01EOVCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
    
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Portes</td>
	    <td align="center"><input type="text" name="E01POSTAM" value="<%=msg01.getE01POSTAM()%>" readonly></td><td align="center"><select name="E01POSPBY" disabled>
			<option value="A" <%if(msg01.getE01POSPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01POSPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01POSPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPPOS" value="<%=msg01.getE01CRPPOS()%>" readonly></td><td align="center"><select name="E01POSCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01POSCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01POSCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01POSCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
    
    <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Courier</td>
	    <td align="center"><input type="text" name="E01COURAM" value="<%=msg01.getE01COURAM()%>" readonly></td><td align="center"><select name="E01COUPBY" disabled>
			<option value="A" <%if(msg01.getE01COUPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01COUPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01COUPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPCOU" value="<%=msg01.getE01CRPCOU()%>" readonly></td><td align="center"><select name="E01COUCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01COUCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01COUCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01COUCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
 	</tr>
 	
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Swift de Apertura</td>
	    <td align="center"><input type="text" name="E01SWFFEE" value="<%=msg01.getE01SWFFEE()%>" readonly></td><td align="center"><select name="E01SWFPBY" disabled>
			<option value="A" <%if(msg01.getE01SWFPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01SWFPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01SWFPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPSWF" value="<%=msg01.getE01CRPSWF()%>" readonly></td><td align="center"><select name="E01SWFCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01SWFCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01SWFCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01SWFCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
	
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Swift Adicional(es)</td>
	    <td align="center"><input type="text" name="E01TLXFEE" value="<%=msg01.getE01TLXFEE()%>" readonly></td><td align="center"><select name="E01TLXPBY" disabled>
			<option value="A" <%if(msg01.getE01TLXPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01TLXPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01TLXPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPTLX" value="<%=msg01.getE01CRPTLX()%>" readonly></td><td align="center"><select name="E01TLXCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01TLXCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01TLXCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01TLXCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
	
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Cancelaci�n</td>
	    <td align="center"><input type="text" name="E01CANFEE" value="<%=msg01.getE01CANFEE()%>" readonly></td><td align="center"><select name="E01CANPBY" disabled>
			<option value="A" <%if(msg01.getE01CANPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01CANPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01CANPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPCAN" value="<%=msg01.getE01CRPCAN()%>" readonly></td><td align="center"><select name="E01CANCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01CANCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01CANCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01CANCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
    
    <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Pago</td>
	    <td align="center"><input type="text" name="E01PAYCOM" value="<%=msg01.getE01PAYCOM()%>" readonly></td><td align="center"><select name="E01PMCPBY" disabled>
			<option value="A" <%if(msg01.getE01PMCPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01PMCPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01PMCPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPPAY" value="<%=msg01.getE01CRPPAY()%>" readonly></td><td align="center"><select name="E01PMCCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01PMCCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01PMCCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01PMCCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>
	
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Transferencia de Fondos</td>
	    <td align="center"><input type="text" name="E01WTRCOM" value="<%=msg01.getE01WTRCOM()%>" readonly></td><td align="center"><select name="E01WTRPBY" disabled>
			<option value="A" <%if(msg01.getE01WTRPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01WTRPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01WTRPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPWTR" value="<%=msg01.getE01CRPWTR()%>" readonly></td><td align="center"><select name="E01WTRCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01WTRCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01WTRCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01WTRCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
    </tr>

	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Reembolso</td>
	    <td align="center"><input type="text" name="E01RMBCOM" value="<%=msg01.getE01RMBCOM()%>" readonly></td><td align="center"><select name="E01RMBPBY" disabled>
			<option value="A" <%if(msg01.getE01RMBPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01RMBPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01RMBPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPRMB" value="<%=msg01.getE01CRPRMB()%>" readonly></td><td align="center"><select name="E01RMBCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01RMBCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01RMBCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01RMBCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	 </tr>
	 
	 <%  if (userPO.getHeader1().equals("02")){%>
	  <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Comision Por Plazo</td>
	    <td align="center"><input type="text" name="E01TRMCOM" value="<%=msg01.getE01TRMCOM()%>" readonly></td><td align="center"><select name="E01TRMPBY" disabled>
			<option value="A" <%if(msg01.getE01TRMPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01TRMPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01TRMPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center">&nbsp;</td><td align="center">&nbsp;</td>
    </tr>
    <% } %>
    
    <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">	<%if(msg01.getE01LCCFL1().equals("Y"))  out.print("Convenio ALADI");
	    					else out.print("Timbres");%>
	    </TD>
	    <td align="center"><input type="text" name="E01ALDCOM" value="<%=msg01.getE01ALDCOM()%>" readonly></td><td align="center"><select name="E01ALDPBY" disabled>
			<option value="A" <%if(msg01.getE01ALDPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01ALDPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01ALDPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"><input type="text" name="E01CRPALD" value="<%=msg01.getE01CRPALD()%>" readonly></td><td align="center"><select name="E01ALDCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01ALDCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01ALDCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01ALDCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	
    <%if (msg01.getE01OPCODE().equals("5")) {%>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Comisi�n de Agente</td>
	    <td align="center"><input type="text" name="E01BRKCOM" value="<%=msg01.getE01BRKCOM()%>" readonly></td><td align="center"><select name="E01BRKPBY" disabled>
			<option value="A" <%if(msg01.getE01BRKPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01BRKPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01BRKPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center">&nbsp;</td><td align="center">&nbsp;</td>
    </tr>
	<%}
        if (userPO.getHeader1().equals("18")){%>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Intereses</td>
	    <td align="center"><input type="text" name="E01INTCHG" value="<%=msg01.getE01INTCHG()%>" readonly></td><td align="center"><select name="E01INTPBY" disabled>
			<option value="A" <%if(msg01.getE01INTPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01INTPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01INTPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center">&nbsp;</td><td align="center">&nbsp;</td>
	</tr>
    <%}
        if (msg01.getE01OPCODE().equals("3")) {%>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<td align="left">Aceptaci�n</td><td align="center">
		<input type="text" name="E01ACPCOM" value="<%=msg01.getE01ACPCOM()%>" readonly></td><td align="center"><select name="E01ACCPBY" disabled>
			<option value="A" <%if(msg01.getE01ACCPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01ACCPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01ACCPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center">
			<input type="text" name="E01CRPACP" value="<%=msg01.getE01CRPACP()%>" readonly></td><td align="center"><select name="E01ACCCPB" disabled>
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<option value="A" <%if(msg01.getE01ACCCPB().equals("A")) out.print("selected");%>>Aplicante</option>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<option value="B" <%if(msg01.getE01ACCCPB().equals("B")) out.print("selected");%>>Beneficiario</option>
			<% } %>
			<option value="W" <%if(msg01.getE01ACCCPB().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<td align="left">Descuento</td><td align="center">
		<input type="text" name="E01DSCAMN" value="<%=msg01.getE01DSCAMN()%>" readonly></td><td align="center"><select name="E01DSCPBY" disabled>
			<option value="A" <%if(msg01.getE01DSCPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01DSCPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01DSCPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td><td align="center"></td><td align="center"></td>
	</tr>
	<%}%>
  </tbody>
</table>
<% } else { %>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <tbody>
    <tr id="trdark">
      <td nowrap align="left"><b>Comisi&oacute;n</b></td>
      <td nowrap align="center"><b>Monto</b></td>
      <td nowrap align="center"><b>Por</b></td>
    </tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Emisi&oacute;n</td>
	    <td align="center"><input name="E01ISSFEE" type="text" id="E01ISSFEE" value="<%=msg01.getE01ISSFEE()%>" readonly></td><td align="center"><select name="E01ISSPBY" disabled>
			<option value="A" <%if(msg01.getE01ISSPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01ISSPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01ISSPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Aviso</td>
	    <td align="center"><input name="E01ADVCOM" type="text" value="<%=msg01.getE01ADVCOM()%>" readonly></td><td align="center"><select name="E01ADVPBY" disabled>
			<option value="A" <%if(msg01.getE01ADVPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01ADVPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01ADVPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Confirmaci&oacute;n</td>
	    <td align="center"><input type="text" name="E01CNFCOM" value="<%=msg01.getE01CNFCOM()%>" readonly></td><td align="center"><select name="E01CNFPBY" disabled>
			<option value="A" <%if(msg01.getE01CNFPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01CNFPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01CNFPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Enmienda</td>
	    <td align="center"><input type="text" name="E01AMDFEE" value="<%=msg01.getE01AMDFEE()%>" readonly></td><td align="center"><select name="E01AMDPBY" disabled>
			<option value="A" <%if(msg01.getE01AMDPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01AMDPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01AMDPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
    <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Aviso de Enmienda</td>
	    <td align="center"><input type="text" name="E01ADVAMF" value="<%=msg01.getE01ADVAMF()%>" readonly></td><td align="center"><select name="E01AAMPBY" disabled>
			<option value="A" <%if(msg01.getE01AAMPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01AAMPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01AAMPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
    <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Discrepancia</td>
	    <td align="center"><input type="text" name="E01DISCOM" value="<%=msg01.getE01DISCOM()%>" readonly></td><td align="center"><select name="E01DISPBY" disabled>
			<option value="A" <%if(msg01.getE01DISPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01DISPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01DISPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Extensi�n de Validez</td>
	    <td align="center"><input type="text" name="E01EOVCOM" value="<%=msg01.getE01EOVCOM()%>" readonly></td><td align="center"><select name="E01EOVPBY" disabled>
			<option value="A" <%if(msg01.getE01EOVPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01EOVPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01EOVPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Portes</td>
	    <td align="center"><input type="text" name="E01POSTAM" value="<%=msg01.getE01POSTAM()%>" readonly></td><td align="center"><select name="E01POSPBY" disabled>
			<option value="A" <%if(msg01.getE01POSPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01POSPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01POSPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
    <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Courier</td>
	    <td align="center"><input type="text" name="E01COURAM" value="<%=msg01.getE01COURAM()%>" readonly></td><td align="center"><select name="E01COUPBY" disabled>
			<option value="A" <%if(msg01.getE01COUPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01COUPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01COUPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Swift de Apertura</td>
	    <td align="center"><input type="text" name="E01SWFFEE" value="<%=msg01.getE01SWFFEE()%>" readonly></td><td align="center"><select name="E01SWFPBY" disabled>
			<option value="A" <%if(msg01.getE01SWFPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01SWFPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01SWFPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Swift Adicional(es)</td>
	    <td align="center"><input type="text" name="E01TLXFEE" value="<%=msg01.getE01TLXFEE()%>" readonly></td><td align="center"><select name="E01TLXPBY" disabled>
			<option value="A" <%if(msg01.getE01TLXPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01TLXPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01TLXPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Cancelaci�n</td>
	    <td align="center"><input type="text" name="E01CANFEE" value="<%=msg01.getE01CANFEE()%>" readonly></td><td align="center"><select name="E01CANPBY" disabled>
			<option value="A" <%if(msg01.getE01CANPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01CANPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01CANPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
    <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Pago</td>
	    <td align="center"><input type="text" name="E01PAYCOM" value="<%=msg01.getE01PAYCOM()%>" readonly></td><td align="center"><select name="E01PMCPBY" disabled>
			<option value="A" <%if(msg01.getE01PMCPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01PMCPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01PMCPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Transferencia de Fondos</td>
	    <td align="center"><input type="text" name="E01WTRCOM" value="<%=msg01.getE01WTRCOM()%>" readonly></td><td align="center"><select name="E01WTRPBY" disabled>
			<option value="A" <%if(msg01.getE01WTRPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01WTRPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01WTRPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Reembolso</td>
	    <td align="center"><input type="text" name="E01RMBCOM" value="<%=msg01.getE01RMBCOM()%>" readonly></td><td align="center"><select name="E01RMBPBY" disabled>
			<option value="A" <%if(msg01.getE01RMBPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01RMBPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01RMBPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<%  if (userPO.getHeader1().equals("02")){%>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Comision Por Plazo</td>
	    <td align="center"><input type="text" name="E01TRMCOM" value="<%=msg01.getE01TRMCOM()%>" readonly></td><td align="center"><select name="E01TRMPBY" disabled>
			<option value="A" <%if(msg01.getE01TRMPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01TRMPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01TRMPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
    <% } %>
    <tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left"> <% if(msg01.getE01LCCFL1().equals("Y"))  out.print("Convenio ALADI");
	    				     else out.print("Timbres");%>
	    </TD>
	    <td align="center"><input type="text" name="E01ALDCOM" value="<%=msg01.getE01ALDCOM()%>" readonly></td><td align="center"><select name="E01ALDPBY" disabled>
			<option value="A" <%if(msg01.getE01ALDPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01ALDPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01ALDPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
    <%if (msg01.getE01OPCODE().equals("5")) {%>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Comisi�n de Agente</td>
	    <td align="center"><input type="text" name="E01BRKCOM" value="<%=msg01.getE01BRKCOM()%>" readonly></td><td align="center"><select name="E01BRKPBY" disabled>
			<option value="A" <%if(msg01.getE01BRKPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01BRKPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01BRKPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<%}
		if (userPO.getHeader1().equals("18")){%>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <td align="left">Intereses</td>
	    <td align="center"><input type="text" name="E01INTCHG" value="<%=msg01.getE01INTCHG()%>" readonly></td><td align="center"><select name="E01INTPBY" disabled>
			<option value="A" <%if(msg01.getE01INTPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01INTPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01INTPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
    <%}
        if (msg01.getE01OPCODE().equals("3")) {%>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<td align="left">Aceptacion</td><td align="center">
		<input type="text" name="E01ACPCOM" value="<%=msg01.getE01ACPCOM()%>" readonly></td><td align="center"><select name="E01ACCPBY" disabled>
			<option value="A" <%if(msg01.getE01ACCPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01ACCPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01ACCPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<tr id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<td align="left">Descuento</td><td align="center">
		<input type="text" name="E01DSCAMN" value="<%=msg01.getE01DSCAMN()%>" readonly></td><td align="center"><select name="E01DSCPBY" disabled>
			<option value="A" <%if(msg01.getE01DSCPBY().equals("A")) out.print("selected");%>>Aplicante</option>
			<option value="B" <%if(msg01.getE01DSCPBY().equals("B")) out.print("selected");%>>Beneficiario</option>
			<option value="W" <%if(msg01.getE01DSCPBY().equals("W")) out.print("selected");%>>No Cobrar</option>
			</select></td>
	</tr>
	<%}%>
  </tbody>
</table>
<% } %>

 <h4>Informaci�n Banco a Banco</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap align="center">
               <INPUT type="text" name="E01BKTBK1" maxlength="35" size="45" value="<%= msg01.getE01BKTBK1().trim()%>"readonly>
            </td>  
          </tr>
          <tr id="trclear">
            <td nowrap align="center">
            	<INPUT type="text" name="E01BKTBK2" maxlength="35" size="45" value="<%= msg01.getE01BKTBK2().trim()%>"readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap align="center">
            	<INPUT type="text" name="E01BKTBK3" maxlength="35" size="45" value="<%= msg01.getE01BKTBK3().trim()%>"readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap align="center">
            	<INPUT type="text" name="E01BKTBK4" maxlength="35" size="45" value="<%= msg01.getE01BKTBK4().trim()%>"readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap align="center">
            	<INPUT type="text" name="E01BKTBK5" maxlength="35" size="45" value="<%= msg01.getE01BKTBK5().trim()%>"readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap align="center">
            	<INPUT type="text" name="E01BKTBK6" maxlength="35" size="45" value="<%= msg01.getE01BKTBK6().trim()%>"readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  

<p align="center">&nbsp;</p>

</form>
</body>
</html>
