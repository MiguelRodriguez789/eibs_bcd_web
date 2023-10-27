<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL195002Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Detalle Pagos Masivos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EDL195002List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

</SCRIPT>  

</head>

<body>
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">Detalle de Pagos Masivos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_mass_payments_detail.jsp, EDL1950"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1950">
<input type="hidden" name="SCREEN" id="SCREEN" value="300">

	<table id="mainTable" class="tableinfo" style="height:80px;">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="center" nowrap width="20%">Codigo</th>	
						<th align="center" nowrap width="20%">Cuenta</th>						
						<th align="center" nowrap width="20%">Valor</th>						
						<th align="center" nowrap width="40%">Mensaje Proceso</th>			
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
				<%
						EDL195002List.initRow();
						boolean firstTime = true;
						String chk = "";
						
						while (EDL195002List.getNextRow()) {
							EDL195002Message msg = (EDL195002Message) EDL195002List.getRecord();
				%>
						<tr id="dataTable<%= EDL195002List.getCurrentRow() %>">
							<td nowrap align="left"   width="20%"><%=msg.getE02DPMCOD()%></td>
							<td nowrap align="left"   width="20%"><%=msg.getE02DPMACC()%></td>
							<td nowrap align="left"   width="20%"><%=msg.getE02DPMAMO()%></td>
							<td nowrap align="left"   width="40%"><%=msg.getE02DPMMSG()%></td>
						</tr>
				<%  }  %>
					</table>
				</div>
			</td>
		</tr>
	</table>
</form>

<SCRIPT language="JavaScript">
	showChecked("key");
</SCRIPT>

</body>
