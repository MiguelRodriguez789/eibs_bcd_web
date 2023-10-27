if (!Function.prototype.bind) {
  Function.prototype.bind = function (oThis) {
    if (typeof this !== "function") {
      // closest thing possible to the ECMAScript 5 internal IsCallable function
      throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
    }

    var aArgs = Array.prototype.slice.call(arguments, 1), 
        fToBind = this, 
        fNOP = function () {},
        fBound = function () {
          return fToBind.apply(this instanceof fNOP && oThis
                                 ? this
                                 : oThis,
                               aArgs.concat(Array.prototype.slice.call(arguments)));
        };

    fNOP.prototype = this.prototype;
    fBound.prototype = new fNOP();

    return fBound;
  };
}

function GetCNOFCSelect(code, table, filter1, filter2){
	var url = webapp + '/servlet/datapro.eibs.helps.JSCNOFCodes?nameId='+code+'&table='+table+'&filter1='+filter1+'&filter2='+filter2;
	GetXMLResponse(url, cnofcCallback, false);
}
function cnofcCallback(){
	xmlResponse = XMLResponse(CallbackObject.ajax);	
	if (isValidObject(xmlResponse)) {
		parseSelectXML(xmlResponse);
	}
}

function CNOFCFilter(table, code, desc) {
	if(!isValidObject(table)){
		throw Error("El código de Tabla del CNOFC debe ser provisto al filtro de selección");		
	}
	this.table = table;
	this.code = code;
	this.desc = desc;
}
CNOFCFilter.prototype = {
    getFilters: function(srcElement, filter1, filter2){
		if(!isValidObject(filter1)){
			filter1 = '*';
		}
		if(!isValidObject(filter2)){
			filter2 = '*';
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
	    			this.code = srcElement.name;
	    		}
	    		GetCNOFCSelect(this.code, this.table, filter1, filter2);
				doSelectChange(srcElement, this.desc);
	    	}
    	} else {
    		return doSelectFilter(srcElement, true);
    	}
    },
    getFilter: function(srcElement, filter1){
    	return this.getFilters(srcElement, filter1);
    }
};
function CNOFCSelect(table, code, desc) {
	return new CNOFCFilter(table, code, desc);
}

function addCNOFCHandler(nameORid) {
	var elem = GetElement(nameORid);
	chainEvents(elem, 'mousedown', 'focus');
	if(doSelectFilter(elem, false)){
		EventShooter(elem, 'focus');
	}
}
