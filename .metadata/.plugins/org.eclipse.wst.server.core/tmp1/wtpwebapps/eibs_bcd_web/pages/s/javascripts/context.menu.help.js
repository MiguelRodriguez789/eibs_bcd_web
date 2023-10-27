
if(typeof $.contextMenu === "function"){
	$(function(){
	    $.contextMenu({
	        selector: '.context-menu-help', 
	        callback: function(key, options) {
	    		if (key == "help") {
	    			getHelp();
	    		} else if (key == "cut") {
	    			doCut();
	    		} else if (key == "copy") {
	    			doCopy();
	    		} else if (key == "paste") {
	    			doPaste();
	    		} else if (key == "delete") {
	    			doDelete();
	    		} else if (key == "quit") {
	    			close();
	    		} else {	
	        		var m = "clicked: " + key;
	                window.console && console.log(m) || alert(m); 
	    		}
	        },
	        items: {
	            "help": {name: "Ayuda", icon: "help"},
	            "sep1": "---------",
	            "cut": {name: "Cortar", icon: "cut"},
	            "copy": {name: "Copiar", icon: "copy"},
	            "paste": {name: "Pegar", icon: "paste"},
	            "delete": {name: "Borrar", icon: "delete"},
	            "sep2": "---------",
	            "quit": {name: "Salir", icon: "quit"}
	        }
	    });
	    $(document).click(function(){
	    	$('.context-menu-list').filter(':visible').trigger('contextmenu:hide', {force: true});
	    });
	    
	    $.contextMenu({
	        selector: '.context-menu-inq', 
	        callback: function(key, options) {
	    		if (key == "inquiry") {
	    			getHelp();
	    		}
	        },
	        items: {
	        	"inquiry": {name: "Consulta", icon: "help"},
	        }
	    });
	});
}

// javascript copy function

if (!window.config) var config = {};

config.Clipboard = {
		pathToFlash: EIBS.context() + "/jquery/plugins/contextMenu/clipboard.swf",
		flashCopierID: "flashCopier"
};

//static Clipboard object

var Clipboard = function() {
	//copies a string to the clipboard
	function copy(strToCopy) {
		if (!strToCopy) return false;
		if (window.clipboardData && window.clipboardData.setData("text", strToCopy)) return true;	//IE
		var holder = document.createElement("textarea");
		holder.innerText = strToCopy;
		if (holder.createTextRange && holder.createTextRange().execCommand("copy")) return true;	//IE
		return flashCopy(strToCopy);	//use the Flash copier
	}
	//copies the currently selected text to the clipboard
	function copySelection() {
		var selectionText = "";
		//order matters here: Opera sparcely supports the TextRange object (IE) as well
		if (window.getSelection) selectionText = window.getSelection();	//(Selection object).toString()
		if (document.selection) selectionText = document.selection.createRange().text;	//IE; (TextRange object).text
		return copy(selectionText);
	}
	//use a Flash file to copy to clipboard (assuming Flash is enabled in the browser, of course)
	//see http://javascript.internet.com/forms/clipboard-copy.html
	//SWF file can be downloaded at http://javascriptsource.com/forms/clipboardFlash.zip
	function flashCopy(strToCopy) {
		if (!strToCopy || !window.config.Clipboard.pathToFlash) return false;
			var holder = document.getElementById(window.config.Clipboard.flashCopierID);
			if(!holder) {
				holder = document.createElement("div");
				holder.id = window.config.Clipboard.flashCopierID;
				//holder.style.display = "none";	//the copy fails with this
				holder.style.position = "absolute";
				holder.style.zIndex = "-1";
				document.body.appendChild(holder);
			}
			holder.innerHTML = '<embed src="'+window.config.Clipboard.pathToFlash+'" FlashVars="clipboard='+
				escape(strToCopy)+'" type="application/x-shockwave-flash"></embed>';
			return null;	//no way to know whether it was successful or not
	}
	//returns the contents of the clipboard
	function paste() {
		if (window.clipboardData) {//IE
			return window.clipboardData.getData("text") || "";
		} else {
			var textarea = document.createElement("textarea");
			if(textarea.createTextRange) {//IE
				textarea.createTextRange().execCommand("paste");
				return textarea.innerText;
			}
		}
		return "";
	}
	//clears the clipboard or sets it to a period if it can't be cleared
	function clear() {
		if (window.clipboardData) {//IE
			window.clipboardData.clearData();
			return true;
		} else return copy(".");
	}

	return {
		copy: copy,
		copySelection: copySelection,
		paste: paste,
		clear: clear
	};
}(); //initialize Clipboard

function doCopy() {
	var elem = document.forms[0][fieldName];
	Clipboard.copy(elem.value);
}

function doCut() {
	var elem = document.forms[0][fieldName];
	doCopy();
	elem.value = "";
}

function doPaste() {
	var elem = document.forms[0][fieldName];
	elem.value = Clipboard.paste();
}

function doDelete() {
	var elem = document.forms[0][fieldName];
	elem.value = "";
}

