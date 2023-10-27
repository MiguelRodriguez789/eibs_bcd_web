<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import="datapro.eibs.beans.EDL064002Message"%>

<html>
<head>
<title>Consulta Historico Indices Oficiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "msgdata" class= "datapro.eibs.beans.EDL064001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     error.setERRNUM("0");
     out.println("  	 top.close();");
     out.println("</SCRIPT>");
     }
%> 
<h3 align=left">Consulta Historico &Iacute;ndices Oficiales
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="float_table.jsp, EDL0640"></h3>
<hr size="4">

<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tables.JSEDL0640">
<input type="hidden" id="SCREEN" name="SCREEN" value="200"> 

  <h4>Codigo de &Iacute;ndice</h4>
  <table class="tableinfo">
    <tr> 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="35%"> 
              <div align="right"><b>&Iacute;ndice :</b></div> 
            </td>
            <td width="65%"> 
              <div align=left>
                <input type="text" name="E01IFHRCD" value="<%= msgdata.getE01IFHRCD().trim()%>" size="4" maxlength="3" readonly>
                <eibsinput:text property="E01IFHDSC" name="msgdata" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
<% if (list.getNoResult()) { %>
<table class="tbenter" width=100% height=100%>
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
<% } else { %>

  <TABLE  id="mainTable" class="tableinfolist" style="max-height:400px;width:85%"  align="center">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap width="1%">&nbsp;</th>
				<th align="center" nowrap width="30%">Tipo</th>
				<th align="center" nowrap width="15%">Fecha</th>
				<th align="center" nowrap width="15%">Valor</th>
				<th align="center" nowrap width="1%">&nbsp;</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="max-height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			list.initRow();
				while (list.getNextRow()) {
				EDL064002Message msgList = (EDL064002Message) list.getRecord();
		
		%>
		<tr id="dataTable<%= list.getCurrentRow() %>">
			<td nowrap align="left" width="1%"></td>
			<td nowrap align="center" width="30%"><%=msgList.getE02IFHNME()%> </td>
	    	<td nowrap align="center" width="15%"><%= Util.formatCustomDate(currUser.getE01DTF(),   
																		msgList.getBigDecimalE02IFHDMM().intValue(),  
																		msgList.getBigDecimalE02IFHDDD().intValue(),  
																		msgList.getBigDecimalE02IFHDYY().intValue()) %></td>
			<td nowrap align="right" width="15%"><%= msgList.getE02IFHVA1()%></td>  
			<td nowrap align="left" width="1%"></td>
		</tr>
					<% } %>
		        </table>
		        </div>
		   </td>
		 </tr>
  </table>
<% } %>
  </form>
</body>
</html>
