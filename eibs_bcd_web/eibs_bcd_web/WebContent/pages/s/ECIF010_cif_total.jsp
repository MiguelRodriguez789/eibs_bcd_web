<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Resumen de Operaciones por Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="cifTotal" class="datapro.eibs.beans.ECIF01003Message" scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function showGraph()
{
	var pg= "<%=request.getContextPath()%>/pages/s/ECIF010_cif_total_graph.jsp";
	CenterNamedWindow(pg,'graph',700,560,2);
}

builtNewMenu(ecif10_i_opt);

</SCRIPT>


</head>

<body>

<%@ page import = "datapro.eibs.master.Util" %>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center">Resumen de Operaciones por Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cif_total.jsp, ECIF010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="6">
  <h4>Informaci&oacute;n del Cliente</h4>
 <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%" height="31"> 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap width="30%" height="31"> 
              <input type="text" readonly name="E03CUSCUN"  size="10" maxlength="9" value="<%= cifTotal.getE03CUSCUN().trim()%>">
            </td>
            <td nowrap width="20%" height="31"> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap width="30%" height="31"> 
              <input type="text" readonly name="E03CUSNA1"  size="50" maxlength="45" value="<%= cifTotal.getE03CUSNA1().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Tel&eacute;fono Residencia :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" readonly name="E03CUSHPN" size="17" maxlength="15" value="<%= cifTotal.getE03CUSHPN().trim()%>">
            </td>
            <td nowrap width="20%"> 
              <div align="right">Tel&eacute;fono Trabajo :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" readonly name="E03CUSPHN" size="17" maxlength="15" value="<%= cifTotal.getE03CUSPHN().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Teléfono Celular :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" readonly name="E03CUSPH1" size="17" maxlength="15" value="<%= cifTotal.getE03CUSPH1().trim()%>">
            </td>
            <td nowrap width="20%"> 
              <div align="right">Facsimil :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" readonly name="E03CUSFAX" size="17" maxlength="15" value="<%= cifTotal.getE03CUSFAX().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Correo Electronico :</div>
            </td>
            <td nowrap width="30%"><a href="mailto:<%= cifTotal.getE03CUSIAD().trim()%>" target="body"><%= cifTotal.getE03CUSIAD().trim()%></a> 
            </td>
            <td nowrap width="20%">
            </td>
            <td nowrap width="30%"> 
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  <table class=tbenter>
   <tr > 
      <td nowrap align=right> 
	     <b>TOTALES EN MONEDA :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= currUser.getE01BCU().trim()%></font></b>
      </td>
      <td nowrap align=right> 
   		<b>CLIENTE :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= cifTotal.getE03CLILGT().trim()%></font></b>
      </td>
      <td nowrap align=right> 
   		<b>TIPO :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= cifTotal.getE03CLITYP().trim()%></font></b>
      </td>
      <td nowrap align=right> 
   		<b>ESTADO :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= cifTotal.getE03CLISTS().trim()%></font></b>
      </td>
    </tr>
  </table>
  
  <table  id="tbhelp" class="noPrint">
    <tr> 
      <td width="12%" nowrap>Ver Gr&aacute;fica</td>
      <td width="88%"><i class="fa fa-pie-chart  fa-2x" aria-hidden="true" onclick="javascript:showGraph()"></i>
       <%--  <a href="javascript:showGraph()"><img src="<%=request.getContextPath()%>/images/graphic.gif" border="0" width="32" height="32"></a> --%></td>
    </tr>
  </table>
<div class="print"> 
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap height="31" bordercolor="#000000" colspan=2> 
              <div align="center"><b>A Favor del Banco</b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" colspan=2> 
              <div align="center"><b>A Favor del Cliente</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000" height="31"> 
              <div align="right"><a href="javascript:showAcc('OV','')">Cuentas 
                Sobregiradas : </a> </div>
            </td>
            <td nowrap width="21%" bordercolor="#000000" height="31"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03OVDRFT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000" height="31"> 
              <div align="right"><a href="javascript:showAcc('01','')">Cuentas 
                sin Interes :</a> </div>
            </td>
            <td nowrap width="26%" height="31" bordercolor="#000000" > 
              <div align="center">
                <eibsinput:text name="cifTotal" property="E03CTACTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('10','H')">Prestamos 
                Hipotecarios :</a> </div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03LNSMOR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('MK','')">Cuentas 
                con Interes:</a> </div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center">
                <eibsinput:text name="cifTotal" property="E03CTAMMK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000" height="35"> 
              <div align="right"><a href="javascript:showAcc('10','A')">Arrendamiento 
                Financiero :</a> </div>
            </td>
            <td nowrap width="21%" bordercolor="#000000" height="35"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03LNSLSG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000" height="35"> 
              <div align="right"><a href="javascript:showAcc('04','')">Cuentas 
                de Ahorro :</a> </div>
            </td>
            <td nowrap width="26%" height="35" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03CTAAHO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('10','C')">Cr&eacute;dito 
                de Consumo :</a></div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03LNSCON" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('06','')">Cuota de 
              	Paticipacion :</a> </div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03CTAPAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('10','X')">Prest&aacute;mos 
                :</a></div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03LNSGRL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('CD','')">Depositos a Plazo 
                :</a> </div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03CDTDPO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('10','G')">Facturas 
                Descontadas :</a></div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03DESDOC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                               
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('13','L')">Inversiones 
                :</a></div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03INVERP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('13','A')">Inversiones 
                :</a> </div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03INVERA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('10','P')">Participaciones 
                :</a> </div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03PARTIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('14','A')">Aceptaciones 
                :</a></div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03ACEPTA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('14','L')">Aceptaciones 
                :</a> </div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03ACEPTP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('LC','C')">C. de 
                C. Confirmadas :</a></div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03LCCONF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('LC','P')">C. de 
                C. en Proceso :</a> </div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03LCPROC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('30','')">Spot Comprados 
                :</a> </div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03SPTPUR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('31','')">Spot Vendidos 
                :</a></div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03SPTSAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('32','')">Forward Comprados :</a></div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03FRWPUR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000">
              <div align="right"><a href="javascript:showAcc('33','')">Forward Vendidos :</a> </div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03FRWSAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"></div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000">
              <div align="right"><a href="javascript:showAcc('97','')">Remanentes :</a> </div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03REMANE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="25%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><b>Total Activo :</b></div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03TOTASS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                 
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right"><b>Total Pasivo :</b></div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03TOTLIA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
</div>  
<div class="print"> 
  <h4>Lineas de Crédito</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" height="31" bordercolor="#000000"> 
        <div align="center">Monto Aprobado</div>
      </td>
      <td width="23%"> 
        <div align="center">Monto Utilizado</div>
      </td>
      <td width="20%"> 
              <div align="center">Monto Disponible</div>
      </td>
      <td width="20%"> 
              <div align="center">Participaciones</div>
      </td>
      <td width="20%"> 
        <div align="center">Solicitudes de Hoy</div>
      </td>
    </tr>
    <tr>
      <td width="17%"> 
        <div align="center">
          <eibsinput:text name="cifTotal" property="E03LNEAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>          
        </div>
      </td>
      <td width="23%"> 
        <div align="center">
          <eibsinput:text name="cifTotal" property="E03LNEUSE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>          
        </div>
      </td>
      <td width="20%"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03LNEAVA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
      </td>
      <td width="20%"> 
              <div align="center">
                <eibsinput:text name="cifTotal" property="E03PARVEN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
      </td>
      <td width="20%"> 
        <div align="center">
          <eibsinput:text name="cifTotal" property="E03LNETDY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>          
        </div>
      </td>
    </tr>
  </table>
      </td>
    </tr>
  </table>
</div>
<div class="print"> 
  <h4>Otras Operaciones</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap height="31" bordercolor="#000000" colspan=2> 
              <div align="center"><b>A Favor del Banco</b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" colspan=2> 
              <div align="center"><b>A Favor del Cliente</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('43','D')">Boleta Garant&iacute;a en Documento : </a></div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03GARPAG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('43','B')">Boleta Garant&iacute;a en Efectivo : </a></div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03GAREFE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('59','A')">Seguros Adquiridos : </a></div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03SEGGRL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('50','I')">Cobranzas Internacionales : </a></div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03CBZINT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('41','')">Aceptaciones Descontadas : </a></div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03ACPDES" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('51','')">Cobranzas Locales : </a></div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03CBZLOC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('LC','N')">C. de C. No Confirmadas : </a></div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03LCNCON" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('91','')">Garant&iacute;as en Custodio : </a></div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03COLATE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('51','R')">Cobranzas Recibidas : </a></div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03COLREC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('CD','P')">Certificados Pignorados : </a></div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03CDTPIG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="22%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right"></div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><b>Total D&eacute;bito : </b></div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03TOTCDB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right"><b>Total Cr&eacute;dito : </b></div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <eibsinput:text name="cifTotal" property="E03TOTCCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div> 
	<div align="center"> 
		<input id="PRINTBTN" class="EIBSBTN" type=button name="Submit" OnClick="doPrint()" value="Imprimir">
	</div>  
	<SCRIPT type="text/javascript">
	
	  function doPrint(){
			document.getElementById('PRINTBTN').style.visibility = 'hidden';
		    window.focus();
		    if (document.queryCommandSupported("print")) {
		    	document.execCommand('print', false, null);
		    } else {
				window.print();
			}
			document.getElementById('PRINTBTN').style.visibility = 'visible';
			return;
	  }
	</SCRIPT>
  </form>
</body>
</html>
