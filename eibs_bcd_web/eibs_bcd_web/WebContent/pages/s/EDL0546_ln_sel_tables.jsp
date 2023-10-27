<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL054601Message"%>

<html>
<head>
<title>Tabla de Excepciones GAC</title>
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
      //enableDeleteAuthorization( ) ;
      document.forms[0].submit();
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

<h3 align="center">Tabla de Excepciones GAC
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_sel_tables.jsp, EDL0546"></h3>
<hr size="4">

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0546" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="2">
  <input type="HIDDEN" name="H01FLGMAS"  >
    
  <div id="hiddenDivNew" class="hiddenDiv">
    <%int row = 0; %>
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
      border-color: #0b23b5;
      border-style : solid solid solid solid;
      filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Tipo :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TABLE" size="4" maxlength="2" value="<%= userPO.getType().trim()%>" readonly>
          </div>
        </td>
      </tr>
        <% if( "01".equals( userPO.getType() ) ){ %> 
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">C&oacute;digo de Producto :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01EXCPRO" name="E01EXCPRO" size="5" maxlength="4">
            <a href="javascript:GetProduct('E01EXCPRO','10','<%=currUser.getE01UBK()%>','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
          </div>
        </td>
      </tr>
      <% } else if( "02".equals( userPO.getType() ) ){ %>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">C&oacute;digo de Cliente :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01EXCCUN" name="E01EXCCUN" size="10" maxlength="9">
            <a href="javascript:GetCustomer('E01EXCCUN')">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
          </div>
        </td>
      </tr>
      <% } else if( "03".equals( userPO.getType() ) ){ %>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">N&uacute;mero de Cuenta :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01EXCACC" name="E01EXCACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>">
            <a href="javascript:GetAccount('E01EXCACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
          </div>
        </td>
      </tr>
      <% } %>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Porcentaje aplicar :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01EXCPOR" name="E01EXCPOR" size="5" maxlength="5" onKeypress="enterDecimal(event)">
          </div>
        </td>
      </tr>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Fecha de Vigencia :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01EXCMAD" name="E01EXCMAD" size="2" maxlength="2">
            <input type="text" id="E01EXCMAM" name="E01EXCMAM" size="2" maxlength="2">
            <input type="text" id="E01EXCMAM" name="E01EXCMAY" size="4" maxlength="4">
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

  <% if (EDL0546Help.getNoResult()) { %>
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
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%">Tipo</th>
            <th align=CENTER nowrap width="10%">Codigo</th>
            <%if(userPO.getType().equals("01")){ %>
            <th align=CENTER nowrap width="50%">Descripcion del Producto</th>
            <%}else if(userPO.getType().equals("02")){ %>
            <th align=CENTER nowrap width="50%">Nombre del Cliente</th>
            <%}else if(userPO.getType().equals("03")){ %>
            <th align=CENTER nowrap width="50%">Nombre de la Cuenta</th>
            <% } %>
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
              <td nowrap align="center" width="10%"> <input type="radio" name="key" value="<%=EDL0546Help.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%=EDL0546Help.getCurrentRow()%>)" /></td>
              <td nowrap align="center" width="10%">
              <% if (list.getField("E01EXCTYP").getString().equals("01")) {
                   out.print(Util.formatCell("Producto"));
                 } else if (list.getField("E01EXCTYP").getString().equals("02")) {
                   out.print(Util.formatCell("Cliente"));
                 } else  {out.print(Util.formatCell("Cuenta")); }
              %>
              </td>
              <td nowrap align="center" width="10%">
              <% if (list.getField("E01EXCTYP").getString().equals("01")) {
                   out.print(list.getE01EXCPRO().trim());
                 } else if (list.getField("E01EXCTYP").getString().equals("02")) {
                   out.print(list.getE01EXCCUN().trim());
                 } else {
                   out.print(list.getE01EXCACC().trim()); 
                 }
              %>
              </td>
              <td nowrap align="left" width="50%"><%=list.getE01EXCDSC()%></td>
              <td nowrap align="center" width="20%"><% if (list.getField("E01EXCSTS").getString().equals("A")) {
                        out.print(Util.formatCell("Activo"));
                      } else if (list.getField("E01EXCSTS").getString().equals("")) {
                        out.print(Util.formatCell("Nuevo"));
                      } else if (list.getField("E01EXCSTS").getString().equals("D")) {
                        out.print(Util.formatCell("Por Borrar"));
                      } else if (list.getField("E01EXCSTS").getString().equals("M")) {
                        out.print(Util.formatCell("Modificado"));  
                      } %>
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
  getElement("hiddenDivNew").onclick=cancelBub;
  getElement("eibsNew").onclick=showHiddenDivNew;
</SCRIPT>

</form>
</body>
</html>
