<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.*, datapro.eibs.beans.*" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Polizas a Vencer</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msglst" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  function goAction(op,row) {
	var ok = false;
	var cun = "";
	var pg = "";
	
	clickElement("key", row);
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100EX?SCREEN="+op+"&key="+row;    
	CenterWindow(pg, 1000, 650, 1);
 }

addEventHandler(document, 'click' , closeHiddenDivNew);

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

<h3 align="center">Polizas a Vencer
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="expired_list.jsp,ERA0100"></h3>
<hr size="4">
<form method="POST"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100EX">
<input type="hidden" id="SCREEN" name="SCREEN" value="2"> 

<%
	if (msglst.getNoResult()) {
%>
<table class="tbenter" width=100% height=80%>
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

  <table  id=cfTable class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="15%">No. Poliza</th>
				<th align="center" nowrap width="25%">Descripci&oacute;n de  <br>Poliza</th>
				<th align="center" nowrap width="25%">Compania de <br> Seguro</th>
				<th align="center" nowrap width="15%">Fecha de<br>Vencimiento </th>
				<th align="center" nowrap width="15%">Fecha de<br>Vencimiento Prestamo</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">       
		       <div id="dataDiv1"  style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			msglst.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (msglst.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ERA010003Message msg = (ERA010003Message) msglst.getRecord();
		%>
		<tr id="dataTable<%= msglst.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="key" name="key"	value="<%=msglst.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= msglst.getCurrentRow() %>)"/></td>
			<td nowrap align="left" width="15%"><a href="javascript:goAction('55',<%= msglst.getCurrentRow()%>);"><%= msg.getE03ROCCIN()%></a></td>
			<td nowrap align="left" width="25%"><a href="javascript:goAction('55',<%= msglst.getCurrentRow()%>);"><%=msg.getE03ROCIPD()%></a></td>
			<td nowrap align="left" width="25%"><a href="javascript:goAction('55',<%= msglst.getCurrentRow()%>);"><%=msg.getE03ROCICM()%></a></td>
			<td nowrap align="CENTER" width="15%"><a href="javascript:goAction('55',<%= msglst.getCurrentRow()%>);">
				<%= Util.formatCustomDate(currUser.getE01DTF(), msg.getE03ROCMDM(), msg.getE03ROCMDD(), msg.getE03ROCMDY())%>
			</a></td>
			<td nowrap align="CENTER" width="15%"><a href="javascript:goAction('55',<%= msglst.getCurrentRow()%>);">
				<%= Util.formatCustomDate(currUser.getE01DTF(), msg.getE03ROCEMM(), msg.getE03ROCEMD(), msg.getE03ROCEMY())%>
			</a></td>			
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
        if ( msglst.getShowPrev() ) {
 			int pos = msglst.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.tools.JSERA0100?SCREEN=50&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
<%       
        if ( msglst.getShowNext() ) {
      			int pos = msglst.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.tools.JSERA0100?SCREEN=50&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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

