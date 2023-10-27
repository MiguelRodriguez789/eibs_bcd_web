<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.ELC508503Message" %>
<%@page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Plan de Pagos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class= "datapro.eibs.beans.ELC508503Message" scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  function showDetail(rowNum) {
    showPage("ELC5085_bg_pln_det.jsp?Row=" + rowNum);
  }

  function showPayMaint(acc) {
    var page = '${pageContext.request.contextPath}/pages/s/ELC5085_bg_pln_det.jsp';
    CenterWindow(page, 750, 600, 2);
  }

  function updateTotal(topag, topen, vlrev, vlanu, vlpag) {  
    var aftcom = 0;
    try {
      if (isValidObject(parent.document.forms[0].TOTPAG)&&isValidObject(parent.document.forms[0].TOTPEN)) {
        parent.document.forms[0].TOTPAG.value = formatCCY(topag);
        parent.document.forms[0].TOTPEN.value = formatCCY(topen);
      }
      if (isValidObject(parent.document.forms[0].VLRREV)&&isValidObject(parent.document.forms[0].VLRANU)&&isValidObject(parent.document.forms[0].VLRPAG)) {
        parent.document.forms[0].VLRREV.value = formatCCY(vlrev);
        parent.document.forms[0].VLRANU.value = formatCCY(vlanu);
        parent.document.forms[0].VLRPAG.value = formatCCY(vlpag);
      }
      aftcom = topen - vlanu - vlpag;
      if (isValidObject(parent.document.forms[0].E01BEFCOM)&&isValidObject(parent.document.forms[0].E01AFTCOM)) {
        parent.document.forms[0].E01BEFCOM.value = formatCCY(topen);
        parent.document.forms[0].E01AFTCOM.value = formatCCY(aftcom);
      }
    } catch(e) {
      alert("updateTotal: "+e);
    }
  }

  function updateIva(tipag, tipen, ivrev, ivanu, ivpag) {  
    var aftiva = 0;
    try {
      if (isValidObject(parent.document.forms[0].TIVPAG)&&isValidObject(parent.document.forms[0].TIVPEN)) {
        parent.document.forms[0].TIVPAG.value = formatCCY(tipag);
        parent.document.forms[0].TIVPEN.value = formatCCY(tipen);
      }
      if (isValidObject(parent.document.forms[0].IVAREV)&&isValidObject(parent.document.forms[0].IVAANU)&&isValidObject(parent.document.forms[0].IVAPAG)) {
        parent.document.forms[0].IVAREV.value = formatCCY(ivrev);
        parent.document.forms[0].IVAANU.value = formatCCY(ivanu);
        parent.document.forms[0].IVAPAG.value = formatCCY(ivpag);
      }
      aftiva = tipen - ivanu - ivpag;
      if (isValidObject(parent.document.forms[0].E01BEFIVA)&&isValidObject(parent.document.forms[0].E01AFTIVA)) {
        parent.document.forms[0].E01BEFIVA.value = formatCCY(tipen);
        parent.document.forms[0].E01AFTIVA.value = formatCCY(aftiva);
      }
    } catch(e) {
      alert("updateTotal: "+e);
    }
  }

</script>

<%
  boolean iframe = false;
  boolean readOnly = false;
  
  if ("Y".equals(request.getAttribute("IFRAME"))) {
    iframe = true;
  }

  if ((!userPO.getPurpose().equals("NEW")) && (!userPO.getPurpose().equals("MAINTENANCE"))) { 
    readOnly = true;
  }
%>

</head>

<body>
<% 
  if ( !error.getERRNUM().equals("0")  ) {
    error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println("  showErrors()");
    out.println("</SCRIPT>");
  }
  double totpag = 0; double totpen = 0; double tivpag = 0; double tivpen = 0;
  double vlrrev = 0; double vlranu = 0; double vlrpag = 0;
  double ivarev = 0; double ivaanu = 0; double ivapag = 0;
%>

<% if (!iframe) { %>  
<h3 align="center">Plan de Pagos de Documentarias 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_pln.jsp, ELC5085"></h3>
<hr size="4">
<% } %>    
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5085">
<input type="hidden" name="SCREEN" id="SCREEN" value="0"> 
<input type="hidden" name="E03LCMACC" id="E03LCMACC" value="<%=header.getE03LCMACC()%>">

<% if (iframe) { %>  
  <h4>
<%   if (readOnly) { %>
   Comisiones 
<%   } else { %>    
   <a href="javascript:showPayMaint(document.forms[0].E03LCMACC.value)" ><b>Comisiones</b></a>
<%   }  %>
  </h4>
<% } else { %>    
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
            <td nowrap width="15%" > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="85%" colspan="3"> 
              <div align="left"> 
                <eibsinput:text property="E03LCMPRO" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
                <eibsinput:text property="E03DSCPRO" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
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
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left"> 
                <eibsinput:text property="E03LCMCCY" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<% } %>    

<%
  if (list.getNoResult()) {
%>
  <br>
  <table class="tbenter" style="width: 360px; height: 100px;" align="center">
    <tr>
      <td>
        <div align="center">
          <font size="3">
            <b> No hay resultados que correspondan a su criterio de búsqueda. </b>
          </font>
        </div>
      </td>
    </tr>
  </table>
<%
  } else {
%>
  <table id="mainTable" class="tableinfo" style="height:80px;" width="100%">
    <tr  height="5%"> 
      <td nowrap valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align="center" nowrap width="06%">Nro.<br>Cuota</th>
            <th align="center" nowrap width="24%">Comision</th>
            <th align="center" nowrap width="10%">Forma<br>Pago</th>
            <th align="center" nowrap width="10%">Fecha a<br>Pagar</th>
            <th align="center" nowrap width="10%">Monto</th>
            <th align="center" nowrap width="10%">IVA</th>
            <th align="center" nowrap width="10%">Fecha de<br>Pago</th>
            <th align="center" nowrap width="10%">Estado</th>
            <th align="center" nowrap width="10%">Accion</th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="95%">    
      <td nowrap="nowrap">       
        <div id="dataDiv1" style="height:80px; overflow:auto;">  
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
<%
    list.initRow();
    while (list.getNextRow()) {
      ELC508503Message datarec = (ELC508503Message) list.getRecord();
      if (datarec.getE03DCCPFL().equals("P")) {
        totpag += datarec.getBigDecimalE03DCCCAM().doubleValue();
        tivpag += datarec.getBigDecimalE03DCCIAM().doubleValue();
      } else {
        totpen += datarec.getBigDecimalE03DCCCAM().doubleValue();
        tivpen += datarec.getBigDecimalE03DCCIAM().doubleValue();
      }
      if (datarec.getE03DCCRTY().equals("R")) {
        vlrrev += datarec.getBigDecimalE03DCCCAM().doubleValue();
        ivarev += datarec.getBigDecimalE03DCCIAM().doubleValue();
      }
      if (datarec.getE03DCCRTY().equals("A")) {
        vlranu += datarec.getBigDecimalE03DCCCAM().doubleValue();
        ivaanu += datarec.getBigDecimalE03DCCIAM().doubleValue();
      }
      if (datarec.getE03DCCRTY().equals("P")) {
        vlrpag += datarec.getBigDecimalE03DCCCAM().doubleValue();
        ivapag += datarec.getBigDecimalE03DCCIAM().doubleValue();
      }
%>
            <tr id="dataTable<%= list.getCurrentRow() %>">
              <td nowrap align="center" width="06%"><%=datarec.getE03DCCSEQ()%></td>
              <td nowrap align="left"   width="24%"><%=datarec.getE03DDCDSC()%></td>
              <td nowrap align="center" width="10%">
                <% if (datarec.getE03DCCPVI().equals("1")) out.print("APERTURA"); %>
                <% if (datarec.getE03DCCPVI().equals("2")) out.print("PLAN DE PAGOS"); %>
              </td>
              <td nowrap align="center" width="10%">
              <%= Util.formatCustomDate(currUser.getE01DTF(), datarec.getBigDecimalE03DCCPDM().intValue(), 
                  datarec.getBigDecimalE03DCCPDD().intValue(),
                  datarec.getBigDecimalE03DCCPDY().intValue())%>
              </td>
              <td nowrap align="right"  width="10%"><%=datarec.getE03DCCCAM()%></td>
              <td nowrap align="right"  width="10%"><%=datarec.getE03DCCIAM()%></td>
              <td nowrap align="center" width="10%">
              <%= Util.formatCustomDate(currUser.getE01DTF(), datarec.getBigDecimalE03DCCPGM().intValue(), 
                  datarec.getBigDecimalE03DCCPGD().intValue(),
                  datarec.getBigDecimalE03DCCPGY().intValue())%>
              </td>
              <td nowrap align="center" width="10%">
                <% if (!datarec.getE03DCCPFL().equals("P")&&!datarec.getE03DCCPFL().equals("A")) out.print("PENDIENTE"); %>
                <% if (datarec.getE03DCCPFL().equals("P")) out.print("PAGADA"); %>
                <% if (datarec.getE03DCCPFL().equals("A")) out.print("ANULADA"); %>
              </td> 
              <td nowrap align="center" width="10%">
                <% if (datarec.getE03DCCRTY().equals("R")) out.print("REVERSAR"); %>
                <% if (datarec.getE03DCCRTY().equals("A")) out.print("ANULAR"); %>
                <% if (datarec.getE03DCCRTY().equals("P")) out.print("PAGAR"); %>
              </td>              
            </tr>
<%
    }  
%>
          </table>
        </div>
      </td>
    </tr>
  </table>

<%
  }
%>

<% if (!iframe) { %>  
  <table class="tbenter" >
    <tr> 
      <td width="35%">&nbsp;</td>
      <td width="10%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Salir">
        </div>
      </td>
     <td width="35%">&nbsp;</td>
    </tr>
  </table>
<% } %>    

</form>

<% if ("S".equals(request.getAttribute("ACT"))){ %>
<SCRIPT type="text/javascript">
  updateTotal(parseFloat("<%=totpag%>"), parseFloat("<%=totpen%>"), parseFloat("<%=vlrrev%>"), parseFloat("<%=vlranu%>"), parseFloat("<%=vlrpag%>"));	 
  updateIva(parseFloat("<%=tivpag%>"), parseFloat("<%=tivpen%>"), parseFloat("<%=ivarev%>"), parseFloat("<%=ivaanu%>"), parseFloat("<%=ivapag%>"));
</SCRIPT>
<% } %>

</body>
</html>

