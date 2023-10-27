
/////////////////////////ADD PROTYPE FUNCTIONS ////////////////////////////////////////////////

////////////////////********* DATE ***************//////////////////////////////////////////////

Date.isLeapYear = function (year) { 
    return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0)); 
};

Date.getDaysInMonth = function (year, month) {
    return [31, (Date.isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
};

Date.prototype.isLeapYear = function () { 
    return Date.isLeapYear(this.getFullYear()); 
};

Date.prototype.getDaysInMonth = function () { 
    return Date.getDaysInMonth(this.getFullYear(), this.getMonth());
};

Date.prototype.addMonths = function (value) {
    var n = this.getDate();
    this.setDate(1);
    this.setMonth(this.getMonth() + value);
    this.setDate(Math.min(n, this.getDaysInMonth()));
    return this;
};


////////////////////********* String ***************//////////////////////////////////////////////
///Ends With
if (typeof String.prototype.endsWith !== 'function') {
    String.prototype.endsWith = function(suffix) {
        return this.indexOf(suffix, this.length - suffix.length) !== -1;
    };
}

//Trim
if (typeof String.prototype.trim !== 'function') {
    String.prototype.trim = function() {
        var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
        return this.replace(rtrim, '');
    };
}

//IsEmpty
if (typeof String.prototype.isEmpty !== 'function') {
    String.prototype.isEmpty = function() {
        return this.trim().length > 0 ;
    };
}

////////////////////********* Array ***************//////////////////////////////////////////////
//Contains Object
if (typeof Array.prototype.contains  !== 'function') {
	Array.prototype.contains = function(obj) {
	    var i = this.length;
	    while (i--) {
	        if (this[i] === obj) {
	            return true;
	        }
	    }
	    return false;
	};
}


//Contains String
if (typeof Array.prototype.containsSubstring  !== 'function') {
	Array.prototype.containsSubstring = function(substring) {
	    var i = this.length;
	    while (i--) {
	        if (String(this[i]).indexOf(substring) > -1) {
	            return i;
	        }
	    }
	    return -1;
	};
}


//Remove
if (Array.prototype.remove !== 'function') {
	Array.prototype.remove = function(obj) {
		var index = this.indexOf(dateName);
		if (index > -1) {
		    this.splice(index, 1);		
		}
	};
}
//Substitute
if (Array.prototype.substitue !== 'function') {
	Array.prototype.substitue = function(deletedValue, newValue) {
		if(this.contains(deletedValue)){
		  for (var i = 0; i < this.length; i++) {
		    if (this[i] == deletedValue) {
		    	this[i] = newValue;
		    }
		  }
		}
		return this;
	};
}


//****************** Browser Detection. Object to identify Browser ***************//////////////////////////////////////////////
(function(EIBS, document){
	  if (typeof EIBS.BrowserDetect !== 'object'){
		//Module to Detect Browser Version	
		EIBS.BrowserDetect =  {
						init: function () {
							this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
							this.version = this.searchVersion(navigator.userAgent)
								|| this.searchVersion(navigator.appVersion)
								|| "an unknown version";
							this.OS = this.searchString(this.dataOS) || "an unknown OS";
						},
						searchString: function (data) {
							for (var i=0; i < data.length; i++)	{
								var dataString = data[i].string;
								var dataProp = data[i].prop;
								this.versionSearchString = data[i].versionSearch || data[i].identity;
								if (dataString) {
									if (dataString.indexOf(data[i].subString) != -1)
										return data[i].identity;
								}
								else if (dataProp)
									return data[i].identity;
							}
						},
						searchVersion: function (dataString) {
							var index = dataString.indexOf(this.versionSearchString);
							if (index == -1) return;
							return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
						},
						isIE: function () {
							return this.browser == "Internet Explorer";
						},						
						isFIREFOX: function () {
							return this.browser == "Firefox" || this.browser == "Mozilla";
						},						
						IECompatibility: function () {
							return this.browser == "Internet Explorer" && parseInt(this.version) < 11;
						},							
						dataBrowser: [
				  			{
								string: navigator.vendor,
								subString: "Opera",
								identity: "Opera",
								versionSearch: "OPR"
							},
							{
								string: navigator.vendor,
								subString: "Google",
								versionSearch: "Chrome",
								identity: "Google Chrome"
							},
							{ 	string: navigator.userAgent,
								subString: "OmniWeb",
								versionSearch: "OmniWeb/",
								identity: "OmniWeb"
							},
							{
								string: navigator.vendor,
								subString: "Apple",
								identity: "Safari",
								versionSearch: "Version"
							},
							{
								string: navigator.vendor,
								subString: "iCab",
								identity: "iCab"
							},
							{
								string: navigator.vendor,
								subString: "KDE",
								identity: "Konqueror"
							},
							{
								string: navigator.userAgent,
								subString: "Firefox",
								versionSearch: "Firefox",
								identity: "Firefox"
							},
							{
								string: navigator.userAgent,
								subString: "Edge",
								versionSearch: "Edge",
								identity: "Edge"
							},							
							{
								string: navigator.vendor,
								subString: "Camino",
								identity: "Camino"
							},
							{		// for newer Netscapes (6+)
								string: navigator.userAgent,
								subString: "Netscape",
								identity: "Netscape"
							},
							{
								string: navigator.userAgent,
								subString: "Trident",
								identity: "Internet Explorer",
								versionSearch: "MSIE"
							},
							{
								string: navigator.userAgent,
								subString: "Gecko",
								identity: "Mozilla",
								versionSearch: "rv"
							},
							{ 		// for older Netscapes (4-)
								string: navigator.userAgent,
								subString: "Mozilla",
								identity: "Netscape",
								versionSearch: "Mozilla"
							}
						],
						dataOS : [
							{
								string: navigator.platform,
								subString: "Win",
								identity: "Windows"
							},
							{
								string: navigator.platform,
								subString: "Mac",
								identity: "Mac"
							},
							{
								   string: navigator.userAgent,
								   subString: "iPhone",
								   identity: "iPhone/iPod"
						    },
							{
								string: navigator.platform,
								subString: "Linux",
								identity: "Linux"
							}
						]
				};	

		EIBS.BrowserDetect.init();
	  }	
	})(window.EIBS =  typeof window.EIBS !== 'undefined' ? window.EIBS : {} , document);
/////


//////////////////////////////////////////////////////////////////////////////////////////////
//FUNCTION BIND PROTOTYPE
//I DON"T KNOW WHY YOU WELL BIND A FUNCTION TO A PROTOTYPE
//CALL THE PROTOTYPE FUNCTION RATHER THAN THIS

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


//Modify JSON.stringify to allow recursive and single-level arrays
(function(){
    // Convert array to object
    var convArrToObj = function(array){
        var thisEleObj = new Object();
        if(typeof array == "object"){
            for(var i in array){
                var thisEle = convArrToObj(array[i]);
                thisEleObj[i] = thisEle;
            }
        } else {
        	thisEleObj = array;
        }
        return thisEleObj;
    };
    var oldJSONStringify = JSON.stringify;
    JSON.stringify = function(input){
        return oldJSONStringify(convArrToObj(input));
    };
})();

//Modify parseFloat to depend on Locale group/decimal settings
(function(CURRENCY, document){
	var _parseFloat = window.parseFloat;
	window.parseFloat = function(num){
		var returnNum = num;
		
		if(typeof returnNum === "string"){
		//Eliminate Grouping
			if(CURRENCY.grpSeparator() == "."){
				returnNum = returnNum.replace(/\./g ,"");
			} else {
				returnNum = returnNum.replace(/\,/g ,"");
			}
		//Replace , if decimalseperator	
			if(CURRENCY.decSeparator() == ","){
				returnNum = returnNum.replace(/\,/g ,".");
			} 
		}
		
		returnNum = _parseFloat(returnNum);
		return returnNum;
	};
})( typeof window.EIBS !== 'undefined' ? EIBS.currency : {} , window.document);
