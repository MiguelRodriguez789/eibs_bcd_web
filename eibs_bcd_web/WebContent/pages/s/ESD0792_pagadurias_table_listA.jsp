<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESD079201Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Pagadurias</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD079201List" class="datapro.eibs.beans.JBObjList"     scope="session" />
<jsp:useBean id= "error"         class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO"        class= "datapro.eibs.beans.UserPos"      scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	if ((op != '200') && (!isValidObject(getElement("currRow")))) {
		alert("Debe seleccionar un registro.");
		return;
	}
	if ((op == '202') || (op == '300')) {
		if (op == '202') chk = confirm("Desea eliminar el registro seleccionado?");
		if (!chk) return;
		getElement("SCREEN").value = op;
		document.forms[0].submit();	
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0792?SCREEN="+op;
		if (op != '200') {
			url += "&currRow=" + getElementChecked('currRow').value;
		}
		CenterWindow(url, 600, 400, 5);		
	}
	hideMenu();
}

function hideMenu() {
	if (document.getElementById("PagHead").style.display == 'none') {
		document.getElementById("PagHead").style.display = '';
		resizeIFrame(true);
	} else {
		document.getElementById("PagHead").style.display = 'none';
		resizeIFrame(false);
	}
}

function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifrempsg"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifrempsg").height = nHeight;
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
<% 
	String emp = (String)session.getAttribute("EMPSG");
 	emp = (emp==null)?"":emp;//
%>

<form method="POST"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0792">
	<input type="hidden" name="SCREEN" id="SCREEN" value="201">
	<input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value=""> 
	<input type="hidden" name="E01COPCDE" size="13" maxlength="12" value="<%= userPO.getHeader1()%>" readonly>		
	<a href="#" onclick="hideMenu();"><b>Pagadurias</b></a>
	<br><br>
	<table id="PagHead" class="tbenter" width="100%">
		<tr>
		  <%if(!"A".equals(emp)){%>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('202')"> <b>Borrar</b> </a></td> 
		<%}else{%>
				<td align="center" width="25%"> </td> 
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('301')"> <b>Consulta</b></a></td>
			<td align="center"  width="25%"></td> 
		<% } %>	
		</tr>
	</table>
	
	<table id="mainTable" class="tableinfo" style="height:80px;" width="100%">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="CENTER" nowrap width="5%"  >           </th>
						<th align="CENTER" nowrap width="10%" >  Sec      </th>
						<th align="CENTER" nowrap width="10%" >  Codigo   </th>
						<th align="LEFT" nowrap width="45%" >Descripcion</th>
						<th align="CENTER" nowrap width="30%" >	&nbsp;	  </th>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:100px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					   ESD079201List.initRow();
					   int k = 0;
					   boolean firstTime = true;
					   String chk = "";
					   while (ESD079201List.getNextRow()) {
					     if (firstTime) {
					       firstTime = false;
					       chk = "checked";
					     } else {
					       chk = "";
					     }
					     ESD079201Message convObj = (ESD079201Message) ESD079201List.getRecord();
					%>
						<tr id="dataTable<%= ESD079201List.getCurrentRow() %>">
							<td nowrap align="CENTER" width="5%" ><input type="radio" name="currRow" value="<%=ESD079201List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ESD079201List.getCurrentRow() %>)"/></td>
							<td nowrap align="CENTER" width="10%" ><%=Util.formatCell(convObj.getE01COPSEQ())%></td>
							<td nowrap align="CENTER" width="10%" ><%=convObj.getE01COPCDE()%></td>
							<td nowrap align="LEFT"   width="45%"><%=convObj.getE01COPDES()%></td>
							<td nowrap align="LEFT"   width="30%"> </td>
						</tr>
					<% } %>
					 </table>
				 </div>
			 </td>
		 </tr>
	</table>

</form>

<SCRIPT type="text/javascript">
	showChecked("currRow");  
	document.getElementById("PagHead").style.display = 'none';
	if (isValidObject(parent.document.getElementById("ifrempsg"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempsg").height;
	}	
</SCRIPT>
</body>
</html>
