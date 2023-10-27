<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV118001Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html> 
<head>
<title>Seguros</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV118001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	var appType = getElement("appType").value;
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
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN="+op+"&appType="+appType;
		if (op != '200') {
			url += "&key=" + getElementChecked('key').value;
		}
		CenterWindow(url, 1000, 400, 2);		
	}
	hideMenu();
}

function updateTotal(nSuma) {  
  try {
	<%--Update Values in Distribution Section, Argument Notifies that 
		Seguro called the function.
	 --%>	  
		if (isValidObject(parent.document.forms[0].SGTOT)) {
			parent.document.forms[0].SGTOT.value = formatCCY(nSuma);
			parent.updateDist("SG");
		}
  } catch(e) {
     scriptLog("updateTotal: "+ e, false);
  }
}

function hideMenu() {
	if(isValidObject(document.getElementById("menuSG"))){
		if (document.getElementById("menuSG").style.display == 'none') {
			document.getElementById("menuSG").style.display = '';
			resizeIFrame(true);
		} else {
			document.getElementById("menuSG").style.display = 'none';
			resizeIFrame(false);
		}
	}
}

function showMenu(firstTime) {
	if(isValidObject(document.getElementById("menuSG") && !firstTime)){
		if (document.getElementById("menuSG").style.display == 'none') {
			document.getElementById("menuSG").style.display = '';
			resizeIFrame(true);
		} 
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

function setRow(table, row, seq, opc) {
	// Selecciona la fila
	highlightRow(table, row);
	// Marca el radio
	var ctrl = document.forms[0].key;
	if (!ctrl) return;
	var ctrlLen = ctrl.length;
	if (ctrlLen == undefined) {
		ctrl.checked = (ctrl.value == row.toString());
	}
	for (var i = 0; i < ctrlLen; i++) {
		ctrl[i].checked = false;
		if (ctrl[i].value == row.toString()) {
			ctrl[i].checked = true;
		}
	}
	// Asigna la secuencia	
	try {
	  document.forms[0].seqNum.value = seq;
	} catch(e){
	}
	// goAction
	if (opc != undefined) {
		goAction(opc);
		if (isValidObject(document.getElementById("menuSG"))) {
		  document.getElementById("menuSG").style.display = 'none';
        }
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
	//si es blanco viene llamado por menu, sino viene llamdo desde la una pantalla 
	//Determines if a Header is Shown. 
	String emp = (String)session.getAttribute("EMPSG");
 	emp = (emp==null)?"":emp;
%>
<% if ("".equals(emp)){ %>
<h3 align="center">Listado de Seguros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="seguros_list.jsp,EPV1180"></h3>
<hr size="4">
<% } %>
<form method="POST"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180">
	<input type="hidden" name="SCREEN" id="SCREEN" value="201">
	<input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value="">
	<input type="hidden" name="seqNum" id="seqNum" value="0">
	<input type="hidden" name="appType" id="appType" value="<%=request.getParameter("appType")%>">

	<% if ("".equals(emp)){ %>
	<table  class="tableinfo">
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
							<input type="text" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table class="tbenter" style="width: 1040px">
		<tr>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('202')"> <b>Borrar</b> </a></td> 
			<td align="center" class="tdbkg" width="25%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
		</tr>
	</table>
	<% } else if ("A".equals(emp)){ %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<h4>Seguros Financiados</h4>
	<% } else { %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<a href="#" onclick="hideMenu();"><b>Seguros</b></a>
	<br><br>
	<table id="menuSG" class="tbenter" width="100%">
		<tr>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('300')"> <b>Desmarcar</b> </a></td> 
			<td align="center" class="tdbkg" width="25%" style="display: <%= (EPV118001List.isEmpty()) ? "none": "" %> "><a href="javascript:goAction('202')"> <b>Borrar</b> </a></td> 
		</tr>
	</table>
	<% } %>  
	
	<table id="mainTable" class="tableinfo" style="height:80px;" width="100%">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="center" nowrap width="2%" ></th>
						<th align="center" nowrap width="2%" >Sel</th>
						<th align="center" nowrap width="2%" >Sec</th>
						<th align="center" nowrap width="8%" >Codigo</th>
						<th align="center" nowrap width="18%">Descripcion</th>
						<th align="center" nowrap width="18%">Plan</th>
						<th align="center" nowrap width="10%">Valor</th>
						<th align="center" nowrap width="10%">Factor</th>
						<th align="center" nowrap width="10%">Monto</th>
						<th align="center" nowrap width="10%">Gravamen</th>
						<th align="center" nowrap width="10%">Equivalente (${userPO.currency})</th>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:80px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					   double sumEqv = 0;
					   EPV118001List.initRow();
					   int k = 0;
					   boolean firstTime = true;
					   String chk = "";
					   while (EPV118001List.getNextRow()) {
					     if (firstTime) {
					       firstTime = false;
					       chk = "checked";
					     } else {
					       chk = "";
					     }
					     EPV118001Message convObj = (EPV118001Message) EPV118001List.getRecord();
					     // Si FormaPago=Apertura Y MedioPago=ConDesembolso
					     if (convObj.getE01PSGCOP().equals("O") && convObj.getE01PSGMPG().equals("D")) {
					       sumEqv += convObj.getBigDecimalE01PSGEQV().doubleValue();
					     }
					     if (convObj.getE01PSGCOP().equals("P") && convObj.getE01PSGMPG().equals("D")) {
					       sumEqv += convObj.getBigDecimalE01PSGEQV().doubleValue();
					     }
					     if (convObj.getE01PSGCOP().equals("D") && convObj.getE01PSGMPG().equals("D")) {
					       sumEqv += convObj.getBigDecimalE01PSGEQV().doubleValue();
					     }
					%>
						<tr id="dataTable<%= EPV118001List.getCurrentRow() %>">
							<td nowrap align="center" width="2%" ><input type="radio" name="key" value="<%=EPV118001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="showMenu(false);highlightRow('dataTable', <%= EPV118001List.getCurrentRow() %>)"/></td>
							<td nowrap align="center" width="2%" ><a href="javascript:setRow('dataTable',<%=EPV118001List.getCurrentRow()%>,<%=convObj.getE01PSGSEQ()%>,'203')"><input disabled type="checkbox" name="E01PSGSEL" value="Y" <%if (convObj.getE01PSGSEL().equals("Y")){out.print(" checked");}; %>/></a></td>
							<td nowrap align="center" width="2%" ><a href="javascript:setRow('dataTable',<%=EPV118001List.getCurrentRow()%>,<%=convObj.getE01PSGSEQ()%>,'203')"><%=Util.formatCell(convObj.getE01PSGSEQ())%></a></td>
							<td nowrap align="center" width="8%" ><a href="javascript:setRow('dataTable',<%=EPV118001List.getCurrentRow()%>,<%=convObj.getE01PSGSEQ()%>,'203')"><%=convObj.getE01PSGSCD()%></a></td>
							<td nowrap align="left"   width="18%"><a href="javascript:setRow('dataTable',<%=EPV118001List.getCurrentRow()%>,<%=convObj.getE01PSGSEQ()%>,'203')"><%=convObj.getE01PSGSNM()%></a></td>
							<td nowrap align="left"   width="18%"><a href="javascript:setRow('dataTable',<%=EPV118001List.getCurrentRow()%>,<%=convObj.getE01PSGSEQ()%>,'203')"><%=convObj.getE01DSCPLN()%></a></td>
							<td nowrap align="right"  width="10%">
								<a href="javascript:setRow('dataTable',<%=EPV118001List.getCurrentRow()%>,<%=convObj.getE01PSGSEQ()%>,'203')">
									<%= convObj.getE01PSGFAC().equals("F") ? "" : convObj.getE01PSGMTP() %>
								</a>
							</td>
							<td nowrap align="center" width="10%">
								<a href="javascript:setRow('dataTable',<%=EPV118001List.getCurrentRow()%>,<%=convObj.getE01PSGSEQ()%>,'203')">
									<%= convObj.getE01PSGFAC().equals("F") ? "VALOR FIJO" :    "" %>
									<%= convObj.getE01PSGFAC().equals("P") ? "PORCENTAJE" :    "" %>
									<%= convObj.getE01PSGFAC().equals("T") ? "% PLAZO TOTAL" : "" %>
									<%= convObj.getE01PSGFAC().equals("1") ? "TASA/PERIODO" :  "" %>
								</a>
							</td>
							<td nowrap align="right"  width="10%"><a href="javascript:setRow('dataTable',<%=EPV118001List.getCurrentRow()%>,<%=convObj.getE01PSGSEQ()%>,'203')"> <%=convObj.getE01PSGPGA()%></a></td>
							<td nowrap align="right"  width="10%"><a href="javascript:setRow('dataTable',<%=EPV118001List.getCurrentRow()%>,<%=convObj.getE01PSGSEQ()%>,'203')"> <%=convObj.getE01PSGTXA()%></a></td>
							<td nowrap align="right"  width="10%"><a href="javascript:setRow('dataTable',<%=EPV118001List.getCurrentRow()%>,<%=convObj.getE01PSGSEQ()%>,'203')">  <%=convObj.getE01PSGEQV()%> </a></td>
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
			<td align="center" nowrap width="2%">&nbsp;</td>
			<td align="center" nowrap width="2%">&nbsp;</td>
			<td align="center" nowrap width="8%">&nbsp;</td>
			<td align="center" nowrap width="18%">&nbsp;</td>
			<td align="center" nowrap width="18%">&nbsp;</td>
			<td align="center" nowrap width="10%">&nbsp;</td>
			<td nowrap align="right" width="10%"> </td> 
			<td nowrap align="right" width="10%"><b>TOTAL : </b></td>
			<td nowrap align="right" width="10%"></td>
			<td nowrap align="right" width="10%"><b><%=datapro.eibs.master.Util.formatCCY(sumEqv)%></b></td>
		</tr>
	</table>

</form>
<%-- Server sends "S" in "ACT" to signify change in iframe section. 
	 Frame calls to upate Distribution in parent.
	 *Note only Values paid through "Desembolso are reflected.
 --%>
<% if ("S".equals(request.getAttribute("ACT"))){ %>
<SCRIPT type="text/javascript">
	updateTotal(parseFloat("<%= Util.formatCCY(sumEqv)%>"));	   	   
</SCRIPT>
<% } %>

<SCRIPT type="text/javascript">
	showChecked("key");  

<%-- CSS of Iframe. Adjusts Height of frame. --%>
	if(isValidObject(document.getElementById("menuSG"))) document.getElementById("menuSG").style.display = 'none';
	if (isValidObject(parent.document.getElementById("ifrempsg"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempsg").height;
	}	
</SCRIPT>

</body>
</html>
