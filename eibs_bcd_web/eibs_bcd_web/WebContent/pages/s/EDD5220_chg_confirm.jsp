<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Confirmacion</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 
<jsp:useBean id="chgBasic" class="datapro.eibs.beans.EDD522001Message"  scope="session" />
 
</head>
 <SCRIPT type="text/javascript">
	opener.window.location.href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD5220?SCREEN=200&E01CFMACC=<%= chgBasic.getE01CFMACC()%>";
    close();
 </SCRIPT>
<body>
</body>
</html>
