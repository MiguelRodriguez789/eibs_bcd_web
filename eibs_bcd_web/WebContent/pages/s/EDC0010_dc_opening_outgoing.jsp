<%@page isELIgnored="false"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Cobranza Simple Enviada</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="${pageContext.request.contextPath}/pages/style.css"
	rel="stylesheet">


<script type="text/javascript"
	src="${pageContext.request.contextPath}/pages/s/javascripts/eIBS.jsp">
	
</SCRIPT>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pages/s/javascripts/optMenu.jsp">
	
</SCRIPT>

<jsp:useBean id="dcNew" class="datapro.eibs.beans.EDC001001Message"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript">

  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   		initMenu();
   <%} else {%>	
<%	if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL")) { %>
	   <%if ("N".equals(dcNew.getE01DCMOPT())) {%>
		builtNewMenu('dc_s_inquiry_opening');
	   <% } else { %>
	   	builtNewMenu('dc_s_inquiry');
	   <% } %>
		initMenu();
<%	} else if (!userPO.getPurpose().equals("NEW")) { %>
		builtNewMenu('dc_s_maint');
		initMenu();
<%	}	%>
<%}%>

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
</SCRIPT>

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

</head>

<%
	String ctrlDisabled = userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL") ? "disabled" : "";
	String ctrlReadonly = userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL") ? "readonly" : "";
	boolean isReadonly = userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL") ? true : false;
	String ctrlReadonlyRate = !"N".equals(dcNew.getE01DCMOPT()) ? "readonly" :  ctrlReadonly;
	String ctrlReadonlyCurrency = !currUser.getE01BCU().equals(dcNew.getE01DCMCCY().trim()) ? "readonly" : ctrlReadonly;
	
	
	String strTitle = "Consulta";
	if (!isReadonly) { 
		if (dcNew.getE01DCMOPT().equals("N"))
			strTitle = "Apertura"; 
		else 
			strTitle = "Mantenimiento"; 
	}
%>
<body>
	<h3 align="center"><%= strTitle %> de Cobranza Simple Enviada 
		<img src="${pageContext.request.contextPath}/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dc_opening_outgoing.jsp, EDC0010">
	</h3>
	<hr size="4">
	<form method="post"
		action="${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDC0010">
		<INPUT TYPE=HIDDEN NAME="SCREEN"
			VALUE="<%if (dcNew.getE01DCMOPT().equals("N"))
				out.print("2");
			else
				out.print("4");%>">
		<input type="hidden" name="H01FLGWK3">
		<table class="tableinfo">
			<tr>
				<td nowrap>
					<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
						class="tbhead">
						<TBODY>
							<TR id="trdark">
								<TD nowrap width="16%">
									<DIV align="right">
										<B>Banco :</B>
									</DIV></TD>
								<TD nowrap width="20%">
									<DIV align="left">
										<INPUT type="text" name="E01DCMBNK" readonly size="4"
											maxlength="2" value="<%=dcNew.getE01DCMBNK().trim()%>">
									</DIV></TD>
								<TD nowrap width="16%">
									<DIV align="right">
										<B>Número de Cobranza :</B>
									</DIV></TD>
								<TD nowrap width="16%">
									<DIV align="left">
										<B> <%
 	if (dcNew.getE01DCMACC().trim().equals("999999999999")) {
 %>
											<INPUT type="text" size="12" maxlength="12" value="Nuevo"
											readonly> <INPUT type="hidden" name="E01DCMACC"
											value="<%=dcNew.getE01DCMACC().trim()%>"> <%
 	} else {
 %> <INPUT type="text" name="E01DCMACC" size="12"
											maxlength="12" value="<%=dcNew.getE01DCMACC().trim()%>"
											readonly> <%
 	}
 %> </B>
									</DIV></TD>
							</TR>
							<TR id="trclear">
								<TD nowrap width="16%">
									<DIV align="right">
										<B>Nuestra Referencia :</B>
									</DIV></TD>
								<TD nowrap width="20%">
									<DIV align="left">
										<INPUT type="text" name="E01DCMORF" size="20" maxlength="16"
											value="<%=dcNew.getE01DCMORF().trim()%>">
									</DIV></TD>
								<TD nowrap width="16%">
									<DIV align="right">
										<B>Producto :</B>
									</DIV></TD>
								<TD nowrap width="16%">
									<DIV align="left">
										<B> <INPUT type="text" name="E01DCMPRO" size="4"
											maxlength="4" value="<%=dcNew.getE01DCMPRO().trim()%>"
											readonly> </B>
									</DIV></TD>
							</TR>
							<TR id="trdark">
								<TD nowrap width="16%">
									<DIV align="right">
										<B>Tipo de Cobranza :</B>
									</DIV></TD>
								<TD nowrap width="16%">
									<DIV align="left">
										<B> <INPUT type="text" name="X01DCMTYP" size="20"
											maxlength="16"
											value="<%=dcNew.getE01DCMTYP().trim().equals("O") ? "Enviada"
					: "Recibida"%>"
											readonly> <INPUT type="hidden" name="E01DCMTYP"
											value="<%=dcNew.getE01DCMTYP().trim()%>"> </B>
									</DIV></TD>
								<TD nowrap width="16%">
									<DIV align="right">
										<B>Descripcion de Producto :</B>
									</DIV></TD>
								<TD nowrap width="16%">
									<DIV align="left">
										<B> <INPUT type="text" name="E01DSCPRO" size="30"
											maxlength="30" value="<%=dcNew.getE01DSCPRO().trim()%>"
											readonly> </B>
									</DIV></TD>
							</TR>
						</TBODY>
					</TABLE></td>
			</tr>
		</table>

<h4>Banco Remitente</h4>
		<table class="tableinfo">
			<tr>
				<td>
					<table cellspacing="0" cellpadding="2" width="100%" border="0">
						<tr id="trdark">
							<td align="right">
								<table border="0" cellspacing="0">
									<tr id="trdark">
										<td align="right">Numero de Cliente o de Cuenta:</td>
										<td nowrap width="25%"><select name="E01DCMAF3" <%=ctrlDisabled %>>
												<option value=" "></option>
												<option value="C" <%if (dcNew.getE01DCMAF3().equals("C")) out.print("selected");%>>Cliente</option>
												<option value="A" <%if (dcNew.getE01DCMAF3().equals("A")) out.print("selected");%>>Cuenta</option>
										</select></td>
									</tr>
								</table></td>
							<td>
								<table border="0" cellspacing="0">
									<tr id="trdark">
										<td align="left"><input type="text" name="E01DCMRBA" id="E01DCMRBA" 
											size="12" maxlength="12" value="<%=dcNew.getE01DCMRBA()%>" <%=ctrlReadonly %>
											<%if (dcNew.getF01DCMRBA().equals("Y")) out.print("class=\"txtchanged\"");%>>
										</td>
										<td>
										<% if (!isReadonly) { %>
										<a href="javascript: GetCustomerDetails('E01DCMRBA','E01DCMRB1','','','','E01DCMRB2','E01DCMRB3','E01DCMRB4','','','','','','','','','','')">
												<img src="${pageContext.request.contextPath}/images/1b.gif"
												title=". . ."
												onclick="javascript: document.forms[0].E01DCMAF3.selectedIndex = 1"
												border="0">
										</a> Cliente o <a
											href="javascript: GetAccByClient('E01DCMRBA','','RT','','E01DCMRB1')">
												<img src="${pageContext.request.contextPath}/images/1b.gif"
												title=". . ."
												onclick="javascript: document.forms[0].E01DCMAF3.selectedIndex = 2"
												border="0">
										</a> Cuenta
										<% } %>
										</td>
									</tr>
								</table></td>
						</tr>
						<TR id="trclear">
							<TD align="right" nowrap>Codigo Swift:</TD>
							<TD align="left" nowrap><INPUT type="text" name="E01DCMRBI"
								size="14" maxlength="12" value="<%=dcNew.getE01DCMRBI()%>" <%=ctrlReadonly %>
								<%if (dcNew.getF01DCMRBI().equals("Y")) out.print("class=\"txtchanged\"");%>>
								<% if (!isReadonly) { %>
								<A href="javascript:GetSwiftIdDesc('E01DCMRBI','E01DCMRB1','E01DCMRB2','E01DCMRB3')">
									<IMG src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" border="0">
								</A>
								<% } %>
							</TD>
						</TR>
						<tr id="trdark">
							<td>
								<div align="right">Nombre :</div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMRB1" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB1()%>" <%=ctrlReadonly %>
									<%if (dcNew.getF01DCMRB1().equals("Y")) out.print("class=\"txtchanged\"");%>>
									<% if (!isReadonly) { %>
									<IMG src="${pageContext.request.contextPath}/images/Check.gif" title="campo obligatorio"  border="0">
									<% } %>
								</div>
								</td>
						</tr>
						<tr id="trclear">
							<td>
								<div align="right">Dirección :</div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMRB2" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMRB2()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMRB2().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
						<tr id="trdark">
							<td>
								<div align="right"></div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMRB3" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMRB3()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMRB3().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
						<tr id="trclear">
							<td>
								<div align="right"></div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMRB4" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMRB4()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMRB4().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
						<tr id="trdark">
							<td>
								<div align="right">Referencia :</div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMRRF" size="20" maxlength="16"
										value="<%=dcNew.getE01DCMRRF()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMRRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
					</table></td>
			</tr>
		</table>

<h4>Banco Girado</h4>
		<table class="tableinfo">
			<tr>
				<td>
					<table cellspacing="0" cellpadding="2" width="100%" border="0">
						<tr id="trdark">
							<td align="right">
								<table border="0" cellspacing="0">
									<tr id="trdark">
										<td align="right">Numero de Cliente o de Cuenta:</td>
										<td nowrap width="25%"><select name="E01DCMAF4" <%=ctrlDisabled %>>
												<option value=" "></option>
												<option value="C"
													<%if (dcNew.getE01DCMAF4().equals("C"))
				out.print("selected");%>>Cliente</option>
												<option value="A"
													<%if (dcNew.getE01DCMAF4().equals("A"))
				out.print("selected");%>>Cuenta</option>
										</select></td>
									</tr>
								</table></td>
							<td>
								<table border="0" cellspacing="0">
									<tr id="trdark">
										<td align="left"><input type="text" name="E01DCMCLA" id="E01DCMCLA"
											size="12" maxlength="12" value="<%=dcNew.getE01DCMCLA()%>" <%=ctrlReadonly %>
											<%if (dcNew.getF01DCMCLA().equals("Y")) out.print("class=\"txtchanged\"");%>>
										</td>
										<td>
										<% if (!isReadonly) { %>
										<a
											href="javascript: GetCustomerDetails('E01DCMCLA','E01DCMCL1','','','','E01DCMCL2','E01DCMCL3','E01DCMCL4','','','','','','','','','','')">
												<img src="${pageContext.request.contextPath}/images/1b.gif"
												title=". . ."
												onclick="javascript: document.forms[0].E01DCMAF4.selectedIndex = 1"
												border="0">
										</a> Cliente o <a
											href="javascript: GetAccByClient('E01DCMCLA','','RT','','E01DCMCL1')">
												<img src="${pageContext.request.contextPath}/images/1b.gif"
												title=". . ."
												onclick="javascript: document.forms[0].E01DCMAF4.selectedIndex = 2"
												border="0">
										</a> Cuenta
										<% } %>
										</td>
									</tr>
								</table></td>
						</tr>
						<TR id="trclear">
							<TD align="right" nowrap>Codigo Swift:</TD>
							<TD align="left" nowrap><INPUT type="text" name="E01DCMCLI"
								size="14" maxlength="12" value="<%=dcNew.getE01DCMCLI()%>"
								<%if (dcNew.getF01DCMCLI().equals("Y")) out.print("class=\"txtchanged\"");%>>
								
								<% if (!isReadonly) {  %>
								<A href="javascript:GetSwiftIdDesc('E01DCMCLI','E01DCMCL1','E01DCMCL2','E01DCMCL3')">
									<IMG src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" border="0">
								</A>
								<% } %>
							</TD>
						</TR>
						<tr id="trdark">
							<td>
								<div align="right">Nombre :</div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMCL1" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMCL1()%>"  <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMCL1().equals("Y")) out.print("class=\"txtchanged\"");%>> 
										<% if (!isReadonly) { %>
										<IMG
										src="${pageContext.request.contextPath}/images/Check.gif"
										title="campo obligatorio" border="0">
										<% } %>
								</div></td>
						</tr>
						<tr id="trclear">
							<td>
								<div align="right">Dirección :</div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMCL2" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMCL2()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMCL2().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
						<tr id="trdark">
							<td>
								<div align="right"></div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMCL3" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMCL3()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMCL3().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
						<tr id="trclear">
							<td>
								<div align="right"></div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMCL4" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMCL4()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMCL4().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
						<tr id="trdark">
							<td>
								<div align="right">Referencia :</div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMCRF" size="20" maxlength="16"
										value="<%=dcNew.getE01DCMCRF()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMCRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
					</table></td>
			</tr>
		</table>

		<h4>Beneficiario</h4>
		<table class="tableinfo">
			<tr>
				<td>
					<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
						<TBODY>
							<TR id="trdark">
								<TD align="right">
									<TABLE border="0" cellspacing="0">
										<TBODY>
											<TR id="trdark">
												<TD align="right">Numero de Cliente o de Cuenta:</TD>
												<TD nowrap width="25%"><SELECT name="E01DCMAF2" <%=ctrlDisabled %>>
														<OPTION value=" "></OPTION>
														<OPTION value="C"
															<%if (dcNew.getE01DCMAF2().equals("C"))
				out.print("selected");%>>Cliente</OPTION>
														<OPTION value="A"
															<%if (dcNew.getE01DCMAF2().equals("A"))
				out.print("selected");%>>Cuenta</OPTION>
												</SELECT>
												</TD>
											</TR>
										</TBODY>
									</TABLE></TD>
								<TD>
									<TABLE border="0" cellspacing="0">
										<TBODY>
											<TR id="trdark">
												<TD align="left"><INPUT type="text" name="E01DCMDWA" id="E01DCMDWA"
													size="12" maxlength="12" value="<%=dcNew.getE01DCMDWA()%>" <%=ctrlReadonly %>
													<%if (dcNew.getF01DCMDWA().equals("Y")) out.print("class=\"txtchanged\"");%>>
												</TD>
												<TD>
												<% if (!isReadonly) { %>
												<A
													href="javascript: GetCustomerDetails('E01DCMDWA','E01DCMDW1','','','','E01DCMDW2','E01DCMDW3','E01DCMDW4','','','','','','','','','','')">
														<IMG src="${pageContext.request.contextPath}/images/1b.gif"
														title="Ayuda"
														onclick="javascript: document.forms[0].E01DCMAF2.selectedIndex = 1"
														align="bottom" border="0">
												</A> Cliente o <A
													href="javascript: GetAccByClient('E01DCMDWA','','RT','','E01DCMDW1')">
														<IMG src="${pageContext.request.contextPath}/images/1b.gif"
														title=". . ."
														onclick="javascript: document.forms[0].E01DCMAF2.selectedIndex = 2"
														border="0">
												</A> Cuenta

												<IMG src="${pageContext.request.contextPath}/images/Check.gif" title="campo obligatorio"  border="0">
												
												<% } %>
												</TD>
											</TR>
										</TBODY>
									</TABLE></TD>
							</TR>
							<TR id="trclear">
								<TD>
									<DIV align="right">Nombre :</DIV></TD>
								<TD>
									<DIV align="left">
										<INPUT type="text" name="E01DCMDW1" size="45" maxlength="35"
											value="<%=dcNew.getE01DCMDW1()%>" <%=ctrlReadonly %>
											<%if (dcNew.getF01DCMDW1().equals("Y")) out.print("class=\"txtchanged\"");%>>
									</DIV></TD>
							</TR>
							<TR id="trdark">
								<TD>
									<DIV align="right">Dirección :</DIV></TD>
								<TD>
									<DIV align="left">
										<INPUT type="text" name="E01DCMDW2" size="45" maxlength="35"
											value="<%=dcNew.getE01DCMDW2()%>" <%=ctrlReadonly %>
											<%if (dcNew.getF01DCMDW2().equals("Y")) out.print("class=\"txtchanged\"");%>>
									</DIV></TD>
							</TR>
							<TR id="trclear">
								<TD>
									<DIV align="right"></DIV></TD>
								<TD>
									<DIV align="left">
										<INPUT type="text" name="E01DCMDW3" size="45" maxlength="35"
											value="<%=dcNew.getE01DCMDW3()%>" <%=ctrlReadonly %>
											<%if (dcNew.getF01DCMDW3().equals("Y")) out.print("class=\"txtchanged\"");%>>
									</DIV></TD>
							</TR>
							<TR id="trdark">
								<TD>
									<DIV align="right"></DIV></TD>
								<TD>
									<DIV align="left">
										<INPUT type="text" name="E01DCMDW4" size="45" maxlength="35"
											value="<%=dcNew.getE01DCMDW4()%>" <%=ctrlReadonly %>
											<%if (dcNew.getF01DCMDW4().equals("Y")) out.print("class=\"txtchanged\"");%>>
									</DIV></TD>
							</TR>
							<TR id="trclear">
								<TD>
									<DIV align="right">Referencia :</DIV></TD>
								<TD>
									<DIV align="left">
										<INPUT type="text" name="E01DCMDRF" size="20" maxlength="16"
											value="<%=dcNew.getE01DCMDRF()%>" <%=ctrlReadonly %>
											<%if (dcNew.getF01DCMDRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
									</DIV></TD>
							</TR>
						</TBODY>
					</TABLE></td>
			</tr>
		</table>

		<h4>Banco Receptor de Fondos</h4>
		<table class="tableinfo">
			<tr>
				<td>
					<table cellspacing="0" cellpadding="2" width="100%" border="0">
						<tr id="trdark">
							<td align="right">
								<table border="0" cellspacing="0">
									<tr id="trdark">
										<td align="right">Numero de Cliente o de Cuenta:</td>
										<td nowrap width="25%"><select name="E01DCMAF5" <%=ctrlDisabled %>>
												<option value=" "></option>
												<option value="C"
													<%if (dcNew.getE01DCMAF5().equals("C"))
				out.print("selected");%>>Cliente</option>
												<option value="A"
													<%if (dcNew.getE01DCMAF5().equals("A"))
				out.print("selected");%>>Cuenta</option>
										</select></td>
									</tr>
								</table></td>
							<td>
								<table border="0" cellspacing="0">
									<tr id="trdark">
										<td align="left"><input type="text" name="E01DCMSRA" id="E01DCMSRA"
											size="12" maxlength="12" value="<%=dcNew.getE01DCMSRA()%>" <%=ctrlReadonly %>
											<%if (dcNew.getF01DCMSRA().equals("Y")) out.print("class=\"txtchanged\"");%>>
										</td>
										<td>
										<% if (!isReadonly) { %>
										<a
											href="javascript: GetCustomerDetails('E01DCMSRA','E01DCMSR1','','','','E01DCMSR2','E01DCMSR3','E01DCMSR4','','','','','','','','','','')">
												<img src="${pageContext.request.contextPath}/images/1b.gif"
												title=". . ."
												onclick="javascript: document.forms[0].E01DCMAF5.selectedIndex = 1"
												border="0">
										</a> Cliente o <a
											href="javascript: GetAccByClient('E01DCMSRA','','RT','','E01DCMSR1')">
												<img src="${pageContext.request.contextPath}/images/1b.gif"
												title=". . ."
												onclick="javascript: document.forms[0].E01DCMAF5.selectedIndex = 2"
												border="0">
										</a> Cuenta
										<% } %>
										</td>
									</tr>
								</table></td>
						</tr>
						<TR id="trclear">
							<TD align="right" nowrap>Codigo Swift:</TD>
							<TD align="left" nowrap><INPUT type="text" name="E01DCMSRI"
								size="14" maxlength="12" value="<%=dcNew.getE01DCMSRI()%>" <%=ctrlReadonly %>
								<%if (dcNew.getF01DCMSRI().equals("Y")) out.print("class=\"txtchanged\"");%>>
								<% if (!isReadonly) { %>
								<A href="javascript:GetSwiftIdDesc('E01DCMSRI','E01DCMSRB','E01DCMSR2','E01DCMSR3')">
									<IMG src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" border="0">
								</A>
							<% } %>
							</TD>
						</TR>						
						<tr id="trdark">
							<td>
								<div align="right">Nombre :</div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMSRB" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMSRB()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMSRB().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
						<tr id="trclear">
							<td>
								<div align="right">Dirección :</div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMSR2" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMSR2()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMSR2().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
						<tr id="trdark">
							<td>
								<div align="right"></div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMSR3" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMSR3()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMSR3().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
						<tr id="trclear">
							<td>
								<div align="right"></div></td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMSR4" size="45" maxlength="35"
										value="<%=dcNew.getE01DCMSR4()%>" <%=ctrlReadonly %>
										<%if (dcNew.getF01DCMSR4().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div></td>
						</tr>
						<tr id="trdark">
							<td>
								<div align="right">Nuestra Cuenta :</div>
							</td>
							<td>
								<div align="left">
									<input type="text" name="E01DCMNAC" size="45" maxlength="34" value="<%=dcNew.getE01DCMNAC()%>" <%=ctrlReadonly%>
									<%if (dcNew.getF01DCMNAC().equals("Y")) out.print("class=\"txtchanged\"");%>>
								</div>
							</td>
						</tr>						
					</table></td>
			</tr>
		</table>


	<h4>Información de la Cobranza</h4>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF">
				<td nowrap>
					<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
						<TBODY>
							<tr id="trdark">
								<td nowrap width="30%">
									<div align="right">Fecha de Emisión :</div></td>
								<td nowrap width="20%">
									<eibsinput:date name="dcNew" fn_month="E01DCMIDM" fn_day="E01DCMIDD" fn_year="E01DCMIDY" />
								</td>
								<td nowrap width="30%">
									<div align="right">Sucursal/Oficina :</div></td>
								<td nowrap width="20%"><INPUT type="text" name="E01DCMBRM"
									maxlength="3" size="4"
									value="<%=dcNew.getE01DCMBRN().trim()%>" readonly
									>
									<% if (dcNew.getE01DCMOPT().equals("N") && !isReadonly) { %>
									<A href="javascript:GetBranch('E01DCMBRN',document.forms[0].E01DCMBNK.value,'')"><IMG
										src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda"
										border="0"></A>
									<% } %></td>
							</tr>
							<TR id="trclear">
								<TD nowrap width="30%">
									<DIV align="right">Moneda Extranjera y Tipo de Cambio:</DIV></TD>
								<TD nowrap width="20%"><INPUT type="text" name="E01DCMFCY"
									maxlength="3" size="4"
									value="<%=dcNew.getE01DCMFCY().trim()%>" readonly>
									<INPUT
									type="text" name="E01DCMOFX" maxlength="11" size="14"
									value="<%=dcNew.getE01DCMOFX().trim()%>"
									onkeypress="enterDecimal(event, 6)" <%=dcNew.getE01DCMOPT().equals("N")? "": "readonly"%> disabled> 
									</TD>
								<TD nowrap width="30%"><DIV align="right">Centro de
										Costo :</DIV></TD>
								<TD nowrap width="20%"><INPUT
									type="text" name="E01DCMCCN" maxlength="9" size="10"
									value="<%=dcNew.getE01DCMCCN().trim()%>" <%=ctrlReadonly %>
									<%if (dcNew.getF01DCMCCN().equals("Y")) out.print("class=\"txtchanged\"");%>>
									<% if (!isReadonly) { %>
									<A
									href="javascript:GetCostCenter('E01DCMCCN',document.forms[0].E01DCMBNK.value)"><IMG
										src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda"
										border="0">
								</A>
									<% } %>
								</TD>
							</TR>
							<TR id="trdark">
								<TD nowrap width="30%">
									<DIV align="right">Número del Cheque :</DIV></TD>
								<TD nowrap width="20%"><INPUT type="text" name="E01DCMCKN"
									maxlength="10" size="11"
									value="<%=dcNew.getE01DCMCKN().trim()%>"
									onkeypress="enterInteger(event)" <%=ctrlReadonly %>
									<%if (dcNew.getF01DCMCKN().equals("Y")) out.print("class=\"txtchanged\"");%>> 
									<% if (!isReadonly) { %>
									<IMG
									src="${pageContext.request.contextPath}/images/Check.gif"
									title="campo obligatorio" border="0"> <% } %></TD>
								<TD nowrap width="30%">
									<DIV align="right">N° de Tarifa de Cargos :</DIV></TD>
								<TD nowrap width="20%"><INPUT type="text" name="E01DCMTAR"
									maxlength="3" size="4"
									value="<%=dcNew.getE01DCMTAR().trim()%>" <%=ctrlReadonly %>
									<%if (dcNew.getF01DCMTAR().equals("Y")) out.print("class=\"txtchanged\"");%>>
									<% if (!isReadonly) { %>
									<A
									href="javascript:GetTariffColl('E01DCMTAR','<%=dcNew.getE01DCMATY()%>','<%=dcNew.getE01DCMCUN()%>')"><IMG
										src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda"
										border="0">
								</A><IMG src="${pageContext.request.contextPath}/images/Check.gif"
									title="campo obligatorio" border="0"> <% } %>
								</TD>
							</TR>
							<TR id="trclear">
								<TD nowrap width="30%">
									<DIV align="right">Monto del Cheque :</DIV></TD>
								<TD nowrap width="20%"><INPUT type="text" name="E01DCMOAM"
									maxlength="19" size="20"
									value="<%=dcNew.getE01DCMOAM().trim()%>"
									onkeypress="enterDecimal(event)"
									<%=!dcNew.getE01DCMOPT().equals("N") ? "readonly" : ""%> <%=ctrlReadonly %>
									>
									<% if (!isReadonly) { %>
									<IMG src="${pageContext.request.contextPath}/images/Check.gif"
									title="campo obligatorio" border="0">
									<% } %>
									</TD>
								<TD nowrap width="30%">
									<DIV align="right">Tracers Vía Swift :</DIV></TD>
								<TD nowrap width="20%"><INPUT type="radio" name="E01DCMTVS"
									value="Y"
									<%if (dcNew.getE01DCMTVS().equals("Y"))
				out.print("checked");%> <%=ctrlDisabled %>>Sí
									<INPUT type="radio" name="E01DCMTVS" value="N"
									<%if (dcNew.getE01DCMTVS().equals("N"))
				out.print("checked");%> <%=ctrlDisabled %>>No
								</TD>
							</TR>
							<TR id="trdark">
								<TD nowrap width="30%">
									<DIV align="right">Cargos Nuestros x Cta. del :</DIV></TD>
								<TD nowrap width="20%">
										<SELECT name="E01DCMOCF" <%=ctrlDisabled %>>
										<OPTION value="D" <%if (dcNew.getE01DCMOCF().equals("D")) out.println("selected");%>>Deducir del Pago</OPTION>
										<OPTION value="N" <%if (dcNew.getE01DCMOCF().equals("N")) out.println("selected");%>>Sin Cargos</OPTION>
								</SELECT> 
								<% if (!isReadonly) { %>
								<IMG src="${pageContext.request.contextPath}/images/Check.gif"
									title="campo obligatorio" border="0"> <% } %></TD>
								<TD nowrap width="30%">
									<DIV align="right">Avisar No Pago Vía :</DIV></TD>
								<TD nowrap width="20%"><SELECT name="E01DCMADF" <%=ctrlDisabled %>>
										<OPTION value=" "></OPTION>
										<OPTION value="T"
											<%if (dcNew.getE01DCMADF().equals("T"))
				out.println("selected");%>>Télex</OPTION>
										<OPTION value="S"
											<%if (dcNew.getE01DCMADF().equals("S"))
				out.println("selected");%>>Swift</OPTION>
										<OPTION value="A"
											<%if (dcNew.getE01DCMADF().equals("A"))
				out.println("selected");%>>Correo
											Aéreo</OPTION>
										<OPTION value="C"
											<%if (dcNew.getE01DCMADF().equals("C"))
				out.println("selected");%>>Mensaje</OPTION>
										<OPTION value="F"
											<%if (dcNew.getE01DCMADF().equals("F"))
				out.println("selected");%>>Fax</OPTION>
								</SELECT></TD>
							</TR>
							<TR id="trclear">
								<TD nowrap width="30%">
									<DIV align="right">Cargos del Otro Banco x Cta. del :</DIV></TD>
								<TD nowrap width="20%"><SELECT name="E01DCMOBF" <%=ctrlDisabled %>>
										<OPTION value=" "></OPTION>
										<OPTION value="D" <%if (dcNew.getE01DCMOBF().equals("D")) out.println("selected");%>>Girado/Importador</OPTION>
										<OPTION value="P" <%if (dcNew.getE01DCMOBF().equals("P")) out.println("selected");%>>Girador/Exportador</OPTION>
								</SELECT></TD>
								<TD nowrap width="30%">
									<DIV align="right">Avisar Pago Vía :</DIV></TD>
								<TD nowrap width="20%"><SELECT name="E01DCMAPF" <%=ctrlDisabled %>>
										<OPTION value=" "></OPTION>
										<OPTION value="T" <%if (dcNew.getE01DCMAPF().equals("T")) out.println("selected");%>>Télex</OPTION>
										<OPTION value="S" <%if (dcNew.getE01DCMAPF().equals("S")) out.println("selected");%>>Swift</OPTION>
										<OPTION value="A" <%if (dcNew.getE01DCMAPF().equals("A")) out.println("selected");%>>Correo Aéreo</OPTION>
										<OPTION value="C" <%if (dcNew.getE01DCMAPF().equals("C")) out.println("selected");%>>Mensaje</OPTION>
										<OPTION value="F" <%if (dcNew.getE01DCMAPF().equals("F")) out.println("selected");%>>Fax</OPTION>
								</SELECT></TD>
							</TR>
							<TR id="trdark">
								<TD nowrap width="30%"><DIV align="right">
										<DIV align="right"><div align="right">Fecha de Próximo Tracer :</div></DIV>
								<eibsinput:date name="dcNew" fn_month="E01DCMNTM" fn_day="E01DCMNTD" fn_year="E01DCMNTY" />
									</DIV></TD>
								<TD nowrap width="30%">
									<DIV align="right">Estado de la Cobranza :</DIV></TD>
								<TD nowrap width="20%"><SELECT name="E01DCMCST" <%=ctrlDisabled %>>
										<OPTION value=" "></OPTION>
										<OPTION value="0"
											<%if (dcNew.getE01DCMCST().equals("0"))
				out.println("selected");%>>Esperando
											Confirmación Recibida</OPTION>
										<OPTION value="1"
											<%if (dcNew.getE01DCMCST().equals("1"))
				out.println("selected");%>>Pendiente
											de Aceptación</OPTION>
										<OPTION value="2"
											<%if (dcNew.getE01DCMCST().equals("2"))
				out.println("selected");%>>Pendiente
											de Pago</OPTION>
										<OPTION value="3"
											<%if (dcNew.getE01DCMCST().equals("3"))
				out.println("selected");%>>Aceptada</OPTION>
										<OPTION value="4"
											<%if (dcNew.getE01DCMCST().equals("4"))
				out.println("selected");%>>Protestada
											Vigente</OPTION>
										<OPTION value="5"
											<%if (dcNew.getE01DCMCST().equals("5"))
				out.println("selected");%>>Prorrogada
											Extendida</OPTION>
										<OPTION value="6"
											<%if (dcNew.getE01DCMCST().equals("6"))
				out.println("selected");%>>Cancelada
											- Libre de Pago</OPTION>
										<OPTION value="7"
											<%if (dcNew.getE01DCMCST().equals("7"))
				out.println("selected");%>>Cancelada
											- Devuelta</OPTION>
										<OPTION value="8"
											<%if (dcNew.getE01DCMCST().equals("8"))
				out.println("selected");%>>Cerrada
											Parcialmente Pagada</OPTION>
										<OPTION value="9"
											<%if (dcNew.getE01DCMCST().equals("9"))
				out.println("selected");%>>Cerrada
											Totalmente Pagada</OPTION>
										<OPTION value="P"
											<%if (dcNew.getE01DCMCST().equals("P"))
				out.println("selected");%>>Vencida
											Protestada</OPTION>
										<OPTION value="V"
											<%if (dcNew.getE01DCMCST().equals("V"))
				out.println("selected");%>>Vencida
											Sin Protestar</OPTION>
								</SELECT>
								</TD>
							</TR>


				<TR id="trclear">
				  <TD width="25%" align="right" nowrap>Generar Swift:</TD>
				  <TD nowrap width="25%"><INPUT type="radio" name="E01DCMSWF" value="Y" <% if(!dcNew.getE01DCMSWF().equals("N")) out.print("checked");%> <%=ctrlDisabled%>>
				    Si
				    <INPUT type="radio" name="E01DCMSWF" value="N" <% if( dcNew.getE01DCMSWF().equals("N")) out.print("checked");%> <%=ctrlDisabled%>>
				    No </TD>
				  <TD align="right" nowrap>Tipo Mensaje Swift: </TD>
				  <TD align="left" nowrap><SELECT name="E01DCMSMT" <%=ctrlDisabled%>>
				      <% if (dcNew.getE01DCMOPT().equals("N")) { %>			
                      <OPTION value="410" <% if(dcNew.getE01DCMSMT().equals("410")) out.print("selected");%>>MT410</OPTION>
                      <% } else { %>    
                      <OPTION value="412" <% if(dcNew.getE01DCMSMT().equals("412")) out.print("selected");%>>MT412</OPTION>
                      <OPTION value="416" <% if(dcNew.getE01DCMSMT().equals("416")) out.print("selected");%>>MT416</OPTION>
                      <OPTION value="420" <% if(dcNew.getE01DCMSMT().equals("420")) out.print("selected");%>>MT420</OPTION>
                      <OPTION value="422" <% if(dcNew.getE01DCMSMT().equals("422")) out.print("selected");%>>MT422</OPTION>
                      <OPTION value="430" <% if(dcNew.getE01DCMSMT().equals("430")) out.print("selected");%>>MT430</OPTION>                      
                     <%-- <OPTION value="" <% if(dcNew.getE01DCMSMT().equals("")) out.print("selected");%>>- ninguno -</OPTION> --%>
                      <% } %>				  
                  </SELECT></TD>
			 </TR>
		   

						</TBODY>
					</TABLE></td>
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
					<OPTION value=" "></OPTION>
					<OPTION value="I" <%= dcNew.getE01DCMOPT().equals("I")?"selected":"" %>>Aumento</OPTION>
					<OPTION value="D" <%= dcNew.getE01DCMOPT().equals("D")?"selected":"" %>>Disminucion</OPTION>
				</SELECT>
			
			</TD>
			<TD nowrap width="20%">
                <INPUT type="text" name="E01AMTOPT" maxlength="16" size="17" value="<%= dcNew.getE01AMTOPT()%>" onkeypress="enterDecimal(event)" <%=ctrlReadonly%>>
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
		
		<BR>
	<% if (!isReadonly) { %>
		<DIV align="center">
			<H4 style="text-align: center">
				<INPUT type="checkbox" name="H01FLGWK2" value="A"
					<%if (dcNew.getH01FLGWK2().equals("A")) {
				out.print("checked");
			}%>>Aceptar
				con Advertencias
			</H4>
			<INPUT id="EIBSBTN" type="button" name="Validate" value="Validar" onclick="this.disabled=true;validate();">
			&nbsp;&nbsp;
			<INPUT id="EIBSBTN" type="button" name="Finalize" value="Finalizar" onclick="this.disabled=true;finalize();">			
		</DIV>
	<% } %>
	</form>
	
<script type="text/javascript">
<% if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL")) { %>
	$("input[type='text']").attr("readonly", "readonly").prop("onchange",null).prop("change",null);  
	$("select").add("button").add("submit").add("input[type='radio']").add("input[type='checkbox']").attr("disabled", "disabled").prop("onchange",null).prop("change",null);  
	$("img[title='null']").add("img[src*='1b.gif']").add("img[src*='Check.gif']").add("img[src*='calendar.gif']").hide(); 	
	$("input.context-menu-help").removeClass();
<% } %>
</script>

<% if(userPO.getPurpose().equals("APPROVAL")){ %>
<%-- Add Right Click Consulta Functionality --%>		
	<script type="text/javascript">
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
	</script>
<% } %>
	

</body>
</html>
