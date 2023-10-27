// written by fhernandez 
//Addendum Jorge Buitrago

function addEventHandler(elem, eventType, handler) {
    if (elem.addEventListener)
        elem.addEventListener (eventType, handler, false);
    else if (elem.attachEvent)
        elem.attachEvent ('on' + eventType, handler); 
    else
		elem['on'+eventType] = handler;
}

function addEvent(elem, name, callback) {
	addEventHandler(elem, name, callback);
}

function removeEvent(obj, type, callback) {
	if (obj.removeEventListener)
		obj.removeEventListener( type, callback, false );
	else if (obj.detachEvent)
	{
		obj.detachEvent( "on"+type, obj[type+callback] );
		obj[type+callback] = null;
		obj["e"+type+callback] = null;
	}
}

function getEvent(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	return evt;
}

function EventElement(evt) {
	var evt = getEvent(evt);
	var elem;
    if (isValidObject(evt)) {
        if (isValidObject(evt.target)) {
			elem = evt.target;
			while(elem.nodeType != 1){
				elem = elem.parentNode;
			}
        } else {
            elem = evt.srcElement;
        }
    }
    return elem;
}

function EventDispatcher(obj, evt, name) {
	if(obj.dispatchEvent){
		//evt.initEvent(name, true, false );
		obj.dispatchEvent(evt);
	} else if(obj.fireEvent){
		obj.fireEvent("on"+name, evt);
	}
}

function EventShooter(obj, name) {
	var doc = obj.ownerDocument;
	var win = doc.defaultView || doc.parentWindow;
	var evt;
	if (typeof win.Event == "function"){
	  evt = new win.Event(name);
	} else if(win.document.createEvent){
		if(name == "abort" || name == "blur" || name == "change"
			|| name == "error" || name == "focus" || name == "load"
			|| name == "reset" || name == "resize" || name == "scroll"
			|| name == "select" || name == "submit" || name == "unload"){
			evt = win.document.createEvent('HTMLEvents');
		} else if(name == "keydown" || name == "keypress" || name == "keyup"){
			evt = win.document.createEvent('MouseEvents');
		} else if(name == "click" || name == "mousedown" || name == "mousemove"
			|| name == "mouseout" || name == "mouseover" || name == "mouseup"){
			evt = win.document.createEvent('MouseEvents');
		} else if (name == "contextmenu"){
			evt = win.document.createEvent('MouseEvents');
		} else {
			evt = win.document.createEvent('Event'); //Custom Event 
		}
		evt.initEvent(name, true, false );
	}
	EventDispatcher(obj, evt, name);
}

function EventTrigger(obj, name){
	if (isValidObject(obj)) {
		var doc = obj.ownerDocument;
		var win = doc.defaultView || doc.parentWindow;
		if(typeof obj["on"+name] === "function") {
			obj["on"+name](); 
		} else if(typeof obj["trigger"] === "function") {
			obj.trigger(name);
		} else {
			if(isValidObject(win.jQuery)){
				win.jQuery(obj).trigger("change");
			} else {
				EventShooter(obj, name);
			}
		}
	}
}

function EventKeyCode(evt) {
	var evt = getEvent(evt);
	var keycode;
	if (isValidObject(evt)) {
		if (isValidObject(evt.which)) {
			keycode = evt.which;
		} else {
			keycode = evt.keyCode;
		}
	}
	return keycode;
}

function chainEvents(elem, onEvent, callEvent) {
	if(isValidObject(elem)){
		addEvent(elem, onEvent, function(evt) {
			EventShooter(EventElement(evt), callEvent);
		}, true);
	}
}

function cancelEvent(event) {
    if ('cancelable' in event) {// all browsers except IE before version 9
            					// in Firefox, the cancelable property always returns true,
            					// so the cancelable state of the event cannot be determined
        if (event.cancelable) {
        	event.which = 0;
            event.preventDefault();
        }
    	if ('bubbles' in event) {   // all browsers except IE before version 9
            if (event.bubbles) {
                event.stopPropagation();
            }
    	}    
    } else {  // IE before version 9
    	event.keyCode = 0;
        event.returnValue = false;
        event.cancelBubble = true;
    }
}

/////////////////////   TRIGGER/ASIGN EVENTS //////////////////////////////////
//Triggers Onchange in the context of opener.document

function triggerOnchangeOpener(elementName){
	if(	isValidObject( window.opener || top.opener)){
		var formDummy = top.opener.document.forms[0];
		if(	isValidObject( formDummy[elementName] )){
			EventTrigger(formDummy[elementName], "change");
		}
	}
}


function goOnchange(obj) {
	EventTrigger(obj, "change");
}

///// Add onkeydown listener to DOCUMENT /////////////////////////////////
document.onkeydown = function(e) {
	var ev = getEvent(e);
	var kCode = EventKeyCode(ev);
	if (kCode == 8) { //BackSpace
		var obj = EventElement(ev);
		if (obj.tagName.toUpperCase() == 'INPUT' || obj.tagName.toUpperCase() == 'TEXTAREA' || obj.value) {
			if (obj.tagName.toUpperCase() == 'INPUT') {
				var type = obj.type.toLowerCase();
				if (type == 'radio' 
					|| type == 'check' 
					|| type == 'checkbox' 
					|| type == 'button' 
					|| type == 'submit') {
					cancelEvent(ev);
				} else if (obj.type == 'text' || obj.type == "textarea") {
					if (obj.readOnly) {
						cancelEvent(ev);
					}
				}
				return;
			} else if (obj.tagName.toUpperCase() != 'SELECT' 
				&& obj.tagName.toUpperCase() != 'OPTION') {
				if (!obj.readOnly || !obj.disabled) {
					return;
				}
			}
		}
		cancelEvent(ev);
	}
};


//////SUBMIT EVENT UTILITY///////////////////////////////////////////////////////////

function submitForm() {
	 var elems = document.forms[0].elements;
	 for (var i = 0; i < elems.length; i++) {
	  var elem = elems[i];
	  var type = elem.type.toLowerCase(); 
	  if ((type == 'radio') 
	   || (type == 'checkbox') 
	   || (type == 'select') 
	   || (type == 'select-one') 
	   || (type == 'select-multiple')) {
	   elem.disabled = false;
	  }
	 } 
	 document.forms[0].submit();
}

function submitPage(button) {
	button.disabled = true;
	document.forms[0].submit();
}
/////////////Window Print Listeners


	//IE and FireFox Compatibility
	//Before Print Remove All Buttons
	
	(function(doc){
	   //Before Print, all buttons become hidden.
		var beforePrint = function(){
			//If Wait overlay is active, wait till overlay is hidden
			//jquery error.field responsible for removing overlay
			if($('.wait-div:visible').length > 0){
				setTimeout(beforePrint, '800');
			}
			
	    	var inputs = doc.getElementsByTagName("INPUT");
	    	for (var i = 0; i < inputs.length; i++) {
	    	    if (inputs[i].type === 'submit' || inputs[i].type === 'button') {
	    	        inputs[i].style.visibility = 'hidden';
	    	    }
	    	}
	    	
	    	//Remove Sticky on Table Headers.
	    	var header = document.getElementsByClassName('tbhead')[0];
	    	if( isValidObject(header)){
	    		header = header.parentNode;
	    		while(header.parentNode.tagName !== 'TABLE') {
	    			header = header.parentNode; //Find Parent Table;
	    	    }		
	    		header = header.parentNode;
		        if(header.classList.contains('fixed')){
		        	header.classList.remove('fixed');
		        }
	    	}
	    	
		};
		
	//After Print, all buttons become visible.
	//If window is not "main", close window. 
		var afterPrint = function(){
	    	var inputs = doc.getElementsByTagName("INPUT");
	    	for (var i = 0; i < inputs.length; i++) {
	    	    if (inputs[i].type === 'submit' || inputs[i].type === 'button') {
	    	        inputs[i].style.visibility = 'visible';
	    	    }
	    	}
	    	
	    	if(window.name !== 'main'){
	    	        setTimeout(function () { window.close(); }, 100);
	    	}
	    	
	    	//Add Sticky on Table if Required.
	    	var header = document.getElementsByClassName('tbhead')[0];
	    	if( isValidObject(header)){
	    		header = header.parentNode;
	    		while(header.parentNode.tagName !== 'TABLE') {
	    			header = header.parentNode; //Find Parent Table;
	    	    }		
	    		header = header.parentNode;
    			var scroll = document.body.scrollTop || document.documentElement.scrollTop;
				if (scroll >= 100) {
			    	header.classList.add('fixed');
				} else {
			       if(header.classList.contains('fixed')){
				    	header.classList.remove('fixed');
			       }
				}

	    	}
		};

	    //Chrome Compatibility
	    if (window.matchMedia) {
	        var mediaQueryList = window.matchMedia('print');
	        mediaQueryList.addListener(function(mql) {
	            if (mql.matches) {
	                beforePrint();
	            } else {
	                afterPrint();
	            }
	        });
	    }
		
	    addEventHandler(window, 'beforeprint', beforePrint);
	    addEventHandler(window, 'afterprint', afterPrint);
	
	  //Window, Adds Sticky Header
	    addEventHandler(document, 'DOMContentLoaded', function(){
	    	var header = document.getElementsByClassName('tbhead')[0];
	    	
	    	if( isValidObject(header)){
	    		var trs = header.getElementsByTagName('tr');
	    		
	    		for (i = 0; i < trs.length; ++i) {
	    			trs[i].id = "";
	    			trs[i].classList.add('trdark');
	    		}
	    		header = header.parentNode;
	    		
	    		while(header.parentNode.tagName !== 'TABLE') {
	    			header = header.parentNode;
	    	    }//Find Parent Table;		
	    		header = header.parentNode;

	    		header.classList.add('header');
    			var tableHeight = parseFloat(header.scrollHeight) * .40 + parseFloat(header.offsetTop) ;
    			
	    		addEventHandler(window, 'scroll', function(){

	    		    var supportPageOffset = window.pageYOffset !== undefined;
	    		    var isCSS1Compat = ((document.compatMode || "") === "CSS1Compat");
	    		    var yOffset = supportPageOffset ? window.pageYOffset : window.scrollY;
	    			
	    			var scroll = document.body.scrollTop || document.documentElement.scrollTop;
	    			var scrollSize = document.body.scrollHeight || document.documentElement.scrollHeight;
	    			if (scroll >= tableHeight && (scrollSize - scroll) >= tableHeight ) {
	    				if(window.innerHeight + yOffset > scrollSize - 115) {
	    					//If header is already near bottom, do not add class
	    				} else {
	    					header.classList.add('fixed');
	    				}
	    			} else {
	    			    if(header.classList.contains('fixed')){
	    			    	header.classList.remove('fixed');
	    			    }
	    			}
	    		});
	    	}
	    });	    
	})(window.document)

    
    


