//Prototype Object Defined in Loan.js
var	activeProduct = new EIBS.LOAN.FloatRate(); 
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
		.setSection('INFORMATION_CREDITO')
		.setEffective('E01DEASPR');


function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();		
}

function recal(res){
   	var data = JSON.parse(res.responseText);
	if (data.type == "error") {
		showErrors();
	} else {
		putDataFromJson(data, true)
		var url = getNSValue("REDIRECTS", "planURL2");	
		CenterWindow(url, 1000, 700, 2);		
	}
}

function plan(){
	if (getElement("RECALC").checked){
		var inputs = document.getElementsByTagName('input');
		var parameters = "SCREEN=300";
		for (index = 0; index < inputs.length; ++index) {
		    if (inputs[index].value.length > 0) {
		    	if (inputs[index].name != "SCREEN") {
		    		parameters += "&" + inputs[index].name + "=" + inputs[index].value;	
		    	}
		    } 
		}
		
		var selects = document.getElementsByTagName('select');
		for (index = 0; index < selects.length; ++index) {
	    		parameters += "&" + selects[index].name + "=" + selects[index].value;	
		}		
		
		var url = getNSValue("REDIRECTS", "planURL1"); 
		PostXMLRequest(url, parameters, recal, false);
	} else {
		var url = getNSValue("REDIRECTS", "planURL2");
		CenterWindow(url, 1000, 700, 2);		
	}
}
function UpdateFlag(val) {
	getElement("E01FLGRCL").value = (val) ? "X" : "";
}


function setRecalculate() {
	if (isValidObject(getElement("RECALC"))) {
		getElement("RECALC").checked = true;
		getElement("RECALC").disabled = true;
		UpdateFlag(true);  
	}
}
  
function resetPrd(elem) {
	getElement("E01DEAPRO").value = "";
	getElement("E01DSCPRD").value = "";
	
	if(elem.attributes["name"].value == "E01DEAICT"){
		if(isNumeric(elem.value)){
			if(isValidObject("E01DEARTE")){
				//getElement("E01DEARTE").value = "0.000000"
				getElement("E01DEARTE").readOnly = false;
			}
		}else if((parseInt(getElement("E01FLGFLT").value) != 2)){
				getElement("E01DEARTE").readOnly = false;
		}
	}
	if(typeof wipeValorCuota !== 'undefined') wipeValorCuota();
}

function resetCnv() {
	getElement("E01DEACNV").value = "";
	getElement("E01DSCCNV").value = "";
}

function reloadIFrame(name) {		// Esta funcion se llama desde los iframes
	if (isValidObject(document.getElementById(name))) {
		var iframe = document.getElementById(name);
		var source = iframe.src.replace("ACT=N", "ACT=S");;
		iframe.src = source;
	}
}
         
function updateDist(sec) {			// Esta funcion se llama desde los iframes
	var valor1 = 0.00; var valor2 = 0.00; var valor3 = 0.00; var valor4 = 0.00; var valor5 = 0.00; var total = 0.00;
	var recalc = false;
	// Reliquidaciones
	if (sec == "RC") {
		if (isValidObject(getElement("RCTOT")) && isValidObject(getElement("E01TOTCRN"))) {
			valor1 = parseFloat((document.forms[0].RCTOT.value));
			valor2 = parseFloat((document.forms[0].E01TOTCRN.value)); 
			recalc = (valor1 != valor2) ? true : recalc;
			document.forms[0].E01TOTCRN.value = document.forms[0].RCTOT.value; 
		}
	}		
	// Desembolso
	if (sec == "DS") {
		if (isValidObject(getElement("DSTOT")) && isValidObject(getElement("E01BALNET"))) {
			total = parseFloat((document.forms[0].E01BALNET.value)) - parseFloat((document.forms[0].DSTOT.value)); 
			document.forms[0].SALNET.value = formatCCY(total);
		}
	}
	// Seguros
	if (sec == "SG") {
		if (isValidObject(getElement("SGTOT")) && isValidObject(getElement("E01TOTSGR"))) {
			valor1 = parseFloat((document.forms[0].SGTOT.value));
			valor2 = parseFloat((document.forms[0].E01TOTSGR.value)); 
			recalc = (valor1 != valor2) ? true : recalc;
			document.forms[0].E01TOTSGR.value = document.forms[0].SGTOT.value;
		}
	}
	// Cargos Adicionales
	if (sec == "CA") {
		if (isValidObject(getElement("E01TOTOTH"))){
			if(isValidObject(getElement("CAIMP"))){
				valor1 = parseFloat((document.forms[0].CAIMP.value));				
			}
			
			if (isValidObject(getElement("CACOM"))){
				valor2 = parseFloat((document.forms[0].CACOM.value)); 
			}
			
			if (isValidObject(getElement("CADED"))){
				valor3 = parseFloat((document.forms[0].CADED.value)); 
			}
			
			if (isValidObject(getElement("CAOTH"))){
				valor4 = parseFloat((document.forms[0].CAOTH.value)); 
			}			
			
			valor5 = parseFloat((document.forms[0].E01TOTOTH.value));
			recalc = ((valor1 + valor2 + valor3 + valor4) != valor5) ? true : recalc;
 			document.forms[0].E01TOTOTH.value = formatCCY(valor1 + valor2 + valor3 + valor4);
		}

		if (isValidObject(getElement("CAIVA")) && isValidObject(getElement("E01TOTIVA"))) {
			valor1 = parseFloat((document.forms[0].CAIVA.value));
			valor2 = parseFloat((document.forms[0].E01TOTIVA.value)); 
			recalc = (valor1 != valor2) ? true : recalc;
 			document.forms[0].E01TOTIVA.value = document.forms[0].CAIVA.value;
		}
		recalcDist();
	}

	if(sec ==="DS" || sec ==="SG"){
		updateIframes('SG');
	}	
	
	if (recalc) {
		setRecalculate(true);
		recalcDist();
	}
}

function recalcDist() {
	//Redoes the Summation of the Distribution Section
	
	var totoam = 0.00; var totcrn = 0.00; var totimp = 0.00; var totcom = 0.00;
	var totded = 0.00; var totsgr = 0.00; var totiva = 0.00; var totgmf = 0.00; 
	var tototh = 0.00; var totpin = 0.00; var totdes = 0.00;
	var totnet = 0.00; var totsal = 0.00; var totorn = 0.00;


	if (isValidObject(getElement("E01TOTORN"))) {
		totorn = parseFloat((document.forms[0].E01TOTORN.value));
	}
	if (isValidObject(getElement("E01TOTCRN"))) {
		totcrn = parseFloat((document.forms[0].E01TOTCRN.value));
	}
	if (isValidObject(getElement("E01TOTIMP"))) {
		totimp = parseFloat((document.forms[0].E01TOTIMP.value));
	}
	if (isValidObject(getElement("E01TOTCOM"))) {
		totcom = parseFloat((document.forms[0].E01TOTCOM.value));
	}
	if (isValidObject(getElement("E01TOTDED"))) {
		totded = parseFloat((document.forms[0].E01TOTDED.value));
	}
	if (isValidObject(getElement("E01TOTSGR"))) {
		totsgr = parseFloat((document.forms[0].E01TOTSGR.value));
	}
	if (isValidObject(getElement("E01TOTIVA"))) {
		totiva = parseFloat((document.forms[0].E01TOTIVA.value));
	}
	if (isValidObject(getElement("E01TOTGMF"))) {
		//totgmf = parseFloat((document.forms[0].E01TOTGMF.value));
	}
	if (isValidObject(getElement("E01TOTOTH"))) {
		tototh = parseFloat((document.forms[0].E01TOTOTH.value));
	}
	if (isValidObject(getElement("E01TOTPIN"))) {
		totpin = parseFloat((document.forms[0].E01TOTPIN.value));
	}
	if (isValidObject(getElement("E01TOTPIN"))) {
		totpin = parseFloat((document.forms[0].E01TOTPIN.value));
	}
	if (isValidObject(getElement("DSTOT"))) {
		totdes = parseFloat((document.forms[0].DSTOT.value));
	}
	
	if (isValidObject(getElement("E01DEAOAM"))) {
		if(isValidObject(getElement('E01FLGREF')) && getElement("E01FLGREF").value != "N"){
			totoam = totorn + totcrn + totimp + totcom + totded + totsgr + totiva + totgmf + tototh + totpin;
			document.forms[0].E01DEAOAM.value = formatCCY(totoam);
		
		} else {
			totoam = parseFloat((document.forms[0].E01DEAOAM.value));
			getElement("E01DEAOAM").value = formatCCY(getElement("E01DEAOAM").value);			
			
		} 
	
	}
	if (isValidObject(getElement("E01BALNET"))) {
		totnet = totoam - totorn- totcrn - totimp - totcom - totded - totsgr - totiva - totgmf - tototh - totpin;
		document.forms[0].E01BALNET.value = formatCCY(totnet);
	}
	if (isValidObject(getElement("SALNET"))) {
		totsal = totnet - totdes;
		document.forms[0].SALNET.value = formatCCY(totsal);
	}
}

function hideMenu() {
	if (getElement("pagobutton").style.display == 'none') {
		getElement("pagobutton").style.display = 'block';
		pagoTypeChange();	
	} else {
		getElement("pagotitle").innerHTML  = " ";
		getElement("pagobutton").style.display = 'none';
	}
}

function addListeners(){
	$('#E01DEARTE').change(function(){
		$('#E01DLCVA1').val('');
	});
	
	$('#E01DEAOAM').change(function(){
		$('#OAM').val(formatCCY($(this).val()));
		updateIframes('SG');
	});
	
	//Tabla de Cargos-------------------------------------
	$('#E01DEAOFT').change(function(event){
		event.preventDefault();
		event.stopPropagation();
		calCharges(getNSValue("REDIRECTS", "calCharges"), "#E01FLGCHG");
	});
	
	
	$('#E01DEACNV').change(function(){
		setRecalculate();
		calCharges(getNSValue("REDIRECTS", "recConvenio"), "#E01FLGCNV");
	});
	
	$('#E01DEAPRO').change(function(){
		setRecalculate();
		calCharges(getNSValue("REDIRECTS", "loadProductInfo"));
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
				if(data.type == "FILL_FORM"){
					putDataFromJson(data, true);
					loadPlanDePago( isValidObject(getElement("E01FLGFPG")) ? getElement("E01FLGFPG").value : "");
					updateIframes('DS');
				} else {
					updateIframes('SG');
				}
			}
		}
	
		function calchargesError(reaquest, status, error, flg){
			$(flg).val('X') ;
			setRecalculate();
			scriptLog("Request Error: " + String(error));
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
		setRecalculate();
		//submitPage(document.forms[0].Submit);
	}
}

$( document ).ready(function() {
	addListeners();
    nCuotas();
    activeProduct.rateDisplay();
	EIBS.UTILS.updateTableCSS(activeProduct.section);
});