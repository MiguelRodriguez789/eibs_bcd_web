<html>

<head>
<title>Portfolio Search</title>

<!-- frames -->
</head>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<frameset  rows="99,573*" cols="*"> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/s/EWD0300_portfolio_help_search.jsp" marginwidth=0 marginheight=0 scrolling="no" frameborder="0" >
  <frame name="results" src="<%=request.getContextPath()%>/pages/s/EWD0300_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
  <noframes> </noframes>
</frameset>

</html>



