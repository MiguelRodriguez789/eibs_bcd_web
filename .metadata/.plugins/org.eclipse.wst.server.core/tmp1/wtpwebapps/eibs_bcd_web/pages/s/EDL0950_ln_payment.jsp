<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Pago de Prestámos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="lnCancel" class="datapro.eibs.beans.EDL095001Message" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript"> 
 function checkNuPay(){
   var chk = true;
   var flg = ""; var val = "";
   if (isValidObject(document.forms[0].CE01PAGFLG[3])) {
     if (document.forms[0].CE01PAGFLG[3].checked) {
       val = trim(document.forms[0].E01PAGFLG1.value);
       if (val.length == 1) val="0" + val;
       document.forms[0].E01PAGFLG1.value = val;
     }
   }  
   if (isValidObject(document.forms[0].E01PAGFLG)) {
     flg = document.forms[0].E01PAGFLG.value;
     var mm = 0; var dd = 0; var yy = 0; var flg1 = 0;
     if (flg == "PC") {
       if ( isValidObject(document.forms[0].E01PAGVDM) && isValidObject(document.forms[0].E01PAGVDD) && isValidObject(document.forms[0].E01PAGVDY) ) {
         mm = parseInt(getElement("E01PAGVDM").value);
         dd = parseInt(getElement("E01PAGVDD").value);
         yy = parseInt(getElement("E01PAGVDY").value);
         if (mm+dd+yy != 0) {
           if (isValidObject(document.forms[0].E01PAGFLG1)) {
             flg1 = parseInt(getElement("E01PAGFLG1").value);
             if (flg1 != 1) {
               alert('Para retrofecha solo aplica una cuota');
               chk = false;
             }
           }
         }
       }
     }
   }  
   return chk;
 }
 function checkVal(val){  
   // TP Pago Parcial con Abono Capital
   if (isValidObject(getElement('selParcialRow1'))) {
     selParcialRow1.style.display = (val=="TP") ?  "" : "none";
   }
   if (isValidObject(getElement('txtE01PAGDIS'))) {
     txtE01PAGDIS.style.display = (val=="TP") ?  "" : "none";
   }
   if (isValidObject(getElement('selParcialRow2'))) {
     selParcialRow2.style.display = (val=="TP") ?  "" : "none";
   }
   // PC Numero de Cuotas
   if (isValidObject(getElement('txtE01PAGFLG1'))) {
     txtE01PAGFLG1.style.display = (val=="PC") ?  "" : "none";
   }
   if (isValidObject(getElement('selFValorRow1'))) {
     selFValorRow1.style.display = (val=="PC")||(val=="DS")||(val=="TO") ?  "" : "none";
   }
   // DS Monto a Aplicar por Cuota
   if (isValidObject(getElement('txtE01PAGTOT'))) {
     txtE01PAGTOT.style.display = (val=="DS") ?  "" : "none";
   }
   document.forms[0].E01PAGFLG.value = val;
   setRowColors("mainTable");
 }
 function setRowColors(table){
   $('#'+table+ ' tr:visible:odd').removeClass().addClass('trclear');
   $('#'+table+ ' tr:visible:even').removeClass().addClass('trdark');
 }  
</SCRIPT>
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

<% if (userPO.getOption().equals("PP_FV")) { %>
<H3 align="center">Prepago Retrofecha al: <%= lnCancel.getE01PAGVDD().trim()+'/'+lnCancel.getE01PAGVDM().trim()+'/'+lnCancel.getE01PAGVDY().trim()%> 
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_payment.jsp, EDL0950"> 
</H3>
<%} else if (userPO.getOption().equals("PP")) { %>
<H3 align="center">Prepago de Pr&eacute;stamos 
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_payment.jsp, EDL0950">
</H3>
<%} else if (userPO.getOption().equals("CU")) { %>
<H3 align="center">Pago de Utilizaciones 
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_payment.jsp, EDL0950">
</H3>
<%} else { %>
<H3 align="center">Pago de Pr&eacute;stamos 
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_payment.jsp, EDL0950"> 
</H3>
<% } %>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0950" onsubmit="return(checkNuPay())">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  <input type="hidden" name="E01PAGFLG" value="<%= lnCancel.getE01PAGFLG()%>">
  <input type="hidden" name="H01FLGWK3">
  
  <% if (userPO.getOption().equals("PP_FV")) { %>
  <INPUT TYPE=HIDDEN NAME="E01PAGVDD" VALUE="<%=lnCancel.getE01PAGVDD().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01PAGVDM" VALUE="<%=lnCancel.getE01PAGVDM().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01PAGVDY" VALUE="<%=lnCancel.getE01PAGVDY().trim() %>">
  <INPUT TYPE=HIDDEN NAME="H01FLGWK1" VALUE="<%=lnCancel.getH01FLGWK1().trim() %>">
  <%} %>  
  
  <% int row = 0;%>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="10%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="left">
                <input type="text" size="10" maxlength="9" name="E01DEACUN" value="<%= lnCancel.getE01DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" size="45" maxlength="45" name="E01CUSNA1" value="<%= lnCancel.getE01CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"></div>
            </td>
                 </tr>
          <tr id="trdark"> 
            <td nowrap width="10%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="left">
                <input type="text" size="13" maxlength="12" name="E01DEAACC" value="<%= lnCancel.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="14%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="40%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= lnCancel.getE01DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="12%"> 
              <div align="left"><b>
                <input type="text" size="4" maxlength="4" name="E01DEAPRO" value="<%= lnCancel.getE01DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <br>
  <table class=tbenter>
    <tr > 
      <td nowrap> 
        <h4>Saldos</h4>
      </td>
      <td nowrap align=right> 
        <b><font color="#ff6600"><%= lnCancel.getE01REMARK().trim()%></font></b>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <%
             double venAho = 0; double preAho = 0; double prxAho = 0; double salAho = 0;
             double venTot = 0; double preTot = 0; double prxTot = 0; double salTot = 0;
             venTot =  lnCancel.getBigDecimalE01VENTOT().doubleValue();
             preTot += lnCancel.getBigDecimalE01VENPRI().doubleValue();
             preTot += lnCancel.getBigDecimalE01SALREA().doubleValue();
             preTot += lnCancel.getBigDecimalE01SALINT().doubleValue();
             preTot += lnCancel.getBigDecimalE01SALMOR().doubleValue();
             preTot += lnCancel.getBigDecimalE01SALREX().doubleValue();
             preTot += lnCancel.getBigDecimalE01SALOTH().doubleValue();
             preTot += lnCancel.getBigDecimalE01SALIMP().doubleValue();
             preTot += lnCancel.getBigDecimalE01SALCOM().doubleValue();
             preTot += lnCancel.getBigDecimalE01SALDED().doubleValue();
             preTot += lnCancel.getBigDecimalE01SALCBZ().doubleValue();
             preTot += lnCancel.getBigDecimalE01SALIVA().doubleValue();
             prxTot =  lnCancel.getBigDecimalE01PRXTOT().doubleValue();
             salTot =  lnCancel.getBigDecimalE01SALTOT().doubleValue();
             // Ahorro Milagroso
             if (lnCancel.getE01FLGFL9().equals("Y")) {
               venAho = venTot;
               preAho = preTot; 
               prxAho = prxTot; 
               salAho = salTot;
               venTot = venTot - lnCancel.getBigDecimalE01VENAHO().doubleValue();
               preTot = preTot - lnCancel.getBigDecimalE01SALAHO().doubleValue();
               prxTot = prxTot - lnCancel.getBigDecimalE01PRXAHO().doubleValue();
               salTot = salTot - lnCancel.getBigDecimalE01SALAHO().doubleValue();
             } 
          %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right"><b>Concepto</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b>Vencido</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b>Prepago</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b>Pr&oacute;ximo a Vencer</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b>Saldo Total</b></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">
              <%= Util.formatCustomDate(currUser.getE01DTF(), lnCancel.getBigDecimalE01VENDTM().intValue(), 
                                                              lnCancel.getBigDecimalE01VENDTD().intValue(),
                                                              lnCancel.getBigDecimalE01VENDTY().intValue())%>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">
              <%= Util.formatCustomDate(currUser.getE01DTF(), lnCancel.getBigDecimalE01PRXDTM().intValue(), 
                                                              lnCancel.getBigDecimalE01PRXDTD().intValue(),
                                                              lnCancel.getBigDecimalE01PRXDTY().intValue())%>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">
              <%= Util.formatCustomDate(currUser.getE01DTF(), lnCancel.getBigDecimalE01PRXDTM().intValue(), 
                                                              lnCancel.getBigDecimalE01PRXDTD().intValue(),
                                                              lnCancel.getBigDecimalE01PRXDTY().intValue())%>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">
              <%= Util.formatCustomDate(currUser.getE01DTF(), lnCancel.getBigDecimalE01SALDTM().intValue(), 
                                                              lnCancel.getBigDecimalE01SALDTD().intValue(),
                                                              lnCancel.getBigDecimalE01SALDTY().intValue())%>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%" height="23"> 
              <div align="right">Principal :</div>
            </td>
            <td nowrap width="20%" height="23"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENPRI().trim())%></div>
            </td>
            <td nowrap width="20%" height="23"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENPRI().trim())%></div>
            </td>
            <td nowrap width="20%" height="23"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXPRI().trim())%></div>
            </td>
            <td nowrap width="20%" height="23"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALPRI().trim())%></div>
            </td>
          </tr>
          <%if(lnCancel.getH01FLGWK3().equals("R")){%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%" height="19"> 
              <div align="right">Reajuste :</div>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENREA().trim())%></div>
            </td>
            <td nowrap height="19" width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALREA().trim())%></div>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXREA().trim())%></div>
            </td>
            <td nowrap height="19" width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALREA().trim())%></div>
            </td>
          </tr>
          <%}%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right">Intereses :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENINT().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALINT().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXINT().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALINT().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right">Mora :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENMOR().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALMOR().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXMOR().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALMOR().trim())%></div>
            </td>
          </tr>
          <%if(lnCancel.getH01FLGWK3().equals("R")){%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%" height="19"> 
              <div align="right">Reajuste Mora :</div>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENREX().trim())%></div>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALREX().trim())%></div>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXREX().trim())%></div>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALREX().trim())%></div>
            </td>
          </tr>
          <%}%>
          <%if(currUser.getE01INT().equals("07")){%> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right">F.E.C.I. :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENOTH().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALOTH().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXOTH().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALOTH().trim())%></div>
            </td>
          </tr>
          <%}%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right">Impuesto :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENIMP().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALIMP().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXIMP().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALIMP().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right">Comisiones :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENCOM().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALCOM().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXCOM().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALCOM().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right">Deducciones :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENDED().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALDED().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXDED().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALDED().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right">Cobranzas :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENCBZ().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALCBZ().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXCBZ().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALCBZ().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right">I.V.A. :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENIVA().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALIVA().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXIVA().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALIVA().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <%if(lnCancel.getE01FLGFL9().equals("Y")){%> 
              <div align="right"><b>Subtotal :</b></div>
              <%} else {%> 
              <div align="right"><b>Total :</b></div>
              <%}%> 
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b><%=datapro.eibs.master.Util.formatCCY(venTot)%></b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b><%=datapro.eibs.master.Util.formatCCY(preTot)%></b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b><%=datapro.eibs.master.Util.formatCCY(prxTot)%></b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b><%=datapro.eibs.master.Util.formatCCY(salTot)%></b></div>
            </td>
          </tr>
          <%if(lnCancel.getE01FLGFL9().equals("Y")){%> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right">Ahorro Milagroso :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01VENAHO().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALAHO().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01PRXAHO().trim())%></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE01SALAHO().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%"> 
              <div align="right"><b>Total :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b><%=datapro.eibs.master.Util.formatCCY(venAho)%></b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b><%=datapro.eibs.master.Util.formatCCY(preAho)%></b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b><%=datapro.eibs.master.Util.formatCCY(prxAho)%></b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b><%=datapro.eibs.master.Util.formatCCY(salAho)%></b></div>
            </td>
          </tr>
          <% }  %>
        </table>
      </td>
    </tr>
  </table>

  <h4>Forma de Pago</h4>
  <% if (userPO.getOption().equals("PP") || userPO.getOption().equals("PP_FV")) { %>
  <table class="tableinfo">
      <td nowrap> 
    <tr > 
        <table id="mainTable" cellspacing=0 cellpadding=2 width="100%" border="0">
          <% if (userPO.getOption().equals("PP_FV")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%"> 
              <div align="right">                
                <input type="radio" name="CE01PAGFLG" value="TO" <%if(lnCancel.getE01PAGFLG().equals("TO")) out.print("checked");%> onclick="checkVal(this.value)">
              </div>
            </td>
            <td nowrap width="60%">Pago Total</td>
          </tr>
          <% } %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%"> 
              <div align="right">
                <input type="radio" name="CE01PAGFLG" value="TP" <%if(lnCancel.getE01PAGFLG().equals("TP")) out.print("checked");%> onclick="checkVal(this.value)">
              </div>
            </td>
            <td nowrap width="60%">  
              <div style="float: left;" >Pago Parcial con Abono Capital&nbsp;&nbsp;</div>
              <div id="txtE01PAGDIS" style="float: left;" >
                <eibsinput:text property="E01PAGDIS" name="lnCancel" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  />
              </div>
            </td>
          </tr>
          <%//if(!userPO.getOption().equals("PP_FV")) { %>          
          <tr  id="selParcialRow1" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %>" <%if(!lnCancel.getE01PAGFLG().equals("TP")) out.print("style=\"display:none\"");%><%row++;%>>  
            <td nowrap width="35%"></td>
            <td nowrap width="65%"> 
              Aplicacion :      
              <INPUT type="radio" name="E01FPGFLG" value="R" <% if (lnCancel.getE01FPGFLG().equals("R")) out.print("checked");%>>Fecha Proceso 
              <INPUT type="radio" name="E01FPGFLG" value="N" <% if (lnCancel.getE01FPGFLG().equals("N")) out.print("checked");%>>Proxima Fecha Pago
              <!-- 
              <INPUT type="radio" name="E01FPGFLG" value="C" <% if (lnCancel.getE01FPGFLG().equals("C")) out.print("checked");%>>Solo Abono Capital
              -->
            </td>
          </tr>
          <%// } %>      
          <tr  id="selParcialRow2" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %>" <%if(!lnCancel.getE01PAGFLG().equals("TP")) out.print("style=\"display:none\"");%><%row++;%>>  
            <td nowrap width="35%"></td>
            <td nowrap width="65%"> 
              Accion :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
              <INPUT type="radio" name="E01DEASEL" value="1" <% if (lnCancel.getE01DEASEL().equals("1")) out.print("checked");%>>Reducir Valor Cuota
              <INPUT type="radio" name="E01DEASEL" value="2" <% if (lnCancel.getE01DEASEL().equals("2")) out.print("checked");%>>Reducir Plazo  
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } else { %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table id="mainTable" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%"> 
              <div align="right">                
                <input type="radio" name="CE01PAGFLG" value="MA"
                <%if(!(lnCancel.getE01PAGFLG().equals("TO") || lnCancel.getE01PAGFLG().equals("TP")
                || lnCancel.getE01PAGFLG().equals("CV")
                || lnCancel.getE01PAGFLG().equals("PC")
                || lnCancel.getE01PAGFLG().equals("DS"))) out.print("checked");%> onclick="checkVal(this.value)">
              </div>
            </td>
            <td nowrap width="60%">Distribución Manual</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%"> 
              <div align="right">                
                <input type="radio" name="CE01PAGFLG" value="TO" <%if(lnCancel.getE01PAGFLG().equals("TO")) out.print("checked");%> onclick="checkVal(this.value)">
              </div>
            </td>
            <td nowrap width="60%">Pago Total</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%"> 
              <div align="right">
                <input type="radio" name="CE01PAGFLG" value="TP" <%if(lnCancel.getE01PAGFLG().equals("TP")) out.print("checked");%> onclick="checkVal(this.value)">
              </div>
            </td>
            <td nowrap width="60%">
              <div style="float: left;" >Pago Parcial con Abono Capital&nbsp;&nbsp;</div>
              <div id="txtE01PAGDIS" style="float: left;" >
                <eibsinput:text property="E01PAGDIS" name="lnCancel" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  />
              </div>
            </td>
          </tr>
          <tr  id="selParcialRow1" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %>" <%if(!lnCancel.getE01PAGFLG().equals("TP")) out.print("style=\"display:none\"");%><%row++;%>>  
            <td nowrap width="35%"></td>
            <td nowrap width="65%"> 
              Aplicaci&oacute;n :      
              <INPUT type="radio" name="E01FPGFLG" value="R" <% if (lnCancel.getE01FPGFLG().equals("R")) out.print("checked");%>>Fecha Proceso
              <INPUT type="radio" name="E01FPGFLG" value="N" <% if (lnCancel.getE01FPGFLG().equals("N")) out.print("checked");%>>Proxima Fecha Pago
              <!-- 
              <INPUT type="radio" name="E01FPGFLG" value="C" <% if (lnCancel.getE01FPGFLG().equals("C")) out.print("checked");%>>Solo Abono Capital
              -->
            </td>
          </tr>
          <tr  id="selParcialRow2" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %>" <%if(!lnCancel.getE01PAGFLG().equals("TP")) out.print("style=\"display:none\"");%><%row++;%>>  
            <td nowrap width="35%"></td>
            <td nowrap width="65%"> 
              Acci&oacute;n :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
              <INPUT type="radio" name="E01DEASEL" value="1" <% if (lnCancel.getE01DEASEL().equals("1")) out.print("checked");%>>Reducir Valor Cuota
              <INPUT type="radio" name="E01DEASEL" value="2" <% if (lnCancel.getE01DEASEL().equals("2")) out.print("checked");%>>Reducir Plazo  
            </td>
          </tr>             
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%"> 
              <div align="right">
                <input type="radio" name="CE01PAGFLG" value="CV" <%if(lnCancel.getE01PAGFLG().equals("CV")) out.print("checked");%> onclick="checkVal(this.value)">
              </div>
            </td>
            <td nowrap width="60%">Las Cuotas Vencidas</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%"> 
              <div align="right"> 
                <input type="radio" name="CE01PAGFLG" value="PC" <%if(lnCancel.getE01PAGFLG().equals("PC")) out.print("checked");%> onclick="checkVal(this.value)">
              </div>
            </td>
            <td nowrap width="60%">
              <div style="float: left;" >N&uacute;mero de Cuotas&nbsp;&nbsp;</div>
              <div id="txtE01PAGFLG1" style="float: left;" >
                <input type="text" name="E01PAGFLG1" size="3" maxlength="2" onKeypress="enterInteger(event)">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%"> 
              <div align="right">
                <input type="radio" name="CE01PAGFLG" value="DS" <%if(lnCancel.getE01PAGFLG().equals("DS")) out.print("checked");%> onclick="checkVal(this.value)">
              </div>
            </td>
            <td nowrap width="60%"> 
              <div style="float: left;" >Monto a Aplicar (Valor a Pagar) por Cuota&nbsp;&nbsp;</div>
              <div id="txtE01PAGTOT" style="float: left;" >
                <input type="text" name="E01PAGTOT" size="20" maxlength="22" value="<%= lnCancel.getE01PAGDIS().trim()%>" onKeypress="enterDecimal(event, 2)" onblur=" this.value = formatCCY(this.value);" class="TXTRIGHT">
              </div>
            </td>
          </tr>
          <tr id="selFValorRow1" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %>" <%if(!lnCancel.getE01PAGFLG().equals("PC")&&!lnCancel.getE01PAGFLG().equals("DS")) out.print("style=\"display:none\"");%><%row++;%>>    
            <td nowrap width="40%"> 
              <div align="right">Fecha Valor :</div>
            </td>
            <td nowrap width="60%">  
              <eibsinput:date name="lnCancel"  fn_month="E01PAGVDM" fn_day="E01PAGVDD" fn_year="E01PAGVDY" /> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>

  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>

</form>
</body>

<script type="text/javascript">
  checkVal(getElement('CE01PAGFLG').value);
</script>

</html>
