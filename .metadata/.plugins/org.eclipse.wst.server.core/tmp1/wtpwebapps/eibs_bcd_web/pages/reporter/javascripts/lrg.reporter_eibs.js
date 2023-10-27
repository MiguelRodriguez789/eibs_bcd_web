function addOnClickHandlers(parentID, icoID) {
	$(parentID).find(icoID).each(function() {
		$(this).click(swapUlList);
	});
}

function swapAll(containerId, spanIcoId) {
	$('#' + containerId + ' span#' + spanIcoId).each(swapUlList);
}

/**
 * This jquery function controls behavior of elements to swap from one list to another
 * Author: Luis M Crosby 
 * Date: 06/2011
 * @return
 */
function swapUlList() {
	var listElement = $(this).parents('li:eq(0)');
	var leName = $(listElement).attr('name');
	var whatUL = "";
	var whatIco = "";
	var whatEnable = "";
	var whatCss = "";
	var actualIco = $(this).attr('class');
	
	$(".message").html("");
	
	if (actualIco == "ui-icon ui-icon-minus") { // to unselect
		whatIco = "ui-icon ui-icon-plus";
		listElement.removeClass();
		switch (leName) {
			case 'aField' : whatUL = "ulRegular_fieldz"; break;
		}
		whatEnable = "disabled";
	} else { // to select
		whatIco = "ui-icon ui-icon-minus";
		switch (leName) {
			case 'aField' : whatUL = "ulRegFldzSel"; break;
		}
		whatEnable = "enabled";
	}
	$(this).removeClass(actualIco).addClass(whatIco);
	$('#'+whatUL).append(listElement);

	listElement.onclick = null;
}

function prepareSubmit() {
	showDiv('wait');
	
	$('div#selectedListToPost').empty(); // Added 20120314
	
	$("#selectedFieldsDivID li").each(function() {
		var hiddenField = $(this).find('.fldcls').val();
		$('div#selectedListToPost').append('<input type="hidden" name="selectedFields" value="' + hiddenField + '">');
	});
	//alert($('div#selectedListToPost').html());
	document.forms[0].submit();
 
}

$.fn.copyOptions = function(to, which)
{
var w = which || "selected";
if($(to).size() == 0) return this;
this.each(
	function()
	{
		if(this.nodeName.toLowerCase() != "select") return this;
		// get options
		var o = this.options;
		// get number of options
		var oL = o.length;
		for(var i = 0; i<oL; i++)
		{
			if(w == "all" || (w == "selected" && o[i].selected))
			{
				$(to).addOption(o[i].value, o[i].text);
			}
		}
	}
);
return this;
};    

// task:function,node:HTML Node
function iterate(task, node, icon) {
	var found = false;
	for (x = 0; x < node.childNodes.length; x++) {
		var childNode = node.childNodes[x];
		if (task(childNode, icon)) {
			found = true;
			break;
		}

		if (!found && childNode.childNodes.length > 0)
			found = iterate(task, childNode, icon);
		else
			break;
	}
	return found;
}

function swapHiddenEnable(node, value) {
	try {
		if (node.getAttribute("type").toLowerCase() == "hidden") {
			if (value == "enabled")
				node.removeAttribute("disabled");
			else
				node.setAttribute("disabled", "disabled");
			return true;
		} else
			return false;
	} catch (err) {
		return false;
	}
}

function swapIcon(node, icon) {
	if (node.nodeName.toLowerCase() == "span") {
		node.setAttribute("class", icon);
		return true;
	} else
		return false;
}


function hideDiv(someID)
{
    document.getElementById(someID).style.visibility = 'hidden'; 
}

function showDiv(someID)
{
    document.getElementById(someID).style.visibility = 'visible';
}



//ERROR MANAGEMENT AS EIBS
function CenterNamedWindow(u,nm,w1,h1,tp) {
	var w=screen.width;
	var h=screen.height;
	var posTop=(h-h1)/2;
	var posLeft=(w-w1)/2;
	var position='left='+posLeft+',top='+posTop+',height='+h1+',width='+w1;

	var listin = null;

  switch (tp){
    case 2:
		 listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
    	break;
	case 3:
		 listin = window.open(u,nm,'scrollbars=yes,'+position);
		break;
  }
  return listin;
}

function closeError() {
	 if (errorwin !== null) {
	   if (errorwin !== window)
		errorwin.close();
	 }
}

function CenterWindow(u,w1,h1,tp) {
	   CenterNamedWindow(u,'',w1,h1,tp);
	}


function enterInteger() {
	var elem=event.srcElement;
	 var kcode=event.keyCode;
	 switch (kcode){
	   case 66:
	   case 98:
	        {
	         event.returnValue = false;
	         if (elem.value.length > 0) {
	             if (parseInt(elem.value)==0)  elem.value = "1000000000";
	             else if (elem.maxLength - elem.value.length > 9) elem.value = elem.value + "000000000";
	           }else elem.value = "1000000000";
	         break;
	        }
	   case 72:
	   case 104:
	        {
	         event.returnValue = false;
	         if (elem.value.length > 0) {
	             if (parseInt(elem.value)==0)  elem.value = "100";
	             else if (elem.maxLength - elem.value.length > 2) elem.value = elem.value + "00";
	         }else elem.value = "100";
	         break;
	        }
	   case 77:
	   case 109:
	        {
	         event.returnValue = false;
	         if (elem.value.length > 0) {
	             if (parseInt(elem.value)==0)  elem.value = "1000000";
	             else if (elem.maxLength - elem.value.length > 6) elem.value = elem.value + "000000";
	         }else elem.value = "1000000";
	         break;
	        }
	   case 84:
	   case 116:
	        {
	         event.returnValue = false;
	         if (elem.value.length > 0) {
	             if (parseInt(elem.value)==0)  elem.value = "1000";
	             else if (elem.maxLength - elem.value.length > 3) elem.value = elem.value + "000";
	           }else elem.value = "1000";
	         break;
	        }
	   default: {
	        if ((kcode < 48 || kcode > 57) && kcode != 13) event.returnValue = false;
	 		}
	 }
}

/* Used at Security / LRG Maint */
function goAction(val) {
	showDiv('wait');
	showDiv('busy_wait');
	document.forms[0].SCREEN.value = val;	
	document.forms[0].submit();
}