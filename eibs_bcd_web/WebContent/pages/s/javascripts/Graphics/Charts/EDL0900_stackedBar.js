var ChartOptions= {
	responsive : true,
    canvasBackgroundColor:'rgba(255,255,255,1.00)',
    decimalSeparator:".",
    thousandSeparator:",",
    spaceLeft:12,
    spaceRight:12,
    spaceTop:12,
    spaceBottom:12,
    canvasBorders:false,
    canvasBordersWidth:1,
    canvasBordersColor:"rgba(0,0,0,1)",
    yAxisMinimumInterval:1,
    scaleShowLabels:true,
    scaleShowLine:false,
    scaleLineStyle:"solid",
    scaleLineWidth:1,
    scaleLineColor:"rgba(0,0,0,0.6)",
    scaleOverlay:false,
    scaleOverride:false,
    scaleSteps:10,
    scaleStepWidth:10,
    scaleStartValue:0,
    inGraphDataShow:true,
    inGraphDataTmpl:'<%=v6 + " %"%>',
    inGraphDataFontFamily:"'Open Sans'",
    inGraphDataFontStyle:"normal bold",
    inGraphDataFontColor:"rgba(255,255,255,1.00)",
    inGraphDataFontSize:12,
    inGraphDataPaddingX:0,
    inGraphDataPaddingY:-5,
    inGraphDataAlign:"center",
    inGraphDataVAlign:"top",
    inGraphDataXPosition:2,
    inGraphDataYPosition:3,
    inGraphDataAnglePosition:2,
    inGraphDataRadiusPosition:2,
    inGraphDataRotate:0,
    inGraphDataPaddingAngle:0,
    inGraphDataPaddingRadius:0,
    inGraphDataBorders:false,
    inGraphDataBordersXSpace:1,
    inGraphDataBordersYSpace:1,
    inGraphDataBordersWidth:1,
    inGraphDataBordersStyle:"solid",
    inGraphDataBordersColor:"rgba(0,0,0,1)",
    legend:true,
    maxLegendCols:5,
    legendBlockSize:15,
    legendFillColor:'rgba(255,255,255,0.00)',
    legendColorIndicatorStrokeWidth:1,
    legendPosX:-2,
    legendPosY:4,
    legendXPadding:0,
    legendYPadding:0,
    legendBorders:false,
    legendBordersWidth:1,
    legendBordersStyle:"solid",
    legendBordersColors:"rgba(102,102,102,1)",
    legendBordersSpaceBefore:5,
    legendBordersSpaceLeft:5,
    legendBordersSpaceRight:5,
    legendBordersSpaceAfter:5,
    legendSpaceBeforeText:5,
    legendSpaceLeftText:5,
    legendSpaceRightText:5,
    legendSpaceAfterText:5,
    legendSpaceBetweenBoxAndText:5,
    legendSpaceBetweenTextHorizontal:5,
    legendSpaceBetweenTextVertical:5,
    legendFontFamily:"'Open Sans'",
    legendFontStyle:"normal normal",
    legendFontColor: "rgba(102,102,102,1)",
    legendFontSize:15,
    showYAxisMin:false,
    rotateLabels:"smart",
    xAxisBottom:true,
    yAxisLeft:true,
    yAxisRight:false,
    graphTitleSpaceBefore:5,
    graphTitleSpaceAfter:5,
    graphTitleBorders:false,
    graphTitleBordersXSpace:1,
    graphTitleBordersYSpace:1,
    graphTitleBordersWidth:1,
    graphTitleBordersStyle:"solid",
    graphTitleBordersColor:"rgba(0,0,0,1)",
    graphTitle: "Cronograma de Plan de Pagos",
    graphTitleFontFamily:"'Open Sans'",
    graphTitleFontStyle:"normal normal",
    graphTitleFontColor: getStyleCSS("h4","color"),
    graphTitleFontSize:26,
    graphSubTitleSpaceBefore:5,
    graphSubTitleSpaceAfter:5,
    graphSubTitleBorders:false,
    graphSubTitleBordersXSpace:1,
    graphSubTitleBordersYSpace:1,
    graphSubTitleBordersWidth:1,
    graphSubTitleBordersStyle:"solid",
    graphSubTitleBordersColor:"rgba(0,0,0,1)",
    graphSubTitle: "",
    graphSubTitleFontFamily:"'Open Sans'",
    graphSubTitleFontStyle:"normal normal",
    graphSubTitleFontColor:"rgba(102,102,102,1)",
    graphSubTitleFontSize:16,
    scaleFontFamily:"'Open Sans'",
    scaleFontStyle:"normal normal",
    scaleFontColor:"rgba(0,0,0,1)",
    scaleFontSize:12,
    pointLabelFontFamily:"'Open Sans'",
    pointLabelFontStyle:"normal normal",
    pointLabelFontColor:"rgba(102,102,102,1)",
    pointLabelFontSize:12,
    angleShowLineOut:true,
    angleLineStyle:"solid",
    angleLineWidth:1,
    angleLineColor:"rgba(0,0,0,0.1)",
    percentageInnerCutout:50,
    scaleShowGridLines:true,
    scaleGridLineStyle:"solid",
    scaleGridLineWidth:1,
    scaleGridLineColor:"rgba(0,0,0,0.1)",
    scaleXGridLinesStep:1,
    segmentShowStroke:true,
    segmentStrokeStyle:"solid",
    segmentStrokeWidth:2,
    segmentStrokeColor:"rgba(255,255,255,1.00)",
    datasetStroke:true,
    datasetFill: false,
    datasetStrokeStyle:"solid",
    datasetStrokeWidth:5,
    bezierCurve:true,
    bezierCurveTension:0.4,
    pointDotStrokeStyle:"solid",
    pointDotStrokeWidth: 1,
    pointDotRadius: 3,
    pointDot: true,
    scaleTickSizeBottom:5,
    scaleTickSizeTop:5,
    scaleTickSizeLeft:5,
    scaleTickSizeRight:5,
    graphMin:0,
    barShowStroke: false,
    barBorderRadius:0,
    barStrokeStyle:"solid",
    barStrokeWidth:1,
    barValueSpacing:15,
    barDatasetSpacing:0,
    scaleShowLabelBackdrop:true,
    scaleBackdropColor:'rgba(255,255,255,0.75)',
    scaleBackdropPaddingX:2,
    scaleBackdropPaddingY:2,
    animationEasing:'linear',
    animateRotate:true,
    animateScale:false,
    animationByDataset:false,
    animationLeftToRight:false,
    animationSteps:80,
    animation: true,
    annotateDisplay : true,
    annotateLabel : "<%=(v1 == ''? '' : v1+' : $')+ v3 + '\\n Total : '+ v5%>",
    fmtV5 : "money",
    graphMaximized : true
}

function loadGraph(yr){
	//getNSValue : security Filter requires all urls to be masked/encrypted
	//			  thus, urls must be parsed and live in jsps
	//      URLS placed in a EIBS.REDIRECT namespace
	//		Function is used to Retrieve Value
	//      getNSVALUE(namespace, desiredAttribute)
	
	addWaitCursor();
	$( "#amortizationGraph" ).load( getNSValue("REDIRECTS", "loadGraph") ,'YEAR=' + yr ,function(){
		removeWaitCursor();
		ChartData.labels.remove("");
		ChartData.datasets[0].data.remove("");
		ChartData.datasets[1].data.remove("");
		if(yr == 'TODO'){
			if(ChartData.datasets[0].data.length > 60){
				ChartOptions.scaleShowLabels = false;
			} else {
				ChartOptions.scaleShowLabels = true;
			}
			if(ChartData.datasets[0].data.length < 20){
				ChartOptions.inGraphDataTmpl ='<%=v6 + " %"%>';
			} else {
				ChartOptions.inGraphDataTmpl ='';
			}
		} else {
			ChartOptions.inGraphDataTmpl ='<%=v6 + " %"%>';
			ChartOptions.scaleShowLabels = true;
		}
		
		var ctx = getElement('canvas_stack_bar').getContext('2d');
		var chart = new Chart(ctx).StackedBar(ChartData, ChartOptions);
	});
}

$().ready(function() {
	$.ajaxSettings.cache = false;
	$.ajaxSettings.dataType= "html";

	//Loads HTML-CANVAS-AJAX
	loadGraph( isValidObject(getElement("year")) ? getElement("year").value : "TODO");
});

