//Functions for loan Opening
//These functions range from Utility
// to helpers that modify the CSS of page. 
//Prototype FloatRate Object Defined in Loan.js
//Doc Ready at End

var	activeProduct = new EIBS.LOAN.FloatRate(); 
var passiveProduct = null;
var editControlOpening = ["E01DEAFTB","E01DEAFTY",
                          "E01DEACLF","E01DEAICT","E01DEARTE","E01DEASPR","E01DEABAS","E01DEAMIR","E01DEAIFL",
                          "E01DEAMXR","E01DEAPCL","E01DEAPEI","E01DEAPIF","E01DEABNK","E01DEABRN","E01DEAREF",
                          "E01DEARTB","E01DEATLN","E01DEAOFT","E01DEADLC","E01DEABRK","E01DEABCP",
                          "E01DEARRP","E01DEARRM","E01DEARRD","E01DEARRY","E01DEASTC","E01DEAEDM","E01DEAEDD",
                          "E01DEAEDY","E01DEAPAR","E01DEAPAC","E01DEARET","E01DEAREA","E01DEAFLY","E01DEAXRF",
                          "E01DEAEXR","E01DEAPP1","E01DEAPP2","E01DEAPP3","E01DEAPP4","E01DEAPP5","E01DEAPP6",
                          "E01DEAPP8","E01DEAHFQ","E01DEAOAM","E01BALNET","E01DEAODA","RECALC","futureRates",
                          "comissionTable","GetFloating","lnGetOver","lnGetFact","GetBranch","GetRateTable",
                          "GetLoanTable","GetLoanChargeTable","GetCondicionesCode","GetRel1","GetRel2","GetAccount",
                          "GetBroker"];

activeProduct.setFlag('E01FLGFLT')
	.setFloatTable('E01DEAFTB')
	.setFloatType('E01DEAFTY')
	.setRow1('FLOATINGTABLE')
	.setRow2('FLOATINGTABLE2')
	.setSpread('E01DEARTE')
	.setFloatPrimary('PRIMARYRATE')
	.setFloatSecondary('SECONDARYRATE')
	.setFloatNominal('E01FLTORG')
	.setFloat('E01FLTRTE')
	.setAddRate('E01DEARTX')
	.setTotalRate('E01LNSRTE')
	.setFloatOpt('E01DEAFLX')
	.setSection('tableBasicInfo')
	.setEffective('E01DEASPR');

function cuentas(){
//	Function Reveals Different ROWS Based on selection DEAPVI
//	' '=Caja  '1'=Automatico  '2'=Convenio  '3'=Multiple  '4'=PACMultibanco
	if(document.getElementById("E01DEAPVI").value == ("3")){
		document.getElementById("convenioTable").style.display = 'none';
		document.getElementById("multicuenta").style.display = 'table-row';
		document.getElementById("autocuenta").style.display = 'none';
		document.getElementById("convenioAsignar").style.display = 'none';
		document.getElementById("intento").style.display = 'table-cell';
		document.getElementById("intento2").style.display = 'table-cell';
	} else if (document.getElementById("E01DEAPVI").value == ("1") || document.getElementById("E01DEAPVI").value == ("4")) {
		document.getElementById("convenioTable").style.display = 'none';
		document.getElementById("multicuenta").style.display = 'none';
		document.getElementById("autocuenta").style.display = 'table-row';
		document.getElementById("convenioAsignar").style.display = 'none';
		document.getElementById("intento").style.display = 'none';
		document.getElementById("intento2").style.display = 'none';
	} else if (document.getElementById("E01DEAPVI").value == ("2")) {
		document.getElementById("convenioTable").style.display = 'table-row';
		document.getElementById("multicuenta").style.display = 'none';
		document.getElementById("autocuenta").style.display = 'none';
		document.getElementById("convenioAsignar").style.display = 'table-row';
		document.getElementById("intento").style.display = 'none';
		document.getElementById("intento2").style.display = 'none';
		if (!EIBS.isNewLoan() || (isValidObject(getElement("E01CNVFL1")) && (document.getElementById("E01CNVFL1").value != ("Y"))) ) {
			document.getElementById("autocuenta").style.display = 'table-row'; 
		}
	} else {
		document.getElementById("convenioTable").style.display = 'none';
		document.getElementById("multicuenta").style.display = 'none';
		document.getElementById("autocuenta").style.display = 'none';
		document.getElementById("convenioAsignar").style.display = 'none';
		document.getElementById("intento").style.display = 'none';
		document.getElementById("intento2").style.display = 'none';
	}
}

function UpdateFlag(val) {
	getElement("E01FLGRCL").value = (val) ? "X" : "";
}

function UpdateAmountFlag(val) {
	getElement("E01FLGFVE").value = (val) ? "Y" : "";
}
 
function setRecalculate() {
	if (isValidObject(getElement("RECALC"))) {
		getElement("RECALC").checked = true;
		getElement("RECALC").disabled = true;
		UpdateFlag(true);  
	}
}
 
function UpdateFlag3(val) {
  document.forms[0].H02FLGWK3.value = (val==true)?"X":"";
}

function setRecalculate3() {
	  UpdateFlag3(false);	  
}

function updateAmount() {
	setRecalculate();
	recalcDist();
}

function recalcDist() {
	//Redoes the Summation of the Distribution Section
	
	var totoam = 0.00; var totcrn = 0.00; var totimp = 0.00; var totcom = 0.00;
	var totded = 0.00; var totsgr = 0.00; var totiva = 0.00; var totgmf = 0.00; 
	var tototh = 0.00; var totpin = 0.00; var totdes = 0.00;
	var totnet = 0.00; var totsal = 0.00; var totorn = 0.00;


	if (isValidObject(getElement("E01TOTORN"))) {
		totorn = parseFloat((document.forms[0].E01TOTORN.value)).round(2);
	}
	if (isValidObject(getElement("E01TOTCRN"))) {
		totcrn = parseFloat((document.forms[0].E01TOTCRN.value)).round(2);
	}
	if (isValidObject(getElement("E01TOTIMP"))) {
		totimp = parseFloat((document.forms[0].E01TOTIMP.value)).round(2);
	}
	if (isValidObject(getElement("E01TOTCOM"))) {
		totcom = parseFloat((document.forms[0].E01TOTCOM.value)).round(2);
	}
	if (isValidObject(getElement("E01TOTDED"))) {
		totded = parseFloat((document.forms[0].E01TOTDED.value)).round(2);
	}
	if (isValidObject(getElement("E01TOTSGR"))) {
		totsgr = parseFloat((document.forms[0].E01TOTSGR.value)).round(2);
	}
	if (isValidObject(getElement("E01TOTIVA"))) {
		totiva = parseFloat((document.forms[0].E01TOTIVA.value)).round(2);
	}
	if (isValidObject(getElement("E01TOTGMF"))) {
		//totgmf = parseFloat((document.forms[0].E01TOTGMF.value)).round(2);
	}
	if (isValidObject(getElement("E01TOTOTH"))) {
		tototh = parseFloat((document.forms[0].E01TOTOTH.value)).round(2);
	}
	if (isValidObject(getElement("E01TOTPIN"))) {
		totpin = parseFloat((document.forms[0].E01TOTPIN.value)).round(2);
	}
	if (isValidObject(getElement("E01TOTPIN"))) {
		totpin = parseFloat((document.forms[0].E01TOTPIN.value)).round(2);
	}
	if (isValidObject(getElement("DSTOT"))) {
		totdes = parseFloat((document.forms[0].DSTOT.value)).round(2);
	}
	
	if (isValidObject(getElement("E01DEAOAM"))) {
		if(getElement("E01FLGREF").value != "N"){
			totoam = totorn + totcrn + totimp + totcom + totded + totsgr + totiva + totgmf + tototh + totpin;
			document.forms[0].E01DEAOAM.value = formatCCY(totoam.round(2));
		
		} else {
			totoam = parseFloat((document.forms[0].E01DEAOAM.value)).round(2)
			getElement("E01DEAOAM").value = formatCCY(getElement("E01DEAOAM").value);			
			
		} 
	
	}
	if (isValidObject(getElement("E01BALNET"))) {
		totnet = totoam - totorn- totcrn - totimp - totcom - totded - totsgr - totiva - totgmf - tototh - totpin;
		document.forms[0].E01BALNET.value = formatCCY(totnet.round(2));
	}
	if (isValidObject(getElement("SALNET"))) {
		totsal = totnet - totdes;
		document.forms[0].SALNET.value = formatCCY(totsal.round(2));
	}
}

function reverseCalculate(balnet){
	//Zeros DEAOAM in order for System to recalculate DEOAM based on new value of "Monto Neto"
	//Function Called from Monto Neto(Desembolso)
	if(balnet.value < 0){
		balnet.value = formatCCY("0.00");		
	}else if(balnet.value > 0){
		if(isValidObject("E01DEAOAM")) getElement("E01DEAOAM").value = formatCCY("0.00");
		balnet.value = formatCCY(balnet.value);
		setRecalculate(true);
		//submitPage(document.forms[0].Submit);
	}
}

function changeEntity(){
	if(isValidObject("E01DLCRFS")) getElement("E01DLCRFS").value = formatCCY("0.00");
}

function typeOfInterest(elem,firsTime){
	//Executes on Type of Interest: Change Event and Doc.Ready
	//Only changes Form Elements if is New Loan.
	if(elem.attributes["name"].value == "E01DEAICT" && EIBS.isNewLoan()){
		if(isNumeric(elem.value)){
			if(isValidObject("E01DEARTE")){
				//getElement("E01DEARTE").value = "0.000000"
				getElement("E01DEARTE").readOnly = false;
				getElement("futureRates").style.display = 'none';
			}
		} else if (parseInt(getElement(activeProduct.flag).value) != 2){
			getElement("E01DEARTE").readOnly = false;
			getElement("futureRates").style.display = '';			
		}
	}
	if(firsTime != true){ 
		if (typeof wipeValorCuota !== 'undefined') { wipeValorCuota();}
	}
}

function setFNG(value){
	if (value == "Y"){
		getElement("fngTD1").style.display = '';
		getElement("fngTD2").style.display = '';
	} else {
		getElement("fngTD1").style.display = 'none';
		getElement("fngTD2").style.display = 'none';
	}
	EIBS.UTILS.updateTableCSS('tableBasicInfo');
}

function setMLG(value){
	if (value == "Y"){
		getElement("mlgTD1").style.display = '';
		getElement("mlgTD2").style.display = '';
	} else {
		getElement("mlgTD1").style.display = 'none';
		getElement("mlgTD2").style.display = 'none';
	}
	EIBS.UTILS.updateTableCSS('tableBasicInfo');
}

function setDesembolso(value){
	if (value == "Y"){
		$('#divDesembolso').hide();
		$('#trNovacion').show();
	} else {
		$('#divDesembolso').show();
		$('#trNovacion').hide();
	}
	EIBS.UTILS.updateTableCSS('tableBasicInfo');
}

function resetMatDate(){
	getElement('E01DEAMAM').value = 0;
	getElement('E01DEAMAD').value = 0;
	getElement('E01DEAMAY').value = 0;
	amountRecalculate();
	if (typeof resetGraciaDate !== 'undefined') { resetGraciaDate();}
	if (typeof resetGraciaAmount !== 'undefined') { resetGraciaAmount();}
	amountRecalculate();	
}


function modifyPrioritySelection(){
	//Executes on DOC.Ready. 
	//Disables Priority Select Box values that have already been selected.
	$.each(SELECT_BOX, function(index,field){
		$("#"+field.id+" option").removeAttr("disabled");
	}); 
	$.each(SELECT_BOX, function(index,field){
		var SELECT_BOX_VALUE = field.value;                          
		if(SELECT_BOX_VALUE.trim() !== ""){     
			$.each(SELECT_BOX, function(indexInner,fieldInner){
				if(field !== fieldInner){
					$("#"+fieldInner.id+" option[value="+SELECT_BOX_VALUE+"]").attr("disabled","disabled");
				}
			});
		}
	});
}

function setEditControl(){
	// Executes on DOC.Ready.
	// Control de Edicion para los campos definidos en editControl
	if (!isValidObject(getElement('editCntrl')) || getElement('editCntrl').value !== "Y") {
		return;
	}
	if (editControlOpening != null) {
		$.each(editControlOpening, function(key, eleEdit) {
			isControl = false; 
			if (isValidObject(eleEdit)){
				try {
					// readOnly true
					getElement(eleEdit).readOnly = true;
					// disable true for [INPUT]
					if (getElement(eleEdit).tagName == "INPUT") {
						isControl = true;
						$("input[name="+eleEdit+"]").attr('disabled', true);
						$("input[name="+eleEdit+"]").removeAttr("onmousedown").removeClass();
						// remove Help Link (DatePicker)
						var fndHelp = $('a[href*=DatePicker]');
						$(fndHelp).each(function(key, eleLink) {
							var fndLink = $(eleLink).attr('href');
							if (fndLink.indexOf(eleEdit) != -1){
								$(this).remove();
								return false;
							}
						});
						var fndHelp = $('a[href*=GetCode]');
						$(fndHelp).each(function(key, eleLink) {
							var fndLink = $(eleLink).attr('href');
							if (fndLink.indexOf(eleEdit) != -1){
								$(this).remove();
								return false;
							}
						});
					} 
					// disable true for [SELECT]
					if (getElement(eleEdit).tagName == "SELECT") {
						isControl = true;
						$("select[name="+eleEdit+"]").attr('disabled', true);
					} 
					// display none for [IMG]
					if (getElement(eleEdit).tagName == "IMG") {
						isControl = true;
						getElement(eleEdit).style.display = 'none';
					} 
				} catch (err) {
				}
			}
			// remove Help Link
			if (!isControl) {
				try {
					var fndHelp = $('a[href*='+eleEdit+']');
					$(fndHelp).each(function(key, eleLink) {
						$(this).remove();
					});
				} catch (err) {
				}
			}
		});
	}
}

function iFrameCheck() {
	//If Iframe did not load properly, retry.
	var totalFrames = $('iframe').length;
	
	$("iframe").each(function(index) { 
		  var $index = index; 
		  var $this = $(this);
		  setTimeout(function(){
				if ($index == totalFrames -1){
					recalcDist();
				}			  	
				var title = $this.contents().find('title').text();
			    if (title.indexOf('Error') == -1 && title.indexOf('Untitled Document') == -1 && title.indexOf('PSocket no open') == -1) {
			    	return;
			    } else {
			    	//Reload Iframe because improper load
			    	$this.attr("src", $this.attr("src"));
			    	return;
			    }
			  }, 3500);
	});
}

//Ajax Call to update Comissions Module
function calCharges(go2URL, flgSelector){
		$.ajax({
		    type: "post", 
			data : $('form').serialize(),
			url : go2URL,
			beforeSend : function(){ addWaitCursor();},
			success: function(data,text){ 
				calchargesSucces(data, text);
			},
			error: function(request, status, error){
				calchargesError(request, status, error, flgSelector);
			},
			complete: function(){ removeWaitCursor();}
		});		
		
		function calchargesSucces(data, text){
			if(typeof data !== 'object'){
				data = $.parseJSON(data);
			}
			if (data.type == "ERROR") {
				showErrors();
			} else {//Display New Comission Charges
				//Reload Iframe to display new Comissions.
				loadIframes(true);
			}
		}
	
		function calchargesError(request, status, error, flg){
			$(flg).val('X') ;
			setRecalculate();
			scriptLog("Request Error: " + String(error));
		}		
}

function addListeners(){
	//Hidden Div Button-------------------------------------
	if(isValidObject(getElement("hiddenDivNew"))){
		addEventHandler(getElement("hiddenDivNew"), 'click', cancelBub)
	}
	if(EIBS.isNewLoan()){
		//Convenio-------------------------------------
		$('#E01DEACNV').change(function(){
			UpdateAmountFlag(true);
			calCharges(getNSValue("REDIRECTS", "recConvenio"), "#E01FLGCNV");
		});
		
		//Tabla de Cargos-------------------------------------
		$('#E01DEAOFT').change(function(event){
			event.preventDefault();
			event.stopPropagation();
			calCharges(getNSValue("REDIRECTS", "calCharges"), "#E01FLGCHG");
		});
	}
	
	//Consultar Garantia-------------------------------------
	$('.garantiaInq').change(function(){
		if($(this).val() > 0){//Get Last Character. This is index used in $ selector.
			$('#garbtn'+ $(this).attr("name").slice(-1)).css("visibility","visible");
		} else {
			$('#garbtn'+ $(this).attr("name").slice(-1)).css("visibility","hidden");
		}
		//Show Visible Button only if Garantia Reference exists.
	});

	
	//Plazo de Terminio.Maturity Date---------------------------
	$('#E01DEATRM').change(function(){
		resetMatDate();
	});	
	
	//Plazo de Terminio.Maturity Date---------------------------
	$('#E01DEATRC').change(function(){
		resetMatDate();
	});	
	
	//Select Boxes for Payment Priority---------------------------
	SELECT_BOX = $("#tableSelect tr:first select");	
	
	SELECT_BOX.each(function(index,field){
        $("#"+field.id+"").change(modifyPrioritySelection)
    });	

	
	//On Submit, undisable disabled elements---------------------------
	//Solves the problem of Elements not being sent in HTTP Request
	$("input.EIBSBTN[name='Submit']").prop("onclick",null);
	$("input.EIBSBTN[name='Submit']").click(function(){
		$("select[disabled ='true']").add($("select[disabled ='disabled']")).add('input[type=checkbox]:disabled').prop("disabled", false);
		$(this).prop("disabled", true);
		$('body').first().addClass('waiting');
		document.forms[0].submit();
	});
}

function executeOnReady(){
	cuentas(); //Function Reveals Different ROWS in Forma de Pago. Based on selection DEAPVI
	goSubsidizedRate();  //	Function Calculates Subsidized Rate.
	typeOfInterest(getElement('E01DEAICT'),true);
	setDesembolso(getRadioVal('E01DEAECU'));	
	
	//Disables Select Box Options in Priority Payment Section
	modifyPrioritySelection();
	
	//If FOMENTO Section EXISTS, Create new Float Rate Object
	if(isValidObject(getElement('FLOATINGTABLE_FOMENTO'))) {
		passiveProduct = new EIBS.LOAN.FloatRate(); 
		passiveProduct.setFlag('E01PLGFLT')
				.setFloatTable('E01PFNFTB')
				.setFloatType('E01PFNFTY')
				.setRow1('FLOATINGTABLE_FOMENTO')
				.setRow2('FLOATINGTABLE_FOMENTO2')
				.setSpread('E01PFNRTE')
				.setFloatPrimary('PRIMARYRATE_FOMENTO')
				.setFloatSecondary('SECONDARYRATE_FOMENTO')
				.setFloatNominal('E01PLTORG')
				.setFloat('E01PFNFRT')
				.setAddRate('E01PFNRTX')
				.setTotalRate('E01PTORTE')
				.setFloatOpt('E01PFNFLX')
				.setSection('tableCreditoPasivo')
				.setEffective('E01PFNSPR');		
	}	
	
	//Displays the correct Field dependent on Float Rate variables
	activeProduct.rateDisplay();	
	if(passiveProduct != null) passiveProduct.rateDisplay();
	
}

function reloadIFrame(name) {	
	// Esta funcion se llama desde los iframes
	if (isValidObject(document.getElementById(name))) {
		var iframe = document.getElementById(name);
		var source = iframe.src.replace("ACT=N", "ACT=S");;
		iframe.src = source;
	}
}

function modifyCSS(){
	//Adjust Assets Table Columns to be equal
	//adjustEquTables(getElement('headTableAsset'), getElement('dataTableAsset'), getElement('dataDiv1Asset'), 1, false ,"85");
	//updateTableCSS redraws TRDARK/TRCLEAR of a table.
	
	EIBS.UTILS.updateTableCSS(activeProduct.section);
	if(passiveProduct != null) { EIBS.UTILS.updateTableCSS(passiveProduct.section); };
}

//JQUERY ONCHANGE LISTENERS
$( document ).ready(function() { 
	//Global Customer VAR
	Customer = getElement("E01DEACUN").value;	
	
	//Load Cargo Addicionales and Load Seguros iframe
	loadIframes();

	//Add Event Listeners to Various Fields
	addListeners();
	
	//Onload Calls
	executeOnReady();	
	
	//Control de Edicion
	setEditControl();

	//If Readonly = False, jquery removes false property
	//Browser Bug of Readonly
	EIBS.UTILS.correctReadOnly("tableBasicInfo");
	
	modifyCSS();
	
	//Reload Iframe if not loaded Properly
	iFrameCheck();
});


