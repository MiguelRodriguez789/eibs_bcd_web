<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL054601Message"%>

<html>
<head>
<title>Aprobacion de Excepciones GAC</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id= "EDL0546Help" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/graphical.js"> </SCRIPT>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/deleteLocalAuthorization.jsp"> </script>

<script language="JavaScript">

function setRow(table, row, opc) {
  highlightRow(table, row);
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
  }
}

function goAction(op) {
  document.forms[0].SCREEN.value = op;
  if ((op == '12') || (op == '13')) {
    if (op == '13') {
      if (confirm("Desea eliminar este registro seleccionado?")) {
        //enableDeleteAuthorization( ) ;
        document.forms[0].submit();
      }
    } else {
      document.forms[0].submit();    
    }
  } else {
    var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0546?SCREEN="+op+"&key="+getElementChecked('key').value;;
    CenterWindow(url, 1000, 400, 2);    
  }
}

</SCRIPT>  

</head>

<BODY>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Aprobacion de Excepciones GAC
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_aprob_tables.jsp, EDL0546"></h3>
<hr size="4">

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0546" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="12">
  <input type="HIDDEN" name="H01FLGMAS"  >
    
  
  <% if ( EDL0546Help.getNoResult() ) { %>
  <p>&nbsp;</p>
  <table class="tbenter" width="100%" >
    <tr>
      <td> 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr>
              <td >
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp" class="botonrojo"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
  <% } else { %>
  <p>&nbsp;</p>
  <table class="tbenter" width=100% align=center>
    <tr>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(12)"><b>Aprobar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a id="EIBSBTNDEL" href="javascript:goAction(13);" ><b>Borrar</b></a></div>
      </td>
      
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>      
    </tr>
  </table>
   
  <br>
  <table id="mainTable" class="tableinfo" style="height:400px;">
    <tr height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%">Tipo</th>
            <th align=CENTER nowrap width="10%">Codigo</th>
            <th align=CENTER nowrap width="50%">Descripcion</th>
            <th align=CENTER nowrap width="20%">Estado</th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="95%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:400px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             EDL0546Help.initRow();
             boolean firstTime = true;
             String chk = "";
             while (EDL0546Help.getNextRow()) {
               if (firstTime) {
                 firstTime = false;
                 chk = "checked";
               } else {
                 chk = "";
               }  
               EDL054601Message list = (EDL054601Message) EDL0546Help.getRecord();
          %>
            <tr id="dataTable<%=EDL0546Help.getCurrentRow()%>">
              <td nowrap align="center" width="10%"><input type="radio" name="key" value="<%=EDL0546Help.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%=EDL0546Help.getCurrentRow()%>)" /></td>
              <td nowrap align="center" width="10%"><a href="javascript:setRow('dataTable',<%=EDL0546Help.getCurrentRow()%>,'24')">
              <% if (list.getField("E01EXCTYP").getString().equals("01")) {
                   out.print(Util.formatCell(list.getE01EXCPRO().trim()));
                 } else if (list.getField("E01EXCTYP").getString().equals("02")) {
                   out.print(Util.formatCell(list.getE01EXCCUN().trim()));
                 } else {
                   out.print(Util.formatCell(list.getE01EXCACC().trim()));
                 }
              %>
              </td>
              <td nowrap align="center" width="10%"><a href="javascript:setRow('dataTable',<%=EDL0546Help.getCurrentRow()%>,'24')">
              <% if (list.getField("E01EXCTYP").getString().equals("01")) {
                   out.print(Util.formatCell("Producto"));
                 } else if (list.getField("E01EXCTYP").getString().equals("02")) {
                   out.print(Util.formatCell("Cliente"));
                 } else {
                   out.print(Util.formatCell("Cuenta"));
                 }
              %>
              </td>
              <td nowrap align="left" width="50%"><a href="javascript:setRow('dataTable',<%=EDL0546Help.getCurrentRow()%>,'24')"><%=list.getE01EXCDSC()%></td>
              <td nowrap align="center" width="20%"><a href="javascript:setRow('dataTable',<%=EDL0546Help.getCurrentRow()%>,'203')">
              <% if (list.getField("E01EXCSTS").getString().equals("A")) {
                   out.print(Util.formatCell("Activo"));
                 } else if (list.getField("E01EXCSTS").getString().equals("")) {
                   out.print(Util.formatCell("Nuevo"));
                 } else if (list.getField("E01EXCSTS").getString().equals("D")) {
                   out.print(Util.formatCell("Por Borrar"));
                 } else if (list.getField("E01EXCSTS").getString().equals("M")) {
                   out.print(Util.formatCell("Modificado"));  
                 } 
              %>
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

  <% } %>

<SCRIPT language="JavaScript">
  showChecked("key");
</SCRIPT>

</form>
</body>
</html>
