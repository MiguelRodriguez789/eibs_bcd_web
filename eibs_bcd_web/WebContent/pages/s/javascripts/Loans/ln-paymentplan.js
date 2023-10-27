//Javascript for Loan Module-Type of Payment Plan

var pagoTypeChangecounter = 0;
var editControlEliminados = ["CE01DEAIIP","AmountROA","E01DLCNC1","E01DLCGM1","E01DLCGD1","E01DLCGY1","E01DLCMN1",
                             "E01DLCMN2","E01DLCMN3","E01DLCIGF","E01DLCIGN"];
var editControlPlandePago = ["FORMADEPAGO","AmountSC1","AmountSC21","AmountSC22","AmountSC3","AmountSC4",
                             "E01DLCFP1","E01DLCTP1","E01DLCPM1","E01DLCPD1","E01DLCPY1","E01DLCIGA","E01FLGPEX",
                             "E01IDAM01","E01IDAC01","E01IDAM05","E01IDAC05","E01IDAM09","E01IDAC09","E01IDAM02",
                             "E01IDAC02","E01IDAM06","E01IDAC06","E01IDAM10","E01IDAC10","E01IDAM03","E01IDAC03",
                             "E01IDAM07","E01IDAC07","E01IDAM11","E01IDAC11","E01IDAM04","E01IDAC04","E01IDAM08",
                             "E01IDAC08","E01IDAM12","E01IDAC12","E01DLCOR1","E01DLCPP1","E01DLCOR2","E01DLCPP2",
                             "E01DLCNC2","E01DLCFP2","E01DLCTP2"];

$().ready(function() {

	//Adjust Ajax Setting prevent Cache
	$.ajaxSettings.cache = false;
	$.ajaxSettings.dataType= "html";
	
	//Loads HTML-Table-AJAX
	loadPlanDePago( isValidObject(getElement("E01FLGFPG")) ? getElement("E01FLGFPG").value : "");
	
	//Add Listeners
	addPlandePagoListener();
	
});

//When User Leaves page, reset sessionStorage Value to False
//Ultimately eliminating an immediate jump the Plan Pago anchor.
$(window).unload(function(){
	sessionStorage.setItem('fromPagoSelection', "false");	
});

function loadPlanDePago(tableNum){
	//getNSValue : security Filter requires all urls to be masked/encrypted
	//			  thus, urls must be parsed and live in jsps
	//      URLS placed in a EIBS.REDIRECT namespace
	//		Function is used to Retrieve Value
	//      getNSVALUE(namespace, desiredAttribute)
	
	$( "#planPago" ).load( getNSValue("REDIRECTS", "loadPlanDePago") ,'planFlag='+tableNum+'&messageName='+EIBS.messageName(),function(){
	
	// Edit Control
	setEditControlPlandePago();
	
		if(window.inquiry){
			//After Load Disables all Fields 
			//Window Inquiry set true in Inquiry Pages. 
			$("input[type='text']").attr("readonly", "readonly").prop("onchange",null).prop("change",null);  
			$("select" ).add("input[type='radio']").add("input[type='checkbox']").attr("disabled", "disabled").prop("onchange",null).prop("change",null);  
			$("img[title='null']").add("img[title='ayuda']").add("img[src$='Check.gif']").hide();
			$("input.context-menu-help").removeAttr("onmousedown").removeClass();
			
		} else {
			//Page allows "Plan de Pago to be modifed
			//Used to keep Scroll Loaction on page. 
			if(sessionStorage.getItem('fromPagoSelection') == "true"){
				$("html, body").animate({ scrollTop: $("#planPago").position().top }, 200);
			}
			//Displays Abono Table if necessary
			UpdateAbono();
		}
		//Corrects Row Color after JSP Parse. 
		setRowColors( $('#pagobutton').find('table').attr('id') );
		
		//Determines if Grace Period Section should be shown 
		nCuotas();
	});
}

function addPlandePagoListener(){
	//Fecha de Pago NNN : E01DEAHED,E01DEARDD
	//Rate Change Date : E01DEARRD
	//SC1,SC2,SC3 : E01DLCXD1

	//Whenever a Date Changes
	//Set Correct Date Value
    $('body').on('change', '#E01DEARDD, #E01DEAHED, #E01DEARRD, #E01DLCXD1' , function() {
    	addDateChangePaymentPlan(this.id);
    });
    
    //When "Valor of Cuota" changes"
    //Total "Numero de Cuotas" set 0
	$('body').on('change', 'input[name="E01DLCVA1"], input[name="E01DLCVA2"]',function(){
		wipeTotalCuotas();
	});
	
	$('body').on('change', 'input[name="E01DEAODM"], input[name="E01DEAODD"]', 'input[name="E01DEAODY"]',function(){
		wipeFecha();
		wipeValorCuota();
	});	
	
	$('body').on('change', 'input[name="E01DEARTE"], input[name="E01DEAOAM"]',function(){
		wipeValorCuota();
	});			
	
	//When Grace Period Changes
	//Set Recalculate Flag
	//Wipe "valor de Cuota" and Dates of Next Payment
	//Determine Presentation in metho nCuotas
	$('body').on('change', 'input[name="E01DLCGY1"], input[name="E01DLCGD1"], input[name="E01DLCGM1"] ',function(){
		if(typeof(setRecalculate) == 'function'){
			setRecalculate(true);
		}
		amountRecalculate();
		wipeValorCuota();
		wipeFechaProxPago();
		nCuotas();		
	});	
}

function addDateChangePaymentPlan(id){
	createPaymentPlanChangeDate();
	if(id == "E01DEARDD"){ //Fecha de Pago NNN
		getElement("E01DEAIDY").value = getElement(id).value;
	}
	if(id == "E01DEAHED"){ //Fecha de Pago NNN
		getElement("E01DEAPDY").value = getElement(id).value;
	}
	if(id == "E01DEARRD"){ //Rate Change Date
		getElement("E01DEACDY").value = getElement(id).value;
	}
	if(id == "E01DLCXD1"){ //SC1,SC2,SC3
		getElement("E01DEAPDY").value = getElement(id).value;
	}
}

//When Valor de Cuotas changes
//Zeros next payment date
function wipeFechaProxPago(){
	if (isValidObject(getElement("E01DLCXM1"))) {
		getElement("E01DLCXM1").value = 0;
		getElement("E01DLCXD1").value = 0;
		getElement("E01DLCXY1").value = 0;
		addDateChangePaymentPlan("E01DLCXD1");
		$("input[name='E01DLCXD1']").trigger("change");
	}
	if (isValidObject(getElement("E01DLCXM2"))) {
		getElement("E01DLCXM2").value = 0;
		getElement("E01DLCXD2").value = 0;
		getElement("E01DLCXY2").value = 0;
		addDateChangePaymentPlan("E01DLCXD2");
		$("input[name='E01DLCXD2']").trigger("change");
	}
}

function createPaymentPlanChangeDate(){
	//Create Missing Inputs Needed for AS400 validation
	//Values Placed in addDateChangePaymentPlan method
	
	if(!isValidObject(getElement("E01DEACDY")) && isValidObject(getElement("E01DEARRD"))){
			crtInput("E01DEACDY", "hidden");			
	}
		
	if(!isValidObject(getElement("E01DEAPDY")) && (isValidObject(getElement("E01DEAHED")) || isValidObject(getElement("E01DLCXD1"))) ){
			crtInput("E01DEAPDY", "hidden");			
	}

	if(!isValidObject(getElement("E01DEAIDY")) && isValidObject(getElement("E01DEARDD"))){
			crtInput("E01DEAIDY", "hidden");			
	}
}

function wipeValorCuota(){
	//Only Set "Valor de Cuotas" to 0  
	//if number of "cuotas" is different from 0/*blanks;
	if (!EIBS.isNewLoan()){
		return;
	}
	var totcuo = 0;
	//Code for SC1/SC2/SC3 payment plans
	if (isValidObject(getElement("E01DLCVA1"))){
		if (isValidObject(getElement("E01DLCNC1"))) {
			totcuo = parseFloat((document.forms[0].E01DLCNC1.value));
			totcuo = isNaN(totcuo) ? 0 : totcuo;
			if (totcuo != 0) {
				getElement("E01DLCVA1").value = 0.00;
				//getElement("E01DLCVA1").readOnly = true;
			} else {
				//getElement("E01DLCVA1").readOnly = false; 
			}
		}
	}
	
	//Code for SC2 Payment Plan
	if (isValidObject(getElement("E01DLCVA2"))) {
		if (isValidObject(getElement("E01DLCNC2"))) {
			totcuo = parseFloat((document.forms[0].E01DLCNC2.value));
			totcuo = !isNaN(totcuo) ? 0 : totcuo;
			if (totcuo != 0) {
				getElement("E01DLCVA2").value = 0.00;
				//getElement("E01DLCVA2").readOnly = true;
			} else {
				//getElement("E01DLCVA2").readOnly = false;
			}
		}
	}

	//Code for NNN Payment Plan
	if (isValidObject(getElement("E01DEAROA"))) {
	   totcuo = parseFloat((document.forms[0].E01DEAROA.value));
	   totcuo = isNaN(totcuo) ? 0 : totcuo;
	   if (totcuo != 0) {				
		   getElement("E01DEAROA").value = 0.00;
		   //getElement("E01DEAROA").readOnly = true;	
	   }
	}
}

//Method Invoked when Select BOX FORMADEPAGO changes
//Indicates a new "plan de pago" template to be displayed
//Session Storage used to Control Scroll 
function pagoTypeChange(element) {
	if(typeof(setRecalculate) == 'function'){
		setRecalculate(true);
	}
	getElement("E01FLGFPG").value = getElement("FORMADEPAGO").value ;		
	if( pagoTypeChangecounter < 1 ){
		if (isValidObject(getElement(element))) {
			getElement(String(element)).style.display = 'none';
		}
	}
	pagoTypeChangecounter++;
	sessionStorage.setItem('fromPagoSelection', "true");	
	loadPlanDePago(getElement("E01FLGFPG").value);
}

//Method Invoked After LoanPaymentPlan is loaded into jsp
//Indicates the Table-Rows/Table Cells to be displayed
//Based on the E01DLCIGF and Grace Period
function nCuotas(){
	if (isValidObject(getElement("E01DLCIGF"))) {
		if(isValidObject(getElement("num1"))){
			if(getElement("E01DLCIGF").value == ("3")){
				document.getElementById("num1").style.display = 'block';
				document.getElementById("num2").style.display = 'block';
				document.getElementById("num3").style.display = 'none';
				document.getElementById("num4").style.display = 'none';
			} else {
				document.getElementById("num1").style.display = 'none';
				document.getElementById("num2").style.display = 'none';
				document.getElementById("num3").style.display = 'block';
				document.getElementById("num4").style.display = 'block';
			}
		}
		
		//SC1 and SC3 Plan de Pago Have Grace Period Options
		//Table-Row "Gracias" Shown when Grace Date is Changed
		if(isValidObject(getElement("gracias"))){
		 	if (isValidObject(getElement("E01DLCGM1")) && isValidObject(getElement("E01DLCGD1")) && isValidObject(getElement("E01DLCGY1"))) {
		 		if( (getElement("E01DLCGM1").value != ("0") && getElement("E01DLCGM1").value.trim() != ("")) || (getElement("E01DLCGD1").value != ("0") && getElement("E01DLCGD1").value != ("")) ||
					(getElement("E01DLCGY1").value != ("0") && getElement("E01DLCGY1").value != ("")) ){
					getElement("gracias").style.display = 'table-row';
				} else {
					getElement("gracias").style.display = 'table-row';
				  //getElement("gracias").style.display = 'none';
		 		}
			 	setRowColors($('#pagobutton').find('table').first().attr("id"));	
		 	}
		}

	}
	
}
//Called After a Change of Date
function wipeTotalCuotas(){
	if (!EIBS.isNewLoan()){
		return;
	}
	var vlrcuo = 0;
	if (isValidObject(getElement("E01DLCNC1"))){
		if (isValidObject(getElement("E01DLCVA1"))) {
			vlrcuo = parseFloat((document.forms[0].E01DLCVA1.value));
			vlrcuo = isNaN(vlrcuo) ? 0 : vlrcuo;
			if (vlrcuo != 0) {
				getElement("E01DLCNC1").value = 0;
				getElement("E01DLCNC1").readOnly = true;
			} else {
				getElement("E01DLCNC1").removeAttribute("readonly");
				getElement("E01DLCNC1").readOnly = false;
			}
		}
	}
	if (isValidObject(getElement("E01DLCNC2"))){
		if (isValidObject(getElement("E01DLCVA2"))) {
			vlrcuo = parseFloat((document.forms[0].E01DLCVA2.value));
			vlrcuo = isNaN(vlrcuo) ? 0 : vlrcuo;
			if (vlrcuo != 0) {
				getElement("E01DLCNC2").value = 0;
				getElement("E01DLCNC2").readOnly = true;
			} else {
				getElement("E01DLCNC2").removeAttribute("readonly");
				getElement("E01DLCNC2").readOnly = false;
			}
		}
	}
}

function UpdateAbono(val) {
	if (isValidObject(getElement("E01FLGPEX"))) {
		getElement("E01FLGPEX").value = (val) ? "Y" : "";
		if (getElement("E01FLGPEX").checked){
			document.getElementById("abono").style.display = 'inline-table';
			document.getElementById("AbonoTitle").style.display = 'block';
		} else {
			document.getElementById("abono").style.display = 'none';
			document.getElementById("AbonoTitle").style.display = 'none';
		}
	}
}

function amountRecalculate() {
	if (!EIBS.isNewLoan()){
		return;
	}
	if (isValidObject(getElement("AmountSC1"))) {
		getElement("AmountSC1").checked = true;
		getElement("AmountSC1").disabled = false;
		UpdateAmountFlag(true);  
	}
	if (isValidObject(getElement("AmountSC21"))) {
		getElement("AmountSC21").checked = true;
		getElement("AmountSC21").disabled = false;
		UpdateAmountFlag(true);  
	}
	if (isValidObject(getElement("AmountSC22"))) {
		getElement("AmountSC22").checked = true;
		getElement("AmountSC22").disabled = false;
		UpdateAmountFlag(true);  
	}
	if (isValidObject(getElement("AmountSC3"))) {
		getElement("AmountSC3").checked = true;
		getElement("AmountSC3").disabled = false;
		UpdateAmountFlag(true);  
	}
	if (isValidObject(getElement("AmountSC4"))) {
		getElement("AmountSC4").checked = true;
		getElement("AmountSC4").disabled = false;
		UpdateAmountFlag(true);  
	}
	if (isValidObject(getElement("AmountROA"))) {
		getElement("AmountROA").checked = true;
		getElement("AmountROA").disabled = false;
		UpdateAmountFlag(true);  
	}
}

function UpdateAmountFlag(val) {
	if(isValidObject(getElement("E01FLGFVE"))){
		getElement("E01FLGFVE").value = (val) ? "Y" : "";
	}
}

function valTotalCuota(){
	if (!EIBS.isNewLoan()){
		return;
	}
	var totcuo = 0;
	if (isValidObject(getElement("E01DLCVA1"))){
		if (isValidObject(getElement("E01DLCNC1"))) {
			totcuo = parseFloat((document.forms[0].E01DLCNC1.value));
			totcuo = isNaN(totcuo) ? 0 : totcuo;
			if (totcuo > 0) {
				wipeValorCuota();
			}
		}
	}
	if (isValidObject(getElement("E01DLCVA2"))) {
		if (isValidObject(getElement("E01DLCNC2"))) {
			totcuo = parseFloat((document.forms[0].E01DLCNC2.value));
			totcuo = !isNaN(totcuo) ? 0 : totcuo;
			if (totcuo > 0) {
				wipeValorCuota();
			}
		}
	}
}

function wipeFecha(){
	createPaymentPlanChangeDate();
	if (isValidObject(getElement("E01DEAODM")) || isValidObject(getElement("E01DEAODD")) || isValidObject(getElement("E01DEAODY"))){
		if (isValidObject(getElement("E01DLCXM1")) || isValidObject(getElement("E01DLCXD1")) || isValidObject(getElement("E01DLCXY1"))) {
	        getElement("E01DLCXM1").value = 0;
	        getElement("E01DLCXD1").value = 0;
	        getElement("E01DLCXY1").value = 0;
			$("input[name='E01DLCXD1']").trigger("change");
	    }
		
		if (isValidObject(getElement("E01DLCXM2")) || isValidObject(getElement("E01DLCXD2")) || isValidObject(getElement("E01DLCXY2"))) {
	        getElement("E01DLCXM2").value = 0;
	        getElement("E01DLCXD2").value = 0;
	        getElement("E01DLCXY2").value = 0;
			$("input[name='E01DLCXD2']").trigger("change");	
		}
		
		if (isValidObject(getElement("E01DEARDM")) || isValidObject(getElement("E01DEARDD")) || isValidObject(getElement("E01DEARDY"))) {
	        getElement("E01DEARDM").value = 0;
	        getElement("E01DEARDD").value = 0;
	        getElement("E01DEARDY").value = 0;
			$("input[name='E01DEARDD']").trigger("change");	
		}
		
		if (isValidObject(getElement("E01DEAHEM")) || isValidObject(getElement("E01DEAHED")) || isValidObject(getElement("E01DEAHEY"))) {
	        getElement("E01DEAHEM").value = 0;
	        getElement("E01DEAHED").value = 0;
	        getElement("E01DEAHEY").value = 0;
			$("input[name='E01DEAHED']").trigger("change");	
		}
		
	}
}

function resetGraciaDate(){
 	if (isValidObject(getElement("E01DLCIGA"))) {
 		getElement('E01DLCIGA').value = 0;
 	}
}

function resetGraciaAmount(){
 	if (isValidObject(getElement("E01DLCGM1")) && isValidObject(getElement("E01DLCGD1")) && isValidObject(getElement("E01DLCGY1"))) {
 		getElement('E01DLCGM1').value = 0;
 		getElement('E01DLCGD1').value = 0;
 		getElement('E01DLCGY1').value = 0;
 	}
}

function setRowColors(table){
    $('#'+table+ ' tr:visible:odd').removeClass('trdark').addClass('trclear').css('background-color', getStyleCSS(".trclear","background-color"));
	$('#'+table+ ' tr:visible:even').removeClass('trclear').addClass('trdark').css('background-color',getStyleCSS(".trdark","background-color")); 
}

function setEditControlPlandePago(){
	// Executes on DOC.Ready.
	// Control de Edicion para los campos definidos en editControl
	if (!isValidObject(getElement('editCntrl')) || getElement('editCntrl').value !== "Y") {
		return;
	}
	if (editControlPlandePago != null) {
		$.each(editControlPlandePago, function(key, eleEdit) {
			if (isValidObject(eleEdit)){
				try {
					// readOnly true
					getElement(eleEdit).readOnly = true;

					// disable true for [INPUT]
					if (getElement(eleEdit).tagName == "INPUT") {
						$("input[name="+eleEdit+"]").attr('disabled', true);
						$("input[name="+eleEdit+"]").removeAttr("onmousedown").removeClass();
					}

					// disable true for [SELECT]
					if (getElement(eleEdit).tagName == "SELECT") {
						$("select[name="+eleEdit+"]").attr('disabled', true);
					} 
					
					// remove Help Link
					var fndHelp = $('a[href*='+eleEdit+']');
					$(fndHelp).each(function(key, eleLink) {
						$(this).remove();
						return false;
					});
				}
				catch (err) {
				}
			}
		});
	}
	// Actualiza Fecha de Apertura con la Fecha del Sistema
	if (isValidObject("E01DEAODD") && isValidObject("E01RDD")){
		var opndte = parseInt(getElement("E01DEAODY").value)*10000+parseInt(getElement("E01DEAODM").value)*100+parseInt(getElement("E01DEAODD").value);
		var rundte = parseInt(getElement("E01RDY").value)*10000+parseInt(getElement("E01RDM").value)*100+parseInt(getElement("E01RDD").value);
		if (rundte != opndte) {
			getElement("E01DEAODM").value = getElement("E01RDM").value;
			getElement("E01DEAODD").value = getElement("E01RDD").value;
			getElement("E01DEAODY").value = getElement("E01RDY").value;
			wipeFecha();
			wipeValorCuota();
		} 
	}
}

