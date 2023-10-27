<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="datapro.eibs.beans.EDL090002Message"%>
<%@ page import = "java.util.*" %>
<jsp:useBean id="graphList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<canvas id="canvas_stack_bar" ></canvas>

<script> 
var ChartData= {
	labels : [
<%  graphList.initRow();
	while (graphList.getNextRow()) {
	EDL090002Message plan = (EDL090002Message) graphList.getRecord();
	if(!(plan.getE02DLPPNU().equals("77777") || 
		plan.getE02DLPPNU().equals("88888") || 
			plan.getE02DLPPNU().equals("88999") || 
				plan.getE02DLPPNU().equals("99999"))){						
	
%>
    "<%= Util.formatCustomDate(currUser.getE01DTF(), plan.getBigDecimalE02DLPPDM().intValue(), plan.getBigDecimalE02DLPPDD().intValue(), plan.getBigDecimalE02DLPPDY().intValue())%>",
<%}
}%>
    ""],
    datasets: [
    {
        fillColor: "rgba(114, 127, 128, 1)", strokeColor: "rgba(114, 127, 128,0.5)", pointColor: "rgba(114, 127, 128,1)", markerShape: "circle", pointStrokeColor: "rgba(255,255,255,1)", 
        	data: [
				<%  graphList.initRow();
					while (graphList.getNextRow()) {
					EDL090002Message plan = (EDL090002Message) graphList.getRecord();
					if(!(plan.getE02DLPPNU().equals("77777") || 
						plan.getE02DLPPNU().equals("88888") || 
							plan.getE02DLPPNU().equals("88999") || 
								plan.getE02DLPPNU().equals("99999"))){						
				%>
				    "<%= Util.parseCCYtoDouble(plan.getE02DLPOTH()) %>",
				<%    }
				 }%>
				""],        	
        title: "Cargos"
    },    
     {
        fillColor: "rgba(231, 76, 60, 1)", strokeColor: "rgba(231, 76, 60,0.5)", pointColor: "rgba(231, 76, 60, 1)", markerShape: "circle", pointStrokeColor: "rgba(255,255,255,1)", 
        	data: [
				<%  graphList.initRow();
					while (graphList.getNextRow()) {
					EDL090002Message plan = (EDL090002Message) graphList.getRecord();
					if(!(plan.getE02DLPPNU().equals("77777") || 
						plan.getE02DLPPNU().equals("88888") || 
							plan.getE02DLPPNU().equals("88999") || 
								plan.getE02DLPPNU().equals("99999"))){						
				%>
				    <%= Util.parseCCYtoDouble(plan.getE02DLPINT()) %>,
				<% }
				}%>
				""],        	
        title: "Interes"
    }
    ,
    {
        fillColor: "rgba(52,152,219, 1)", strokeColor: "rgba(52,152,219,0.5)", pointColor: "rgba(52,152,219,1", markerShape: "circle", pointStrokeColor: "rgba(255,255,255,1)", 
        	data: [
				<%  graphList.initRow();
					while (graphList.getNextRow()) {
					EDL090002Message plan = (EDL090002Message) graphList.getRecord();
					if(!(plan.getE02DLPPNU().equals("77777") || 
						plan.getE02DLPPNU().equals("88888") || 
							plan.getE02DLPPNU().equals("88999") || 
								plan.getE02DLPPNU().equals("99999"))){						
				%>
				    "<%= Util.parseCCYtoDouble(plan.getE02DLPPRN()) %>",
				<%    }
				 }%>
				""],        	
        title: "Principal"
     }
   ]
}

</script>  