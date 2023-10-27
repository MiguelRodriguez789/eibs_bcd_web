<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Blank</TITLE>

<%@ page import="datapro.eibs.master.JSEIBSProp" %>
<% 		
	String type = (request.getParameter("TYPE") == null) ? "" : request.getParameter("TYPE").toLowerCase();
	String document = (request.getParameter("PAGE_NAME") == null) ? "" : request.getParameter("PAGE_NAME");
	String size = (request.getParameter("IMG_SIZE") == null) ? "" : request.getParameter("IMG_SIZE");
%>

<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css">

<SCRIPT type="text/javascript">
function loadImage(typ) {
    if ((typ == "pdf") || (typ == "doc")) {
		document.location.href="<%= JSEIBSProp.getScanURL() %>?SCREEN=4&DOC_NAME=<%=document %>";
    }
}

function viewer_exit() {
	if ( window.name !="main" ) top.close(); 
	else window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}

</SCRIPT>
</HEAD>

<BODY onload="loadImage('<%= type %>')">
<% 
		if (type.equals("") || type.equals("pdf") || type.equals("doc")
			|| document.equals("")) {
			//Nothing to do...
		} else {
%>
			<h3 align="center">Imagenes 
				<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="doc_viewer_blank.jsp, EDI0010"></h3>
			<hr size="4">
			<p align="center">
			
			<OBJECT
				  id="viewer"
				  classid="clsid:C38DC6A8-76B6-4175-A20E-6569E5B24595"
				  codebase="<%=request.getContextPath()%>/pages/s/ViewerActiveFormProj1.cab#version=1,0,0,0"
				  width="100%"
				  height="80%"
				  align="middle"
				  hspace=0
				  vspace=0
			>
			<PARAM name="url" value="<%= JSEIBSProp.getScanURL() %>">
			<PARAM name="languaje" value="s">
			<PARAM name="screen" value="4">
			<PARAM name="print" value="true">
			<PARAM name="imagetype" value="<%= type %>">
			<PARAM name="document" value="<%= document %>">
			<PARAM name="size" value="<%= size %>">
			</OBJECT>
			
			<script type="text/javascript">
				document.getElementById('viewer').View();
			</script>
<%
		}
%>		   	
</BODY>
</HTML>
