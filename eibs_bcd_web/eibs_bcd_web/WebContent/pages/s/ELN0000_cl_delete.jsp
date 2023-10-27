<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Básica de Lineas de Credito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="clDel" class="datapro.eibs.beans.ELN000001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Lineas de Cr&eacute;dito - Informaci&oacute;n B&aacute;sica<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cl_delete,ELN0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01WLNBNK"  value="<%= clDel.getE01WLNBNK().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="13%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" readonly name="E01WLNCUN" size="10" maxlength="9" value="<%= clDel.getE01WLNCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="17%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" readonly name="E01CUSNA1" size="45" maxlength="45" value="<%= clDel.getE01CUSNA1().trim()%>" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="13%"> 
              <div align="right"><b>Linea : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" readonly name="E01WLNNUM" size="5" maxlength="4" value="<%= clDel.getE01WLNNUM().trim()%>" >
              </div>
            </td>
            <td nowrap width="17%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"><b>
                <input type="text" readonly <% if (clDel.getF01LNECCY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCCY1" size="3" maxlength="3" value="<%= clDel.getE01WLNCCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b>Cupo de Cr&eacute;dito :</b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b>
                <input type="text" readonly <% if (clDel.getF01LNECCU().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCCU1" size="9" maxlength="9" value="<%= clDel.getE01WLNCCU().trim()%>" >
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos B&aacute;sicos</h4>
      <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Banco / Sucursal :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly  <% if (clDel.getF01LNEBNK().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNBNK" size="2" maxlength="2" value="<%= clDel.getE01WLNBNK().trim()%>" >
              <input type="text" readonly <% if (clDel.getF01LNEBRN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNBRN" size="5" maxlength="4" value="<%= clDel.getE01WLNBRN().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Comprometida o No :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" readonly <% if (clDel.getF01LNECOU().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCOU" size="2" 
				value="<% if (clDel.getE01WLNCOU().equals("C")) out.print("Si"); else if (clDel.getE01WLNCOU().equals("U")) out.print("No"); %>" >
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Moneda / Cuenta Contable :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clDel.getF01LNECCY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCCY" size="4" maxlength="3" value="<%= clDel.getE01WLNCCY().trim()%>" >
              <input type="text" readonly <% if (clDel.getF01LNEGLN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNGLN" size="16" maxlength="16" value="<%= clDel.getE01WLNGLN().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="24%" > 
		   		<eibsinput:date name="clDel" fn_year="E01WLNMTY" fn_month="E01WLNMTM" fn_day="E01WLNMTD" modified="F01LNEMTM;F01LNEMTD;F01LNEMTY" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="28%" > 
		   		<eibsinput:date name="clDel" fn_year="E01WLNOPY" fn_month="E01WLNOPM" fn_day="E01WLNOPD" modified="F01LNEOPM;F01LNEOPD;F01LNEOPY" readonly="true"/>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" readonly <% if (clDel.getF01LNECCS().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCCS" size="8" maxlength="8" value="<%= clDel.getE01WLNCCS().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clDel.getF01LNETER().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTER" size="4" maxlength="3" value="<%= clDel.getE01WLNTER().trim()%>">
              <input type="text" readonly <% if (clDel.getF01LNETRC().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTRC" size="10" 
                value="<% if(clDel.getE01WLNTRC().equals("D")) out.print("D&iacute;a(s)");
                	 	  else if(clDel.getE01WLNTRC().equals("M")) out.print("Mes(es)");
                		  else if(clDel.getE01WLNTRC().equals("Y")) out.print("A&ntilde;o(s)"); %>">
            </td>
            <td nowrap width="24%" > 
              <div align="right">Fecha de Autorizaci&oacute;n :</div>
            </td>
            <td nowrap width="24%" > 
		   		<eibsinput:date name="clDel" fn_year="E01WLNAUY" fn_month="E01WLNAUM" fn_day="E01WLNAUD" modified="F01LNEAUM;F01LNEAUD;F01LNEAUY" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Tipo de Autorizaci&oacute;n :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clDel.getF01LNEATY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNATY" size="3" maxlength="2" value="<%= clDel.getE01WLNATY().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Tipo de Linea :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" readonly <% if (clDel.getF01LNETYL().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTYL" size="3" maxlength="3" value="<%= clDel.getE01WLNTYL().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Categor&iacute;a de la Linea :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clDel.getF01LNECAT().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCAT" size="2" maxlength="1" value="<%= clDel.getE01WLNCAT().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Fecha de Revisi&oacute;n :</div>
            </td>
            <td nowrap width="24%" > 
		   		<eibsinput:date name="clDel" fn_year="E01WLNRVY" fn_month="E01WLNRVM" fn_day="E01WLNRVD" modified="F01LNERVM;F01LNERVD;F01LNERVY" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" height="22" > 
              <div align="right">Importe Aprobado :</div>
            </td>
            <td nowrap width="28%" height="22" > 
              <input type="text" readonly <% if (clDel.getF01LNEAMN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNAMN" size="15" maxlength="15" value="<%= clDel.getE01WLNAMN().trim()%>" >
            </td>
            <td nowrap width="24%" height="22" > 
              <div align="right">Fecha de Reasignaci&oacute;n :</div>
            </td>
            <td nowrap width="24%" height="22" > 
		   		<eibsinput:date name="clDel" fn_year="E01WLNREY" fn_month="E01WLNREM" fn_day="E01WLNRED" modified="F01LNEREM;F01LNERED;F01LNEREY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Monto de Reasignaci&oacute;n :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clDel.getF01LNEREA().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNREA" size="15" maxlength="15" value="<%= clDel.getE01WLNREA().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Operaci&oacute;n en otra Moneda :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" readonly <% if (clDel.getF01LNEMUB().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNMUB" size="2" 
				value="<% if (clDel.getE01WLNMUB().equals("Y")) out.print("Si"); else if (clDel.getE01WLNMUB().equals("N")) out.print("No"); %>" >
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Autorizada por :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clDel.getF01LNEABY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNABY" size="26" maxlength="25" value="<%= clDel.getE01WLNABY().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Indicador T&eacute;rmino :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" readonly <% if (clDel.getF01LNETRM().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTRM" size="24" 
                value="<% if (clDel.getE01WLNTRM().equals("L")) out.print("Largo Plazo");
                		  else if (clDel.getE01WLNTRM().equals("S")) out.print("Corto Plazo");
                		  else if(clDel.getE01WLNTRM().equals("T")) out.print("Tomadas a Corresponsal"); %>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Cliente / Linea Relacionada :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clDel.getF01LNECGM().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCGM" size="10" maxlength="9" value="<%= clDel.getE01WLNCGM().trim()%>" >
              <input type="text" readonly <% if (clDel.getF01LNELGM().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNLGM" size="5" maxlength="4" value="<%= clDel.getE01WLNLGM().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Linea de Control :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" readonly <% if (clDel.getF01LNECCU().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCCU" size="10" maxlength="9" value="<%= clDel.getE01WLNCCU().trim()%>" >
              <input type="text" readonly <% if (clDel.getF01LNECLN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCLN" size="5" maxlength="4" value="<%= clDel.getE01WLNCLN().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Tarifas</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla de Tarifas para Prestamos :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (clDel.getF01LNETLN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTLN" size="2" maxlength="1" value="<%= clDel.getE01WLNTLN().trim()%>" >
            </td>
            <td nowrap width="21%" > 
              <div align="right">Tasa de Inter&eacute;s :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" readonly <% if (clDel.getF01LNEBSR().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNORT" size="10" maxlength="9" value="<%= clDel.getE01WLNORT().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla de Tarifas para L/C :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (clDel.getF01LNETLC().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTLC" size="2" maxlength="1" value="<%= clDel.getE01WLNTLC().trim()%>" >
            </td>
            <td nowrap width="21%" > 
              <div align="right">Tasa D&iacute;as Gracia :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" readonly <% if (clDel.getF01LNEMRT().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNMRT" size="10" maxlength="9" value="<%= clDel.getE01WLNMRT().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla de Tarifas para Cta./ Cte. :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (clDel.getF01LNETRT().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTRT" size="2" maxlength="1" value="<%= clDel.getE01WLNTRT().trim()%>" >
            </td>
            <td nowrap width="21%" > 
              <div align="right">D&iacute;as Gracia Inter&eacute;s :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" readonly <% if (clDel.getF01LNEMXT().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNMXT" size="4" maxlength="3" value="<%= clDel.getE01WLNMXT().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla / Tipo Tasa Flotante :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (clDel.getF01LNEFTB().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNFTB" size="2" maxlength="2" value="<%= clDel.getE01WLNFTB().trim()%>">
              <input type="text" readonly <% if (clDel.getF01LNEFTY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNFTY" size="10"
                value="<% if (clDel.getE01WLNFTY().equals("FP")) out.print("Primaria");
                		  else if (clDel.getE01WLNFTY().equals("FS")) out.print("Secundaria");
						  else out.println(""); %>">
            </td>
            <td nowrap width="21%" > 
              <div align="right">Nivel Cr&eacute;dito Cliente :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" readonly <% if (clDel.getF01LNECRR().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCRR" size="2" maxlength="1" value="<%= clDel.getE01WLNCRR().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Prop&oacute;sito de L&iacute;nea :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (clDel.getF01LNEPUR().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNPUR" size="36" maxlength="35" value="<%= clDel.getE01WLNPUR().trim()%>">
            </td>
            <td nowrap width="21%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="20%" >&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Cargos</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">Tipo de Cargos :</div>
            </td>
            <td nowrap width="16%" > 
              <input type="text" readonly <% if (clDel.getF01LNEFET().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNFET" size="3" maxlength="2" value="<%= clDel.getE01WLNFET().trim()%>" >
            </td>
            <td nowrap width="22%" > 
              <div align="right">Fecha Pr&oacute;ximo Cargo :</div>
            </td>
            <td nowrap width="40%" > 
		   		<eibsinput:date name="clDel" fn_year="E01WLNCHY" fn_month="E01WLNCHM" fn_day="E01WLNCHD" modified="F01LNECHM;F01LNECHD;F01LNECHY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" > 
              <div align="right">Tasa para Cargos :</div>
            </td>
            <td nowrap width="16%" > 
              <input type="text" readonly <% if (clDel.getF01LNEPRD().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNBSR" size="10" maxlength="9" value="<%= clDel.getE01WLNBSR().trim()%>" >
            </td>
            <td nowrap width="22%" > 
              <div align="right">Base para Cargos :</div>
            </td>
            <td nowrap width="40%" > 
              <input type="text" readonly <% if (clDel.getF01LNEYBS().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNYBS" size="4" maxlength="3" value="<%= clDel.getE01WLNYBS().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">Frecuencia :</div>
            </td>
            <td nowrap width="16%" >
              <input type="text" name="E01WLNPRD" size="2" maxlength="1" value="<%= clDel.getE01WLNPRD().trim()%>" >
            </td>
            <td nowrap width="22%" > 
              <div align="right">I.V.A. :</div>
            </td>
            <td nowrap width="40%" >
              <input type="text" readonly <% if (clDel.getF01LNEIVA().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNIVA" size="2" 
				value="<% if (clDel.getE01WLNIVA().equals("Y")) out.print("Si"); else if (clDel.getE01WLNIVA().equals("N")) out.print("No"); %>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="22%" >
              <div align="right">Cuenta a Debitar :</div>
            </td>
            <td nowrap width="16%" >
              <input type="text" readonly <% if (clDel.getF01LNEBDA().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNBDA" size="2" maxlength="2" value="<%= clDel.getE01WLNBDA().trim()%>" >
              <input type="text" readonly <% if (clDel.getF01LNEDAB().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNDAB" size="4" maxlength="3" value="<%= clDel.getE01WLNDAB().trim()%>" >
              <input type="text" readonly <% if (clDel.getF01LNECDA().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCDA" size="4" maxlength="3" value="<%= clDel.getE01WLNCDA().trim()%>" >
              <input type="text" readonly <% if (clDel.getF01LNEADN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNADN" size="16" maxlength="16" value="<%= clDel.getE01WLNADN().trim()%>" >
            </td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap width="40%" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Eliminar">
  </p>
  </form>
</body>
</html>
