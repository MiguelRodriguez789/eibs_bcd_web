<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="datapro.eibs.beans.EDL090002Message"%>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Grafica de Operaciones en Libro por Cliente</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Graphics/ChartNew.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Graphics/Charts/EDL0900_stackedBar.js"> </SCRIPT>
</head>
<%
	ArrayList<String> yearList = (ArrayList<String>) session.getAttribute("yearSet");
 %>

<body>
<h3 align="center">&nbsp;<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cif_totals_graph.jsp,ECIF010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="6">
    <table  id="tbhelp">
    <tr>
      <td width="12%" nowrap></td>
      <td width="88%">
      	<select id="year" name="year" onchange="loadGraph(this.value);">
      <% for (String year : yearList) {%>
		 <option value="<%= year%>"><%= year%></option>	
      <% } %>	
		 <option value="TODO">Los ultimos 60</option>	
      	</select> 
      </td>
    </tr>
  	</table>
		<div  id="amortizationGraph"></div>
	</form>
  </body>

<script type="text/javascript">
   (function(EIBS, document){
		if(typeof EIBS.REDIRECTS !== 'object'){
					EIBS.REDIRECTS = {
						loadGraph : '${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0900?SCREEN=1000'
					};
		} else{
					EIBS.REDIRECTS.loadGraph = '${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0900?SCREEN=1000';
		}
   })(window.EIBS =  typeof window.EIBS !== 'undefined' ? window.EIBS : {} , document);
</script>  
  
</html>
