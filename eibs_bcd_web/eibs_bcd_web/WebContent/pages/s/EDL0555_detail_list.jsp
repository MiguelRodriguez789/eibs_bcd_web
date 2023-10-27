<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055504Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html> 
<head>
<title>Seguros</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EDL055504Lst" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
  if ((op != '200') && (!isValidObject(getElement("key")))) {
    alert("Debe seleccionar un registro.");
    return;
  }
  if ((op == '202') || (op == '300')) {
    if (op == '202') chk = confirm("Desea eliminar el registro seleccionado?");
    if (op == '300') chk = confirm("Desea desmarcar el registro seleccionado?");
    if (!chk) return;
    getElement("SCREEN").value = op;
    document.forms[0].submit();  
  } else {
    var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555?SCREEN="+op;
    if (op != '200') {
      url += "&key=" + getElementChecked('key').value;
    }
    CenterWindow(url, 1000, 500, 2);    
  }
  hideMenu();
}

function updateTotal() {  
  var am = ["DLNAM1","DLNAM2","DLNAM3","DLNAM4","DLNAM5","DLNAM6","DLNAMH","DLNAMI","DLNAMJ"];
  var cd = ["DLNCD1","DLNCD2","DLNCD3","DLNCD4","DLNCD5","DLNCD6","DLNCDH","DLNCDI","DLNCDJ"];
  var to = ["DLNTO1","DLNTO2","DLNTO3","DLNTO4","DLNTO5","DLNTO6","DLNTOH","DLNTOI","DLNTOJ"];
  try {
    <%--Update Values in Distribution Section, Argument Notifies that Seguro called the function. --%>    
    // Endeudamiento
    for (i = 0; i < am.length; i++) {
      if (isValidObject(parent.document.getElementById("E05"+am[i])) && isValidObject(getElement(am[i]))) {
        parent.document.forms[0]["E05"+am[i]].value = formatCCY(parseFloat(getElement(am[i]).value).round(2));
      }
    }
    // Valor Descuento
    for (i = 0; i < cd.length; i++) {
      if (isValidObject(parent.document.getElementById("E05"+cd[i])) && isValidObject(getElement(cd[i]))) {
        parent.document.forms[0]["E05"+cd[i]].value = formatCCY(parseFloat(getElement(cd[i]).value).round(2));
      }
    }
    // Valor a Pagar
    for (i = 0; i < to.length; i++) {
      if (isValidObject(parent.document.getElementById("E05"+to[i])) && isValidObject(getElement(to[i]))) {
        parent.document.forms[0]["E05"+to[i]].value = formatCCY(parseFloat(getElement(to[i]).value).round(2));
      }
    }
  } catch(e) {
     scriptLog("updateTotal: "+ e, false);
  }
}

function hideMenu() {
  if(isValidObject(document.getElementById("menuNG"))){
    if (document.getElementById("menuNG").style.display == 'none') {
      document.getElementById("menuNG").style.display = '';
      resizeIFrame(true);
    } else {
      document.getElementById("menuNG").style.display = 'none';
      resizeIFrame(false);
    }
  }
}

function showMenu(firstTime) {
  if(isValidObject(document.getElementById("menuNG") && !firstTime)){
    if (document.getElementById("menuNG").style.display == 'none') {
      document.getElementById("menuNG").style.display = '';
      resizeIFrame(true);
    } 
  }
}


function resizeIFrame(lMenu) {
  var nHeight = 0;  
  var nMenu = 60;
  if (isValidObject(parent.document.getElementById("ifrempng"))) {
    nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
  }
  if (nHeight > 0) {
    nHeight = lMenu ? nHeight + nMenu : nHeight;
    parent.document.getElementById("ifrempng").height = nHeight;
  }  
}

function setRow(table, row, opc) {
  // Selecciona la fila
  highlightRow(table, row);
  // Marca el radio
  var ctrl = document.forms[0].key;
  if (!ctrl) return;
  var ctrlLen = ctrl.length;
  if (ctrlLen == undefined) {
    ctrl.checked = (ctrl.value == row.toString());
  }
  for (var i = 0; i < ctrlLen; i++) {
    ctrl[i].checked = false;
    if (ctrl[i].value == row.toString()) {
      ctrl[i].checked = true;
    }
  }
  // goAction
  if (opc != undefined) {
    goAction(opc);
    if (isValidObject(document.getElementById("menuNG"))) {
      document.getElementById("menuNG").style.display = 'none';
    }
  }
}

</script>

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
<%
  //si es blanco viene llamado por menu, sino viene llamdo desde la una pantalla 
  //Determines if a Header is Shown. 
  String emp = (String)session.getAttribute("EMPNG");
   emp = (emp==null)?"":emp;
%>
<% if ("".equals(emp)){ %>
<h3 align="center">Listado de Negociacion<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="seguros_list.jsp,EDL0555"></h3>
<hr size="4">
<% } %>
<form method="POST"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555">
  <input type="hidden" name="SCREEN" id="SCREEN" value="403">
  <input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value=""> 

  <% if ("".equals(emp)){ %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
            <td nowrap width="10%" align="right"> Cliente : </td>
            <td nowrap width="10%" align="left">
              <eibsinput:text name="userPO" property="cusNum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right"> Propuesta : </td>
            <td nowrap width="50%"align="left">
              <input type="text" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table class="tbenter" style="width: 1040px">
    <tr>
      <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('402')"> <b>Simular</b> </a></td> 
      <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('403')"> <b>Negociacion</b> </a></td>
    </tr>
  </table>
  <% } else if ("A".equals(emp)){ %>
  <input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
  <input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>    
  <h4>Negociacion</h4>
  <% } else { %>
  <input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
  <input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>    
  <a href="#" onclick="hideMenu();"><b>Negociacion</b></a>
  <br><br>
  <table id="menuNG" class="tbenter" width="100%">
    <tr>
      <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('402')"> <b>Simular</b> </a></td> 
      <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('403')"> <b>Negociacion</b> </a></td>
    </tr>
  </table>
  <% } %>  
  
  <table id="mainTable" class="tableinfo" style="height:80px;" width="100%">
    <tr height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align="center" nowrap width="2%" ></th>
            <th align="center" nowrap width="9%">Cuenta</th>
            <th align="center" nowrap width="9%">Fecha<br>Calculo</th>
            <th align="center" nowrap width="9%">Capital<br>Total</th>
            <th align="center" nowrap width="9%">Capital<br>Vencido</th>
            <th align="center" nowrap width="9%">Interes<br>Vigente</th>
            <th align="center" nowrap width="9%">Interes<br>Contingente</th>
            <th align="center" nowrap width="9%">Mora<br>Vigente</th>
            <th align="center" nowrap width="9%">Mora<br>Contingente</th>
            <th align="center" nowrap width="9%">Otros</th>
            <th align="center" nowrap width="9%">Saldos<br>Totales</th>
          </tr>
        </table>
      </td>
    </tr>
    <tr height="95%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:80px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             double amtCto = 0; double amtCve = 0; double amtIvg = 0; double amtIcg = 0; double amtMvg = 0; double amtMcg = 0; double amtOtr = 0; double amtTve = 0; double amtTen = 0;
             double cndCto = 0; double cndCve = 0; double cndIvg = 0; double cndIcg = 0; double cndMvg = 0; double cndMcg = 0; double cndOtr = 0; double cndTve = 0; double cndTen = 0;
             double totCto = 0; double totCve = 0; double totIvg = 0; double totIcg = 0; double totMvg = 0; double totMcg = 0; double totOtr = 0; double totTve = 0; double totTen = 0;
             EDL055504Lst.initRow();
             int k = 0;
             boolean firstTime = true;
             String chk = "";
             while (EDL055504Lst.getNextRow()) {
               if (firstTime) {
                 firstTime = false;
                 chk = "checked";
               } else {
                 chk = "";
               }
               EDL055504Message dataLst = (EDL055504Message) EDL055504Lst.getRecord();
               amtCto += dataLst.getBigDecimalE04DLNAM1().doubleValue();
               amtCve += dataLst.getBigDecimalE04DLNAM2().doubleValue();
               amtIvg += dataLst.getBigDecimalE04DLNAM3().doubleValue();
               amtIcg += dataLst.getBigDecimalE04DLNAM4().doubleValue();
               amtMvg += dataLst.getBigDecimalE04DLNAM5().doubleValue();
               amtMcg += dataLst.getBigDecimalE04DLNAM6().doubleValue();
               amtOtr += dataLst.getBigDecimalE04DLNAMH().doubleValue();
               amtTve += dataLst.getBigDecimalE04DLNAMI().doubleValue();
               amtTen += dataLst.getBigDecimalE04DLNAMJ().doubleValue();
               cndCto += dataLst.getBigDecimalE04DLNCD1().doubleValue();
               cndCve += dataLst.getBigDecimalE04DLNCD2().doubleValue();
               cndIvg += dataLst.getBigDecimalE04DLNCD3().doubleValue();
               cndIcg += dataLst.getBigDecimalE04DLNCD4().doubleValue();
               cndMvg += dataLst.getBigDecimalE04DLNCD5().doubleValue();
               cndMcg += dataLst.getBigDecimalE04DLNCD6().doubleValue();
               cndOtr += dataLst.getBigDecimalE04DLNCDH().doubleValue();
               cndTve += dataLst.getBigDecimalE04DLNCDI().doubleValue();
               cndTen += dataLst.getBigDecimalE04DLNCDJ().doubleValue();
               totCto += dataLst.getBigDecimalE04DLNTO1().doubleValue();
               totCve += dataLst.getBigDecimalE04DLNTO2().doubleValue();
               totIvg += dataLst.getBigDecimalE04DLNTO3().doubleValue();
               totIcg += dataLst.getBigDecimalE04DLNTO4().doubleValue();
               totMvg += dataLst.getBigDecimalE04DLNTO5().doubleValue();
               totMcg += dataLst.getBigDecimalE04DLNTO6().doubleValue();
               totOtr += dataLst.getBigDecimalE04DLNTOH().doubleValue();
               totTve += dataLst.getBigDecimalE04DLNTOI().doubleValue();
               totTen += dataLst.getBigDecimalE04DLNTOJ().doubleValue();
          %>
            <tr id="dataTable<%= EDL055504Lst.getCurrentRow() %>">
              <td nowrap align="center" width="2%"><input type="radio" name="key"  value="<%=EDL055504Lst.getCurrentRow()%>" <%=chk%> class="highlight" onClick="showMenu(false);highlightRow('dataTable', <%= EDL055504Lst.getCurrentRow() %>)"/></td>
              <td nowrap align="right"  width="9%"><a href="javascript:setRow('dataTable',<%=EDL055504Lst.getCurrentRow()%>,'405')"><%=dataLst.getE04DLNACC()%></a></td>
              <td nowrap align="right"  width="9%"><a href="javascript:setRow('dataTable',<%=EDL055504Lst.getCurrentRow()%>,'405')"><%=Util.formatCustomDate(currUser.getE01DTF(), dataLst.getBigDecimalE04DLNSIM().intValue(),dataLst.getBigDecimalE04DLNSID().intValue(),dataLst.getBigDecimalE04DLNSIY().intValue()) %></a></td>
              <td nowrap align="right"  width="9%"><a href="javascript:setRow('dataTable',<%=EDL055504Lst.getCurrentRow()%>,'405')"><%=dataLst.getE04DLNAM1()%></a></td>
              <td nowrap align="right"  width="9%"><a href="javascript:setRow('dataTable',<%=EDL055504Lst.getCurrentRow()%>,'405')"><%=dataLst.getE04DLNAM2()%></a></td>
              <td nowrap align="right"  width="9%"><a href="javascript:setRow('dataTable',<%=EDL055504Lst.getCurrentRow()%>,'405')"><%=dataLst.getE04DLNAM3()%></a></td>
              <td nowrap align="right"  width="9%"><a href="javascript:setRow('dataTable',<%=EDL055504Lst.getCurrentRow()%>,'405')"><%=dataLst.getE04DLNAM4()%> </a></td>
              <td nowrap align="right"  width="9%"><a href="javascript:setRow('dataTable',<%=EDL055504Lst.getCurrentRow()%>,'405')"><%=dataLst.getE04DLNAM5()%> </a></td>
              <td nowrap align="right"  width="9%"><a href="javascript:setRow('dataTable',<%=EDL055504Lst.getCurrentRow()%>,'405')"><%=dataLst.getE04DLNAM6()%> </a></td>
              <td nowrap align="right"  width="9%"><a href="javascript:setRow('dataTable',<%=EDL055504Lst.getCurrentRow()%>,'405')"><%=dataLst.getE04DLNAMH()%> </a></td>
              <td nowrap align="right"  width="9%"><a href="javascript:setRow('dataTable',<%=EDL055504Lst.getCurrentRow()%>,'405')"><%=dataLst.getE04DLNAMJ()%> </a></td>
            </tr>                                                                                                                                   
          <% } %>
           </table>
         </div>
         <input type="hidden" name="DLNAM1" id="DLNAM1" value="<%= Util.formatCCY(amtCto)%>">
         <input type="hidden" name="DLNAM2" id="DLNAM2" value="<%= Util.formatCCY(amtCve)%>">
         <input type="hidden" name="DLNAM3" id="DLNAM3" value="<%= Util.formatCCY(amtIvg)%>">
         <input type="hidden" name="DLNAM4" id="DLNAM4" value="<%= Util.formatCCY(amtIcg)%>">
         <input type="hidden" name="DLNAM5" id="DLNAM5" value="<%= Util.formatCCY(amtMvg)%>">
         <input type="hidden" name="DLNAM6" id="DLNAM6" value="<%= Util.formatCCY(amtMcg)%>">
         <input type="hidden" name="DLNAMH" id="DLNAMH" value="<%= Util.formatCCY(amtOtr)%>">
         <input type="hidden" name="DLNAMI" id="DLNAMI" value="<%= Util.formatCCY(amtTve)%>">
         <input type="hidden" name="DLNAMJ" id="DLNAMJ" value="<%= Util.formatCCY(amtTen)%>">
         <input type="hidden" name="DLNCD1" id="DLNCD1" value="<%= Util.formatCCY(cndCto)%>">
         <input type="hidden" name="DLNCD2" id="DLNCD2" value="<%= Util.formatCCY(cndCve)%>">
         <input type="hidden" name="DLNCD3" id="DLNCD3" value="<%= Util.formatCCY(cndIvg)%>">
         <input type="hidden" name="DLNCD4" id="DLNCD4" value="<%= Util.formatCCY(cndIcg)%>">
         <input type="hidden" name="DLNCD5" id="DLNCD5" value="<%= Util.formatCCY(cndMvg)%>">
         <input type="hidden" name="DLNCD6" id="DLNCD6" value="<%= Util.formatCCY(cndMcg)%>">
         <input type="hidden" name="DLNCDH" id="DLNCDH" value="<%= Util.formatCCY(cndOtr)%>">
         <input type="hidden" name="DLNCDI" id="DLNCDI" value="<%= Util.formatCCY(cndTve)%>">
         <input type="hidden" name="DLNCDJ" id="DLNCDJ" value="<%= Util.formatCCY(cndTen)%>">
         <input type="hidden" name="DLNTO1" id="DLNTO1" value="<%= Util.formatCCY(totCto)%>">
         <input type="hidden" name="DLNTO2" id="DLNTO2" value="<%= Util.formatCCY(totCve)%>">
         <input type="hidden" name="DLNTO3" id="DLNTO3" value="<%= Util.formatCCY(totIvg)%>">
         <input type="hidden" name="DLNTO4" id="DLNTO4" value="<%= Util.formatCCY(totIcg)%>">
         <input type="hidden" name="DLNTO5" id="DLNTO5" value="<%= Util.formatCCY(totMvg)%>">
         <input type="hidden" name="DLNTO6" id="DLNTO6" value="<%= Util.formatCCY(totMcg)%>">
         <input type="hidden" name="DLNTOH" id="DLNTOH" value="<%= Util.formatCCY(totOtr)%>">
         <input type="hidden" name="DLNTOI" id="DLNTOI" value="<%= Util.formatCCY(totTve)%>">
         <input type="hidden" name="DLNTOJ" id="DLNTOJ" value="<%= Util.formatCCY(totTen)%>">
     </tr>
  </table>

</form>
<%-- Server sends "S" in "ACT" to signify change in iframe section. 
	 Frame calls to upate Distribution in parent.
	 *Note only Values paid through "Desembolso are reflected.
 --%>
<% if ("S".equals(request.getAttribute("ACT"))){ %>
<SCRIPT type="text/javascript">
	updateTotal();	   	   
</SCRIPT>
<% } %>

<SCRIPT type="text/javascript">
  updateTotal();	   	 
  showChecked("key");  
  <%-- CSS of Iframe. Adjusts Height of frame. --%>
  if (isValidObject(document.getElementById("menuNG"))) document.getElementById("menuNG").style.display = 'none';
  if (isValidObject(parent.document.getElementById("ifrempng"))) {
    document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempng").height;
  }  
</SCRIPT>

</body>
</html>
    