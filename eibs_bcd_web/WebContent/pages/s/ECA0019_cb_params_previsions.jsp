<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA001901Message"  scope="session" />
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

<h3 align="center">Mantenimiento Parametros Corresponsales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="cb_params_previsions.jsp, ECA0019"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0019" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">

<%int row = 0; %>
 
 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01CBPBNK" size="3" maxlength="2" value="<%= msgRcd.getE01CBPBNK() %>" readonly>
				</td>
            	<td nowrap width=10% align="right">Moneda : </td>
            	<td nowrap width=40% align="left">
            		<input type="text" name="E01CBPCCY" size="5" maxlength="4" value="<%= msgRcd.getE01CBPCCY() %>" readonly>
       			</td>
	  		</tr>
 			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="15%" align="right">Dias Maximos Utilizacion </TD>
				<TD nowrap width="35%">
					<input type="text" name="E01CBPDMX" size="5" maxlength="5" value="<%=msgRcd.getE01CBPDMX()%>" /> 
				</TD>
				<TD nowrap width="15%" align="right">% Maximo Utilizacion:</TD>
				<TD nowrap width="35%">
					<input type="text" name="E01CBPPMX" size="9" maxlength="9" value="<%=msgRcd.getE01CBPPMX()%>" /> 
				</TD>
			</tr>
 			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="15%" align="right">Tipo de Plastico <br> Pan Virtual:</TD>
				<TD nowrap width="35%">
					<input type="text" name="E01CBPTBL" size="3" maxlength="2" value="<%=msgRcd.getE01CBPTBL()%>" /> 
					<a href="javascript:GetDescATMCard('E01CBPTBL')">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				</TD>
<%--				<TD nowrap width="15%" align="right">Porcentaje Provision <Br> Castigo</div> </TD>
				<TD nowrap width="35%">
				 <input type="text" name="E01CBPCAS" size="12" maxlength="9" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPCAS()%>">
				</TD>
 --%>			</tr>
   		</table> 
      </td>  
    </tr>
  </table>

 <h4>Informaci&oacute;n Provisiones</h4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center">Hasta Tiempo <br> mora</div>
            </td>
            <td nowrap > 
              <div align="center">Porcentaje <BR> Provision</div>
            </td>
            <td nowrap > 
              <div align="center">Calificacion </div>
            </td>
            <td nowrap > 
              <div align="center">Cuenta Contable <br> Credito</div>
            </td>
            <td nowrap > 
              <div align="center">Cuenta Contable <br> Debito</div>
            </td>
<%--            <td nowrap > 
              <div align="center">Cuenta Contable <br> Recuperacion</div>
            </td>
--%>          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPDY1" size="8" maxlength="5" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPDY1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPPG1" size="12" maxlength="9" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPPG1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPCA1" size="5" maxlength="2" value="<%= msgRcd.getE01CBPCA1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGC1" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGC1()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGD1" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGD1()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
<%--             <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGR1" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGR1()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
--%>          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPDY2" size="8" maxlength="5" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPDY2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPPG2" size="12" maxlength="9" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPPG2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPCA2" size="5" maxlength="2"  value="<%= msgRcd.getE01CBPCA2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGC2" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGC2()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGD2" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGD2()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
<%--            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGR2" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGR2()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
--%>          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPDY3" size="8" maxlength="5" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPDY3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPPG3" size="12" maxlength="9" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPPG3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPCA3" size="5" maxlength="2"  value="<%= msgRcd.getE01CBPCA3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGC3" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGC3()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGD3" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGD3()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
<%--              <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGR3" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGR3()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
--%>          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPDY4" size="8" maxlength="5" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPDY4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPPG4" size="12" maxlength="9" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPPG4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPCA4" size="5" maxlength="2"  value="<%= msgRcd.getE01CBPCA4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGC4" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGC4()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGD4" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGD4()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
<%--              <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGR4" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGR4()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
--%>          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPDY5" size="8" maxlength="5" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPDY5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPPG5" size="12" maxlength="9" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPPG5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPCA5" size="5" maxlength="2"  value="<%= msgRcd.getE01CBPCA5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGC5" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGC5()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGD5" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGD5()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
<%--             <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGR5" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGR5()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
--%>          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPDY6" size="8" maxlength="5" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPDY6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPPG6" size="12" maxlength="9" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPPG6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPCA6" size="5" maxlength="2" value="<%= msgRcd.getE01CBPCA6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGC6" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGC6()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGD6" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGD6()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
<%--             <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGR6" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGR6()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
--%>          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPDY7" size="8" maxlength="5" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPDY7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPPG7" size="12" maxlength="9" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPPG7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPCA7" size="5" maxlength="2" value="<%= msgRcd.getE01CBPCA7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGC7" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGC7()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGD7" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGD7()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
<%--             <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGR7" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGR7()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
--%>          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPDY8" size="8" maxlength="5" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPDY8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPPG8" size="12" maxlength="9" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPPG8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPCA8" size="5" maxlength="2" value="<%= msgRcd.getE01CBPCA8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGC8" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGC8()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGD8" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGD8()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
<%--             <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGR8" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGR8()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
--%>          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPDY9" size="8" maxlength="5" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPDY9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPPG9" size="12" maxlength="9" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01CBPPG9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPCA9" size="5" maxlength="2" value="<%= msgRcd.getE01CBPCA9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGC9" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGC9()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGD9" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGD9()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
<%--        <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01CBPGR9" size="19" maxlength="16" value="<%= msgRcd.getE01CBPGR9()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'<%= msgRcd.getE01CBPBNK() %>','<%= msgRcd.getE01CBPCCY() %>','','','')" >
              </div>
            </td>
--%>           </tr>

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
     		<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
