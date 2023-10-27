<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<title>Búsqueda de Tablas</title>
<!-- frames -->
</head>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<frameset  rows="*,150" cols="*" BORDER=0> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/reporter/s/LRGA210_schema_tables_list.jsp" marginwidth=0 marginheight=0 scrolling="auto" frameborder="0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/reporter/s/LRGA210_schema_tables_selected.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="1">
</frameset>
<noframes></noframes>

</html>



