<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV110001Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Desembolso</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV1100List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op ,row) {
	clickElement("keys", row);
	
	if (op == '400') {
		if (confirm("Desea eliminar este registro seleccionado?")) {
			getElement("SCREEN").value = op;
			document.forms[0].submit();		
		}
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN="+op+"&prdCode=<%=userPO.getProdCode()%>";
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



function updateTotal(nSuma, sumaGrav) {  
  try {
  	<%--Update Values in Distribution Section, Argument Notifies that 
		Desembolso called the function.
	 --%>
		if (isValidObject(parent.document.forms[0].DSTOT)) {
			parent.document.forms[0].DSTOT.value = formatCCY(nSuma);
			parent.document.forms[0].DSGMF.value = formatCCY(sumaGrav);
			parent.updateDist("DS");
		}	
		
  } catch(e) {
     scriptLog("updateTotal: ", true);
  }
}

function hideMenu() {
	if(isValidObject(document.getElementById("menuDS"))){
		if (document.getElementById("menuDS").style.display == 'none') {
			document.getElementById("menuDS").style.display = '';
			resizeIFrame(true);
		} else {
			document.getElementById("menuDS").style.display = 'none';
			resizeIFrame(false);
		}
	}
}

function showMenu(firstTime) {
	if(isValidObject(document.getElementById("menuDS") && !firstTime)){
		if (document.getElementById("menuDS").style.display == 'none') {
			document.getElementById("menuDS").style.display = '';
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
<% 	//si es blanco viene llamado por menu, sino viene llamdo desde la una pantalla 
	//Determines if a Header is Shown.
	String emp = (String)session.getAttribute("EMPDS");
	emp = (emp == null) ? "": emp;	//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV0150
%>

<%if ("".equals(emp)){ %>
<h3 align="center">Lista de Desembolso<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="desembolso_list.jsp,EPV1100"></h3>
<hr size="4">
<%}%>
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100">
<input type="hidden" name="SCREEN" id="SCREEN" value="300">
<input type="hidden" name="HEADER4" id="HEADER4" value="<%=userPO.getHeader4()%>">
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
	<h4>Desembolso</h4>
<% }else{ %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" id="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>

	<a id="linkMenu" href="#" onclick="hideMenu();"><b>Desembolso</b></a>
	<br><br>
	<table id="menuDS" class="tbenter" width="100%" >
		<tr>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('300')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="20%" id="timbrec" style="display: none;"><a href="javascript:goAction('201')"> <b>Timbre Cupón</b> </a></td>
			<td align="center" class="tdbkg" width="20%" style="display: <%= (EPV1100List.isEmpty()) ? "none": "" %> "><a href="javascript:goAction('400')"> <b>Borrar</b> </a></td>
		</tr>
	</table>
	
<%}%>  

	<table id="mainTable" class="tableinfo" style="height:80px;">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="center" nowrap width="2%">&nbsp;</th>
						<th align="center" nowrap width="20%">Concepto</th>						
						<th align="center" nowrap width="10%">Referencia</th>			
						<th align="center" nowrap width="15%">Destino</th>	
						<th align="center" nowrap width="10%">Monto </th>
						<th align="center" nowrap width="10%">Gravamen</th>
						<th align="center" nowrap width="10%">Total</th>
						<th align="center" nowrap width="10%">Cambio</th>
						<th align="center" nowrap width="15%">Equivalente (${userPO.currency})</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:80px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
				<%
						double sumOAM = 0;
						double sumEQ = 0;
						double sumTAX = 0;
						double sumTOT = 0;
						EPV1100List.initRow();
						boolean firstTime = true;
						String chk = "";
						while (EPV1100List.getNextRow()) {
							if (firstTime) {
								firstTime = false;
								chk = "checked";
							} else {
								chk = "";
							}
							EPV110001Message des = (EPV110001Message) EPV1100List.getRecord();
							sumOAM += des.getBigDecimalE01PVBOAM().doubleValue();
							sumEQ += des.getBigDecimalE01PVBEQV().doubleValue();
							sumTAX += des.getBigDecimalE01PVBTXA().doubleValue();
							sumTOT += des.getBigDecimalE01PVBTOT().doubleValue();
				%>
						<tr id="dataTable<%= EPV1100List.getCurrentRow() %>">
							<td nowrap align="center" width="2%"><input type="radio" name="keys" value="<%=EPV1100List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="showMenu();highlightRow('dataTable', <%= EPV1100List.getCurrentRow() %>)"/></td>
							<%if ("1".equals(des.getE01PVBTYP())){ %>
								<td nowrap align="left" width="20%"><a href="javascript:goAction('301',<%= EPV1100List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01PVBOPC()%> - CHQ/OFI: <%=des.getE01PVCNME()%></a></td>
							<% } else if ("A".equals(des.getE01PVBTYP())) { %>
								<td nowrap align="left" width="20%"><a href="javascript:goAction('301',<%= EPV1100List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01PVBOPC()%> - TRF/ACH: <%=des.getE01PVBNME()%></a></td>
							<% } else { %>
								<td nowrap align="left" width="20%"><a href="javascript:goAction('301',<%= EPV1100List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01PVBOPC()%> - <%=des.getE01PVBDSC()%></a></td>
							<% } %>
							<td nowrap align="left" width="10%"><a href="javascript:goAction('301',<%= EPV1100List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01PVBOAC()%></a></td>
							<td nowrap align="left" width="15%"><a href="javascript:goAction('301' ,<%= EPV1100List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01PVBDST()%> - <%=des.getE01DSCDST()%></a></td>
							<td nowrap align="right" width="10%"><a href="javascript:goAction('301' ,<%= EPV1100List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01PVBOAM()%></a></td>
							<td nowrap align="right" width="10%"><a href="javascript:goAction('301' ,<%= EPV1100List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01PVBTXA()%></a></td>
							<td nowrap align="right" width="10%"><a href="javascript:goAction('301' ,<%= EPV1100List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01PVBTOT()%></a></td>
							<td nowrap align="right" width="10%"><a href="javascript:goAction('301' ,<%= EPV1100List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01PVBEXR()%></a></td>
							<td nowrap align="right" width="15%"><a href="javascript:goAction('301' ,<%= EPV1100List.getCurrentRow()%>);" onclick="hideMenu();"><%=des.getE01PVBEQV()%></a></td>
						</tr>
				<%  }  %>
					</table>
				</div>
			</td>
		</tr>
	</table>
	<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">   
		<tr bgcolor="#FFFFFF">
			<td nowrap width="2%">&nbsp;</td>
			<td nowrap width="20%">&nbsp;</td>
			<td nowrap width="10%">&nbsp;</td>
			<td nowrap align="right" width="20%"></td>
			<td nowrap align="right" width="10%"></td>
			<td nowrap width="10%">&nbsp;</td>
			<td nowrap align="right" width="10%"><b>TOTAL : </b></td>
			<td nowrap align="right" width="10%"><b></b></td>
			<td nowrap align="right" width="10%"><b><%=datapro.eibs.master.Util.formatCCY(sumTOT)%></b></td>
		</tr>								
	</table>
</form>

<%-- Server sends "S" in "ACT" to signify change in iframe section. 
	 Frame calls to upate Distribution in parent.
	 *Note only Values paid through "Desembolso are reflected.
 --%>
<% if ("S".equals(request.getAttribute("ACT"))){ %>
<SCRIPT type="text/javascript">
	updateTotal(<%=sumEQ%>, <%=sumTAX%>);
</SCRIPT>
<% } %>

<SCRIPT type="text/javascript">
	showChecked("keys");
	if (isValidObject(document.getElementById("menuDS")))  {
		document.getElementById("menuDS").style.display = 'none';
	}

	<%-- CSS of Iframe. Adjusts Height of frame. --%>
	if (isValidObject(parent.document.getElementById("ifrempds"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempds").height;
	}	
	
	<%-- If Loan is "Creditos Avalados" show Timbre Cupon Option--%>
	if (isValidObject(parent.document.getElementById("E01DEACLF"))) {
		if (parent.document.getElementById("E01DEACLF").value == 'S') {
			getElement("timbrec").style.display = 'block';
		}
	}
	<%-- 	editControl('<%=userPO.getHeader4()%>');	 --%>
</SCRIPT>

</body>
