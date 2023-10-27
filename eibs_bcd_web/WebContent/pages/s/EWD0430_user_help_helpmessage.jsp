<html>
<head>
<title>Búsqueda de Usuario</title>
<!-- frames -->
</head>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<frameset  rows="105,*" cols="*" BORDER=1> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/s/EWD0420_user_desc_details_help_search.jsp" marginwidth=0 marginheight=0 scrolling="auto" frameborder="1">
  <frame name="results" src="<%=request.getContextPath()%>/pages/s/EWD0433_user_desc_details_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>
<noframes></noframes>
</html>
	