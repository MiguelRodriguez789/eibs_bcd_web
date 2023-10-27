<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL054502Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html> 
<head>
<title>Detalle Tabla</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EDL054502ListMU" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="EDL054502ListRE" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
  if ((op != '1200') && (!isValidObject(getElement("key")))) {
    alert("Debe seleccionar un registro.");
    return;
  }
  if (op == '1202') {
    if (op == '1202') chk = confirm("Desea eliminar el registro seleccionado?");
    if (!chk) return;
  } else {
    getElement("E02CSTRCD").value = getCode();
  }
  getElement("SCREEN").value = op;
  document.forms[0].submit();  
  hideMenu();
}

function getCode() {
  var code = getElement("CODE").value;
  if (getElement("E02CSTREG").value == ('MU')) {
    code = getElement("DPTO").value + getElement("CDAD").value;
  }
  return code;
}

function hideMenu() {
  if (isValidObject(document.getElementById("menu"))){
    if (document.getElementById("menu").style.display == 'none') {
      document.getElementById("menu").style.display = '';
      resizeIFrame(true);
    } else {
      document.getElementById("menu").style.display = 'none';
      resizeIFrame(false);
    }
  }
}

function showMenu(firstTime) {
  if(isValidObject(document.getElementById("menu") && !firstTime)){
    if (document.getElementById("menu").style.display == 'none') {
      document.getElementById("menu").style.display = '';
      resizeIFrame(true);
    } 
  }
}

function resizeIFrame(lMenu) {
  var nHeight = 0;  
  var nMenu = 60;
  var nMenu = 60;
  var sIfrm = "";
  if (getElement("E02CSTREG").value == ('MU')) {
    sIfrm = "ifrMU";
  }
  if (getElement("E02CSTREG").value == ('RE')) {
    sIfrm = "ifrRE";
  }
  if (isValidObject(parent.document.getElementById(sIfrm))) {
    nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
  }
  if (nHeight > 0) {
    nHeight = lMenu ? nHeight + nMenu : nHeight;
    if (isValidObject(parent.document.getElementById(sIfrm))) {
      parent.document.getElementById(sIfrm).height = nHeight;
    }
  }  
}

function setRow(table, row, cod) {
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
  // Asigna Codigo
  getElement("E02CSTRCD").value = cod;
}

function closeHiddenDivNew(){
  setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
  evt = (evt) ? evt : ((window.event) ? window.event : "");
  var hiddenDivNew = document.getElementById("hiddenDivNew");
  var y=evt.clientY + document.body.scrollTop;
  var x=evt.clientX + document.body.scrollLeft;
  cancelBub(evt);
  moveElement(hiddenDivNew, y, x);
  setVisibility(hiddenDivNew, "visible");
}

addEventHandler(document, 'click' , closeHiddenDivNew);

</script>

</head>

<%
  String prodCode = "";
  String type = "";
  String title = "";

  if (request.getParameter("prodCode") != null) {
    prodCode = request.getParameter("prodCode");  // MU=Municipios RE=FuenteDeRecursos
  }
  if (request.getParameter("type") != null) {
    type = request.getParameter("type");      
  }
  
  if (prodCode.equals("MU")) {
    title = "Municipios";
  } else if (prodCode.equals("RE")){
    title = "Fuente de Recursos";
  } else {
    title = "Otro";
  }
%>


<body>
<% 
  if ( !error.getERRNUM().equals("0")  ) {
    error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println("  showErrors()");
    out.println("</SCRIPT>");
  }
%>
<form method="POST"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0545">
  <input type="hidden" name="SCREEN"    id="SCREEN" value="1201">
  <input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value=""> 
  <input type="hidden" name="E02CSTREG" id="E02CSTREG" value="<%=prodCode%>"> 
  <input type="hidden" name="E02CSTTYP" id="E02CSTTYP" value="<%=type%>"> 
  <input type="hidden" name="E02CSTRCD" id="E02CSTRCD" value=""> 

  <div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
    border-color: #0b23b5;
    border-style : solid solid solid solid;
    filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="100px"> 
          <div align="right">Nuevo Codigo :</div>
        </td>
        <td align=CENTER width="100px"> 
          <div align="left"> 
            <% if (prodCode.equals("MU")) { %>
            <input type="hidden" id="CODE" name="CODE" size="6" maxlength="5">
            <input type="text"   id="DPTO" name="DPTO" size="3" maxlength="2">
            <a href="javascript:Get2FilterCodes('DPTO','','27', '','CO')" >
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
            </a>
            <input type="text"   id="CDAD" name="CDAD" size="4" maxlength="3">
            <a href="javascript:Get2FilterCodes('CDAD','','84', '',document.forms[0]['DPTO'].value)" >
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
            </a>
            <% } %>
            <% if (prodCode.equals("RE")) { %>
            <input type="text" id="CODE" name="CODE" size="5" maxlength="4">
            <a href="javascript:GetCodeDescCNOFC('CODE','','RS')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
            </a>
            <% } %>
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('1200')">
        </td>
      </tr>
    </table>
  </div>

  <a href="#" onclick="hideMenu();"><b><%=title%></b></a>
  <br><br>
  <table id="menu" class="tbenter" width="100%">
    <tr>
      <td align="center" id="newDetail" class="tdbkg" width="50%"><b>Crear</b></td> 
      <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('1202')"><b>Borrar</b></a></td> 
    </tr>
  </table>

  <table id="mainTable" class="tableinfo" style="height:80px;" width="100%">
    <tr height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align="center" nowrap width="2%" ></th>
            <th align="center" nowrap width="8%" >Codigo</th>
            <th align="center" nowrap width="18%">Descripcion</th>
          </tr>
        </table>
      </td>
    </tr>
    <tr height="95%">    
      <td nowrap="nowrap">      
        <div id="dataDiv" style="height:80px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             if (prodCode.equals("MU")) {
               EDL054502ListMU.initRow();
               int k = 0;
               boolean firstTime = true;
               String chk = "";
               while (EDL054502ListMU.getNextRow()) {
                 if (firstTime) {
                   firstTime = false;
                   chk = "checked";
                 } else {
                   chk = "";
                 }
                 EDL054502Message convObj = (EDL054502Message) EDL054502ListMU.getRecord();
          %>
            <tr id="dataTable<%=EDL054502ListMU.getCurrentRow() %>">
              <td nowrap align="center" width="2%" ><input type="radio" name="key" value="<%=EDL054502ListMU.getCurrentRow()%>" <%=chk%> class="highlight" onClick="showMenu(false);setRow('dataTable',<%=EDL054502ListMU.getCurrentRow()%>,'<%=convObj.getE02CSTRCD()%>')"/></td>
              <td nowrap align="center" width="8%" ><%=convObj.getE02CSTRCD()%></td>
              <td nowrap align="left"   width="18%"><%=convObj.getE02CSTDSC()%></td>
            </tr>
          <%   
               }
             } 
          %>
          <%
             if (prodCode.equals("RE")) {
               EDL054502ListRE.initRow();
               int k = 0;
               boolean firstTime = true;
               String chk = "";
               while (EDL054502ListRE.getNextRow()) {
                 if (firstTime) {
                   firstTime = false;
                   chk = "checked";
                 } else {
                   chk = "";
                 }
                 EDL054502Message convObj = (EDL054502Message) EDL054502ListRE.getRecord();
          %>
            <tr id="dataTable<%=EDL054502ListRE.getCurrentRow() %>">
              <td nowrap align="center" width="2%" ><input type="radio" name="key" value="<%=EDL054502ListRE.getCurrentRow()%>" <%=chk%> class="highlight" onClick="showMenu(false);setRow('dataTable',<%=EDL054502ListRE.getCurrentRow()%>,'<%=convObj.getE02CSTRCD()%>')"/></td>
              <td nowrap align="center" width="8%" ><%=convObj.getE02CSTRCD()%></td>
              <td nowrap align="left"   width="18%"><%=convObj.getE02CSTDSC()%></td>
            </tr>
          <%   
               }
             } 
          %>
           </table>
         </div>
       </td>
     </tr>
  </table>


</form>

<SCRIPT type="text/javascript">
  showChecked("key");  
  <%-- CSS of Iframe. Adjusts Height of frame. --%>
  if (isValidObject(document.getElementById("menu"))) document.getElementById("menu").style.display = 'none';
  if (isValidObject(parent.document.getElementById("ifrMU"))) {
    document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrMU").height;
  }  
  if (isValidObject(parent.document.getElementById("ifrRE"))) {
    document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrRE").height;
  }  
  document.getElementById("hiddenDivNew").onclick = cancelBub;
  document.getElementById("newDetail").onclick = showHiddenDivNew;  
</SCRIPT>

</body>
</html>
