
<%@page import="com.datapro.generic.tool.UtilRequest"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0"); // Proxies.
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>

<META name="GENERATOR" content="IBM WebSphere Studio">
<title>B�squeda de Cuentas</title>

<!-- frames --> 
</head>
<frameset rows="255,*" cols="*" BORDER=0>
	<frame name="query"	src="<%=request.getContextPath()%>/pages/s/GENERIC_account_enter_search.jsp?<%=UtilRequest.buildQueryString(request.getParameterMap()).toString()%>" marginwidth=5 marginheight=10 scrolling="no" frameborder="0">
	<frame name="results" src="<%=request.getContextPath()%>/pages/s/EWD0005_client_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>
<noframes></noframes>

</html>



