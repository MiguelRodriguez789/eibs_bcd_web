/**
 * @author erodriguez
 *
 * 
 */

var chart;

var charTypes = ['column', 'stackedColumn', 'row', 'stackedRow', 'line', 'pie'];

var chartAreas = 0 || [[0.1, 0.1, 0.95, 0.9], [0.2, 0.1, 0.95, 0.9], [0.1, 0.1, 0.8, 0.9], 
                       [0.1, 0.25, 0.9, 0.9], [0.1, 0.1, 0.9, 0.8]]; 

var legendAreas =  0 || [[0.0, 0.0, 0.0, 0.0], [0.005, 0.1, 0.125, 0.5], [0.85, 0.1, 0.97, 0.9], 
                        [0.2, 0.1, 0.8, 0.2], [0.2, 0.9, 0.8, 0.995], [0.82, 0.1, 1.97, 0.9]]; 

var fills = 0 || [['lightblue', 'url(#fadeBlue)'], ['pink', 'url(#fadeRed)'], ['lightgreen', 'url(#fadeGreen)'], 
			      ['lightyellow', 'url(#fadeYellow)'], ['violet', 'url(#fadePurple)'], ['aquamarine', 'url(#fadeAqua)'],
			      ['gold', 'url(#fadeGold)'], ['ghostwhite', 'url(#fadeGray)'], ['lightsalmon', 'url(#fadeSalmon)'],
			      ['lightcyan', 'url(#fadeCyan)'], ['khaki', 'url(#fadeKhaki)'], ['orange', 'url(#fadeOrange)'],
			      ['whitesmoke', 'url(#fadeBlack)'], ['lightcoral', 'url(#fadeCoral)'], ['greenyellow', 'url(#fadeOlive)']];
					 	
function initGradients(svg) {
	
	$.svg.graphing.region = {percentageText: 'Porcentaje'};
	
	var defs = svg.defs();     
	svg.linearGradient(defs, 'fadeBlue', [[0, 'lightblue'], [1, 'blue']]);     
	svg.linearGradient(defs, 'fadeRed', [[0, 'pink'], [1, 'red']]);     
	svg.linearGradient(defs, 'fadeGreen', [[0, 'lightgreen'], [1, 'green']]);     
	svg.linearGradient(defs, 'fadeYellow', [[0, 'lightyellow'], [1, 'yellow']]);     
	svg.linearGradient(defs, 'fadePurple', [[0, 'violet'], [1, 'purple']]);     
	svg.linearGradient(defs, 'fadeAqua', [[0, 'aquamarine'], [1, 'dodgerblue']]);     
	svg.linearGradient(defs, 'fadeGold', [[0, 'gold'], [1, 'goldenrod']]);     
	svg.linearGradient(defs, 'fadeGray', [[0, 'ghostwhite'], [1, 'gray']]);     
	svg.linearGradient(defs, 'fadeSalmon', [[0, 'lightsalmon'], [1, 'darksalmon']]);     
	svg.linearGradient(defs, 'fadeCyan', [[0, 'lightcyan'], [1, 'cyan']]);     
	svg.linearGradient(defs, 'fadeKhaki', [[0, 'khaki'], [1, 'darkkhaki']]);     
	svg.linearGradient(defs, 'fadeOrange', [[0, 'orange'], [1, 'darkorange']]);     
	svg.linearGradient(defs, 'fadeBlack', [[0, 'whitesmoke'], [1, 'black']]);     
	svg.linearGradient(defs, 'fadeCoral', [[0, 'lightcoral'], [1, 'firebrick']]);     
	svg.linearGradient(defs, 'fadeOlive', [[0, 'greenyellow'], [1, 'darkolivegreen']]);     
}

function initLegend(svg) {
	svg.graph.legend.settings({fill: 'lightgoldenrodyellow', stroke: 'gray'});
}

function showGraphStatus(label, value) {  
	chart.attr('title', (label ? label + ' ' + value : '')); 
}

function bubbleSort(arr) {
	var len = arr.length;
	for (var i = len-1; i>=0; i--) {
		for (var j = 1; j<=i; j++) {
			if (arr[j-1] > arr[j]) {
				var temp = arr[j-1];
				arr[j-1] = arr[j];
				arr[j] = temp;
	        }
		}
	}
	return arr;
}

function ceiling(number, radix) {
	return Math.floor(number * (1 / radix)) * radix;
}

function getAxisScale(data, over) {
	data = bubbleSort(data);
	var radix = (over ? parseInt(over) : 10);
	var number = parseFloat(data[data.length - 1]) + radix;
	return ceiling(number, radix);
}

function printChart(obj) {
	obj.style.display = "none";
	window.print();
	obj.style.display = "block";
}

Number.prototype.format = function(n, x, s, c) {
    var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
        num = this.toFixed(Math.max(0, ~~n));

    return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ','));
};

