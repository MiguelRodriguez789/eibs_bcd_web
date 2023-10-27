<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Consulta de Cheques Oficiales para Impresions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

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
<h3 align="center">Seleccion de Cheques de Gerencia a Imprimir<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chk_off_print_inq_sel.jsp,EOF0115"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115P" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="100">
  
  
  <%int row = 0; %>
  <h4>Informaci&oacute;n B&aacute;sica</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELBNK" id="E01SELBNK" size="3" maxlength="2" value="">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%"> 
              <div align="right">Sucursal :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELBRN" id="E01SELBRN" size="5" maxlength="4" value="" onKeypress="enterInteger(event)">
		        <a href="javascript:GetBranch('E01SELBRN',document.forms[0].E01SELBNK.value)"> 
        	      <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" >
        	    </a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%"> 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELCCY" id="E01SELCCY" size="4" maxlength="3" value="">
		        <a href="javascript:GetCurrency('E01SELCCY',document.forms[0].E01SELBNK.value)"> 
        	      <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
               </a>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Formato Cheque :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELFTY" id="E01SELFTY" size="3" maxlength="2" value="">
		        <a href="javascript:GetOffChkPar('E01SELFTY')"> 
        	      <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
               </a>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n Adicional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%"> 
              <div align="right">N&uacute;mero de Cheque :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELNCH" id="E01SELNCH" size="12" maxlength="11"  onKeypress="enterInteger(event)">
              <a href="javascript:GetCheck('E01SELNCH','1','A','P')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">N&uacute;mero de Referencia :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELACC" id="E01SELACC" size="13" maxlength="12"  onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%">
              <div align="right">Beneficiario :</div>
            </td>
            <td nowrap width="35%">
              <input type="text" name="E01SELBNF" id="E01SELBNF" size="60" maxlength="60">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Remitente :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELAPL" id="E01SELAPL" size="60" maxlength="60">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
</body>
</html>
