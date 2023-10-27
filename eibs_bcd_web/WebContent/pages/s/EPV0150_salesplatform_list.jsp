<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV015003Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Tablas de Opciones de Menu</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "msgHeader" class= "datapro.eibs.beans.EPV015002Message"  scope="session" />

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

<%
   boolean editControl = false;
   if (userPO.getHeader4().equals("Y")) {
     editControl = true;
   }
%>

<body>
<% 

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Ingreso Informacion de Creditos <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="salesplatform_list.jsp,EPV0150"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0150">
<input type="hidden" id="SCREEN" name="SCREEN" value="102"> 
<input type="hidden" id="TYPE" name="TYPE" value=""> 

  <table  class="tableinfo" style="width: 100%;">
    <tr>   
      <td nowrap> 
        <table width="100%" >
          <tr id="trdark">
             <td nowrap width="10%" align="right"> Numero: 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="msgHeader" property="E02CUSCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Nombre: 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="msgHeader" property="E02CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
<table class="tbenter" style="width: 100%;">
	<tr>
	<% if (!editControl) {%>
		<td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('200')"> <b>Crear</b></a></td>
	<% }%>
	<% if (!msgList.getNoResult()) {%>
		<td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('400')"> <b>Modificar</b> </a></td>
	<% }%>
	</tr>
</table>

<%
	if (msgList.getNoResult()) {
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
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="15%">Cuenta</th>
				<th align="center" nowrap width="5%">Tipo</th>
				<th align="center" nowrap width="5%">Producto</th>
				<th align="center" nowrap width="40%">Descripci&oacute;n</th>
				<th align="center" nowrap width="10%">Fecha Apertura</th>
				<th align="center" nowrap width="15%">Monto del Credito</th>
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
					EPV015003Message list = (EPV015003Message) msgList.getRecord();
		%>
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="key" value="<%=msgList.getCurrentRow()%>" <%=chk%> class="highlight"  onClick="highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="15%"><a href="javascript:goAction('400',<%=msgList.getCurrentRow()%>);"><%=list.getE03DEAACC()%></a></td>
			<td nowrap align="center" width="5%"><a href="javascript:goAction('400',<%=msgList.getCurrentRow()%>);"><%=list.getE03DEATYP()%></a></td>
			<td nowrap align="center" width="5%"><a href="javascript:goAction('400',<%=msgList.getCurrentRow()%>);"><%=list.getE03DEAPRO()%></a></td>
			<td nowrap align="left" width="40%"><a href="javascript:goAction('400',<%=msgList.getCurrentRow()%>);"><%=list.getE03DSCPRO()%></a></td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('400',<%=msgList.getCurrentRow()%>);">
				<%= Util.formatCustomDate(currUser.getE01DTF(), list.getBigDecimalE03DEAODM().intValue(), 
															    list.getBigDecimalE03DEAODD().intValue(),
															    list.getBigDecimalE03DEAODY().intValue())%></a></td>
			<td nowrap align="right" width="15%"><a href="javascript:goAction('400',<%=msgList.getCurrentRow()%>);"><%=list.getE03DEAOAM()%></a></td>
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

  <TABLE class="tbenter" WIDTH="90%" ALIGN=CENTER height="10%">
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( msgList.getShowPrev() ) {
 			int pos = msgList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=100&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
<%       
        if ( msgList.getShowNext() ) {
      			int pos = msgList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=100&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
%> 
 	</TD>
	 </TR>
	 </TABLE>
<%
	}
%>
</form>
<SCRIPT type="text/javascript">
	showChecked("key");
</SCRIPT>
</body>
</html>

