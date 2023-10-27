<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT Language="javascript">
function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
</SCRIPT>
</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>

<H3 align="center">C&oacute;digos de Referencia del Sistema - C&oacute;digos de 
  Procedencia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_transactions_codes_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right">Clasificaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" readonly size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">C&oacute;digo :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Descripcion Ampliada :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOEML" size="62" maxlength="60" value="<%= refCodes.getE02CNOEML().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <select name="E02CNOF01">
                   <OPTION value="1" <% if (refCodes.getE02CNOF01().equals("1")) out.print("selected"); %>>Ventas</OPTION>                   
                   <OPTION value="2" <% if (refCodes.getE02CNOF01().equals("2")) out.print("selected"); %>>Dependencias</OPTION>
                   <OPTION value="3" <% if (refCodes.getE02CNOF01().equals("3")) out.print("selected"); %>>Dividendos</OPTION>
                </select>
                </div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Número de Días de Caducidad :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOPXT" size="5" maxlength="4" value="<%= refCodes.getE02CNOPXT().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Aplicación Origen :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <select name="E02CNOPAF">
                   <OPTION value="1" <% if (refCodes.getE02CNOPAF().equals("1")) out.print("selected"); %>>Préstamos</OPTION>                   
                   <OPTION value="2" <% if (refCodes.getE02CNOPAF().equals("2")) out.print("selected"); %>>Nómina</OPTION>
                   <OPTION value="3" <% if (refCodes.getE02CNOPAF().equals("3")) out.print("selected"); %>>Negocios Internacionales</OPTION>
                   <OPTION value="4" <% if (refCodes.getE02CNOPAF().equals("4")) out.print("selected"); %>>Tesorería</OPTION>                   
                   <OPTION value="5" <% if (refCodes.getE02CNOPAF().equals("5")) out.print("selected"); %>>Medios de Pago (Open Card)</OPTION>
                   <OPTION value="6" <% if (refCodes.getE02CNOPAF().equals("6")) out.print("selected"); %>>Cheque Gerencia Ctas.AFC</OPTION>
                   <OPTION value="7" <% if (refCodes.getE02CNOPAF().equals("7")) out.print("selected"); %>>Canje</OPTION>                   
                   <OPTION value="8" <% if (refCodes.getE02CNOPAF().equals("8")) out.print("selected"); %>>Cheques de Gerencia</OPTION>
                   <OPTION value="9" <% if (refCodes.getE02CNOPAF().equals("9")) out.print("selected"); %>>Plazos</OPTION>
                   <OPTION value="0" <% if (refCodes.getE02CNOPAF().equals("0")) out.print("selected"); %>>Dividendos CorpBanca Colombia</OPTION>                   
                   <OPTION value="A" <% if (refCodes.getE02CNOPAF().equals("A")) out.print("selected"); %>>Ingresos y Pagos</OPTION>
                   <OPTION value="B" <% if (refCodes.getE02CNOPAF().equals("B")) out.print("selected"); %>>Embargos</OPTION>
                   <OPTION value="C" <% if (refCodes.getE02CNOPAF().equals("C")) out.print("selected"); %>>Nómina Recursos Humanos</OPTION>                   
                   <OPTION value="D" <% if (refCodes.getE02CNOPAF().equals("D")) out.print("selected"); %>>Recursos Humanos</OPTION>
                   <OPTION value="E" <% if (refCodes.getE02CNOPAF().equals("E")) out.print("selected"); %>>Proveedores</OPTION>
                   <OPTION value="F" <% if (refCodes.getE02CNOPAF().equals("F")) out.print("selected"); %>>Todas</OPTION>
                </select>
                </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Asociada :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF03" value="Y" <%if (refCodes.getE02CNOF03().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF03" value="N" <%if (refCodes.getE02CNOF03().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Oficina Requerida :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF04" value="Y" <%if (refCodes.getE02CNOF04().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF04" value="N" <%if (refCodes.getE02CNOF04().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%" height="19"> 
              <div align="right">Contabiliza Pre-expedición :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF05" value="Y" <%if (refCodes.getE02CNOF05().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF05" value="N" <%if (refCodes.getE02CNOF05().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%" height="19"> 
              <div align="right">Modificar Fecha Caducidad :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF06" value="Y" <%if (refCodes.getE02CNOF06().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF06" value="N" <%if (refCodes.getE02CNOF06().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Contabiliza Impuesto :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF07" value="Y" <%if (refCodes.getE02CNOF07().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF07" value="N" <%if (refCodes.getE02CNOF07().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%" height="19"> 
              <div align="right">Pago Pre-Expedición en Efectivo :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOIVA" value="Y" <%if (refCodes.getE02CNOIVA().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOIVA" value="N" <%if (refCodes.getE02CNOIVA().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Momento del Cargo :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOTCF" value="Y" <%if (refCodes.getE02CNOTCF().equals("Y")) out.print("checked"); %>>
                Expedición 
                <input type="radio" name="E02CNOTCF" value="N" <%if (refCodes.getE02CNOTCF().equals("N")) out.print("checked"); %>>
                Pre-Expedición </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
   <h4>&nbsp;</h4>  
      <div align="center">
         <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
         <%}%>
         <input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="finish();">
   </div>  

  </form>
</body>
</html>

