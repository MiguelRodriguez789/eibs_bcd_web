// CrossBrowserFunctions.js

/////////////////////////ADD PROTYPE FUNCTIONS ////////////////////////////////////////////////
Number.prototype.round = function(p) {
  p = p || 10;
  return parseFloat( this.toFixed(p) );
};


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


//Removes All Instances of Item
if (Array.prototype.remove !== 'function') {
	Array.prototype.remove = function(obj) {
	    var itm; var args = arguments; var len = args.length;
	    var ax;
	    while (len && this.length) {
	    	itm = args[--len];
	        while ((ax = this.indexOf(itm)) !== -1) {
	            this.splice(ax, 1);
	        }
	    }
		return this;
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

//Returns Random Element from array;
if (Array.prototype.random !== 'function') {
	Array.prototype.random = function (elimnate) {
		var index = Math.floor((Math.random()*this.length));
		var randomEle = this[index];
		if(elimnate){ 
			this.remove(randomEle); 
		}
		return randomEle;
	};
}

//Clone
if (Array.prototype.clone !== 'function') {
	Array.prototype.clone = function() {
		return this.slice(0);
	};
}

//Shuffle Array
if (Array.prototype.shuffle !== 'function') {
	Array.prototype.shuffle = function() {
		  var i = this.length, j, temp;
		  if ( i == 0 ) return this;
		  while ( --i ) {
		     j = Math.floor( Math.random() * ( i + 1 ) );
		     temp = this[i];
		     this[i] = this[j];
		     this[j] = temp;
		  }
		  return this;
	};
}

//Min/Max Sorting
if (Array.prototype.minMax !== 'function') {
	Array.prototype.minMax = function(obj) {
		var maxArr;
		var minArr = this.clone();
		
		minArr.sort(function(a,b,obj){
			var aData = typeof  obj != 'undefined' ? a[obj] : a;
			var bData = typeof  obj != 'undefined' ? b[obj] : b;
			if (aData < bData) {
			   return -1;
			}
			if (aData > bData) {
			   return 1;
			}
			return 0;			
		});
		
		maxArr = minArr.clone().reverse();
		
		var half_length = Math.ceil(maxArr.length / 2);  
		maxArr = maxArr.splice(0,half_length);
		if(minArr.length % 2 == 0){
			minArr = minArr.splice(0,half_length);
		} else {
			minArr = minArr.splice(0,half_length-1);
		}
		
		var result = mergeAlternating(maxArr, minArr);
		
		for(var i=0; i < result.length; i++){
			this[i] = result[i];
		}
		return this;
	};
}

function mergeAlternating(array1, array2) {
    var mergedArray = [];

    for (var i = 0, len = Math.max(array1.length, array2.length); i < len; i++) {
        if (i < array1.length) {
            mergedArray.push(array1[i]);
        }
        if (i < array2.length) {
            mergedArray.push(array2[i]);
        }
    }
    return mergedArray;
}

//****************** Browser Detection. Object to identify Browser ***************//////////////////////////////////////////////
(function(EIBS){
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
	})(window.EIBS =  typeof window.EIBS !== 'undefined' ? window.EIBS : {});
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
})(window.JSON = typeof window.JSON !== 'undefined' ? window.JSON : {});

(function(){
	if (typeof DecimalFormatSymbols !== 'object'){
		DecimalFormatSymbols =  {
				getGroupingSeparator: function () {
					return EIBS.currency.grpSeparator();
				},
				getDecimalSeparator: function () {
					return EIBS.currency.decSeparator();
				}
		};
	}
})();

(function(){
	if (typeof NumberFormat !== 'object'){
		NumberFormat = {
			parse: function (value) {
				if(value.trim() == "")
					return 0;
				//Detecting Grouping Symbol
				//var otherSymbol = value.replace(/[0-9A-Za-z-+]/g ,"").charAt(0);
				var otherSymbol = ',';
				if (value.indexOf(otherSymbol) > -1){
					//If other symbol different than the period is present
					var periodPos = value.lastIndexOf('.');
					if (periodPos > -1 && value.lastIndexOf(otherSymbol) > periodPos) {
						//If decimal symbol is not a period
						value = value.replace(/\./g ,"");//Eliminate Grouping
						value = value.replace(new RegExp(otherSymbol, 'g'), ".");
					}
					//Make sure the other symbol is removed 
					value = value.replace(new RegExp(otherSymbol, 'g'), "");
				}
				return _parseFloat(value);
			},
			format: function (number, dec) {
				if (typeof(dec) === "undefined") {
					dec = 0;
				}
				var value = '';
				if(typeof number === "number"){
					value = ""+number;
				} else if(typeof number !== "number"){
					value = ""+this.parse(number);
				}
				var absolute;
				var sign = '';
			    if (value.charAt(0) === '-') {
			    	sign = '-';
				    absolute = value.substring(1);
			    } else {
			    	absolute = value;
			    }
			    
				var integerPart = "";
				var decimalPart = "";
				
				var posi = absolute.indexOf(".");
				if (posi != -1) {
					integerPart = absolute.substring(0, posi);
					decimalPart = absolute.substring(posi + 1, absolute.length);
				} else {
					integerPart = absolute;
				}
				
				var integerGroups = "";
				var count = 0;
				var endPosition = integerPart.length - 1;
				for (var index = endPosition; index > -1; index--) {
					var nx = integerPart.charAt(index);
					integerGroups = nx + integerGroups;
					++count;
					if (count % 3 == 0)  {
						if (index > 0) {
							integerGroups = DecimalFormatSymbols.getGroupingSeparator() + integerGroups;
						} // add grouping separator
					}
				}
				
				if (dec > 0 && decimalPart.length > dec) {
					var rounding = 10^dec;
					decimalPart = ""+Math.round(_parseFloat(decimalPart)*rounding)/rounding;
				} else {
					for (var i = 0; i < dec; i++) {
						decimalPart = decimalPart + "0";
					}
				}
				if (decimalPart.length > 0) {
					decimalPart = DecimalFormatSymbols.getDecimalSeparator() + decimalPart;
				}
				return (sign + integerGroups + decimalPart);
			}
		};
	}
})(window.EIBS = typeof window.EIBS !== 'undefined' ? window.EIBS : {});

//Modify parseFloat to depend on Locale group/decimal settings
if (typeof _parseFloat === 'undefined'){
	var _parseFloat = window.parseFloat;
}
(function(){
	window.parseFloat = function(num){
		if(typeof num === "string"){
			return NumberFormat.parse(num);
		} else if(typeof num === "number"){
			return num;
		}
		return _parseFloat(num);
	};
})();

if (typeof getComputedStyle === 'undefined'){
	var getComputedStyle = function(elem, pseudoElt){
		if(isValidObject(elem) && isValidObject(elem.style)){
			if (typeof elem.style.getPropertyValue === 'undefined'){
				elem.style.getPropertyValue = function(element, pseudoElt){
					return "";
				};
			}
			return elem.style;
		}
		return null;
	};
}


function EventUtils() {

	throw 'RuntimeException: EventUtils is a static utility class ' + ' and may not be instantiated';

}

EventUtils.addEventListener = function(target, type, callback, captures) {
	if (target.addEventListener) {
		// EOMB
		target.addEventListener(type, callback, captures);
	} else if (target.attachEvent) {
		// IE
		target.attachEvent('on' + type, callback, captures);
	} else {
		// IE 5 Mac and some others
		target['on' + type] = callback;
	}
};

function hidediv(id) {
	if (document.getElementById) { // DOM3 = IE5, NS6 
		document.getElementById(id).style.display = 'none';
	} else {
		if (document.layers) { // Netscape 4 
			document.layers[id].display = 'none';
		} else { // IE 4 
			eval("document.all." + id + ".style.display = 'none'");
		}
	}
}

function showdiv(id) {
	if (document.getElementById) { // DOM3 = IE5, NS6 
		document.getElementById(id).style.display = 'block';
	} else {
		if (document.layers) { // Netscape 4 
			document.layers[id].display = 'block';
		} else { // IE 4 
			eval("document.all." + id + ".style.display = 'block'");
		}
	}
}

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

function getElementsByClassName(className) {
    if (document.getElementsByClassName) {
    	return document.getElementsByClassName(className);
    }
    var allElements = document.all;
    // Empty placeholder to put in the found elements with the class name
    var foundElements = [];
    for (var i = 0; i < allElements.length; i++) {
        if (hasClass(allElements[i], className)) {
            foundElements[foundElements.length] = allElements[i];
        }
    }
    return foundElements;
}