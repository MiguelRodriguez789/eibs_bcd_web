<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet"
>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session"
/>
<jsp:useBean id="msgDendoso" class="datapro.eibs.beans.EDD081201Message"
	scope="session"
/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session"
/>
<title>EDD0812_double_endorsement_detail</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">

 function subm(s)
 {
    document.forms[0].E01MDESTS.value = s;
    document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDD0812";
    document.forms[0].submit();
 }

</script>
</head>
<body>
<%
	boolean creating = false;

	String title = "";
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		title = "Mantenimiento";
		if (msgDendoso.getE01MDESTS().equals("0")) {
			creating = true;
		}
	}
	if (userPO.getPurpose().equals("CONSULT")) {
		title = "Consulta";
	}
%>
<H3 align="center"><%=title%> Doble Endoso <img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="double_endorsement_detail.jsp,EDD0812"
></H3>
<hr size="4">
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
%>
<SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
<%
	}
%>
<FORM Method="post"
	Action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDD0812"
><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4"> <INPUT
	TYPE=HIDDEN NAME="E01MDESTS" VALUE="<%=msgDendoso.getE01MDESTS()%>"
> <%
 	if (userPO.getPurpose().equals("MAINTENANCE")) {
 		if (creating) {
 %>
<div>
<h3>Creando</h3>
</div>
<%
	} else {
%>
<div>
<h3>Modificando</h3>
</div>
<%
	}
	}
%>
<table class="tableinfo" width="100%">
	<tr>
	   <td width="100%" nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
			<tr id="trdark">
				<td nowrap >
				<div align="right"><b>No de Cliente : </b></div>
				</td>
				<td nowrap >
				<div align="left"><input type="text" name="E01MDECUN"
					size="12" readonly maxlength="10"
					value="<%=msgDendoso.getE01MDECUN()%>" readonly
				></div>
				</td>
				<td nowrap >
				<div align="right"><b>Nombre :</b></div>
				</td>
				<td nowrap colspan="3">
				<div align="left"><input type="text" name="E01MDENA1"
					size="45" maxlength="45" value="<%=msgDendoso.getE01MDENA1()%>"
					readonly
				></div>
				</td>
			</tr>
			<tr id="trclear">
			 
						<td nowrap >
						<div align="right"><b>Banco :</b></div>
						</td>
						<td nowrap >
						<div align="left"><input type="text" name="E01MDEBNK"
							size="4" maxlength="2" value="<%=msgDendoso.getE01MDEBNK()%>"
							readonly
						></div>
						</td>
						<td nowrap>
						<div align="right"><b>Sucursal :</b></div>
						</td>
						<td nowrap>
						<div align="left"><input type="text" name="E01MDEBRN"
							size="7" readonly maxlength="5"
							value="<%=msgDendoso.getE01MDEBRN()%>" readonly
						></div>
						</td>
						<td nowrap >
						<div align="right"><b>Cuenta : </b></div>
						</td>
						<td nowrap>
						<div align="left"><input type="text" name="E01MDEACC"
							size="15" readonly maxlength="13"
							value="<%=msgDendoso.getE01MDEACC()%>" readonly
						></div>
						</td>
			</tr>
		   	<tr id="trdark">
			 	<td nowrap colspan="6">
						<div align="center"><b>Ultimas Actualizaciones</b></div>
						</td>
			</tr>
			<tr id="trclear">
			 	<td nowrap  >
						<div align="right"><b>Usuario :</b></div>
						</td>
						<td nowrap >
						<div align="left"><input type="text" name="E01MDELMU"
							size="12" readonly maxlength="10"
							value="<%=msgDendoso.getE01MDELMU()%>" readonly
						></div>
						</td>
						<td nowrap >
						<div align="right"><b>Fecha :</b></div>
						</td>
						<td nowrap colspan="3">
						<div align="left"><input type="text" readonly size="3"
							maxlength="2" name="E01MDELMD"
							value="<%=msgDendoso.getE01MDELMD().trim()%>"
						> <input type="text" readonly name="E01MDELMM" size="3"
							maxlength="2" value="<%=msgDendoso.getE01MDELMM().trim()%>"
						> <input type="text" readonly name="E01MDELMY" size="5"
							maxlength="4" value="<%=msgDendoso.getE01MDELMY().trim()%>"
						></div>
						</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>
<table width="100%">
	<tr>
		<%
			if (creating) {
		%>
		<td width="50%">
		<div align="center"><input id="EIBSBTN" type="button"
			value="Aceptar" onClick="subm('1')"
		></div>
		</td>
		<%
			} else {
				if (!creating && userPO.getPurpose().equals("MAINTENANCE")) {
		%>
		<td width="50%">
		<div align="center"><input id="EIBSBTN" type="button"
			value="Eliminar" onClick="subm('0')"
		></div>
		</td>
		<%
			}
			}
		%>
		<td width="50%">
		<div align="center"><input id="EIBSBTN" type="button"
			value="Salir"
			onclick="window.location.href='<%=request.getContextPath()%>/pages/background.jsp'"
		></div>
		</td>
	</tr>
</table>
</FORM>
</body>
</html>