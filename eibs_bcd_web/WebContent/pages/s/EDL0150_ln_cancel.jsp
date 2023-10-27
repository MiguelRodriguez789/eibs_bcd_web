<html>
<head>
<title>Cancelación de Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id= "lnCancel" class= "datapro.eibs.beans.EDL015007Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

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
<H3 align="center">Pre - Cancelaci&oacute;n de Pr&eacute;stamos <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_cancel.jsp, EDL0150" width="35" height="35"> 
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150">
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="10">
  <INPUT TYPE=HIDDEN NAME="E07DEABNK" ID="E07DEABNK" VALUE="<%= lnCancel.getE07DEABNK().trim()%>">
 
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" size="10" maxlength="9" name="E07DEACUN" value="<%= lnCancel.getE07DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" size="45" maxlength="45" name="E07CUSNA1" value="<%= lnCancel.getE07CUSNA1().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" size="13" maxlength="12" name="E07DEAACC" value="<%= lnCancel.getE07DEAACC().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E07DEACCY" size="3" maxlength="3" value="<%= lnCancel.getE07DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" size="4" maxlength="4" name="E07DEAPRO" value="<%= lnCancel.getE07DEAPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Informaci&oacute;n Financiera</h4>

<%int row = 0; %>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="35%"> 
              <div align="right">Saldo de Principal :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E07DEAPRI" size="15" maxlength="15" value="<%= lnCancel.getE07DEAPRI().trim()%>" onKeypress="enterDecimal()">
            </td>
            <td nowrap width="24%"> 
              <div align="right">Fecha de Ultimo C&aacute;lculo :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E07DEALC1" size="3" maxlength="2" value="<%= lnCancel.getE07DEALC1().trim()%>">
              <input type="text" name="E07DEALC2" size="3" maxlength="2" value="<%= lnCancel.getE07DEALC2().trim()%>">
              <input type="text" name="E07DEALC3" size="5" maxlength="4" value="<%= lnCancel.getE07DEALC3().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="35%"> 
              <div align="right">Valor Ajustado :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E07DEAREA" size="15" maxlength="15" value="<%= lnCancel.getE07DEAREA().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="35%" height="23"> 
              <div align="right">Saldo de Inter&eacute;s :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E07DEAINT" size="15" maxlength="15" value="<%= lnCancel.getE07DEAINT().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="35%" height="19"> 
              <div align="right">Cargo por Mora :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
              <input type="text" name="E07DEAMOR" size="15" maxlength="15" value="<%= lnCancel.getE07DEAMOR().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="35%"> 
              <div align="right">Deducciones :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E07DEADED" size="15" maxlength="15" value="<%= lnCancel.getE07DEADED().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="35%"> 
              <div align="right">Comisiones :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E07DEACOM" size="15" maxlength="15" value="<%= lnCancel.getE07DEACOM().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="35%"> 
              <div align="right">Impuestos :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E07DEAIMP" size="15" maxlength="15" value="<%= lnCancel.getE07DEAIMP().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="35%"> 
              <div align="right">I.V.A. :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E07DEAIVA" size="15" maxlength="15" value="<%= lnCancel.getE07DEAIVA().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="35%"> 
              <div align="right">Total :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E07DEATOT" size="15" maxlength="15" value="<%= lnCancel.getE07DEATOT().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p></p>
  <h4>Datos de la Transacci&oacute;n</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Principal :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNPRI" size="15" maxlength="15" value="<%= lnCancel.getE07TRNPRI().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Valor Ajustado :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNREA" size="15" maxlength="15" value="<%= lnCancel.getE07TRNREA().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Intereses :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNINT" size="15" maxlength="15" value="<%= lnCancel.getE07TRNINT().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Mora :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNMOR" size="15" maxlength="15" value="<%= lnCancel.getE07TRNMOR().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Deducciones :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNDED" size="15" maxlength="15" value="<%= lnCancel.getE07TRNDED().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Comisiones :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E07TRNCOM" size="15" maxlength="15" value="<%= lnCancel.getE07TRNCOM().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="40%">
              <div align="right">Impuestos :</div>
            </td>
            <td nowrap width="60%">
              <input type="text" name="E07TRNIMP" size="15" maxlength="15" value="<%= lnCancel.getE07TRNIMP().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">I.V.A. :</div>
            </td>
            <td nowrap width="60%">
              <input type="text" name="E07TRNIVA" size="15" maxlength="15" value="<%= lnCancel.getE07TRNIVA().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Monto a Pagar :</div>
            </td>
            <td nowrap width="60%">
              <input type="text" name="E07TRNTOT" size="15" maxlength="15" value="<%= lnCancel.getE07TRNTOT().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
        </table>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="center"><b>Forma de Pago</b></div>
            </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap  > 
              <div align="center">Concepto</div>
            </td>
            <td nowrap > 
              <div align="center">Banco</div>
            </td>
            <td nowrap > 
              <div align="center">Sucursal</div>
            </td>
            <td nowrap  > 
              <div align="center">Moneda</div>
            </td>
            <td nowrap  > 
              <div align="center">Referencia</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap  > 
              <div align="center" > 
                <input type=text name="E07TRNOPC" id="E07TRNOPC" value="<%= lnCancel.getE07TRNOPC().trim()%>" size="3" maxlength="3">
                <input type=HIDDEN name="E07TRNGLN" id="E07TRNGLN" value="<%= lnCancel.getE07TRNGLN().trim()%>">
                <input type="text" name="E07TRNCON" id="E07TRNCON" size="45" maxlength="45" readonly value="<%= lnCancel.getE07TRNCON().trim()%>"
                  class="context-menu-help"
				  onmousedown="init(conceptHelp,this.name,document.getElementById('E07TRNBNK').value, document.forms[0].E07TRNCCY.value,'E07TRNGLN','E07TRNOPC','10')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E07TRNBNK" id="E07TRNBNK" size="2" maxlength="2" value="<%= lnCancel.getE07TRNBNK().trim()%>" >
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E07TRNBRN" id="E07TRNBRN" size="4" maxlength="4" value="<%= lnCancel.getE07TRNBRN().trim()%>" 
                 class="context-menu-help"
                 onmousedown="init(branchHelp,this.name,document.getElementById('E07TRNBNK').value,'','','','')"> 
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E07TRNCCY" id="E07TRNCCY" size="3" maxlength="3" value="<%= lnCancel.getE07TRNCCY().trim()%>"
                 class="context-menu-help"
                 onmousedown="init(currencyHelp,this.name,document.getElementById('E07TRNBNK').value,'','','','')">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E07TRNACC" id="E07TRNACC" size="16" maxlength="16" value="<%= lnCancel.getE07TRNACC().trim()%>" 
                 class="context-menu-help"
                 onmousedown="init(accountHelp,this.name,document.getElementById('E07TRNBNK').value,'','','','RT')">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

    <div align="center"> 
      <input id="EIBSBTN" type=submit name="Submit"  value="Enviar">
    </div>

</form>
</body>
</html>
