<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="ebl0110Msg" class="datapro.eibs.beans.EBL011001Message" scope="session" />

<html>
<head>
<title>Detalle del Cliente</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"	rel="stylesheet">
<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<meta name="GENERATOR" content="Rational Software Architect">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>
<body bgcolor="#FFFFFF">
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
 %>
<h3 align="center">Detalle del Cliente<img	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="client_detail_inquiry, EBL0110"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEBL0110">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap >
		<table cellspacing="0" cellpadding="2"  border="0" width="100%">
			<tr id="trdark">
				<td nowrap  width="13%">
					<div align="right" >Número del Cliente :</div>
				</td>
				<td nowrap align="left"  width="13%"><input
					type="text" readonly name="E01CURCUN" value="<%=ebl0110Msg.getE01CURCUN()%>" maxlength="" size="10">
				</td>
				<td nowrap  width="16%">
					<div align="right" >País de Identificación :</div>
				</td>
				<td nowrap align="left" valign="middle" width="13%">
				<input type="text" readonly name="E01CURPID"
					value="<%=ebl0110Msg.getE01CURPID()%>" maxlength="4" size="5">
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="13%">
					<div align="right" >Identificación :</div>
				</td>
				<td nowrap align="left" valign="middle" width="13%">
				<input type="text" readonly name="E01CURIDN"
					value="<%=ebl0110Msg.getE01CURIDN()%>" maxlength="25" size="28">
				</td>
				<td nowrap  width="16%">
					<div align="right" >Tipo de Identificación :</div>
				</td>
				<td nowrap align="left" valign="middle" width="13%">
				<input type="text" readonly name="E01CURTID"
					value="<%=ebl0110Msg.getE01CURTID()%>" maxlength="4" size="5">
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="13%">
					<div align="right" >Primer Nombre :</div>
				</td>
				<td nowrap align="left" valign="middle" width="13%"><input
					type="text" name="E01CURNA1" value="<%=ebl0110Msg.getE01CURNA1()%>" readonly
					maxlength="60" size="62">
				</td>
				<td width="13%"></td>
				<td width="13%"></td>
			</tr>
			<tr id="trclear">
				<td nowrap  width="17%">
					<div align="right" >Segundo Nombre :</div>
				</td>
				<td nowrap align="left" valign="middle" width="13%"><input
					type="text" name="E01CURNA2" value="<%=ebl0110Msg.getE01CURNA2()%>" readonly
					maxlength="45" size="47"></td>
				<td width="13%"></td>
			</tr>
			<tr id="trdark">
				<td nowrap  width="13%">
					<div align="right" >Primer Apellido :</div>
				</td>
				<td nowrap align="left" valign="middle" width="13%"><input
					type="text" name="E01CURNA3" value="<%=ebl0110Msg.getE01CURNA3()%>" readonly
					maxlength="45" size="47">
				</td>
				<td width="13%"></td>
				<td width="13%"></td>
			</tr>
			<tr id="trclear">
				<td nowrap  width="17%">
					<div align="right" >Segundo Apellido :</div>
				</td>
				<td nowrap align="left" valign="middle" width="13%"><input
					type="text" name="E01CURNA4" value="<%=ebl0110Msg.getE01CURNA4()%>" readonly
					maxlength="45" size="47"></td>
				<td width="13%"></td>
			</tr>
			<tr id="trdark">
				<td nowrap  width="13%">
					<div align="right" >Tipo de Exclusión :</div>
				</td>
				<td nowrap align="left" valign="middle" width="13%">
                    <input type="text" readonly name="E01CURWBL" id="E01CURWBL" size="13" 
				  	value="<% if (ebl0110Msg.getE01CURWBL().trim().equals("0")) { out.print("Sin Bloqueo"); }
							else if(ebl0110Msg.getE01CURWBL().trim().equals("1")) { out.print("PexP"); }
							else if(ebl0110Msg.getE01CURWBL().trim().equals("2")) { out.print("Lista de Control"); }
							else { out.print(""); } %>" >
				</td>
				<td nowrap  width="13%">
					<div align="right" >Fuente de Información :</div>
				</td>
				<td nowrap align="left" width="13%"><input type="text" name="E01CURFNT" value="<%=ebl0110Msg.getE01CURFNT()%>" readonly
					maxlength="4" size="5">
				</td>
			</tr>
			<tr id="trclear">
			   <td nowrap  width="13%">
					<div align="right" >Estado :</div>
				</td>
				<td nowrap align="left" valign="middle" width="13%">
                    <input type="text" readonly name="E01CURSTS" id="E01CURSTS" size="13" 
				  	value="<% if (ebl0110Msg.getE01CURSTS().trim().equals("0")) { out.print("No Vigente"); }
							else if(ebl0110Msg.getE01CURSTS().trim().equals("1")) { out.print("Vigente"); }
							else { out.print(""); } %>" >
				</td>
				<td nowrap width="16%">
					<div align="right" >Fecha de Ingreso :</div>
				</td>
				<td width="13%">
					<eibsinput:date name="ebl0110Msg" fn_year="E01CURFDY" fn_month="E01CURFDM" fn_day="E01CURFDD" readonly="true" required="false"/>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap  width="13%">
					<div align="right" >Usuario :</div>
				</td>
				<td nowrap align="left" valign="middle" width="13%"><input
					type="text" name="E01CURLMU" readonly value="<%=ebl0110Msg.getE01CURLMU()%>" maxlength="" size="20"></td>
				<td nowrap  width="13%">
					<div align="right" >Fecha última Actualización:</div>
				</td>
				<td nowrap align="left" width="13%">
					<eibsinput:date name="ebl0110Msg" fn_year="E01CURLMY" fn_month="E01CURLMM" fn_day="E01CURLMD" readonly="true" required="false"/>
				</td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="2"  border="0" width="100%">
			<tr id="trclear">
				<td nowrap width="23%">
				<div align="right" >Observaciones :</div>
			</td>
				<td nowrap align="left" valign="middle" width="77%">
					<textarea rows="5" cols="103"  name="E01CUROBS" readonly> <%=ebl0110Msg.getE01CUROBS()%></textarea>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>
</form>
</body>
</html>
