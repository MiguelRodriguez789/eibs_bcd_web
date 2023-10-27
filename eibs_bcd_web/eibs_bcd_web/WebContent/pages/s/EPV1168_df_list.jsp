<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV116801Message" %>
<%@page import="com.datapro.constants.EibsFields,java.math.*" %>

<html>
<head>
<title>Destino de Fondos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV116801List" class="datapro.eibs.beans.JBObjList" scope="session" />
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
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1168?SCREEN="+op;
		if (op != '200') {
			url += "&key=" + getElementChecked('key').value;
		}
		CenterWindow(url, 960, 300, 2);		
	}
	hideMenu();
}

function hideMenu() {
	if (isValidObject(document.getElementById("menuDF"))) {
		if (document.getElementById("menuDF").style.display == 'none') {
			document.getElementById("menuDF").style.display = '';
			resizeIFrame(true);
		} else {
			document.getElementById("menuDF").style.display = 'none';
			resizeIFrame(false);
		}
    }
}

function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifrempdf"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifrempdf").height = nHeight;
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
	String emp = (String)session.getAttribute("EMPDF");
	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV1010
%>

<% if ("".equals(emp)){ %>
<h3 align="center">Listado de Destino de Fondos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="df_list.jsp,EPV1168"></h3>
<hr size="4">
<% } %>

<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1168">
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
	<h4>Destino de Fondos</h4>
	<% } else { %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<a href="#" onclick="hideMenu();"><b>Destino de Fondos</b></a>
	<br><br>
	<table id="menuDF" class="tbenter" width="100%">
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
						<th align="center" nowrap width="2%" >&nbsp;</th>
						<th align="center" nowrap width="5%" >Sec</th>						
						<th align="center" nowrap width="15%">Codigo</th>
						<th align="center" nowrap width="48%">Descripcion</th>
						<th align="center" nowrap width="15%">Tipo</th>
						<th align="center" nowrap width="15%">Valor</th>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:80px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<% 
					   double sumTot = 0;
					   EPV116801List.initRow();
					   int k = 0;
					   boolean firstTime = true;
					   String chk = "";
					   while (EPV116801List.getNextRow()) {
					     if (firstTime) {
					       firstTime = false;
					       chk = "checked";
					     } else {
					       chk = "";
					     }
					   EPV116801Message convObj = (EPV116801Message) EPV116801List.getRecord();
					   sumTot += convObj.getBigDecimalE01PDFVLR().doubleValue();
					%>
						<tr id="dataTable<%= EPV116801List.getCurrentRow() %>">
							<td nowrap align="center" width="2%" ><input type="radio" id="key" name="key" value="<%=EPV116801List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EPV116801List.getCurrentRow() %>)" /></td>
							<td nowrap align="center" width="5%" ><a href="javascript:goAction('203')"><%=Util.formatCell(convObj.getE01PDFSEQ())%></a></td>							
							<td nowrap align="left"   width="15%"><a href="javascript:goAction('203')"><%=convObj.getE01PDFCDE()%></a></td>
							<td nowrap align="left"   width="48%"><a href="javascript:goAction('203')"><%=convObj.getE01PDFNME()%></a></td>
							<td nowrap align="center" width="15%">
								<a href="javascript:goAction('203')">
								<% if (convObj.getE01PDFTYP().equals("P")) { out.print("PRINCIPAL");
									 } else {out.print("&nbsp;");}
								%>
								</a>
							</td>
							<td nowrap align="right"  width="15%"><a href="javascript:goAction('203')"><%=convObj.getE01PDFVLR()%></a></td>
						</tr>
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>

	<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">   
		<tr bgcolor="#FFFFFF">
			<td align="center" nowrap width="2%">&nbsp;</td>
			<td align="center" nowrap width="5%">&nbsp;</td>
			<td align="center" nowrap width="15%">&nbsp;</td>
			<td align="center" nowrap width="48%">&nbsp;</td>
			<td align="right" nowrap width="15%"><b>TOTAL : </b></td>
			<td align="right"  nowrap width="15%"><b><%=datapro.eibs.master.Util.formatCCY(sumTot)%></b></td>
		</tr>
	</table>


</form>

<% if (!EPV116801List.getNoResult()) { %>
<SCRIPT type="text/javascript">
	showChecked("key");  
</SCRIPT>
<% } %>

<SCRIPT type="text/javascript">
	if (isValidObject(document.getElementById("menuDF"))) {
		document.getElementById("menuDF").style.display = 'none';
	}
	if (isValidObject(parent.document.getElementById("ifrempdf"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempdf").height;
	}
</SCRIPT>   
  
</body>
</html>
