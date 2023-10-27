<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.presentation.input.EibsInputFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<HTML>
<HEAD>
<TITLE> Lista de Cuentas a Aprobar </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "searchParameters" class= "datapro.eibs.beans.EDL014001Message"  scope="session" />
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

var reason = '';
var accOfac = '';
var accWarn = '';

function goApproval() {
	getElement("action").value = "A";
	document.getElementsByTagName('body')[0].className = 'waiting';		
	document.forms[0].submit();
}

function goAction(op) {
	var op2 = '';
	if (getElementChecked("ACCNUM") != null) {
		if (op == 'Z') {op2 = 'A';} else {op2 = op;}
		getElement("action").value = op2;
		getElement("reason").value = reason;
		if (op == 'D') {
			if (confirm("Desea eliminar este registro seleccionado?")) {
				document.getElementsByTagName('body')[0].className = 'waiting';			
				document.forms[0].submit();		
			}
		} else if (op == 'R'){
			if (confirm("Desea rechazar este registro seleccionado?")) {
				document.getElementsByTagName('body')[0].className = 'waiting';					
				document.forms[0].submit();		
			}
		} else if (op == 'Z') {
			if (confirm("Desea aprobar este registro seleccionado?")) {
				document.getElementsByTagName('body')[0].className = 'waiting';	  				
				document.forms[0].submit();		
			}
		}  
		if (op == 'A') {
			if (accOfac.trim() != "") {
				var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accOfac + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
				CenterWindow(page, 600, 500, 2);
			} else if (accWarn.trim() != "") {
				var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accWarn+"&APP=1";
				CenterWindow(page, 420, 300, 2);
			} else {
				if (confirm("Desea aprobar este registro seleccionado?")) {
					document.getElementsByTagName('body')[0].className = 'waiting';		        	
					document.forms[0].submit();
				}
			}
		}
		if (op == 'Search'){
			getElement('SCREEN').value = 5; //Request Filtered List
			getElement('action').value = '';
			document.getElementsByTagName('body')[0].className = 'waiting';		        	
			document.forms[0].submit();				
		}
	} else {
		if (op == 'Search'){
			getElement('SCREEN').value = 5; //Request Filtered List
			getElement('action').value = '';
			document.getElementsByTagName('body')[0].className = 'waiting';		        	
			document.forms[0].submit();				
		} else {	
			alert("Debe seleccionar un registro.");
		}
	}
}

function goDelete(op) {
	if (getElementChecked("ACCNUM") != null){
		if (confirm("Esta seguro que desea Eliminar esta Accion?")) {
			goAction(op);
		}
	} else {
		alert("Debe seleccionar un registro.");
	}
}
	
function goExit(){
	window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
}

function extraInfo(textfields, noField) {
	var pos = 0;
	var s = textfields;
	for ( var i=0; i<noField ; i++ ) {
		pos = textfields.indexOf("<br>", pos+1);
	}
	s = textfields.substring(0, pos);
	return s;
}
 
function showAddInfo(idxRow, via) {
	getElement("openVia").value = via;
	getElement("tbAddInfo").rows[0].cells[1].style.color = "#d0122c";   
	getElement("tbAddInfo").rows[0].cells[1].innerHTML = extraInfo(getElement("TXTDATA"+idxRow).value, 9);   
	if (getElement("STSOFAC"+idxRow).value == "3") {
		accOfac = "";
	} else {
		accOfac = "";
	}
	if (getElement("STSWARN"+idxRow).value == "A") {
		accWarn = getElementChecked("ACCNUM").value;
	} else {
		accWarn = "";
	}
	for ( var i=0; i<getElement("dataTable").rows.length; i++ ) {
		getElement("dataTable").rows[i].className = "trnormal";
	}
	getElement("dataTable").rows[idxRow].className = "trhighlight";
}   

function showInqOFAC(fieldValue){
	var formLength = document.forms[0].elements.length;
	for (n=0; n<formLength; n++) {
		var elementName = document.forms[0].elements[n].name;
		var elementValue = document.forms[0].elements[n].value;
		if (elementName == "ACCNUM" && elementValue == fieldValue) {
			document.forms[0].elements[n].click();
			break;
		}
	}
	var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page, 600, 500, 2);    
}

function showInqWarn(fieldValue) {
	var formLength = document.forms[0].elements.length;
	for (n=0; n<formLength; n++) {
		var elementName= document.forms[0].elements[n].name;
		var elementValue= document.forms[0].elements[n].value;
		if (elementName == "ACCNUM" && elementValue == fieldValue) {
			document.forms[0].elements[n].click();
			break;
		}
	}
	var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
	CenterWindow(page, 420, 300, 2);    
}

function showReceipt(opt) {
	var page = "";
	if (opt == "CD") {
		page = "<%=request.getContextPath()%>/pages/s/receiptCD_viewer.jsp";
	} else if (opt == "LN") {
		page = "<%=request.getContextPath()%>/pages/s/receiptLN_viewer.jsp";
	}
	if (page.trim() != "") {
		CenterWindow(page, 500, 400, 1);
	}	
}
	
</script>

</HEAD>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif')">

<% 
	if ( !error.getERRNUM().equals("0")  ) {
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	} else if ("DO_PRINT".equals(userPO.getRedirect()) && (!userPO.getOption().equals("CD") && !userPO.getOption().equals("12"))) {
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showReceipt('" + userPO.getOption() + "')");
		out.println("</SCRIPT>");     
	}
%>

<% 
	String main = "Aprobación de ";
	String appCode = "";
	String typCode = "";
	String title = "";
	if (userPO.getOption().equals("CD")) { 
		appCode="CD"; title = "Certificados";
	} else if(userPO.getOption().equals("13")) { 
		appCode="13"; title = "Papel Comercial";
	} else if(userPO.getOption().equals("12")) { 
		appCode="12"; title = "Bonos";
	} else {
		if (userPO.getOption().equals("LN")) {
			appCode="10"; title = "Préstamos";
		} else {
			appCode="10"; typCode = "G"; title = "Descuento de Documentos";
		}
	}
%>	

<h3 align="center">
	<%=main%> <%=title%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="approval_list.jsp, EDL0140">
</h3>
<hr size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0140" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
	<INPUT TYPE=HIDDEN NAME="action" id="action" VALUE="A">
	<INPUT TYPE=HIDDEN NAME="reason" id="reason" VALUE="">
	<INPUT TYPE=HIDDEN NAME="openVia" id="openVia" VALUE="">
	<INPUT TYPE=HIDDEN NAME="appCode" id="appCode" VALUE="<%=appCode%>">
	<INPUT TYPE=HIDDEN NAME="typCode" id="typCode" VALUE="<%=typCode%>">		
	<INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="<%=appList.getLastRec()%>">

	<div id="divLoanSearch" class="hiddenDiv">
		<table class="approvalSearch" style="width: 500px">
			<caption>B&uacute;squeda</caption>
			<tr > 
				<td align=CENTER nowrap="nowrap"><div align="right" >Numero de Cliente :</div></td>
				<td align=CENTER  > 
					<div align="left">
						<eibsinput:help name="searchParameters" fn_param_one="E01SELCUN" property="E01SELCUN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" />
					</div>
				</td>
			</tr>
			<tr > 
				<td align=CENTER   nowrap="nowrap"><div align="right" >Numero de Identificaci&oacute;n :</div></td>
				<td align=CENTER  > 
					<div align="left"> 
						<eibsinput:help name="searchParameters" fn_param_one="E01SELIDN" property="E01SELIDN" size="25"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" />
					</div> 
				</td>
			</tr>
			<tr > 
				<td align=CENTER   nowrap="nowrap"><div align="right" style="vertical-align: bottom;" > Por Palabra :</div></td>
				<td align=CENTER  > 
					<div align="left" style="vertical-align: bottom;"> 
						<br style="margin: 1px">
						<eibsinput:text property="E01SELNME" name="searchParameters" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="<%=String.valueOf(EibsFields.EIBS_FIELD_NAME_LENGTH)%>" />
					</div>
				</td>
			</tr>
			<tr > 
				<td align=CENTER   nowrap="nowrap"><div align="right" >Tipo de Producto :</div></td>
				<td align=CENTER  > 
					<div align="left"> 
						<input type="text" name="E01SELTYP" size="5" maxlength="4" value="<%=searchParameters.getE01SELTYP()%>" class="TXTRIGHT">
						<a href="javascript:GetProductRates('E01SELTYP','<%=appCode%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="null" align="bottom" border="0" ></a>           
					</div>
				</td>
			</tr>      
			<tr > 
				<td align=CENTER   nowrap="nowrap"><div align="right" > Codigo de Producto:</div></td>
				<td align=CENTER  > 
					<div align="left">
						<input type="text" name="E01SELPRD" maxlength="4" size="5" value="<%=searchParameters.getE01SELPRD()%>" class="TXTRIGHT">
						<a id="linkHelp" href="javascript:GetProduct('E01SELPRD','<%= appCode%>','','', 'E01SELTYP')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="null" align="bottom" border="0"/>
						</a>
					</div>
				</td>
			</tr> 
			<tr > 
				<td align=CENTER   nowrap="nowrap"><div align="right" >Por Sucursal:</div></td>
				<td align=CENTER  > 
					<div align="left"> 
						<eibsinput:help name="searchParameters" fn_param_one="E01SELBRN" property="E01SELBRN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH%>" />
					</div> 
				</td>
			</tr>   
			<tr > 
				<td align=CENTER   nowrap="nowrap"><div align="right" >Por Moneda:</div></td>
				<td align=CENTER  > 
					<div align="left"> 
						<eibsinput:help name="searchParameters" fn_param_one="E01SELCCY" property="E01SELCCY" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" />
					</div> 
				</td>
			</tr>       
			<tr> 
				<td align=center nowrap colspan="2"> 
					<br>
					<input class="styled-button-Search" type=button name="Submit" value="Enviar" onClick="javascript:goAction('Search')">
				</td>
			</tr>      
		</table>
	</div>
	
	<div id="divGenericSearch" class="hiddenDiv">
		<table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
		border-color: #0b23b5;
		border-style : solid solid solid solid;
		filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
			<tr> 
				<td align=CENTER width="18%"><div align="right">Nuevo Codigo :</div></td>
				<td align=CENTER  > 
					<div align="left"> 
						<input type="text" id="E01MMIDEN" name="E01MMIDEN" size="5" maxlength="6">
					</div>
				</td>
			</tr>
			<tr> 
				<td align=center nowrap colspan="2"> 
					<input class="styled-button-Search" type=button name="Submit" value="Enviar" onClick="javascript:goAction('Search')">
				</td>
			</tr>
		</table>
	</div>  
	
	<TABLE class="tbenter" width="100%" align=center>
		<TR> 
			<TD class=TDBKG width="25%"><div align="center"><a id="linkApproval" href="javascript:goAction('A')"><b>Aprobar</b></a></div></TD>
			<TD class=TDBKG width="25%"><div align="center"><a id="linkReject" href="javascript:enterReason('R')"><b>Rechazar</b></a></div></TD>
			<TD class=TDBKG width="25%"><div align="center"><a href="javascript:goAction('D')"><b>Eliminar</b></a></div></TD>
			<TD class=TDBKG width="25%"><div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div></TD>  
		</TR>
	</TABLE>
	
	<TABLE  id="mainTable" class="tableinfo" height="70%">
		<tr height="5%">
			<td NOWRAP valign="top" width="80%">
				<TABLE id="headTable" width="100%" >
					<TR id="trdark"> 
						<TH ALIGN=CENTER rowspan="2" nowrap width="5%"><img id="searchIcon"src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" ></TH>
						<TH ALIGN=CENTER rowspan="2" nowrap width="20%">Cuenta</TH>
						<TH ALIGN=CENTER colspan="2" nowrap width="50%">Cliente</TH>
						<TH ALIGN=CENTER rowspan="2" nowrap width="10%">C&oacute;digo <br> Producto</TH>
						<TH ALIGN=CENTER rowspan="2" nowrap width="15%">Aviso</TH>
					</TR>
					<TR id="trdark"> 
						<TH ALIGN=CENTER nowrap width="10%">N&uacute;mero</TH>
						<TH ALIGN=CENTER nowrap width="40%">Nombre</TH>
					</TR>
				</TABLE>
			</TD>
			<TD nowrap ALIGN="RIGHT" valign="top" width="20%">
				<Table id="tbAddInfoH"  width="100%" >
					<tr id="trdark">
						<TH ALIGN=CENTER nowrap > Informaci&oacute;n B&aacute;sica</TH>
					</tr>
				</Table>
			</TD>
		</TR>	
		<TR height="95%"> 
			<TD NOWRAP valign="top" width="80%">
				<div id="dataDiv1" style=" height:400px; overflow:auto;">  
					<table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
						<%
							if (appList.getNoResult()){
						%>		 
						<tr id="dataTable"> 
							<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c"" colspan="5">
								<br><br><br><br> <font size=3>No hay <%=title %> para la Aprobaci&oacute;n con este criterio. </font>
							</TD>          
			 			</tr>			 
						<% 
							} else {
								appList.initRow();
								while (appList.getNextRow()) {
									out.println(appList.getRecord());
								}
							}
						%> 
					</table>
				</div>
			</td> 
		 <td nowrap ALIGN="RIGHT" valign="top" width="20%">
		 		<% int row = 0; %>
		 		<Table id="tbAddInfo">
					<tr id="trclear"> 
						<TD ALIGN="RIGHT" nowrap><b>Comentario : <br>Capital : <br>Moneda : <br>Banco : <br>Sucursal : <br>Cuenta Contable : <br>Centro de Costo : <br>Lote :<br>Operador : </b></TD>
						<TD ALIGN="LEFT" nowrap class="tdaddinfo"></TD>
					</tr>
				</Table>
			</td>
		</tr>	
	</TABLE>

	<SCRIPT type="text/javascript">
	
	showChecked("ACCNUM");
	getElement("tbAddInfoH").rows[0].cells[0].height = getElement("headTable").rows[0].cells[0].clientHeight;
	
	function closeHiddenDivNew(){
		setVisibility(document.getElementById("hiddenDivNew"), "hidden");
	}

	function showHiddenDiv(evt) {
		evt = (evt) ? evt : ((window.event) ? window.event : "");
		if(isLoanDiv){
			var divLoanSearch = document.getElementById("divLoanSearch");
			var y=evt.clientY + document.body.scrollTop;
			var x=evt.clientX + document.body.scrollLeft;
			cancelBub(evt);
			moveElement(divLoanSearch, y, x);
			setVisibility(divLoanSearch, "visible");
		} else {
			var divGenericSearch = document.getElementById("divGenericSearch");
			var y=evt.clientY + document.body.scrollTop;
			var x=evt.clientX + document.body.scrollLeft;
			cancelBub(evt);
			moveElement(divGenericSearch, y, x);
			setVisibility(divGenericSearch, "visible");			
		}
	}
	
	function closeHiddenDivs(){
		closeHiddenDivApproval_LOAN();
		closeHiddenDivApproval_Generic();
	}	
	
	function closeHiddenDivApproval_LOAN(){
		setVisibility(getElement("divLoanSearch"), "hidden");
	}

	function closeHiddenDivApproval_Generic(){
		setVisibility(getElement("divGenericSearch"), "hidden");
	}
	
	getElement("divLoanSearch").onclick = cancelBub;
	getElement("divGenericSearch").onclick = cancelBub;
	document.getElementById("searchIcon").onclick = showHiddenDiv; 
	addEventHandler(document, 'click', closeHiddenDivs);
	var isLoanDiv = true;
	
</SCRIPT>

</FORM>

</BODY>
</HTML>
