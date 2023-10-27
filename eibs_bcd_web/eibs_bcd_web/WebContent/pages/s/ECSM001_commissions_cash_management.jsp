<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECSM00101Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		}
	submitForm();
}

 
</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

 	String read = " ";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		read = " readonly "; 
	}
%>

<h3 align="center">Mantenimiento Comisiones - Motor de Pagos <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="commissions_cash_management.jsp, ECSM001"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM001" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<%int row = 0; %>
 
 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01CBCBNK" size="3" maxlength="2" value="<%= msgRcd.getE01CBCBNK() %>" readonly>
				</td>
            	<td nowrap width=10% align="right">Moneda : </td>
            	<td nowrap width=40% align="left">
            		<input type="text" name="E01CBCCCY" size="5" maxlength="4" value="<%= msgRcd.getE01CBCCCY() %>" readonly>
       			</td>
	  		</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
           	<td nowrap width=10% align="right">Tabla : </td>
            	<td nowrap width=40% align="left">
            		<input type="text" name="E01CBCTBL" size="5" maxlength="4" value="<%= msgRcd.getE01CBCTBL() %>"<%= read %>><%=mandatory %>
       			</td>
				<td nowrap width=10% align="right">Descripcion :</td>
				<td nowrap width=40% align="left">
            		<input type="text" name="E01CBCDSC" size="62" maxlength="60"  value="<%=msgRcd.getE01CBCDSC()%>"<%= read %>><%=mandatory %>
				</td>
	  		</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Cliente : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01CBCCUN" size="10" maxlength="9" value="<%=msgRcd.getE01CBCCUN()%>"<%= read %>>
             		<% if (userPO.getPurpose().equals("NEW")){ %>
                    <a href="javascript:GetCustomerDescId('E01CBCCUN','D01CBCCUN','')">
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Busqueda de Clientes" align="bottom" border="0" ></a>
            		<% } %>				    
                    <input type="text" name="D01CBCCUN" size="62" maxlength="60" value="<%= msgRcd.getD01CBCCUN().trim()%>" readonly>
				</td>
				<td nowrap width=10% align="right"></td>
				<td nowrap width=40% align="left"></td>
			</tr>
   		</table> 
      </td>  
    </tr>
  </table>

 <h4>Informaci&oacute;n Transaccional</h4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center">Tarifa</div>
            </td>
            <td nowrap > 
              <div align="center">Monto <BR>
                Minimo</div>
            </td>
            <td nowrap > 
              <div align="center">Monto <BR>
                Maximo</div>
            </td>
            <td nowrap > 
              <div align="center">Periodo</div>
            </td>
            <td nowrap > 
              <div align="center">Tipo</div>
            </td>
            <td nowrap > 
              <div align="center">Factor</div>
            </td>
            <td nowrap > 
              <div align="center">Impuesto</div>
            </td>
            <td nowrap > 
              <div align="center">Banco</div>
            </td>
            <td nowrap > 
              <div align="center">Moneda</div>
            </td>
            <td nowrap > 
              <div align="center">C/Contable <br> Ingreso/Egreso</div>
            </td>
            <td nowrap > 
              <div align="center">Narrativa</div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCVA1" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCVA1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMI1" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMI1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMA1" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMA1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCPE1" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmPerHelp,this.name)" value="<%= msgRcd.getE01CBCPE1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTP1" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTypHelp,this.name)" value="<%= msgRcd.getE01CBCTP1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCFA1" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCoFactHelp,this.name)" value="<%= msgRcd.getE01CBCFA1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTX1" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTxHelp,this.name)" value="<%= msgRcd.getE01CBCTX1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCBK1" size="2" maxlength="2" value="<%= msgRcd.getE01CBCBK1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCCY1" size="3" maxlength="3" value="<%= msgRcd.getE01CBCCY1()%>"
	              class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01CBCBK1.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCGI1" size="17" maxlength="16" value="<%= msgRcd.getE01CBCGI1()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01CBCBK1.value,document.forms[0].E01CBCCY1.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CBCDE1" size="25" maxlength="20" value="<%= msgRcd.getE01CBCDE1()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCVA2" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCVA2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMI2" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMI2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMA2" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMA2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCPE2" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmPerHelp,this.name)" value="<%= msgRcd.getE01CBCPE2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTP2" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTypHelp,this.name)" value="<%= msgRcd.getE01CBCTP2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCFA2" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCoFactHelp,this.name)" value="<%= msgRcd.getE01CBCFA2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTX2" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTxHelp,this.name)" value="<%= msgRcd.getE01CBCTX2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCBK2" size="2" maxlength="2" value="<%= msgRcd.getE01CBCBK2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCCY2" size="3" maxlength="3" value="<%= msgRcd.getE01CBCCY2()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01CBCBK2.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCGI2" size="17" maxlength="16" value="<%= msgRcd.getE01CBCGI2()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01CBCBK2.value,document.forms[0].E01CBCCY2.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CBCDE2" size="25" maxlength="20" value="<%= msgRcd.getE01CBCDE2()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCVA3" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCVA3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMI3" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMI3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMA3" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMA3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCPE3" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmPerHelp,this.name)" value="<%= msgRcd.getE01CBCPE3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTP3" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTypHelp,this.name)" value="<%= msgRcd.getE01CBCTP3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCFA3" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCoFactHelp,this.name)" value="<%= msgRcd.getE01CBCFA3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTX3" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTxHelp,this.name)" value="<%= msgRcd.getE01CBCTX3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCBK3" size="2" maxlength="2" value="<%= msgRcd.getE01CBCBK3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCCY3" size="3" maxlength="3" value="<%= msgRcd.getE01CBCCY3()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01CBCBK3.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCGI3" size="17" maxlength="16" value="<%= msgRcd.getE01CBCGI3()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01CBCBK3.value,document.forms[0].E01CBCCY3.value,'','','')" >
              </div>
            </td>
             <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CBCDE3" size="25" maxlength="20" value="<%= msgRcd.getE01CBCDE3()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCVA4" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCVA4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMI4" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMI4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMA4" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMA4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCPE4" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmPerHelp,this.name)" value="<%= msgRcd.getE01CBCPE4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTP4" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTypHelp,this.name)" value="<%= msgRcd.getE01CBCTP4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCFA4" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCoFactHelp,this.name)" value="<%= msgRcd.getE01CBCFA4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTX4" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTxHelp,this.name)" value="<%= msgRcd.getE01CBCTX4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCBK4" size="2" maxlength="2" value="<%= msgRcd.getE01CBCBK4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCCY4" size="3" maxlength="3" value="<%= msgRcd.getE01CBCCY4()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01CBCBK4.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCGI4" size="17" maxlength="16" value="<%= msgRcd.getE01CBCGI4()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01CBCBK4.value,document.forms[0].E01CBCCY4.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CBCDE4" size="25" maxlength="20" value="<%= msgRcd.getE01CBCDE4()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCVA5" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCVA5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMI5" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMI5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMA5" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMA5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCPE5" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmPerHelp,this.name)" value="<%= msgRcd.getE01CBCPE5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTP5" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTypHelp,this.name)" value="<%= msgRcd.getE01CBCTP5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCFA5" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCoFactHelp,this.name)" value="<%= msgRcd.getE01CBCFA5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTX5" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTxHelp,this.name)" value="<%= msgRcd.getE01CBCTX5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCBK5" size="2" maxlength="2" value="<%= msgRcd.getE01CBCBK5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCCY5" size="3" maxlength="3" value="<%= msgRcd.getE01CBCCY5()%>"
	              class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01CBCBK5.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCGI5" size="17" maxlength="16" value="<%= msgRcd.getE01CBCGI5()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01CBCBK5.value,document.forms[0].E01CBCCY5.value,'','','')" >
              </div>
            </td>
             <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CBCDE5" size="25" maxlength="20" value="<%= msgRcd.getE01CBCDE5()%>">
              </div>
            </td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCVA6" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCVA6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMI6" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMI6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCMA6" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBCMA6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCPE6" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmPerHelp,this.name)" value="<%= msgRcd.getE01CBCPE6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTP6" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTypHelp,this.name)" value="<%= msgRcd.getE01CBCTP6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCFA6" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCoFactHelp,this.name)" value="<%= msgRcd.getE01CBCFA6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCTX6" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticCsmTxHelp,this.name)" value="<%= msgRcd.getE01CBCTX6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCBK6" size="2" maxlength="2" value="<%= msgRcd.getE01CBCBK6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCCY6" size="3" maxlength="3" value="<%= msgRcd.getE01CBCCY6()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01CBCBK6.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBCGI6" size="17" maxlength="16" value="<%= msgRcd.getE01CBCGI6()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01CBCBK6.value,document.forms[0].E01CBCCY6.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CBCDE6" size="25" maxlength="20" value="<%= msgRcd.getE01CBCDE6()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  	
   	
<br>
	
	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(11);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
