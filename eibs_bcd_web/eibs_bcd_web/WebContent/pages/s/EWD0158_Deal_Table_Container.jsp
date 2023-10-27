<html>
<head>
<title>Busqueda de Convenios</title>

</head>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);

	window.onbeforeunload = function (event) {
		try {
			if (top.opener.fieldName == "E01CCNCOD"){ //ONLY FOR PRESTAMO    
				top.opener.close();
			}
		} catch(e) {
		}
	};
</SCRIPT>

<frameset  rows="99,573*" cols="*"> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/s/EWD0158_deal_table_search.jsp" marginwidth=0 marginheight=0 scrolling="no" frameborder="0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/s/EWD0158_deal_table_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" noresize>
</frameset>
<noframes></noframes>

</html>