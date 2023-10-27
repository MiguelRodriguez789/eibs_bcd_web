<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>



<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="ebl0110Msg" class="datapro.eibs.beans.EBL011001Message" 	scope="session" />
	
<html>
<head>
<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<title>Nuevo Cliente</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
</head>
<body bgcolor="#FFFFFF">
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
	String opt = request.getAttribute("OPT") == null ? "2" : request.getAttribute("OPT").toString().trim();
	String title = "";
	if (opt.equals("2"))	{
		title = "Nuevo Bloqueo de Cliente";
	} else if(opt.equals("3")) {
		title = "Mantenimiento Bloqueo de Cliente";
	} else if(opt.equals("4")) {
		title = "Consulta Bloqueo de Cliente";
	}
%>
<h3 align="center"><%= title %><img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_enter_new, EBL0110"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEBL0110">
<INPUT TYPE=HIDDEN NAME="SCREEN" value="<%= opt %>">
<table class="tableinfo">
	<tr>
		<td nowrap width="100%">
			<table cellspacing="0" cellpadding="2"  border="0" width="100%">
			<tr id="trdark">
				<td nowrap width="18%">
					<div align="right" >Pais :</div>
				</td>
				<td width="923">
	               <eibsinput:cnofc name="ebl0110Msg" flag="03" property="E01CURPID" fn_description="E01CURPID" required="true"/>
	               <eibsinput:text name="ebl0110Msg" property="D01CURPID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
			</tr>
			</table>
			<table cellspacing="0" cellpadding="2"  border="0" width="100%">
				<tr id="trclear">
					<td nowrap width="18%">
						<div align="right">Identificaciòn :</div>
					</td>
					<td width="33%">
		               <eibsinput:text name="ebl0110Msg" property="E01CURIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" />
					</td>
					<td nowrap width="12%">
						<div align="right">Tipo de Identificaciòn :</div>
					 </td>
					<td width="36%">
		               <eibsinput:cnofc name="ebl0110Msg" flag="34" property="E01CURTID"  required="true"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
<div align="center"> 
  	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
