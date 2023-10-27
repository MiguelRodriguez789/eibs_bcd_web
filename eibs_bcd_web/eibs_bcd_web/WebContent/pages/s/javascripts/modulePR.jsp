var popup = "<%=request.getParameter("popup")%>";

function getLogs() {
	var refnum = '<%=request.getParameter("reference")%>';
	self.window.location.href = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060?SCREEN=7&REFNUM="+refnum;
}
	  
