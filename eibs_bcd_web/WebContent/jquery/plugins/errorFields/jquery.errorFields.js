//Due to Slow Rendering
//Add Wait Div with a Progressing image
$('<div class="wait-div"></div>').prependTo('body');

$(window).load(function() {
	//As Document Renders, WAIT DIV becomes Hidden
	$().ready(function(){
		$('<script type="text/javascript"> ' + 
				'$().ready(function(){removeWaitCursor();})</script>').prependTo('body');
	});
});

$(window).on('beforeunload', function(){
	$(".wait-div").fadeIn("fast");
	//Add Wait Cursor
	$('body').addClass('waiting');
});

//Error Module
//Dynamically load Bootstrap.css to display ToolTips.
//
$('head').append('<link rel="stylesheet" type="text/css" href="' + EIBS.root()  + '/pages/bootstrap.css">');


var addErrorTips = function(errArray){
	//Iterate over Tool Tip mapping and Show toolTip.

	for(var key in errArray){
		//Add Error Class to Visible Input field
		$('input[name="'+key+'"]:visible:enabled').add('select[name="'+key+'"]:visible:enabled').addClass('errorField').attr('data-container','body');
		
		if(!EIBS.BrowserDetect.isIE()){
			$('input[name="'+key+'"]:visible:enabled').add('select[name="'+key+'"]:visible:enabled').tooltip({'title' : errArray[key] , 'placement' : 'right', container : 'body'});
			$('input[name="'+key+'"]:visible:enabled').add('select[name="'+key+'"]:visible:enabled').tooltip('hide');
		}
		
		$('input[name="'+key+'"]:visible:enabled').add('select[name="'+key+'"]:visible:enabled').change(function(){
			$(this).removeClass("errorField");
			if(!EIBS.BrowserDetect.isIE()) {
				$(this).tooltip("disable");
			}
		});
	}
};

//Display Warning Message  After Title
var showWarningMsg = function(wrnArray){
	var msg = "<IMG src='"+ EIBS.root() + "/images/warning01.gif' title='Warning!!!'>";
	var asterick = "";
	if(Object.keys(wrnArray).length != 0){
		for(var key in wrnArray){
			msg += asterick + wrnArray[key] + "<br>";
		}
		//Add Warning to Page
		$("<div class='alert alert-warning' style='text-align:center'>"  + msg + "</div>").insertAfter('hr:first');
	}
};

function addErrorMessages(errorArray){
	var ERROR = EIBS.error;
	
	//Sort errorMaping into Map for Tooltips 
	$.each( errorArray, function ( index, err ) {
		if (!ERROR.errorToolTips[ err.errorField ] && err.errorType != "warning" ){
			 ERROR.errorToolTips[ err.errorField ] = err.errorDSC;
		}

		//Sort errorMaping into Array for Warning Message
		if(err.errorType == "warning"){
			ERROR.warningArray[index] = err.errorDSC;
		}
	});
	
	$(document).ready(function(){
		setTimeout(function(){
			addErrorTips(ERROR.errorToolTips);
			showWarningMsg(ERROR.warningArray)
		}, 500);
	});
}

function addWaitCursor(){
	if($(".wait-div").first().length == 0){
		$('<div class="wait-div" style=" opacity: 0.8;"></div>').prependTo('body');
	}
	
	$(".wait-div").fadeIn("fast");
	$('body').addClass('waiting');		
}

function removeWaitCursor(){
	$(".wait-div").fadeOut("slow");
	$('body').removeClass('waiting');	
}

