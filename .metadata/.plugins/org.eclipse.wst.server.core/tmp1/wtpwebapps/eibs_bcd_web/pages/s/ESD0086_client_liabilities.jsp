<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Entidades Asociadas a Clientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

</head>

<jsp:useBean id="ESD0086Record" class="datapro.eibs.beans.ESD008601Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<body>

<<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT>
<%boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL");
			boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
			boolean isReadOnly = isApprovalInquiry || isInquiry;
			boolean readMnt = (userPO.getPurpose().equals("NEW") ? false : true);
			boolean isCustomer = !ESD0086Record.getField("E01RCN").getString()
					.trim().equals("0");
			String legtyp = (ESD0086Record.getH01LGT().equals("1") ? "JURIDICO"	: "PERSONA");
			String readDsc = (userPO.getPurpose().equals("NEW") ? "" : "readonly");
			String read = "";
			String disabled = "";
			String mandatory = "<img src=\""
					+ request.getContextPath()
					+ "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
			String tf = "false";

			if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose()
					.equals("MAINTENANCE"))) {
				read = " readonly ";
				disabled = " disabled";
				tf = "true";
			}
			if (isApprovalInquiry) {%>
		<%if (!ESD0086Record.getH01LGT().equals("1")) {%>
		     builtNewMenu(client_ap_personal_opt);
         <%} else {%>
		     builtNewMenu(client_ap_corp_opt);
         <%}%>
   <%} else {%>

   <%if (isInquiry) {%>
	    <%if (!ESD0086Record.getH01LGT().equals("1")) {%>
		     builtNewMenu(client_inq_personal_opt);
         <%} else {%>
		     builtNewMenu(client_inq_corp_opt);
         <%}%>	 
   <%} else {%>
         <%if (!ESD0086Record.getH01LGT().equals("1")) {%>
		     builtNewMenu(client_personal_opt);
         <%} else {%>
		     builtNewMenu(client_corp_opt);
         <%}%>
   <%}%> 
   <%}%>  

 
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}

	submitForm();
}
</script>
<%
	int row = 0; 
	if (!error.getERRNUM().equals("0")) {
		out.println("<SCRIPT Language=\"Javascript\">");
		error.setERRNUM("0");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<H3 align="center">Pasivos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="client_assets.jsp, ESD0086"></H3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0086">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5"> 
	<INPUT TYPE=HIDDEN 	NAME="RECTYP" VALUE="<%=userPO.getHeader10()%>"> 
	
<table class="tableinfo" width="100%">
	<tr bordercolor="#FFFFFF"> 
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" class="tbhead"
			bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="10%" align="right">Tipo Legal :</td>
				<td nowrap width="20%" align="left"><%=legtyp%></td>
				<td nowrap width="10%" align="right">Estado :</td>
				<td nowrap width="60%" align="left"
					style="color: red; font-size: 12;"><b><%=ESD0086Record.getD01STS().trim()%></b>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="10%" align="right">Código :</td>
				<td nowrap width="20%" align="left"><b><%=ESD0086Record.getH01CUN().trim()%></b></td>
				<td nowrap width="10%" align="right">Nombre Legal :</td>
				<td nowrap width="60%" align="left"><b><%=ESD0086Record.getH01NA1().trim()%></b></td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="10%" align="right">ID :</td>
				<td nowrap width="20%" align="left"><b><%=ESD0086Record.getH01PID().trim()%>
				- <%=ESD0086Record.getH01TID().trim()%> - <%=ESD0086Record.getH01IDN().trim()%></b>
				</td>
				<td nowrap width="10%" align="right"></td>
				<td nowrap width="60%" align="left"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<table class="tableinfo" width="100%">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			class="tbhead">
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="5%" align="right">Consecutivo :</td>
				<td nowrap width="10%" align="left">
					<INPUT type="text" name="E01MAN" size="3" readonly value="<%=ESD0086Record.getE01MAN().trim()%>">
				</td>
				<td nowrap width="5%" align="right">Tipo :</td>
				<td nowrap width="40%" align="left">
					<eibsinput:cnofc name="ESD0086Record" property="E01UC9" value="<%=ESD0086Record.getE01UC9()%>" required="true" flag="87" fn_code="E01UC9" fn_description="D01UC9"
					onchange="showIdFields(this.value)" onfocus="showIdFields(this.value)" readonly="<%=readMnt %>" />
					<input type="text" name="D01UC9" size="30" value="<%=ESD0086Record.getD01UC9().trim()%>" readonly>
					<br>
				</td>
				<td nowrap width="5%" align="right">Estado :</td>
				<td nowrap width="35%" align="left">
					<select name="E01FL2" <%=disabled%>
					<%if (isApprovalInquiry || isInquiry) {
						if (ESD0086Record.getF01FL2().equals("Y"))
						out.print("id=\"txtchanged\"");
					}%>> 
					<option value="A" <%if (ESD0086Record.getE01FL2().equals("A")) out.print("selected");%>>ACTIVO</option>
					<option value="C" <%if (ESD0086Record.getE01FL2().equals("C")) out.print("selected");%>>INACTIVO</option>
					<option value=" " <%if ((!ESD0086Record.getE01FL2().equals("A") && !ESD0086Record.getE01FL2().equals("C"))) out.print("selected");%>></option>
					</select>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="5%" align="right"></td>
				<td nowrap width="10%" align="left">
				</td>
				<td nowrap width="5%" align="right">Descripción : </td>
				<td nowrap width="40%" align="left">
					<INPUT type="text" name="E01DSC" value="<%=ESD0086Record.getE01DSC().trim()%>" size="65" maxlength="60" <%=readDsc%>>
				</td>
				<td nowrap width="5%" align="right"></td>
				<td nowrap width="35%" align="left">
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="5%" align="right"></td>
				<td nowrap width="10%" align="left">
				</td>
				<td nowrap width="5%" align="right">Entidad : </td>
				<td nowrap width="40%" align="left">
					<eibsinput:text name="ESD0086Record" property="E01RMK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="65" maxlength="60" required="false" readonly="<%=isReadOnly %>" />
				</td>
				<td nowrap width="5%" align="right">Monto : </td>
				<td nowrap width="35%" align="left">
					<input type="text" name="E01AMT" size="22" maxlength="21" value="<%= ESD0086Record.getE01AMT().trim()%>" onKeypress="enterDecimal(event, 2)" <%=read%>>
				</td>
			</tr>			
		</table>
		</td>
	</tr>
</table>

<br>

<table width="100%" border="0" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	<tr bgcolor="#FFFFFF">
		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1">Aceptar con Avisos</td>
	</tr>
</table>
<table width="100%">
	<tr>
		<td width="33%">
		<div align="center"><input id="EIBSBTN" type=button
			name="Submit" value="Enviar" onClick="goAction(5);" <%=disabled%>>
		</div>
		</td>
		<td width="33%">
		<div align="center"><input id="EIBSBTN" type=button
			name="Delete" value="Borrar" onClick="goAction(4);" <%=disabled%>>
		</div>
		</td>
		<td width="34%">
		<div align="center">
		<%
			int screen = 1;
			if (userPO.getPurpose().equals("INQUIRY")) {
				screen = 8;
			}
			if (userPO.getPurpose().equals("APPROVAL")) {
				screen = 6;
			}
		%> <input id="EIBSBTN" type=submit name="Exit" value="Salir"
			onClick="goAction(<%=screen%>);"></div>
		</td>
	</tr>
</table>

</form>
</body>

<SCRIPT Language="Javascript">
	
</SCRIPT>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=ESD0086Record"> </script>
</html>
