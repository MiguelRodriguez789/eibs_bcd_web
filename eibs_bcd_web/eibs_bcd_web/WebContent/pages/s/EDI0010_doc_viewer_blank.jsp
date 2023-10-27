<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>
Blank
</TITLE>
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY>
<%
  String pagename = null;
  try {
	pagename = request.getParameter("PAGE_NAME").trim();
%>
	<script>
		parent.blank_viewer.window.location.href="<%= pagename %>";
	</script>
<%		  
  } catch(Exception e) {
	  
  }
%>
</BODY>
</HTML>
