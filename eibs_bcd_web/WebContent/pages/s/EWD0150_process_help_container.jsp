<html>
<head>
<title>Busqueda de Productos</title>

<!-- frames -->
</head>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>
<frameset  rows="60,*" cols="*"> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/s/EWD0150_process_help_search.jsp" marginwidth=0 marginheight=0 scrolling="no" frameborder="0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/s/EWD0150_product_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>
<noframes></noframes>








</html>



