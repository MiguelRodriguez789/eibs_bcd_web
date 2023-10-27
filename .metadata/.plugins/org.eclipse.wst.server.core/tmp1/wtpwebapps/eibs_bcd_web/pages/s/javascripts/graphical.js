
var applyFilters = false;

function checkCombo(x, y, w, h) {
	var coll = document.getElementsByTagName("select");
	var x1 = 0;
	var y1 = 0;
	var w1 = 0;
	var h1 = 0;
	var t1;
	var t2;
	var t3;
	var t4;
	var obj;
	if (coll != null) {
		for (var i = 0; i < coll.length; i++) {
			obj = coll[i].offsetParent;
			if (obj != null) {
				x1 = obj.offsetLeft;
				y1 = obj.offsetTop;
				while (obj !== document.body) {
					obj = obj.offsetParent;
					x1 += obj.offsetLeft;
					y1 += obj.offsetTop;
				}
				x1 += coll[i].offsetLeft;
				y1 += coll[i].offsetTop;

				w1 = coll[i].offsetWidth;
				h1 = coll[i].offsetHeight;
				t1 = x1 + w1;
				t2 = x + w;
				t3 = y1 + h1;
				t4 = y + h;
				if (((t1 > x) && (x1 < t2)) && ((t3 > y) && (y1 < t4))) {
					if (document.forms[0][coll[i].name].style != null)
						document.forms[0][coll[i].name].style.visibility = "hidden";
				} else {
					if (document.forms[0][coll[i].name].style != null)
						document.forms[0][coll[i].name].style.visibility = "visible";
				}
			}
		}
	}
}

function getElementByNameAndId(name, id) {
	var elem;
	var list = document.getElementsByName(name);
	if (!list) return;
	
	for (var i = 0; i < list.length; ++i)
		if (list[i].id == id) elem = list[i];
    return elem;
}

function getEventElement(evt) {
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

function moveElement(elemRef, y, x) {
	elemRef.style.top = y + "px";
    elemRef.style.left = x + "px";
}

function setVisibility(elemRef, visib){
	if (elemRef != null ) {
		if (applyFilters && elemRef.filters){
	   	  	elemRef.filters[0].apply();
	   	  	elemRef.style.visibility = visib;
	   	  	elemRef.filters[0].Play();	
		} else {
			elemRef.style.visibility = visib;
		}
	}
}

function applyTrans(elemRef) {
	var MSIEVER = getMSIEVer();
	if (applyFilters && MSIEVER < 5.5) { 
		elemRef.style.filter = "blendTrans(duration=1)"; 
	}
}

function cancelBub(evt) {
	if (window.event) {
		window.event.cancelBubble = true;
	} else {
		if (evt) evt.stopPropagation();
	}
}

function showHiddenDiv(evt, hiddenDiv) {
	evt = getEvent(evt);

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDiv, y, x);
	
	setVisibility(hiddenDiv, "visible");
	
	return hiddenDiv;
}



