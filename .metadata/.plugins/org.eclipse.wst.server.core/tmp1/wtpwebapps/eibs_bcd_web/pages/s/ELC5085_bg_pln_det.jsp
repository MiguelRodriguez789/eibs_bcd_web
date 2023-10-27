<%@page import="datapro.eibs.master.Util" %>
<%@page import="java.lang.Object" %>
<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.ELC508503Message"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>

<HTML>
<HEAD>
<TITLE> Detalle de Comisiones</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.ELC508503Message" scope="session" />
<jsp:useBean id="datadet" class="datapro.eibs.beans.ELC508503Message" scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<BODY>

<%
  int plnRow = list.getNoResult() ? 0 : list.getLastRec() + 1;
  double totpag = 0; double totpen = 0; double tivpen = 0; double tivpag = 0;
%> 

<SCRIPT type="text/javascript">

function goSend(button) {
  try {
    button.disabled = true;
    document.forms[0].submit();
  } catch(e) {
    alert("goSend: "+e);
  }
}

function cerrarVentana(){
  window.open('','_parent','');
  window.close(); 
}

function updateTotal() {  
  var vlrrev = 0.00; var vlranu = 0.00; var vlrpag = 0.00;
  var ivarev = 0.00; var ivaanu = 0.00; var ivapag = 0.00;
  try {
    var myTable = document.all["DINTABLE"];
    for (i = 1; i <= myTable.rows.length-1; i++) {
      if (getElement("E03DCCRTY_" + i).value == "R") {
        vlrrev = vlrrev + parseFloat((getElement("E03DCCCAM_" + i).value));
        ivarev = ivarev + parseFloat((getElement("E03DCCIAM_" + i).value));
      }
      if (getElement("E03DCCRTY_" + i).value == "A") {
        vlranu = vlranu + parseFloat((getElement("E03DCCCAM_" + i).value));
        ivaanu = ivaanu + parseFloat((getElement("E03DCCIAM_" + i).value));
      }
      if (getElement("E03DCCRTY_" + i).value == "P") {
        vlrpag = vlrpag + parseFloat((getElement("E03DCCCAM_" + i).value));
        ivapag = ivapag + parseFloat((getElement("E03DCCIAM_" + i).value));
      }
    }
    getElement('VLRREV').value = formatCCY(vlrrev);
    getElement('VLRANU').value = formatCCY(vlranu);
    getElement('VLRPAG').value = formatCCY(vlrpag);
    getElement('IVAREV').value = formatCCY(ivarev);
    getElement('IVAANU').value = formatCCY(ivaanu);
    getElement('IVAPAG').value = formatCCY(ivapag);
  } catch(e) {
    alert("updateTotal: "+e);
  }
}

</SCRIPT>

<h3 align="center">Detalle de la Cuota
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_bg_pln_det.jsp, ELC5085"> 
</h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5085" >
  <input type=hidden name="SCREEN" value="601">
  <input type=hidden name="opt" id="opt" value="1">
  <input type=hidden name="PLNROW" id="PLNROW" value=""<%=plnRow%>"">
  <input type=hidden name="DFORMAT"  value="<%=currUser.getE01DTF()%>">
  <input type=hidden name="TABLESIZE" id="TABLESIZE" value="1" >
  <input type=hidden name="E03DCCPDM_0" value="">
  <input type=hidden name="E03DCCPDD_0" value="">
  <input type=hidden name="E03DCCPDY_0" value="">
  <input type=hidden name="E03DCCCAM_0" value="">
  <input type=hidden name="E03DCCPFL_0" value="">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="35%" > 
              <div align="left"> 
                <eibsinput:text property="E03LCMCUN" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="15%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="35%" > 
              <div align="left"> 
                <eibsinput:text property="E03CUSNA1" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left"> 
                <eibsinput:text property="E03LCMACC" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left"> 
                <div align="right"></div>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <%int row = 0; %>
  <h4>Datos de la Transacci&oacute;n</h4>
  <table class="tableinfo" style="width:100%" >
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="16%"> 
              <div align="right" style="font-weight: bold;"></div>
            </td>
            <td width="16%"> 
              <div align="right" style="font-weight: bold;"></div>
            </td>
            <td width="16%"> 
              <div align="center" style="font-weight: bold;">Reversar</div>
            </td>
            <td width="16%"> 
              <div align="center" style="font-weight: bold;">Anular</div>
            </td>
            <td width="16%"> 
              <div align="center" style="font-weight: bold;">Pagar</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>"> 
            <td width="16%"> 
              <div align="right" style="font-weight: bold;">Monto Pagado : </div>
            </td>
            <td width="16%"> 
              <input type="text" name="TOTPAG" id="TOTPAG" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="16%"> 
              <input type="text" name="VLRREV" id="VLRREV" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="16%"> 
              <div align="right" style="font-weight: bold;"></div>
            </td>
            <td width="16%"> 
              <div align="right" style="font-weight: bold;"></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="16%"> 
              <div align="right" style="font-weight: bold;">Iva Pagado : </div>
            </td>
            <td width="16%"> 
              <input type="text" name="TIVPAG" id="TIVPAG" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="16%"> 
              <input type="text" name="IVAREV" id="IVAREV" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="16%"> 
              <div align="right" style="font-weight: bold;"></div>
            </td>
            <td width="16%"> 
              <div align="right" style="font-weight: bold;"></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>"> 
            <td width="16%"> 
              <div align="right" style="font-weight: bold;">Monto Pendiente : </div>
            </td>
            <td width="16%"> 
              <input type="text" name="TOTPEN" id="TOTPEN" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="16%"> 
              <div align="right" style="font-weight: bold;"></div>
            </td>
            <td width="16%"> 
              <input type="text" name="VLRANU" id="VLRANU" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="16%"> 
              <input type="text" name="VLRPAG" id="VLRPAG" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="16%"> 
              <div align="right" style="font-weight: bold;">Iva Pendiente : </div>
            </td>
            <td width="16%"> 
              <input type="text" name="TIVPEN" id="TIVPEN" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="16%"> 
              <div align="right" style="font-weight: bold;"></div>
            </td>
            <td width="16%"> 
              <input type="text" name="IVAANU" id="IVAANU" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="16%"> 
              <input type="text" name="IVAPAG" id="IVAPAG" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <br>
  <table class="tableinfo" id="DINTABLE">
    <tr id="trdark">
      <th nowrap width="06%"><div align="center">Cuota</div></th>
      <th nowrap width="34%"><div align="center">Comision</div></th>
      <th nowrap width="12%"><div align="center">Fecha a<br>Pagar</div></th>
      <th nowrap width="12%"><div align="center">Monto</div></th>
      <th nowrap width="12%"><div align="center">IVA</div></th>
      <th nowrap width="12%"><div align="center">Estado</div></th>
      <th nowrap width="12%"><div align="center">Accion</div></th>
    </tr>
<%
    list.initRow();
    int actrow = 0;
    totpag = 0; totpen = 0; tivpag = 0; tivpen = 0;
    while (list.getNextRow()) {
      ELC508503Message datarec = (ELC508503Message) list.getRecord();
      if (datarec.getE03DCCPVI().equals("1") || datarec.getE03DCCPVI().equals("2")) {
        actrow++;
        if (datarec.getE03DCCPFL().equals("P")) {
          totpag = totpag + datarec.getBigDecimalE03DCCCAM().longValue();
          tivpag = tivpag + datarec.getBigDecimalE03DCCIAM().longValue();
        } else {
          totpen = totpen + datarec.getBigDecimalE03DCCCAM().longValue();
          tivpen = tivpen + datarec.getBigDecimalE03DCCIAM().longValue();
        }
%> 
    <tr id="trclear">
      <td nowrap width="06%">
     <% if ( actrow == 1 ) { %>      
        <input type="hidden" name="E03DCCACC" value="<%=datarec.getE03DCCACC()%>" >
     <% } %>
        <input type="hidden" name="E03DCCCDE_<%= actrow %>" value="<%=datarec.getE03DCCCDE()%>" >
        <input type="hidden" name="E03DCCPVI_<%= actrow %>" value="<%=datarec.getE03DCCPVI()%>" >
        <input type="hidden" name="E03DCCNAR_<%= actrow %>" value="<%=datarec.getE03DCCNAR()%>" >
        <input type="hidden" name="E03DCCSEQ_<%= actrow %>" value="<%=datarec.getE03DCCSEQ()%>" >
        <input type="hidden" name="E03DCCPDM_<%= actrow %>" value="<%=datarec.getE03DCCPDM()%>" >
        <input type="hidden" name="E03DCCPDD_<%= actrow %>" value="<%=datarec.getE03DCCPDD()%>" >
        <input type="hidden" name="E03DCCPDY_<%= actrow %>" value="<%=datarec.getE03DCCPDY()%>" >
        <input type="hidden" name="E03DCCPFL_<%= actrow %>" value="<%=datarec.getE03DCCPFL()%>" >
        <input type="hidden" name="E03DCCCAM_<%= actrow %>" value="<%=datarec.getE03DCCCAM()%>" >
        <input type="hidden" name="E03DCCIAM_<%= actrow %>" value="<%=datarec.getE03DCCIAM()%>" >
        <input type="hidden" name="E03DCCGAM_<%= actrow %>" value="<%=datarec.getE03DCCGAM()%>" >
        <div align="center"> 
          <%=datarec.getE03DCCSEQ()%>
        </div>
      </td>
      <td nowrap width="34%"> 
        <div align="center"><%=datarec.getE03DDCDSC()%></div>
      </td>  
      <td nowrap width="12%">
        <div align="center"> 
          <%= Util.formatCustomDate(currUser.getE01DTF(), datarec.getBigDecimalE03DCCPDM().intValue(), 
              datarec.getBigDecimalE03DCCPDD().intValue(),
              datarec.getBigDecimalE03DCCPDY().intValue())%>
        </div>
      </td>
      <td nowrap width="12%"> 
        <div align="center"><%=datarec.getE03DCCCAM()%></div>
      </td>  
      <td nowrap width="12%"> 
        <div align="center"><%=datarec.getE03DCCIAM()%></div>
      </td>  
      <td nowrap width="12%">
        <div align="center"> 
          <% if (!datarec.getE03DCCPFL().equals("P")&&!datarec.getE03DCCPFL().equals("A")) out.print("PENDIENTE"); %>
          <% if (datarec.getE03DCCPFL().equals("P"))  out.print("PAGADA"); %>
          <% if (datarec.getE03DCCPFL().equals("A"))  out.print("ANULADA"); %>
        </div>
      </td>
      <td nowrap width="12%">
        <div align="center"> 
          <select name="E03DCCRTY_<%= actrow %>" onchange="updateTotal()">
            <option value="-" >-</option>
            <% if ( datarec.getE03DCCPFL().equals("P") ) { %> 
            <%   if ( !datarec.getH03FLGWK3().equals("M") ) { %> 
            <option value="R" <% if (datarec.getE03DCCRTY().equals("R")) out.print("selected"); %>>Reversar</option>
            <%   } %> 
            <% } else if ( !datarec.getE03DCCPFL().equals("A") ) { %>
            <option value="P" <% if (datarec.getE03DCCRTY().equals("P")) out.print("selected"); %>>Pagar</option>
            <option value="A" <% if (datarec.getE03DCCRTY().equals("A")) out.print("selected"); %>>Anular</option>
            <% } %>
          </select>
        </div>
      </td>
    </tr>
<%    } %> 
<%  } %>
  </table>

  <br>
  <div align="center">
    <table class="tbenter" class="tbenter">
      <tr>
        <td align="right"><input id="EIBSBTN" type="button" name="Submit" OnClick="goSend(this)" value="Enviar"></td>
        <td >&nbsp;</td>
        <td align="left"><input id="EIBSBTN" type=button   name="Submit" OnClick="checkClose()" value="Salir"></td>
      </tr>
    </table> 
  </div>

</form>

<SCRIPT type="text/javascript">
  getElement('TABLESIZE').value = "<%=""+actrow%>";
  getElement('TOTPAG').value = "<%=datapro.eibs.master.Util.formatCCY(totpag)%>";
  getElement('TOTPEN').value = "<%=datapro.eibs.master.Util.formatCCY(totpen)%>";
  getElement('TIVPAG').value = "<%=datapro.eibs.master.Util.formatCCY(tivpag)%>";
  getElement('TIVPEN').value = "<%=datapro.eibs.master.Util.formatCCY(tivpen)%>";
  updateTotal(); 
</SCRIPT>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
  window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5085?SCREEN=600&IFRAME=Y&E03DCCACC=<%=header.getE03LCMACC()%>';           
  cerrarVentana();      
</script>
<% } %>  

</body>
</html>
