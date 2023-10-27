<%@page isELIgnored="false"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Apertura / Mantenimiento de Cobranza Documentaria Recibida</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="dcNew"  class="datapro.eibs.beans.EDC000001Message" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<SCRIPT type="text/javascript">
  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu('<%= request.getParameter("OPTMENU")%>');
   <%} else {%>
<% 
if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL")) { %>
	   <%if ("N".equals(dcNew.getE01DCMOPT())) {%>
		builtNewMenu('dc_d_inquiry_opening');
	   <% } else { %>
	   	builtNewMenu('dc_d_inquiry');
	   <% } %>
<% } else if (!userPO.getPurpose().equals("NEW")) {%>
		builtNewMenu('dc_d_maint');
<% } %>
<%}%>
   
   function showButton() {
   		getElement("buttom_payments").style.visibility = "visible";
   }
	
   function hiddenButton() {
   		getElement("buttom_payments").style.visibility = "hidden";
   }
	
	function validate() {
		document.forms[0].submit();
	}
	
	function finalize() {
		document.forms[0].H01FLGWK3.value = 'Y';
		document.forms[0].submit();
	}

    function goMsgSwift() {
	   page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=8&TRANSREFNUM="+document.forms[0].E01DCMACC.value;
 	   CenterWindow(page,450,350,2);
 	}
 	
 	function GetTariffCollExt(name, type, cun1, cun2) {
 		var value = getElement(cun1).value == 0 ? getElement(cun2).value : getElement(cun1).value;
 		GetTariffColl(name, type, value);
 	} 
 	
 	function updateSwift(value) {
 		document.getElementById("swift").disabled = value == "N";
 		if (value == "N") {
 			document.getElementById("swift").value = "";
 			document.getElementById("swift").focus();
 		}
 	}	
 		
</SCRIPT>

<%

if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}

if (!userPO.getPurpose().equals("NEW")) {
	out.println("<SCRIPT> initMenu();  </SCRIPT>");
}

String ctrlDisabled = userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL") ? "disabled" : "";
String ctrlReadonly = userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL") ? "readonly" : "";
String ctrlReadonlyRate = !"N".equals(dcNew.getE01DCMOPT()) ? "readonly" :  ctrlReadonly;
String ctrlReadonlyCurrency = !currUser.getE01BCU().equals(dcNew.getE01DCMCCY().trim()) ? "readonly" : ctrlReadonly;

%>

</head>
<body>
<h3 align="center"><%= dcNew.getE01DCMOPT().equals("N")?"Apertura":"Mantenimiento" %> de Cobranza Documentaria Recibida <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dc_opening_incoming.jsp, EDC0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0000">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<%if (userPO.getPurpose().equals("NEW"))out.print("2"); else out.print("4");%>">
<input type="hidden" name="H01FLGWK3">
<table class="tableinfo">
	<tr>
		<td nowrap>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
			<TBODY><TR id="trdark">
				<TD nowrap width="16%">
					<DIV align="right"><B>Banco :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01DCMBNK" readonly size="4" maxlength="2" value="<%=dcNew.getE01DCMBNK().trim()%>">
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Número de Cobranza   :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
				<%if (dcNew.getE01DCMACC().trim().equals("999999999999"))
				{%>
					<INPUT type="text" size="12" maxlength="12" value="Nuevo" readonly>
					<INPUT type="hidden" name="E01DCMACC" value="<%=dcNew.getE01DCMACC().trim()%>">
				<%}
				else
				{%>
					<INPUT type="text" name="E01DCMACC" size="12" maxlength="12" value="<%=dcNew.getE01DCMACC().trim()%>" readonly>
				<%}%>
					</B></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%">
					<DIV align="right"><B>Nuestra Referencia :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01DCMORF" size="20" maxlength="16" value="<%=dcNew.getE01DCMORF().trim()%>">
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Tipo de Cobranza :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="X01DCMTYP" size="20" maxlength="16" value="<%=dcNew.getE01DCMTYP().trim().equals("O") ? "Enviada" : "Recibida"%>" readonly>
						<INPUT type="hidden" name="E01DCMTYP" value="<%=dcNew.getE01DCMTYP().trim()%>">
						
					</B></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="16%">
					<DIV align="right"><B>Producto :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
					    <INPUT type="text" name="E01DCMPRO" size="6" maxlength="4" value="<%=dcNew.getE01DCMPRO().trim()%>" readonly>
					</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Descripción de Producto :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DSCPRO" size="34" maxlength="30" value="<%=dcNew.getE01DSCPRO().trim()%>" readonly>
					</B></DIV>
				</TD>
			</TR>
			</TBODY></TABLE>
		</td>
	</tr>
</table>


<h4>Girador (Exportador)</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%">
							<select name="E01DCMAF1" <%=ctrlDisabled%>>
								<option value=" " <%if (!(dcNew.getE01DCMAF1().equals("C") || dcNew.getE01DCMAF1().equals("A"))) out.print("selected");%>></option>
								<option value="C" <%if (dcNew.getE01DCMAF1().equals("C")) out.print("selected");%>>Cliente</option>
								<option value="A" <%if (dcNew.getE01DCMAF1().equals("A")) out.print("selected");%>>Cuenta</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMDRA" id="E01DCMDRA" size="12" maxlength="12" value="<%=dcNew.getE01DCMDRA()%>" <%=ctrlReadonly%> 
							<%if (dcNew.getF01DCMDRA().equals("Y")) out.print("class=\"txtchanged\"");%>>
						</td>
						<td>
						<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
							<a href="javascript: GetCustomerDetails('E01DCMDRA','E01DCMDR1','','','','E01DCMDR2','E01DCMDR3','E01DCMDR4','','','','','','','','','','')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onclick="javascript: document.forms[0].E01DCMAF1.selectedIndex = 1" border="0"></a> Cliente o
							<a href="javascript: GetAccByClient('E01DCMDRA','','RT','','')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onclick="javascript: document.forms[0].E01DCMAF1.selectedIndex = 2" border="0"></a> Cuenta
						<% } %>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Nombre :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR1" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR1()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMDR1().equals("Y")) out.print("class=\"txtchanged\"");%>>
						<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio"  border="0">
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Dirección :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR2" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR2()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMDR2().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR3" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR3()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMDR3().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR4" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR4()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMDR4().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Referencia :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMDRF()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMDRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Girado (Importador)</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%">
							<select name="E01DCMAF2" <%=ctrlDisabled%>>
								<option value=" " <%if (!(dcNew.getE01DCMAF2().equals("C") || dcNew.getE01DCMAF2().equals("A"))) out.print("selected");%> selected></option>
								<option value="C" <%if (dcNew.getE01DCMAF2().equals("C")) out.print("selected");%>>Cliente</option>
								<option value="A" <%if (dcNew.getE01DCMAF2().equals("A")) out.print("selected");%>>Cuenta</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMDWA" id="E01DCMDWA" size="12" maxlength="12" value="<%=dcNew.getE01DCMDWA()%>" <%=ctrlReadonly%>
							<%if (dcNew.getF01DCMDWA().equals("Y")) out.print("class=\"txtchanged\"");%>>
						</td>
						<td>
						<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
							<a href="javascript: GetCustomerDetails('E01DCMDWA','E01DCMDW1','','','','E01DCMDW2','E01DCMDW3','E01DCMDW4','','','','','','','','','','')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onclick="javascript: document.forms[0].E01DCMAF2.selectedIndex = 1" border="0"></a> Cliente o
							<a href="javascript: GetAccByClient('E01DCMDWA','','RT','','E01DCMDW1')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onclick="javascript: document.forms[0].E01DCMAF2.selectedIndex = 2" border="0"></a> Cuenta
						<% } %>	
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Nombre :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW1" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW1()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMDW1().equals("Y")) out.print("class=\"txtchanged\"");%>>
						<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio"  border="0">
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Dirección :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW2" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW2()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMDW2().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW3" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW3()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMDW3().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW4" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW4()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMDW4().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Documento : </div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DSC101" size="45" maxlength="35" value="<%=dcNew.getE01DSC101()%>" <%=ctrlReadonly%>
						>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Referencia :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMILN" size="20" maxlength="16" value="<%=dcNew.getE01DCMILN()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMILN().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			
		</table>
		</td>
	</tr>
</table>

<% if(!dcNew.getE01DCMDIR().equals("Y")){ %>
<h4>Banco Remitente</h4>
<table class="tableinfo">
	<tr>
		<td>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
			<TBODY><TR id="trdark">
				<TD align="right">
				<TABLE border="0" cellspacing="0">
					<TBODY><TR id="trdark">
						<TD align="right">Numero de Cliente o de Cuenta:</TD>
						<TD nowrap width="25%"><SELECT name="E01DCMAF3" <%=ctrlDisabled%>>
							<OPTION value=" "></OPTION>
							<OPTION value="C" <%if (dcNew.getE01DCMAF3().equals("C")) out.print("selected");%>>Cliente</OPTION>
							<OPTION value="A" <%if (dcNew.getE01DCMAF3().equals("A")) out.print("selected");%>>Cuenta</OPTION>
						</SELECT></TD>
					</TR>
				</TBODY></TABLE>
				</TD>
				<TD>
				<TABLE border="0" cellspacing="0">
					<TBODY>
						<TR id="trdark">
							<TD align="left">
								<INPUT type="text" name="E01DCMRBA" id="E01DCMRBA" size="12" maxlength="12" value="<%=dcNew.getE01DCMRBA()%>" <%=ctrlReadonly%>
								<%if (dcNew.getF01DCMRBA().equals("Y")) out.print("class=\"txtchanged\"");%>>
							</TD>
							<TD>
							<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
								<A href="javascript: GetCustomerDetails('E01DCMRBA','E01DCMRB1','','','','E01DCMRB2','E01DCMRB3','E01DCMRB4','','','','','','','','','','')">
								<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" onclick="javascript: document.forms[0].E01DCMAF3.selectedIndex = 1" align="bottom" border="0"></A> Cliente o
								<A href="javascript: GetAccByClient('E01DCMRBA','','RT','','E01DCMRB1')">
								<IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onclick="javascript: document.forms[0].E01DCMAF3.selectedIndex = 2" border="0"></A> Cuenta
							<% } %>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				</TD>
			</TR>
			  <TR id="trclear">
			    <TD align="right" nowrap>Codigo Swift:</TD>
			    <TD align="left" nowrap><INPUT type="text" name="E01DCMRBI" size="14" maxlength="12" value="<%=dcNew.getE01DCMRBI()%>" <%=ctrlReadonly%>
			    <%if (dcNew.getF01DCMRBI().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
			      <A href="javascript:GetSwiftIdDesc('E01DCMRBI','E01DCMRB1','E01DCMRB2','E01DCMRB3')"> 
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0">
				  </A> 
				 <% } %>
				 </TD>
			  </TR>
			<TR id="trdark">
				<TD>
					<DIV align="right">Nombre :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB1" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB1()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMRB1().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right">Dirección :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB2" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB2()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMRB2().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB3" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB3()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMRB3().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB4" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB4()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMRB4().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right">Referencia :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMRRF()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMRRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
		</TBODY></TABLE>
		</td>
	</tr>
</table>
<% } %>
<%-- START ADDED BY LMCR / MRC 20120622 --%>

<h4>Banco Reembolsador</h4>
<table class="tableinfo">
	<tr>
		<td>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
			<TBODY><TR id="trdark">
				<TD align="right">
				<TABLE border="0" cellspacing="0">
					<TBODY><TR id="trdark">
						<TD align="right">Numero de Cliente o de Cuenta:</TD>
						<TD nowrap width="25%"><SELECT name="E01DCMAF5" <%=ctrlDisabled%>>
							<OPTION value=" "></OPTION>
							<OPTION value="C" <%if (dcNew.getE01DCMAF5().equals("C")) out.print("selected");%>>Cliente</OPTION>
							<OPTION value="A" <%if (dcNew.getE01DCMAF5().equals("A")) out.print("selected");%>>Cuenta</OPTION>
						</SELECT></TD>
					</TR>
				</TBODY></TABLE>
				</TD>
				<TD>
				<TABLE border="0" cellspacing="0">
					<TBODY>
						<TR id="trdark">
							<TD align="left">
								<INPUT type="text" name="E01DCMSRA" id="E01DCMSRA" size="12" maxlength="12" value="<%=dcNew.getE01DCMSRA()%>"
								<%if (dcNew.getF01DCMSRA().equals("Y")) out.print("class=\"txtchanged\"");%>>
							</TD>
							<TD>
							<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
								<A href="javascript: GetCustomerDetails('E01DCMSRA','E01DCMSRB','','','','E01DCMSR2','E01DCMSR3','E01DCMSR4','','','','','','','','','','')">
								<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" onclick="javascript: document.forms[0].E01DCMAF5.selectedIndex = 1" align="bottom" border="0"></A> Cliente o
								<A href="javascript: GetAccByClient('E01DCMSRA','','RT','','E01DCMSRB')">
								<IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onclick="javascript: document.forms[0].E01DCMAF5.selectedIndex = 2" border="0"></A> Cuenta
							<% } %>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				</TD>
			</TR>
			  <TR id="trclear">
			    <TD align="right" nowrap>Codigo Swift:</TD>
			    <TD align="left" nowrap><INPUT type="text" name="E01DCMSRI" size="14" maxlength="12" value="<%=dcNew.getE01DCMSRI()%>" <%=ctrlReadonly%>
			    <%if (dcNew.getF01DCMSRI().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
			      <A href="javascript:GetSwiftIdDesc('E01DCMSRI','E01DCMSRB','E01DCMSR2','E01DCMSR3')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></A>
				<% } %>  
				</TD>
			  </TR>
			<TR id="trdark">
				<TD>
					<DIV align="right">Nombre :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMSRB" size="45" maxlength="35" value="<%=dcNew.getE01DCMSRB()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMSRB().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right">Dirección :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMSR2" size="45" maxlength="35" value="<%=dcNew.getE01DCMSR2()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMSR2().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMSR3" size="45" maxlength="35" value="<%=dcNew.getE01DCMSR3()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMSR3().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMSR4" size="45" maxlength="35" value="<%=dcNew.getE01DCMSR4()%>" <%=ctrlReadonly%>
						<%if (dcNew.getF01DCMSR4().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
		</TBODY></TABLE>
		</td>
	</tr>
</table>

<%-- END ADDED BY LMCR / MRC 20120622 --%>

  <h4>Información de la Cobranza</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY>
          <TR id="trclear">
            <TD nowrap width="30%">
             	<DIV align="right">Oficina :</DIV>
			</TD><TD nowrap width="20%">
			    <% if(!dcNew.getE01DCMOPT().equals("N")){ %>
			    <INPUT type="text" name="E01DCMBRN" maxlength="3" size="3" value="<%= dcNew.getE01DCMBRN().trim()%>" readonly>
            	<% } else { %>	
            	<INPUT type="text" name="E01DCMBRN" maxlength="3" size="3" value="<%= dcNew.getE01DCMBRN().trim()%>" <%=ctrlReadonly%>
            	>
					<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
            	<A href="javascript:GetBranch('E01DCMBRN',document.forms[0].E01DCMBNK.value,'')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
					<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"></A> 
					<% } %>		
            	<% } %>	
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Centro de Costo :</DIV>
            </TD><TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMCCN" maxlength="9" size="10" value="<%= dcNew.getE01DCMCCN().trim()%>" <%=ctrlReadonly%>
            	<%if (dcNew.getF01DCMCCN().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
					<A href="javascript:GetCostCenter('E01DCMCCN',document.forms[0].E01DCMBNK.value)">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></A>
				<% } %>	
			</TD>
          </TR>
          <TR id="trdark">
			<TD nowrap width="30%">
             	<DIV align="right">Letra en Custodia :</DIV>
            </TD>
            <TD colspan='3' nowrap width="20%">
                <INPUT type="radio" name="E01DCMDCF" value="Y" <%if(dcNew.getE01DCMDCF().equals("Y")) out.print("checked");%> <%=ctrlDisabled%>>Sí
            	<INPUT type="radio" name="E01DCMDCF" value="N" <%if(dcNew.getE01DCMDCF().equals("N")) out.print("checked");%> <%=ctrlDisabled%>>No
			</TD>
          </TR>
           <TR id="trclear">
            
			<TD nowrap width="30%">
             	<DIV align="right">Moneda Extranjera     :</DIV>
            </TD><TD nowrap width="20%">
            		<INPUT type="text" name="E01DCMFCY" maxlength="3" size="3" value="<%= dcNew.getE01DCMFCY().trim()%>" readonly>
           	</TD>
            <TD nowrap width="30%">
             	<DIV align="right">Tasa de Cambio M/E :</DIV>
			</TD><TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMOFX" maxlength="19" size="20" value="<%= dcNew.getE01DCMOFX().trim()%>" disabled>
            </TD>
          </TR>
          <TR id="trdark">
            <TD nowrap width="30%">
             	<DIV align="right">Monto de la Cobranza :</DIV>
			</TD><TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMOAM" maxlength="19" size="20" value="<%= dcNew.getE01DCMOAM().trim()%>" onkeypress="enterDecimal(event, 2)" <%= !dcNew.getE01DCMOPT().equals("N")?"readonly":"" %> <%=ctrlReadonly%>
            	>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio"  border="0">
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Protestar :</DIV>
            </TD><TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMPTF" value="Y" <%if(dcNew.getE01DCMPTF().equals("Y")) out.print("checked");%> <%=ctrlDisabled%>>Sí
            	<INPUT type="radio" name="E01DCMPTF" value="N" <%if(dcNew.getE01DCMPTF().equals("N")) out.print("checked");%> <%=ctrlDisabled%>>No
			</TD>
          </TR>
          <TR id="trclear">
            <TD nowrap width="30%">
             	<DIV align="right">Entregar Documentos Contra :</DIV>
            </TD>
            <TD nowrap width="20%">
				<SELECT name="E01DCMRDF" <%=ctrlDisabled%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMRDF().equals("P")) && (!dcNew.getE01DCMRDF().equals("A"))) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew.getE01DCMRDF().equals("P")) out.println("selected"); %>>Pago</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMRDF().equals("A")) out.println("selected"); %>>Aceptación</OPTION>
				</SELECT>
			</TD>
			<TD nowrap width="30%">
             	<DIV align="right">Condonar Cargos :</DIV>
            </TD><TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMWCF" value="Y" <%if(dcNew.getE01DCMWCF().equals("Y")) out.print("checked");%> <%=ctrlDisabled%>>Sí
            	<INPUT type="radio" name="E01DCMWCF" value="N" <%if(dcNew.getE01DCMWCF().equals("N")) out.print("checked");%> <%=ctrlDisabled%>>No
			</TD>
          </TR>
          <TR id="trdark">
            <TD nowrap width="30%">
             	<DIV align="right">Avisar Aceptación Vía :</DIV>
            </TD>
            <TD nowrap width="20%">
				<SELECT name="E01DCMAAF" <%=ctrlDisabled%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMAAF().equals("E")) && (!dcNew.getE01DCMAAF().equals("S")) && (!dcNew.getE01DCMAAF().equals("A")) && (!dcNew.getE01DCMAAF().equals("C")) && (!dcNew.getE01DCMAAF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="E" <% if (dcNew.getE01DCMAAF().equals("E")) out.println("selected"); %>>E-mail</OPTION>
					<OPTION value="S" <% if (dcNew.getE01DCMAAF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMAAF().equals("A")) out.println("selected"); %>>Correo Aéreo</OPTION>
					<OPTION value="C" <% if (dcNew.getE01DCMAAF().equals("C")) out.println("selected"); %>>Courier</OPTION>
					<OPTION value="F" <% if (dcNew.getE01DCMAAF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
			</TD>
			<TD nowrap width="30%">
             	<DIV align="right">Pagos Parciales :</DIV>
			</TD>
            <TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMPPF" value="Y" <%if(dcNew.getE01DCMPPF().equals("Y")) out.print("checked");%> <%=ctrlDisabled%>>Sí
            	<INPUT type="radio" name="E01DCMPPF" value="N" <%if(dcNew.getE01DCMPPF().equals("N")) out.print("checked");%> <%=ctrlDisabled%>>No
            </TD>
          </TR>
          <TR id="trclear">
            <TD nowrap width="30%">
             	<DIV align="right">Avisar No Aceptación Vía :</DIV>
			</TD><TD nowrap width="20%">
				<SELECT name="E01DCMADF" <%=ctrlDisabled%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMADF().equals("E")) && (!dcNew.getE01DCMADF().equals("S")) && (!dcNew.getE01DCMADF().equals("A")) && (!dcNew.getE01DCMADF().equals("C")) && (!dcNew.getE01DCMADF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="E" <% if (dcNew.getE01DCMADF().equals("E")) out.println("selected"); %>>E-mail</OPTION>
					<OPTION value="S" <% if (dcNew.getE01DCMADF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMADF().equals("A")) out.println("selected"); %>>Correo Aéreo</OPTION>
					<OPTION value="C" <% if (dcNew.getE01DCMADF().equals("C")) out.println("selected"); %>>Courier</OPTION>
					<OPTION value="F" <% if (dcNew.getE01DCMADF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Condonar Intereses :</DIV>
			</TD>
            <TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMWIF" value="Y" <%if(dcNew.getE01DCMWIF().equals("Y")) out.print("checked");%> <%=ctrlDisabled%>>Sí
            	<INPUT type="radio" name="E01DCMWIF" value="N" <%if(dcNew.getE01DCMWIF().equals("N")) out.print("checked");%> <%=ctrlDisabled%>>No
            </TD>
          </TR>
          <TR id="trdark">
            <TD nowrap width="30%">
             	<DIV align="right">Avisar Pago Vía :</DIV>
			</TD>
			<TD nowrap width="20%">
				<SELECT name="E01DCMAPF" <%=ctrlDisabled%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMAPF().equals("E")) && (!dcNew.getE01DCMAPF().equals("S")) && (!dcNew.getE01DCMAPF().equals("A")) && (!dcNew.getE01DCMAPF().equals("C")) && (!dcNew.getE01DCMAPF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="E" <% if (dcNew.getE01DCMAPF().equals("E")) out.println("selected"); %>>E-mail</OPTION>
					<OPTION value="S" <% if (dcNew.getE01DCMAPF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMAPF().equals("A")) out.println("selected"); %>>Correo Aéreo</OPTION>
					<OPTION value="C" <% if (dcNew.getE01DCMAPF().equals("C")) out.println("selected"); %>>Courier</OPTION>
					<OPTION value="F" <% if (dcNew.getE01DCMAPF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
	<%-- 			<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio"  border="0"> --%>
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Tracers Vía Swift :</DIV>
			</TD>
            <TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMTVS" value="Y" <%if(dcNew.getE01DCMTVS().equals("Y")) out.print("checked");%> <%=ctrlDisabled%>>Sí
            	<INPUT type="radio" name="E01DCMTVS" value="N" <%if(dcNew.getE01DCMTVS().equals("N")) out.print("checked");%> <%=ctrlDisabled%>>No
            </TD>
          </TR>
          <TR id="trclear">
            <TD nowrap width="30%">
             	<DIV align="right">Cargos Nuestros x Cta. del :</DIV>
            </TD>
            <TD nowrap width="20%">
				<SELECT name="E01DCMOCF" <%=ctrlDisabled%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMOCF().equals("D")) && (!dcNew.getE01DCMOCF().equals("P")) && (!dcNew.getE01DCMOCF().equals("N"))) out.println("selected"); %>></OPTION>
					<OPTION value="D" <% if (dcNew.getE01DCMOCF().equals("D")) out.println("selected"); %>>Girado/Importador</OPTION>
					<OPTION value="P" <% if (dcNew.getE01DCMOCF().equals("P")) out.println("selected"); %>>Girador/Exportador</OPTION>
					<OPTION value="N" <% if (dcNew.getE01DCMOCF().equals("N")) out.println("selected"); %>>Sin Cargos</OPTION>
				</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio"  border="0">
			</TD>
			<TD nowrap width="30%">

					<DIV align="right">Estado de la Cobranza :</DIV>
					</TD>
			<TD nowrap width="20%">
			<SELECT name="E01DCMCST" <%=ctrlDisabled%>>
						<OPTION value=" "
							<% if ((!dcNew.getE01DCMCST().equals("0")) && (!dcNew.getE01DCMCST().equals("1")) && (!dcNew.getE01DCMCST().equals("2")) && (!dcNew.getE01DCMCST().equals("3")) && (!dcNew.getE01DCMCST().equals("4")) && (!dcNew.getE01DCMCST().equals("5")) && (!dcNew.getE01DCMCST().equals("6")) && (!dcNew.getE01DCMCST().equals("7")) && (!dcNew.getE01DCMCST().equals("8")) && (!dcNew.getE01DCMCST().equals("9")) && (!dcNew.getE01DCMCST().equals("P")) && (!dcNew.getE01DCMCST().equals("V")))%>></OPTION>
						<OPTION value="0"
							<% if (dcNew.getE01DCMCST().equals("0")) out.println("selected"); %>>Esperando
						Confirmación Recibida</OPTION>
						<OPTION value="1"
							<% if (dcNew.getE01DCMCST().equals("1")) out.println("selected"); %>>Pendiente
						de Aceptación</OPTION>
						<OPTION value="2"
							<% if (dcNew.getE01DCMCST().equals("2")) out.println("selected"); %>>Pendiente
						de Pago</OPTION>
						<OPTION value="3"
							<% if (dcNew.getE01DCMCST().equals("3")) out.println("selected"); %>>Aceptada</OPTION>
						<OPTION value="4"
							<% if (dcNew.getE01DCMCST().equals("4")) out.println("selected"); %>>Protestada
						Vigente</OPTION>
						<OPTION value="5"
							<% if (dcNew.getE01DCMCST().equals("5")) out.println("selected"); %>>Prorrogada
						Extendida</OPTION>
						<OPTION value="6"
							<% if (dcNew.getE01DCMCST().equals("6")) out.println("selected"); %>>Cancelada
						- Libre de Pago</OPTION>
						<OPTION value="7"
							<% if (dcNew.getE01DCMCST().equals("7")) out.println("selected"); %>>Cancelada
						- Devuelta</OPTION>
						<OPTION value="8"
							<% if (dcNew.getE01DCMCST().equals("8")) out.println("selected"); %>>Cerrada
						Parcialmente Pagada</OPTION>
						<OPTION value="9"
							<% if (dcNew.getE01DCMCST().equals("9")) out.println("selected"); %>>Cerrada
						Totalmente Pagada</OPTION>
						<OPTION value="P"
							<% if (dcNew.getE01DCMCST().equals("P")) out.println("selected"); %>>Vencida
						Protestada</OPTION>
						<OPTION value="V"
							<% if (dcNew.getE01DCMCST().equals("V")) out.println("selected"); %>>Vencida
						Sin Protestar</OPTION>
					</SELECT></TD>
          </TR>
		  <TR id="trdark">
			<TD nowrap width="30%">
             	<DIV align="right">Cargos del Otro Banco x Cta. del :</DIV>
			</TD>
			<TD nowrap width="20%">
				<SELECT name="E01DCMOBF" <%=ctrlDisabled%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMOBF().equals("D")) && (!dcNew.getE01DCMOBF().equals("P"))) out.println("selected"); %>></OPTION>
					<OPTION value="D" <% if (dcNew.getE01DCMOBF().equals("D")) out.println("selected"); %>>Girado/Importador</OPTION>
					<OPTION value="P" <% if (dcNew.getE01DCMOBF().equals("P")) out.println("selected"); %>>Girador/Exportador</OPTION>
				</SELECT>
            </TD>
			<TD nowrap width="30%"><DIV align="right">
			N° de Tarifa de Cargos :</DIV></TD>
			<TD nowrap width="20%">
				<INPUT type="text" name="E01DCMTAR" maxlength="3" size="4" value="<%= dcNew.getE01DCMTAR().trim()%>" <%=ctrlReadonly%>
				<%if (dcNew.getF01DCMTAR().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
				
				    <% if(dcNew.getE01DCMTYP().equals("I")) { %>	
				       <A href="javascript:GetTariffCollExt('E01DCMTAR','<%=dcNew.getE01DCMATY()%>','E01DCMDWA','E01DCMRBA')">    
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></A>
					<% } else { %>   
					   <A href="javascript:GetTariffCollExt('E01DCMTAR','<%=dcNew.getE01DCMATY()%>','E01DCMDRA','E01DCMCLA')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></A>
					<% } %> 
					     
				<% } %>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio"  border="0">
			</TD>
		  </TR>
          <TR id="trclear">
            <TD nowrap width="30%">
             	<DIV align="right">Término :</DIV>
			</TD>
			<TD nowrap width="20%">
				<SELECT name="E01DCMTRC" <%=ctrlDisabled%>>
					<OPTION value="  " <% if ((!dcNew.getE01DCMTRC().equals("AS")) && (!dcNew.getE01DCMTRC().equals("BE")) && (!dcNew.getE01DCMTRC().equals("BL")) && (!dcNew.getE01DCMTRC().equals("CC")) && (!dcNew.getE01DCMTRC().equals("FD")) && (!dcNew.getE01DCMTRC().equals("FP")) && (!dcNew.getE01DCMTRC().equals("GA")) && (!dcNew.getE01DCMTRC().equals("ID")) && (!dcNew.getE01DCMTRC().equals("ST")) && (!dcNew.getE01DCMTRC().equals("TD"))) out.println("selected"); %>></OPTION>
					<OPTION value="AS" <% if (dcNew.getE01DCMTRC().equals("AS")) out.println("selected"); %>>A la vista</OPTION>
					<OPTION value="CO" <% if (dcNew.getE01DCMTRC().equals("CO")) out.println("selected"); %>>Después de Fecha de Carta de Compromiso</OPTION>
					<OPTION value="BE" <% if (dcNew.getE01DCMTRC().equals("BE")) out.println("selected"); %>>Después de Fecha de Letra de Cambio</OPTION>
					<OPTION value="BL" <% if (dcNew.getE01DCMTRC().equals("BL")) out.println("selected"); %>>Después de Fecha de Embarque</OPTION>
					<OPTION value="CC" <% if (dcNew.getE01DCMTRC().equals("CC")) out.println("selected"); %>>Después de Pase de Mercancía por Aduana</OPTION>
					<OPTION value="FD" <% if (dcNew.getE01DCMTRC().equals("FD")) out.println("selected"); %>>Después de Pase de Mercancía por Revisión</OPTION>
					<OPTION value="FP" <% if (dcNew.getE01DCMTRC().equals("FP")) out.println("selected"); %>>Primera presentación</OPTION>
					<OPTION value="GA" <% if (dcNew.getE01DCMTRC().equals("GA")) out.println("selected"); %>>Después de Arribo de Mercancía</OPTION>
					<OPTION value="ID" <% if (dcNew.getE01DCMTRC().equals("ID")) out.println("selected"); %>>Después de Fecha de Factura</OPTION>
					<OPTION value="ST" <% if (dcNew.getE01DCMTRC().equals("ST")) out.println("selected"); %>>Después de Entregado</OPTION>
					<OPTION value="TD" <% if (dcNew.getE01DCMTRC().equals("TD")) out.println("selected"); %>>Después de Fecha de Doc. de Transporte</OPTION>
				</SELECT>
            </TD>

			<TD nowrap width="30%">
             	<DIV align="right">Plazo :</DIV>
            </TD>
            <TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMDYS" maxlength="4" size="5" value="<%= dcNew.getE01DCMDYS().trim()%>" <%=ctrlReadonly%>
            	<%if (dcNew.getF01DCMDYS().equals("Y")) out.print("class=\"txtchanged\"");%>>
			</TD>
          </TR> 
		  
		  <TR id="trdark">
			<TD nowrap width="30%">
             	<DIV align="right">Fecha Inicial :</DIV>
			</TD>
			<TD nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMILM" fn_day="E01DCMILD" fn_year="E01DCMILY" readonly="<%=ctrlReadonly%>" modified="F01DCMILM, F01DCMILD, F01DCMILY"/>
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Cobranza Directa :</DIV>
			</TD>
            <TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMDIR" value="Y" <%if(dcNew.getE01DCMDIR().equals("Y")) out.print("checked");%> <%=ctrlDisabled%>>Sí
            	<INPUT type="radio" name="E01DCMDIR" value="N" <%if(dcNew.getE01DCMDIR().equals("N")) out.print("checked");%> <%=ctrlDisabled%>>No
            </TD>
		  </TR>
		  <% if(!dcNew.getE01DCMDIR().equals("Y")){ %>
				<TR id="trclear">
				  <TD width="25%" align="right" nowrap>Generar Swift:</TD>
				  <TD nowrap width="25%">
				  	<INPUT type="radio" name="E01DCMSWF" value="Y" <%=dcNew.getE01DCMSWF().equals("Y") ? "checked" : ""%> <%=ctrlDisabled%> onclick="updateSwift(this.value)">Si
				    <INPUT type="radio" name="E01DCMSWF" value="N" <%=dcNew.getE01DCMSWF().equals("N") ? "checked" : ""%> <%=ctrlDisabled%> onclick="updateSwift(this.value)">No 
				  </TD>
				  <TD align="right" nowrap>Tipo Mensaje Swift: </TD>
				  <TD align="left" nowrap><SELECT id="swift" name="E01DCMSMT" <%=ctrlDisabled%>>
				      <% if (dcNew.getE01DCMOPT().equals("N")) { %>			
                      <OPTION value="" <% if(dcNew.getE01DCMSMT().equals("")) out.print("selected");%>>- ninguno -</OPTION>
                      <OPTION value="410" <% if(dcNew.getE01DCMSMT().equals("410")) out.print("selected");%>>MT410</OPTION>
                      <% } else { %>    
                      <OPTION value="" <% if(dcNew.getE01DCMSMT().equals("")) out.print("selected");%>>- ninguno -</OPTION>
                      <OPTION value="412" <% if(dcNew.getE01DCMSMT().equals("412")) out.print("selected");%>>MT412</OPTION>
                      <OPTION value="416" <% if(dcNew.getE01DCMSMT().equals("416")) out.print("selected");%>>MT416</OPTION>
                      <OPTION value="420" <% if(dcNew.getE01DCMSMT().equals("420")) out.print("selected");%>>MT420</OPTION>
                      <OPTION value="422" <% if(dcNew.getE01DCMSMT().equals("422")) out.print("selected");%>>MT422</OPTION>
                      <OPTION value="430" <% if(dcNew.getE01DCMSMT().equals("430")) out.print("selected");%>>MT430</OPTION>                      
                      <% } %>				  
                  </SELECT></TD>
			 </TR>
			<% } %> 
        </TBODY></TABLE>
      </td>
    </tr>
  </table>

<%-- start LMCR / MRC   --%>
<% if(!dcNew.getE01DCMOPT().equals("N")){ %>
  <h4>Aumento / Disminuci&oacute;n de Saldos</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		  <TR id="trdark">	  
			<TD nowrap width="30%" align="right">

				<SELECT name="E01DCMOPT" <%=ctrlDisabled%>>
					<OPTION value=" " <% if (!dcNew.getE01DCMOPT().equals("I") && !dcNew.getE01DCMOPT().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="I" <%= dcNew.getE01DCMOPT().equals("I")?"selected":"" %>>Aumento</OPTION>
					<OPTION value="D" <%= dcNew.getE01DCMOPT().equals("D")?"selected":"" %>>Disminucion</OPTION>
				</SELECT>
			
			</TD>
			<TD nowrap width="20%">
                <INPUT type="text" name="E01AMTOPT" maxlength="16" size="17" value="<%= dcNew.getE01AMTOPT()%>" onkeypress="enterDecimal(event, 2)" <%=ctrlReadonly%>
                >
            </TD>
            <TD width="30%"></TD><TD width="20%"></TD>
            </TR>		          
		</table>
		</td>
	</tr>
	</table>
	<% }  %>
		<%-- 
		end LMCR / MRC  --%>

  <h4>Información de Fechas</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
             	<div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMMAM" fn_day="E01DCMMAD" fn_year="E01DCMMAY" modified="F01DCMMAM, F01DCMMAD, F01DCMMAY" readonly="<%=ctrlReadonly%>"/>
			</td>
			<td nowrap width="30%">
             	<div align="right">Fecha de Emisión :</div>
			</td>
            <td nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMIDM" fn_day="E01DCMIDD" fn_year="E01DCMIDY" modified="F01DCMIDM, F01DCMIDD, F01DCMIDY" readonly="<%=ctrlReadonly%>"/>            
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
             	<div align="right">Fecha de Remitente :</div>
            </td>
            <td nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMRMM" fn_day="E01DCMRMD" fn_year="E01DCMRMY" modified="F01DCMRMM, F01DCMRMD, F01DCMRMY" readonly="<%=ctrlReadonly%>"/>
			</td>
			<td nowrap width="30%">
             	<div align="right">Próxima Fecha de Tracer :</div>
			</td>
            <td nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMNTM" fn_day="E01DCMNTD" fn_year="E01DCMNTY" modified="F01DCMNTM, F01DCMNTD, F01DCMNTY" readonly="<%=ctrlReadonly%>"/>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
             	<div align="right">Fecha de Acuse de Recibo :</div>
            </td>
            <td nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMAKM" fn_day="E01DCMAKD" fn_year="E01DCMAKY" modified="F01DCMAKM, F01DCMAKD, F01DCMAKY" readonly="<%=ctrlReadonly%>"/>
			</td>
			<td nowrap width="30%">
             	<div align="right">Fecha de Aceptación :</div>
			</td>
            <td nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMACM" fn_day="E01DCMACD" fn_year="E01DCMACY" modified="F01DCMACM, F01DCMACD, F01DCMACY" readonly="<%=ctrlReadonly%>"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<% if(!dcNew.getE01DCMDIR().equals("Y")){ %>
 <h4>Información Adicional</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
				<div align="right">N° de Guía de Embarque :</DIV>
            </td>
            <td nowrap width="20%"><INPUT type="text" name="E01DCMBLN" 	maxlength="16" size="17" value="<%= dcNew.getE01DCMBLN().trim()%>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMBLN().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
			<td nowrap width="30%">
             	<div align="right">Fecha de Guía de Embarque :</div>
			</td>
            <td nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMBDM" fn_day="E01DCMBDD" fn_year="E01DCMBDY" modified="F01DCMBDM, F01DCMBDD, F01DCMBDY" readonly="<%=ctrlReadonly%>"/>
            </td>
          </tr>
		  <tr id="trclear">
            <td nowrap width="30%">
				<DIV align="right">Mercanc&iacute;a :</DIV>
            </td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E01DCMMED" 	maxlength="45" size="50" value="<%= dcNew.getE01DCMMED().trim()%>" <%=ctrlReadonly%>
            	<%if (dcNew.getF01DCMMED().equals("Y")) out.print("class=\"txtchanged\"");%>>
            	<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio"  border="0">
            </td>
            <td nowrap width="30%"> 
             	<div align="right">Mercancía en Consignación :</div>
            </td>
            <td nowrap width="20%">  
            	<input type="radio" name="E01DCMMCO" value="Y" <%if(dcNew.getE01DCMMCO().equals("Y")) out.print("checked");%> <%=ctrlDisabled%>>Sí 
            	<input type="radio" name="E01DCMMCO" value="N" <%if(dcNew.getE01DCMMCO().equals("N")) out.print("checked");%> <%=ctrlDisabled%>>No 
			</td>
		  </tr>
		  <tr id="trdark">
			<td nowrap>
             	<div align="right">Nombre de la Nave de Transporte :</div>
			</td>
            <td nowrap colspan=3>
            	<INPUT type="text" name="E01DCMVSL" maxlength="40" size="45" value="<%= dcNew.getE01DCMVSL().trim()%>" <%=ctrlReadonly%>
            	<%if (dcNew.getF01DCMVSL().equals("Y")) out.print("class=\"txtchanged\"");%>> 
            </td>
          </tr>
		  <tr id="trclear">
			<td nowrap>
             	<div align="right">Puerto de Embarque :</div>
			</td>
            <td nowrap colspan=3>
            	<INPUT type="text" name="E01DCMPOL" maxlength="65" size="70" value="<%= dcNew.getE01DCMPOL().trim()%>" <%=ctrlReadonly%>
            	<%if (dcNew.getF01DCMPOL().equals("Y")) out.print("class=\"txtchanged\"");%>> 
            </td>
          </tr>
		  <tr id="trdark">
			<td nowrap>
             	<div align="right">Puerto de Destino :</div>
			</td>
            <td nowrap colspan=3>
            	<INPUT type="text" name="E01DCMPOD" maxlength="65" size="70" value="<%= dcNew.getE01DCMPOD().trim()%>" <%=ctrlReadonly%>
            	<%if (dcNew.getF01DCMPOD().equals("Y")) out.print("class=\"txtchanged\"");%>> 
            </td>
          </tr>
		  <TR id="trclear">	  
			<TD nowrap>
             	<DIV align="right">Agente/Representante: </DIV>
			
			</TD>
			<TD nowrap colspan=3>
				<INPUT type="text" name="E01DCMBRK" size="5" maxlength="4" value="<%= dcNew.getE01DCMBRK().trim()%>" <%=ctrlReadonly%>
				<%if (dcNew.getF01DCMBRK().equals("Y")) out.print("class=\"txtchanged\"");%>>
            <% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
              <A href="javascript:GetBroker('E01DCMBRK')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
            <% } %> 
            </TD>
            </TR>		            
          <tr id="trdark">
             <td><DIV align="right">&nbsp;</div></td>
             <td colspan=3>
                <INPUT type="text" name="E01DCMAG1" maxlength="35" size="50" value="<%= dcNew.getE01DCMAG1().trim()%>" readonly
                <%if (dcNew.getF01DCMAG1().equals("Y")) out.print("class=\"txtchanged\"");%>><br>
                <INPUT type="text" name="E01DCMAG2" maxlength="35" size="50" value="<%= dcNew.getE01DCMAG2().trim()%>" readonly
                <%if (dcNew.getF01DCMAG2().equals("Y")) out.print("class=\"txtchanged\"");%>><br>
                <INPUT type="text" name="E01DCMAG3" maxlength="35" size="50" value="<%= dcNew.getE01DCMAG3().trim()%>" readonly
                <%if (dcNew.getF01DCMAG3().equals("Y")) out.print("class=\"txtchanged\"");%>><br>
                <INPUT type="text" name="E01DCMAG4" maxlength="35" size="50" value="<%= dcNew.getE01DCMAG4().trim()%>" readonly
                <%if (dcNew.getF01DCMAG4().equals("Y")) out.print("class=\"txtchanged\"");%>>
             </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  
        <h4>Información de Documentos Recibidos</h4>
  <table class="tableinfo">

    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr>
		      <td align="center">Documento</td>
		      <td align="center">Descripci&oacute;n</td>
		      <td align="center">Originales<br>Requeridas</td>
		      <td align="center">Originales<br>Recibidas</td>
  			  <td align="center">Copias<br>Requeridas</td>
  			  <td align="center">Copias<br>Recibidas</td>
		      <td align="center">Nro. de Documento</td>
         </tr>
          <tr id="trdark">
            <td align="center"><INPUT type="text" name="E01DCMDD1" maxlength="4" size="5" value="<%= dcNew.getE01DCMDD1() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDD1().equals("Y")) out.print("class=\"txtchanged\"");%>>
                    <% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
            		<A href="javascript:GetCodeDescCNOFC('E01DCMDD1','E01DCMDS1','08')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					border="0"></A>
					<% } %>					
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS1" maxlength="35" size="35" value="<%= dcNew.getE01DCMDS1() %>" readonly
			></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO1" maxlength="1" size="2" value="<%= dcNew.getE01DCMDO1() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDO1().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR1" maxlength="1" size="2" value="<%= dcNew.getE01DCMOR1() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMOR1().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC1" maxlength="1" size="2" value="<%= dcNew.getE01DCMDC1() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDC1().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR1" maxlength="1" size="2" value="<%= dcNew.getE01DCMCR1() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMCR1().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"><INPUT type="text" name="E01DCMDN1" maxlength="16" size="19" value="<%= dcNew.getE01DCMDN1() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDN1().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
           </tr>
           <tr id="trclear">
            <td align="center"><INPUT type="text" name="E01DCMDD2" maxlength="4" size="5" value="<%= dcNew.getE01DCMDD2() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDD2().equals("Y")) out.print("class=\"txtchanged\"");%>>
            	<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
            		<A href="javascript:GetCodeDescCNOFC('E01DCMDD2','E01DCMDS2','08')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					border="0"></A>
				<% } %>
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS2" maxlength="35" size="35" value="<%= dcNew.getE01DCMDS2() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO2" maxlength="1" size="2" value="<%= dcNew.getE01DCMDO2() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDO2().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR2" maxlength="1" size="2" value="<%= dcNew.getE01DCMOR2() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMOR2().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC2" maxlength="1" size="2" value="<%= dcNew.getE01DCMDC2() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDC2().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR2" maxlength="1" size="2" value="<%= dcNew.getE01DCMCR2() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMCR2().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"><INPUT type="text" name="E01DCMDN2" maxlength="16" size="19" value="<%= dcNew.getE01DCMDN2() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDN2().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
          </tr>
          <tr id="trdark">
            <td align="center"><INPUT type="text" name="E01DCMDD3" maxlength="4" size="5" value="<%= dcNew.getE01DCMDD3() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDD3().equals("Y")) out.print("class=\"txtchanged\"");%>>
            	<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
            	<A href="javascript:GetCodeDescCNOFC('E01DCMDD3','E01DCMDS3','08')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					border="0"></A>
				<% } %>		
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS3" maxlength="35" size="35" value="<%= dcNew.getE01DCMDS3() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO3" maxlength="1" size="2" value="<%= dcNew.getE01DCMDO3() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDO3().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR3" maxlength="1" size="2" value="<%= dcNew.getE01DCMOR3() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMOR3().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC3" maxlength="1" size="2" value="<%= dcNew.getE01DCMDC3() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDC3().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR3" maxlength="1" size="2" value="<%= dcNew.getE01DCMCR3() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMCR3().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"><INPUT type="text" name="E01DCMDN3" maxlength="16" size="19" value="<%= dcNew.getE01DCMDN3() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDN3().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
          </tr>
          <tr id="trclear">
            <td align="center"><INPUT type="text" name="E01DCMDD4" maxlength="4" size="5" value="<%= dcNew.getE01DCMDD4() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDD4().equals("Y")) out.print("class=\"txtchanged\"");%>>
            	<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
            		<A href="javascript:GetCodeDescCNOFC('E01DCMDD4','E01DCMDS4','08')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					border="0"></A>
				<% } %>					
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS4" maxlength="35" size="35" value="<%= dcNew.getE01DCMDS4() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO4" maxlength="1" size="2" value="<%= dcNew.getE01DCMDO4() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDO4().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR4" maxlength="1" size="2" value="<%= dcNew.getE01DCMOR4() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMOR4().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC4" maxlength="1" size="2" value="<%= dcNew.getE01DCMDC4() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDC4().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR4" maxlength="1" size="2" value="<%= dcNew.getE01DCMCR4() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMCR4().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"><INPUT type="text" name="E01DCMDN4" maxlength="16" size="19" value="<%= dcNew.getE01DCMDN4() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDN4().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
          </tr>
          <tr id="trdark">
            <td align="center"><INPUT type="text" name="E01DCMDD5" maxlength="4" size="5" value="<%= dcNew.getE01DCMDD5() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDD5().equals("Y")) out.print("class=\"txtchanged\"");%>>
               	<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
            		<A href="javascript:GetCodeDescCNOFC('E01DCMDD5','E01DCMDS5','08')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					border="0"></A>
				<% } %>
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS5" maxlength="35" size="35" value="<%= dcNew.getE01DCMDS5() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO5" maxlength="1" size="2" value="<%= dcNew.getE01DCMDO5() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDO5().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR5" maxlength="1" size="2" value="<%= dcNew.getE01DCMOR5() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMOR5().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC5" maxlength="1" size="2" value="<%= dcNew.getE01DCMDC5() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDC5().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR5" maxlength="1" size="2" value="<%= dcNew.getE01DCMCR5() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMCR5().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"><INPUT type="text" name="E01DCMDN5" maxlength="16" size="19" value="<%= dcNew.getE01DCMDN5() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDN5().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
          </tr>
          <tr id="trclear">
            <td align="center"><INPUT type="text" name="E01DCMDD6" maxlength="4" size="5" value="<%= dcNew.getE01DCMDD6() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDD6().equals("Y")) out.print("class=\"txtchanged\"");%>>
            	<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
            	<A href="javascript:GetCodeDescCNOFC('E01DCMDD6','E01DCMDS6','08')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					border="0"></A>
				<% } %>
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS6" maxlength="35" size="35" value="<%= dcNew.getE01DCMDS6() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO6" maxlength="1" size="2" value="<%= dcNew.getE01DCMDO6() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDO6().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR6" maxlength="1" size="2" value="<%= dcNew.getE01DCMOR6() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMOR6().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC6" maxlength="1" size="2" value="<%= dcNew.getE01DCMDC6() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDC6().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR6" maxlength="1" size="2" value="<%= dcNew.getE01DCMCR6() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMCR6().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"><INPUT type="text" name="E01DCMDN6" maxlength="16" size="19" value="<%= dcNew.getE01DCMDN6() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDN6().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
          </tr>
          <tr id="trdark">
            <td align="center"><INPUT type="text" name="E01DCMDD7" maxlength="4" size="5" value="<%= dcNew.getE01DCMDD7() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDD7().equals("Y")) out.print("class=\"txtchanged\"");%>>
            	<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
            	<A href="javascript:GetCodeDescCNOFC('E01DCMDD7','E01DCMDS7','08')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					border="0"></A>
				<% } %>					
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS7" maxlength="35" size="35" value="<%= dcNew.getE01DCMDS7() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO7" maxlength="1" size="2" value="<%= dcNew.getE01DCMDO7() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDO7().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR7" maxlength="1" size="2" value="<%= dcNew.getE01DCMOR7() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMOR7().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC7" maxlength="1" size="2" value="<%= dcNew.getE01DCMDC7() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDC7().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR7" maxlength="1" size="2" value="<%= dcNew.getE01DCMCR7() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMCR7().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"><INPUT type="text" name="E01DCMDN7" maxlength="16" size="19" value="<%= dcNew.getE01DCMDN7() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDN7().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
          </tr>
          <tr id="trclear">            
            <td align="center"><INPUT type="text" name="E01DCMDD8" maxlength="4" size="5" value="<%= dcNew.getE01DCMDD8() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDD8().equals("Y")) out.print("class=\"txtchanged\"");%>>
            	<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
            	<A href="javascript:GetCodeDescCNOFC('E01DCMDD8','E01DCMDS8','08')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					border="0"></A>
				<% } %>					
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS8" maxlength="35" size="35" value="<%= dcNew.getE01DCMDS8() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO8" maxlength="1" size="2" value="<%= dcNew.getE01DCMDO8() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDO8().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR8" maxlength="1" size="2" value="<%= dcNew.getE01DCMOR8() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMOR8().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC8" maxlength="1" size="2" value="<%= dcNew.getE01DCMDC8() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDC8().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR8" maxlength="1" size="2" value="<%= dcNew.getE01DCMCR8() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMCR8().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"><INPUT type="text" name="E01DCMDN8" maxlength="16" size="19" value="<%= dcNew.getE01DCMDN8() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDN8().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
          </tr>
          <tr id="trdark">
            <td align="center"><INPUT type="text" name="E01DCMDD9" maxlength="4" size="5" value="<%= dcNew.getE01DCMDD9() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDD9().equals("Y")) out.print("class=\"txtchanged\"");%>>
            <% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
            	<A href="javascript:GetCodeDescCNOFC('E01DCMDD9','E01DCMDS9','08')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					border="0"></A>
			<% } %>
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS9" maxlength="35" size="35" value="<%= dcNew.getE01DCMDS9() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO9" maxlength="1" size="2" value="<%= dcNew.getE01DCMDO9() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDO9().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR9" maxlength="1" size="2" value="<%= dcNew.getE01DCMOR9() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMOR9().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC9" maxlength="1" size="2" value="<%= dcNew.getE01DCMDC9() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDC9().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR9" maxlength="1" size="2" value="<%= dcNew.getE01DCMCR9() %>" onkeypress="enterInteger(event)" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMCR9().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
            <td align="center"><INPUT type="text" name="E01DCMDN9" maxlength="16" size="19" value="<%= dcNew.getE01DCMDN9() %>" <%=ctrlReadonly%>
            <%if (dcNew.getF01DCMDN9().equals("Y")) out.print("class=\"txtchanged\"");%>></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <% } %>
 
<BR>
<% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVAL")) { %>
	<DIV align="center">
		<H4 style="text-align:center">
			<INPUT type="checkbox" name="H01FLGWK2" value="A" <%= dcNew.getH01FLGWK2().equals("A")? "checked" : "" %>>Aceptar con Advertencias
		</H4>
		<INPUT id="EIBSBTN" type="button" name="Validate" value="Validar" onclick="this.disabled=true;validate();">
		&nbsp;&nbsp;
		<INPUT id="EIBSBTN" type="button" name="Finalize" value="Finalizar" onclick="this.disabled=true;finalize();">
	</DIV>
<% } %>
</form>
<script type="text/javascript">
	updateSwift('<%=dcNew.getE01DCMSWF()%>');

	<% if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL")) { %>
	$("input[type='text']").attr("readonly", "readonly").prop("onchange",null).prop("change",null);  
	$("select").add("button").add("submit").add("input[type='radio']").add("input[type='checkbox']").attr("disabled", "disabled").prop("onchange",null).prop("change",null);  
	$("img[title='null']").add("img[src*='1b.gif']").add("img[src*='Check.gif']").add("img[src*='calendar.gif']").hide(); 	
	$("input.context-menu-help").removeClass();
<% } %>

	
<% if (userPO.getPurpose().equals("APPROVAL")) { %>
	$('head').append('<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css">');
	<%if (dcNew.getE01DCMAF1().equals("A")) { %>
		$('#E01DCMDRA').addClass('context-menu-inq').attr('onmousedown', "init(inqAccount, this.value)");
	<% } %>
	<%if (dcNew.getE01DCMAF2().equals("A")) { %>
		$('#E01DCMDWA').addClass('context-menu-inq').attr('onmousedown', "init(inqAccount, this.value)");
	<% } %>
	<%if (dcNew.getE01DCMAF3().equals("A")) { %>
		$('#E01DCMRBA').addClass('context-menu-inq').attr('onmousedown', "init(inqAccount, this.value)");
	<% } %>
	<%if (dcNew.getE01DCMAF4().equals("A")) { %>
		$('#E01DCMCLA').addClass('context-menu-inq').attr('onmousedown', "init(inqAccount, this.value)");
	<% } %>
	<%if (dcNew.getE01DCMAF5().equals("A")) { %>
		$('#E01DCMSRA').addClass('context-menu-inq').attr('onmousedown', "init(inqAccount, this.value)");
	<% } %>
<% } %>	
</script>

</body>
</html>
