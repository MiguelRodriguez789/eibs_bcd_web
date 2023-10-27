<%@ page import = "datapro.eibs.master.Util" %>
<!DOCTYPE html>
<html>
<head>
<title>Grafica de Operaciones en Libro por Cliente</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cifTotal" class="datapro.eibs.beans.ECIF01003Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/prototypeDefintion/prototypeDef.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.1.4.min.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Graphics/ChartNew.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Graphics/Charts/ECIF010_pie.js"> </SCRIPT>

</head>



<SCRIPT>
<%if ( !cifTotal.getE03TOTASS().equals("0.00") ){ %>
var mydata1 = { 
     labels : [], 
     datasets : [ 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03OVDRFT().trim())%>], 
      fillColor : randomColor(), 
      title : "Sobregiros" 
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03LNSMOR().trim())%>], 
      fillColor :randomColor(), 
      title : "Hipotecarios"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03LNSLSG().trim())%>], 
      fillColor : randomColor(), 
      title : "Arrendamientos"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03LNSCON().trim())%>], 
      fillColor : randomColor(), 
      title : "Consumo"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03LNSGRL().trim())%>], 
      fillColor : randomColor(), 
      title : "Préstamos"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03DESDOC().trim())%>], 
      fillColor : randomColor(), 
      title : "Descontadas"
           },
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03INVERA().trim())%>], 
      fillColor : randomColor(), 
      title : "Inversiones"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03ACEPTA().trim())%>], 
      fillColor : randomColor(), 
      title : "Aceptaciones"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03LCCONF().trim())%>], 
      fillColor : randomColor(), 
      title : "C. de C."
           },
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03SPTPUR().trim())%>], 
      fillColor : randomColor(), 
      title : "Spot"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03FRWPUR().trim())%>], 
      fillColor : randomColor(), 
      title : "Forward"
           }                                  
	] 
};
<% } %>

<% 	if ( !cifTotal.getE03TOTLIA().equals("0.00") ) { %>
var mydata2 = { 
     labels : [], 
     datasets : [ 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03CTACTE().trim())%>], 
      fillColor : randomColor(), 
      title : "Cta sin Int" 
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03CTAAHO().trim())%>], 
      fillColor :randomColor(), 
      title : "Ahorro"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03CDTDPO().trim())%>], 
      fillColor : randomColor(), 
      title : "Certificados"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03INVERP().trim())%>], 
      fillColor : randomColor(), 
      title : "Inversiones"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03PARTIC().trim())%>], 
      fillColor : randomColor(), 
      title : "Participaciones"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03ACEPTP().trim())%>], 
      fillColor : randomColor(), 
      title : "Aceptaciones"
           },
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03LCPROC().trim())%>], 
      fillColor : randomColor(), 
      title : "C. de C."
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03SPTSAL().trim())%>], 
      fillColor : randomColor(), 
      title : "Spot"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03FRWSAL().trim())%>], 
      fillColor : randomColor(), 
      title : "Forward"
           },
           { 
      data : [<%= Util.parseCCYtoDouble(cifTotal.getP03CTAMMK().trim())%>], 
      fillColor : randomColor(), 
      title : "Cta con Int"
           }
	] 
};              	
<% } %>

//ColorArr Defined in js file
//var clone = colorArr.clone();
var clone = jQuery.extend({}, colorArr)

if(typeof mydata1 !== 'undefined'){
	//Sort Datasets by Highest Value
	mydata1.datasets.sort(function(a,b){
		var aData = a.data;
		var bData = b.data;
		if (aData < bData) {
		   return -1;
		}
		if (aData > bData) {
		   return 1;
		}
		return 0;	
	});


	$.each( mydata1.datasets, function( index, value ){
	    this.fillColor = clone[index];
	});
	
	mydata1.datasets = mydata1.datasets.filter(function (item) {
						  return item.data != 0;
						});
}


if(typeof mydata2 !== 'undefined'){
	//Sort Datasets by Highest Value
	mydata2.datasets.sort(function(a,b){
		var aData = a.data;
		var bData = b.data;
		if (aData < bData) {
		   return -1;
		}
		if (aData > bData) {
		   return 1;
		}
		return 0;	
	});

	$.each( mydata2.datasets, function( index, value ){
	    this.fillColor = clone[index];
	});

					
	mydata2.datasets = mydata2.datasets.filter(function (item) {
						  return item.data != 0;
						});		
}

			
					
</SCRIPT>


<body>
<h3 align="center">&nbsp;<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cif_totals_graph.jsp,ECIF010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="6">
      		<canvas id="canvas_pie_activo" ></canvas>
      		<canvas id="canvas_pie_passivo" ></canvas>
	</form>
  </body>
</html>
