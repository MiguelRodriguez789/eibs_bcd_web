<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<TITLE>Viewer Active X</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import="datapro.eibs.master.JSEIBSProp" %>

</HEAD>
<BODY bgcolor="#FFFFFF">

<h3 align="center">Viewer Tool Page 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ViewerActiveFormProj1.jsp"></h3>
<hr size="4">

<p align="center">

<OBJECT
	  id = "viewer" 	
	  classid="clsid:C38DC6A8-76B6-4175-A20E-6569E5B24595"
	  codebase="<%=request.getContextPath()%>/pages/s/ViewerActiveFormProj1.cab#version=1,0,0,0"
	  width="100%"
	  height="80%"
	  align="middle"
	  hspace=0
	  vspace=0
>
<PARAM name="url" value="<%= JSEIBSProp.getScanURL() %>">
<PARAM name="document" value="<%= request.getParameter("PAGE_NAME") %>">
<PARAM name="imagetype" value="<%= request.getParameter("TYPE") %>">
<PARAM name="screen" value="4">
<PARAM name="size" value="<%= request.getParameter("IMG_SIZE") %>">
</OBJECT>

<script type="text/javascript">
	document.getElementById('viewer').Show();
</script>

</BODY>
</HTML>
