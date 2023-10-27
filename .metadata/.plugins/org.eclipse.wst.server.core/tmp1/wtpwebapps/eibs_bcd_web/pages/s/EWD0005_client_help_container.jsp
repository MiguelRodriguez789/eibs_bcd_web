<html>
<head>
<title>Busqueda de Cuentas</title>

<!-- frames -->
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
</head>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
	
	//Due to Slow Rendering
	//Add Wait Div with a Progressing image
	$('<div class="wait-div"></div>').prependTo('body');

	$(window).load(function() {
		//As Document Renders, WAIT DIV becomes Hidden
		$(".wait-div").fadeOut("slow");
	});
</SCRIPT>

<frameset rows="140,*" border=0> 
  <frame name="query" src="<%=request.getContextPath()%>/pages/s/EWD0005_client_help_search.jsp" marginwidth=5 marginheight=10 scrolling="no" frameborder="0" bordercolor="0">
  <frame name="results" src="<%=request.getContextPath()%>/pages/s/EWD0005_client_help_blank.jsp" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" bordercolor = "0" noresize>
</frameset>

<noframes></noframes>


</html>



