<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Conexión</TITLE>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="currClient" class="datapro.eibs.beans.ESD080001Message" scope="session" />

<% 
	String client = "0";
	String title = "";
	String cuenta = "Cuenta";
	
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		title="Mantenimiento de ";
	} else if (userPO.getPurpose().equals("STATEMENT")) {
		title="Estados de Cuenta - ";
	} else if (userPO.getPurpose().equals("PRINT")) {
		title="Impresión de ";
	} else if (userPO.getPurpose().equals("PDN")) {
		title="";
	} else if (userPO.getPurpose().equals("RENEWAL")) {
		title="Prorroga de ";	   
	} else if (userPO.getPurpose().equals("STATUS")) {
		title="Cambio Estado - "; 
	} else title = "Consulta de ";

	if (userPO.getOption().equals("CD")) { 
		cuenta = "Deposito";
		title = title + "Depositos a Plazo";
	} else if (userPO.getOption().equals("LN")) { 
		cuenta = "Pr&eacute;stamo";
		title = title + "Pr&eacute;stamos";
	} else if (userPO.getOption().equals("12")) { 
		cuenta = "Bono";
		title = title + "Bonos";		
	} else if (userPO.getOption().equals("CL")) { 
		cuenta = "Linea";
		title = title + "Linea Multiuso";
	} else if (userPO.getOption().equals("RT"))     { title = title + "Cuentas Corrientes";
	} else if (userPO.getOption().equals("SV"))     { title = title + "Cuentas Ahorro";
	} else if (userPO.getOption().equals("CP"))     { title = title + "Cuotas de Participacion";
	} else if (userPO.getOption().equals("CC"))     { title = title + "Cuenta de Crédito";
	} else if (userPO.getOption().equals("WT"))     { title = title + "Giros Diferidos";
	} else if (userPO.getOption().equals("SB"))     { title = title + "Sobregiro Pactado";
	} else if (userPO.getOption().equals("TC"))     { title = title + "Tarjetas de Credito";
	} else if (userPO.getOption().equals("X1"))     { title = title + "Creditos Hipotecarios";
	} else if (userPO.getOption().equals("X2"))     { title = title + "Mutuos Hipotecarios";
	} else if (userPO.getOption().equals("X3"))     { title = title + "Comercio Exterior";
	} else if (userPO.getOption().equals("X4"))     { title = title + "Cobranza de Letras";
	} else if (userPO.getOption().equals("IN"))     { title = title + "Inversiones";
	} else if (userPO.getOption().equals("RT_CHG")) { title = title + "Comisiones Periódicas en Cuentas Corrientes";
	} else if (userPO.getOption().equals("SV_CHG")) { title = title + "Comisiones Periódicas en Cuentas de Ahorro";
	} else if (userPO.getOption().equals("LNR"))    { title = title + "Tasa de Cambio en Prestamos";
	} else if (userPO.getOption().equals("PR_OP"))  { title = title + "Ordenes de Pago";
	} else if (userPO.getOption().equals("SWAP"))   { title = title + "Relaci&oacute;n Swap";
	} else if (userPO.getOption().equals("CAVL"))   { title = title + "Cheques Avalados";
	} else if (userPO.getOption().equals("TITU"))   { title = title + "Venta de Cartera / Titularizaci&oacute;n";
	} else if (userPO.getOption().equals("ST"))     { title = title + "Cuentas";
	} else if (userPO.getOption().equals("CO"))     { title = title + "Garantías";	
	} else if (userPO.getOption().equals("BG"))     { title = title + "Documentarias";	
	}

	if (currClient != null) {
		client = currClient.getE01CUSCUN();
	}
%>

<script type="text/javascript">

	function enter(code) {
		document.forms[0].<%= userPO.getHeader1() %>.value = code;
		document.forms[0].submit();
	}
	
	function enterAction(code,numc,id,prod,card) {
		document.forms[0].<%= userPO.getHeader1() %>.value = code;
		<% if (!userPO.getHeader3().equals("")) {%>
		document.forms[0].<%= userPO.getHeader3() %>.value = prod;
		<% } %>
		<% if (!userPO.getHeader4().equals("")) {%>
		document.forms[0].<%= userPO.getHeader4() %>.value = id;
		<% } %>
		<% if (!userPO.getHeader5().equals("")) {%>
		document.forms[0].<%= userPO.getHeader5() %>.value = card;
		<% } %>
		document.forms[0].SELCLIENT.value = numc;
		document.forms[0].submit();
	}

	function typeClick(value) {
		if (value == "I"){
			document.getElementById('DIVNAME').style.display='none' ;
			displayIdDivs(true);
		} else {
			displayIdDivs(false);
			document.getElementById('DIVNAME').style.display='block' ;
		}
		if (value == "I" || value == "D"){
			if(isValidObject(document.forms[0].COUNTRY)){
				document.forms[0].COUNTRY.focus();
			}
		} else {
			document.forms[0].NameSearch.value = "";
			document.forms[0].NameSearch.focus();
		}
		if (value == "A") {
			document.getElementById("DIVSUBMIT").style.display="";
			document.getElementById('btnSearch').style.display="none";
		} else {
			document.getElementById("DIVSUBMIT").style.display="none";
			document.getElementById('btnSearch').style.display="inline";
		}
	}

	function searchById(){
		enterSearch(false);
	}

	function enterSearch(firsTime){
		var Type = getElementChecked("Type").value;
		var NameSearch = Type === 'I' ? document.forms[0].IDN.value : document.forms[0].NameSearch.value;
		var FromRecord = 0;
		var Client = "<%= client %>";
		var AppCode = "<%= userPO.getProdCode() %>";
		var Bank = "";
		var Selection = "";
		var Account = "";
		var Status = getElement("status").checked ? getElement("status").value : "";
		
		if (NameSearch.length < 1) {
			NameSearch = ".";
		} //else Client = "0";
		
		if (Type == "N") {
			if (firsTime) {
				document.forms[0].NameSearch.value = Client;
			} else {
				Client = justifyRight(NameSearch, 20);
				NameSearch = ".";
			}
		}  else if (Type == "A") { //Account Search
				Account = NameSearch;
				NameSearch = "";
		}  
		<% String userPOKey = (String)request.getParameter("userPOKey"); %>
			parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0005?<%=userPOKey!=null?"userPOKey="+userPOKey+"@":""%>NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrSelect=" + Type + "@shrClient=" + Client + "@shrAcc=" + Account + "@shrStatus=" + Status + "'";
	
	}

	function enterACC(){
		var NameSearch = trim(document.forms[0].NameSearch.value);
		if (getElement("DIVSUBMIT").style.display !="") {
			if (document.forms[0].<%= userPO.getHeader1() %>.value !="0") return true;
			else {
				enterSearch(false); //call search
				return false;
			}
		}
		if (NameSearch.length > 0){
			document.forms[0].<%= userPO.getHeader1() %>.value=NameSearch;	 
			return true;
		} else {
			alert("Es requerido que se entre un valor");
			document.forms[0].NameSearch.focus();
			return false;
		}
	}

	function enterACC2(){
		var NameSearch = trim(document.forms[0].NameSearch.value);
		if (NameSearch.length > 0){
			document.forms[0].<%= userPO.getHeader1() %>.value=NameSearch;	 
		} else {
			document.forms[0].<%= userPO.getHeader1() %>.value="0";	 
		}
		document.forms[0].submit();
	}

	function enterNameSearch(event) {
		var value = getElementChecked("Type").value;
		if (value == "N" || value == "A") {
			enterInteger(event);
		}
	}

</script>

</HEAD>

<body>

<h3 align="center"><%=title%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="account_enter_search, GENERIC"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%><%= userPO.getRedirect()%>" target="_parent" onsubmit="return(enterACC());">
	<input type="hidden" name="<%=userPO.getHeader1()%>" value="0">
	<input type="hidden" name="<%=userPO.getHeader2()%>" value="">
	<input type="hidden" name="SELCLIENT" value=""> 
	<% if (!userPO.getHeader3().equals("")) { %>
	<input type="hidden" name="<%=userPO.getHeader3()%>" value="">
	<% } %>
	<% if (!userPO.getHeader4().equals("")) { %> 
	<input type="hidden" name="<%=userPO.getHeader4()%>" value=""> 
	<% } %> 
	<% if (!userPO.getHeader5().equals("")) { %> 
	<input type="hidden" name="<%=userPO.getHeader5()%>" value="">
	<% } %>

	<CENTER >

	<table id="TBHELP" align="center">
		<tr>
			<td nowrap>
				<table class="TBHELP" align="center" width="250" border="0" cellspacing="0" cellpadding="0" style="background-color: transparent">
					<tr>
						<td nowrap id="THHELP">B&uacute;squeda por:</td>
						<td nowrap><input type="radio" name="Type" value="N" onclick="typeClick('N')" checked>N&uacute;mero Cliente</td>
					</tr>
					<tr>
						<td nowrap align="left" >
							<input type="checkbox" id="status" name="status" value="Y">Ver Cerradas 
						</td>
						<td nowrap><input type="radio" name="Type" value="I" onclick="typeClick('I')">Identificaci&oacute;n Cliente</td>
					</tr>
					<tr>
						<td nowrap></td>
						<td nowrap><input type="radio" name="Type" value="S" onclick="typeClick('S')">Nombre Corto</td>
					</tr>
					<tr>
						<td nowrap></td>
						<td nowrap><input type="radio" name="Type" value="W" onclick="typeClick('W')">Por Palabra</td>
					</tr>
					<tr>
						<td nowrap></td>
						<td nowrap><input type="radio" name="Type" value="A" onclick="typeClick('A')">Por No. <%=cuenta%></td>
					</tr>
					<tr>
						<td nowrap></td>
						<td nowrap><input type="radio" name="Type" value="O" onclick="typeClick('O')">Por No. <%=cuenta%> Viejo(a)</td>
					</tr>
				</table>
			</td>
			<td nowrap>
				<div id="DIVNAME" style="position: relative; display: none;">
					<input type="text" name="NameSearch" size=25 maxlength="30" onkeypress="enterNameSearch(event)">&nbsp;&nbsp;
					<div id="btnSearch"><img id="btnSearchImg" src="<%=request.getContextPath()%>/images/search1.gif" style="cursor: hand;" onClick="enterSearch(false)" width="25" height="20"></div>
				</div>
				<jsp:include page="ESD0080_client_id_enter_template.jsp"/>
			</td>
			<td nowrap></td>
		</tr>
		<tr valign="middle">
			<td nowrap colspan="2" align="center">
				<div id=DIVSUBMIT align="center" style="display: none;">
					<input id="EIBSBTN" type=button name="Submit" value="Enviar" onclick="validateForm();">
				</div>
			</td>
			<td nowrap></td>
			<td nowrap></td>
		</tr>
	</table>

</CENTER>

</FORM>

<SCRIPT type="text/javascript">;
	
	typeClick('N');
	
	function resizeDoc() {
		for(var i = 0; i < document.forms[0].Type.length; i++) {
			if (document.forms[0].Type[i].checked)
				document.forms[0].Type[i].click();
		}
	}
	
	window.onresize=resizeDoc;
	if(getElement('btnSearch').style.display == "" || getElement('btnSearch').style.display == "inline"){
		clickElementID('btnSearchImg');
	}
	     
	function validateForm(e){
		if (getRadioVal("Type") === "A" || getRadioVal("Type") === "O"){
			if(enterACC()){
				document.forms[0].submit();
			}
		} else if (getRadioVal("Type") === "I"){
			searchById();
		} else {
			enterSearch(false);
		}
	}      
			
	<%-- Enter Action Submits Page or Searches --%>
	defer(function(){ return typeof $.fn.pressEnter !== 'undefined'}, function fn(){
		$(document).ready(function(){
			$(document).pressEnter(function(evt){
				validateForm(evt);
			});
		});	
		return fn;
	});	 

</SCRIPT>

<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
%>
<SCRIPT type="text/javascript">
	showErrors();
</SCRIPT>
<%
	}
	if (!client.equals("0") ) { 
%>
<SCRIPT type="text/javascript">
	enterSearch(true);
</SCRIPT>
<%
	}
%>

</BODY>

</HTML>

