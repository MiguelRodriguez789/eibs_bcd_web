<html>
<head>
<title>Cancellation</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="canchk" class= "datapro.eibs.beans.EOF012002Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

  builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }


</SCRIPT>

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


<H3 align="center">Cancelacion de Cheque Certificados</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSETL0510" >
  <input type=HIDDEN name="SCREEN" value="16">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cheque :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> <%= canchk.getE02OFMCKN()%> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> <%= canchk.getE02OFMCCY()%> </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> <%= canchk.getE02OFMBNK()%> </b> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Sucursal :</b></div>
            </td>
            <td nowrap width="20%"><b> <%= canchk.getE02OFMBRN()%> </b> </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Monto :</b></div>
            </td>
            <td nowrap width="16%"><%= canchk.getE02OFMAMT()%></td>
            <td nowrap colspan="2">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br><table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"><b></b></div>
            </td>
            <td nowrap > 
              <h4 align="center"><b>Banco</b></h4>
            </td>
            <td nowrap> 
              <h4 align="center"><b>Sucursal</b></h4>
            </td>
            <td nowrap > 
              <h4 align="center"><b>Moneda</b></h4>
            </td>
            <td nowrap > 
              <h4 align="center"><b>Cuenta Contable</b></h4>
            </td>
            <td nowrap > 
              <h4 align="center"><b>Referencia</b></h4>
            </td>
            <td nowrap > 
              <h4 align="center"><b>Centro de Costo</b></h4>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> Cuenta  Credito:</div>
            </td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02CREBNK()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02CREBRN()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02CRECCY()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02CREGLN()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02CREACC()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02CRECCN()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td align="right" >Cuenta  Debito:</td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02DEBBNK()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02DEBBRN()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02DEBCCY()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02DEBGLN()%> </div>
            </td>
            <td nowrap > 
              <div align="center"> <%= canchk.getE02DEBACC()%> </div>
            </td>
            <td nowrap > 
              <div align="center"><%= canchk.getE02CRECCN()%> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo" width="283">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="44%" height="19"> 
              <div align="right">Observaciones :</div>
            </td>
            <td nowrap height="19" colspan="3"> <%= canchk.getE02DESCRIP()%> </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="44%" height="19">&nbsp;</td>
            <td nowrap height="19" colspan="3">Esta Operacion ha Finalizado Satisfactoriamente</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
</form>
</body>
</html>
