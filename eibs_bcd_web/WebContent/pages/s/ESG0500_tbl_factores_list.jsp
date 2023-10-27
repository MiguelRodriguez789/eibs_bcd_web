<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.*" %>
<%@ page import="datapro.eibs.beans.*" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="java.math.*" %>
<html>
<head>
<title>Factores</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ESG050001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script src="<%=request.getContextPath()%>/jquery/deleteLocalAuthorization.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	if ((op != '200') && (!isValidObject(getElement("key")))) {
		alert("Debe seleccionar un registro.");
		return;
	}
	if (op == '202') {
		chk = confirm("Desea eliminar el registro seleccionado?");
		if (!chk) return;
		getElement("SCREEN").value = op;
		//document.forms[0].submit();
		enableDeleteAuthorization( ) ;
		
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESG0500?SCREEN="+op+"&TYPE="+document.forms[0].TYPE.value;
		if (op != '200') {
			url += "&key=" + getElementChecked('key').value;
		}
		CenterWindow(url, 800, 600, 2);			
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
<h3 align="center">Factores<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tbl_factores_list.jsp, ESG0500"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESG0500">
	<input type="hidden" name="SCREEN" id="SCREEN" value="201">
	<input type="hidden" name="TYPE"   id="TYPE"   value="<%=userPO.getType()%>">
	<input type="HIDDEN" name="H01FLGMAS" value="A"  >
     
	<table class="tbenter" width="100%">
		<tr>
	      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
		      <td class=TDBKG width="25%"> 
		        <div align="center"><a href="javascript:goAction(201)"><b>Consultar</b></a></div>
		      </td>     
	      <% } else { %>
		
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('301')"> <b>Factores</b> </a></td>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('202')"> <b>Borrar</b></a></td>
		  <% } %>
			<td align="center" class="tdbkg" width="20%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
		</tr>
	</table>

	<table id="mainTable" class="tableinfo" style="height:80px;" width="100%">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="center" nowrap width="5%">&nbsp;</th>
						<th align="center" nowrap width="15%">Codigo</th>
						<th align="center" nowrap width="40%">Descripcion</th>
						<th align="center" nowrap width="10%">Tipo Fil</th>
						<th align="center" nowrap width="10%">Nro. Fil</th>
						<th align="center" nowrap width="10%">Tipo Col</th>
						<th align="center" nowrap width="10%">Nro. Col</th>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:80px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<% 
					   ESG050001List.initRow();
					   int k = 0;
					   boolean firstTime = true;
					   String chk = "";
					   while (ESG050001List.getNextRow()) {
					     if (firstTime) {
					       firstTime = false;
					       chk = "checked";
					     } else {
					       chk = "";
					     }
					   ESG050001Message msg = (ESG050001Message) ESG050001List.getRecord();
						%>
						<tr id="dataTable<%= ESG050001List.getCurrentRow() %>">
							<td nowrap align="center" width="5%" ><input type="radio" name="key" value="<%=ESG050001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ESG050001List.getCurrentRow() %>)"/></td>
							<td nowrap align="center" width="15%"><a href="javascript:goAction('203')"><%=msg.getE01FTTCOD()%></a></td>
							<td nowrap align="left"   width="40%"><a href="javascript:goAction('203')"><%=msg.getE01FTTDSC()%></a></td>
							<td nowrap align="center" width="10%">
								<a href="javascript:goAction('203')">
								<% if (msg.getE01FTTTRW().equals("M")) out.print("MONTO"); %>
								<% if (msg.getE01FTTTRW().equals("P")) out.print("PLAZO"); %>
								<% if (msg.getE01FTTTRW().equals("E")) out.print("EDAD");  %>
								</a>
							</td>
							<td nowrap align="center" width="10%"><a href="javascript:goAction('203')"><%=msg.getE01FTTNRW()%></a></td>
							<td nowrap align="center" width="10%">
								<a href="javascript:goAction('203')">
								<% if (msg.getE01FTTTCL().equals("M")) out.print("MONTO"); %>
								<% if (msg.getE01FTTTCL().equals("P")) out.print("PLAZO"); %>
								<% if (msg.getE01FTTTCL().equals("E")) out.print("EDAD");  %>
								</a>
							</td>
							<td nowrap align="center" width="10%"><a href="javascript:goAction('203')"><%=msg.getE01FTTNCL()%></a></td>
						</tr>
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>

</form>

<% if (!ESG050001List.getNoResult()) { %>
<SCRIPT type="text/javascript">
	showChecked("key");  
</SCRIPT>
<% } %>


</body>
</html>
