function getStyleSheet(unique_title) {
  for(var i=0; i<document.styleSheets.length; i++) {
    var sheet = document.styleSheets[i];
    if(sheet.title == unique_title) {
      return sheet;
    }
  }
}

function insertSheetRule(unique_title, rule){
	//".have-border { border: 1px solid black;}"
	var styleS = getStyleSheet(unique_title); 
	if (styleS.addRule) {
		styleS.addRule(selector, rule, index);			
	} else {
		styleS.insertRule(rule, 0);
	}	
}

function removeSheetRule(unique_title){
	var styleS = getStyleSheet(unique_title); 
	if (styleS.removeRule) {
		styleS.removeRule(0);			
	} else {
		styleS.deleteRule(0);
	}	
}

function insertSheet(){
	var sheet = document.createElement('style');
	sheet.innerHTML = ".defaultLabel_off {color: #CCC;}";
	document.body.appendChild(sheet);
}
insertSheet();

function cancelBub(evt){
	if (window.event) {
		window.event.cancelBubble = true;
	} else {
		if (isValidObject(evt)) {
			evt.cancelBubble = true;
			evt.stopPropagation();
		}
	}
}

function isValidObject(obj) {
	return (obj != null && typeof(obj) !== 'undefined');
}

function GetElement(name){
	var elem = document.getElementById(name);
	if(!elem){
		var elems = document.getElementsByName(name);
		if(elems.length > 0){
			elem = elems[0];
		}
	}
	return elem;
}

function clearSelect(select){
	var eachGroup = select.firstChild;
	while (eachGroup) {
		lastGroup = eachGroup;
		eachGroup = lastGroup.nextSibling;
		select.removeChild(lastGroup);
	}
}

function parseSelectXML(xmlResponse){
	if (isValidObject(xmlResponse)) {
		$(xmlResponse).find('select').each(function(){
			var select = document.getElementById($(this).attr('id'));
			var selectedValue = '';
			if(select.selectedIndex > -1){
				selectedValue = select.options[select.selectedIndex].value;
			}
			clearSelect(select);
			$(xmlResponse).find('optgroup').each(function(){
				var group = document.createElement("optgroup");
	  			group.label = $(this).attr('label');
				$($(this)).find('option').each(function(){
					var optValue = $(this).attr('value');
					var option = document.createElement("option");
					option.value = optValue;
					option.appendChild(document.createTextNode($(this).text()));
																
					if(optValue == selectedValue){
						option.setAttribute('selected', 'selected');
					}
					group.appendChild(option);
				});
				select.appendChild(group);
			});
			select.style.display='none';
			select.style.display='inline';
		});		
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
				} else {
					elem.value = '';
				}
			}
			srcElement = elem;
		}
	}
}
function doSelectFilter(srcElement, force){
	if(force || (srcElement.selectedIndex > -1 && srcElement.options[srcElement.selectedIndex].value != '')){
		$(srcElement.id).children('option[value="defaultLabel_off"]').remove();
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
	elem.onclick();
}
