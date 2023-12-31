<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">C&oacute;digos de Referencia del Sistema - C&oacute;digos de 
  Transacciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_transactions_codes_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" ID="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Clasificaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" id="E02CNOCFL" readonly size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">C&oacute;digo :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" id="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNODSC" id="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">Cargo Por Transacci&oacute;n :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOCHG" id="E02CNOCHG" size="17" maxlength="15" value="<%= refCodes.getE02CNOCHG().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">Moneda para Cargos :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOSCY" id="E02CNOSCY" size="4" maxlength="3" value="<%= refCodes.getE02CNOSCY().trim()%>"  >
                <a href="javascript:GetCurrency('E02CNOSCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a></div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">D&eacute;bito o Cr&eacute;dito al Cliente :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNODCC" id="E02CNODCC" value="DR" <%if (refCodes.getE02CNODCC().equals("DR")) out.print("checked"); %>>
                D&eacute;bito 
                <input type="radio" name="E02CNODCC" id="E02CNODCC" value="CR" <%if (refCodes.getE02CNODCC().equals("CR")) out.print("checked"); %>>
                Cr&eacute;dito </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">Cuenta Contable Cargos por Servicio :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOSCG" id="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
                <a href="javascript:GetLedger('E02CNOSCG',document.getElementById('E02CNOBNK').value,document.getElementById('E02CNOSCY').value,'')"> 
                <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">Atributos de la Transacci&oacute;n :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOADI" id="E02CNOADI" size="2" maxlength="1" value="<%= refCodes.getE02CNOADI().trim()%>" >
                <a href="javascript:GetCode('E02CNOADI','STATIC_cnof_trans_attributes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">M&aacute;ximo N&uacute;mero de Rechazos :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOFRP" id="E02CNOFRP" size="6" maxlength="5" value="<%= refCodes.getE02CNOFRP().trim()%>" onKeypress="enterInteger">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%" height="19"> 
              <div align="right">C&oacute;digo de Transacci&oacute;n Externo :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOCPC" id="E02CNOCPC" size="5" maxlength="4" value="<%= refCodes.getE02CNOCPC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%" height="19"> 
              <div align="right">D&eacute;bito, Cr&eacute;dito o ambos :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNODCB" id="E02CNODCB" value="D" <%if (refCodes.getE02CNODCB().equals("D")) out.print("checked"); %>>
                D&eacute;bito 
                <input type="radio" name="E02CNODCB" id="E02CNODCB" value="C" <%if (refCodes.getE02CNODCB().equals("C")) out.print("checked"); %>>
                Cr&eacute;dito 
                <input type="radio" name="E02CNODCB" id="E02CNODCB" value="B" <%if (refCodes.getE02CNODCB().equals("B")) out.print("checked"); %>>
                Ambos </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">Imprimir Aviso al Cliente :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOPAF" id="E02CNOPAF" value="Y" <%if (refCodes.getE02CNOPAF().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOPAF" id="E02CNOPAF" value="N" <%if (refCodes.getE02CNOPAF().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%" height="19"> 
              <div align="right">C&oacute;digo Transacci&oacute;n D&eacute;bito 
                MICR :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOMID" id="E02CNOMID" size="7" maxlength="6" value="<%= refCodes.getE02CNOMID().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">C&oacute;digo Transacci&oacute;n Cr&eacute;dito 
                MICR :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOMIC" id="E02CNOMIC" size="7" maxlength="6" value="<%= refCodes.getE02CNOMIC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%" height="19"> 
              <div align="right">C&oacute;digo Aplicaci&oacute;n de la Transacci&oacute;n 
                :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOAPC" id="E02CNOAPC" size="2" maxlength="1" value="<%= refCodes.getE02CNOAPC().trim()%>" >
                <a href="javascript:GetCode('E02CNOAPC','STATIC_cnof_trans_app_codes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">Generar Facturaci&oacute;n :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF03" id="E02CNOF03" value="Y" <%if (refCodes.getE02CNOF03().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF03" id="E02CNOF03" value="N" <%if (refCodes.getE02CNOF03().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Para An&aacute;lisis de Cuenta y Rentabilidad</h4>  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Costo Unitario de la Transacci&oacute;n :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
                <input type="text" name="E02CNOCST" id="E02CNOCST" size="8" maxlength="7" value="<%= refCodes.getE02CNOCST().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%" height="23"> 
              <div align="right">Indicador de Comisi&oacute;n :</div>
            </td>
            <td nowrap height="23" width="60%"> 
              <div align="left"> 
                <input type="radio" name="E02CNOCPF" id="E02CNOCPF" value="Y" <%if (refCodes.getE02CNOCPF().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOCPF" id="E02CNOCPF" value="N" <%if (refCodes.getE02CNOCPF().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%" height="19"> 
              <div align="right">Costo Operacional :</div>
            </td>
            <td nowrap height="19" width="60%"> 
              <div align="left"> 
                <input type="text" name="E02CNOACS" id="E02CNOACS" size="8" maxlength="7" value="<%= refCodes.getE02CNOACS().trim()%>">
              </div>
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
