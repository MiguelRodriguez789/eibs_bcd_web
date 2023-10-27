<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV030001Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Cheques Avalados</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="parmrec" class="datapro.eibs.beans.EPV030001Message" scope="session" />
<jsp:useBean id="EPV030001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	if ((op != '200') && (!isValidObject(getElement("key")))) {
		alert("Debe seleccionar un registro.");
		return;
	}
	if ((op == '202') || (op == '300')) {
		if (op == '202') chk = confirm("Desea eliminar el registro seleccionado?");
		if (op == '300') chk = confirm("Desea desmarcar el registro seleccionado?");
		if (!chk) return;
		getElement("SCREEN").value = op;
		document.forms[0].submit();	
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0300?SCREEN="+op;
		if (op != '200') {
			url += "&key=" + getElementChecked('key').value;
		}
		CenterWindow(url, 1000, 400, 2);		
	}
}

</script>

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

<h3 align="center">Cheques Avalados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cheques_avalados_list.jsp, EPV0300"></h3>
<hr size="4">

<form method="POST"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0300">
	<input type="hidden" name="SCREEN" id="SCREEN" value="201">

<% if (!userPO.getAccNum().equals("")) { %>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="10%" > 
							<div align="right"><b>Cliente :</b></div>
						</td>
						<td nowrap width="20%" > 
							<div align="left"><b> 
								<input type="text" readonly name="E02UNCCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
								</b>
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="right"><b>Nombre :</b> </div>
						</td>
						<td nowrap width="30%"  > 
							<div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
								<input type="text" name="E02CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
								</font></font></font>
							</div>
						</td>
						<td nowrap width="10%">
						</td>
						<td nowrap width="20%">
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="10%"> 
							<div align="right"><b>Cuenta :</b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left"> 
								<input type="text" name="AccNum" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%"> 
							<div align="right"><b>Moneda : </b></div>
						</td>
						<td nowrap width="30%"> 
							<div align="left"><b> 
								<input type="text" name="UNCCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
								</b> </div>
						</td>
						<td nowrap width="10%"> 
							<div align="right"><b>Producto : </b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left"><b> 
								<input type="text" name="UNCPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
								</b> </div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br>
<% } %>

<% if (!userPO.getAccNum().equals("")) { %>
	<table id="menuAV" class="tbenter" width="100%">
		<tr>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('202')"> <b>Borrar</b> </a></td> 
		</tr>
	</table>
<% } else { %>
	<table id="menuAV" class="tbenter" width="100%">
		<tr>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('202')"> <b>Borrar</b> </a></td> 
		</tr>
	</table>
<% } %>

	<table id="mainTable" class="tableinfo" width="100%">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="center" nowrap width="2%" ></th>
						<th align="center" nowrap width="12%">Cuenta</th>
						<th align="center" nowrap width="12%">Cheque</th>
						<th align="center" nowrap width="13%">Fecha Pago</th>
						<th align="center" nowrap width="17%">Banco Cheque</th>
						<th align="center" nowrap width="17%">Nombre</th>
						<th align="center" nowrap width="12%">Estado</th>
						<th align="center" nowrap width="15%">Valor</th>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					   EPV030001List.initRow();
					   int k = 0;
					   boolean firstTime = true;
					   String chk = "";
					   while (EPV030001List.getNextRow()) {
					     if (firstTime) {
					       firstTime = false;
					       chk = "checked";
					     } else {
					       chk = "";
					     }
					     EPV030001Message list = (EPV030001Message) EPV030001List.getRecord();
					%>
						<tr id="dataTable<%= EPV030001List.getCurrentRow() %>">
							<td nowrap align="center" width="2%" ><input type="radio" name="key" value="<%=EPV030001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EPV030001List.getCurrentRow() %>)"/></td>
							<td nowrap align="center" width="12%"><a href="javascript:goAction('203')"><%=list.getE01UNCACC()%></a></td>
							<td nowrap align="center" width="12%"><a href="javascript:goAction('203')"><%=list.getE01UNCCKN()%></a></td>
							<td nowrap align="center" width="13%">
								<a href="javascript:goAction('203')">
							  	<%= Util.formatCustomDate(currUser.getE01DTF(), list.getBigDecimalE01UNCMDM().intValue(), list.getBigDecimalE01UNCMDD().intValue(),list.getBigDecimalE01UNCMDY().intValue())%>	
								</a>
							</td>
							<td nowrap align="left"   width="17%"><a href="javascript:goAction('203')"><%=list.getE01UNCKBK()%></a></td>
							<td nowrap align="left"   width="17%"><a href="javascript:goAction('203')"><%=list.getE01UNCRSN()%></a></td>
							<td nowrap align="center" width="12%">
								<a href="javascript:goAction('203')">
									<%= list.getE01UNCSTA().equals(" ") ? "" : "" %>
									<%= list.getE01UNCSTA().equals("P") ? "PROCESADO" : "" %>
								</a>
							</td>
							<td nowrap align="right"  width="15%"><a href="javascript:goAction('203')"><%=list.getE01UNCAMN()%></a></td>
						</tr>
					<% } %>
					 </table>
				 </div>
			 </td>
		 </tr>
	</table>

</form>

<SCRIPT type="text/javascript">
	showChecked("key");  
</SCRIPT>

</body>
</html>
