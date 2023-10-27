<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Consulta Calificaci&oacute;n de Provisi&oacute;n</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="msg" class="datapro.eibs.beans.EDL052701Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"   scope="session"/>

<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>
<%
		if (!error.getERRNUM().equals("0")) {
		out.println("<SCRIPT Language=\"Javascript\">");
		error.setERRNUM("0");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>
<FORM METHOD="post"
	ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0527">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2"> <INPUT TYPE=HIDDEN
	NAME="SEARCHC" VALUE="">

<h3 align="center">Consulta de Calificaci&oacute;n de Provisi&oacute;n<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="cust_search.jsp, EDL0527"></h3>
<hr size="4">

 <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0"> 
	<tr>
		<td width="49%" nowrap>
		<div align="right">Cliente :</div>
		</td>
		<td width="51%" nowrap><input type="text" name="E01CPVCUN"
			size=10 maxlength="9"> <a
			href="javascript:GetCustomer('E01CPVCUN')"><img
			src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
			align="bottom" border="0"></a></td>
	</tr>
	<tr >
            <td nowrap >
              <div align="right">Año :</div>
            </td>
            <td nowrap>
		 		<INPUT type="text" name="E01AYOSOL" size="5" maxlength="4" value="<%= "0".equals(msg.getE01AYOSOL().trim())?currUser.getE01RDY():msg.getE01AYOSOL() %>"> Mes :
				<INPUT type="text" name="E01MESSOL" size="3" maxlength="2" value="<%= "0".equals(msg.getE01MESSOL().trim())?currUser.getE01RDM():msg.getE01MESSOL() %>">
		    </td>
           
            <td nowrap>
           		
            </td>
          </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	<tr bgcolor="#FFFFFF">
		<td width="33%">
		<div align="center"><input id="EIBSBTN" type=submit
			name="Submit" value="Enviar"></div>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td>
		<div align="center"></div>
		</td>
	</tr>
</table>
</form>
</body>
</html>
