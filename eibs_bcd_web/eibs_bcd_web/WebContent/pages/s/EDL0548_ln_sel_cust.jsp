<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.*"%>

<html>
<head>
<title>Parametros de Cartera Sustitutiva</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id= "EDL0548Help" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "recData" class= "datapro.eibs.beans.EDL054801Message"  scope="session" />
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
  if (op == '109') {
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

<h3 align="center">Cupos Contraparte
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_sel_cust.jsp, EDL0548"></h3>
<hr size="4">

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0548" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="2">
  <input type="HIDDEN" name="H01FLGMAS"  >
  
  <table class="tableinfo">
		<tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
	
     
     <tr id="trdark"> 
			<td nowrap  width="10%"> 
	              <div align="right"><b>Convenio :</b> </div>
	         </td>
	         <td nowrap  width="10%"> 
	              <div align="left"> 
	              	<input type="text" readonly name="E01CTPCNV" size="10" maxlength="10" value="<%= recData.getE01CTPCNV().trim()%>">
	               </div>
	         </td>
			<td nowrap  width="10%"> 
	              <div align="right"><b>Nombre :</b> </div>
	         </td>
	         <td nowrap  width="10%"> 
	              <div align="left"> 
	              	<input type="text" readonly name="E01DSCCNV" size="45" maxlength="45"  value="<%= recData.getE01DSCCNV().trim()%>">
	               </div>
	         </td>
	         <td nowrap  width="10%"> 
	         </td>
	         <td nowrap  width="10%"> 
	         </td>
   	  </tr>
     	    </table>
      </td>
    </tr>
     </table> 
    
  <div id="hiddenDivNew" class="hiddenDiv">
    <%int row = 0; %>
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
      border-color: #0b23b5;
      border-style : solid solid solid solid;
      filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Convenio:</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
             <input type=TEXT name="E01CTPCNV"  value="<%= userPO.getHeader1()%>" size=10 maxlength=9 readonly>
          </div>
        </td>
      </tr>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Tipo :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
          	<select name="E01CTPTYP">
	                <option value="01" >Convenio Vivienda</option>
	                <option value="02" >Convenio Libranza</option>
	         </select>
            </div>
        </td>
      </tr>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(101)">
        </td>
      </tr>
    </table>
  </div>

  <% if ( EDL0548Help.getNoResult() ) { %>
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
        <div align="center"><a href="javascript:goAction(102)"><b>Consultar</b></a></div>
      </td>     
      <% } else { %>
      <td class=TDBKG width="25%"> 
        <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(102)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a id="EIBSBTNDEL" href="javascript:goAction(109);" ><b>Borrar</b></a></div>
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
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="15%">Nro Proyecto</th>
            <th align=CENTER nowrap width="15%">Tipo Convenio</th>
            <th align=CENTER nowrap width="50%">Nombre del Proyecto</th>
            <th align=CENTER nowrap width="15%">Monto Aprobado</th>
                     
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="95%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:400px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             EDL0548Help.initRow();
             boolean firstTime = true;
             String chk = "";
             while (EDL0548Help.getNextRow()) {
               if (firstTime) {
                 firstTime = false;
                 chk = "checked";
               } else {
                 chk = "";
               }  
               EDL054801Message list = (EDL054801Message) EDL0548Help.getRecord();
          %>
            <tr id="dataTable<%=EDL0548Help.getCurrentRow()%>">
              <td nowrap align="center" width="5%"> <input type="radio" name="key" value="<%=EDL0548Help.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%=EDL0548Help.getCurrentRow()%>)" /></td>
              <td nowrap align="center" width="15%"><%=list.getE01CTPNUM()%></a></td>
              <td nowrap align="center" width="15%"><% if (list.getField("E01CTPTYP").getString().equals("01")) {
															out.print(Util.formatCell("Convenio Vivienda"));
														} else if (list.getField("E01CTPTYP").getString().equals("02")) {
															out.print(Util.formatCell("Convenio Libranza"));
														} else  {out.print(Util.formatCell("Otros"));
														}%></td>
              <td nowrap align="center" width="50%"><%=list.getE01CTPDSC()%></a></td>
              <td nowrap align="center" width="15%"><%=list.getE01CTPAPV()%></a></td>
                      
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
