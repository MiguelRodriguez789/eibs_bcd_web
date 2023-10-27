<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL054001Message"%>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Tablas de Cuentas de Revelacion</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id= "EDL0540Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

function closeHiddenDivNew(){
  setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
  evt = (evt) ? evt : ((window.event) ? window.event : "");
   
  var hiddenDivNew = getElement("hiddenDivNew");

  var y=evt.clientY + document.body.scrollTop;
  var x=evt.clientX + document.body.scrollLeft;
     
  cancelBub(evt);

  moveElement(hiddenDivNew, y, x);
  setVisibility(hiddenDivNew, "visible");
}

document.onclick= closeHiddenDivNew;

function goAction(op) {
  document.forms[0].SCREEN.value = op;
  if (op == '3') {
    if (confirm("Desea eliminar este registro seleccionado?")) {
      enableDeleteAuthorization( ) ;
    }
  } else {
    document.forms[0].submit();    
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

<h3 align="center">Tablas de Cuentas de Revelacion
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_sel_tables.jsp, EDL0540"></h3>
<hr size="4">

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0540" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="2">
  <input type="HIDDEN" name="H02FLGMAS"  >
    
  <div id="hiddenDivNew" class="hiddenDiv">
    <%int row = 0; %>
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
      border-color: #0b23b5;
      border-style : solid solid solid solid;
      filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Banco :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TABLE" size="4" maxlength="2" value="<%= userPO.getHeader1().trim()%>" readonly>
          </div>
        </td>
      </tr>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Moneda:</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01DLVTYP" name="E01DLVTYP" size="4" maxlength="2" readonly >
            <a href="javascript:GetCurrency('E01DLVTYP','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a>
          </div>
        </td>
      </tr>
      <%--
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Tipo de Producto :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TABLE" readonly size="4" maxlength="4" value="<%= userPO.getHeader2().trim()%>" readonly>
          </div>
        </td>
      </tr>
      --%>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">C&oacute;digo de Tabla :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01DLVTBL" name="E01DLVTBL" size="4" maxlength="2">
          </div>
        </td>
      </tr>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(1)">
        </td>
      </tr>
    </table>
  </div>

  <% if ( EDL0540Help.getNoResult() ) { %>
  <p>&nbsp;</p>
  <table class="tbenter" width="100%" >
    <tr>
      <td> 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr>
              <% if( !"1".equals( currUser.getH01WK1() ) ){ %>
              <td class=TDBKG>
                <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
              </td>
              <% } %>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
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
      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Consultar</b></a></div>
      </td>     
      <% } else { %>
      <td class=TDBKG width="25%"> 
        <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a id="EIBSBTNDEL" href="javascript:goAction(3);" ><b>Borrar</b></a></div>
      </td>
      <% } %>
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
            <%if(!userPO.getHeader3().equals("0")){ %>
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%">Codigo de <br> Tabla</th>
            <th align=CENTER nowrap width="50%">Descripci&oacute;n</th>
            <th align=CENTER nowrap width="15%">Tipo de Producto</th>
            <th align=CENTER nowrap width="15%">Cliente</th>
            <%}else{ %>
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%">Codigo de <br> Tabla</th>
            <th align=CENTER nowrap width="10%">Moneda</th>
            <th align=CENTER nowrap width="50%">Descripci&oacute;n</th>
           
            <% } %>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="95%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:400px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             EDL0540Help.initRow();
             boolean firstTime = true;
             String chk = "";
             while (EDL0540Help.getNextRow()) {
               if (firstTime) {
                 firstTime = false;
                 chk = "checked";
               } else {
                 chk = "";
               }  
               EDL054001Message list = (EDL054001Message) EDL0540Help.getRecord();
          %>
            <tr id="dataTable<%=EDL0540Help.getCurrentRow()%>">
              <td nowrap align="center" width="10%"> <input type="radio" name="key" value="<%=EDL0540Help.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%=EDL0540Help.getCurrentRow()%>)" /></td>
              <td nowrap align="center" width="10%"><a href="javascript:goAction('2');"><%=list.getE01DLVTBL()%></a></td>
              <td nowrap align="center" width="10%"><a href="javascript:goAction('2');"><%=list.getE01DLVTYP()%></a></td>
              <td nowrap align="left" width="50%"><a href="javascript:goAction('2');"><%=list.getE01DLVDSC()%></a></td>
              
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

</form>

<script type="text/javascript">
  showChecked("key");
  getElement("hiddenDivNew").onclick=cancelBub;
  getElement("eibsNew").onclick=showHiddenDivNew;
</script>

</body>
</html>
