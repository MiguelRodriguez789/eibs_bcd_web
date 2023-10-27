<!DOCTYPE html>
<html>
<head>
  <title>Grafica de Saldos promedios</title>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="aveBean" class="datapro.eibs.beans.JBAverage"  scope="session" />
<jsp:useBean id="netBean" class="datapro.eibs.beans.JBAverage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Graphics/Chart.min.js"> </SCRIPT>
</head>
<script type="text/javascript">

<% String name = (request.getParameter("graph") == null ?  
		"aveBean" : request.getParameter("graph")); 
   if(name.equals("aveBean")){ 
		netBean = aveBean;
   }%>
   
function currChart(){
// Bar chart
 new Chart(document.getElementById("currAvg"), {
    type: 'bar',
    data: {
      labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
      datasets: [
        {
          label: "Saldo promedio ",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850", "#842087", "#41b6b6", "#efef2a", "#efe8923", 
          	"#63ee7a","#9a9794", "#144eef"],
          data: [<%= netBean.getCurrYearMAve(0) %>,
          			<%= netBean.getCurrYearMAve(1) %>,
          			<%= netBean.getCurrYearMAve(2) %>,
          			<%= netBean.getCurrYearMAve(3) %>,
          			<%= netBean.getCurrYearMAve(4) %>,
          			<%= netBean.getCurrYearMAve(5) %>,
          			<%= netBean.getCurrYearMAve(6) %>,
          			<%= netBean.getCurrYearMAve(7) %>,
          			<%= netBean.getCurrYearMAve(8) %>,
          			<%= netBean.getCurrYearMAve(9) %>,
          			<%= netBean.getCurrYearMAve(10) %>,
          			<%= netBean.getCurrYearMAve(11) %>]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: 'Periodo Actual ' + <%=netBean.getCurrYear()%>
      },
      scales: {
    	yAxes: [{
      		ticks: {
        		beginAtZero: true,
        		min: 0
    	  		}    
    		}]
  		}
    }
     
});
					
}

function prevChart(){
// Bar chart
 new Chart(document.getElementById("prevAvg"), {
    type: 'bar',
    data: {
      labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
      datasets: [
        {
          label: "Saldo promedio ",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850", "#842087", "#41b6b6", "#efef2a", "#efe8923", 
          	"#63ee7a","#9a9794", "#144eef"],
          data: [<%= netBean.getPrevYearMAve(0) %>,
          			<%= netBean.getPrevYearMAve(1) %>,
          			<%= netBean.getPrevYearMAve(2) %>,
          			<%= netBean.getPrevYearMAve(3) %>,
          			<%= netBean.getPrevYearMAve(4) %>,
          			<%= netBean.getPrevYearMAve(5) %>,
          			<%= netBean.getPrevYearMAve(6) %>,
          			<%= netBean.getPrevYearMAve(7) %>,
          			<%= netBean.getPrevYearMAve(8) %>,
          			<%= netBean.getPrevYearMAve(9) %>,
          			<%= netBean.getPrevYearMAve(10) %>,
          			<%= netBean.getPrevYearMAve(11) %>]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: 'Periodo Anterior ' + <%=netBean.getPrevYear()%>
      },
     scales: {
    	yAxes: [{
      		ticks: {
        		beginAtZero: true,
        		min: 0
    	  		}    
    		}]
  		}
    }
});
					
}


</script>

<body>
   <h4>Saldos Promedios</h4> 
      <canvas id="currAvg" ></canvas>
      <canvas id="prevAvg" ></canvas>
      <script>currChart();</script>
      <script>prevChart();</script>
    
    <div align="center"> 
      <input id="EIBSBTN" type=button name="Submit" OnClick='top.close()' value="Cerrar">
    </div>
    
  </body>
</html>

