<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Lista de Gestiones de Cobros
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO"   class= "datapro.eibs.beans.UserPos"      scope="session"/>
<jsp:useBean id= "clientInfo" class= "datapro.eibs.beans.ECB003001Message"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

  function goAction(opt) {
      var page = "";
      if (opt == "D") {
        if (confirm("Esta seguro que desea eliminar el registro seleccionado?")) 
          document.forms[0].submit();
    } else if (opt == "M") { 
      var row = document.forms[0].CURRENTROW.value;   
        page = "<%=request.getContextPath()%>/pages/s/ECB0030_params_officer_maint.jsp?ROW=" + row;
        CenterNamedWindow(page,'Information',700,500,2);
      } else {
          page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECB0030?SCREEN=700";
        CenterNamedWindow(page,'Information',700,500,2);
      }
    }
  
</SCRIPT>

</HEAD>

<BODY>

<% 
 String chk = "";
   
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 } 
%>


<h3 align="center">Gestion de Cobranzas
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="params_officer_list.jsp,ECB0030">
</h3>
<hr size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECB0030" >

  <% if ( mtList.getNoResult() ) { %> 

  <TABLE class="tbenter" width="60%" align=center>
    <TR> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction('N')">Crear</a></div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tableinfo">
    <tr>
      <td nowrap>
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr > 
            <td nowrap> 
              <tr id="trdark"> 
                <td nowrap width="14%" ><div align="right"><b>Cliente :</b></div></td>
                <td nowrap width="9%" > 
                  <div align="left"> 
                    <input type="text" name="E01ECBCUN" size="10" maxlength="9" readonly value="<%= clientInfo.getE01ECBCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" ><div align="right"><b>Nombre :</b> </div></td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ECBNAM" size="45" maxlength="45" readonly value="<%= clientInfo.getE01ECBNAM().trim()%>">
              </div>
            </td>
            <td nowrap > <div align="right"><b>Producto : </b></div></td>
            <td nowrap >
              <input type="text" name="E01ECBPRO" size="4" maxlength="4" readonly value="<%= clientInfo.getE01ECBPRO().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"><div align="right"><b>Cuenta :</b></div></td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E01ECBACC" size="13" maxlength="12" value="<%= clientInfo.getE01ECBACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"><div align="right"><b>Oficial :</b></div></td>
            <td nowrap width="33%"> 
              <div align="left">
                <input type="text" name="E01ECBOFC" size="45" maxlength="45" readonly value="<%= clientInfo.getE01ECBOFC().trim()%>">
              </div>
            </td>
            <td nowrap width="11%"><div align="right"><b>Moneda : </b></div></td>
            <td nowrap width="21%"> 
              <div align="left">
                <input type="text" name="E01ECBCCY" size="3" maxlength="3" value="<%= clientInfo.getE01ECBCCY().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </TABLE>
      </td>
    </tr>
  </table>
   
  <TABLE class="tbenter" width=100% height=40%>
    <TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No existen registros por gestiones de cobranzas. Haga click en la opcion "Nuevo" para crear un registro </b>
          </p>          
        </div>
      </TD>
     </TR>
  </TABLE>
  
  <% } else { %>
     
  <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    
  <TABLE class="tbenter" width="100%" align=center>
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('N')">Nuevo</a> </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('M')">Consulta</a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
  </TABLE>
  <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo">
    <tr id="trdark"> 
      <td nowrap width="14%" ><div align="right"><b>Cliente :</b></div></td>
      <td nowrap width="9%" > 
        <div align="left"> 
          <input type="text" name="E01ECBCUN" size="9" maxlength="9" readonly value="<%= clientInfo.getE01ECBCUN().trim()%>">
        </div>
      </td>
      <td nowrap width="12%" ><div align="right"><b>Nombre :</b> </div></td>
      <td nowrap > 
        <div align="left"> 
          <input type="text" name="E01ECBNAM" size="45" maxlength="45" readonly value="<%= clientInfo.getE01ECBNAM().trim()%>">
        </div>
      </td>
      <td nowrap > <div align="right"><b>Producto : </b></div></td>
      <td nowrap >
        <input type="text" name="E01ECBPRO" size="4" maxlength="4" readonly value="<%= clientInfo.getE01ECBPRO().trim()%>">
      </td>
    </tr>
    <tr id="trdark"> 
      <td nowrap width="14%"><div align="right"><b>Cuenta :</b></div></td>
      <td nowrap width="9%"> 
        <div align="left"> 
          <input type="text" name="E01ECBACC" size="12" maxlength="12" value="<%= clientInfo.getE01ECBACC().trim()%>" readonly>
        </div>
      </td>
      <td nowrap width="12%"><div align="right"><b>Oficial :</b></div></td>
      <td nowrap width="33%"> 
        <div align="left">
          <input type="text" name="E01ECBOFC" size="45" maxlength="45" readonly value="<%= clientInfo.getE01ECBOFC().trim()%>">
        </div>
      </td>
      <td nowrap width="11%"><div align="right"><b>Moneda : </b></div></td>
      <td nowrap width="21%"> 
        <div align="left">
          <input type="text" name="E01ECBCCY" size="3" maxlength="3" value="<%= clientInfo.getE01ECBCCY().trim()%>" readonly>
        </div>
      </td>
    </tr>
  </TABLE>
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
    <tr height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <TH ALIGN=CENTER width="5%"></TH>
            <TH ALIGN=CENTER width="10%">Fecha</TH>
            <TH ALIGN=CENTER width="20%">Hora</TH>
            <TH ALIGN=CENTER width="45%">Descripcion</TH>
            <TH ALIGN=CENTER width="20%">Usuario<BR>Ultima<BR>Actualizacion</TH>  
          </tr>
        </table>
      </td>
    </tr>    
    <tr height="95%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:350px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             mtList.initRow(); 
             chk = "checked";               
             while (mtList.getNextRow()) {
               datapro.eibs.beans.ECB003001Message msgMT = (datapro.eibs.beans.ECB003001Message) mtList.getRecord();
          %>               
            <tr id="dataTable<%= mtList.getCurrentRow() %>">
              <td nowrap align="center" width="5%">
                <input type="radio" id="ROW" name="ROW" value="<%=mtList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable',<%=mtList.getCurrentRow()%>,document.forms[0].CURRENTROW)"/>
              </td>
              <TD ALIGN="CENTER" width="10%"><%=Util.formatDate( currUser.getE01DTF(), msgMT.getE01ECBDT1())%></TD>
              <TD ALIGN="CENTER" width="20%"><%=msgMT.getE01ECBTIM()%></TD>
              <TD ALIGN="LEFT" width="45%"><%=Util.formatCell(msgMT.getE01ECBNA0())%></TD>
              <TD ALIGN="CENTER" width="20%"><%=Util.formatCell(msgMT.getE01ECBUSR())%></TD>
            </TR>        
          <%             
               chk = "";     
             }
          %>    
          </table>
        </div>
      </td>
    </tr>
  </table>

<% } %>

</FORM>

<SCRIPT type="text/javascript">
  showChecked("ROW");       
</SCRIPT>

</BODY>
</HTML>
