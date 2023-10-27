<!DOCTYPE HTML>
<%@ page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util"%>
<html>
<head>
<title>Customer Portfolio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="cusPort" class="datapro.eibs.beans.ESD008801Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=cusPort"> </script>

<SCRIPT type="text/javascript">
<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"));
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
 	String disabledMnt = (userPO.getPurpose().equals("NEW")?"":" disabled");
 	if (isInquiry) {
 	  help = "";
 	}
%>
	
<%if (userPO.getPurpose().equals("MAINTENANCE")) {%>
	builtNewMenu(cus_m_port_opt);
<%} else if (userPO.getPurpose().equals("INQUIRY")) {%>
	builtNewMenu(cus_i_port_opt);
<%} else if (userPO.getPurpose().equals("APPROVAL")) {%>
	builtNewMenu(cus_a_port_opt);
<%}%>
<%if (!userPO.getPurpose().equals("NEW")) {%>
  initMenu();
<%}%>  

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	submitForm();
}
</SCRIPT>


</head>
<body>
	<%
		if (!error.getERRNUM().equals("0")) {
			error.setERRNUM("0");
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");
		}
	%>
	<div align="center">
		<h3>
			Portafolio de Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cus_port_basic.jsp,ESD0088">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0088">
		<h4>Información Básica</h4>
		<input type="hidden" name="SCREEN" value="300">

		<table border="0" width="100%">
			<tr id="trclear">
				<td width="82%">
					<%
						if (cusPort.getH01OPECOD().equals("0001")) {
					%>
					<div align="right">
						<font color="#FF0000">Nuevo Record</font> - Estado :
					</div> <%
 	} else {
 %>
					<div align="right">Estado :</div> <%
 	}
 %>
				</td>
				<td width="18%">
					<select name="E01PRFSTS">
						<option value="" <%if (cusPort.getE01PRFSTS().equals("")) {	out.print("selected");}%>></option>
						<option value="P" <%if (cusPort.getE01PRFSTS().equals("P")) { out.print("selected");}%>>Pendiente</option>
						<option value="A" <%if (cusPort.getE01PRFSTS().equals("A")) { out.print("selected");}%>>Activo</option>
						<option value="I" <%if (cusPort.getE01PRFSTS().equals("I")) { out.print("selected");}%>>Inactivo</option>
					</select>
				</td>
			</tr>
		</table>
		<BR>
		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
						<tr id="trdark">
							<TD nowrap width="34%">
								<DIV align="right">Portafolio / Descripción :</DIV>
							</TD>
							<TD nowrap>
								<INPUT type="text" name="E01PRFNUM" size="12" maxlength="9" value="<%=cusPort.getE01PRFNUM().trim()%>" readonly>
							 	/ 
							 	<INPUT type="text" name="E01PRFDSC" size="35" maxlength="35" value="<%=cusPort.getE01PRFDSC()%>"> 
							 	<%=mandatory%>
							</TD>
						</tr>
						<TR>
							<TD nowrap width="34%" align="right">Cliente Principal : </TD>
							<TD nowrap>
								<INPUT type="text" name="E01PRFCUN" size="12" maxlength="9" value="<%=cusPort.getE01PRFCUN().trim()%>" onkeypress="enterInteger(event)"
								<%if (userPO.getPurpose().equals("MAINTENANCE")) { out.print("readonly"); }%>>
								<INPUT type="text" name="D01CUSNA1" size="35" maxlength="35" value="<%=cusPort.getD01CUSNA1().trim()%>" readonly> <%
 								if (!userPO.getPurpose().equals("MAINTENANCE")) { %>
								<a href="javascript:GetCustomerDescIdNP('E01PRFCUN', 'D01CUSNA1', '')"><%=help%></a> 
								<% } %> 
								<%=mandatory%>
							</TD>

						</TR>
						<tr id="trdark">
							<td nowrap width="34%" align="right">Oficial de Cuenta :</td>
							<td nowrap>
								<input type="text" name="E01PRFOFC" size="6" maxlength="4" value="<%=cusPort.getE01PRFOFC().trim()%>">
								<input type="text" name="D01OFCNME" size="35" maxlength="35" value="<%=cusPort.getD01OFCNME()%>" readonly> 
								<a href="javascript:GetCodeDescCNOFC('E01PRFOFC','D01OFCNME', '15')"><%=help%></a> 
								<%=mandatory%>
							</td>
						</tr>

						<tr id="trclear">
							<td nowrap width="34%" align="right">Cuenta Efectivo por Defecto :</td>
							<td nowrap>
								<input type="text" name="E01PRFHAC" size="15" maxlength="12" value="<%=cusPort.getE01PRFHAC()%>"> 
								<a href="javascript:GetAccount('E01PRFHAC','','RT','')"><%=help%></a>
							</td>	
						</tr>
						<tr id="trdark">
							<td nowrap width="34%" align="right">Fecha de Apertura :</td>
							<td nowrap>
								<eibsinput:date name="cusPort" fn_year="E01PRFOPY" fn_month="E01PRFOPM" fn_day="E01PRFOPD" />
							</td>
						</tr>
						<tr id="trclear">
							<td nowrap width="34%" align="right">Moneda del Portafolio : </td>
							<td nowrap>
								<input type="text" name="E01PRFVCY" size="4" maxlength="3" value="<%=cusPort.getE01PRFVCY().trim()%>">
								<a href="javascript:GetCurrency('E01PRFVCY','')"><%=help%></a> 
								<%=mandatory%>
							</td>
						</tr>

						<tr id="trdark">
							<td nowrap width="34%">
								<div align="right">Estado del Portafolio Via :</div>
							</td>
							<td nowrap>
								<div align="left">
									<select name="E01PRFSTM">
										<option value="N" <%if (cusPort.getE01PRFSTM().equals("N")) { out.print("selected");}%>>Ninguno</option>
										<option value="E" <%if (cusPort.getE01PRFSTM().equals("E")) { out.print("selected");}%>>e-Mail</option>
										<option value="P" <%if (cusPort.getE01PRFSTM().equals("P")) { out.print("selected");}%>>Impresión</option>
										<option value="B" <%if (cusPort.getE01PRFSTM().equals("B")) { out.print("selected");}%>>Impresión/e-Mail</option>
										<option value="F" <%if (cusPort.getE01PRFSTM().equals("F")) { out.print("selected");}%>>Fax</option>
									</select>
								</div>
							</td>
						</tr>
						<tr id="trclear">
							<td nowrap width="34%" align="right">Notificaciones Via :</td>
							<td nowrap>
							<SELECT name="E01PRFCNF">
									<OPTION value="N" <%if (cusPort.getE01PRFCNF().equals("N")) {out.print("selected");}%>>Ninguno</OPTION>
									<OPTION value="E" <%if (cusPort.getE01PRFCNF().equals("E")) {out.print("selected");}%>>e-Mail</OPTION>
									<OPTION value="P" <%if (cusPort.getE01PRFCNF().equals("P")) {out.print("selected");}%>>Impresión</OPTION>
									<OPTION value="B" <%if (cusPort.getE01PRFCNF().equals("B")) {out.print("selected");}%>>Impresión/e-Mail</OPTION>
									<OPTION value="F" <%if (cusPort.getE01PRFCNF().equals("F")) {out.print("selected");}%>>Fax</OPTION>
							</SELECT>
							</td>
						</tr>
						<%
							if (userPO.getPurpose().equals("NEW")) {
						%>
						<tr id="trdark">
							<td nowrap width="34%" align="right">Producto de Cuenta Efectivo  :</td>
							<td nowrap>
								<INPUT type="text" name="E01PRFCDE" size="5" maxlength="4" value="<%=cusPort.getE01PRFCDE()%>"> 
								<INPUT type="text" name="D01PRFCDE" size="40" maxlength="35" value="<%=cusPort.getD01PRFCDE()%>" readonly>
								<A href="javascript:GetProduct('E01PRFCDE','','','D01PRFCDE', 'RT')"><%=help%></A>
							</td>
						</tr>
						<%
							}
						%>
						<TR>
							<TD nowrap width="34%" align="right" height="11"></TD>
							<TD nowrap height="11"></TD>
						</TR>
					</table>
				</td>
			</tr>
		</table>

		<BR>
		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
						<tr id="trdark">
							<td nowrap colspan="2">Nombre Legal :</td>
						</tr>
						<tr id="trclear">
							<td nowrap colspan="2">
								<div align="center">
									<textarea name="E01LEGNME" cols="80" rows="4" readonly> <%=cusPort.getE01LEGNME()%> </textarea>
								</div>
							</td>
						</tr>
						<tr id="trdark">
							<td nowrap colspan="2">
								<div align="left">Commentarios :</div>
							</td>
						</tr>
						<tr id="trclear">
							<td nowrap colspan="2">
								<div align="center">
									<textarea name="E01PRFCMT" cols="80" rows="4" > <%=cusPort.getE01PRFCMT()%> </textarea>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<H4>Códigos de Clasificación</H4>
		<TABLE class="tableinfo" width="100%">
			<TBODY>
				<TR>
					<TD nowrap width="100%">

						<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
							align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
							<TBODY>
								<TR id="trdark">
									<TD nowrap width="22%" align="right">Oficial Secundario : </TD>
									<TD nowrap width="18%">
										<INPUT type="text" name="E01OF2" size="5" maxlength="3" value="<%=cusPort.getE01OF2().trim()%>">
										<A href="javascript:GetCodeCNOFC('E01OF2','15')"><%=help%></A>
									</TD>
									<TD nowrap width="29%" align="right">Código Industrial : </TD>
									<TD nowrap width="31%">
										<INPUT type="text" name="E01INC" size="5" maxlength="3" value="<%=cusPort.getE01INC().trim()%>">
										<A href="javascript:GetCodeCNOFC('E01INC','09')"><%=help%></A>
									</TD>
								</TR>
								<TR id="trclear">
									<TD nowrap width="22%" align="right">País de Residencia :</TD>
									<TD nowrap width="18%">
										<INPUT type="text" name="E01GEC" size="5" maxlength="3" value="<%=cusPort.getE01GEC().trim()%>">
										<A href="javascript:GetCodeCNOFC('E01GEC','03')"><%=help%></A> 
										<%=mandatory%>
									</TD>
									<TD nowrap width="29%" align="right">Tipo de Negocio :</TD>
									<TD nowrap width="31%">
										<INPUT type="text" name="E01BUC" size="5" maxlength="3" value="<%=cusPort.getE01BUC().trim()%>">
										<A href="javascript:GetCodeCNOFC('E01BUC','12')"><%=help%></A>
									</TD>
								</TR>
								<TR id="trdark">
									<TD nowrap width="22%" align="right">Institución Legal :</TD>
									<TD nowrap width="18%">
										<INPUT type="text" name="E01UC2" size="5" maxlength="3" value="<%=cusPort.getE01UC2().trim()%>">
										<A href="javascript:GetCodeCNOFC('E01UC2','2B')"><%=help%></A>
										</TD>
									<TD nowrap width="29%" align="right">Código de Usuario 3 :</TD>
									<TD nowrap width="31%">
										<INPUT type="text" name="E01UC3" size="5" maxlength="3" value="<%=cusPort.getE01UC3().trim()%>">
										<A href="javascript:GetCodeCNOFC('E01UC3','2C')"><%=help%></A> 
										Solo si Reg. "O"
									</TD>
								</TR>
								<TR id="trclear">
									<TD nowrap width="22%" align="right">Nivel de Riesgo :</TD>
									<TD nowrap width="18%">
										<INPUT type="text" name="E01RSL" size="5" maxlength="4" value="<%=cusPort.getE01RSL().trim()%>">
										<A href="javascript:GetCodeCNOFC('E01RSL','31')"><%=help%></A>
									</TD>
									<TD nowrap width="29%"></TD>
									<TD nowrap width="31%"></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>


		<H4>Información Adicional</H4>
		<TABLE class="tableinfo" width="100%">
			<TBODY>
				<TR>
					<TD nowrap width="100%">

						<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
							align="left" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
							<TBODY>
								<TR id="trclear">

									<TD nowrap width="23%" align="right">Sujeto a Impuestos en E.U. :</TD>
									<TD nowrap width="36%">
										<INPUT type="radio" name="E01FG2" value="Y" <%if (cusPort.getE01FG2().equals("Y")) out.print("checked");%>>
										Yes 
										<INPUT type="radio" name="E01FG2" value="N" <%if (!cusPort.getE01FG2().equals("Y")) out.print("checked");%>>
										No 
										<%=mandatory%>
									</TD>
								</TR>
								<TR id="trdark">
									<TD nowrap width="23%" align="right">Portafolio de Tesorería : </TD>
									<TD nowrap width="39%">
										<INPUT type="radio" name="E01FL5" value="Y" <%if (cusPort.getE01FL5().equals("Y")) 	out.print("checked");%>>
										Yes 
										<INPUT type="radio" name="E01FL5" value="N" <% if (!cusPort.getE01FL5().equals("Y")) out.print("checked");%>>
										No 
										<%=mandatory%>
									</TD>
								</TR>
								<TR id="trclear">
									<TD nowrap width="22%" align="right">Monto Potencial :</TD>
									<TD nowrap width="41%" bordercolor="#FFFFFF">
										<INPUT type="text" name="E01CAI" size="16" maxlength="15" value="<%=cusPort.getE01CAI().trim()%>"></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<%if (!isInquiry) {%>
		<p align="center">
			<input class="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(300);"><BR>
		</p>
		<%}%>
		<%if (isInquiry) {%>
			<script>readOnlyPage();</script>
		<% } %>
		
	</form>
	
</body>
</html>
