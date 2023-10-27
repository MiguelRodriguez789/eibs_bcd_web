<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Diferir Cargos por Sobregiro</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="rtDif" class="datapro.eibs.beans.EDD043003Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<H3 align="center">Diferir Cargos por Sobregiro<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_deferr, EDD0430"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0430" >
  <input type=HIDDEN name="SCREEN" value="6">
  <table class="tableinfo">
    <tr> 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cliente:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E03ACMCUN" size="10" maxlength="9" value="<%= rtDif.getE03ACMCUN().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E03CUSNA1" size="45" maxlength="45" value="<%= rtDif.getE03CUSNA1().trim()%>" readonly>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cuenta:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E03ACMACC" size="13" maxlength="12" value="<%= rtDif.getE03ACMACC().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right"><b>Producto:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E03ACMPRO" size="4" maxlength="4" value="<%= rtDif.getE03ACMPRO().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="45%">
              <div align="right">Cuenta Contable de la Relaci&oacute;n :</div>
            </td>
            <td nowrap>
              <INPUT type="text" name="E03INVRBK" id="E03INVRBK" size="3" maxlength="2" value="<%= rtDif.getE03INVRBK().trim()%>">
              <INPUT type="text" name="E03INVRBR" id="E03INVRBR" size="5" maxlength="4" value="<%= rtDif.getE03INVRBR().trim()%>" 
                <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%>
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.getElementById('E03INVRBK').value,'','','','')"
                <% } %>>
              <INPUT type="text" name="E03INVRCY" id="E03INVRCY" size="4" maxlength="3" value="<%= rtDif.getE03INVRCY().trim()%>" 
                <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%> class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E03INVRBK').value,'','','','')"<% } %>>              
              <input type="text" name="E03INVRGL" size="18" maxlength="16" value="<%= rtDif.getE03INVRGL().trim()%>" onKeypress="enterInteger(event)" 
                <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%> class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E03INVRBK').value,document.getElementById('E03INVRCY').value,'','','')"<% } %>>              
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Cuenta Detalle de la Relaci&oacute;n :</div>
            </td>
            <td nowrap > 
              <div align="left">
                <input type="text" name="E03INVRAC" size="13" maxlength="12" value="<%= rtDif.getE03INVRAC().trim()%>" onKeypress="enterInteger(event)"
				<% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%> class="context-menu-help" onmousedown="init(accountHelp,this.name,document.getElementById('E03INVRBK').value,'','','','RT')"<% } %>>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha de Inicio Relaci&oacute;n :</div>
            </td>
            <td nowrap> 
				<eibsinput:date name="rtDif" fn_year="E03INVSDY" fn_month="E03INVSDM" fn_day="E03INVSDD" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha Vencimiento Relaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
				<eibsinput:date name="rtDif" fn_year="E03INVMDY" fn_month="E03INVMDM" fn_day="E03INVMDD" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <% if (userPO.getPurpose().equals("APPROVAL_INQ")) {%>
 <SCRIPT type="text/javascript">
   var j=document.forms[0].elements.length;
    var felem=document.forms[0].elements;
    for(i=0;i< j;i++){
       if (felem[i].tagName!=="select"){
         if (felem[i].type=="text") felem[i].readOnly=true; else felem[i].disabled=true;
       } 
       else { felem[i].disabled=true;}
    }
</SCRIPT>
 
 <% } else { %>    
  <p>&nbsp;</p>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
 <% } %>
</form>
</body>
</html>
