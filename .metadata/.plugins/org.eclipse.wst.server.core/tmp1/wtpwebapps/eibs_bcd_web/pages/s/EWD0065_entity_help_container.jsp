<html>
<head>
<title>Búsqueda de Entidad</title>

<!-- frames -->
</head>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<frameset  rows="140,*" cols="*" BORDER=0> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/s/EWD0065_entity_help_search.jsp" marginwidth=0 marginheight=0 scrolling="auto" frameborder="0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/s/EWD0001_client_desc_id_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>
<noframes></noframes>




