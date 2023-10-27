var opt1 = {
      inGraphDataShow : true,
	  inGraphDataFontColor :  getGraphStyleCSS("h4","color"),
	  inGraphDataFontSize : 16,
	  inGraphDataFontStyle : "bold",
	  inGraphDataTmpl: "<%=(v1 == ''? '' : v1+':')+ v2 + ' (' + v6 + ' %)'%>",
	  annotateLabel: "<%=(v1 == ''? '' : v1+':')+ v2 + ' (' + v6 + ' %)'%>",
      graphTitle : "Resumen de Operaciones por Cliente: \nActivos",
      graphTitleFontColor : getGraphStyleCSS("h3","color"),
      startAngle : 0,
      totalAmplitude : 360,
      responsive: true,
      highLightSet :{
    	  inGraphDataFontSize : 18,   
    	  inGraphDataFontColor : getGraphStyleCSS("h3","color"),
    	  expandOutRadius : 0.05, 
    	  expandInRadius : -0.05    	  
      },
	  highLight : true
}

var opt2 = {
	      inGraphDataShow : true,
		  inGraphDataFontColor :  getGraphStyleCSS("h4","color"),
		  inGraphDataFontSize : 16,
		  inGraphDataFontStyle : "bold",
		  inGraphDataTmpl: "<%=(v1 == ''? '' : v1+':')+ v2 + ' (' + v6 + ' %)'%>",
		  annotateLabel: "<%=(v1 == ''? '' : v1+':')+ v2 + ' (' + v6 + ' %)'%>",
	      graphTitle : "Pasivos",
	      graphTitleFontColor : getGraphStyleCSS("h3","color"),
	      startAngle : 0,
	      totalAmplitude : 360,
	      responsive: true,
	      highLightSet :{
	    	  inGraphDataFontSize : 18,   
	    	  inGraphDataFontColor : getGraphStyleCSS("h3","color"),
	    	  expandOutRadius : 0.05, 
	    	  expandInRadius : -0.05    	  
	      },
		  highLight : true
	}


var colorArr = ["#07090f",
                "#1c273e",
                "#2a3b5d",
                "#384f7c",
                "#47639c",
                "#5972a5",
                "#7e91b9",
                "#a3b1cd",
                "#c7d0e1",
                "#dadfeb",
                "#5972a5"];
 
// var colorClone= colorArr.clone();
var colorClone = jQuery.extend({}, colorArr)

var randomColor = function(){
	return colorClone[Math.floor(Math.random() * (11 - 1 + 1) + 1)];
	// return colorClone.random(true);
};

window.onload = function() {
	if(typeof mydata1 !== 'undefined')	{
		//mydata1.datasets.minMax("data");
	    var myLine1 = new Chart(document.getElementById("canvas_pie_activo").getContext("2d")).Pie( mydata1,opt1);
	}
	if(typeof mydata2 !== 'undefined')	{
		//mydata2.datasets.minMax("data");
	    var myLine2 = new Chart(document.getElementById("canvas_pie_passivo").getContext("2d")).Pie( mydata2,opt2);
	}
	
}