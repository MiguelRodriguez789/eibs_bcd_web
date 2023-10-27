addEventHandler(window, 'load', sortables_init);

var SORT_COLUMN_INDEX;

function sortables_init() {
    // Find all tables with class sortable and make them sortable
    if (!document.getElementsByTagName) return;
    tbls = document.getElementsByTagName("table");
    for (var ti=0; ti<tbls.length; ti++) {
        thisTbl = tbls[ti];
        if (thisTbl.classList.contains("sortable")) {
            ts_makeSortable(thisTbl);
        }
    }
}

function ts_makeSortable(table) {
	//Nested Tables Are Present
	if(table.getElementsByTagName('table').length > 1){
		table = table.getElementsByTagName('table')[0];
	}
	var firstRow = false;
    if (table.rows && table.rows.length > 0) {
        firstRow = table.rows[0];
    }
    if (!firstRow) return;
    
    // We have a first row: assume it's the header, and make its contents clickable links
    for (var i=0;i<firstRow.cells.length;i++) {
        var cell = firstRow.cells[i];
        var txt = ts_getInnerText(cell);
        cell.innerHTML = '<a href="#" class="sortheader" onclick="ts_resortTable(this);return false;">'+txt+'<span class="sortarrow"></span></a>';
        cell.style.textAlign = 'center';
    }
}

function ts_getInnerText(el) {
	var str = "";

	if (typeof el == "string") return el;
	if (typeof el == "undefined") { return el; };
	if (el.nodeName == 'TD' || 'TH'){
		str = el.nodeName == 'TH' ? el.innerHTML : el.textContent ;
	}
	
	if(trim(str) === ''){
		var cs = el.childNodes;
		if (cs.nodeType == 3) {//TEXT_NODE
			str += cs.nodeValue;
		} else {
			var l = cs.length;
			for (var i = 0; i < l; i++) {
				if (cs[i].nodeType == 1) {//ELEMENT_NODE
					str += cs[i].value;
					break;
				}
			}
		}
	}

	return str;
}

function ts_resortTable(lnk,tbname) { //is tbname is empty then the table is the same
	var nestedSchema = false;
	var regExCurrency = CURRENCY.decSeparator() == '.' ? /\$?(((\d{1,3},)+\d{3})|\d+)\.\d{2}/ : /\$?(((\d{1,3},)+\d{3})|\d+)\,\d{2}/ ;
	var regExDate = /^\d\d[\/-]\d\d[\/-]\d\d$/;
	var regExDate2 = /^\d\d[\/-]\d\d[\/-]\d\d\d\d$/;
	var regExNumeric = /^[\d]+$/;
    // get the span
	var span = null;
    for (var ci=0;ci<lnk.childNodes.length;ci++) {
        if (lnk.childNodes[ci].tagName && lnk.childNodes[ci].tagName.toLowerCase() == 'span') span = lnk.childNodes[ci];
    }
    //var spantext = ts_getInnerText(span);
    var td = lnk.parentNode;
    var column = td.cellIndex;
    var table = "";
    if (tbname == "" || typeof tbname == 'undefined') table = getParent(td,'TABLE'); else table = document.getElementById(tbname);
    
    // Work out a type for the column
    
    //If tbname is not defined. Find Parent Table that has multiple nested Tables.
    if(table.getElementsByTagName('table').length == 0 && typeof tbname == 'undefined' && $(table).parents('table').length > 0 ){
    	table = getParent(getParent(table,'TR'),'TABLE');
    	if(table.getElementsByTagName('table').length > 1){//Second Table is DataTable
    		table = table.getElementsByTagName('table')[1];
    		nestedSchema = true;
    	} else {//If two Nested Tables DNE.Return to Default Table
    		 table = getParent(td,'TABLE'); 
    	}
    }
    if (table.rows.length <= 1) return;
    var initRow = (tbname == "" || (typeof tbname == 'undefined' && !nestedSchema)) ? 1 : 0;
    var itm = ts_getInnerText(table.rows[initRow].cells[column]).replace(/[\n\r]+/g, '').replace(/\s{2,10}/g, ' ').replace(/ /g,'');
    sortfn = ts_sort_caseinsensitive;
    if (regExDate.test(itm)) sortfn = ts_sort_date;
    if (regExDate2.test(itm)) sortfn = ts_sort_date;
    if (regExCurrency.test(itm)) sortfn = ts_sort_currency;
    if (regExNumeric.test(itm)) sortfn = ts_sort_numeric;
    SORT_COLUMN_INDEX = column;
    var firstRow = new Array();
    var newRows = new Array();
    if (tbname == "" || (typeof tbname == 'undefined' && !nestedSchema) ) {
    	for (var i=0;i<table.rows[0].length;i++) { firstRow[i] = table.rows[0][i]; }
    	for (var j=1;j<table.rows.length;j++) { newRows[j-1] = table.rows[j]; }
	} else {
		for (var j=0;j<table.rows.length;j++) { newRows[j] = table.rows[j]; }
	}
    newRows.sort(sortfn);

    if (span.getAttribute("sortdir") == 'down') {
        ARROW = '&nbsp;&nbsp;&uarr;';
        newRows.reverse();
        span.setAttribute('sortdir','up');
    } else {
        ARROW = '&nbsp;&nbsp;&darr;';
        span.setAttribute('sortdir','down');
    }
    
    // We appendChild rows that already exist to the tbody, so it moves them rather than creating new ones
    // don't do sortbottom rows
    for (i=0;i<newRows.length;i++) { if (!newRows[i].className || (newRows[i].className && (newRows[i].className.indexOf('sortbottom') == -1))) table.tBodies[0].appendChild(newRows[i]);}
    // do sortbottom rows only
    for (i=0;i<newRows.length;i++) { if (newRows[i].className && (newRows[i].className.indexOf('sortbottom') != -1)) table.tBodies[0].appendChild(newRows[i]);}
    
    // Delete any other arrows there may be showing
    var allspans = document.getElementsByTagName("span");
    for (var ci=0;ci<allspans.length;ci++) {
        if (allspans[ci].className == 'sortarrow') {
            if (getParent(allspans[ci],"table") == getParent(lnk,"table")) { // in the same table as us?
                allspans[ci].innerHTML = '';
            }
        }
    }
        
    span.innerHTML = ARROW;
}

function getParent(el, pTagName) {
	if (el == null) return null;
	else if (el.nodeType == 1 && el.tagName.toLowerCase() == pTagName.toLowerCase())	// Gecko bug, supposed to be uppercase
		return el;
	else
		return getParent(el.parentNode, pTagName);
}
function ts_sort_date(a,b) {
    // y2k notes: two digit years less than 50 are treated as 20XX, greater than 50 are treated as 19XX
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]).trim();
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]).trim();
    if (aa.length == 10) {
        dt1 = aa.substr(6,4)+aa.substr(3,2)+aa.substr(0,2);
    } else {
        yr = aa.substr(6,2);
        if (parseInt(yr) < 50) { yr = '20'+yr; } else { yr = '19'+yr; }
        dt1 = yr+aa.substr(3,2)+aa.substr(0,2);
    }
    if (bb.length == 10) {
        dt2 = bb.substr(6,4)+bb.substr(3,2)+bb.substr(0,2);
    } else {
        yr = bb.substr(6,2);
        if (parseInt(yr) < 50) { yr = '20'+yr; } else { yr = '19'+yr; }
        dt2 = yr+bb.substr(3,2)+bb.substr(0,2);
    }
    if (dt1==dt2) return SORT_COLUMN_INDEX != 0 ? ts_sort_caseinsensitive(a,b,0) : 0;
    if (dt1<dt2) return -1;
    return 1;
}

function ts_sort_currency(a,b) { 
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]).replace(/[,]/g,'');
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]).replace(/[,]/g,'');
    return parseFloat(aa) - parseFloat(bb) == 0 ? ts_sort_caseinsensitive(a,b,0) : parseFloat(aa) - parseFloat(bb);
}

function ts_sort_numeric(a,b) { 
    aa = parseFloat(ts_getInnerText(a.cells[SORT_COLUMN_INDEX]));
    if (isNaN(aa)) aa = 0;
    bb = parseFloat(ts_getInnerText(b.cells[SORT_COLUMN_INDEX])); 
    if (isNaN(bb)) bb = 0;
    return (aa-bb) == 0 ? ts_sort_caseinsensitive(a,b,0) : aa-bb;
}

function ts_sort_caseinsensitive(a,b,colInd) {
	var wrkIndex = typeof colInd == 'undefined' ? SORT_COLUMN_INDEX : colInd; 
	
    aa = ts_getInnerText(a.cells[wrkIndex]).toLowerCase().trim();
    bb = ts_getInnerText(b.cells[wrkIndex]).toLowerCase().trim();
    if (aa==bb) return wrkIndex != 0 ? ts_sort_caseinsensitive(a,b,0) : 0;
    if (aa<bb) return -1;
    return 1;
}

function ts_sort_default(a,b) {
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]).trim();
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]).trim();
    if (aa==bb) return 0;
    if (aa<bb) return -1;
    return 1;
}
