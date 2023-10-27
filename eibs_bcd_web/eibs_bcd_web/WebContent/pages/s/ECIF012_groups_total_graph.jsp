<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "datapro.eibs.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Grupos Económicos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ECIF01201Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/prototypeDefintion/prototypeDef.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.1.4.min.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Graphics/ChartNew.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Graphics/Charts/ECIF010_pie.js"> </SCRIPT>

</head>



<SCRIPT>
<% 
	int row;
	try {
		row = Integer.parseInt(request.getParameter("ROW"));
	} 
	catch (Exception e) {
		row = 0;
	}

	ECIF01201Help.setCurrentRow(row);
	ECIF01201Message grpTotal = (ECIF01201Message) ECIF01201Help.getRecord();
           


if ( !grpTotal.getE01TOTASS().equals("0.00") ){ %>
var mydata1 = { 
     labels : [], 
     datasets : [ 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01OVDRFT().trim())%>], 
      fillColor : randomColor(), 
      title : "Sobregiros" 
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01LNSMOR().trim())%>], 
      fillColor :randomColor(), 
      title : "Hipotecarios"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01LNSLSG().trim())%>], 
      fillColor : randomColor(), 
      title : "Arrendamientos"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01LNSCON().trim())%>], 
      fillColor : randomColor(), 
      title : "Consumo"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01LNSGRL().trim())%>], 
      fillColor : randomColor(), 
      title : "Préstamos"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01DESDOC().trim())%>], 
      fillColor : randomColor(), 
      title : "Descontadas"
           },
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01INVERA().trim())%>], 
      fillColor : randomColor(), 
      title : "Inversiones"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01ACEPTA().trim())%>], 
      fillColor : randomColor(), 
      title : "Aceptaciones"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01LCCONF().trim())%>], 
      fillColor : randomColor(), 
      title : "C. de C."
           },
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01SPTPUR().trim())%>], 
      fillColor : randomColor(), 
      title : "Spot"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01FRWPUR().trim())%>], 
      fillColor : randomColor(), 
      title : "Forward"
           }                                  
	] 
};
<% } %>

<% 	if ( !grpTotal.getE01TOTLIA().equals("0.00") ) { %>
var mydata2 = { 
     labels : [], 
     datasets : [ 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01CTACTE().trim())%>], 
      fillColor : randomColor(), 
      title : "Cta sin Int" 
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01CTAAHO().trim())%>], 
      fillColor :randomColor(), 
      title : "Ahorro"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01CDTDPO().trim())%>], 
      fillColor : randomColor(), 
      title : "Certificados"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01INVERP().trim())%>], 
      fillColor : randomColor(), 
      title : "Inversiones"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01PARTIC().trim())%>], 
      fillColor : randomColor(), 
      title : "Participaciones"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01ACEPTP().trim())%>], 
      fillColor : randomColor(), 
      title : "Aceptaciones"
           },
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01LCPROC().trim())%>], 
      fillColor : randomColor(), 
      title : "C. de C."
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01SPTSAL().trim())%>], 
      fillColor : randomColor(), 
      title : "Spot"
           }, 
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01FRWSAL().trim())%>], 
      fillColor : randomColor(), 
      title : "Forward"
           },
           { 
      data : [<%= Util.parseCCYtoDouble(grpTotal.getP01CTAMMK().trim())%>], 
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
<h3 align="center">&nbsp;<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="groups_totals_graph.jsp,ECIF012"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF012" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="6">
      		<canvas id="canvas_pie_activo" ></canvas>
      		<canvas id="canvas_pie_passivo" ></canvas>
	</form>
  </body>
</html>