<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV112001Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Otros Conceptos a Reliquidar</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV1120List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op ,row) {
	clickElement("keys", row);
	
	var productCode = getElement('prdCode').value;
	if (op == '400') {
		if (confirm("Desea eliminar este registro seleccionado?")) {
			getElement("SCREEN").value = op;
			document.forms[0].submit();		
		}
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1120?SCREEN="+op;		
		url += "&prdCode=" + productCode;
		if (op =='300' || op == '301') {				
			url += "&keys=" + getElementChecked('keys').value;		
		}	
		openWindow(url, 1000, 350, 2);		
	}
	hideMenu();		
}


function openWindow(u, w1, h1, tp){
		
	var name = getNameFromUrl(u);
	var nm = name;
	var w = screen.width;
	var h = screen.height+150;
	var posTop = (h-h1)/2;
	var posLeft = (w-w1)/2; 
	var position = 'left='+posLeft+',top='+posTop+',height='+h1+',width='+w1;
	
	var listin = null;
	
	switch (tp){
    	case 1:
			listin = window.open(u,nm,position);
			break;
    	case 2:
			listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
    		break;
    	case 3:
			listin = window.open(u,nm,'scrollbars=yes,'+position);
			break;
    	case 4:
			listin = window.open(u,nm,'toolbar=yes,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
    		break;
    	case 5:
			listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,'+position);
    		break;
    	case 6:
			listin = window.open(u,nm,'scrollbars=yes,'+position);
			break;
    	case 7:
			listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,'+position);
    		break;
	}
	listin.focus();
	return listin;	
}

function updateTotal(nSuma) {  
  try {
		if (isValidObject(parent.document.forms[0].RNTOT)) {
			parent.document.forms[0].RNTOT.value = formatCCY(nSuma);
			parent.updateDist("RN");
		}	
		
  } catch(e) {
    alert("updateTotal: "+e);
  }
}

function hideMenu() {
	if(isValidObject(document.getElementById("menuRN"))){
		if (document.getElementById("menuRN").style.display == 'none') {
			document.getElementById("menuRN").style.display = '';
			resizeIFrame(true);
		} else {
			document.getElementById("menuRN").style.display = 'none';
			resizeIFrame(false);
		}
	}
}

function showMenu(firstTime) {
	if(isValidObject(document.getElementById("menuRN") && !firstTime)){
		if (document.getElementById("menuRN").style.display == 'none') {
			document.getElementById("menuRN").style.display = '';
			resizeIFrame(true);
		} 
	}
}

function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifrempds"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifrempds").height = nHeight;
	}	
}

function editControl(status) {
	// Inactivo por solicitud del banco
	status = "N";
	if (status == "Y") {
		$("#linkMenu").attr("onclick","");
	}
}

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
<% 
	String emp = (String)session.getAttribute("EMPRN");
	emp = (emp == null) ? "": emp;	//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV0150
%>

<%if ("".equals(emp)){ %>
<h3 align="center">Lista de Otros Concepts a Reliquidar
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reliquidar_list.jsp,EPV1120"></h3>
<hr size="4">
<%}%>
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1120">
<input type="hidden" name="SCREEN" id="SCREEN" value="300">
<input type="hidden" name="HEADER4" id="HEADER4" value="<%=userPO.getHeader4()%>">
<input type="hidden" name="prdCode" id="prdCode" value="<%=request.getAttribute("prdCode")%>">  
<input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value="">  

<%if ("".equals(emp)){ %>
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
							<input type="text" name="PorfNum" id="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
						</td>
					</tr>
				</table>
			</td>
    </tr>
	</table>
	<table class="tbenter" style="width: 100%">
		<tr>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('300')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('400')"> <b>Borrar</b> </a></td>
			<td align="center" class="tdbkg" width="20%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
		</tr>
 	</table>
<% }else if ("A".equals(emp)){%>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<h4>Otros Conceptos a Reliquidar</h4>
<% }else{ %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" id="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>

	<a id="linkMenu" href="#" onclick="hideMenu();"><b>Otros Conceptos a Reliquidar</b></a>
	<br><br>
	<table id="menuRN" class="tbenter" width="100%" >
		<tr>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('300')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="20%" style="display: <%= (EPV1120List.isEmpty()) ? "none": "" %> "><a href="javascript:goAction('400')"> <b>Borrar</b> </a></td>
		</tr>
	</table>
	
<%}%>  

	<table id="mainTable" class="tableinfo" style="height:80px;">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="center" nowrap width="5%">&nbsp;</th>
						<th align="center" nowrap width="5%">Sec</th>						
						<th align="center" nowrap width="35%">Concepto</th>						
						<th align="center" nowrap width="10%">Banco</th>			
						<th align="center" nowrap width="10%">Secursal</th>	
						<th align="center" nowrap width="10%">Moneda</th>
						<th align="center" nowrap width="10%">Referencia</th>
						<th align="center" nowrap width="15%">Monto</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:80px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
				<%
						double sumMonto = 0;
						EPV1120List.initRow();
						boolean firstTime = true;
						String chk = "";
						while (EPV1120List.getNextRow()) {
							if (firstTime) {
								firstTime = false;
								chk = "checked";
							} else {
								chk = "";
							}
							EPV112001Message des = (EPV112001Message) EPV1120List.getRecord();
							sumMonto += des.getBigDecimalE01ORLOAM().doubleValue();
				%>
						<tr id="dataTable<%= EPV1120List.getCurrentRow() %>">
							<td nowrap align="center" width="5%"><input type="radio" name="keys" value="<%=EPV1120List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="showMenu();highlightRow('dataTable', <%= EPV1120List.getCurrentRow() %>)"/></td>
							<td nowrap align="center" width="5%"><a href="javascript:goAction('301',<%= EPV1120List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01ORLSEQ()%></a></td>
							<td nowrap align="left" width="35%"><a href="javascript:goAction('301',<%= EPV1120List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01ORLOPC()%> - <%=des.getE01ORLDSC()%></a></td>
							<td nowrap align="center" width="10%"><a href="javascript:goAction('301' ,<%= EPV1120List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01ORLOBK()%></a></td>
							<td nowrap align="center" width="10%"><a href="javascript:goAction('301' ,<%= EPV1120List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01ORLOBR()%></a></td>
							<td nowrap align="center" width="10%"><a href="javascript:goAction('301' ,<%= EPV1120List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01ORLOCY()%></a></td>
							<td nowrap align="center" width="10%"><a href="javascript:goAction('301' ,<%= EPV1120List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01ORLOAC()%></a></td>
							<td nowrap align="right" width="15%"><a href="javascript:goAction('301' ,<%= EPV1120List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01ORLOAM()%></a></td>
						</tr>
				<%  }  %>
					</table>
				</div>
			</td>
		</tr>
	</table>
	<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">   
		<tr bgcolor="#FFFFFF">
			<td nowrap width="5%">&nbsp;</td>
			<td nowrap width="5%">&nbsp;</td>
			<td nowrap width="235%">&nbsp;</td>
			<td nowrap width="10%">&nbsp;</td>
			<td nowrap width="10%">&nbsp;</td>
			<td nowrap width="10%">&nbsp;</td>
			<td nowrap align="right" width="10%"><b>TOTAL : </b> </td>
			<td nowrap align="right" width="15%"><b><%=datapro.eibs.master.Util.formatCCY(sumMonto)%></b></td>
		</tr>								
	</table>
</form>

<% if ("S".equals(request.getAttribute("ACT"))){ %>
<SCRIPT language="JavaScript">
	updateTotal(parseFloat("<%=sumMonto%>"));	   	   
</SCRIPT>
<% } %>

<SCRIPT language="JavaScript">
	showChecked("keys");
	if (isValidObject(document.getElementById("menuRN")))  {
		document.getElementById("menuRN").style.display = 'none';
	}
	if (isValidObject(parent.document.getElementById("ifrempds"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempds").height;
	}
	editControl('<%=userPO.getHeader4()%>');
</SCRIPT>

</body>
