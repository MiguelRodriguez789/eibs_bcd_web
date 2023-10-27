<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Documentación</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "lnCancelDet" class= "datapro.eibs.beans.EDL095002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

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
<h3 align="center">Pre- Liquidaci&oacute;n de la Cuota</h3>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_payment_print.jsp,EDL0950"> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="38">
  </p>
  
  <table width="100%">
    <tr> 
      <td colspan="2"> 
        <div align="center">No v&aacute;lido como comprobante de Pago</div>
      </td>
    </tr>
  </table>
  <br>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Numero de Credito :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><%= lnCancelDet.getE02DEAACC().trim()%></div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Producto :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><%= lnCancelDet.getE02DEAPRO().trim()%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Numero de Cliente :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><%= lnCancelDet.getE02DEACUN().trim()%></div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><%= lnCancelDet.getE02CUSNA1().trim()%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><%= Util.fcolorCCY(lnCancelDet.getE02DEAOAM().trim())%></div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Total de la Deuda :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><%= Util.fcolorCCY(lnCancelDet.getE02BEFTOT().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
															  lnCancelDet.getBigDecimalE02DEAODM().intValue(),
															  lnCancelDet.getBigDecimalE02DEAODD().intValue(),
															  lnCancelDet.getBigDecimalE02DEAODY().intValue())%>
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
															  lnCancelDet.getBigDecimalE02DEAMDM().intValue(),
															  lnCancelDet.getBigDecimalE02DEAMDD().intValue(),
															  lnCancelDet.getBigDecimalE02DEAMDY().intValue())%>
              
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Tasa de Inter&eacute;s :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><%= lnCancelDet.getE02DEARTE().trim()%></div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><%= lnCancelDet.getE02DEATRM().trim()%> 
                - <% if(lnCancelDet.getE02DEATRC().equals("Y")) out.print("Años");
              				else if(lnCancelDet.getE02DEATRC().equals("M")) out.print("Meses");
							else out.print("Dias");%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<%if(lnCancelDet.getE02PAGFLG().equals("TP") || lnCancelDet.getE02OFLPAG().equals("TP")){%>
  <p>&nbsp;</p>
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Nuevo Valor de Cuota :</div>
            </td>
            <td nowrap width="60%" > 
              <div align="left"></div>
              <%= lnCancelDet.getE02NEWCUO().trim()%> 
          </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Nuevo N&uacute;mero de Cuotas :</div>
            </td>
            <td nowrap width="60%" > 
              <div align="left"></div>
              <%= lnCancelDet.getE02NEWPNU().trim()%>
          </td>
          </tr>          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%" > 
             <div align="right">Nuevo Vencimiento :</div>
            </td>
            <td nowrap width="60%" > 
              <div align="left"></div>
 			  <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
															  lnCancelDet.getBigDecimalE02NEWMDM().intValue(),
															  lnCancelDet.getBigDecimalE02NEWMDD().intValue(),
															  lnCancelDet.getBigDecimalE02NEWMDY().intValue())%>
              
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <% } %> 
    <p>&nbsp;</p>
  <table cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
        <td nowrap width="20%"><div align="right"><b>Concepto</b></div></td>
        <td nowrap width="20%"><div align="right"><b>Saldo Anterior</b></div></td>
        <td nowrap width="20%"><div align="right"><b>Transacci&oacute;n</b></div></td>
        <td nowrap width="20%"><div align="right"><b>Nuevo Saldo</b></div></td>
        <td nowrap width="20%"> <div align="center"></div></td>
    </tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
      <td nowrap width="20%" height="23"> 
        <div align="right">Principal :</div>
      </td>
      <td nowrap width="20%" height="23"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFPRI().trim())%></div>
      </td>
      <td nowrap width="20%" height="23"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNPRI().trim())%></div>
      </td>
      <td nowrap height="23" width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTPRI().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    <%if(lnCancelDet.getH02FLGWK3().equals("R")){%> 
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <td nowrap width="20%" height="19"> 
        <div align="right">Reajuste :</div>
      </td>
      <td nowrap width="20%" height="19"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFREA().trim())%></div>
      </td>
      <td nowrap width="20%" height="19"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNREA().trim())%></div>
      </td>
      <td nowrap height="19" width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTREA().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    <% } %>
    
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
      <td nowrap width="20%"> 
        <div align="right">Intereses :</div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFINT().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNINT().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTINT().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
      <td nowrap width="20%"> 
        <div align="right">Mora :</div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFMOR().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNMOR().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTMOR().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    
    <%if(lnCancelDet.getH02FLGWK3().equals("R")){%> 
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <td nowrap width="20%" height="19"> 
        <div align="right">Reajuste Mora:</div>
      </td>
      <td nowrap width="20%" height="19"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFREX().trim())%></div>
      </td>
      <td nowrap width="20%" height="19"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNREX().trim())%></div>
      </td>
      <td nowrap height="19" width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTREX().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    <% } %>
  
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <td nowrap width="20%"> 
        <div align="right">Impuesto :</div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFIMP().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNIMP().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTIMP().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <td nowrap width="20%"> 
        <div align="right">Comisiones :</div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFCOM().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNCOM().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTCOM().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <td nowrap width="20%"> 
        <div align="right">Deducciones :</div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFDED().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNDED().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTDED().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <td nowrap width="20%"> 
        <div align="right">Cobranzas :</div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFCBZ().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNCBZ().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTCBZ().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
      <td nowrap width="20%"> 
        <div align="right">I.V.A. :</div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFIVA().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNIVA().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTIVA().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    <%if(lnCancelDet.getE02FLGFL9().equals("Y")){%> 
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
      <td nowrap width="20%"> 
        <div align="right">Cuota Milagrosa :</div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFAHO().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNAHO().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTAHO().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
    <% } %>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
      <td nowrap width="20%"> 
        <div align="right">Total :</div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFTOT().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNTOT().trim())%></div>
      </td>
      <td nowrap width="20%"> 
        <div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTTOT().trim())%></div>
      </td>
      <td nowrap  width="20%"> 
      </td>
    </tr>
  </table>

  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
        <% if (!lnCancelDet.getE02PAGTOT().equals("0.00")) { %>
        <%   if (lnCancelDet.getE02SELPPM().equals("M")){ %>
        <%     for (int i=1; i<10; i++) { %> 
        <%       if (!lnCancelDet.getFieldString("E02PAGAM"+i).equals("0.00")){ %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Cuenta D&eacute;bito :</div>
            </td>
            <td nowrap width="60%" > 
              <div align="left"></div>
              <%= lnCancelDet.getFieldString("E02PAGBK"+i).trim()%> <%= lnCancelDet.getFieldString("E02PAGBR"+i).trim()%> 
              <%= lnCancelDet.getFieldString("E02PAGCY"+i).trim()%> <%= lnCancelDet.getFieldString("E02PAGGL"+i).trim()%> 
              <%= lnCancelDet.getFieldString("E02PAGAC"+i).trim()%> <%= lnCancelDet.getFieldString("E02PAGAM"+i).trim()%>
            </td>
          </tr>
        <%       } %>
        <%     } %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%" >&nbsp;</td>
            <td nowrap width="60%" >&nbsp;</td>
          </tr>
        <%   } else { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Cuenta D&eacute;bito :</div>
            </td>
            <td nowrap width="60%" > 
              <div align="left"></div>
              <%= lnCancelDet.getE02PAGOBK().trim()%> <%= lnCancelDet.getE02PAGOBR().trim()%> 
              <%= lnCancelDet.getE02PAGOCY().trim()%> <%= lnCancelDet.getE02PAGOGL().trim()%> 
              <%= lnCancelDet.getE02PAGOAC().trim()%> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%" >&nbsp;</td>
            <td nowrap width="60%" >&nbsp;</td>
          </tr>
        <%   } %>
        <% } %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%" > 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="60%" > 
              <div align="left"></div>
              <%= lnCancelDet.getE02DEANR1().trim()%></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="60%" > 
              <div align="left"><%= lnCancelDet.getE02DEANR2().trim()%></div>
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Motivo de Cancelación :</div>
            </td>
            <td nowrap width="60%" > 
              <div align="left"><%=lnCancelDet.getE02DEASUC().trim() + "-" + lnCancelDet.getD02DEASUC().trim()%></div>
            </td>
          </tr>    
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Tipo de Pago :</div>
            </td>
            <td nowrap width="60%" > 
              <div align="left"><%=lnCancelDet.getE02DEANID().trim() + "-" + lnCancelDet.getD02DEANID().trim()%></div>
            </td>
          </tr>         
        </table>
      </td>
    </tr>
  </table>
  
  <div align="center"> </div>
  
</form>
</body>
</html>
