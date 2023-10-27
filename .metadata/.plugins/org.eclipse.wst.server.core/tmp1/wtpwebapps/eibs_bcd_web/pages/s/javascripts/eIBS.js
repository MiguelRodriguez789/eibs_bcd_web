var letters=' ABC�DEFGHIJKLMN�OPQRSTUVWXYZabc�defghijklmn�opqrstuvwxyz������������������������&';
var numbers='1234567890';
var signs=',.:;@-\'';
var mathsigns='+-=()*/';
var custom='<>#$%&?�';
var chars=' ABC�DEFGHIJKLMN�OPQRSTUVWXYZabc�defghijklmn�opqrstuvwxyz������������������������1234567890,.:;@-+-=()*/<>#$%&?�';

//Defines ERROR WINDOW
var errorwin = null;
//Defines Currency OBJECT 
var CURRENCY = (typeof window.EIBS !== 'undefined') ? EIBS.currency : {};

///////////////////////////////////////////////////////////////////////////////////
//**************** GETTER UTILITY ********************************************//

//Get DOM ELEMENTS
function getElementFromDocument(doc, name) {
	var elem = doc.getElementById(name);
	if (!elem) {
		var elems = doc.getElementsByName(name);
		if (elems.length > 0) {
			elem = elems[0];
		}
	}
	return elem;
}

function getElement(name) {
	return getElementFromDocument(document,name);
}

function getRadioVal(radioName) {
	  var rads = document.getElementsByName(radioName);

	  for( var i = 0, length = rads.length; i < length; i++ ) {
	    if(rads[i].checked)
	      return rads[i].value;
	  }

	  return null;
}

function getElementCheckedFromDocument(doc, name) {

	var elem = null;
	elems = doc.getElementsByName(name);
	for (var i=0; i<elems.length; i++) {
		if (elems[i].checked) elem = elems[i];
	}
	return elem;
}

function getElementChecked(name) {
	return getElementCheckedFromDocument(document, name);
}

//Client-side getters 
function getTimestamp() {
	return new Date().getTime();
}

function getNameFromUrl(url) {
	//Modification to use the url and SCREEN parameter, (if exist), as the window name,
	//to avoid having multiple popup windows opened.
	var name = "";
	var start = 0;
	var end = url.indexOf("?");
	if (url.indexOf("servlet") > -1) { // is servlet
		start = url.lastIndexOf(".") + 1;
	} else if(url.indexOf("eIBSResource?resource=") > -1){ //is page
		start = url.lastIndexOf("?");
		var end = url.lastIndexOf("&");
	}
	var screen = "";
	var begin = url.search("/SCREEN/i");
	if (begin > -1) {
		screen = url.substr(begin);
		if (screen.indexOf("&") > -1) {
			screen = "_" + screen.substr(0, screen.indexOf("&"));
		}
	}
	name += end == -1 ? url.substr(start) : url.substr(start, end);
	name += screen;
	if (checkCookie("eibs")) {
		name += "_" + getCookie("eibs");
	}
	name = name.replace(/[\/\&\\\?\.\,\$\=/\s/]/g, "_");
	
	if(window.opener && !window.opener.closed){
		name = "openerx2";
		if(window.name = name){
			name = "openerx3";
		}
	}
	return name;
}

function getElementIndex(fieldName) {
	var formLength= document.forms[0].elements.length;
	for(var n=0;n<formLength; n++){
		var elementName= document.forms[0].elements[n].name;
		if(elementName == fieldName){
			return n;
  			break;
		}
	}
}

//Returns Namespace Value
//This function was added to retrieve "security mapping" of url
//Seperate JS for mapping inorder to Improve "Parse Performance"

function getNSValue(module, key, arguments, namespace) {
    var parts = module.split('.'),
	    i = 0,
    	l = parts.length,
    	obj = isValidObject(namespace) ? namespace : EIBS;
	
	while ( i < l ) {
		if(isValidObject(obj)){
    		obj = obj[parts[i]];
		}
    	if ( ! obj ) break;
    	i++; 
	}
	
	return obj && obj[key] && typeof obj[key] === 'string' ? obj[key] : 
		           (typeof obj[key] === 'function') ? obj[key](arguments) : null;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
//**************** CURRENCY/RATES/NUMERIC UTILITY ********************************************//
function formatCCY(num) {
	if(typeof num !== "number"){
		num = parseFloat(num);
	}
	num = ""+num;
	
	var num2 = "00";
	var result = "";
	var sign = "";
	sign = num.substring(0, 1);
	if (sign == "-")
		num = num.substring(1);
	else
		sign = "";

	var posi = num.indexOf(".");
	if (posi > -1) {
		num2 = num.substring(posi + 1, num.length);
		num = num.substring(0, posi);
		if(num.trim() == "")
			num = "0";
		if (num2.length == 1)
			num2 = num2 + "0";
		else if (num2.length > 2)
			num2 = num2.substring(0, 2);
	} else {
		if(num.trim() == "") num = "0";
	}

	num2 = CURRENCY.decSeparator() + num2;
	
	var count = 0;
	var endPosition = num.length - 1;
	for (var index = endPosition; index > -1; index--) {
		var nx = num.charAt(index);
		result = nx + result;
		++count;
		if (count % 3 == 0)  {
			if (index > 0) {
				result = CURRENCY.grpSeparator() + result;
			} // add grouping separator
		}

	}

	result = sign + result + num2;
	return (result);
}


function roundFCCY(num) {
	var num2 = "";
	var result = 0;
	//var num1 = replaceAll("" + num,CURRENCY.grpSeparator());
	var num1 = "" + num;
	var sign = num1.substring(0, 1);
	if (sign == "-")
		num1 = num1.substring(1);
	else
		sign = "";
	var posi = num1.indexOf(CURRENCY.decSeparator());
	if (posi != -1) {
		num2 = num1.substring(posi + 1, num1.length);
		if (num2.length > 2) {
			if (parseInt(num2.substring(2, 3)) > 5) {
				result = parseFloat(num1.substring(0, posi + 3)) + 0.01;
				return (sign + result);
			} else
				return (sign + num1.substring(0, posi + 3));
		} else
			return ("" + num);
	} else
		return ("" + num);

}

function formatFloat(value) {
	value = ""+NumberFormat.parse(value);
	if (value.indexOf('.') === -1) {
		return value + ".00";
	}
	return value;
}

function formatValor(campo, preformat, dec) {

	var vr = campo.value;
	vr = vr.replace(CURRENCY.decSeparator(), "");
	vr = replaceAll(vr, CURRENCY.grpSeparator());
	var sign = "";

	if (vr.indexOf('-') != -1) {
		vr = replaceAll(vr, "-");
		sign = "-";
	}
	var tam = (preformat) ? vr.length : vr.length + 1;

	if (tam <= dec) {
		var strDecimals = "";
		for (var i = 0; i < dec - tam; i++) {
			strDecimals = "0" + strDecimals;
		}
		campo.value = "0" + CURRENCY.decSeparator() + strDecimals + vr;
	} else {
		var tamInt = tam - dec;
		var result = "";
		var count = 0;
		for (var x = tamInt - 1; x > -1; x--) {
			var nx = vr.charAt(x);
			result = nx + result;
			++count;
			if (count == 3 || count == 6 || count == 9 || count == 12) {
				if (x > 0) {
					result = CURRENCY.grpSeparator() + result;
				} // add separator
			}
		}
		campo.value = result + CURRENCY.decSeparator() + vr.substr(tamInt, tam);
	}

	var pos = campo.value.indexOf(CURRENCY.decSeparator());
	if (pos != -1) {
		vr = campo.value.substr(0, pos);
		if (vr == "00" || (vr.length == 2 && vr.substr(0, 1) == "0"))
			campo.value = campo.value.substr(1, tam);
	}
	campo.value = sign + campo.value;
}

function enterDecimal(e, dec) {
	var evt = getEvent(e);
	if (!dec)
		dec = CURRENCY.decimalLength();
	var elem = EventElement(evt);
	var kcode = EventKeyCode(evt);
	
	//if (elem.readOnly) return;
	var val;
	var newVal = "";

	//var kdata = String.fromCharCode(kcode);
	if (CURRENCY.amountformat()) {
		// elem.value = formatFloat(elem.value);
		// elem.blur();
		// elem.focus();
	}
	switch (kcode) {
	case 66:
	case 98: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000000.00";
				else if (elem.maxLength - elem.value.length > 12)
					elem.value = elem.value + "000000000.00";
			} else
				elem.value = "1000000000.00";
		} else {
			val = parseFloat(elem.value) * 100000000000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000000000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
		}
		if (CURRENCY.amountformat())
			formatValor(elem, true, dec);
		if (elem.onchange)
			elem.onchange();
		break;
	}
	case 72:
	case 104: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "100.00";
				else if (elem.maxLength - elem.value.length > 5)
					elem.value = elem.value + "00.00";
			} else
				elem.value = "100.00";
		} else {
			val = parseFloat(elem.value) * 10000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "100.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
		}
		if (CURRENCY.amountformat())
			formatValor(elem, true, dec);
		if (elem.onchange)
			elem.onchange();
		break;
	}
	case 77:
	case 109: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000.00";
				else if (elem.maxLength - elem.value.length > 9)
					elem.value = elem.value + "000000.00";
			} else
				elem.value = "1000000.00";
		} else {
			val = parseFloat(elem.value) * 100000000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
		}
		if (CURRENCY.amountformat())
			formatValor(elem, true, dec);
		if (elem.onchange)
			elem.onchange();
		break;
	}
	case 84:
	case 116: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000.00";
				else if (elem.maxLength - elem.value.length > 6)
					elem.value = elem.value + "000.00";
			} else
				elem.value = "1000.00";
		} else {
			val = parseFloat(elem.value) * 100000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
		}
		if (CURRENCY.amountformat())
			formatValor(elem, true, dec);
		if (elem.onchange)
			elem.onchange();
		break;
	}
	default: {
		if (CURRENCY.amountformat()) {
			if (kcode == 44) {
				if (CURRENCY.decSeparator() == ',' && elem.value.indexOf(".") != -1) {
					cancelEvent(evt);
					return false;
				}else if( CURRENCY.grpSeparator() == ','){
					cancelEvent(evt);
					return;
				}else{
					return;
				}
				//elem.value = elem.value + kdata;
			} else if (kcode == 46 && CURRENCY.decSeparator() == '.') {
				if (CURRENCY.decSeparator() == '.' &&  elem.value.indexOf(".") != -1) {
					cancelEvent(evt);
					return false;
				}else if( CURRENCY.grpSeparator() == '.'){
					cancelEvent(evt);
					return;
				}else{
					return;
				}
				//elem.value = elem.value + kdata;
			} else if ((kcode < 48 || kcode > 57) && kcode != 13) {
				cancelEvent(evt);
				// formatValor(elem,true,dec);
			} else if (kcode != 13) {
				// formatValor(elem,false,dec);
				// elem.value = elem.value + kdata;
				// event.returnValue = false;
			}
		} else {
			if ((kcode < 48 || kcode > 57) && kcode != 46 && kcode != 13) {
				cancelEvent(evt);
			} else if (kcode == 46 && elem.value.indexOf('.') != -1) {
				cancelEvent(evt);
			}
		}
	}
	}
}

function enterSignCCY(e, dec) {
	var evt = getEvent(e);
	if (!dec)
		dec = CURRENCY.decimalLength();

	var elem = EventElement(evt);
	var kcode = EventKeyCode(evt);
	switch (kcode) {
	case 45: {
		cancelEvent(evt);
		if (elem.value.indexOf('-') == -1)
			elem.value = "-" + elem.value;
		break;
	}
	case 43: {
		cancelEvent(evt);
		if (elem.value.indexOf('-') !== -1)
			elem.value = elem.value.substring(1, elem.value.length);
		break;
	}
	default: {
		enterSignDecimal(evt, dec);
	}
	}
}

function enterSignDecimal(e, dec) {
	var evt = getEvent(e);
	if (!dec)
		dec = CURRENCY.decimalLength();

	var elem = EventElement(evt);
	var kcode = EventKeyCode(evt);
	//if (elem.readOnly) return;
	var val;
	var newVal = "";

	var kdata = String.fromCharCode(kcode);
	if (CURRENCY.amountformat()) {
		// elem.value = formatFloat(elem.value);
	}

	switch (kcode) {
	case 66:
	case 98: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000000.00";
				else if (elem.maxLength - elem.value.length > 12)
					elem.value = elem.value + "000000000.00";
			} else
				elem.value = "1000000000.00";
		} else {
			val = parseFloat(elem.value) * 100000000000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000000000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
			if (CURRENCY.amountformat())
				formatValor(elem, true, dec);
		}
		break;
	}
	case 72:
	case 104: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "100.00";
				else if (elem.maxLength - elem.value.length > 5)
					elem.value = elem.value + "00.00";
			} else
				elem.value = "100.00";
		} else {
			val = parseFloat(elem.value) * 10000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "100.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
			if (CURRENCY.amountformat())
				formatValor(elem, true, dec);
		}
		break;
	}
	case 77:
	case 109:
	case 189:		
			{
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000.00";
				else if (elem.maxLength - elem.value.length > 9)
					elem.value = elem.value + "000000.00";
			} else
				elem.value = "1000000.00";
		} else {
			val = parseFloat(elem.value) * 100000000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
			if (CURRENCY.amountformat())
				formatValor(elem, true, dec);
		}
		break;
	}
	case 84:
	case 116: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000.00";
				else if (elem.maxLength - elem.value.length > 6)
					elem.value = elem.value + "000.00";
			} else
				elem.value = "1000.00";
		} else {
			val = parseFloat(elem.value) * 100000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			} 
			if (newVal == "0.00")
				elem.value = "1000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
			if (CURRENCY.amountformat())
				formatValor(elem, true, dec);
		}
		break;
	}
	case 45: {
		cancelEvent(evt);
		if (elem.value.indexOf('-') == -1)
			elem.value = "-" + elem.value;
		// if (CURRENCY.amountformat()) formatValor(elem,true,dec);
		break;
	}
	case 43: {
		cancelEvent(evt);
		if (elem.value.indexOf('-') !== -1)
			elem.value = elem.value.substring(1, elem.value.length);
		// if (CURRENCY.amountformat()) formatValor(elem,true,dec);
		break;
	}
	default: {
		if (CURRENCY.amountformat()) {
			if (kcode == 44) {
				cancelEvent(evt);
				if (CURRENCY.decSeparator() == ',' && elem.value.split(",").length > 1) {
					return;
				}
				elem.value = elem.value + kdata;
			} else if (kcode == 46 && CURRENCY.decSeparator() == '.') {
				cancelEvent(evt);
				if (CURRENCY.decSeparator() == '.' && elem.value.split(".").length > 1) {
					return;
				}
				elem.value = elem.value + kdata;
			} else if ((kcode < 48 || kcode > 57) && kcode != 13) {
				cancelEvent(evt);
				// formatValor(elem,true,dec);
			} else if (kcode != 13) {
				// formatValor(elem,false,dec);
				// elem.value = elem.value + kdata;
				// event.returnValue = false;
			}
		} else {
			if ((kcode < 48 || kcode > 57) && kcode != 46 && kcode != 13) {
				cancelEvent(evt);
			} else if (kcode == 46 && elem.value.indexOf('.') != -1) {
				cancelEvent(evt);
			}
		}
	}
	}
}

function enterInteger(evt) {
	evt = getEvent(evt);
	var elem = EventElement(evt);
	var kcode = EventKeyCode(evt);
	switch (kcode) {
		case 66:
		case 98: {
			cancelEvent(evt);
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000000";
				else if (elem.maxLength - elem.value.length > 9)
					elem.value = elem.value + "000000000";
			} else
				elem.value = "1000000000";
			break;
		}
		case 72:
		case 104: {
			cancelEvent(evt);
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "100";
				else if (elem.maxLength - elem.value.length > 2)
					elem.value = elem.value + "00";
			} else
				elem.value = "100";
			break;
		}
		case 77:
		case 109:
		case 189:		
				{
			cancelEvent(evt);
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000";
				else if (elem.maxLength - elem.value.length > 6)
					elem.value = elem.value + "000000";
			} else
				elem.value = "1000000";
			break;
		}
		case 84:
		case 116: {
			cancelEvent(evt);
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000";
				else if (elem.maxLength - elem.value.length > 3)
					elem.value = elem.value + "000";
			} else
				elem.value = "1000";
			break;
		}
		default: {
			if ((kcode < 48 || kcode > 57) && kcode != 13)
				cancelEvent(evt);
		}
	}
}

function enterDecimalNum(evt) {
	evt = getEvent(evt);
	var charCode = EventKeyCode(evt);
	// alert (charCode);
	if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46
			&& charCode != 45)
		return false;
	return true;
}

function checkDecimal(e, dec) {
	var evt = getEvent(e);
	if (!dec)
		dec = CURRENCY.decimalLength();
	var elem = EventElement(evt);
	var kcode = EventKeyCode(evt);
	switch (kcode) {
		case 8:
		case 32:			
		case 46:{
			if (CURRENCY.amountformat()) 
				formatValor(elem, true, dec);
			if (elem.onchange)
				elem.onchange();
			break;
		}
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////
//********************************** DOM UTILITY ********************************************//

function crtInput(name, type, appendTO){
	var input = document.createElement("input");
	input.setAttribute('type', type);
	input.setAttribute('name', name);
	input.setAttribute('id', name);
	
	if(isValidObject(appendTO)){
		appendTo.appendChild(input);
		
	}else{
		document.forms[0].appendChild(input);			
	}
}

function cleanFields(fields){
	var form = document.forms[0];
	for (var i in fields) {
		var f = fields[i];
		var obj = form[f];
		if(isValidObject(obj)) {
			obj.value = '';
		}
	}
}

function readOnlyFields(fields, boleanid){
	var form = document.forms[0];
	for (var i in fields) {
		var f = fields[i];
		var obj = form[f];
		if(isValidObject(obj)) {
			obj.readOnly = boleanid;
		}
	}
}

function showChecked(name) {
	var formLength = document.forms[0].elements.length;
    for (var n=0; n<formLength; n++) {
    	var elemt = document.forms[0].elements[n];
      	if (elemt.name == name) {
			if (elemt.checked) {
        		elemt.click();
             	break; 	
            }	
    	}
	}
}

function divResize(addInfo) {
	var minValue = 0;
	var mainTable = getElement('mainTable');
	var dataDiv1 = getElement('dataDiv1');
	var tbAddInfo = getElement('tbAddInfo');

	if(isValidObject(mainTable)){
		minValue = mainTable.offsetTop + dataDiv1.offsetTop + 30;
	}
	var h = document.body.clientHeight - minValue;
	var totalrow = parseInt(document.forms[0].totalRow.value);
	var maxHeight = totalrow * 20; //dataDiv1.childNode.offsetHeight;

	if (addInfo) {
		minValue = mainTable.offsetTop + dataDiv1.offsetTop
				+ tbAddInfo.offsetHeight + 4;
	}
	h = (h <= 0) ? maxHeight : h;
	if (totalrow > 10 && document.body.clientHeight > minValue) {
		if (h < maxHeight) {
			dataDiv1.style.height = h + "";
			dataDiv1.style.overflowY = "scroll";
		} else {
			dataDiv1.style.height = maxHeight + "";
			dataDiv1.style.overflowY = "";
		}
	} else if (totalrow > 10 && document.body.clientHeight <= minValue) {
		dataDiv1.style.height = (addInfo) ? "" + tbAddInfo.offsetHeight : "200";
		dataDiv1.style.overflowY = "scroll";
	}
}

function adjustEquTablesIE(Table1, Table2, Div1, rb, footTb) {
	var T1 = Table1.rows[0];
	var T2 = Table2.rows[0];
	var wT1 = 0;
	var wT2 = 0;
	var maxCol = 0;
	var incr = 0;
	var maxWidth = 0;
	var adjPerCol = 0;
	var adjust = 0;
	var mainTb = Table1.parentNode;
	var footTable = null;
	if (footTb) {
		footTable = document.getElementById('footTable');
		if (!isValidObject(footTable)) {
			footTb = false;
		}
	}

	if (Table2.rows.length >= 1) {

		maxCol = T2.cells.length;
		incr = maxCol * 2;

		for ( var i = 0; i < maxCol; i++) {
			T1.cells[i].style.pixelWidth = 0;
			if(isValidObject(T2)){
				T2.cells[i].style.pixelWidth = 0;
			}
			wT1 = T1.cells[i].clientWidth;
			wT2 = T2.cells[i].clientWidth;

			T1.cells[i].style.pixelWidth = (wT1 >= wT2) ? wT1 : wT2;
			T2.cells[i].style.pixelWidth = (wT1 >= wT2) ? wT1 : wT2;
			maxWidth = (wT1 >= wT2) ? maxWidth + wT1 : maxWidth + wT2;

		}

		if (footTb) {
			footTable.rows[0].cells[0].style.pixelWidth = (maxWidth + 8)
					- T1.cells[maxCol - 1].style.pixelWidth;
			footTable.rows[0].cells[1].style.pixelWidth = T1.cells[maxCol - 1].style.pixelWidth;
		}
		maxWidth += incr;

		Table1.style.width = maxWidth;
		Table2.style.width = Table1.style.width;
		if (footTb) {
			footTable.style.width = Table1.style.width;
		}

		//incr= (footTb) ? 21 : 40;

		if (Table1.clientWidth < mainTb.clientWidth) {
			incr = (Div1.style.overflowY == "scroll") ? Table1.clientWidth + 23
					: Table1.clientWidth;
			adjust = mainTb.clientWidth - incr;
			adjPerCol = adjust / (maxCol - rb);
			adjPerCol = Math.round(adjPerCol);

			for (var k = 0; k < maxCol; k++) {
				wT1 = T1.cells[k].style.pixelWidth;
				T1.cells[k].style.pixelWidth = (k == (rb - 1)) ? wT1 : wT1
						+ adjPerCol;
				wT2 = T2.cells[k].style.pixelWidth;
				T2.cells[k].style.pixelWidth = (k == (rb - 1)) ? wT2 : wT2
						+ adjPerCol;
			}
			if (footTb) {
				footTable.rows[0].cells[0].style.pixelWidth += adjPerCol * 5;
				footTable.rows[0].cells[1].style.pixelWidth += adjPerCol;
			}
		}

	} else {
		Table1.style.width = "100%";
	}
}

function adjustEquTablesModern(Table1, Table2, Div1, rb, footTb, wdth) {
	
	var widthFactor = isNumeric(wdth) ? ( wdth < 1 ? wdth : parseFloat(wdth)/100 ) : 0.97;
	var T1 = Table1.rows[0];
	var T2 = Table2.rows[0];
	var maxCol = 0;
	var iter = 5;
	var incr = 0;
	
	if(window.innerWidth <  parseFloat(getComputedStyle(Table1).width) ){
		Table1.style.width = "0"; 
		Table2.style.width = "0";
		T1.style.width = "0";
		Div1.style.width = "0";
		
		if(isValidObject(T2)){
			if(isValidObject(T2.cells[i])){
				T2.cells[i].style.pixelWidth = "0";
			}
		}
		
		maxCol = isValidObject(T2) ? T2.cells.length : T1.cells.length;
		for ( var i = 0; i < maxCol; i++) {
			if(isValidObject(T2)){			
				if(isValidObject(T2.cells[i])){
					T2.cells[i].style.width = "0";
				}
			}
			T1.cells[i].style.width = "0";
		}
		adjustEquTablesModern(Table1, Table2, Div1, rb, footTb);		
		return;
	}
	
	Table1.style.width =  window.innerWidth * widthFactor;
	Table2.style.width = window.innerWidth * widthFactor;
	T1.style.width = '100%';
	Div1.style.width = '100%';	
	Div1.style.overflowX = 'hidden';
	
	if(isValidObject(T2)){
		T2.style.width = '100%';
	}
	
	var footTable = null;
	if (footTb) {
		footTable = document.getElementById('footTable');
		footTable.style.width = Table1.style.width;
		if (!isValidObject(footTable)) {
			footTb = false;
		}
	}
	if(isValidObject(T2)){
		if (Table2.rows.length >= 1) {
	
			maxCol = T2.cells.length;
			incr = maxCol * 2;
	
			for ( var j = 0; j < iter; j++) {//10 iterations of Shifting. 
											//Brute force, versus precise percentage and increment movements of old method :(
				for ( var i = 0; i < maxCol; i++) {
					//Table header CELL > Data Table CELL
					//DATA TABLE CELL width = Table Header width
					if ( parseFloat(getComputedStyle(T1.cells[i]).width) > parseFloat(getComputedStyle(T2.cells[i]).width) ){
						T2.cells[i].style.width = getComputedStyle(T1.cells[i]).width;
					}
				}
		
				//Table header CELL < Data Table CELL
				//Table Header width = DATA TABLE CELL width			
				for ( var i = 0; i < maxCol; i++) {
					if(isValidObject(T2.cells[i])){
						if ( parseFloat(getComputedStyle(T2.cells[i]).width) > parseFloat(getComputedStyle(T1.cells[i]).width)){
							T1.cells[i].style.width = getComputedStyle(T2.cells[i]).width;
						}
					}
				}
			}
			
			if (footTb) {
					footTable.rows[0].cells[0].style.width = parseFloat(getComputedStyle(Table1).width)	-  parseFloat(getComputedStyle(T2.cells[maxCol - 1]).width);
					footTable.rows[0].cells[1].style.width = parseFloat(getComputedStyle(T2.cells[maxCol - 1]).width);
			}
	
		}
	}
}

function adjustEquTables(Table1, Table2, Div1, rb, footTb, width) {
	
	if(EIBS.BrowserDetect.isIE()){
		if(EIBS.BrowserDetect.IECompatibility()){//IE10
			adjustEquTablesIE(Table1, Table2, Div1, rb, footTb);
		} else {
			adjustEquTablesModern(Table1, Table2, Div1, rb, footTb, width);
		}
		
	}else{
		adjustEquTablesModern(Table1, Table2, Div1, rb, footTb, width);
	}
}

function adjustDifTables(Table1, Table2, Div1, column, rb, wdth) {
	if(typeof Table1 === 'string' ) Table1 = getElement(Table1);
	if(typeof Table2 === 'string' ) Table2 = getElement(Table2);
	if(typeof Div1 === 'string' ) Div1 = getElement(Div1);
	
	var widthFactor = isNumeric(wdth) ? parseFloat(wdth)/100 : 0.98;
	var T1 = Table1.rows[0];
	var T11 = Table1.rows[1];
	var T2 = Table2.rows[0];
	
	var maxCol = 0;
	var maxT11Col = T11.cells.length;
	var n = column;
	var iter = 2;
	var rw2Index = 0;
	var rw2Counter = 0;
	var rw1Index = 0;
	var w1colspan = 0;

	if(window.innerWidth <  parseFloat(getComputedStyle(Table1).width) ){
		//Resets the widths of all table rows, table cells, and div to 0
		//Reenter the Function
		Table1.style.width = "0"; 
		Table2.style.width = "0";
		T1.style.width = "0";
		T11.style.width = "0";
		T2.style.width = "0";
		Div1.style.width = "0";
		
		maxCol = T2.cells.length;
		
		for ( var i = 0; i < maxCol; i++) {
			T2.cells[i].style.width = "0";
		}
		maxCol = T1.cells.length;
		for ( var i = 0; i < maxCol; i++) {
			T1.cells[i].style.width = "0";
		}
		maxCol = T11.cells.length;
		for ( var i = 0; i < maxCol; i++) {
			T11.cells[i].style.width = "0";
		}
		adjustDifTables(Table1, Table2, Div1, column, rb, wdth);		
		return;
	}
	
	Table1.style.width =  isNumeric(wdth) ? window.innerWidth * widthFactor : "100%";
	Table2.style.width = isNumeric(wdth) ? window.innerWidth * widthFactor : "100%";
	Div1.style.width = isNumeric(wdth) ? window.innerWidth * widthFactor : "100%";			
	T1.style.width =  isNumeric(wdth) ? window.innerWidth * widthFactor : "100%";
	T11.style.widt =  isNumeric(wdth) ? window.innerWidth * widthFactor : "100%";
	if(isValidObject(T2)) T2.style.width =  isNumeric(wdth) ? window.innerWidth * widthFactor : "100%";
	
	if (Table2.rows.length >= 1) {
		maxCol = T2.cells.length;
		rw2Index = 0;
		rw1Index = 0;
		w1colspan = 0;
		rw2Counter = 0;
		
		for ( var j = 0; j < iter; j++) {//10 iterations of Shifting.Brute Force

			for ( var i = 0; (i < maxCol) && (rw2Index < maxT11Col); i++) {
				w1colspan = T1.cells[rw1Index].getAttribute("colspan"); //ColSpan of current Cell in the First Row of Table Header
				
				if(T1.cells[rw1Index].getAttribute("rowspan") > 1){
					//Table1 Row 1 CELL > Data Table CELL
					//DATA TABLE CELL width = Table1 Row1 Header width
					if ( parseFloat(getComputedStyle(T1.cells[rw1Index]).width) > parseFloat(getComputedStyle(T2.cells[i]).width) ){
						T2.cells[i].style.width = getComputedStyle(T1.cells[rw1Index]).width;
						
					//Table1 Row 1 CELL > Data Table CELL
					//DATA TABLE CELL width = Table1 Row1 Header width
					} else if( parseFloat(getComputedStyle(T2.cells[i]).width) > parseFloat(getComputedStyle(T1.cells[rw1Index]).width)){
						T1.cells[rw1Index].style.width = getComputedStyle(T2.cells[i]).width;
					
					}
					rw1Index++;
					//Increment Row1 cell position
				} else {
					//Table1 Row 2 CELL > Data Table CELL
					//DATA TABLE CELL width = Table1 Row2 Header width
					if( parseFloat(getComputedStyle(T11.cells[rw2Index]).width) > parseFloat(getComputedStyle(T2.cells[i]).width )){
						T2.cells[i].style.width = getComputedStyle(T11.cells[rw2Index]).width;
						
					//Table1 Row 2 CELL > Data Table CELL
					//DATA TABLE CELL width = Table1 Row2 Header width
					} else if(parseFloat(getComputedStyle(T2.cells[i]).width) > parseFloat(getComputedStyle(T11.cells[rw2Index]).width)){
						T11.cells[rw2Index].style.width = getComputedStyle(T2.cells[i]).width;
					}				
					rw2Index++;
					rw2Counter++; //Increment Row2 cell position

					if(rw2Counter >= w1colspan){ //This validation make sure that second row cell index is always within the first row colspan.
						rw2Counter = 0;
						rw1Index++;
						rw2Index = 0;
					}
				}
			}
			//Resets Values for "iter" number of iterations of outerloop.
			maxCol = T2.cells.length;
			rw2Index = 0;
			rw1Index = 0;
			w1colspan = 0;
			rw2Counter = 0;			
		}
	}
}

function autotab(e) {
	var evt = getEvent(e);
	var elem;
	var keyCode;
	if (isIE()) {
		keyCode = evt.keyCode;
		elem = evt.srcElement;
	} else {
		keyCode = evt.which;
		elem = evt.target;
	}

	var coll = document.forms[0];
	var i = 0;
	if (keyCode == 9 || keyCode == 16) {
		return; // TAB=9 and SHIFTTAB=16
	}
		
	if (elem.type == "text" || elem.type == "password") {
		var meetsMaxLengthCond = typeof elem.maxLength != 'undefined' &&  
									isNumeric(elem.maxLength) && 
									elem.maxLength > -1 && 
									elem.value.length > (elem.maxLength - 1);
		if (meetsMaxLengthCond) {
			while (i < coll.length) {
				if (coll[i] == elem) {
					break;
				} else {
					i++;
				}
			}
			i++;
			while (i < coll.length) {
				if (coll[i].type == "hidden" || coll[i].readOnly
						|| coll[i].style.visibilty == "hidden") {
					i++;
				} else {
					coll[i].focus();
					if (coll[i].tagName !== "SELECT") {
						coll[i].select();
					}else{
						coll[i].focus();
					}
					break;
				}
			}
		}
	}
}

function highlightRow(table, selectedRow, elem) {
	var elemRow;
	var rows;
	var dataTable = getElement(table);
	if(isValidObject(dataTable)) {
		elemRow = dataTable.rows[selectedRow];
		rows = dataTable.rows;
	} else {
		elemRow = getElement(table+selectedRow);
		rows = getElementsByClassName('trhighlight');
	}
	for (var i=0; i<rows.length; i++) {
		removeClass(rows[i], 'trhighlight');
	}
	addClass(elemRow, 'trhighlight');
    
	if(isValidObject(elem)) elem.value = selectedRow;
}

function setRowInfo(tableName, row, fieldName, value) {
	highlightRow(tableName, row);
	getElement(fieldName).value = value;
}

function setReadOnly(divId, what){
	var imgHelpHeight = "0";
	var imgHelpWidth = "0";
	var imgRequiredHeight = "0";
	var imgRequiredWidth = "0";

		what = typeof what == 'undefined' ? true : what;

			
		var felem = typeof divId == 'undefined' ?  document.forms[0].elements
							: ddocument.getElementById(divId).getElementsByTagName('*');
		var j=felem.length;
		for(var i=0; i<j; i++){
			if (felem[i].tagName != "img" && felem[i].tagName != "IMG"){
				if (felem[i].type=="text"){
					felem[i].readOnly=what;
				} else if (felem[i].tagName=="TEXTAREA" || felem[i].tagName=="textarea") {
					felem[i].readOnly=what;	
				} else if (felem[i].type=="hidden") {
				} else { 
					felem[i].disabled=what;
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

function readOnlyPage(){
	if(window.jQuery){
	   //$("input").css("background-color", "LightGray");
		//$("input").css("border-style", "groove");
		$("input[type='text']").attr("readonly", "readonly").prop("onchange",null).prop("change",null);  
		$("select").add("button").add("submit").add("input[type='radio']").add("input[type='checkbox']").attr("disabled", "disabled").prop("onchange",null).prop("change",null);  
		$("img[title='null']").add("img[src*='1b.gif']").add("img[src*='Check.gif']").add("img[src*='calendar.gif']").hide(); 	
	} else {
		setReadOnly();
	}
}



function enterCharNumber(e) {
	var evt = getEvent(e);
	var elem = EventElement(evt);
	var kcode = EventKeyCode(evt);
	var newVal = "";

	var kdata = String.fromCharCode(kcode);
	newVal = kdata;

	if (isCharCodeNumber(kcode))
		if (elem.maxLength > elem.value.length)
			elem.value = elem.value + newVal;
	evt.returnValue = false;
}

function clearSelectedValue(obj) {
	if (window.getSelection) { // all browsers, except IE before version 9
		alert("All browsers, except IE before version 9");
	} else {
		var range = document.selection.createRange();
		//alert("In text: " + obj.value + " is selected: " + range.text);
		if (range.text !== '') {
			obj.value = '';
		}
	}
}

function clearSelection() {
	if (document.selection) {
		document.selection.empty();
	} else if (window.getSelection) {
		window.getSelection().removeAllRanges();
	}
}

function doGetCaretPosition (ctrl) {
	 var CaretPos = 0;  
	 // IE Support
	 if (document.selection) {
	  ctrl.focus ();
	  var Sel = document.selection.createRange ();
	  Sel.moveStart ('character', -ctrl.value.length);
	  CaretPos = Sel.text.length;
	 }
	 // Firefox support
	 else if (ctrl.selectionStart || ctrl.selectionStart == '0')
	  CaretPos = ctrl.selectionStart;
	 return (CaretPos);
}

function setCaretPosition(ctrl, pos){
 if(ctrl.setSelectionRange){
  ctrl.focus();
  ctrl.setSelectionRange(pos,pos);
 } else if (ctrl.createTextRange) {
     var range = ctrl.createTextRange();
     range.collapse(true);
  	 range.moveEnd('character', pos);
  	 range.moveStart('character', pos);
  	 range.select();
  }
 }
 
function isSelected (obj) {
	var len = obj.value.length;
	var s=len;
	var e=s;
	if (window.getSelection) { // all browsers, except IE before version 9
		s=obj.selectionStart;
		e=obj.selectionEnd;
		return e-s === len;
	} else {
		var range = document.selection.createRange().duplicate();
        range.moveStart("character", -len);
        e = range.text.length;
       	range = document.selection.createRange().duplicate();
		range.moveEnd("character", len);
        s = (range.text == "" ? e : obj.value.lastIndexOf(range.text));
		return e-s === len;
	}
	return false;
} 

function replaceSelection(obj, value) {
	var len = obj.value.length;
	var s=len;
	var e=s;
	if (window.getSelection) { // all browsers, except IE before version 9
		s=obj.selectionStart;
		e=obj.selectionEnd;
		obj.value = obj.value.substring(0,s)+value+obj.value.substring(e,len);
		//positioning the cursor
		obj.setSelectionRange(len, len);
	} else {
		var range = document.selection.createRange().duplicate();
        range.moveStart("character", -len);
        e = range.text.length;
       	range = document.selection.createRange().duplicate();
		range.moveEnd("character", len);
        s = (range.text == "" ? e : obj.value.lastIndexOf(range.text));
        obj.value = obj.value.substring(0,s)+value+obj.value.substring(e,len);
        //positioning the cursor
        len = obj.value.length;
        range = document.selection.createRange();
		//range = obj.createTextRange();
		//range.collapse(true);
        range.moveStart("character", len);
        range.moveEnd("character", len);
        range.select();
	}
	//obj.focus();
	return s;
}

function enterChars(e,allow) {
	var evt = getEvent(e);
	var k=EventKeyCode(evt);
	if(allow.indexOf(String.fromCharCode(k))==-1)
		cancelEvent(evt);
	return;
}

function selectField(field){
	try {
		if (field.type == "select" 
			|| field.type == "select-one"
			|| field.type == "select-multiple"
			|| field.type == "checkbox") {
			field.focus();
		} else if (field.type == "radio") {
			for (var i=0;i < field.length; i++) {
  				if (field[i].checked) {
  					field[i].focus();
  					field[i].select();
    				break;
  				}
			}
		} else {
			field.focus();
			field.select();
		}
		return true;
	} catch (e){
	}
	return false;
}

function setField(field, value){
	try {
		if(!(isValidObject(field) && isValidObject(value))){
			return;
		}
		var changed = false;
		if (field.type == "select" 
			|| field.type == "select-one"
			|| field.type == "select-multiple") {
			for (var i=0; i < field.options.length; i++) {
		        if (field.options[i].text == value) {
		        	if(!field.options[i].selected){
			        	field.options[i].selected = true;
			        	changed = true;
		        	}
		        } else {
		        	if(field.options[i].selected){
			        	field.options[i].selected = false;
			        	changed = true;
		        	}
		        }
		    }
		} else if (field.type == "radio") {
			for (var i=0; i < field.length; i++) {
  				if (field[i].value == value) {
  					if(!field[i].checked){
  	  					field[i].checked = true;
  	  					changed = true;
  					}
  				} else {
  					if(field[i].checked){
  	  					field[i].checked = false;
  	  					changed = true;
  					}
  				}
			}
		} else if (field.type == "text" || field.type == "textarea") {
			if (field.maxLength > 0) {
				value = value.substring(0, field.maxLength);
			}
			if (field.value != value) {
				field.value = value;
				changed = true;
			}
		} else {
			if (field.value != value) {
				field.value = value;
				changed = true;
			}
		}
		if(changed){
			EventTrigger(field, "change");			
		}
	} catch(e) {
	}
}

function radioCheck(name, value) {
	var radio = document.getElementsByName(name);
	if (isValidObject(radio) && radio.length > 0) {
		for (var i=0; i<radio.length; i++) {
			if (radio[i].value == value) {
				radio[i].checked = true;
			} else {
				radio[i].checked = false;
			}
		}
	}
}

function radioClick(name, idx) {
	var oObject = document.getElementsByName(name);
	if (isValidObject(oObject) && oObject.length > 0) {
		if (oObject.length > 1) {
			oObject[idx].click();
		} else {
			oObject[0].click();
		}
	}
}

function go(op) {
	var dist = op - 1;
	getElement("dataDiv").scrollTop = getElement("dataDiv").getElementsByClassName('tableinfo')[dist].offsetTop - getElement("dataDiv").getElementsByClassName('tableinfo')[dist].offsetHeight;
}

function showOpt(showall) {
	if (showall) {
		dataDiv.style.overflowY = "visible";
	} else {
		dataDiv.style.overflowY = "scroll";
		dataDiv.style.height = mainTable1.offsetTop + mainTable1.offsetHeight
				+ "";
	}
}

//disable click right
function right(evt) {
	evt = getEvent(evt);
	if ((evt.button == 2 || evt.button == 3)) {
		cancelEvent(evt);
		var message = EIBS.BrowserDetect.browser + " - " + EIBS.BrowserDetect.version 
			+ "\neIBS \nDatapro, inc.\nAll Right Reserved";
		alert(message);
	} else {
		return true;
	}
}

function closeError() {
	if (isValidObject(errorwin)) {
		if (errorwin !== window)
			errorwin.close();
	}
}

function checkClose() {
	if (window.name != "main") 
		top.close();
	else 
		window.location.href = context + "/pages/background.jsp";
}

function RestoreFilter() {
	var tabcoll = document.getElementsByTagName("TABLE");
	if (tabcoll != null) {
		for (var i = 0; i < tabcoll.length; i++)
			if (tabcoll[i].className == "tableinfo")
				tabcoll[i].style.filter = "progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true')";
	}
}

function RemoveFilter() {
	var tabcoll = document.getElementsByTagName("TABLE");
	if (tabcoll != null) {
		for (var i = 0; i < tabcoll.length; i++)
			if (tabcoll[i].className == "tableinfo")
				tabcoll[i].style.filter = "";
	}
}


//To test a rate value consisting of maximum 3 integers and maximum 6 decimals
function enterRate(event) {
	enterDecimal(event, 6);
}



function clickElement(fName, fValue) {
	var formLength = document.forms[0].elements.length;
	for (var n=0;n<formLength;n++) {
		var elementName = document.forms[0].elements[n].name;
      	var elementValue = document.forms[0].elements[n].value;
      	if(elementName == fName && elementValue == fValue)
      	{
        		document.forms[0].elements[n].click();
        		break;
      	}
	}
}

function clickElementID(formId){
	  var element = getElement(formId);
	  if(element != null){
	 	element.click();
	  }
}

function addAnchorToContent(contents, elems, callback){
	for (var I = 0 ; I < elems.nodes.length ; I++) {
		var elem = elems.nodes[I];   
		var li = document.createElement('li');  
		li.setAttribute('id', elem.id);
		var ref2 =  document.createElement('a');   
		ref2.appendChild(document.createTextNode(elem.desc));   
		ref2.setAttribute("href","javascript:"+callback+"('" + elem.id + "')");
		li.appendChild(ref2);  
		contents.appendChild(li);
	}
}

function limitText(obj, maxlen) {
	if (obj.type == "textarea") {
		if (obj.value.length > maxlen) {
			alert("Maximo numero de caracteres permitidos: " + maxlen);
			obj.value = obj.value.substring(0, maxlen);
		}
	}
} 

function getAnchorById(doc, name) {
	var anchors = doc.getElementsByTagName("a");
	for (var int = 0; int < anchors.length; int++) {
		if (anchors[int].id == name || anchors[int].name == name) {
			return anchors[int];
		}
	}
	return null;
}

function goOpenerAction(opt) {
	var myopener = top.opener.document;
	if (opt == "A") {
		getAnchorById(myopener, "linkApproval").click();
	} else if (opt == "J") {
		getAnchorById(myopener, "linkJ").click();
	} else if (opt == "K") {
		getAnchorById(myopener, "linkK").click();
	} else if (opt == "D") {
		getAnchorById(myopener, "linkDelete").click();
	} else if (opt == "Z") {
	   myopener.forms[0].submit();
	} else {
		getAnchorById(myopener, "linkReject").click();
	}
	top.close();
}

//Get CSS Values Directly From StyleSheet
//Allows to get nonRendered Element Properties
function getStyleCSS(className_, attr_) {

    var styleSheets = document.styleSheets;
    var styleSheetsLength = styleSheets.length;
    for(var i = 0; i < styleSheetsLength; i++){
        var classes = styleSheets[i].rules || styleSheets[i].cssRules;
        var classesLength = classes.length;
        for (var x = 0; x < classesLength; x++) {
            if (classes[x].selectorText == className_) {
                var ret;
                var properties;
                
                if(classes[x].cssText){
                    ret = classes[x].cssText;
                } else {
                    ret = classes[x].style.cssText;
                }
                if(ret.indexOf(classes[x].selectorText) == -1){
                    ret = classes[x].selectorText + "{" + ret + "}";
                }
                
                if(ret.length > 0 && typeof attr_ !== 'undefined'){
                		//Get Only the CSS text between bracket { };
	                ret = ret.substring(ret.lastIndexOf("{")+1,ret.lastIndexOf("}"));
	                
	                properties = ret.split(';'); 
	                var index = properties.containsSubstring(attr_);

	                if(-1 != index){
	                		//Plus One Because We Want the value after '
		                ret = properties[index].substring(properties[index].indexOf(":")+1);
	                }
                }
                return ret.trim();
            }
        } 
    }
}
/////////////////////////////////////////////////////////////////////////////////////////////////
//********************************** IMAGE UTILITY ********************************************//

function MM_swapImgRestore() {// v3.0
  var i,x,a=document.MM_sr; 
  for(i=0;a&&i < a.length&&(x=a[i])&&x.oSrc;i++) 
  	x.src=x.oSrc;
}

function MM_findObj(n, d) {// v3.0
  var p,i,x;  
  if(!d) 
     d=document; 
  if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; 
    n=n.substring(0,p);
  }
  if(!(x=d[n])&&d.all) 
  	x=d.all[n]; 
  for (i=0;!x&&i<d.forms.length;i++) 
  	x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) 
  	x=MM_findObj(n,d.layers[i].document); 
  return x;
}

function MM_swapImage() {// v3.0
  var i,j=0,x=null,a=MM_swapImage.arguments; 
  document.MM_sr=new Array; 
  for(i=0;i<(a.length-2);i+=3){
	x=MM_findObj(a[i]);
	if (!isValidObject(x)) {
		x = getElement(a[i]);
	}
  	if (isValidObject(x)){
  		document.MM_sr[j++]=x; 
  		x.oSrc=x.src; 
  		x.src=a[i+2];
  	}
  }
  return x;
}

function MM_preloadImages() {// v3.0
  var d=document; 
  if(d.images){ 
  	if(!d.MM_p) 
  	  d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; 
    for(i=0; i<a.length; i++) {
     if (a[i].indexOf("#")!=0){ 
        d.MM_p[j]=new Image; 
        d.MM_p[j++].src=a[i];
     }
    }
  }
}

function imgDown(name, img_over)  {
	var path;
	if(typeof EIBS !== 'undefined'){
		if (typeof EIBS.imgPath() !== 'undefined'){
			path = EIBS.imgPath() + EIBS.languagePath() + img_over;
		}else{
			path = img_over;
		}
	} else {
		path = img_over;
	}
	MM_preloadImages(path);
	var image =  MM_swapImage(name, '', path, 1);
    if(isValidObject(image)){
    	if(image.oSrc != image.src){
    		return true;
    	}
        image.disabled = true;
    }
    return false;
}


/////////////////////////////////////////////////////////////////////////////////////////////////
//********************************** JAVASCRIPT UTILITY ********************************************//
function isValidObject(objToTest) {
	if (null == objToTest) return false;
	if ("undefined" == typeof(objToTest)) return false;
	return true;
}

function replaceAll(value, char) {

	var result = value;
	var posi = value.indexOf(char);
	if (posi > -1) {
		while (posi > -1) {
			result = value.substring(0, posi);
			result = result + value.substring(posi + 1);
			posi = result.indexOf(char);
			value = result;
		}
	}

	return (result);
}

function isCharCodeNumber(kcode) {
	var isNumber = false;
	if (kcode > 47 && kcode < 58)
		isNumber = true; //Numbers - 48 --> 57
	return isNumber;
}

function isCharNumber(character) {
	if (character.length != 1)
		return false;
	return isCharCodeNumber(character.charCodeAt(0));
}

function addRightChar(character, len, value) {
	if (value != '') {
		for (var n = value.length; n < len; n++) {
			value = character + value;
		}
	}
	return value;
}

function addLeftChar(character, len, value) {
	if (value != '') {
		for (var n = value.length; n < len; n++) {
			value = character + value;
		}
	}
	return value;
}

function fillLeft(idField, character){
	idField.value = addLeftChar(character, idField.maxLength, idField.value);
}

function rightAlignCharNumber(e) {
	var evt = getEvent(e);
	var elem = EventElement(evt);
	var value = elem.value;
	var kcode;

	if (value != '') {
		for (var n = 0; n < value.length; n++) {
			kcode = value.charCodeAt(n);
			if (!isCharCodeNumber(kcode))
				return;
		}
		for (n = value.length; n < elem.maxLength; n++) {
			elem.value = "0" + elem.value;
		}
	}
}

function isNumeric(val) {
    return val != "" && !isNaN(+val) && isFinite(val);
}

function trim(value) {
	var i = 0;
	var front = false;
	var rear = false;
	var j = value.length;

	while ((j > 0) && ((front == false) || (rear == false))) {

		if (value.charAt(i) != " ") {
			front = true;
		} else {
			value = value.substring(i + 1);
			j = value.length - 1;
		}

		if (value.charAt(j) != " ") {
			rear = true;
		} else if (i == j - 1) {
			value = value.charAt(i);
			rear = true;
		} else {
			value = value.substring(0, j - 1);
			j = value.length - 1;
		}
	}
	return value;
}

// Check whether string s is empty.
function isEmpty(s) {
	return ((s == null) || (s.length == 0));
}

function justifyRight(value, len) {
	return addLeftChar('0', len, value);
}

///////////////////////////////////////////////////////////////////////////////
///****************** COOKIE UTILITY ********************************///////////

function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime()+(exdays*24*60*60*1000));
	var expires = "expires=" + d.toGMTString();
	document.cookie = cname + "=" + escape(cvalue) + "; " + expires;
}

function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for (var i=0; i<ca.length; i++) {
		var c = ca[i];
		if (c.indexOf(name) == 0) 
			return c.substring(name.length, c.length);
	}
	return "";
}

function deleteCookie(cname) {
	document.cookie = cname + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

function checkCookie(cname) {
	var cookie = getCookie(cname);
	return (cookie != ""); 
}

/////////////////////////////////////////////////////////////////////////////////////////////////
//********************************** DATE UTILITY ********************************************//

function getActualDate(DTFMT, firstDay) {
	var now = new Date();
	var year = now.getYear();
	var month = now.getMonth() + 1;
	var day = "";
	if (firstDay)
		day = "01";
	else
		day = now.getDate();
	var today = '';
	if (DTFMT == 'MDY')
		today = month + '/' + day + '/' + year;
	else if (DTFMT == 'DMY')
		today = day + '/' + month + '/' + year;
	else if (DTFMT == 'YMD')
		today = year + '/' + day + '/' + month;

	return today;
}

// isYear (STRING s)
//
// isYear returns true if string s is a valid
// Year number. Must be 2 or 4 digits only.
//
function isYear(s) {
	if (isEmpty(s))
		return false;
	return ((s.length == 2) || (s.length == 4)) && isNumeric(s);
}

// isMonth (STRING s)
//
// isMonth returns true if string s is a valid
// month number between 1 and 12.
//
function isMonth(s) {
	if (isEmpty(s))
		return false;
	return (parseInt(s, 10) >= 1 && parseInt(s, 10) <= 12);
}

// isDay (STRING s)
//
// isDay returns true if string s is a valid
// day number between 1 and 31.
//
function isDay(s) {
	if (isEmpty(s))
		return false;
	return (parseInt(s, 10) >= 1 && parseInt(s, 10) <= 31);
}

// daysInFebruary (INTEGER year)
//
// Given integer argument year,
// returns number of days in February of that year.
function daysInFebruary(year) { // February has 29 days in any year evenly
								// divisible by four,
	// EXCEPT for centurial years which are not also divisible by 400.
	return (((year % 4 == 0) && ((!(year % 100 == 0)) || (year % 400 == 0))) ? 29
			: 28);
}

// validate date
function isDate(year, month, day) {
	if (!(isYear(year) && isMonth(month) && isDay(day)))
		return false;
	var intYear = parseInt(year, 10);
	var intMonth = parseInt(month, 10);
	var intDay = parseInt(day, 10);
	if ((intMonth == 2) && (intDay > daysInFebruary(intYear)))
		return false;
	return true;
}

// format date ,fills day & month with leading zeroes, and year with century
function fDate(vDate, fmtDate) {
	var dateArray = vDate.split("/");
	var day = "";
	var month = "";
	var year = "";
	if (fmtDate == "MDY") {
		day = dateArray[1];
		month = dateArray[0];
		year = dateArray[2];
	} else if (fmtDate == "DMY") {
		day = dateArray[0];
		month = dateArray[1];
		year = dateArray[2];
	} else if (fmtDate == "YMD") {
		day = dateArray[2];
		month = dateArray[1];
		year = dateArray[0];
	} else
		return "";
	day = ((day.length == 1) ? "0" + day : day);
	month = ((month.length == 1) ? "0" + month : month);
	year = ((year.length == 2) ? ((parseInt(year, 10) > 50) ? "19" : "20")
			+ year : year);
	if (fmtDate == "MDY")
		return (month + '/' + day + '/' + year);
	else if (fmtDate == "DMY")
		return (day + '/' + month + '/' + year);
	else if (fmtDate == "YMD")
		return (year + '/' + month + '/' + day);
	else
		return "";
}

// yy/mm/dd
function isDateValid(year, month, day) {
	day = ((day.length == 1) ? "0" + day : day);
	month = ((month.length == 1) ? "0" + month : month);
	year = ((year.length == 2) ? ((parseInt(year, 10) > 50) ? "19" : "20")
			+ year : year);

	return isDate(year, month, day);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
//********************************** WINDOW UTILITY ********************************************//
function setCenterSize(w1, h1) {
	top.resizeTo(w1, h1);
	var w=screen.width;
	var h=screen.height;
	var posTop=(h - h1) / 2;
	var posLeft=(w - w1) / 2;
	top.moveTo(posLeft, posTop);
}

function CenterNamedWindow(u, nm, w1, h1, tp) {
	var w = screen.width;
	var leftPos = 0; // FindLeftScreenBoundry();
	var h = window.screen.height;
	var posTop = (h-h1)/2;
	var posLeft =  leftPos + (w-w1)/2;
	var position = 'screenX='+ posLeft + 'left='+posLeft+',top='+posTop+',height='+h1+',width='+w1;
	
	var listin = null;
	
	switch (tp){
  	case 1:
			listin = window.open(u,nm,position);
			break;
  	case 2:
			listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
  		break;
  	case 3:
			listin = window.open(u,nm,'scrollbars=yes,'+position);
			break;
  	case 4:
			listin = window.open(u,nm,'toolbar=yes,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
  		break;
  	case 5:
			listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,'+position);
  		break;
  	case 6:
			listin = window.open(u,nm,'scrollbars=yes,'+position);
			break;
  	case 7:
			listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,'+position);
  		break;
	}
	listin.focus();
	return listin;
}

function CenterWindow(u, w1, h1, tp) {
 	var name = getNameFromUrl(u);
	CenterNamedWindow(u, name, w1, h1, tp);
}

function isIE() {
	if (document.all) {
		// IE
		return true;
	} else {
		return false;
	}
}

function getPdfForms(url) {
	CenterNamedWindow(url, 'pdf', 800, 600, 2).focus();
}

function confirmDelete(url) {
	if (confirm("Esta usted seguro que desea eliminar este registro?")) {
		window.location.href = url;
	} 
}	

function escapeURLParam(url) {
	return url.replace(/'/g, "\\'");
}

function eIBSPrint() {
	window.focus();
	window.print();
	return;
}

function getMSIEVer() {
	return (EIBS.BrowserDetect.version);
}

/*
 * CHROMELESS WINDOWS v.35.1 [ 8.1K ] Licensed under GNU LGPL (www.gnu.org)
 * 
 * (c) Gabriel Suchowolski,2000 >> www.microbians.com Thanks to Gustavo Ponce >>
 * www.urbanlove.org (resize addon)
 */

function chromeless(u, n, W, H, X, Y, cU, cO, cL, mU, mO, xU, xO, rU, rO, tH,
		tW, wB, wBs, wBG, wBGs, wNS, fSO, brd, max, min, res, tsz) {
	var c = (document.all && navigator.userAgent.indexOf("Win") != -1) ? 1 : 0;
	var v = navigator.appVersion.substring(navigator.appVersion
			.indexOf("MSIE ") + 5, navigator.appVersion.indexOf("MSIE ") + 8);
	min = (v >= 5.5 ? min : false);
	var w = window.screen.width;
	var h = window.screen.height;
	var W = W || w;
	W = (typeof (W) == 'string' ? Math.ceil(parseInt(W) * w / 100) : W);
	W += (brd * 2 + 2) * c;
	var H = H || h;
	H = (typeof (H) == 'string' ? Math.ceil(parseInt(H) * h / 100) : H);
	H += (tsz + brd + 2) * c;
	var X = X || Math.ceil((w - W) / 2);
	var Y = Y || Math.ceil((h - H) / 2);
	var s = ",width=" + W + ",height=" + H;

	if (c) {
		var cTIT = '\n'
				+ '<html><head><META HTTP-EQUIV="imagetoolbar" CONTENT="no">\n'
				+ '<script>\n'
				+ 'var IcU=new Image();IcU.src="'
				+ cU
				+ '";var IcO=new Image();IcO.src="'
				+ cO
				+ '";var IcL=new Image();IcL.src="'
				+ cL
				+ '";var IxU=new Image();IxU.src="'
				+ xU
				+ '";var IxO=new Image();IxO.src="'
				+ xO
				+ '";var IrU=new Image();IrU.src="'
				+ rU
				+ '";var IrO=new Image();IrO.src="'
				+ rO
				+ '";var ImU=new Image();ImU.src="'
				+ mU
				+ '";var ImO=new Image();ImO.src="'
				+ mO
				+ '"\n'
				+ 'document.onmousemove=document.onselectstart=document.ondragstart=document.oncontextmenu=new Function("wMOV();return false");\n'
				+ 'b=-1\n'
				+ 'wLOA=function(){if(top.ok&&document.body){'
				+ (min ? 'bMIN.style.visibility="visible";' : '')
				+ 'bLOA.style.visibility="hidden";wRSZ()}else setTimeout("wLOA()",500)};wLOA()\n'
				+ 'wRSZ=function(){var dw=document.body.clientWidth;bCLO.style.pixelLeft=dw-22;bMIN.style.pixelLeft=bLOA.style.pixelLeft=dw-62;bFUL.style.pixelLeft=bRES.style.pixelLeft=dw-42}\n'
				+ 'wMAX=function(m){top.mod=m;if(m){top.mT(0,0);top.rT('
				+ w
				+ ','
				+ h
				+ ');bFUL.style.visibility="hidden";bRES.style.visibility="visible"}else{top.mT(top.px,top.py);top.rT(top.sW,top.sH);bFUL.style.visibility="visible";bRES.style.visibility="hidden"}}\n'
				+ 'wDBL=function(){if(!top.mod)wMAX(1);else wMAX(0)}\n'
				+ 'wMIN=function(){top.window.moveTo(0,-4000);if(top.opener&&!top.opener.closed){top.opener.window.focus()};top.window.blur()}\n'
				+ 'wMOV=function(){\n'
				+ 'if(b==0){top.bCOL("'
				+ wBG
				+ '","'
				+ wB
				+ '");b=-1}\n'
				+ 'if(b==2&&!top.mod){top.px=event.screenX-ofx-1;top.py=event.screenY-ofy-1;top.mT(top.px,top.py)}\n'
				+ 'if(b==1){top.bCOL("'
				+ wBGs
				+ '","'
				+ wBs
				+ '");ofx=event.x;ofy=event.y;b=2}\n'
				+ '}</script></head>\n'
				+ '<body onresize="wRSZ()" bgcolor='
				+ wBG
				+ '>\n'
				+ '<div style="position:absolute;left:5px;top:4px;width:2000px">'
				+ tH
				+ '</div>\n'
				+ '<img id=bMOV style="position:absolute;left:-50px;top:-50px" '
				+ (max ? 'ondblclick="wDBL()"' : '')
				+ ' onmousemove="wMOV()" onmousedown="b=1;wMOV()" onmouseup="b=0;wMOV()" border=0 src="" width=2000 height=2000>\n'
				+ '<img id=bFUL style="position:absolute;top:4px;left:'
				+ (W - 42)
				+ 'px;'
				+ (max ? '' : 'display:none')
				+ '" src="'
				+ xU
				+ '" border=0 width=11 height=11 onmouseover="this.src=IxO.src" onmouseout="this.src=IxU.src" onmouseup="this.src=IxU.src" onmousedown="this.src=IxU.src" onclick="wMAX(1)">\n'
				+ '<img id=bRES style="position:absolute;top:4px;left:'
				+ (W - 42)
				+ 'px;visibility:hidden" src="'
				+ rU
				+ '" border=0 width=11 height=11 onmouseover="this.src=IrO.src" onmouseout="this.src=IrU.src" onmouseup="this.src=IrU.src" onmousedown="this.src=IrU.src" onclick="wMAX(0)">\n'
				+ '<img id=bCLO style="position:absolute;top:4px;left:'
				+ (W - 22)
				+ 'px;" src="'
				+ cU
				+ '" border=0 width=11 height=11 onmouseover="this.src=IcO.src" onmouseout="this.src=IcU.src" onmouseup="this.src=IcU.src" onmousedown="this.src=IcU.src" onclick="top.window.close()">\n'
				+ '<img id=bLOA style="position:absolute;top:4px;left:'
				+ (W - 62)
				+ 'px;" src="'
				+ cL
				+ '" border=0 width=11 height=11>\n'
				+ '<img id=bMIN style="position:absolute;top:4px;left:'
				+ (W - 62)
				+ 'px;visibility:hidden" src="'
				+ mU
				+ '" border=0 width=11 height=11 onmouseover="this.src=ImO.src" onmouseout="this.src=ImU.src" onmouseup="this.src=ImU.src" onmousedown="this.src=ImU.src" onclick="wMIN()">\n'
				+ '</body>\n' + '</html>';

		cTIT = cTIT.replace(/\//g, "\\\/").replace(/\"/g, "\\\"").replace(
				/\n/g, "\\n");

		cRES = function(b, s) {
			var tmp = '\n'
					+ '<html><head><META HTTP-EQUIV="imagetoolbar" CONTENT="no">\n'
					+ '<script>\n'
					+ 'document.onmousemove=document.onselectstart=document.ondragstart=document.oncontextmenu=new Function("wMOV();return false");\n'
					+ 'b=-1\n'
					+ 'wMOV=function(){if(!top.mod){\n'
					+ 'if(b==0){top.sH=top.fH;top.sW=top.fW;b=-1}\n'
					+ 'if(b==2&&(1=='
					+ b
					+ '||4=='
					+ b
					+ '||5=='
					+ b
					+ ')){tmp=event.screenY-oH;if(top.sH+tmp>100){top.fH=top.sH+tmp}}\n'
					+ 'if(b==2&&(2=='
					+ b
					+ '||4=='
					+ b
					+ ')){tmp=event.screenX-oW;if(top.sW-tmp>100){top.fW=top.sW-tmp;top.px=event.screenX-ofx-1}}\n'
					+ 'if(b==2&&(3=='
					+ b
					+ '||5=='
					+ b
					+ ')){tmp=event.screenX-oW;top.fW=top.sW+tmp}\n'
					+ 'if(b==2){setTimeout("top.rT(top.fW,top.fH);top.mT(top.px,top.py);",10)}\n'
					+ 'if(b==1){ofx=event.x;oH=event.screenY;oW=event.screenX;b=2}\n'
					+ '}}</script></head>\n'
					+ '<body bgcolor='
					+ wBG
					+ '>\n'
					+ '<img style="cursor:'
					+ s
					+ '-resize" id=bMOV style="position:absolute;left:-50px;top:-50px" onmousemove="wMOV()" onmousedown="b=1;wMOV()" onmouseup="b=0;wMOV()" border=0 src="" width=3000 height=2000>\n'
					+ '</body>\n' + '</html>';
			return tmp.replace(/\//g, "\\\/").replace(/\"/g, "\\\"").replace(
					/\n/g, "\\n");
		};

		var cRESd = cRES(1, 's'), cRESl = cRES(2, 'w'), cRESr = cRES(3, 'e'), cRESbl = cRES(
				4, 'sw'), cRESbr = cRES(5, 'se');

		var cFRM = '<HTML><HEAD><TITLE>'
				+ tW
				+ '</TITLE>\n'
				+ '<script>\n'
				+ 'ok=0;mod=0;sH=fH='
				+ (H)
				+ ';sW=fW='
				+ (W)
				+ ';px='
				+ (X)
				+ ';py='
				+ (Y)
				+ '\n'
				+ 'bCOL=function(c1,c2){fT.document.bgColor=n0.document.bgColor=n1.document.bgColor=n2.document.bgColor=n3.document.bgColor=n4.document.bgColor=c1;bL.document.bgColor=bT.document.bgColor=bR.document.bgColor=bB.document.bgColor=c2}\n'
				+ 'mTIT=function(){if(frames.length>8){fT.document.write("'
				+ cTIT
				+ '");fT.document.close();if ('
				+ res
				+ '){n2.document.write("'
				+ cRESd
				+ '");n2.document.close();n1.document.write("'
				+ cRESr
				+ '");n1.document.close();n0.document.write("'
				+ cRESl
				+ '");n0.document.close();n3.document.write("'
				+ cRESbl
				+ '");n3.document.close();n4.document.write("'
				+ cRESbr
				+ '");n4.document.close()};top.bCOL("'
				+ wBG
				+ '","'
				+ wB
				+ '")}else{setTimeout("mTIT()",20)}}\n'
				+ 'mT=function(x,y){top.window.moveTo(x,y)}\n'
				+ 'rT=function(w,h){top.window.resizeTo(w,h)}\n'
				+ 'top.rT(fW,fH);top.mT(px,py)\n'
				+ 'mTIT()\n'
				+ '</script></HEAD>\n'
				+ '<frameset onselectstart="return false" onload="top.ok=1" onfocus="if (top.ok&&fT&&fT.wMAX) fT.wMAX(top.mod)" border=0 framespacing=0 frameborder=0 rows="'
				+ tsz
				+ ',100%,'
				+ brd
				+ '">\n'
				+ '	<frame name=fT src="about:blank" scrolling=no noresize>\n'
				+ '	<frameset border=0 framespacing=0 frameborder=0 cols="'
				+ brd
				+ ',1,100%,1,'
				+ brd
				+ '">\n'
				+ '		<frame name=n0 src="about:blank" scrolling=no noresize>\n'
				+ '		<frame name=bL src="about:blank" scrolling=no noresize>\n'
				+ '			<frameset border=0 framespacing=0 frameborder=0 rows="1,100%,1">\n'
				+ '				<frame name=bT src="about:blank" scrolling=no noresize>\n'
				+ '				<frame name=frm_main src="'
				+ u
				+ '" '
				+ fSO
				+ '>\n'
				+ '				<frame name=bB src="about:blank" scrolling=no noresize>\n'
				+ '			</frameset>\n'
				+ '		<frame name=bR src="about:blank" scrolling=no noresize>\n'
				+ '		<frame name=n1 src="about:blank" scrolling=no noresize>\n'
				+ '	</frameset>\n'
				+ '	<frameset border=0 framespacing=0 frameborder=0 cols="'
				+ brd + ',100%,' + brd + '">\n'
				+ '		<frame name=n3 src="about:blank" scrolling=no noresize>\n'
				+ '		<frame name=n2 src="about:blank" scrolling=no noresize>\n'
				+ '		<frame name=n4 src="about:blank" scrolling=no noresize>\n'
				+ '	</frameset>\n' + '</frameset>\n' + '</HTML>';

		var CWIN = window.open("", n, "fullscreen=1" + s);
		CWIN.moveTo(5000, 0);
		CWIN.ft = true;
		CWIN.document.write(cFRM);
		CWIN.document.close();
	} else {
		CWIN = window.open(u, n, wNS + s, true);
		CWIN.moveTo(X, Y);
	}
	CWIN.focus();
	CWIN.setURL = function(u) {
		if (this && !this.closed) {
			if (this.frames.frm_main)
				this.frames.frm_main.location.href = u;
			else
				this.location.href = u;
		}
	};
	CWIN.closeIT = function() {
		if (this && !this.closed)
			this.close();
	};
	return CWIN;
}

function openIT(u, W, H) {
	var n = 'eibs';
	var X = null;
	var Y = null;
	var cU = EIBS.imgPath() + 'close_up.gif';
	var cO = EIBS.imgPath() + 'close_ovr.gif';
	var cL = EIBS.imgPath() + 'clock.gif';
	var mU = EIBS.imgPath() + 'min_up.gif';
	var mO = EIBS.imgPath() + 'min_ovr.gif';
	var xU = EIBS.imgPath() + 'max_up.gif';
	var xO = EIBS.imgPath() + 'max_ovr.gif';
	var rU = EIBS.imgPath() + 'res_up.gif';
	var rO = EIBS.imgPath() + 'res_ovr.gif';
	var tH = '<font face=verdana size=1>eIBS - Datapro, Inc.</font>';
	var tW = 'eIBS - Datapro, Inc.';
	var wB = '#000000';
	var wBs = '#FFFFFF';
	var wBG = '#ABBAD3';
	var wBGs = '#ABBAD3';
	var wNS = 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0';
	var fSO = 'scrolling=yes noresize';
	var brd = 10;
	var ful = true;
	var min = false;
	var res = true;
	var tsz = 20;
	chromeless(u, n, W, H, X, Y, cU, cO, cL, mU, mO, xU, xO, rU, rO, tH, tW,
			wB, wBs, wBG, wBGs, wNS, fSO, brd, ful, min, res, tsz);
}

function scriptLog(m, isError){
	(window.console && console.log(m)) || (isError && alert(m));	
}

function defer(waitConditionMet, method) {
	var executeMethod = typeof waitConditionMet === 'function' ? waitConditionMet() : waitConditionMet;
    if (executeMethod){
    	if(typeof method ==='function') { 
    		console.log(method);
    		method();
    	} else {
    		console.log(method);
    	}
    }else{
        setTimeout(function() { defer(waitConditionMet, method); }, 50);
    }
}
///////////////////////////////////////////////////////////////////////////////////
/*
	Attached EVENTS to WINDOW
	Closes Error Window
	Removes Filter
*/
///////////////////////////////////////////////////////////////////////////////////
//document.onmousedown = right;
document.onkeyup = autotab;
window.onafterprint = RestoreFilter;
window.onbeforeprint = RemoveFilter;
window.onunload = closeError;

