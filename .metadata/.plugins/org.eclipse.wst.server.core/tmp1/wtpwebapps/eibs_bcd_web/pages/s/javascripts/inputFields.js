function hasClass(ele,cls) {
    return ele.className.match(new RegExp('(\\s|^)'+cls+'(\\s|$)'));
}
function addClass(ele,cls) {
    if (!hasClass(ele,cls)) ele.className += " "+cls;
}
function removeClass(ele,cls) {
    if (hasClass(ele,cls)) {
        var reg = new RegExp('(\\s|^)'+cls+'(\\s|$)');
        ele.className=ele.className.replace(reg,' ');
    }
}

function endsWith(str, suffix) {
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

var imgHelpHeight = "0";
var imgHelpWidth = "0";
var imgRequiredHeight = "0";
var imgRequiredWidth = "0";

function setReadOnly(divName, what){
	var felem = document.getElementById(divName).getElementsByTagName('*');
	var j=felem.length;
	for(var i=0; i<j; i++){
		if (felem[i].tagName == "INPUT"
			|| felem[i].tagName == "SELECT"
			|| felem[i].tagName == "OPTION"){
			if(isValidObject(felem[i].readOnly)){
				felem[i].readOnly=what;
			} else {
				if (felem[i].tagName == "SELECT"
					|| felem[i].tagName == "OPTION") {
					//felem[i].disabled=what;
				}
			}
			if(what){
				addClass(felem[i], "inputDisabled");
			} else {
				removeClass(felem[i], "inputDisabled");
			}
		} else if (felem[i].tagName == "img" || felem[i].tagName == "IMG"){
			if(imgHelpHeight == "0" && felem[i].src.indexOf("1b.gif") > 0){
				imgHelpHeight = felem[i].height;
				imgHelpWidth = felem[i].width;
			}
			if(imgRequiredHeight == "0" && felem[i].src.indexOf("Check.gif") > 0){
				imgRequiredHeight = felem[i].height;
				imgRequiredWidth = felem[i].width;
			}
			if(what){
				felem[i].height="0";
				felem[i].width="0";
			} else {
				if(felem[i].src.indexOf("1b.gif") > 0){
					felem[i].height=imgHelpHeight;
					felem[i].width=imgHelpWidth;
				} else if(felem[i].src.indexOf("Check.gif") > 0){
					felem[i].height=imgRequiredHeight;
					felem[i].width=imgRequiredWidth;
				}
			}
		}
	}
}

function doGetCaretPosition(ctrl) {
    var CaretPos = 0;
    // IE Support
    if (document.selection) {
        ctrl.focus();
        var Sel = document.selection.createRange();
        Sel.moveStart('character', -ctrl.value.length);
        CaretPos = Sel.text.length;
    }
    // Firefox support
    else if (ctrl.selectionStart || ctrl.selectionStart == '0')
        CaretPos = ctrl.selectionStart;
    return (CaretPos);
}

function setCaretPosition(ctrl, pos) {
    if (ctrl.setSelectionRange) {
        ctrl.focus();
        ctrl.setSelectionRange(pos, pos);
    } else if (ctrl.createTextRange) {
        var range = ctrl.createTextRange();
        range.collapse(true);
        range.moveEnd('character', pos);
        range.moveStart('character', pos);
        range.select();
    }
}

function isSelected(obj) {
    var len = obj.value.length;
    var s = len;
    var e = s;
    if (window.getSelection) { // all browsers, except IE before version 9
        s = obj.selectionStart;
        e = obj.selectionEnd;
        return e - s === len;
    } else {
        var range = document.selection.createRange().duplicate();
        range.moveStart("character", -len);
        e = range.text.length;
        range = document.selection.createRange().duplicate();
        range.moveEnd("character", len);
        s = (range.text == "" ? e : obj.value.lastIndexOf(range.text));
        return e - s === len;
    }
    return false;
}

function replaceSelection(obj, value) {
    var len = obj.value.length;
    var s = len;
    var e = s;
    if (window.getSelection) { // all browsers, except IE before version 9
        s = obj.selectionStart;
        e = obj.selectionEnd;
        obj.value = obj.value.substring(0, s) + value + obj.value.substring(e, len);
        // positioning the cursor
        obj.setSelectionRange(len, len);
    } else {
        var range = document.selection.createRange().duplicate();
        range.moveStart("character", -len);
        e = range.text.length;
        range = document.selection.createRange().duplicate();
        range.moveEnd("character", len);
        s = (range.text == "" ? e : obj.value.lastIndexOf(range.text));
        obj.value = obj.value.substring(0, s) + value + obj.value.substring(e, len);
        // positioning the cursor
        len = obj.value.length;
        range = document.selection.createRange();
        // range = obj.createTextRange();
        // range.collapse(true);
        range.moveStart("character", len);
        range.moveEnd("character", len);
        range.select();
    }
    // obj.focus();
    return s;
}

function clearSelection() {
    if (document.selection) {
        document.selection.empty();
    } else if (window.getSelection) {
        window.getSelection().removeAllRanges();
    }
}

function formatDecimal(value, dec) {
	return NumberFormat.format(value, dec);
}

function parsePhone(phoneElem){
	var num = phoneElem.value.replace(/\D/g, '');
	var iNum = parseFloat(num);
	num = (iNum || 0) == 0 ? '' : num;
	if (num !== '') {
		num = ""+iNum;
	}
	return num;
}

function defaultLabelClean() {
	inputs = document.getElementsByTagName("input");
	for ( var i = 0; i < inputs.length; i++) {
		if (inputs[i].value == inputs[i].getAttribute("innerLabel")) {
			inputs[i].value = '';
		}
	}
}
function hasDefaultLabel(elem){
	var label = elem.getAttribute("innerLabel");
	if (isValidObject(label) && label != ''){
		if(elem.value == label){
			return true;
		}
	}
	return false;
}
function defaultLabel(elem){
	var label = elem.getAttribute("innerLabel");
	if (isValidObject(label) && label != ''){
		if (elem.value == '') {
			elem.value = elem.getAttribute("innerLabel");
			addClass(elem, "defaultLabel_off");
		} else {
			removeClass(elem, "defaultLabel_off");
		}
	}
}
function defaultLabelAttachEvents(element, label) {
	var oClassName = element.getAttribute("class");
	element.setAttribute("innerLabel", label);
	addEvent(element, 'focus', function(e) {
		if (element.value == label) {
			element.value = '';
			addClass(element, oClassName);
		}
	});
	addEvent(element, 'blur', function(e) {
		if (element.value == '') {
			element.value = element.getAttribute("innerLabel");
			addClass(element, "defaultLabel_off");
		}
	});
	addEvent(element, 'keydown', function(e) {
		removeClass(element, "defaultLabel_off");
	});	
	addEvent(element, 'change', function(e) {
		if (element.value == '') {
			element.value = element.getAttribute("innerLabel");
			addClass(element, "defaultLabel_off");
		} else {
			removeClass(element, "defaultLabel_off");
		}
	});
	if (element.value == '' || element.value == '0') {
		addClass(element, "defaultLabel_off");
		element.value = element.getAttribute("innerLabel");
	};
}

function doSelectDecimal(thisElem, dec) {
	if (!dec) dec = 2;
	if (isSelected(thisElem)) {
		thisElem.value = formatDecimal(thisElem.value, dec);
		thisElem.select();
	} else {
		var len = thisElem.value.length;
		var pos = doGetCaretPosition(thisElem);
		thisElem.value = formatDecimal(thisElem.value, dec);
		var diff = thisElem.value.length - len;
		var x = 1 + 1 + dec;//starts in 1 plus decimal separator plus decimals
		for(var n=diff;n>0;n--){
			x = x + 3;
			if (pos > (len - x)) {
				setCaretPosition(thisElem, pos+diff-n);
			}
		}
	}
}

function doSelectChange(srcElement, name){
	if(name){
		var array;
		if (name instanceof Array) {
			array = name;
		} else {
			array = new Array(name);
		}
		for(var i=0;i<array.length;i++){
			var elem = GetElement(array[i]);
			if(elem.type == 'select-one'){
				doSelectStart(elem, array[i]);
			} else {
				if(doSelectFilter(srcElement, false)){
					elem.value = srcElement.options[srcElement.selectedIndex].text;
					if(isValidObject(elem.onchange)){
						elem.onchange();
					}
				} else {
					elem.value = '';
				}
			}
			srcElement = elem;
		}
	}
}
function hasSelectValue(srcElement){
	if(srcElement.selectedIndex > -1 
		&& srcElement.options[srcElement.selectedIndex].value != ''){
		var defaultOption = $(srcElement.id).children('option[value="defaultLabel_off"]');
		if(isValidObject(defaultOption) && isValidObject(defaultOption.val())){
			return false;
		}
		return true;
	}
	return false;
}
function hasSelectText(srcElement){
	if(srcElement.selectedIndex > -1 
		&& srcElement.options[srcElement.selectedIndex].text != ''){
		var defaultOption = $(srcElement.id).children('option[value="defaultLabel_off"]');
		if(isValidObject(defaultOption) && isValidObject(defaultOption.val())){
			return false;
		}
		return true;
	}
	return false;
}
function doSelectFilter(srcElement, force){
	if(force || (srcElement.selectedIndex > -1 && srcElement.options[srcElement.selectedIndex].value != '')){
		var defaultOption = $(srcElement.id).children('option[value="defaultLabel_off"]');
		if(isValidObject(defaultOption) && isValidObject(defaultOption.val())){
			defaultOption.remove();
		}
		//removeClass(srcElement, 'defaultLabel_off');
		$(srcElement.id).removeClass('defaultLabel_off');
		srcElement.removeAttribute("class");
		return true;
	} else {
		$(srcElement.id).addClass('defaultLabel_off');
		srcElement.setAttribute("class", "defaultLabel_off");
		return false;
	}
}
function doSelectStart(srcElement, name){
	var elem = document.getElementById(name);
	elem.value = '';
	clearSelect(srcElement);
	if(isValidObject(elem.onfocus)){
		elem.onfocus();
	}
}

function clearSelect(select){
	var eachGroup = select.firstChild;
	while (eachGroup) {
		lastGroup = eachGroup;
		eachGroup = lastGroup.nextSibling;
		select.removeChild(lastGroup);
	}
}

function appendOption(parent, node, selectedValue){
	var optValue = node.attr('value');
	var option = document.createElement("option");
	option.value = optValue;
	option.appendChild(document.createTextNode(node.text()));
															
	if(optValue == selectedValue){
		option.setAttribute('selected', 'selected');
	}
	parent.appendChild(option);
}

function parseSelectXML(xmlResponse){
	$(xmlResponse).find('select').each(function(){
		var select = getElement($(this).attr('id'));
		var selectedValue = '';
		if(select.selectedIndex > -1){
			selectedValue = select.options[select.selectedIndex].value;
		}
		clearSelect(select);
		var options = $(xmlResponse).find('optgroup');
		if(options.length > 0){
			options.each(function(){
				var group = document.createElement("optgroup");
	  			group.label = $(this).attr('label');
				$($(this)).find('option').each(function(){
					appendOption(group, $(this), selectedValue);
				});
				select.appendChild(group);
			});		
		} else {
			$(xmlResponse).find('option').each(function(){
				appendOption(select, $(this), selectedValue);
			});
		};
		select.style.display='none';
		select.style.display='inline';
	});
}

function CNOFCFilter(table, code, desc, ordered) {
	if(!isValidObject(table)){
		throw Error("El código de Tabla del CNOFC debe ser provisto al filtro de selección");
	}
	this.table = table;
	this.code = code;
	this.desc = desc;
	this.ordered = ordered;
}
CNOFCFilter.prototype = {
    getFilters: function(srcElement, filter1, filter2){
    	if(!isValidObject(filter1)){
			filter1 = '*';
		}
		if(!isValidObject(filter2)){
			filter2 = '';
		}
       	if((srcElement.length < 2) && !(filter1 == '' && filter2 == '')){
	    	if(!(filter1 == '' && filter2 == '')){
	    		if(filter1 == '*'){
	    			filter1 = '';
	    		}
	    		if(filter2 == '*'){
	    			filter2 = '';
	    		}
	    		if(!isValidObject(this.code) || this.code == ''){
	    			code = srcElement.name;
	    		}
	    		GetCNOFCSelect(this.code, this.table, this.ordered, filter1, filter2);
				doSelectChange(srcElement, this.desc);
				doSelectFilter(srcElement, true);
	    	}
    	} else {
    		return doSelectFilter(srcElement, true);
    	}
    },
    getFilter: function(srcElement, filter1){
    	return this.getFilters(srcElement, filter1);
    }
};
function CNOFCSelect(table, code, desc, ordered) {
	return new CNOFCFilter(table, code, desc, ordered);
}
function addCNOFCHandler(elem) {
	if(isValidObject(elem) && elem.type == 'select-one'){
		chainEvents(elem, 'mousedown', 'focus');
		var value = elem.options[elem.selectedIndex].value;
		if(elem.options[elem.selectedIndex].text == '' || value == elem.options[elem.selectedIndex].text){
			EventShooter(elem, 'focus');
		}
	}
}

function inputIdForCountry(countryElem, idContainer){
	var okDiv = false;
	var countryValue = countryElem.value;
	var idDiv = document.getElementById(idContainer);
	$(idDiv).find('div').each(function() {
		if (endsWith(this.id, countryValue)){
			this.style.display='block';
			okDiv = true;
		} else {
			this.style.display='none';
		}
		$(this).find('input, select').each(function() {
			if (this.id.indexOf('OT_') == 0){
				this.disabled = true;
			} else if (this.id.indexOf(countryValue+'_') == 0){
				this.disabled = false;
				okDiv = okDiv && true;
			} else {
				this.value = '';
				this.disabled = true;
			}
		});
	});
	if (okDiv) {
		if (isValidObject(document.getElementById(idContainer + '_OT_ID0'))) {
			document.getElementById(idContainer + '_OT_ID0').value = '';
		} else if (idContainer == 'idDefault') {
			document.getElementById('OT_ID0').value = '';
		}
	} else {
		if (isValidObject(document.getElementById(idContainer + '_OT_ID0'))) {
			document.getElementById(idContainer+'OT').style.display='block';
			document.getElementById(idContainer + '_OT_ID0').disabled = false;
		} else if (idContainer == 'idDefault') {
			document.getElementById('idOT').style.display='block';
			document.getElementById('OT_ID0').disabled = false;
		}
	}
}

function doSelectCountryId(countryElem, type, idContainer){
	doSelectChange(countryElem, type);
	inputIdForCountry(countryElem, idContainer);
}

function $ID_COUNTRY(){
	var classElem = $(".input_ID_country");
	classElem.change(function() {
		if (isValidObject(document.getElementById('id'+this.id))) {
			inputIdForCountry(this, 'id'+this.id);
		} else {
			inputIdForCountry(this, 'idDefault');
		}
	});
}

function $ID_TYPE(){
	var classElem = $(".input_ID_type");
	classElem.each(function() {
		
	});
}

function $ID(){
	$ID_TYPE();
	var classElem = $(".input_ID_country");
	classElem.each(function() {
		if (isValidObject(document.getElementById('id'+this.id))) {
			inputIdForCountry(this, 'id'+this.id);
		} else {
			inputIdForCountry(this, 'idDefault');
		}
	});
}

function $INTEGER(){
	classElem = $("input.input_integer[type=text]");
	classElem.each(function() {
		addClass(this, "number");
	});
	classElem.keypress(function(e){
		if (this.readOnly) return;
		enterInteger(e);
	});
}

function $MONEY(){
	classElem = $("input.input_money[type=text]");
	classElem.each(function() {
		this.maxLength = 21;
		addClass(this, "number");
		$(this).autoNumeric('init', 
				{aForm: false, aSep: DecimalFormatSymbols.getGroupingSeparator(), aDec: DecimalFormatSymbols.getDecimalSeparator(), vMin:'0.00', vMax:'99999999999999.99'});
	});
}

function $DATE(){
	/** $('#'+fieldId).mask("99/99/9999"); */
	/** $('#'+fieldId).iMask({type:'fixed', mask:'99/99/9999', stripMask:true}); */
	$("input.datepicker[type=text]" ).datepicker({
		dateFormat: "dd/mm/yyyy", 
		changeYear: true,
		changeMonth: true, 
		showOn: "button, beforeShowDay: $.datepicker.noWeekends"
	});

}

function initDate(elem, config){
	$(thisElem).datepicker(config);
}

function unmaskedValue(elem){
	var value = elem.value;
	if (hasClass(elem, 'input_phone')){
		value = parsePhone(elem);		
	} else if (hasClass(elem, 'input_phone_area')){
		value = parsePhone(elem);
	}
	return value;
}

function removeMask(elem){
	var value = unmaskedValue(elem);
	if (value !== elem.value) {
		elem.value = value;
	}
}

function initMask(thisElem){
	thisElem.onblur = function(e) {
		$(thisElem).unmask();
		thisElem.removeAttribute("masked");
		if (!hasDefaultLabel(thisElem)) {
			removeMask(thisElem);
		}
	};
	thisElem.onchange = function(e) {
		if (!hasDefaultLabel(thisElem)) {
			removeMask(thisElem);
			defaultLabel(thisElem);
		}
	};
	if (isValidObject(thisElem.getAttribute("innerLabel"))) {
		if (!hasDefaultLabel(thisElem)) {
			removeMask(thisElem);
			defaultLabel(thisElem);
		}
	} else {
		removeMask(thisElem);
		defaultLabelAttachEvents(thisElem, thisElem.title);
	}
}

function initPhone(thisElem){
	if(thisElem.type == 'select-one'){
		return;
	}
	thisElem.onfocus = function(e) {
		if (hasDefaultLabel(thisElem)) {
			thisElem.value = '';
		}
		var value = thisElem.value;
		if(value != ''){
			if(thisElem.maxLength == 11 && thisElem.value.length < 11){
				var len = value.length > 7 ? 10 : (value.length + 3);
				for(var n=value.length;n<len;n++){
		 		    value = '0' + value;
				}
			} else if(thisElem.maxLength == 6 && thisElem.value.length < 6){
				var len = 6;
				for(var n=value.length;n<len;n++){
		 		    value = '0' + value;
				}
			}
		}
		if(!thisElem.getAttribute("masked")){
			if(thisElem.maxLength == 3){
				$(thisElem).mask("9?99",{placeholder:" "});
			} else if(thisElem.maxLength == 6){
				$(thisElem).mask("9?99(999)",{placeholder:" "});
			} else if(thisElem.maxLength == 10){
				$(thisElem).mask("9?999999999",{placeholder:" "});
			} else if(thisElem.maxLength == 11){
				$(thisElem).mask("(?999)99999999",{placeholder:" "});
			} else if(thisElem.maxLength == 14){
				$(thisElem).mask("9?99(999)99999999",{placeholder:" "});
			} else {
				$(thisElem).mask("9?9999999999999",{placeholder:" "});
			}
			thisElem.setAttribute("masked", true);
		}
		if(thisElem.value !== value){
			thisElem.value = value;
		}
		setTimeout(function(){$(thisElem).select();},10);
	};
	if(thisElem.maxLength == 3){
		if(thisElem.title == ''){
			thisElem.title = 'País';
		}
		thisElem.size = 5;
	} else if(thisElem.maxLength == 6){
		if(thisElem.title == ''){
			thisElem.title = 'País+(Area)';
		}
		thisElem.size = 14;
	} else if(thisElem.maxLength == 10){
		if(thisElem.title == ''){
			thisElem.title = 'Telefono';
		}
		thisElem.size = 15;
	} else if(thisElem.maxLength == 11){
		if(thisElem.title == ''){
			thisElem.title = '(Area)+Telefono';
		}
		thisElem.size = 16;
	} else if(thisElem.maxLength == 14){
		if(thisElem.title == ''){
			thisElem.title = 'País+(Area)+Telefono';
		}
		thisElem.size = 28;
	} else {
		if(thisElem.title == ''){
			thisElem.title = 'País+Area+Telefono ej: 582125032424';
		}
	}
	initMask(thisElem);
}

function initEmail(thisElem){
	thisElem.onfocus = function(e) {
		if (hasDefaultLabel(thisElem)) {
			thisElem.value = '';
		}
		var value = thisElem.value;
		if(!thisElem.getAttribute("masked")){
			$(thisElem).mask('*@*',{placeholder:" "});
			thisElem.setAttribute("masked", true);
		}
		if(thisElem.value !== value){
			thisElem.value = value;
		}
		setTimeout(function(){$(thisElem).select();},10);
	};
	if(thisElem.title == ''){
		thisElem.title = 'e-mail';
	}
	initMask(thisElem);
}

function $PHONE(className){
	classElem = $("input."+className+"[type=text]");
	classElem.each(function() {
		initPhone(this);
	});	
}

function $EMAIL(){
	classElem = $("input_email");
	classElem.each(function() {
		initEmail(this);
	});	
}

function $CNOFC(){
	classElem = $(".input_cnofc");
	classElem.each(function() {
		addCNOFCHandler(this);
	});
}

function $IBS_INPUT(){
	if('undefined' !== typeof($)){
		$ID();
		$PHONE('input_phone_area');
		$PHONE('input_phone');
		$EMAIL();
		$DATE();
		$INTEGER();
		$MONEY();
		$CNOFC();
	}
	if(isValidObject(document.forms[0])){
		addEvent(document.forms[0], 'submit', defaultLabelClean);
	}
}

