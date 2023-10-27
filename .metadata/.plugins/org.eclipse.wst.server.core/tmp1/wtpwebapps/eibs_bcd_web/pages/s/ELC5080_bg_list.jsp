<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.ELC508002Message" %>
<%@page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Lista</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class= "datapro.eibs.beans.ELC508002Message" scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />

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
    out.println("  showErrors()");
    out.println("</SCRIPT>");
  }
%>

<h3 align="center">Ingreso Documentarias <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_list.jsp, ELC5080"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5080">
<input type="hidden" id="SCREEN" name="SCREEN" value="0"> 
<input type="hidden" id="TYPE" name="TYPE" value=""> 

  <table class="tableinfo" >
    <tr>   
      <td nowrap> 
        <table cellspacing="0" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="10%" align="right"> Numero: </td>
            <td nowrap width="10%" align="left">
              <eibsinput:text name="header" property="E02CUSCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right"> Nombre: </td>
            <td nowrap width="50%"align="left">
              <eibsinput:text name="header" property="E02CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tbenter" style="width: 100%;">
    <tr>
      <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('200')"> <b>Crear</b></a></td>
      <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('401')"> <b>Modificar</b> </a></td>
    </tr>
  </table>

<%
  if (list.getNoResult()) {
%>
  <table class="tbenter" style="width: 360px; height: 100px;" align="center">
    <tr>
      <td>
        <div align="center">
          <font size="3">
            <b> No hay resultados que correspondan a su criterio de búsqueda. </b>
          </font>
        </div>
      </td>
    </tr>
  </table>
<%
  } else {
%>
  <table  id=cfTable class="tableinfo" style="width: 100%; height: 100px;">
    <tr  height="5%"> 
      <td nowrap valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align="center" nowrap width="5%">&nbsp;</th>
            <th align="center" nowrap width="15%">Cuenta</th>
            <th align="center" nowrap width="5%">Tipo</th>
            <th align="center" nowrap width="5%">Producto</th>
            <th align="center" nowrap width="40%">Descripci&oacute;n</th>
            <th align="center" nowrap width="10%">Fecha Apertura</th>
            <th align="center" nowrap width="15%">Monto</th>
            <th align="center" nowrap width="5%">&nbsp;</th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="95%">    
      <td nowrap="nowrap">       
        <div id="dataDiv1"  style="height:360px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
<%
    list.initRow();
    boolean firstTime = true;
    String chk = "";
    while (list.getNextRow()) {
      if (firstTime) {
        firstTime = false;
        chk = "checked";
      } else {
        chk = "";
      }
      ELC508002Message datarec = (ELC508002Message) list.getRecord();
%>
            <tr id="dataTable<%= list.getCurrentRow() %>">
              <td nowrap align="center" width="5%"><input type="radio" name="key" value="<%=list.getCurrentRow()%>" <%=chk%> class="highlight"  onClick="highlightRow('dataTable', <%= list.getCurrentRow() %>)"/></td>
              <td nowrap align="center" width="15%"><a href="javascript:goAction('401',<%=list.getCurrentRow()%>);"><%=datarec.getE02LCMACC()%></a></td>
              <td nowrap align="center" width="5%"><a href="javascript:goAction('401',<%=list.getCurrentRow()%>);"><%=datarec.getE02LCMATY()%></a></td>
              <td nowrap align="center" width="5%"><a href="javascript:goAction('401',<%=list.getCurrentRow()%>);"><%=datarec.getE02LCMPRO()%></a></td>
              <td nowrap align="left" width="40%"><a href="javascript:goAction('401',<%=list.getCurrentRow()%>);"><%=datarec.getE02DSCPRO()%></a></td>
              <td nowrap align="center" width="10%"><a href="javascript:goAction('401',<%=list.getCurrentRow()%>);">
              <%= Util.formatCustomDate(currUser.getE01DTF(), datarec.getBigDecimalE02LCMODM().intValue(), 
                  datarec.getBigDecimalE02LCMODD().intValue(),
                  datarec.getBigDecimalE02LCMODY().intValue())%></a></td>
              <td nowrap align="right" width="15%"><a href="javascript:goAction('401',<%=list.getCurrentRow()%>);"><%=datarec.getE02LCMOAM()%></a></td>
              <td nowrap align="center" width="5%">&nbsp;</td> 
            </tr>
<%
    }  
%>
          </table>
        </div>
      </td>
    </tr>
  </table>

  <table class="tbenter" width="90%" align="center" height="10%">
    <tr>
      <td width="50%" align="left">
<%
    if ( list.getShowPrev() ) {
      int pos = list.getFirstRec() - 51;
      out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=100&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    }
%> 
      </td>
      <td width="50%" align="right">
<%       
    if ( list.getShowNext() ) {
      int pos = list.getLastRec();
      out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=100&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
    }
%> 
      </td>
    </tr>
  </table>
<%
  }
%>
</form>

<script type="text/javascript">
  showChecked("key");
</SCRIPT>

</body>
</html>

