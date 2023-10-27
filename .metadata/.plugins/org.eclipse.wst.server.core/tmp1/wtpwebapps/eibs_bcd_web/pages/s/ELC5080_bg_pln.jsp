<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.ELC508003Message" %>
<%@page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Plan de Pagos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class= "datapro.eibs.beans.ELC508003Message" scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  function showDetail(rowNum) {
    showPage("ELC5080_bg_pln_inq.jsp?Row=" + rowNum);
  }

  function showPayMaint(acc) {
    showHiddenDivNew();
  }

  function showPayMaintCom(acc,cde) {
    closeHiddenDivNew();
    var page = '${pageContext.request.contextPath}/pages/s/ELC5080_bg_pln_maint.jsp?code='+cde;
    CenterWindow(page, 750, 600, 2);
  }

  function closeHiddenDivNew(){
    setVisibility(document.getElementById("hiddenDivNew"), "hidden");
  }

function showHiddenDivNew(evt) {
  evt = (evt) ? evt : ((window.event) ? window.event : "");
  var hiddenDivNew = document.getElementById("hiddenDivNew");
  var y = 0;
  var x = evt.clientX + document.body.scrollLeft;
  cancelBub(evt);
  moveElement(hiddenDivNew, y, x);
  setVisibility(hiddenDivNew, "visible");
}

  function addComSelect(item) {
    var x = document.getElementById("comSelect");
    var add = true;
    for (var i = 0; i < x.length; ++i) {
      if (x[i].value == item) add = false;
    }  
    if (add) {
      var option = document.createElement("option");
      option.text = item;
      option.value = item;
      x.add(option);
    }  
  }

document.onclick= closeHiddenDivNew;
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
%>

<% if (!iframe) { %>  
<h3 align="center">Plan de Pagos de Documentarias 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_pln.jsp, ELC5080"></h3>
<hr size="4">
<% } %>    
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5080">
<input type="hidden" name="SCREEN" id="SCREEN" value="0"> 
<input type="hidden" name="E03LCMACC" id="E03LCMACC" value="<%=header.getE03LCMACC()%>">

  <div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
  border-color: #0b23b5;
  border-style : solid solid solid solid;
  filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trclear"> 
        <td align=CENTER > 
          <div align="right">Codigo :&nbsp;</div>
        </td>
        <td align=CENTER > 
          <div align="left"> 
             <select id="comSelect" name="comSelect" >
             </select>
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:showPayMaintCom(document.forms[0].E03LCMACC.value,document.forms[0].comSelect.value)">
        </td>
      </tr>
    </table>
  </div>

<% if (iframe) { %>  
  <h4>
<%   if (readOnly) { %>
   Plan de Pagos Documentarias
<%   } else { %>    
   <a href="javascript:showPayMaint(document.forms[0].E03LCMACC.value)" ><b>Plan de Pagos Documentarias</b></a>
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
            <th align="center" nowrap width="04%">Nro.<br>Cuota</th>
            <th align="center" nowrap width="08%">Codigo</th>
            <th align="center" nowrap width="12%">Forma<br>Pago</th>
            <th align="center" nowrap width="08%">Fecha a<br>Pagar</th>
            <th align="center" nowrap width="11%">Monto</th>
            <th align="center" nowrap width="11%">IVA</th>
            <th align="center" nowrap width="12%">Estado</th>
            <th align="center" nowrap width="04%">Dias<br>Venc.</th>
            <th align="center" nowrap width="08%">Fecha<br>Pago</th>
            <th align="center" nowrap width="11%">Monto<br>Pago</th>
            <th align="center" nowrap width="11%">IVA<br>Pago</th>
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
      ELC508003Message datarec = (ELC508003Message) list.getRecord();
%>
            <% if (datarec.getE03DCCPFL().equals("")) out.print("<script>addComSelect('" + datarec.getE03DCCCDE() + "');</script>"); %>
            <tr id="dataTable<%= list.getCurrentRow() %>">
              <td nowrap align="center" width="04%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=datarec.getE03DCCSEQ()%></a></td>
              <td nowrap align="center" width="08%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=datarec.getE03DCCCDE()%></a></td>
              <td nowrap align="center" width="12%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)">
                <% if (datarec.getE03DCCPVI().equals("1")) out.print("APERTURA"); %>
                <% if (datarec.getE03DCCPVI().equals("2")) out.print("PLAN DE PAGOS"); %>
              </a></td>
              <td nowrap align="center" width="08%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)">
              <%= Util.formatCustomDate(currUser.getE01DTF(), datarec.getBigDecimalE03DCCPDM().intValue(), 
                  datarec.getBigDecimalE03DCCPDD().intValue(),
                  datarec.getBigDecimalE03DCCPDY().intValue())%>
              </a></td>
              <td nowrap align="right"  width="11%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=datarec.getE03DCCCAM()%></a></td>
              <td nowrap align="right"  width="11%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=datarec.getE03DCCIAM()%></a></td>
              <td nowrap align="center" width="12%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)">
                <% if (datarec.getE03DCCPFL().equals(""))  out.print("PENDIENTE"); %>
                <% if (datarec.getE03DCCPFL().equals("P")) out.print("PAGADA");    %>
                <% if (datarec.getE03DCCPFL().equals("A")) out.print("ANULADA");   %>
              </a></td> 
              <td nowrap align="center" width="04%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=datarec.getE03DCCDVE()%></a></td>              
              <td nowrap align="center" width="08%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)">
              <%= Util.formatCustomDate(currUser.getE01DTF(), datarec.getBigDecimalE03DCCPGM().intValue(), 
                  datarec.getBigDecimalE03DCCPGD().intValue(),
                  datarec.getBigDecimalE03DCCPGY().intValue())%>
              </a></td>
              <td nowrap align="right"  width="11%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=datarec.getE03DCCCPG()%></a></td>
              <td nowrap align="right"  width="11%"><a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=datarec.getE03DCCIPG()%></a></td>
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

<SCRIPT type="text/javascript">
  document.getElementById("hiddenDivNew").onclick=cancelBub;
</SCRIPT>

</body>
</html>

