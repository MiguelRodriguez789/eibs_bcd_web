<html>
<head>
<title>Busqueda de Clientes</title>

<!-- frames -->
</head>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<frameset rows="140,*" border=0> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/s/ECO0010_client_employer_help_search.jsp" marginwidth=5 marginheight=10 scrolling="no" frameborder="0" >
  <frame name="results" src="<%=request.getContextPath()%>/pages/s/ECO0010_client_employer_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>

<noframes></noframes>


</html>



