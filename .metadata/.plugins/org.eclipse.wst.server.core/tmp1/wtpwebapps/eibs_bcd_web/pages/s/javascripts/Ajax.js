//author: fhernandez

//display wait function icon
function callWaiting(divName, waitImage, waitLabel){
  	var mWaitDiv = document.getElementById(divName);
   	mWaitDiv.innerHTML = "";
  	var iconWait = document.createElement('img');
   	iconWait.setAttribute("src", waitImage);
   	iconWait.setAttribute("align", "absbottom" );
   	iconWait.setAttribute("border", "0");
    var textWait=document.createElement("span").appendChild(document.createTextNode(waitLabel));
    mWaitDiv.appendChild(iconWait);
    mWaitDiv.appendChild(textWait);
}

function EventElement(evt) {
    evt = (evt) ? evt : ((window.event) ? window.event : "");
	var elem;
    if (evt) {
        if (evt.target) {
			elem = evt.target;
			while(elem.nodeType != elem.ELEMENT_NODE){
				elem = elem.parentNode;
			}
        } else {
            elem = evt.srcElement;
        }
    }
    return elem;
}

function getElement(name) {
	var elem = document.getElementById(name);
	if (!elem) {
		var elems = document.getElementsByName(name);
		if (elems.length > 0) {
			elem = elems[0];
		}
	}
	return elem;
}

function CallbackObject() {
	this.ajax;
	this.callback;
}

function CreateXMLHttpRequest() {
	try { return new XMLHttpRequest(); } catch(e) {}
	try { return new ActiveXObject("Msxml2.XMLHTTP"); } catch (e) {}
	try { return new ActiveXObject("Microsoft.XMLHTTP"); } catch (e) {}
	return null;
}
//Parameter Asynchronus takes values: true or false
function GetXMLResponse(URL, callbackObject, asynchronus){
	ajax = CreateXMLHttpRequest();
	CallbackObject.ajax = ajax;
	ajax.onreadystatechange = callbackObject;
	ajax.open("GET", URL, asynchronus);
	ajax.send(null);
}

function PostXMLRequest(URL, data, callbackObject, asynchronus){
	ajax = CreateXMLHttpRequest();
	CallbackObject.ajax = ajax;
	ajax.onreadystatechange = ReadyStateHandler(callbackObject);
	ajax.open("POST", URL, asynchronus);
    ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send(data);
}

function XMLResponse(ajax){
	// Comprobamos si la peticion se ha completado (estado 4) 
	if( ajax.readyState == 4 ) {
		// Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
		if( ajax.status == 200 ) {
	    	// Escribimos el resultado en la pagina HTML mediante DHTML	
			return ajax.responseXML;
		}
	}
}

function TextResponse(ajax){
	// Comprobamos si la peticion se ha completado (estado 4) 
	if( ajax.readyState == 4 ) {
		// Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
		if( ajax.status == 200 ) {
	    	// Escribimos el resultado en la pagina HTML mediante DHTML			
			return ajax.responseText;
		}
	}
}

function ReadyStateHandler(callbackHandler) {
  	// Return an anonymous function that listens to the 
  	// XMLHttpRequest instance
  	return function () {
	    // If the request's status is "complete"
	    if (CallbackObject.ajax.readyState == 4) {
	    	// Check that a successful server response was received
	      	if (CallbackObject.ajax.status == 200) {
	        	// Pass the payload of the response to the handler function
	        	callbackHandler(CallbackObject.ajax);
	      	} else {
	        	// An HTTP problem has occurred
	        	alert("HTTP error: " + CallbackObject.ajax.status);
	      	}
	    }
  	};
}

function selectCallback(){
	xmlResponse = XMLResponse(CallbackObject.ajax);	
	if(xmlResponse){
		var xmlSerial;
		if(isValidObject(window.XMLSerializer)){
			xmlSerial = new XMLSerializer();
		}
	    var items = xmlResponse.getElementsByTagName('select');
		for (var i = 0 ; i < items.length ; i++) {
			var item = items.item(i);
			var control = getElement(item.getAttribute("name"));
			if (isValidObject(control)) {
				control.outerHTML=(item.xml ? item.xml : xmlSerial.serializeToString(item));
			}
		}
	}
}

function inputCallback(){
	xmlResponse = XMLResponse(CallbackObject.ajax);	
	if(xmlResponse){
		var xmlSerial;
		if(isValidObject(window.XMLSerializer)){
			xmlSerial = new XMLSerializer();
		}
	    var items = xmlResponse.getElementsByTagName('input');
		for (var i = 0 ; i < items.length ; i++) {
			var item = items.item(i);
			var control = getElement(item.getAttribute("name"));
			if (isValidObject(control)) {
				control.outerHTML=(item.xml ? item.xml : xmlSerial.serializeToString(item));
			}
		}
	}
}

function tableCallback(){
	xmlResponse = XMLResponse(CallbackObject.ajax);
	if(xmlResponse){
		var xmlSerial;
		if(isValidObject(window.XMLSerializer)){
			xmlSerial = new XMLSerializer();
		}
	    var items = xmlResponse.getElementsByTagName('table');
		for (var i = 0 ; i < items.length ; i++) {
			var item = items.item(i);
			var control = document.getElementById(item.getAttribute("id"));
			if (isValidObject(control)) {
				control.outerHTML=(item.xml ? item.xml : xmlSerial.serializeToString(item));
			}
		}
	}
}

function divCallback(){
	xmlResponse = XMLResponse(CallbackObject.ajax);
	if(xmlResponse){
		var xmlSerial;
		if(isValidObject(window.XMLSerializer)){
			xmlSerial = new XMLSerializer();
		}
	    var items = xmlResponse.getElementsByTagName('div');
		for (var i = 0 ; i < items.length ; i++) {
			var item = items.item(i);
			var control = document.getElementById(item.getAttribute("id"));
			if (isValidObject(control)) {
				control.outerHTML=(item.xml ? item.xml : xmlSerial.serializeToString(item));
			}
		}
	}
}

function functionCallback(){
	txtResponse = TextResponse(CallbackObject.ajax);
	if (txtResponse) {
		var tmpFunc = new Function(txtResponse);
		tmpFunc(); 	
	}
}

/*
	Function That Revlautes DOM ELEMENTS with JSON DATA counterpart.
*/
function putDataFromJson(json , preventEvents) {
	var formLength = document.forms[0].elements.length;
	for (var n=0; n<formLength; n++) {
		var elementName = document.forms[0].elements[n].name;
		var elementType = document.forms[0].elements[n].type;
		if (json.hasOwnProperty(elementName)) {
			if (elementType == 'radio' || elementType == 'checkbox') {
				var radio = document.getElementsByName(document.forms[0].elements[n].name);
				if (typeof json[elementName] == 'boolean') {
					for (var i=0; i<radio.length; i++) {
						if (json[elementName]) {
							if (radio[i].value == "true") {
								radio[i].checked = true;
							} else {
								radio[i].checked = false;
							}
						} else {
							if (radio[i].value == "false") {
								radio[i].checked = true;
							} else {
								radio[i].checked = false;
							}
						}
					}
				} else {
					for (var i=0; i<radio.length; i++) {
						if (radio[i].value == json[elementName]) {
							radio[i].checked = true;
						} else {
							radio[i].checked = false;
						}
					}
				}
			} else {
				if (typeof json[elementName] == 'object') {
					if (json[elementName].date) {
						var date = new Date(json[elementName].time);
						var day = date.getDate();
						day = day > 9 ? day : "0" + day;
						var month = date.getMonth() + 1;
						month = month > 9 ? month : "0" + month;
						document.forms[0].elements[n].value = day + "/" + month + "/" + date.getFullYear();
					} else {
						document.forms[0].elements[n].value = json[elementName].value;
					}
				} else {
					document.forms[0].elements[n].value = json[elementName];
				}
			}
			if(!preventEvents) goOnchange(document.forms[0].elements[n]);
		} else {
			var character = elementName.charAt(0);
			if (character == character.toUpperCase()) {
				elementName = character.toLowerCase() + elementName.substr(1);
				if (json.hasOwnProperty(elementName)) {
					if (elementType == 'radio' || elementType == 'checkbox') {
						var radio = document.getElementsByName(document.forms[0].elements[n].name);
						if (typeof json[elementName] == 'boolean') {
							for (var i=0; i<radio.length; i++) {
								if (json[elementName]) {
									if (radio[i].value == "true") {
										radio[i].checked = true;
									} else {
										radio[i].checked = false;
									}
								} else {
									if (radio[i].value == "false") {
										radio[i].checked = true;
									} else {
										radio[i].checked = false;
									}
								}
							}
						} else {
							for (var i=0; i<radio.length; i++) {
								if (radio[i].value == json[elementName]) {
									radio[i].checked = true;
								} else {
									radio[i].checked = false;
								}
							}
						}
					} else {
						document.forms[0].elements[n].value = json[elementName];
					}
					if(!preventEvents) goOnchange(document.forms[0].elements[n]);
				}
			}	
		}
	}
}


