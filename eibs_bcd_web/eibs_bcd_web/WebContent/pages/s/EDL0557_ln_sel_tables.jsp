<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055701Message"%>

<html>
<head>
<title>Tabla de Excepciones Ingreso de Creditos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id= "EDL0557Help" class= "datapro.eibs.beans.JBObjList" scope="session" />
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

<h3 align="center">Tabla de Excepciones Ingreso de Creditos
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_sel_tables.jsp, EDL0557"></h3>
<hr size="4">

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0557" >
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
            <input type="text" name="TABLE" size="4" maxlength="2" value="<%= userPO.getHeader1().trim()%>" readonly>
          </div>
        </td>
      </tr>
        <% if( "02".equals( userPO.getHeader1() ) ){ %> 
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">C&oacute;digo de Producto :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01EXIPRO" name="E01EXIPRO" size="5" maxlength="4">
            <a href="javascript:GetProduct('E01EXIPRO','10','<%=currUser.getE01UBK()%>','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
          </div>
        </td>
      </tr>
      <% } else if( "01".equals( userPO.getHeader1() ) ){ %>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">C&oacute;digo de Cliente :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01EXICUN" name="E01EXICUN" size="10" maxlength="9">
            <a href="javascript:GetCustomer('E01EXICUN')">
                		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
          </div>
        </td>
      </tr>
       <% } else if( "03".equals( userPO.getHeader1() ) ){ %>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">N&uacute;mero de Cuenta :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01EXIACC" name="E01EXIACC" size="13" maxlength="12">
             <a href="javascript:GetAccount('E01EXIACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            
          </div>
        </td>
      </tr>
     
      <% } %>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Monto :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01EXIMIN" name="E01EXIMIN" size="15" maxlength="15" onKeypress="enterDecimal(event)"> Minimo
            <input type="text" id="E01EXIMAX" name="E01EXIMAX" size="15" maxlength="15" onKeypress="enterDecimal(event)"> Maximo
          </div>
        </td>
      </tr>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Plazo en Meses :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
          <%--
          	<select name="E01EXITRC" >
	              <OPTION value="D" >D&iacute;a(s)</OPTION>
	              <OPTION value="M" >Mes(es)</OPTION>
	              <OPTION value="Y" >A&ntilde;o(s)</OPTION>
              	</select>
              	--%>
            <input type="text" id="E01EXITRM" name="E01EXITRM" size="5" maxlength="5" > Minimo
            <input type="text" id="E01EXITRX" name="E01EXITRX" size="5" maxlength="5" > Maximo
          </div>
        </td>
      </tr>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Maximo Dias Primera Cuota :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01EXIDMX" name="E01EXIDMX" size="5" maxlength="5" >
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

  <% if ( EDL0557Help.getNoResult() ) { %>
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
            <%if(userPO.getHeader1().equals("02")){ %>
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%">Tipo</th>
            <th align=CENTER nowrap width="50%">Descripcion del Producto</th>
           
            <%}else if(userPO.getHeader1().equals("01")){ %>
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%">Tipo</th>
            <th align=CENTER nowrap width="50%">Nombre del Cliente</th>
                        
            <% } %>
            <th align=CENTER nowrap width="10%">Estado</th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="95%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:400px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             EDL0557Help.initRow();
             boolean firstTime = true;
             String chk = "";
             while (EDL0557Help.getNextRow()) {
               if (firstTime) {
                 firstTime = false;
                 chk = "checked";
               } else {
                 chk = "";
               }  
               EDL055701Message list = (EDL055701Message) EDL0557Help.getRecord();
          %>
            <tr id="dataTable<%=EDL0557Help.getCurrentRow()%>">
              <td nowrap align="center" width="10%"> <input type="radio" name="key" value="<%=EDL0557Help.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%=EDL0557Help.getCurrentRow()%>)" /></td>
              <td nowrap align="center" width="10%"><% if (list.getField("E01EXITYP").getString().equals("02")) {
												out.print(Util.formatCell("Producto"));
											} else if (list.getField("E01EXITYP").getString().equals("01")) {
												out.print(Util.formatCell("Cliente"));
											} else  {out.print(Util.formatCell("Cuenta"));
											}%></td>
                          
              <td nowrap align="left" width="50%"><%=list.getE01EXIDSC()%></td>
              <td nowrap align="center" width="10%"><% if (list.getField("E01EXISTS").getString().equals("A")) {
												out.print(Util.formatCell("Activo"));
											} else if (list.getField("E01EXISTS").getString().equals("")) {
												out.print(Util.formatCell("Nuevo"));
											} else if (list.getField("E01EXISTS").getString().equals("D")) {
												out.print(Util.formatCell("Por Borrar"));
											} else if (list.getField("E01EXISTS").getString().equals("M")) {
												out.print(Util.formatCell("Modificado"));	
											} %></td>
             
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
