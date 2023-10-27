<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055502Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Consulta de Negociacion de Creditos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

 function goAction(op,row) {
   clickElement("key", row);
   getElement("SCREEN").value = op;
   document.forms[0].submit();    
 }
 
</SCRIPT>  

</head>

<body>
<% 

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Consulta de Negociacion de Creditos <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="salesplatform_inquiry_list.jsp,EDL0555"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555">
<input type="hidden" id="SCREEN" name="SCREEN" value="102"> 
<input type="hidden" id="TYPE" name="TYPE" value=""> 

    
  <table class="tbenter" style="width: 100%;">
    <tr>
      <% if (!msgList.getNoResult()) {%>
      <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('2009')"><b>Consulta</b></a></td>
      <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('2011')"><b>Hist&oacute;rico Estados</b></a></td>
      <% } %>
    </tr>
  </table>

  <% if (msgList.getNoResult()) { %>
  <table class="tbenter" style="width: 360px; height: 100px;" align="center">
    <tr>
      <td><div align="center"><font size="3"><b> No hay resultados que correspondan a su criterio de búsqueda. </b></font></div></td>
    </tr>
  </table>
  <% } else { %>
  <table  id=cfTable class="tableinfo" style="width: 100%; height: 100px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align="center" nowrap width="5%">&nbsp;</th>
            <th align="center" nowrap width="10%">Nro Solicitud</th>
            <th align="center" nowrap width="10%">Cliente</th>
            <th align="center" nowrap width="40%">Nombre</th>
            <th align="center" nowrap width="10%">Fecha Negociacion</th>
            <th align="center" nowrap width="10%">Estado</th>
           </tr>
        </table>
      </td>
    </tr>    
    <tr  height="95%">    
      <td nowrap="nowrap">       
        <div id="dataDiv1"  style="height:360px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             msgList.initRow();
             boolean firstTime = true;
             String chk = "";
             while (msgList.getNextRow()) {
               if (firstTime) {
                 firstTime = false;
                 chk = "checked";
               } else {
                 chk = "";
               }
               EDL055502Message list = (EDL055502Message) msgList.getRecord();
          %>
            <tr id="dataTable<%= msgList.getCurrentRow() %>">
              <td nowrap align="center" width="5%"><input type="radio" name="key" value="<%=msgList.getCurrentRow()%>" <%=chk%> class="highlight"  onClick="highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/></td>
              <td nowrap align="center" width="10%"><a href="javascript:goAction('2009',<%=msgList.getCurrentRow()%>);"><%=list.getE02DLNOFN()%></a></td>
              <td nowrap align="center" width="10%"><a href="javascript:goAction('2009',<%=msgList.getCurrentRow()%>);"><%=list.getE02SELCUN()%></a></td>
              <td nowrap align="left" width="40%"><a href="javascript:goAction('2009',<%=msgList.getCurrentRow()%>);"><%=list.getE02DSCPRO()%></a></td>
              <td nowrap align="center" width="10%"><a href="javascript:goAction('2009',<%=msgList.getCurrentRow()%>);"><%= Util.formatCustomDate(currUser.getE01DTF(), list.getBigDecimalE02DLNODM().intValue(), 
              										    list.getBigDecimalE02DLNODD().intValue(),
               										    list.getBigDecimalE02DLNODY().intValue()) %></a></td>
              <td nowrap align="center" width="10%"><a href="javascript:goAction('2009',<%=msgList.getCurrentRow()%>);"><% if (list.getField("E02DLNSTS").getString().equals("")) {
																					out.print(Util.formatCell("En Proceso"));
																					} else if (list.getField("E02DLNSTS").getString().equals("A")) {
																					out.print(Util.formatCell("Activo"));
																					} else if (list.getField("E02DLNSTS").getString().equals("D")) {
																					out.print(Util.formatCell("Anulado"));
																					} else if (list.getField("E02DLNSTS").getString().equals("C")) {
																					out.print(Util.formatCell("Cumplido"));
																					} else if (list.getField("E02DLNSTS").getString().equals("I")) {
																					out.print(Util.formatCell("Incumplido"));
																					} else if (list.getField("E02DLNSTS").getString().equals("M")) {
																					out.print(Util.formatCell("Incumplido Manual"));
																					} else if (list.getField("E02DLNSTS").getString().equals("N")) {
																					out.print(Util.formatCell("Cumplido Manual"));	
																					} %></td>
																																								
            </tr>
          <% } %>
          </table>
        </div>
      </td>
    </tr>
  </table>

  <TABLE class="tbenter" WIDTH="90%" ALIGN=CENTER height="10%">
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT>
      <%
         if ( msgList.getShowPrev() ) {
           int pos = msgList.getFirstRec() - 51;
           out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDL0555?SCREEN=100&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
         }
      %> 
      </TD>
      <TD WIDTH="50%" ALIGN=RIGHT>
      <%       
         if ( msgList.getShowNext() ) {
           int pos = msgList.getLastRec();
           out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDL0555?SCREEN=100&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
         }
      %> 
      </TD>
    </TR>
  </TABLE>
  <% } %>
  
</form>

<SCRIPT type="text/javascript">
  showChecked("key");
</SCRIPT>
</body>

</html>

