<%@page import = "datapro.eibs.master.Util" %>
<%@page import="datapro.eibs.beans.EDL091102Message"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>

<HTML>
<HEAD>
<TITLE>Prorroga de Plan de Pagos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="header" class="datapro.eibs.beans.EDL091101Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.7.2.js"></script>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-paymentplan.jsp"></script>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-simulacion.jsp"></script>

<SCRIPT type="text/javascript">

var checkRows = new Array();

function getCheckedElements(name) {
	while(checkRows.length > 0) { //Clears array
		 checkRows.pop();
	}
	chkboxs = document.getElementsByName(name);
	for (var i=0; i<chkboxs.length; i++) {
		if (chkboxs[i].checked){
			checkRows.push(i);
		}
	}
}

function checkValWk1(val){
	document.forms[0].H01FLGWK1.value = val;
}

function checkValWk2(val){
	document.forms[0].H01FLGWK2.value = val;
	document.forms[0].ANSWER.value    = val;
	if (val != ('Y')) {
		getElement("divmeses").style.display = 'none';
	} else {
		getElement("divmeses").style.display = 'block';
	}
}

function goSend(typ) {
	getCheckedElements("E01PRLSEL"); 
	var err = false;
	var pag = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0911?SCREEN=175&ANSWER=N&checkRows=';
	var chk = "";
	var wk1 = getRadioVal("H01FLGWK1");
	var wk2 = getRadioVal("H01FLGWK2");
	for (i = 0; i < checkRows.length; i++) {
		pag += checkRows[i]+",";
		chk += checkRows[i];	
	} 
	if (chk == "") {
		alert("Debe seleccionar al menos una cuota");
		return;
	}
	// Cuotas
	if (typ == "1") {
		CenterWindow(pag, 750, 450, 2);
	}
	// Por Desplazamiento
	if (typ == "2") {
		if (document.forms[0].E01NUMMES.value == "0"){
			alert("Debe especificar numero de meses!!");
		} else  {
			pag += "&E01NUMMES="+document.forms[0].E01NUMMES.value+
			       "&E01DLCIGF="+document.forms[0].E01DLCIGF.value+
			       "&E01EXTMES="+document.forms[0].E01EXTMES.value+
			       "&H01FLGWK2="+wk2;
			CenterWindow(pag, 750, 450, 2);
		}
	}
	// Por Fecha
	if (typ == "3") {
		if (document.forms[0].E01NEWDDD.value == "0"){
			alert("Debe especificar fecha!!");
		} else  {
			pag += "&E01NEWDDD="+document.forms[0].E01NEWDDD.value+
			       "&E01NEWMMM="+document.forms[0].E01NEWMMM.value+
			       "&E01NEWYYY="+document.forms[0].E01NEWYYY.value+
			       "&E01NUMMES="+document.forms[0].E01NUMMES.value+
			       "&E01DLCIGF="+document.forms[0].E01DLCIGF.value+
			       "&H01FLGWK1="+wk1;
			       "&H01FLGWK2="+wk2;
			CenterWindow(pag, 750, 450, 2);
		}
	}
}

function goSend2() {
	getCheckedElements("E01PRLSEL"); 
	var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0911?SCREEN=175&checkRows=';
	var pg1="";
	for (i = 0; i < checkRows.length; i++) {
		pg += checkRows[i]+",";
		pg1 += checkRows[i];	
	} 
	if (document.forms[0].E01NUMMES.value == "0"){
		alert("Debe especificar numero de meses!!");
	} else  {
		if (pg1 == ""){
			alert("Debe seleccionar al menos una cuota");
		} else {	
			pg += "&E01NUMMES="+document.forms[0].E01NUMMES.value+"&H01FLGWK2="+document.forms[0].H01FLGWK2.value+"&E01EXTMES="+document.forms[0].E01EXTMES.value;
			CenterWindow(pg, 750, 450, 2);
		}
	}
}

function showDetail(row) {
	showPage("EDL0911_ln_plan_de_pago_det.jsp?Row=" + row);
}

function showPlan(rzn,uqi) {
	var page = '${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0900?SCREEN=100&Type=8';
	CenterWindow(page, 900, 600, 2);
}

$(document).ready(function() {
	$("#E01SELALL").click(function(){
		$('input:checkbox').not(this).not(":disabled").prop('checked', this.checked)
		.closest('tr').toggleClass('selected');
	});
});

</SCRIPT>

</HEAD>

<%
	boolean isInquiry = (userPO.getOption().equals("Inquiry")||userPO.getOption().equals("AppInquiry")) ? true : false;
	boolean selAll = (userPO.getHeader21().trim().equals("2")||userPO.getHeader21().trim().equals("3")) ? true : false; 
	String title = "";
	if (userPO.getHeader21().trim().equals("1")){ 
		title = "Pr&oacute;rroga por Cuotas";
	} else if (userPO.getHeader21().trim().equals("2")){
		title = "Pr&oacute;rroga por Desplazamiento";
	} else if (userPO.getHeader21().trim().equals("3")){
		title = "Pr&oacute;rroga por Fecha";
	} else {
		title = "Pr&oacute;rroga";
	}
%>

<BODY>

<h3 align="center"><%=title%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="prorroga_desplazar_fecha.jsp, EDL0911"> 
</h3>
<hr size="4">

<form>
	<input TYPE=HIDDEN name="SCREEN" id="SCREEN" value="175">
	<input TYPE=HIDDEN name="ANSWER" id="ANSWER" value="">
	<input TYPE=HIDDEN name="DEAPPD" id="DEAPPD" value="<%= header.getE01DEAPPD().trim()%>">

	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="15%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="10%" > 
							<div align="left">
								<eibsinput:text property="E01DEACUN" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01CUSNA1" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Tipo : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01DEATYP" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="10%"> 
							<div align="left"> 
								<input type="text" name="E01DEAACC" size="14" maxlength="12"  readonly value="<% if (header.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(header.getE01DEAACC().trim()); %>">
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01DEACCY" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01DEAPRO" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<% if ((!header.getE01DEACNV().equals("")) && (!header.getE01DSCCNV().equals(""))) { %>
					<tr id="trdark"> 
						<td nowrap width="15%" ><div align="right"><b>Convenio : </b></div></td>
						<td nowrap width="85%" colspan="5"> 
							<div align="left"> 
								<eibsinput:text property="E01DEACNV" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
								<eibsinput:text property="E01DSCCNV" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<% } %>
				</table>
			</td>
		</tr>
 </table>
 
	<br>
	<%int row = 0; %>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right">Monto Inicial :</div></td>
						<td nowrap width="25%"  > 
							<div align="left"><%=header.getE01DEAOAM()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha de Apertura :</div></td>
						<td nowrap width="25%"  > 
							<div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(),header.getE01DEAODM(), header.getE01DEAODD(), header.getE01DEAODY())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Forma C&aacute;lculo Interes :</div></td>
						<td nowrap width="25%" > 
							<div align="left">
							<% if (header.getE01DEAICT().equals("S")) out.print("LINEAL/CALENDARIO/VENCIDO");
							   else if (header.getE01DEAICT().equals("M")) out.print("LINEAL/COMERCIAL/VENCIDO");
							   else if (header.getE01DEAICT().equals("P")) out.print("LINEAL/CALENDARIO/PREPAGADO");
							   else if (header.getE01DEAICT().equals("A")) out.print("LINEAL/COMERCIAL/PREPAGADO");
							   else if (header.getE01DEAICT().equals("D")) out.print("LINEAL/CALENDARIO/DESCONTADO");
							   else if (header.getE01DEAICT().equals("R")) out.print("LINEAL/COMERCIAL/PREPAGADO");
							   else if (header.getE01DEAICT().equals("1")) out.print("EXPON/CALENDARIO/VENCIDO");
							   else if (header.getE01DEAICT().equals("2")) out.print("EXPON/COMERCIAL/VENCIDO");
							   else if (header.getE01DEAICT().equals("3")) out.print("EXPON/CALENDARIO/PREPAGADO");
							   else if (header.getE01DEAICT().equals("4")) out.print("EXPON/COMERCIAL/PREPAGADO");
							   else if (header.getE01DEAICT().equals("5")) out.print("EXPON/CALENDARIO/DESCONTADO");
							   else if (header.getE01DEAICT().equals("6")) out.print("EXPON/COMERCIAL/PREPAGADO");
							   else out.print("");
							%>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha Inicio C&aacute;lculo :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(),	header.getE01DEASDM(), header.getE01DEASDD(), header.getE01DEASDY())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right"> Base C&aacute;lculo Interes :</div></td>
						<td nowrap width="25%"  > 
							<div align="left">
							<% 
							   if (header.getE01DEAIFL().equals("1")) out.print("CAPITAL VIGENTE");
							   else if (header.getE01DEAIFL().equals("2")) out.print("CAPITAL ORIGINAL");
							   else if (header.getE01DEAIFL().equals("3")) out.print("CAPITAL(VIGENTE - VENCIDO)");
							   else if (header.getE01DEAIFL().equals("N")) out.print("NO CALCULA INTERES");
							   else out.print("");
							%>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha de Vencimiento :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(), header.getE01DEAMAM(), header.getE01DEAMAD(), header.getE01DEAMAY())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right"> Base C&aacute;lculo Mora :</div></td>
						<td nowrap width="25%" > 
							<div align="left">
								<% 
								   if (header.getE01DEAPCL().equals("1")) out.print("CAPITAL VENCIDO");
								   else if (header.getE01DEAPCL().equals("2")) out.print("CAPITAL ORIGINAL");
								   else if (header.getE01DEAPCL().equals("3")) out.print("CAPITAL VIGENTE");
								   else if (header.getE01DEAPCL().equals("4")) out.print("(CAPITAL + INTERES)VENCIDO");
								   else if (header.getE01DEAPCL().equals("N")) out.print("NO CALCULA MORA");
								   else out.print("");
								%>
			 				</div>
						</td>
						<td nowrap width="25%"  ><div align="right">Ultimo C&aacute;lculo Interes :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(), header.getE01DEALCM(), header.getE01DEALCD(), header.getE01DEALCY())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ><div align="right">Tasa de Inter&eacute;s :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DEARTE()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Per&iacute;odo Base :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DEABAS()%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ><div align="right">Tasa Efectiva :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DEASPR()%></div>
						</td>
						<td nowrap width="25%" > 
							<% if (header.getE01FLGSBS().equals("Y")){ %>
							<div align="right">Tasa Subsidio :</div>
							<% } %>
						</td>
						<td nowrap width="25%" > 
							<% if (header.getE01FLGSBS().equals("Y")){ %>
							<div align="left"><%= header.getE01DLCRFS()%></div>
							<% } %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<br>
	
	<!-- Por Desplazamiento -->
	<% if (userPO.getHeader21().trim().equals("2")){ %>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ><div align="right">N&uacute;mero de Meses a Desplazar:</div></td>
						<td nowrap width="25%" > 
							<div align="left">
								<input type="text" name="E01NUMMES" size="3" maxlength="2" value="<%= header.getE01NUMMES().trim()%>" onKeypress="enterInteger(event)" <%if(isInquiry)out.println("readonly");%>>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Cambio de Fecha de Vencimiento:</div></td>
						<td nowrap width="25%" > 
							<div align="left">
							<INPUT type="radio" name="H01FLGWK2" <%if(isInquiry)out.println("disabled");%> value="Y" <% if (!header.getH01FLGWK2().equals("N")) out.print("checked");%> onclick="checkValWk2(this.value)">Si
							<INPUT type="radio" name="H01FLGWK2" <%if(isInquiry)out.println("disabled");%> value="N" <% if (header.getH01FLGWK2().equals("N")) out.print("checked");%>  onclick="checkValWk2(this.value)">No
							</div>
						</td>
					</tr>
					<% if (header.getE01DEAPPD().equals("SC1") || header.getE01DEAPPD().equals("SC3")) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ><div align="right">Forma Cobro del periodo de Gracia :</div></td>
						<td nowrap width="25%" > 
							<div align="left">
								<select name="E01DLCIGF" id="E01DLCIGF" <%if(isInquiry)out.println("disabled");%>>
									<option value="" <%if (header.getE01DLCIGF().equals("") ) { out.print("selected"); }%>>Interes Deudor</option>
									<option value="2"<%if (header.getE01DLCIGF().equals("2")) { out.print("selected"); }%>>Cobrar en la 1ra Cuota</option>
									<option value="4"<%if (header.getE01DLCIGF().equals("4")) { out.print("selected"); }%>>Cobrar en Todas las Cuotas</option>
								</select>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Meses a Desplazar Vencimiento:</div></td>
						<td nowrap width="25%" >
							<div align="left">
								<input type="text" name="E01EXTMES" size="3" maxlength="2" value="<%= header.getE01EXTMES().trim()%>" onKeypress="enterInteger(event)" <%if(isInquiry)out.println("readonly");%>>
							</div>
						</td>
					</tr>
					<% } else { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ></td>
						<td nowrap width="25%" > 
							<input TYPE=HIDDEN name="E01DLCIGF" id="E01DLCIGF" value="<%= header.getE01DLCIGF().trim()%>">
						</td>
						<td nowrap width="25%" ><div align="right">Meses a Desplazar Vencimiento:</div></td>
						<td nowrap width="25%" >
							<div align="left">
								<input type="text" name="E01EXTMES" size="3" maxlength="2" value="<%= header.getE01EXTMES().trim()%>" onKeypress="enterInteger(event)" <%if(isInquiry)out.println("readonly");%>>
							</div>
						</td>
					</tr>
					<% } %>
				</table>
			</td>
		</tr>
	</table>
	<% } %>

	<!-- Por Fecha -->
	<% if (userPO.getHeader21().trim().equals("3")){ %>
	<table class="tableinfo" border="0">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ><div align="right">Nueva Proxima Fecha de Pago :</div></td>
						<td nowrap width="25%" > 
							<div align="left">
								<% if (isInquiry) { %>
								<eibsinput:date name="header" fn_month="E01NEWMMM" fn_day="E01NEWDDD" fn_year="E01NEWYYY" readonly="true" />
								<% } else { %>
								<eibsinput:date name="header" fn_month="E01NEWMMM" fn_day="E01NEWDDD" fn_year="E01NEWYYY" />
								<% } %>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Cambio de Fecha de Vencimiento:</div></td>
						<td nowrap width="25%" > 
							<table>
								<tr>
									<td nowrap width="50%" >
										<div align="left">
											<input type="radio" name="H01FLGWK2" <%if(isInquiry)out.println("disabled");%> value="Y" <% if (!header.getH01FLGWK2().equals("N")) out.print("checked");%> onclick="checkValWk2(this.value)">Si
											<input type="radio" name="H01FLGWK2" <%if(isInquiry)out.println("disabled");%> value="N" <% if (header.getH01FLGWK2().equals("N"))  out.print("checked");%> onclick="checkValWk2(this.value)">No
										</div>
									</td>
									<td nowrap width="50%" >
										<div id="divmeses" align="left" style="display: block;">
											<input type="text" name="E01NUMMES" size="3" maxlength="2" value="<%= header.getE01NUMMES().trim()%>" onKeypress="enterInteger(event)" <%if(isInquiry)out.println("readonly");%>>
											(meses)
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<% if (header.getE01DEAPPD().equals("SC1") || header.getE01DEAPPD().equals("SC3")) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ><div align="right">Forma Cobro del periodo de Gracia :</div></td>
						<td nowrap width="25%" > 
							<div align="left">
								<select name="E01DLCIGF" id="E01DLCIGF" <%if(isInquiry)out.println("disabled");%>>
									<option value="" <%if (header.getE01DLCIGF().equals("") ) { out.print("selected"); }%>>Interes Deudor</option>
									<option value="2"<%if (header.getE01DLCIGF().equals("2")) { out.print("selected"); }%>>Cobrar en la 1ra Cuota</option>
									<option value="4"<%if (header.getE01DLCIGF().equals("4")) { out.print("selected"); }%>>Cobrar en Todas las Cuotas</option>
								</select>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Reemplaza Per.Gracia Previo:</div></td>
						<td nowrap width="25%" > 
							<div align="left">
							<INPUT type="radio" name="H01FLGWK1" <%if(isInquiry)out.println("disabled");%> value="Y" <% if ( header.getH01FLGWK1().equals("Y")) out.print("checked");%> onclick="checkValWk1(this.value)">Si
							<INPUT type="radio" name="H01FLGWK1" <%if(isInquiry)out.println("disabled");%> value="N" <% if (!header.getH01FLGWK1().equals("Y")) out.print("checked");%> onclick="checkValWk1(this.value)">No
							</div>
						</td>
					</tr>
					<% } %>
				</table>
			</td>
		</tr>
	</table>
	<% 	if (!header.getE01DEAPPD().equals("SC1") && !header.getE01DEAPPD().equals("SC3")) { %>
				<input TYPE=HIDDEN name="E01DLCIGF" id="E01DLCIGF" value="<%= header.getE01DLCIGF().trim()%>">
				<input TYPE=HIDDEN name="H01FLGWK1" id="H01FLGWK1" value="<%= header.getH01FLGWK1().trim()%>">
	<% 	} %>
	<% } %>

	<br>
	<h4>Seleccione la Cuota Que Desea Cambiar</h4>
	<table class="tableinfoList"  cellpadding=2 cellspacing=3 >
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<TH ALIGN=CENTER nowrap width="5%" >
				<input type="checkbox" id="E01SELALL" name="E01SELALL" value="Y" <% if (selAll) out.print("Disabled checked"); %>/>
			</TH> 
			<TH ALIGN=CENTER nowrap width="5%" >Sel.<br>Todo</TH> 
			<TH ALIGN=CENTER nowrap width="15%" >Nro<br>Cuota</TH>
			<TH ALIGN=CENTER nowrap width="12%" >Fecha <br>a Pagar</TH>
			<TH ALIGN=CENTER nowrap width="15%" >Principal</TH>
			<TH ALIGN=CENTER nowrap width="15%" >Inter&eacute;s</TH>
			<TH ALIGN=CENTER nowrap width="15%" >Otros<br>Cargos</TH>
			<TH ALIGN=CENTER nowrap width="15%" >Total<br>Cuota</TH>
		</TR>
		<tr  height="100%">    
			<td nowrap="nowrap" colspan="8">       
				<div id="dataDiv1"  style="max-height:400px; overflow:auto; border: 0px;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					   double suma = 0;
					   double sumb = 0;
					   double sumc = 0;
					   double sumd = 0;
					   double sume = 0;
					   list.initRow();
					   while (list.getNextRow()) {
					     EDL091102Message plan = (EDL091102Message) list.getRecord();
					     suma += plan.getBigDecimalE02DLPPRN().doubleValue();
					     sumb += plan.getBigDecimalE02DLPINT().doubleValue();
					     sumc += plan.getBigDecimalE02DLPOTH().doubleValue();
					     sumd += plan.getBigDecimalE02DLPPAG().doubleValue();
					     sume = suma + sumb + sumc - sumd;
					%> 
						<tr id="dataTable<%= list.getCurrentRow() %>">
							<td nowrap align="center" width="4.5%" >
								<input type="checkbox" id="E01PRLSEL" name="E01PRLSEL" value="Y" class="highlight" <% if (plan.getE02DLPSTS().trim().equals("P")) out.print("Disabled"); %> <% if (isInquiry) out.println("disabled"); %> <% if (selAll && !plan.getE02DLPSTS().trim().equals("P")) out.print("Disabled checked"); %> onclick="checkPrevious(<%=list.getCurrentRow()%>,<%=list.getLastRec()%>);">
							</td>
							<td nowrap align="center" width="6%" ></td>
							<td nowrap align="center" width="13%">
								<a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPPNU()%></a>
							</td>
							<td nowrap align="center" width="13%">
								<a href="javascript:showDetail(<%= list.getCurrentRow() %>)">&nbsp;&nbsp;<%=Util.formatCustomDate(currUser.getE01DTF(),plan.getE02DLPPDM(), plan.getE02DLPPDD(),plan.getE02DLPPDY())%></a>
							</td>
							<td nowrap align="right" width="14%">
								<a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPPRN()%></a>
							</td>
							<td nowrap align="right" width="14%">
								<a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPINT()%></a>
							</td>
							<td nowrap align="right" width="14%">
								<a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPOTH()%></a>
							</td>
							<td nowrap align="right" width="17%">
								<a href="javascript:showDetail(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPTOT()%></a>
							</td>
						</tr>
					<% } %> 
					</table>
				</div>
			</td>
		</tr>
	</table>
	
	<h4>Totales</h4>
	<TABLE class="tableinfo"  cellpadding=2 cellspacing=3>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>PRINCIPAL : </b><%= Util.formatCCY(suma) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES : </b><%= Util.formatCCY(sumb) %></TD>
			<TD ALIGN=CENTER  nowrap><b>OTROS CARGOS : </b><%= Util.formatCCY(sumc) %></TD>
			<TD ALIGN=CENTER  nowrap><b>MONTO PAGADO : </b><%= Util.formatCCY(sumd) %></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3" >__________________________________________________________________________</TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3"><b>TOTAL A PAGAR : </b><%= Util.formatCCY(sume) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
	</TABLE>

	<div align="center" style="width:95%"> 
	<%if(!isInquiry) {%>
		<input id="EIBSBTN" type=button name="Submit" OnClick="goSend(<%=userPO.getHeader21().trim()%>)" value="Enviar">
	<%}%>
	<%if (!userPO.getAccNum().trim().equals("")){%>
		<input class="EIBSBTN" type="button" name="Plan" value="Plan de Pago" onclick="showPlan()">
	<%}%>
		<input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Salir">
	</div>

	<% if (userPO.getHeader21().trim().equals("2")){ %>
	<script type="text/javascript">
		document.forms[0].E01NUMMES.focus();
		document.forms[0].E01NUMMES.select();
		checkValWk2('Y');
	</script>
	<% } %>

	<% if (userPO.getHeader21().trim().equals("3")){ %>
	<script type="text/javascript">
		checkValWk1('<%= header.getH01FLGWK1().trim() %>');
	</script>
	<% } %>

	<% if (userPO.getHeader21().trim().equals("2") || userPO.getHeader21().trim().equals("3")){ %>
	<script type="text/javascript">
		checkValWk2('<%= header.getH01FLGWK2().trim() %>');
	</script>
	<% } %>

</FORM>

<script type="text/javascript">
function checkedRows(row) {
	for ( var i = row-1; -1 < i; i--){
		var rowId = "#dataTable"+String(i);
		$(rowId).closest('tr').find('[type=checkbox]').prop('checked', true); 
		if($(rowId).closest('tr').find('[type=checkbox]').is(':checked')){
			$(rowId).closest('tr').addClass('selected');
		}else{
			$(rowId).closest('tr').removeClass('selected');
		} 
	}
}

function checkPrevious(row,length) {
	var clickrowId = "#dataTable"+String(row);
	
	if($(clickrowId).closest('tr').find('[type=checkbox]').is(':checked')){ //Clicked Rows CheckBox
		$(clickrowId).closest('tr').addClass('selected');
	}else{
		$(clickrowId).closest('tr').removeClass('selected');
	} 
	
	var forwardBoxesChecked = false;
	for ( var i = length; row < i; i--){
		var rowId = "#dataTable"+String(i);
		forwardBoxesChecked = $(rowId).closest('tr').find('[type=checkbox]').is(':checked'); 
		if( true == forwardBoxesChecked ){
			 row = i;
			 break;
		}
	}
	checkedRows(row);
}


</script>

</BODY>
</HTML>
