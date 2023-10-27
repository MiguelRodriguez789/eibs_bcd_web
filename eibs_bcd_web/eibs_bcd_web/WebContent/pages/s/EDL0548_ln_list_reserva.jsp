<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.*"%>

<html>
<head>
<title>Parametros de Cartera Sustitutiva</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id= "EDL0548Logs" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="lnReser" class="datapro.eibs.beans.EDL054802Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/graphical.js"> </SCRIPT>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/deleteLocalAuthorization.jsp"> </script>

<script language="JavaScript">


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

<h3 align="center">Consulta de Reservas
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_list_reserva.jsp, EDL0548"></h3>
<hr size="4">

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0548" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="2">
  <input type="HIDDEN" name="H01FLGMAS"  >
   
   
	

  <% if ( EDL0548Logs.getNoResult() ) { %>
  <p>&nbsp;</p>
  <table class="tbenter" width="100%" >
    <tr>
      <td> 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          
        </div>
      </td>
    </tr>
  </table>
  <% } else { %>
  <p>&nbsp;</p>
  
   
  <br>
  <table id="mainTable" class="tableinfo" style="height:400px;">
    <tr height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align=CENTER nowrap width="10%">Fecha</th>
            <th align=CENTER nowrap width="10%">Usuario</th>
            <th align=CENTER nowrap width="10%">Proyecto</th>
            <th align=CENTER nowrap width="10%">Reserva</th>
            <th align=CENTER nowrap width="40%">Nombre</th>
            <th align=CENTER nowrap width="10%">Valor Reservado</th>
            <th align=CENTER nowrap width="10%">Valor Aprobado</th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="95%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:400px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             EDL0548Logs.initRow();
             boolean firstTime = true;
             String chk = "";
             while (EDL0548Logs.getNextRow()) {
               if (firstTime) {
                 firstTime = false;
                 chk = "checked";
               } else {
                 chk = "";
               }  
               EDL054802Message list = (EDL054802Message) EDL0548Logs.getRecord();
          %>
            <tr id="dataTable<%=EDL0548Logs.getCurrentRow()%>">
              
              <td nowrap align="center" width="10%"><a href="javascript:showReserveDetail(<%= EDL0548Logs.getCurrentRow() %>)"><%=Util.formatDate(list.getField("E02CTLOPD").getString(), list.getField("E02CTLOPM").getString(),list.getField("E02CTLOPY").getString())%></a></td> 
              <td nowrap align="center" width="10%"><a href="javascript:showReserveDetail(<%= EDL0548Logs.getCurrentRow() %>)"><%=list.getE02CTLUSU()%></a></td> 
              <td nowrap align="center" width="10%"><a href="javascript:showReserveDetail(<%= EDL0548Logs.getCurrentRow() %>)"><%=list.getE02CTLNUM()%></a></td> 
              <td nowrap align="center" width="10%"><a href="javascript:showReserveDetail(<%= EDL0548Logs.getCurrentRow() %>)"><%=list.getE02CTLSEQ()%></a></td>
              <td nowrap align="center" width="30%"><a href="javascript:showReserveDetail(<%= EDL0548Logs.getCurrentRow() %>)"><%=list.getE02CTLNA1()%></a></td> 
              <td nowrap align="center" width="10%"><a href="javascript:showReserveDetail(<%= EDL0548Logs.getCurrentRow() %>)"><%=list.getE02CTLRSV()%></a></td> 
              <td nowrap align="center" width="10%"><a href="javascript:showReserveDetail(<%= EDL0548Logs.getCurrentRow() %>)"><%=list.getE02CTLAPV()%></a></td> 
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

<SCRIPT type="text/javascript">
function showReserveDetail(rowNum) {
	showPage("EDL0548_ln_reserva_inq.jsp?Row=" + rowNum);
}
</SCRIPT>

</form>
</body>
</html>
