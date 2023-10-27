<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL195001Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Aprobacion Pagos Masivos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EDL195001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(button,op) {
	if ((op != '200') && (!isValidObject(getElement("key")))) {
		alert("Debe seleccionar un registro.");
		return;
	}
	if (op == '201') {
		if (getElement("PRC").value != '') {
			alert("No puede aprobar el archivo.");
			return;
		}
	}
	if ((op == '201') || (op == '202')) {
		if (op == '201') chk = confirm("Desea aprobar el registro seleccionado?");
		if (op == '202') chk = confirm("Desea borrar el registro seleccionado?");
		if (!chk) return;
		getElement("SCREEN").value = op;
		button.disabled = true;
		document.forms[0].submit();	
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1950?SCREEN="+op;
		if (op =='300' || op == '301') {
			url += "&key=" + getElementChecked('key').value;
		}
		CenterWindow(url, 820, 350, 2);		
	}
}

function setKey(table, row, prc) {
	highlightRow(table, row);
	document.forms[0].PRC.value = prc;
}


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

<h3 align="center">Aprobacion de Pagos Masivos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_mass_payments_list.jsp, EDL1950"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1950">
<input type="hidden" name="SCREEN" id="SCREEN" value="300">
<input type="hidden" name="PRC" id="IPRC" value="">  

	<table id="menuDS" class="tbenter" width="100%" >
		<tr>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction(this,'201')"><b>Aprobar</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction(this,'202')"><b>Borrar</b> </a></td>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:checkClose()">   <b>Salir</b> </a></td>
		</tr>
	</table>

	<table id="mainTable" class="tableinfo" style="height:80px;">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="center" nowrap width="2%" >&nbsp;</th>
						<th align="center" nowrap width="5%" >Ref</th>	
						<th align="center" nowrap width="33%">Archivo</th>						
						<th align="center" nowrap width="10%">Fecha</th>						
						<th align="center" nowrap width="5%" >Reg</th>			
						<th align="center" nowrap width="15%">Valor</th>	
						<th align="center" nowrap width="10%">Estado</th>	
						<th align="center" nowrap width="20%">Mensaje</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
				<%
						EDL195001List.initRow();
						boolean firstTime = true;
						String chk = "";
						
						while (EDL195001List.getNextRow()) {
							if (firstTime) {
								firstTime = false;
								chk = "checked";
							} else {
								chk = "";
							}
							EDL195001Message msg = (EDL195001Message) EDL195001List.getRecord();
				%>
						<tr id="dataTable<%= EDL195001List.getCurrentRow() %>">
							<td nowrap align="center" width="2%" ><input type="radio" name="key" value="<%=EDL195001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="setKey('dataTable',<%=EDL195001List.getCurrentRow()%>,'<%=msg.getE01DPHPRC()%>')"/></td>
							<td nowrap align="left"   width="5%" ><%=msg.getE01DPHREF()%></td>
							<td nowrap align="left"   width="33%"><%=msg.getE01DPHFIL()%></td>
							<td nowrap align="center" width="10%">
								<%= Util.formatCustomDate(currUser.getE01DTF(), msg.getBigDecimalE01DPHDTM().intValue(), 
								    msg.getBigDecimalE01DPHDTD().intValue(),
								    msg.getBigDecimalE01DPHDTY().intValue())%>
							</td>
							<td nowrap align="right"  width="5%" ><%=msg.getE01DPHRCN()%></td>
							<td nowrap align="right"  width="15%"><%=msg.getE01DPHAMT()%></td>
							<td nowrap align="center" width="10%">
								<%= msg.getE01DPHPRC().equals("E") ? "ERROR" : "PENDIENTE" %>
							</td>
							<td nowrap align="left"  width="20%"><%=msg.getE01DPHMSG()%></td>
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
