<html>
<head>
<title>Busqueda de Bancos</title>

<!-- frames -->
</head>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>
<frameset  rows="90,*" cols="*"> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/s/EWD0130T_bankid_help_search.jsp?<%=request.getParameter("args")%>" marginwidth=0 marginheight=0 scrolling="auto" frameborder="0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/s/EWD0130T_bankid_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>
<noframes></noframes>








</html>



