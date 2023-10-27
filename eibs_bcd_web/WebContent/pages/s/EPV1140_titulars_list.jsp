<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV114001Message" %>
<%@ page import="com.datapro.constants.EibsFields;import java.math.*;" %>

<html>
<head>
<title>Titulares</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV114001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	if ((op != '200') && (!isValidObject(getElement("key")))) {
		alert("Debe seleccionar un registro.");
		return;
	}
	if (op == '202') {
		if (op == '202') chk = confirm("Desea eliminar el registro seleccionado?");
		if (!chk) return;
		getElement("SCREEN").value = op;
		document.forms[0].submit();	
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1140?SCREEN="+op;
		if (op != '200') {
			url += "&key=" + getElementChecked('key').value;
		}
		CenterWindow(url, 960, 400, 2);		
	}
	hideMenu();
}

function hideMenu() {
	if (document.getElementById("menuAV").style.display == 'none') {
		document.getElementById("menuAV").style.display = '';
		resizeIFrame(true);
	} else {
		document.getElementById("menuAV").style.display = 'none';
		resizeIFrame(false);
	}
}

function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifrempav"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifrempav").height = nHeight;
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
	String emp = (String)session.getAttribute("EMPAV");
	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV1010
%>
<% if ("".equals(emp)){ %>
<h3 align="center">Listado de Avalados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="titulars_list.jsp,EPV1140"></h3>
<hr size="4">
<% } %>
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1140">
	<input type="hidden" name="SCREEN" id="SCREEN" value="201">
	<input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value="">
	<input type="hidden" name="seqNum" id="seqNum" value="0">
     
	<% if ("".equals(emp)){ %>
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr>
						<td nowrap width="10%" align="right"> Cliente : </td>
						<td nowrap width="10%" align="left">
							<eibsinput:text name="userPO" property="cusNum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
						</td>
						<td nowrap width="10%" align="right"> Propuesta : </td>
						<td nowrap width="50%"align="left">
							<input type="text" name="Header23" size="13" maxlength="12" value="<%= userPO.getHeader23()%>" readonly>
						</td>
				 </tr>
				</table>
			</td>
		</tr>
	</table>
	<table class="tbenter" width="100%">
		<tr>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('202')"> <b>Borrar</b></a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
		</tr>
	</table>
	<% } else if ("A".equals(emp)){ %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<h4>Avalados</h4>
	<% } else { %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<a href="#" onclick="hideMenu();"><b>Avalados</b></a>
	<br><br>
	<table id="menuAV" class="tbenter" width="100%">
		<tr>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('202')"> <b>Borrar</b></a></td> 
		</tr>
	</table>
	<% } %>  

	<table id="mainTable" class="tableinfo" style="height:80px;" width="100%">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="center" nowrap width="5%">&nbsp;</th>
						<th align="center" nowrap width="5%">Sec</th>						
						<th align="center" nowrap width="15%">Identificacion</th>
						<th align="center" nowrap width="30%">Nombre</th>
						<th align="center" nowrap width="30%">Universidad</th>
						<th align="center" nowrap width="15%">Vlr Semestre</th>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:80px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<% 
					   EPV114001List.initRow();
					   int k = 0;
					   boolean firstTime = true;
					   String chk = "";
					   while (EPV114001List.getNextRow()) {
					     if (firstTime) {
					       firstTime = false;
					       chk = "checked";
					     } else {
					       chk = "";
					     }
					   EPV114001Message convObj = (EPV114001Message) EPV114001List.getRecord();
					%>
						<tr id="dataTable<%= EPV114001List.getCurrentRow() %>">
							<td nowrap align="center" width="5%"><input type="radio" id="key" name="key" value="<%=EPV114001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EPV114001List.getCurrentRow() %>)" /></td>
							<td nowrap width="5%" align="center"><a href="javascript:goAction('203')"><%=Util.formatCell(convObj.getE01PVTSEQ())%></a></td>							
							<td nowrap align="left"   width="15%"><a href="javascript:goAction('203')"><%=convObj.getE01PVTIDN()%></a></td>
							<td nowrap align="left"   width="30%"><a href="javascript:goAction('203')"><%=convObj.getE01PVTNME()%></a></td>
							<td nowrap align="left"   width="30%"><a href="javascript:goAction('203')"><%=convObj.getE01PVTUNI()%></a></td>
							<td nowrap align="right"  width="15%"><a href="javascript:goAction('203')"><%=convObj.getE01PVTVLS()%></a></td>
						</tr>
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>

</form>

<% if (!EPV114001List.getNoResult()) { %>
<SCRIPT type="text/javascript">
	showChecked("key");  
</SCRIPT>
<% } %>

<SCRIPT type="text/javascript">
	document.getElementById("menuAV").style.display = 'none';
	if (isValidObject(parent.document.getElementById("ifrempav"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempav").height;
	}
</SCRIPT>   
  
</body>
</html>
