<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@page import="datapro.eibs.master.Util"%>
<html>
<head>
<title>Consulta de Descuento de Documentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="inqLoans" class="datapro.eibs.beans.EDL016001Message"  scope="session" />
<jsp:useBean id="inqBasic" class="datapro.eibs.beans.EDL016002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	builtNewMenu(dft_i_opt);

</SCRIPT>


</head>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

	String mem = Util.takeComa(inqLoans.getE01DEAMEM().replace('.','x').replace(',','.').replace('x',','));
	String tdm = Util.takeComa(inqLoans.getE01DEATDM().replace('.','x').replace(',','.').replace('x',','));
	//System.out.println(mem);
	java.math.BigDecimal intt = new java.math.BigDecimal(0.00);
	java.math.BigDecimal int1 = new java.math.BigDecimal(mem);
	java.math.BigDecimal int2 = new java.math.BigDecimal(tdm);
	intt = int1;
	intt = intt.subtract(int2);
	
	String mask="#,###,###,###,##0.00";
	java.text.DecimalFormatSymbols dfs = new java.text.DecimalFormatSymbols(java.util.Locale.US);
	java.text.NumberFormat nf = new java.text.DecimalFormat(mask, dfs);
	//java.text.NumberFormat nf = java.text.NumberFormat.getInstance(java.util.Locale.GERMAN);
    String interest=nf.format(intt.doubleValue());
    //System.out.println(interest);
	
	String memtdm = interest.replace(',','x').replace('.',',').replace('x','.');

%> 
<div align="center"></div>
<h3 align="center">Consulta Descuento de Documentos<br>Saldos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_inq_balances.jsp, EDL0800"></h3>
<hr size="4">
<div style="color:red;font-size:13;font-weight:bold;text-align:right;">
<label><%=inqLoans.getE01PENDAP().toUpperCase()%></label>
</div>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <input type=HIDDEN name="SCREEN" value="1">
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
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="21%"> 
			  <b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table class=tbenter>
   <tr > 
      <td nowrap> 
   		<h4>Sumario</h4>
      </td>
      <td nowrap align=right> 
   		<b>ESTADO :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= inqLoans.getE01STATUS().trim()%></font></b>
      </td>
    </tr>
  </table>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAOAM" size="20" maxlength="19" value="<%= inqLoans.getE01DEAOAM().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="inqLoans" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Saldo Principal :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAMEP" size="20" maxlength="19" value="<%= inqLoans.getE01DEAMEP().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="inqLoans" fn_month="E01DEAMDM" fn_day="E01DEAMDD" fn_year="E01DEAMDY" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Valor Ajustado :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAREA" size="15" maxlength="15" value="<%= inqLoans.getE01DEAREA().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEATRM" size="5" maxlength="5" value="<%= inqLoans.getE01DEATRM().trim()%>">
              <input type="text" name="E01DEATRC" size="10" 
				  value="<% if (inqLoans.getE01DEATRC().equals("D")) out.print("D&iacute;a(s)");
							else if (inqLoans.getE01DEATRC().equals("M")) out.print("Mes(es)");
							else if (inqLoans.getE01DEATRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" 
				readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Interés Normal :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAMEI" size="15" maxlength="15" value="<%= inqLoans.getE01DEAMEI().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Tasa Interés :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01NOWRTE" size="9" maxlength="9" value="<%= inqLoans.getE01NOWRTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Interés Vencido :</div>
            </td>
            <td nowrap >
            	<% if (inqBasic.getE02DEAIFL().equals("1")) { %>
              <input type="text" name="E01DEATDM" size="15" maxlength="15" value="0,00" readonly>
            	<% } else { %>
              <input type="text" name="E01DEATDM" size="15" maxlength="15" value="<%= inqLoans.getE01DEATDM().trim()%>" readonly>
            	<% } %>
            </td>
            <td nowrap > 
              <div align="right">Interés Vencido y Mora :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAMEM" size="15" maxlength="15" value="<%= inqLoans.getE01DEAMEM().trim() %>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Interés Mora :</div>
            </td>
            <td nowrap > 
            	<% if (inqBasic.getE02DEAIFL().equals("1")) { %>
             <input type="text" name="E01DEAMEMTDM" size="15" maxlength="15" value="0,00" readonly>
            	<% } else { %>
             <input type="text" name="E01DEAMEMTDM" size="15" maxlength="15" value="<%= memtdm %>" readonly>
            	<% } %>
            </td>
            <td nowrap > 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEABAS" size="4" maxlength="3" value="<%= inqLoans.getE01DEABAS().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Deducciones :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01TOTDED" size="15" maxlength="15" value="<%= inqLoans.getE01TOTDED().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Ciclo / Fecha Principal :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAPPD" size="3" maxlength="3" value="<%= inqLoans.getE01DEAPPD().trim()%>" readonly>
              / 
            	<eibsinput:date name="inqLoans" fn_month="E01DEAHEM" fn_day="E01DEAHED" fn_year="E01DEAHEY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >
              <div align="right">Comisiones :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01TOTCOM" size="15" maxlength="15" value="<%= inqLoans.getE01TOTCOM().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Ciclo / Fecha Intereses :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAIPD" size="3" maxlength="3" value="<%= inqLoans.getE01DEAIPD().trim()%>" readonly>
              / 
            	<eibsinput:date name="inqLoans" fn_month="E01DEARDM" fn_day="E01DEARDD" fn_year="E01DEARDY" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap >
              <div align="right">Impuestos :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01TOTIMP" size="15" maxlength="15" value="<%= inqLoans.getE01TOTIMP().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Ciclo / Fecha Cambio Tasa :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= inqLoans.getE01DEARRP().trim()%>" readonly>
              / 
            	<eibsinput:date name="inqLoans" fn_month="E01DEARRM" fn_day="E01DEARRD" fn_year="E01DEARRY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >
              <div align="right">IVA :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01TOTIVA" size="15" maxlength="15" value="<%= inqLoans.getE01TOTIVA().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Cuota Financiera :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAROA" size="20" maxlength="19" value="<%= inqLoans.getE01DEAROA().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap >
              <div align="right">Saldo Total :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01MEMBAL" size="20" maxlength="19" value="<%= inqLoans.getE01MEMBAL().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Otros Cargos :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01OTHCHG" size="20" maxlength="19" value="<%= inqLoans.getE01OTHCHG().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Inter&eacute;s Calculado Hasta :</div>
            </td>
            <td nowrap >
            	<eibsinput:date name="inqLoans" fn_month="E01DEALCM" fn_day="E01DEALCD" fn_year="E01DEALCY" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Cuota Total :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01TOTPYM" size="20" maxlength="19" value="<%= inqLoans.getE01TOTPYM().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<jsp:include page="ESD0840_reevaluation_inquiry.jsp" flush="true">
	<jsp:param name="flag" value="<%=inqLoans.getH01FLGWK3()%>" />
</jsp:include>
  
  <h4>Informaci&oacute;n Adicional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Estado :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01STATUS" size="15" maxlength="1" value="<%= inqLoans.getE01STATUS().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Principal Vencido :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAPDU" size="15" maxlength="15" value="<%= inqLoans.getE01DEAPDU().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> Calificaci&oacute;n :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01CALIFI" size="2" maxlength="1" value="<%= inqLoans.getE01CALIFI().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Inter&eacute;s Pendiente en el Activo :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAIDU" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIDU().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> D&iacute;as en Mora :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01MORDYS" size="4" maxlength="4" value="<%= inqLoans.getE01MORDYS().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Previsi&oacute;n Principal :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01DLCPPR" size="15" maxlength="15" value="<%= inqLoans.getE01DLCPPR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  > 
              <div align="right">Cuotas Pagadas :</div>
            </td>
            <td nowrap  bordercolor="#000000" >
              <input type="text" name="E01CUOPAG" size="4" maxlength="4" value="<%= inqLoans.getE01CUOPAG().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <div align="right">Previsi&oacute;n Intereses :</div>
            </td>
            <td nowrap  bordercolor="#000000" >
              <input type="text" name="E01DLCPIN" size="15" maxlength="15" value="<%= inqLoans.getE01DLCPIN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Cuotas Vencidas :</div>
            </td>
            <td nowrap  bordercolor="#000000" height="32"> 
              <input type="text" name="E01CUOVEN" size="4" maxlength="4" value="<%= inqLoans.getE01CUOVEN().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000" height="32"> 
              <div align="right">Intereses Contingencia :</div>
            </td>
            <td nowrap  bordercolor="#000000" height="32">
              <input type="text" name="E01DLCICO" size="15" maxlength="15" value="<%= inqLoans.getE01DLCICO().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Fecha Ultima Renovaci&oacute;n :</div>
            </td>
            <td nowrap  bordercolor="#000000">
            	<eibsinput:date name="inqLoans" fn_month="E01DEAEXM" fn_day="E01DEAEXD" fn_year="E01DEAEXY" readonly="true"/>
            </td>
            <td nowrap  bordercolor="#000000">
              <div align="right">Mora Contingencia :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DLCPCO" size="15" maxlength="15" value="<%= inqLoans.getE01DLCPCO().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap >
              <div align="right">N&uacute;mero Renovaciones :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEARON" size="2" maxlength="2" value="<%= inqLoans.getE01DEARON().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000">
              <div align="right">Ultimo Cambio Calificaci&oacute;n :</div>
            </td>
            <td nowrap  bordercolor="#000000">
            	<eibsinput:date name="inqLoans" fn_month="E01DLCCOM" fn_day="E01DLCCOD" fn_year="E01DLCCOY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Posee Garant&iacute;as :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEAHTM" size="2" maxlength="1" value="<%= inqLoans.getE01DEAHTM().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right">L&iacute;nea de Cr&eacute;dito :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= inqLoans.getE01DEACMC().trim()%>" readonly>
              <input type="text" name="E01DEACMN2" size="4" maxlength="4" value="<%= inqLoans.getE01DEACMN().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Otros Saldos</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Principal Pagado :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01PRIPYM" size="15" maxlength="15" value="<%= inqLoans.getE01PRIPYM().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Interes Acumulado :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAIAL" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIAL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> Promedio Principal :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAAVP" size="15" maxlength="15" value="<%= inqLoans.getE01DEAAVP().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Inter&eacute;s Pagado :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAIPL" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIPL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Principal D&iacute;a Ayer :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAPRI" size="15" maxlength="15" value="<%= inqLoans.getE01DEAPRI().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Inter&eacute;s de Ayer :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01YESINT" size="15" maxlength="15" value="<%= inqLoans.getE01YESINT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap  >
              <div align="right">Valor Participado : </div>
            </td>
            <td nowrap  bordercolor="#000000" >
              <input type="text" name="E01VALPAR" size="15" maxlength="15" value="<%= inqLoans.getE01VALPAR().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000" >
              <div align="right">Inter&eacute;s Ajustado :</div>
            </td>
            <td nowrap  bordercolor="#000000" >
              <input type="text" name="E01DEAIJL" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIJL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Deducciones Pagadas :</div>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <input type="text" name="E01DEADEL" size="15" maxlength="15" value="<%= inqLoans.getE01DEADEL().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <div align="right">Inter&eacute;s Pagado A&ntilde;o :</div>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <input type="text" name="E01DEAIPY" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIPY().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Comisiones Pagadas :</div>
            </td>
            <td nowrap  bordercolor="#000000" height="20"> 
              <input type="text" name="E01DEACPL" size="15" maxlength="15" value="<%= inqLoans.getE01DEACPL().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000" height="20"> 
              <div align="right">Inter&eacute;s Diario :</div>
            </td>
            <td nowrap  bordercolor="#000000" height="20"> 
              <input type="text" name="E01DLYINT" size="15" maxlength="15" value="<%= inqLoans.getE01DLYINT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Impuestos Pagados :</div>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <input type="text" name="E01DEATPL" size="15" maxlength="15" value="<%= inqLoans.getE01DEATPL().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right">Mora Acumulado :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEAPIA" size="15" maxlength="15" value="<%= inqLoans.getE01DEAPIA().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">FECI Acumulado :</div>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <input type="text" name="E01DEAIVL" size="15" maxlength="15" value="<%= inqLoans.getE01DEAIVL().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right">Mora Pagada:</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEAPIP" size="15" maxlength="15" value="<%= inqLoans.getE01DEAPIP().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Tasas </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Tasa Base / Spread Actual : </div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEARTE" size="9" maxlength="9" value="<%= inqLoans.getE01DEARTE().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Tasa Flotante Actual :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAFRT" size="9" maxlength="9" value="<%= inqLoans.getE01DEAFRT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Tasa Base / Spread Anterior : </div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAPBR" size="9" maxlength="9" value="<%= inqLoans.getE01DEAPBR().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Tasa Flotante Anterior :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAPFR" size="9" maxlength="9" value="<%= inqLoans.getE01DEAPFR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Tasa Efectiva : </div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEASPR" size="9" maxlength="9" value="<%= inqLoans.getE01DEASPR().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Pr&oacute;xima Tasa Flotante :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEANER" size="9" maxlength="9" value="<%= inqLoans.getE01DEANER().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Fechas </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Fecha Valor :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="inqLoans" fn_month="E01DEASDM" fn_day="E01DEASDD" fn_year="E01DEASDY" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Fecha Ultimo Cambio Contable :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="inqLoans" fn_month="E01DEALGM" fn_day="E01DEALGD" fn_year="E01DEALGY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Fecha Ultimo Cambio de Tasa :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="inqLoans" fn_month="E01DEARCM" fn_day="E01DEARCD" fn_year="E01DEARCY" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right"> Fecha Ultimo Pago Capital :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="inqLoans" fn_month="E01DEALPM" fn_day="E01DEALPD" fn_year="E01DEALPY" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Fecha Pr&oacute;ximo Cambio de Tasa :</div>
            </td>
            <td nowrap> 
            	<eibsinput:date name="inqLoans" fn_month="E01DEANRM" fn_day="E01DEANRD" fn_year="E01DEANRY" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Fecha Ultimo Pago Intereses :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="inqLoans" fn_month="E01DEALIM" fn_day="E01DEALID" fn_year="E01DEALIY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Fecha Ultima Modificaci&oacute;n :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="inqLoans" fn_month="E01DEALMM" fn_day="E01DEALMD" fn_year="E01DEALMY" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Modificado por :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAUSR" size="15" maxlength="10" value="<%= inqLoans.getE01DEAUSR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Inter&eacute;s Pagado Hasta :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="inqLoans" fn_month="E01DEAITM" fn_day="E01DEAITD" fn_year="E01DEAITY" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Principal Pagado Hasta :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="inqLoans" fn_month="E01DEAPTM" fn_day="E01DEAPTD" fn_year="E01DEAPTY" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
