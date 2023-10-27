<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055601Message"%>

<html>
<head>
<title>Negociacion Tabla de Usuarios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id= "EDL0556Help" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/graphical.js"> </SCRIPT>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/deleteLocalAuthorization.jsp"> </script>

<script language="JavaScript">

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

<h3 align="center">Negociacion Tabla de Usuarios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_sel_user_list.jsp, EDL0556"></h3>
<hr size="4">

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0556" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="2">
  <input type="HIDDEN" name="H01FLGMAS"  >
    
  
  <% if ( EDL0556Help.getNoResult() ) { %>
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
                 <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
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
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
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
            <th align=CENTER nowrap width="2%">&nbsp;</th>
            <th align=CENTER nowrap width="5%">Usuario</th>
            <th align=CENTER nowrap width="25%">Nombre</th>
            <th align=CENTER nowrap width="10%">Tipo</th>
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
             EDL0556Help.initRow();
             boolean firstTime = true;
             String chk = "";
             while (EDL0556Help.getNextRow()) {
               if (firstTime) {
                 firstTime = false;
                 chk = "checked";
               } else {
                 chk = "";
               }  
               EDL055601Message list = (EDL055601Message) EDL0556Help.getRecord();
          %>
            <tr id="dataTable<%=EDL0556Help.getCurrentRow()%>">
              <td nowrap align="center" width="2%"> <input type="radio" name="key" value="<%=EDL0556Help.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%=EDL0556Help.getCurrentRow()%>)" /></td>
              <td nowrap align="left" width="5%"><%=list.getE01NUSUSR()%></td>
              <td nowrap align="left" width="25%"><%=list.getE01NUSNOM()%></td>
              <td nowrap align="left" width="10%"><% if (list.getField("E01NUSAUT").getString().equals("1")) {
												out.print(Util.formatCell("Gestores/Consejero"));
											} else if (list.getField("E01NUSAUT").getString().equals("2")) {
												out.print(Util.formatCell("Supervisor"));
											} else if (list.getField("E01NUSAUT").getString().equals("3")) {
												out.print(Util.formatCell("Coordinadores"));
												} else if (list.getField("E01NUSAUT").getString().equals("4")) {
												out.print(Util.formatCell("Directores"));
											} else  {out.print(Util.formatCell("Gerencia"));
											}%></td>
              <td nowrap align="center" width="10%"><% if (list.getField("E01NUSSTS").getString().equals("A")) {
												out.print(Util.formatCell("Activo"));
																					
											} else if (list.getField("E01NUSSTS").getString().equals("C")) {
												out.print(Util.formatCell("Inactivo"));	
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



</form>
</body>
</html>
