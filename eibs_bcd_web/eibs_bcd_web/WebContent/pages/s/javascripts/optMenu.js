var menuType;

function OptionURL(sid, den, code, index) {
		var url =  EIBS.context() + "&optMenuId="+sid+"&optMenuDen="+den+"&optMenu="+code+"&index="+index;
		return url;
}

function OpenURL(url) {
	window.location.href = url;
	return void(this);
}

function setTime(maxlen) {
	clearTimeout(outtime2);
	ontime = setInterval("AnimationMenu(" + maxlen + ")", 1);
}

function startMove() {
	if (curlen == 0 && menuRef != null) {
		var maxlen =  $(menuRef).width() + 2;
		if (menuactive) {
			setVisibility(menuRef, "hidden");
			outtime2 = setTimeout("setTime(" + maxlen + ")", 500);
		} else {
			setTime(maxlen);
		}
	}
}

function AnimationMenu(maxlen) {
	if (menuImgRef != null) {
		var x = menuImgRef.offsetLeft;
		var x2 = x + menuImgRef.clientWidth + 2;
		var w = menuImgRef.clientWidth + 2 + menuRef.clientWidth;

		animactive = true;
		curlen = curlen + 10;
		clearTimeout(outtime);
		if (curlen < maxlen) {
			x = (!menuactive) ? x - 10 : x + 10;
			x2 = (!menuactive) ? x2 - 10 : x2 + 10;
			menuImgRef.style.left = x + "px";
			checkCombo(x, menuImgRef.offsetTop, w, menuRef.clientHeight);
		} else {
			clearInterval(ontime);
			curlen = 0;
			var rest = (maxlen % 25) + 2;
			if (menuactive == true) {
				x += rest;
				menuImgRef.style.left = x + "px";
				menuactive = false;
				animactive = false;
				checkCombo(x, menuImgRef.offsetTop, menuImgRef.clientWidth,
						menuImgRef.clientHeight);
			} else {
				x -= rest;
				x2 -= rest;
				menuImgRef.style.left = x + "px";
				menuRef.style.left = x2 + "px";

				checkCombo(x, menuImgRef.offsetTop, w, menuRef.clientHeight);
				setVisibility(menuRef, "visible");

				menuactive = true;
				outtime = setTimeout("startMove()", 20000);
			}
		}
	}
}

function MoveMenu() {
	var obj = document.body;
	if (obj != null && menuImgRef != null && menuRef != null) {
		var y = 0;
		var x = 0;
		if(EIBS.BrowserDetect.IECompatibility()){
			y = obj.scrollTop + 2;
			x = obj.clientWidth - menuImgRef.clientWidth - 2 + obj.scrollLeft;
		} else {
			y = $(window).scrollTop() + 2;
			x =  $(window).width() - menuImgRef.clientWidth  + $(window).scrollLeft();
		}
		var x2 = 0;

		if (!animactive) {
			menuImgRef.style.top = 0;
			menuRef.style.top = 0;
			menuImgRef.style.left = x + "px";
			checkCombo(x, y, menuImgRef.clientWidth, menuImgRef.clientHeight);
			menuactive = false;
		} else if (curlen == 0) {
			x -= menuRef.clientWidth + 2;
			x2 += x + menuImgRef.clientWidth + 2;
			menuImgRef.style.top = 0;
			menuRef.style.top = 0;
			menuImgRef.style.left = x + "px";
			menuRef.style.left = x2 + "px";
			checkCombo(x, y, menuImgRef.clientWidth + menuRef.clientWidth + 2,
					menuRef.clientHeight);
		}
	}
}

function setCapture(element) {
	if (element != null) {
		if (!element.setCapture) {
			var capture = [ "click", "mousedown", "mouseup", "mousemove",
					"mouseover", "mouseout" ];

			element.setCapture = function() {
				var self = this;
				var flag = false;
				this._capture = function(e) {
					if (flag) {
						return
					}
					flag = true;
					var event = document.createEvent("MouseEvents");
					event.initMouseEvent(e.type, e.bubbles, e.cancelable, e.view,
							e.detail, e.screenX, e.screenY, e.clientX, e.clientY,
							e.ctrlKey, e.altKey, e.shiftKey, e.metaKey, e.button,
							e.relatedTarget);
					self.dispatchEvent(event);
					flag = false;
				};
				for ( var i = 0; i < capture.length; i++) {
					window.addEventListener(capture[i], this._capture, true);
				}
			};
		}
		element.setCapture();
	}
}

function releaseCapture(element) {
	if (element != null) {
		if (!element.releaseCapture) {
		    var capture = ["click", "mousedown", "mouseup", "mousemove", "mouseover", "mouseout" ];
	
		    element.releaseCapture = function(){
		        for (var i=0; i<capture.length; i++) {
		            window.removeEventListener(capture[i], this._capture, true);
		        }
		        this._capture = null;
		    };
		}
		element.releaseCapture();
	}	
}

function switchMenu(evt) {
	var elem = getEventElement(evt);
	if (elem != null) {
		if (popupStatus == "open") {
			popupStatus = "close";
		    setCapture(hPopupRef);
		}
		if (elem.className == "menuItem") {
			elem.className = "highlightItem";
		} else if (elem.className == "highlightItem") {
		    elem.className = "menuItem";
		}
	}
}

function doCut() {
	var el = document.forms[0][fieldName];
	if (doCopy())  el.value = "";
}

function doCopy() {
	var el = document.forms[0][fieldName];
	var bResult = window.clipboardData.setData("Text", el.value);
	return bResult;
}

function doPaste() {
	var el = document.forms[0][fieldName];
	el.value = window.clipboardData.getData("Text");
}

function doDelete() {
	var el = document.forms[0][fieldName];
	el.value = "";
}

function hideMenu() {
	if (hPopupRef != null) hPopupRef.style.display = "none";
}

function clickMenu(evt) {
	if (hPopupRef != null) {
		hPopupRef.style.display = "none";
		releaseCapture(hPopupRef);
		el = getEventElement(evt);
		if (fieldName != null && document.forms[0][fieldName] != null) {
			document.forms[0][fieldName].style.cursor = "auto";
			if (el.id == "mnuHelp") {
				getHelp();
			} else if (el.id == "mnuCut") {
			    doCut();
			} else if (el.id == "mnuCopy") {
				doCopy();
			} else if (el.id == "mnuPaste") {
				doPaste();
			} else if (el.id == "mnuDelete") {
				doDelete();
			}
		} 
	}
}

function builtHPopUp() {
	var styleHtml = "<STYLE>" +
		".menuItem {" +
		"	font-family:Sans-serif;" +
		"	font-size:8pt;" +
		"	width:80;" +
		"	padding:2;" +
		"	padding-left:20;" +
		"	background-Color:menu;" +
		"	color:#79b845;" +
		"	cursor:default" +
		"} " +
	   	".highlightItem {" +
	   	"	font-family:Sans-serif;" +
	   	"	font-size:8pt;" +
	   	"	width:80;" +
	   	"	padding:2;" +
	   	"	padding-left:20;" +
	   	"	background-Color:highlight;" +
	   	"	color:white;" +
	   	"	cursor:default" +
	   	"} " +
	   	" </STYLE>";
	$('body').prepend(styleHtml);

	var divHtml = "<div id=\"hPopup\" " +
			"			style=\"position:absolute; " +
			"			display:none; " +
			"			left:25px; " +
			"			top:-50px; " +
			"			z-index:3; " +
			"			padding:1; " +
			"			background-Color:menu; " +
			"			border-width:thin; " +
			"			border-style:outset; " +
			"			cursor:default\">" +
	        "			<div class=\"menuItem\" id=mnuHelp style=\"border-bottom-width:thin; border-bottom-style:groove;\">Help</div>"+
		    "			<div class=\"menuItem\" id=mnuCut>Cut</div>"+
		    "			<div class=\"menuItem\" id=mnuCopy>Copy</div>"+
		    "			<div class=\"menuItem\" id=mnuPaste>Paste</div>"+
		    "			<div class=\"menuItem\" id=mnuDelete>Delete</div>"+
	  	    "		</div>";
	$('body').prepend(divHtml);

	var switchHtml ="<SCRIPT language=\"JavaScript\">"+
		    "			document.getElementById(\"hPopup\").onmousedown = clickMenu;" +
		    "			document.getElementById(\"hPopup\").onmouseover = switchMenu;" +
		    "			document.getElementById(\"hPopup\").onmouseout = switchMenu;" +
		    "		</SCRIPT>";
	$('body').prepend(switchHtml);

	hPopupRef = document.getElementById("hPopup");
	mnuHelpRef = document.getElementById("mnuHelpRef");
}

function menuCallback(){
	var xmlResponse = XMLResponse(CallbackObject.ajax);
	if(isValidObject(xmlResponse)){
		var xmlSerial;
		if(isValidObject(window.XMLSerializer)){
			xmlSerial = new XMLSerializer();
		}
		
		$('body').ready(function() {
			if (menuType == 'jquery-ui-tabs'
				|| menuType == 'slider-ui-tabs') {
				writeJqueryTabs(xmlResponse);
			} else {
				var options = (xmlResponse.xml ? xmlResponse.xml : xmlSerial.serializeToString(xmlResponse)); 
				writeNewMenu(options);
			}
		});
	} 
}

function formatTitle(title, chars) {
	var result = (title.length <= chars) ? title : title.substring(0, chars);
	return result;
}

function createMenu(type) {
	menuType = type;
	$(document).ready(function(){
		$('body').prepend("<div id=\"Menu\" style=\"visibility:hidden;\"></div>");
		if(menuType.indexOf('ui-tabs') != -1 ){
			if (menuType == 'jquery-ui-tabs') {
				$("#Menu").css('visibility', 'visible');
			}
			$("#Menu").css('height', 32);
		}

	});
}

function hoverTab(e){
	if(e.type === 'mouseenter'){
		$(this).addClass('ui-state-hover');
		$(this).removeClass('ui-mandatory');
	} else {
		$(this).removeClass('ui-state-hover');
		var li = $(this).parents('li');
		if(li[0].getAttribute('data-required') == 'true'
			&& !li.hasClass('ui-tabs-active')){
			$(this).addClass('ui-mandatory');
		}
	}
}

function showTabs() {
	$("#Menu").css('visibility', 'visible');
}

function initTabs() {
	$("#Menu").tabs({
		collapsible: true,
		active: false,
		activate: function( event, ui ) {
			OpenURL(ui.newTab.context.href);
		}
	});
	$('#Menu ul').find('A, a').hover(hoverTab);
}

function getActiveTab(list){
	var activeTab = list.index($('#Menu .ui-tabs-active'));
	if (activeTab < 1) {
		activeTab = 1;
		$(list[0]).addClass('ui-tabs-active').find('A, a')
			.addClass('ui-state-hover')
			.addClass('ui-state-active').removeClass('ui-mandatory');
	}
}

function initSliderTabs() {
	var list = $('#Menu ul').children('li');
	$('#Menu ul').html(list.sort(function (a, b){
				var ar = $(a)[0].getAttribute('data-required');
				var br = $(b)[0].getAttribute('data-required');
				if (ar == br) {
					return 0;
				} else if (ar == 'true'){
					return -1;
				} else if (br == 'true'){
					return 1;
				}
			})
	);
	var activeTab = list.index($('#Menu .ui-tabs-active'));
	if (activeTab < 1) {
		activeTab = 1;
		$(list[0]).addClass('ui-tabs-active').find('A, a')
			.addClass('ui-state-hover')
			.addClass('ui-state-active').removeClass('ui-mandatory');
	}
	$("#Menu").sliderTabs({
		defaultTab: activeTab,
		panelArrows: true,
		tabSlideLength: 640,
		tabArrowWidth: 10
	});
	list.find('A, a').addClass('ui-state-default').click(function(){
		list.removeClass('ui-tabs-active').find('A, a')
			.removeClass('ui-state-active')
			.removeClass('ui-state-hover');
		
		$(this).addClass('ui-state-active')
			.addClass('ui-state-hover').parents('li')
				.addClass('ui-tabs-active');
		
		OpenURL(this.href);
	}).hover(hoverTab);
	//Adding custom ui styles so we don't need to customized the plugin ones
	$("#Menu div.ui-slider-tabs-list-container").css('height', 32);
	$('#Menu div.ui-slider-tabs-list-wrapper').addClass('ui-widget-header');
	//$('#Menu div.ui-slider-tabs-list-wrapper').addClass('ui-widget-header ui-widget ui-widget-content');
}

function writeJqueryTabs(options){
	$('head').append('<link rel="stylesheet" type="text/css" href="'+EIBS.root()+'/jquery/themes/eibs/jquery-ui.css">');
	
	if(menuType == 'slider-ui-tabs'){
		$('head').append('<link rel="stylesheet" type="text/css" href="'+EIBS.root()+'/jquery/plugins/sliderTabs/styles/jquery.sliderTabs.css">');
		$('head').prepend('<script language="Javascript" src="'+EIBS.root()+'/jquery/plugins/sliderTabs/jquery.sliderTabs.js">');
	}
	
	menuRef = document.getElementById("Menu");
	
	var result = "<ul>";
	var i = 0;
	//var items = options.getElementsByTagName('A');
	//for (var i = 0 ; i < items.length ; i++) {
	$(options).find('A, a').each(function(){
		//var item = items.item(i);		
		var item = $(this)[0];
		var title = item.textContent;
		var href = item.getAttribute('href');
		var active = item.getAttribute('data-active');
		var required = item.getAttribute('data-required');
		var completed = item.getAttribute('data-completed');
		
		result += "<li "  
				+ (active == 'true' ? " class=\"ui-tabs-active\" " : "")
				+ "data-required=\"" + (required == 'true' ? "true" : "false") + "\" "
				+ "data-completed=\"" + (completed == 'true' ? "true" : "false") + "\">" 
				+ "<A title=\"" + title + "\" " 
					+ (active == 'true' ? " class=\"ui-state-active\"" : "")
					+ (required == 'true' ? " class=\"ui-mandatory\"" : "") 
				+ "href=\"" + href + "\">"
				+ formatTitle(title, 30)
				+ "</A>" 
				+ "</li>";
		i = i + 1;
	});
	result += "</ul>";
	
	$('#Menu').prepend(result);
	
	if(menuType == 'slider-ui-tabs'){
		initSliderTabs();
	} else {
		if (i > 15) {
			$("#Menu").css('height', 84);
		} else if (i > 8) {
			$("#Menu").css('height', 58);
		}
		initTabs();
	}
	showTabs();
	
	if (false) {
		var divImg = 
			"<div id=\"MenuImg\" class=\"hiddenDivImg\" style=\"position: fixed; z-index:10;\">" +
			"	<img src = '"+EIBS.root()+"/images/s/options_expand.gif'>" +
			"</div>";
		$('body').prepend(divImg);
		menuImgRef = document.getElementById("MenuImg");
		addEventHandler(menuImgRef, 'mouseover', function(){
			$('[data-required="false"]').closest('li').show();
			$("#Menu").css('visibility', 'visible');
		});
	}

	$('body').show();
}

function writeNewMenu(options) {
	options = options.replace("<root>", "");
	options = options.replace(new RegExp("<A","g"), "<BR><A");
	options = options.substring(options.indexOf("<A"));
	options = options.replace("</root>", "");
	options = options.replace(new RegExp("<hr /><BR />","g"), "<hr align=\"center\" style=\"height:1pt;color:#78b845\">");
	
	var divImg = "<div id=\"MenuImg\" class=\"hiddenDivImg\">" +
			"	<img src = '"+EIBS.root()+"/images/de/options.gif'>" +
            "</div>";

	$('body').prepend(divImg);
	
	$('#Menu').prepend(
			"<table class=\"optMenuTBD\">" +
  	      	"	<td align=\"left\" nowrap style=\"float:right; padding-right:10\">" + options + "</td>" +
          	"</table>");	
	$('#Menu').addClass('hiddenDiv');
	if(!EIBS.BrowserDetect.IECompatibility()){
		$('#MenuImg').css('position', 'fixed');
		$('#Menu').css('position', 'fixed');
	}
	$('#Menu').find('[data-active="true"]').css('font-weight', 'bold');
	$('#Menu').find('[data-required="true"]').addClass('mandatory');
	
	menuImgRef = document.getElementById("MenuImg");
	menuRef = document.getElementById("Menu");
	 
	addEventHandler(menuRef, 'click', cancelBub);
	addEventHandler(menuImgRef, 'mouseover', startMove);
	addEventHandler(document, 'click' , closeMenu);
	
	$('body').show();
}

function addPopupHelp(name) {
	var obj = getElement(name);
	if (isValidObject(obj)) {
		addEvent(obj, "contextmenu", showPopupHelp);
	}
}

function showPopupHelp(evt) {
	if (hPopupRef != null) {
		evt = (evt) ? evt : ((window.event) ? window.event : "");
	    var y = evt.clientY + document.body.scrollTop - 1;
	    var x = evt.clientX + document.body.scrollLeft - 1;
	    var bodyW = document.body.clientWidth;
	    var bodyH = document.body.clientHeight;
	    var dif = 0;
	    hPopupRef.style.display = "";
	    if (bodyH < (evt.clientY + hPopupRef.offsetHeight)) {
	        dif = (evt.clientY + hPopupRef.offsetHeight) - bodyH;
	        y= y - dif - 5;
	    }	 
	    if (bodyW < (evt.clientX + hPopupRef.offsetWidth)) {
	         dif = (evt.clientX + hPopupRef.offsetWidth) - bodyW;
	         x= x - dif - 5;
	    }
	    
	    cancelEvent(evt);
		
	    popupStatus = "open";
	    x = x - 3;
	    y = y - 3;
	    hPopupRef.style.top = y + "px";
	    hPopupRef.style.left = x + "px";
	}
}

function closeMenu() {
	if (menuactive == true) startMove();
}

function showMenu(){
	if(isValidObject(menuRef)){
		if(isValidObject(menuImgRef)){
			menuImgRef.style.visibility="visible";
			MoveMenu();
		}
		
		if(menuType.indexOf('ui-tabs') != -1 ){
			showTabs();
		} else {
			//applyTrans(menuRef);
			addEventHandler(window, 'scroll', function() {
				MoveMenu();
			});
			addEventHandler(window, 'resize', function() {
				MoveMenu();
			});
	
		}
	} else {
		setTimeout("showMenu()", 500);
	}
}

function initMenu(){
	setTimeout("showMenu()", 1000);
}

