<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Payments</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="invTrade" class="datapro.eibs.beans.EIE021001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
 function Calculate(){
  document.forms[0].SCREEN.value = '16';
  document.forms[0].submit();
}
function Confirm(){
   if(confirm("Are you sure you want to process this coupon?")){
      document.forms[0].submit();
  }
  else 
   return;
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
<div align="center"> 
  <h3>Confirmaci&oacute;n de Pago de Cup&oacute;n <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inv_coupon_approval.jsp,EIE0210"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0210" >
  <h4> 
    <input type="hidden" name="SCREEN"  value="2" >
    Informaci&oacute;n B&aacute;sica </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"><a href="javascript:showInstrumentInq(document.forms[0].E01CPNIIC.value)"><img src="<%=request.getContextPath()%>/images/aquire.gif" title="help" align="bottom" border="0" > 
                Instrumento </a> :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="hidden" name="E01CPNIIC"  value="<%= invTrade.getE01CPNIIC()%>" >
              <%= invTrade.getE01CPNIIC()%> - <%= invTrade.getD01ISIDSC()%> </td>
            <td nowrap width="36%" >
              <div align="right">Estado del Cup&oacute;n :</div>
            </td>
            <td nowrap width="36%" >
              <div align="left"> <%= invTrade.getD01STSDSC()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Moneda del Instrumento :</div>
            </td>
            <td nowrap width="36%" ><%= invTrade.getD01ISICCY()%> </td>
            <td nowrap width="36%" >&nbsp;</td>
            <td nowrap width="36%" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">ISIN :</div>
            </td>
            <td nowrap width="36%" ><%= invTrade.getD01ISINUM()%> </td>
            <td nowrap width="36%" >&nbsp;</td>
            <td nowrap width="36%" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n del Custodio</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Custodio :</div>
            </td>
            <td nowrap colspan="7" > 
              <input type="text" name="D01CSTCOD" size="5" maxlength="4" value="<%= invTrade.getD01CSTCOD()%>" readonly>
              <input type="text" name="D01CSTNME" size="35" maxlength="30" value="<%= invTrade.getD01CSTNME()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  >&nbsp;</td>
            <td nowrap  > 
              <div align="center">Tipo de Pago</div>
            </td>
            <td nowrap  > 
              <div align="center">Banco</div>
            </td>
            <td nowrap  > 
              <div align="center">Suc.</div>
            </td>
            <td nowrap > 
              <div align="center">Moneda</div>
            </td>
            <td nowrap  > 
              <div align="center">Cuenta Contable</div>
            </td>
            <td nowrap  > 
              <div align="center">Cuenta</div>
            </td>
            <td nowrap  >
              <div align="center">Centro de <br>Costo</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Cuenta de Pago :</div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <select name="E01CPNCPT">
                  <option value="" <%if (invTrade.getE01CPNCPT().equals("")) { out.print("selected"); }%>>Seleccionar Una</option>
                  <option value="1" <%if (invTrade.getE01CPNCPT().equals("1")) { out.print("selected"); }%>>Cuenta Corriente</option>
                  <option value="2" <%if (invTrade.getE01CPNCPT().equals("2")) {  out.print("selected"); }%>>Cheque Oficial</option>
                  <option value="3" <%if (invTrade.getE01CPNCPT().equals("3")) { out.print("selected"); }%>>Cuenta Contable</option>
                  <option value="4" <%if (invTrade.getE01CPNCPT().equals("4")) {  out.print("selected"); }%>>Transferencia Fed</option>
                  <option value="5" <%if (invTrade.getE01CPNCPT().equals("5")) { out.print("selected"); }%>>Transferencia Telex</option>
                  <option value="6" <%if (invTrade.getE01CPNCPT().equals("6")) {  out.print("selected"); }%>>Swift Formato MT-100</option>
                  <option value="7" <%if (invTrade.getE01CPNCPT().equals("7")) { out.print("selected"); }%>>Swift Formato MT-200</option>
                  <option value="8" <%if (invTrade.getE01CPNCPT().equals("8")) {  out.print("selected"); }%>>Swift Formato MT-202</option>
                </select>
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01CPNCBK" size="2" maxlength="2" value="<%= invTrade.getE01CPNCBK()%>">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01CPNCBR" size="4" maxlength="4" value="<%= invTrade.getE01CPNCBR()%>"
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01CPNCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01CPNCCY" size="3" maxlength="3" value="<%= invTrade.getE01CPNCCY()%>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01CPNCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01CPNCGL" size="17" maxlength="16" value="<%= invTrade.getE01CPNCGL()%>"
				class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01CPNCBK.value,document.forms[0].E01CPNCCY.value,'','','')"  >
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E01CPNCAC" size="13" maxlength="12" value="<%= invTrade.getE01CPNCAC()%>"
                class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01CPNCBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" name="E01CPNCCC" size="9" maxlength="8" value="<%= invTrade.getE01CPNCCC()%>"
                class="context-menu-help" onmousedown="init(costcenterHelp,this.name,document.forms[0].E01CPNCBK.value,'','','','')" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n del Cliente</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap colspan="7" ><%= invTrade.getD01CUSNME().trim()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  > 
              <div align="right"></div>
            </td>
            <td nowrap  > 
              <div align="center">Tipo de Pago</div>
            </td>
            <td nowrap  > 
              <div align="center">Banco</div>
            </td>
            <td nowrap  > 
              <div align="center">Suc.</div>
            </td>
            <td nowrap  > 
              <div align="center">Moneda</div>
            </td>
            <td nowrap  > 
              <div align="center">Cuenta Contable</div>
            </td>
            <td nowrap  > 
              <div align="center">Cuenta</div>
            </td>
            <td nowrap  >
              <div align="center">Centro de<br>
                Costo</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Cuenta de Pago:</div>
            </td>
            <td nowrap  > 
              <div align="center">Cuenta Corriente</div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="D01ORDIBK" size="2" maxlength="2" value="<%= invTrade.getD01ORDIBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="D01ORDIBR" size="4" maxlength="4" value="<%= invTrade.getD01ORDIBR()%>"
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].D01ORDIBK.value,'','','','')">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="D01ORDICY" size="3" maxlength="3" value="<%= invTrade.getD01ORDICY()%>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].D01ORDIBK.value,'','','','')">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="D01ORDIGL" size="17" maxlength="16" value="<%= invTrade.getD01ORDIGL()%>"
				class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].D01ORDIBK.value,document.forms[0].D01ORDICY.value,'','','')"  >
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="D01ORDIAC" size="13" maxlength="12" value="<%= invTrade.getD01ORDIAC()%>"
                class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].D01ORDIBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap  >
              <div align="center">
                <input type="text" name="D01ORDICC" size="9" maxlength="8" value="<%= invTrade.getD01ORDICC()%>"
                class="context-menu-help" onmousedown="init(costcenterHelp,this.name,document.forms[0].D01ORDIBK.value,'','','','')" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n de la Transacci&oacute;n </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Tipo de Pago :</div>
            </td>
            <td nowrap > 
              <div align="left"><%= invTrade.getD01PMTDSC()%> </div>
            </td>
            <td nowrap > 
              <div align="right"> Fecha de C&aacute;lculo :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CPNPM1" size="3" maxlength="2" value="<%= invTrade.getE01CPNPM1()%>" readonly>
                <input type="text" name="E01CPNPM2" size="3" maxlength="2" value="<%= invTrade.getE01CPNPM2()%>" readonly>
                <input type="text" name="E01CPNPM3" size="5" maxlength="4" value="<%= invTrade.getE01CPNPM3()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Monto Proyectado : </div>
            </td>
            <td nowrap > 
              <div align="left"><%= Util.fcolorCCY(invTrade.getE01CPNAMT())%> 
              </div>
            </td>
            <td nowrap > 
              <div align="right">Fecha de Ejecuci&oacute;n :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CPNDL1" size="3" maxlength="2" value="<%= invTrade.getE01CPNDL1()%>">
                <input type="text" name="E01CPNDL2" size="3" maxlength="2" value="<%= invTrade.getE01CPNDL2()%>">
                <input type="text" name="E01CPNDL3" size="4" maxlength="5" value="<%= invTrade.getE01CPNDL3()%>">
                <a href="javascript:DatePicker(document.forms[0].E01CPNDL1,document.forms[0].E01CPNDL2,document.forms[0].E01CPNDL3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a> 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Monto Entregado :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01CPNDAM" size="17" maxlength="15" value="<%= invTrade.getE01CPNDAM()%>" onKeyPress="enterDecimal()">
              <input type="hidden" name="D01ISIPTY"  value="<%= invTrade.getD01ISIPTY()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Comisi&oacute;n :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CPNCOM" size="17" maxlength="15" value="<%= invTrade.getE01CPNCOM()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap > 
              <div align="right">Tabla de Comisi&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01CPNTBL" size="4" maxlength="2" value="<%= invTrade.getE01CPNTBL()%>">
                <a href="javascript:GetCommCustodyTable('E01CPNTBL',document.forms[0].D01ISIPTY.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Rec&aacute;lculo de Comisi&oacute;n :</div>
            </td>
            <td nowrap > 
              <input type="radio" name="H01FLGWK3" value="R" onClick="document.forms[0].H01FLGWK3.value='R'" <%if(invTrade.getH01FLGWK3().equals("R")) out.print("checked");%>>
              Si
<input type="radio" name="H01FLGWK3" value="" onClick="document.forms[0].H01FLGWK3.value=''" <%if(invTrade.getH01FLGWK3().equals("")) out.print("checked");%> checked>
              No</td>
            <td nowrap > 
              <div align="right">Tasa de Moneda Extranjera:</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CPNFL7" size="11" maxlength="9" value="<%= invTrade.getE01CPNFL7()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" ><b>Totales</b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Monto Neto :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01CPNPAM" readonly size="17" maxlength="15" value="<%= invTrade.getE01CPNPAM()%>" onKeyPress="enterDecimal()">
              <a href="javascript:Calculate()"><img src="<%=request.getContextPath()%>/images/calculator.gif" title="calculator" align="middle" border="1" ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="4" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Observaciones :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E01CPNRMK" size="35" maxlength="30" value="<%= invTrade.getE01CPNRMK()%>" >
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Marcar para Borrar :</div>
            </td>
            <td nowrap colspan="3" > 
              <input type="hidden" name="H01FLGMAS"  value="<%= invTrade.getH01FLGMAS()%>" >
              <input type="radio" name="CH01FLGMAS" value="Y" onClick="document.forms[0].H01FLGMAS.value='Y'" <%if(invTrade.getH01FLGMAS().equals("Y")) out.print("checked");%>>
              Si 
              <input type="radio" name="CH01FLGMAS" value="" onClick="document.forms[0].H01FLGMAS.value=''" <%if(invTrade.getH01FLGMAS().equals("")) out.print("checked");%> >
              No </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <script type="text/javascript">
	   radioClick('REFNUM',0);
	</script>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">&nbsp;</td>
      <td width="33%"> 
        <div align="left"> 
          <input type="checkbox" name="H01FLGWK2" value="A" <% if(invTrade.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
          Aceptar con Avisos</div>
      </td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">&nbsp;</td>
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar" >
        </div>
      </td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td>&nbsp;</td>
      <td> 
        <div align="center"> </div>
      </td>
      <td>&nbsp;</td>
    </tr>
  </table>
 
  </form>
</body>
</html>
