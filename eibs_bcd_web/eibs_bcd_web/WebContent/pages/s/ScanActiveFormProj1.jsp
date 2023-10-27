<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<TITLE>Scan Active X</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "parameters" class= "datapro.eibs.beans.JBImageData"  scope="session" />

</HEAD>
<BODY bgcolor="#FFFFFF">

<h3 align="center">Scan Tool Page 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ScanActiveFormProj1.jsp"></h3>
<hr size="4">

<p align="center">

<OBJECT
	  classid="clsid:DB392C03-81E8-4CEF-9E0B-9B366C869B36"
	  codebase="<%=request.getContextPath()%>/pages/s/ScanActiveFormProj1.cab#version=1,0,0,0"
	  width="80%"
	  height="80%"
	  align="middle"
	  hspace=0
	  vspace=0
>
<PARAM name="url" value="<%= parameters.getUrl() %>">
<PARAM name="fileName" value="<%= parameters.getDocument() %>">
<PARAM name="screen" value="<%= parameters.getScreen() %>">
<PARAM name="sequence" value="<%= parameters.getSequence() %>">
</OBJECT>

  <br><br><br>
  <div align="center"> 
	   <input id="EIBSBTN" type="button" name="Close" value="Cerrar" onclick="finish()">
  </div>
  
<SCRIPT type="text/javascript">
 	function finish() {
 		<% if (userPO.getRedirect().equals("popup")) { %>
 				close();
 		<% } else { %>		
 				self.window.location.href = "<%=request.getContextPath()%><%= userPO.getRedirect() %>";
 		<% } %>		
 	}
</SCRIPT>

</BODY>
</HTML>
