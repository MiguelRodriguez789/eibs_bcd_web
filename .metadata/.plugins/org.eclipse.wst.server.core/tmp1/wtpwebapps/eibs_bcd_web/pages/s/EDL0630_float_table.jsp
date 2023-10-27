<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import="datapro.eibs.beans.EDL063002Message"%>

<html>
<head>
<title>Consulta de Tasa Flotantes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "msgdata" class= "datapro.eibs.beans.EDL063001Message"  scope="session" />
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
<h3 align=left">Consulta de Tasas Flotantes
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="float_table.jsp, EDL0630"></h3>
<hr size="4">

<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tables.JSEDL0630">
<input type="hidden" id="SCREEN" name="SCREEN" value="200"> 

  <h4>Codigo de Table</h4>
  <table class="tableinfo">
    <tr> 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="35%"> 
              <div align="right"><b>Tabla :</b></div> 
            </td>
            <td width="65%"> 
              <div align=left>
                <input type="text" name="E01FRHTBL" value="<%= msgdata.getE01FRHTBL().trim()%>" size="4" maxlength="3" readonly>
                <eibsinput:text property="E01FRHDSC" name="msgdata" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
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
				<th align="center" nowrap width="13%">Fecha</th>
				<th align=CENTER nowrap width="10%">
					<div align="center">Tipo</div>
				</th>
				<th align=CENTER nowrap width="10%">
					<div align="center">Modo</div>
				</th>
				<th align=CENTER nowrap width="5%">
					<div align="center">Freq.</div>
				</th>
				<th align=CENTER nowrap width="5%">
					<div align="center">Base</div>
				</th>
				<th align="center" nowrap width="15%">Tasa Primaria %</th>
				<th align="center" nowrap width="15%">Tasa Secundaria %</th>
				<th align=CENTER nowrap width="15%">
				<div align="center">Tasa Efectiva<br>
				     Anual %</div>
				</th>
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
				EDL063002Message msgList = (EDL063002Message) list.getRecord();
		
		%>
		<tr id="dataTable<%= list.getCurrentRow() %>">
			<td nowrap align="left" width="1%"></td>
	    	<td nowrap align="center" width="13%"><%= Util.formatCustomDate(currUser.getE01DTF(),   
																		msgList.getBigDecimalE02FRHDMM().intValue(),  
																		msgList.getBigDecimalE02FRHDDD().intValue(),  
																		msgList.getBigDecimalE02FRHDYY().intValue()) %></td>

				<%if (msgList.getE02FRHTYP().equals("1")) { %>
					<td nowrap align="left" width="10%">&nbsp;&nbsp;Efectiva</td>
				<%} else if (msgList.getE02FRHTYP().equals("2")) { %>
					<td nowrap align="left" width="10%">&nbsp;&nbsp;Conversion</td>
				<%} else { %>					
					<td nowrap align="left" width="10%">&nbsp;&nbsp;Nominal</td>
				<% } %>
				<%if (msgList.getE02FRHMOD().equals("P")) { %>
					<td nowrap align="left" width="10%">&nbsp;&nbsp;Anticipado</td>
				<% } else if (msgList.getE02FRHMOD().equals("S")) { %>
					<td nowrap align="left" width="10%">&nbsp;&nbsp;Vencido</td>
				<%} else { %>					
					<td nowrap align="left" width="10%">&nbsp;&nbsp; </td>
				<% } %>
			<td nowrap align="center" width="5%"><%=msgList.getE02FRHPER()%> </td>
			<td nowrap align="center" width="5%"><%=msgList.getE02FRHBAS()%></td>
			<td nowrap align="right" width="15%"><%= msgList.getE02FRHPRT()%></td>
			<td nowrap align="right" width="15%"><%= msgList.getE02FRHSRT()%></td> 
			<td nowrap align="right" width="15%"><%= msgList.getE02FRHTEA()%></td>  
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
