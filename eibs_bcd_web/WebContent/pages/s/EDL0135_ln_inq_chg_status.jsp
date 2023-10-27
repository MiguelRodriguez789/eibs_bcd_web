<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="datapro.eibs.master.Util" %>

<html>
<head>
<title>Consulta de Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnChgSts" class="datapro.eibs.beans.EDL013501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

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
 
<h3 align="center">Condiciones del Pr&eacute;stamo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_inq_chg_status.jsp,EDL0135"> 
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
                <input type="text" name="E01DEACUN" size="10" maxlength="9" value="<%= lnChgSts.getE01DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= lnChgSts.getE01CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="13" maxlength="12" value="<%= lnChgSts.getE01DEAACC().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
                <b><input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= lnChgSts.getE01DEACCY().trim()%>" readonly></b>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= lnChgSts.getE01DEAPRO().trim()%>" readonly>
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
              <%= lnChgSts.getE01DEAOAM().trim()%> 
            </td>            
            <td nowrap> 
              <div align="right">Saldo Principal :</div>
            </td>
            <td nowrap > 
              <%= lnChgSts.getE01BALPRI().trim()%>
            </td>            
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="25%"> 
              <%=Util.formatCustomDate(currUser.getE01DTF(), lnChgSts.getBigDecimalE01DEAODM().intValue(),lnChgSts.getBigDecimalE01DEAODD().intValue(),lnChgSts.getBigDecimalE01DEAODY().intValue())%>                
            </td>
            <td nowrap> 
              <div align="right">Saldo Inter&eacute;s :</div>
            </td>
            <td nowrap > 
              <%= lnChgSts.getE01BALINT().trim()%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap> 
              <%=Util.formatCustomDate(currUser.getE01DTF(), lnChgSts.getBigDecimalE01DEAMDM().intValue(),lnChgSts.getBigDecimalE01DEAMDD().intValue(),lnChgSts.getBigDecimalE01DEAMDY().intValue())%>
            </td>            
            <td nowrap> 
              <div align="right">Saldo Reajuste :</div>
            </td>
            <td nowrap > 
              <%= lnChgSts.getE01BALREA().trim()%>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap>               
              <%= lnChgSts.getE01DEADLC().trim()%> - <%= lnChgSts.getE01DSCDLC().trim()%>
            </td>          
            <td nowrap> 
              <div align="right">Saldo Mora :</div>
            </td>
            <td nowrap > 
              <%= lnChgSts.getE01BALMOR().trim()%>
            </td>           
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Tasa Inter&eacute;s :</div>
            </td>
            <td nowrap>               
               <%= lnChgSts.getE01DEARTE().trim()%>
            </td>          
            <td nowrap> 
              <div align="right">Otros Cargos :</div>
            </td>
            <td nowrap > 
              <%= lnChgSts.getE01BALOTH().trim()%>
            </td>           
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap>               
               <%= lnChgSts.getE01DEABAS().trim()%>
            </td>          
            <td nowrap> 
              <div align="right">Saldo Total :</div>
            </td>
            <td nowrap > 
              <%= lnChgSts.getE01BALTOT().trim()%>
            </td>           
          </tr> 
        </table>
      </td>
    </tr>
  </table>
	
  <% if (lnChgSts.getE01FLGOPE().equals("1")) {%>
  <h4>Cambio de Estado</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr  id=trdark>
            <td nowrap align="right">Nuevo Estado :</td>          
            <td nowrap >  
              <%= lnChgSts.getE01NEWDLC().trim()%> - <%= lnChgSts.getE01NEWDSC().trim()%>              
            </td>
          </tr>                     
        </table>
      </td>
    </tr>
  </table>
  <% } %>

  <% if (lnChgSts.getE01FLGOPE().equals("2")) {%>
  <h4>Gesti&oacute;n Cobranza</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id=trdark>
            <td nowrap align="right">Fecha :</td>
            <td nowrap >     
              <eibsinput:date name="lnChgSts" fn_year="E01DATEPY" fn_month="E01DATEPM" fn_day="E01DATEPD" readonly="true"/>
            </td>
          </tr> 
          <tr id=trclear>
            <td nowrap align="right">Situacion de Cobranza : </td>          
            <td nowrap >                 
              <input type="text" name="E01RESPON" size="5" maxlength="4" value="<%= lnChgSts.getE01RESPON().trim()%>" readonly>
              <input type="text" name="D01RESPON" size="36" maxlength="35" value="<%= lnChgSts.getD01RESPON().trim()%>"readonly>
            </td>
          </tr>                     
        </table>
      </td>
    </tr>
  </table>
  <% } %> 

  <% if (lnChgSts.getE01FLGOPE().equals("3")) {%>
  <h4 style="color:red;font-size:11;">Acci&oacute;n : Suspensi&oacute;n de Devengos</h4>
  <%int row = 0; %>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Proceso :</div>
            </td>
            <td width="35%"> 
              <select name="E01FLGIBS" disabled="disabled">
                <option value="Y" <% if (lnChgSts.getE01FLGIBS().equals("Y")) out.print("selected");  %>>Automatico</option>
                <option value=" " <% if (!lnChgSts.getE01FLGIBS().equals("Y")) out.print("selected"); %>>Administrativo</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Comentarios :</td>
            <td nowrap width="35%" align="left">
              <textarea name="E01REMARK" cols="64" rows="4" readonly><%=Util.formatCell(lnChgSts.getE01REMARK().trim())%></textarea>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>

  <% if (lnChgSts.getE01FLGOPE().equals("5")) {%>
  <h4 style="color:red;font-size:11;">Acci&oacute;n : Levantar Suspensi&oacute;n de Devengos</h4>
  <%int row = 0; %>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Comentarios :</td>
            <td nowrap width="35%" align="left">
              <textarea name="E01REMARK" cols="64" rows="4" readonly><%=Util.formatCell(lnChgSts.getE01REMARK().trim())%></textarea>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>
	
  <% if (lnChgSts.getE01FLGOPE().equals("4")) {%>
  <h4 style="color:red;font-size:11;">Acci&oacute;n : Aceleraci&oacute;n</h4>
  <% } %>
	
   <% if (lnChgSts.getE01FLGOPE().equals("6")) {%>
  <h4 style="color:red;font-size:11;">Acci&oacute;n : Cartera Sustitutiva</h4>
  <%int row = 0; %>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Proceso :</div>
            </td>
            <td width="35%"> 
              <select name="E01FLGIBS" disabled="disabled">
                <option value="S" <% if (lnChgSts.getE01FLGIBS().equals("S")) out.print("selected");  %>>Marcar</option>
                <option value=" " <% if (!lnChgSts.getE01FLGIBS().equals("S")) out.print("selected"); %>>Desmarcar</option>
              </select>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <% } %>	
  <% if (lnChgSts.getE01FLGOPE().equals("7")) {%>
  <h4>Acci&oacute;n : Marcacion de Seguros</h4>
  <%int row = 0; %>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Proceso :</div>
            </td>
            <td width="35%"> 
              <select name="E01FLGIBS" disabled="disabled">
                <option value="S" <% if (lnChgSts.getE01FLGIBS().equals("1")) out.print("selected");  %>>Marcado</option>
                <option value=" " <% if (!lnChgSts.getE01FLGIBS().equals("1")) out.print("selected"); %>>Desmarcado</option>
              </select>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <% } %>
  <% if (lnChgSts.getE01FLGOPE().equals("8")) {%>
  <h4>Acci&oacute;n : Periodo Muerto de Interes</h4>
  <%int row = 0; %>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Proceso :</div>
            </td>
            <td width="35%"> 
              <select name="E01FLGIBS" disabled="disabled">
                <option value="S" <% if (lnChgSts.getE01FLGIBS().equals("S")) out.print("selected");  %>>Marcado</option>
                <option value=" " <% if (!lnChgSts.getE01FLGIBS().equals("S")) out.print("selected"); %>>Desmarcado</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           <td width="15%" > 
              <div align="right" >Fecha :</div>
            </td>
            <td width="35%">              
              <div >
                <eibsinput:date name="lnChgSts" fn_year="E01DATEPY" fn_month="E01DATEPM" fn_day="E01DATEPD" readonly="true"/>
              </div>
            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>
  <% } %>
  <% if (lnChgSts.getE01FLGOPE().equals("9")) {%>
  <h4>Acci&oacute;n : Monitoreo</h4>
  <%int row = 0; %>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Proceso :</div>
            </td>
            <td width="35%"> 
              <select name="E01FLGIBS" disabled="disabled">
                <option value="R" <% if (!lnChgSts.getE01FLGIBS().equals("M")) out.print("selected"); %>>Reestructuracion</option>
                <option value="M" <% if (lnChgSts.getE01FLGIBS().equals("M"))  out.print("selected"); %>>Modificacion</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           <td width="15%" > 
              <div align="right">Monitoreo :</div>
            </td>
            <td width="35%">              
              <select name="E01NEWDLC" disabled="disabled">
                <option value="1" <% if (lnChgSts.getE01NEWDLC().equals("1"))  out.print("selected"); %>>Habilitar</option>
                <option value="0" <% if (!lnChgSts.getE01NEWDLC().equals("1")) out.print("selected"); %>>Inhabilitar</option>
              </select>
            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>
  <% } %>
  
  
</form>
</body>
</html>
