<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Consulta de Documentos Varios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "checkSel" class= "datapro.eibs.beans.ETL051001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


</head>
<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<h3 align="center">Consulta de Documentos Varios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dv_inq_sel.jsp,ETL0510"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSETL0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <h4>Informaci&oacute;n B&aacute;sica</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Tipo de Documento :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELDTY" size="2" maxlength="1" value="<%= checkSel.getE01SELDTY() %>">
              <a href="javascript:GetCode('E01SELDTY','STATIC_dv_typ.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Estado del Documento :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELSCH" size="2" maxlength="1" value="<%= checkSel.getE01SELSCH() %>">
              <a href="javascript:GetCode('E01SELSCH','STATIC_dv_stat.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELBNK" size="3" maxlength="2" value="<%= checkSel.getE01SELBNK() %>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Sucursal :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELBRN" size="5" maxlength="4" value="<%= checkSel.getE01SELBRN() %>"  onKeypress="enterInteger(event)">
		        <a href="javascript:GetBranch('E01SELBRN',document.forms[0].E01SELBNK.value)"> 
        	      <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" >
        	    </a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELCCY" size="4" maxlength="3" value="<%= checkSel.getE01SELCCY() %>">
		        <a href="javascript:GetCurrency('E01SELCCY',document.forms[0].E01SELBNK.value)"> 
        	      <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
               </a>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Formato Documento :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELFTY" size="3" maxlength="2" value="<%= checkSel.getE01SELFTY() %>">
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
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">N&uacute;mero de Documento :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELNCH" size="12" maxlength="11"  onKeypress="enterInteger(event)">
              <a href="javascript:GetCheck('E01SELNCH','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0" ></a> 
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="20%">
              <div align="right">N&uacute;mero de Referencia :</div>
            </td>
            <td nowrap width="35%">
              <input type="text" name="E01SELACC" size="13" maxlength="12"  onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%">
              <div align="right">Beneficiario :</div>
            </td>
            <td nowrap width="35%">
              <input type="text" name="E01SELBNF" size="60" maxlength="60">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Tomador :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELAPL" size="60" maxlength="60">
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
