<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Sobregiros en Linea</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="rtConc" class="datapro.eibs.beans.EDD043004Message"  scope="session" />
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

<H3 align="center">Sobregiros en Línea</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0430" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="8">
 <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cliente:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E04ACMCUN" id="E04ACMCUN" size="9" maxlength="9" value="<%= rtConc.getE04ACMCUN().trim()%>">
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E04CUSNA1" id="E04CUSNA1" size="45" maxlength="45" value="<%= rtConc.getE04CUSNA1().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cuenta:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E04ACMACC" id="E04ACMACC" size="12" maxlength="12" value="<%= rtConc.getE04ACMACC().trim()%>">
            </td>
            <td nowrap> 
              <div align="right"><b>Producto:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E04ACMPRO" id="E04ACMPRO" size="4" maxlength="4" value="<%= rtConc.getE04ACMPRO().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="45%"> 
              <div align="right">Cuenta de la Relaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E04INVRAC" id="E04INVRAC" size="13" maxlength="12" value="<%= rtConc.getE04INVRAC().trim()%>" onKeyPress="enterInteger(event)" 
                class="context-menu-help" onmousedown="init(accountHelp,this.name,'','','','','RT')">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Transferir en Multiplos de :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E04INVMUL" id="E04INVMUL" size="17" maxlength="15" value="<%= rtConc.getE04INVMUL().trim()%>" onKeypress="enterInteger(event)">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Monto M&iacute;nimo Transferencia :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E04INVMIN" id="E04INVMIN" size="17" maxlength="15" value="<%= rtConc.getE04INVMIN().trim()%>" onKeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Monto M&aacute;ximo de Transferencia :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E04INVMAX" id="E04INVMAX" size="17" maxlength="15" value="<%= rtConc.getE04INVMAX().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Saldo M&iacute;nimo en Cuenta Relacionada :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E04INVBLS" id="E04INVBLS" size="17" maxlength="15" value="<%= rtConc.getE04INVBLS().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha de Inicio Relaci&oacute;n :</div>
            </td>
            <td nowrap> 
				<eibsinput:date name="rtConc" fn_year="E04INVSDY" fn_month="E04INVSDM" fn_day="E04INVSDD" />
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha Vencimiento Relaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
				<eibsinput:date name="rtConc" fn_year="E04INVMDY" fn_month="E04INVMDM" fn_day="E04INVMDD" />
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

          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>

 <% } %>
  </form>
</body>
</html>
