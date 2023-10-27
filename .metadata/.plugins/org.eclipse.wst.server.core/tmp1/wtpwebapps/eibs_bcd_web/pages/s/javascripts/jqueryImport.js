function IncludeJQuery(jsFile) {
		document.write('<script type="text/javascript" src="' + jsFile + '"></script>');
}

if(EIBS.BrowserDetect.IECompatibility()){
	IncludeJQuery(EIBS.root() + '/jquery/jquery-1.10.2.min.js');
} else {
	IncludeJQuery(EIBS.root() + '/jquery/jquery-2.1.4.min.js');
}
IncludeJQuery(EIBS.root() + '/jquery/plugins/contextMenu/jquery.contextMenu.js');
IncludeJQuery(EIBS.root() + '/jquery/plugins/contextMenu/jquery.ui.position.js');
IncludeJQuery(EIBS.root() + '/jquery/jquery-ui-1.10.4.min.js');
IncludeJQuery(EIBS.root() + '/pages/s/javascripts/context.menu.help.js');
IncludeJQuery(EIBS.root() + '/pages/s/javascripts/bootstrap.min.js');
IncludeJQuery(EIBS.root() + '/jquery/plugins/errorFields/jquery.errorFields.js');


function deferJquery(method) {
    if (window.jQuery)
        method(window.jQuery);
    else
        setTimeout(function() { deferJquery(method) }, 50);
}

deferJquery( 
	//ReDefine $.param function
	//Filters out empty Objects, Stringifies Arrays
	function($){
	    var $originalParam = $.param;
	     $.param = function (){
	     	if(arguments[0]){
	     		var data = arguments[0];
				if(typeof data !== 'string'){
					$.each(data,function(i, n){
						if(typeof n === 'object' && n.length == 0){
							delete data[i];
						} else if(n instanceof Array && n.length > 0){
							data[i] = n.toString();
						}
					});
				}
			}
		  return $originalParam.apply(this,arguments);     
	     };
	}
);

//Function That Redifnes Enter KeyPress
//ReBinds to whatever function
deferJquery(
	function($){
		if(typeof $.fn.pressEnter === 'undefined'){
		$.fn.pressEnter = function(fn){
			return this.each(function(){
				$(this).bind('enterPress', fn);
				$(this).keypress(function(evt){
					if(String(evt.keyCode) === '13'){
						evt.preventDefault()
						$(this).trigger("enterPress");
					}
					});
				});
			}
		}
	}
);

function setInputNameAsId(){
    $(":input").each(function(){
        if( ! $(this).attr("id") || $(this).attr("id") === "" ){
        	$(this).attr("id", $(this).attr("name" ) );
        }
    });
}