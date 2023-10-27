//author: fhernandez
function getElement(name) {
	return getElementFromDocument(document,name);
}

function showTab(tab, index, name, length){
  	$(".data"+tab).hide();
  	for(var i=0;i<length;i++){
		getElement(tab+i).className="tabnormal";
   		getElement("data"+tab+i).style.display="none";
   	}
	getElement(tab+index).className="tabhighlight";  
	getElement("data"+tab+index).style.display="";
	setHelp(getElement(name));
}

function setDisplay(elemRef, visib){
	if (isValidObject(elemRef) && isValidObject(elemRef.style)) {
		elemRef.style.display = visib;
	}
}

function showBlocks(tag, option, prop){
	var optionSel = document.getElementById('SWF_'+tag);
	if(isValidObject(optionSel)){
		optionSel.style.display = prop;
	}
	var elemLabel = document.getElementById('LBL_'+tag);
	if(isValidObject(elemLabel)){
		elemLabel.style.display = prop;
	}
	showOptions(tag, option, prop);
}

function showOptions(tag, option, prop){
	var id = tag + option;
	var elemBlock = document.getElementById('SWB_'+id);
	if(isValidObject(elemBlock)){
		elemBlock.style.display = prop;
	}
	for(var i = 1; i <= 5; i++){
		var elemLabel = document.getElementById('LBL_'+id+'_'+i);
		if(isValidObject(elemLabel)){
			elemLabel.style.display = prop;
		} else {
			elemLabel = document.getElementById('LBL_'+tag+'_'+i);
			if(isValidObject(elemLabel)){
				elemLabel.style.display = prop;
			}
		}
		for (var j = 1; j <= 3; j++){
			var elemInput = document.getElementById('SWF_'+id+'_'+i+'_'+j);
			if(isValidObject(elemInput)){
				elemInput.style.display = prop;
			} else {
				elemInput = document.getElementById('SWF_'+tag+'_'+i);
				if(isValidObject(elemInput)){
					elemInput.style.display = prop;
				}
			}
			
			var elemHelp = document.getElementById('SWH_'+id+'_'+i+'_'+j);
			if(isValidObject(elemHelp)){
				elemHelp.style.display = prop;
			} else {
				elemHelp = document.getElementById('SWH_'+tag+'_'+i);
				if(isValidObject(elemHelp)){
					elemHelp.style.display = prop;
				}
			}
		}
	}
}

function setField(target, field, option, line) {
	if (field.indexOf("SWF_") == -1 ) {
		field = "SWF_"+field;
	}
    var value = "";
    for (var i = 1; i <= 3; i++) {
		var elem = getElement(field + option + '_' + line + '_' + i);
		if(!isValidObject(elem)){
			elem = getElement(field + '_' + i);
	    }
	    if(!isValidObject(elem)){
			elem = getElement(target.id + '_' + i);
			if(!isValidObject(elem)){
				if(i == 1) elem = target;
			}
	    }
		if(isValidObject(elem)){
			if (option == "F") {
				if (i == 1) {
					value = elem.value;
				} else {
					value = value + '/' + elem.value;
				}
			} else {
				value = elem.value;
			}
		}
    }
    target.value = value;
}

function isOptionFAccount(value) {
	return  !( value === "ARNU" || value === "CCPT" || value === "CUST" || value === "DRLC"
			|| value === "EMPL" || value === "NIDN" || value === "SOSE" || value === "TXID" );
}

function setAccountField(target, field, option){
  	var via = getElement('paymentVia').value;
	if(isSWIFT(via) && option == 'F') {
		var fType = getElement(field+option+'_1_1');
		if(isValidObject(fType) && !isOptionFAccount(fType.value)){
			setDisplay(getElement("SWB_"+field+option), "none");
		} else {
			setDisplay(getElement("SWB_"+field+option), "inline");
		}
	}
  	setField(target, field, option, 1);
}

function setHelp(obj){
	if (!isValidObject(obj)) {
		return;
	}
	var name = obj.id;
	var value = obj.value;
	var tag = trim(name.substring(name.length-2, name.length));
	var sel = tag;
	if(tag == '58'){
		sel = "59";
	}
	
	if(name == 'SWF_50'){
		getElement("origOption").value = value;
		
	} else if(name == 'SWF_58'){
		//Also tag 58
		getElement("beneOption").value = value;
	} else if(name == 'SWF_59'){
		getElement("beneOption").value = value;
	}
	
	$(".swf_field_"+tag).hide();
	showBlocks(tag,value,'inline');
	
	$(".swf_field_"+sel).hide();
	showBlocks(sel,value,'inline');
	
	if (name == 'SWF_58') {
		setDisplay(getElement('SWF_59'), 'none');
		setDisplay(getElement('LBL_59'), 'none');
	} else if (name == 'SWF_59') {
		setDisplay(getElement('SWF_58'), 'none');
		setDisplay(getElement('LBL_58'), 'none');
	}
	
	if(getElement("tranferType").value == 'IT'){
		//Tags 50 and 59 are default for internal transfers
		setDisplay(getElement('SWF_50'), 'none');
		setDisplay(getElement('SWF_59'), 'none');
	}
}

function isSWIFT(via){
	return via == '3' || via == '4' || via == '5' || via == '7';
}

function SetVia(type, value){
	if(value == '' || value == 'G'){
		setDisplay(getElement('beneAccountCheck'), 'none');
		setDisplay(getElement('beneNameCheck'), 'none');
		
		setHelp(getElement("SWF_50"));
		setHelp(getElement("SWF_59"));
	} else {		
		if(value == '5' || value == '7'){
		
			setHelp(getElement("SWF_50"));
			setHelp(getElement("SWF_58"));
		} else {
			setDisplay(getElement('beneAccountCheck'), 'inline');
			setDisplay(getElement('beneNameCheck'), 'inline');
		
			setHelp(getElement("SWF_50"));
			setHelp(getElement("SWF_59"));
		}
	}
	if(!isSWIFT(value)){
	  	getElement("origOption").value = '';
  	  	getElement("beneOption").value = '';
  	  	setDisplay(getElement('SWF_50'), 'none');
  	  	setDisplay(getElement('SWF_59'), 'none');
	} else if(value == '5'){
	  	getElement("origOption").value = '';
  	  	setDisplay(getElement('SWF_50'), 'none');
	}
	var externalType = getElement('externalType');
	var externalInfo = getElement('externalInfo');
	var externalDiv = getElement('externalDiv');
	if (type=="IT") {
		setDisplay(externalType, 'none');
		setDisplay(externalInfo, 'none');
		setDisplay(externalDiv, 'none');
  	  	getElement('SWH_50_1').style.display = 'inline';
  	  	getElement('SWH_59_1_1').style.display = 'inline';
	} else {
		setDisplay(externalType, 'inline');
		setDisplay(externalInfo, 'inline');
		setDisplay(externalDiv, 'inline');
  	  	if (type=="OW") {
  	  		getElement('SWH_59_1_1').style.display = 'none';
			getElement('SWH_50_1').style.display = 'inline';
  	  	} else {
  	  		getElement('SWH_50_1').style.display = 'none';
  	  		getElement('SWH_59_1_1').style.display = 'inline';
  	  	}
	}
	if(value == '7'){
		setDisplay(getElement('otherTags'), 'inline');
	} else {
		setDisplay(getElement('otherTags'), 'none');
	}
}

function buildField(name, row, lnt ) {
    
	field = getElement(name);
	field.value = '';
	for (var x=1; x<=row; x++) {
  		subname = name + '_' + x;
  		subfield = getElement(subname); 
  		var v1 = subfield.value;
  		if (v1.length < 35 && lnt > 35 ) {
    		for (var i = v1.length; i < 35; i++) {
     			v1 = v1 + ' ';
    		}
  		}
  		field.value = field.value.concat(v1);
	}  
}

function swiftOptions(select, items, selectedValue) {
	clearSelect(select);
	for (var i = 0; i < items.length; i++) {
		appendOption(select, items[i], selectedValue);
	}
}