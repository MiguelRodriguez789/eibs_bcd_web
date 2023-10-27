<jsp:useBean id="idData" class="datapro.eibs.beans.IdentificationData" scope="request" />
<!DOCTYPE HTML>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" 	rel="stylesheet">
<title>Nuevo Cliente FATCA</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>  
</head>

<body>
<h3 align="center">Nuevo Cliente FATCA<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_both_enter_fatca, ESD0080"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="1000">
<INPUT TYPE=HIDDEN NAME="COUNTRY" id="COUNTRY" VALUE="<%=idData.getCountry()%>">
<INPUT TYPE=HIDDEN NAME="COUNTRYDSC" id="COUNTRYDSC" VALUE="<%=idData.getCountryDescription()%>">
<INPUT TYPE=HIDDEN NAME="IDN" id="IDN" VALUE="<%=idData.getIdentification()%>">


<p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
</form>
</body>
</html>