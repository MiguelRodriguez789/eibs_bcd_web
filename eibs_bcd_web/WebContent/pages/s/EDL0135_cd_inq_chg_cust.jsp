<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Consulta de Depositos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnChgCust" class="datapro.eibs.beans.EDL013502Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

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
 
<h3 align="center">Custodia de Dep&oacute;sitos a Plazo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_chg_cust.jsp,EDL0135"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0135" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E02DEACUN" size="10" maxlength="9" value="<%= lnChgCust.getE02DEACUN().trim()%>" readonly>
              </div>
              </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E02CUSNA1" size="45" maxlength="45" value="<%= lnChgCust.getE02CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02DEAACC" size="13" maxlength="12" value="<%= lnChgCust.getE02DEAACC().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02DEACCY" size="4" maxlength="3" value="<%= lnChgCust.getE02DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
                <input type="text" name="E02DEAPRO" size="4" maxlength="4" value="<%= lnChgCust.getE02DEAPRO().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4> 

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap> 
              <%= lnChgCust.getE02DEAOAM().trim()%> 
            </td>            
            <td nowrap> 
              <div align="right">Saldo Principal :</div>
            </td>
            <td nowrap > 
              <%= lnChgCust.getE02BALPRI().trim()%>
            </td>            
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="25%"> 
              <%= Util.formatCustomDate(currUser.getE01DTF(), lnChgCust.getE02DEAODM(), lnChgCust.getE02DEAODD(), lnChgCust.getE02DEAODY()) %>
            </td>
            <td nowrap> 
              <div align="right">Saldo Inter&eacute;s :</div>
            </td>
            <td nowrap > 
              <%= lnChgCust.getE02BALINT().trim()%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap> 
              <%=  Util.formatCustomDate(currUser.getE01DTF(), lnChgCust.getE02DEAMDM(), lnChgCust.getE02DEAMDD(), lnChgCust.getE02DEAMDY()) %> 
            </td>            
            <td nowrap> 
              <div align="right">Saldo Reajuste :</div>
            </td>
            <td nowrap > 
              <%= lnChgCust.getE02BALREA().trim()%>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap>               
               <%= lnChgCust.getE02DEASTS().trim()%>
            </td>          
            <td nowrap> 
              <div align="right">Saldo Total :</div>
            </td>
            <td nowrap > 
              <%= lnChgCust.getE02BALTOT().trim()%>
            </td>           
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Tasa Inter&eacute;s :</div>
            </td>
            <td nowrap>               
               <%= lnChgCust.getE02DEARTE().trim()%>
            </td>          
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap > 
              
            </td>           
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap>               
               <%= lnChgCust.getE02DEABAS().trim()%>
            </td>          
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap > 
              
            </td>           
          </tr>
          <tr id="trdark">
            <td nowrap align="right">Custodia : </td>
            <td nowrap>
               <% if (lnChgCust.getE02DEAFRA().equals("1")) out.print("No Custodia");
                else out.print("Custodia Electronica"); %>
            </td>
            <td nowrap > 
              <div align="right">Forma de Pago :</div>
            </td>
            <td nowrap > 
              <% if(lnChgCust.getE02DEASOF().equals("0")) out.print("Efectivo");
                else if(lnChgCust.getE02DEASOF().equals("1")) out.print("Documento del Banco");
                else if(lnChgCust.getE02DEASOF().equals("2")) out.print("Documento Otros Bancos misma Localidad");
              	else if(lnChgCust.getE02DEASOF().equals("4")) out.print("Documento Otros Bancos Otras Localidades");
                else if(lnChgCust.getE02DEASOF().equals("5")) out.print("Cheque Gerencia");%>               
            </td>
          </tr>     
        </table>
      </td>
    </tr>
  </table>

<h4>Cambio de Custodia</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr  id=trdark>
            <td nowrap align="right">Nueva Custodia : </td>
            <td nowrap>
             <% if (!(lnChgCust.getE02DEAFRA().equals("1"))) out.print("No Custodia");
                else if (lnChgCust.getE02DEAFRA().equals("1")) out.print("Custodia Electronica"); %>
            </td>
                
          
 		  </tr>                     
        </table>
      </td>
    </tr>
  </table>
   
  </form>
</body>
</html>
