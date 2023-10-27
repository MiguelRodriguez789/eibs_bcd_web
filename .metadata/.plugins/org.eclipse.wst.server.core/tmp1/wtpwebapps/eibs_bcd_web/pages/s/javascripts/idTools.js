function showDivType(countryCode, type){
	var show = false;
	var sufct = 'ID'+countryCode;
	var sufix = 'ID'+countryCode+type;
	var tabDiv = document.getElementsByTagName('span');
	if (tabDiv!=null){
		for (i=0; i<tabDiv.length; i++) {
			var elem = tabDiv[i];
			if(!show && elem.id.match(sufix) == sufix){
				elem.style.display='inline';
				show = true;
			} else {
				elem.style.display='none';
			}
			if(elem.id.length > 2
				&& elem.id.substring(0, 3) == 'ID_'){
				elem.style.display='inline';
			}
	    }
  	}
  	if(!show){
  		var elem = document.getElementById(sufct+'X');
  		if(isValidObject(elem)){
  			elem.style.display='inline';
  	  		show = true;
  		}
  	}
  	if(!show){
		document.getElementById('ID01X').style.display='inline';
  	}
}

function displayIdDivs(show, countryCode){
	if(!isValidObject(countryCode)){
		countryCode = '';
	}
	var tabDiv = document.getElementsByTagName('div');
	if (tabDiv!=null){
		for (i=0; i<tabDiv.length; i++) {
			var elem = tabDiv[i];
			if(elem.id.length > 2
				&& elem.id.substring(0, 3) == 'ID_'){
				if(show){
					elem.style.display='block';
				} else {
					elem.style.display='none';
				}
			}

	    }
  	}
	if(show){
		showDivType(mapCountryCode(countryCode), 'P');
	}
}

function displayTID(countryCode,cunType){
	var TID = document.querySelector('[name*="TID"]');
	
	if(isValidObject(TID)){
		var anchorTID = TID.nextElementSibling;
		while (anchorTID.tagName != 'A' || anchorTID == null){ // Find TID anchor (HELP)
			anchorTID = anchorTID.nextElementSibling;
		} 
		
		if(cunType == 'C'){
			if( countryCode == "04"){
				if(isValidObject(anchorTID)) anchorTID.style.visibility = 'hidden';
				TID.value = 'RFC'; 
			} else {
				if(isValidObject(anchorTID)) anchorTID.style.visibility = 'visible';
				if(!window.firstLoad) TID.value = '';	
			}
		} else {
			if(isValidObject(anchorTID)) anchorTID.style.visibility = 'visible';
			if(!window.firstLoad) TID.value = '';	
		}	
	}
}

function mapCountryCode(countryCode){
	countryCode = trim(countryCode).toUpperCase();
	if (countryCode == 'CR' || countryCode == 'CRI') {
		return '02';
	} else if (countryCode == 'VE' || countryCode == 'VEN') {
		return '03';
	} else if (countryCode == 'MX' || countryCode == 'MEX') {
		return '04';
	} else if (countryCode == 'CO' || countryCode == 'COL') {
		return '05';
	} else if (countryCode == 'PA' || countryCode == 'PAN') {
		return '07';
	} else if (countryCode == 'NI' || countryCode == 'NIC') {
		return '10';
	} else if (countryCode == 'HN' || countryCode == 'HND') {
		return '11';
	} else if (countryCode == 'CL' || countryCode == 'CHL') {
		return '18';
	} else if (countryCode == 'DO' || countryCode == 'DOM') {
		return '21'; 
	}
	return countryCode;
}

function mapType(idType){
	if(!isValidObject(idType)){
		idType = 'P';
	}
	if (idType.length > 1) {
		idType = idType.substring(0, 1);
	}
	if (idType == '1') {
		idType = 'C';
	} else if (idType == '2') {
		idType = 'P';
	} else if (idType == '4') {
		idType = 'B';
	}
	return idType;
}

function showIdFields(countryCode, cusType){
	countryCode = mapCountryCode(countryCode);
	if(countryCode == ""){
		countryCode = "01";//Set here the default;
	}
	cusType = mapType(cusType);
	
	showDivType(countryCode, cusType);
	displayTID(countryCode, cusType);
	
	var elemHelp = document.getElementById('countryhelp');
	if(isValidObject(elemHelp)){
		//elemHelp.style.visibility = 'hidden';
		if( cusType.toUpperCase() == "O"){
			elemHelp.style.visibility = 'visible';
		}
	}
}

//Joins the multiple input fields in one string
//Token is optional an probably should not be used
function joinID(idField, idType, len, token){

	var countryCode = mapCountryCode(getElement('COUNTRY').value);
	idType = mapType(idType);
	var strID = "";

	if(!token){
		token = '';
	}
	for(var i = 0; i < len; i++) {
		try {
			var name = countryCode + idType + "IDN" + i;
			strID = strID + document.forms[0][name.toUpperCase()].value;
			if(i < len - 1){
				strID = strID + token;
			}
		} catch (e){
			console.log(e.stack);
		}
	}
	idField.value=strID.toUpperCase();
}

function joinIDFields(idType, len){
	if (idType.length > 1) {
		idType = idType.substring(0, 1);
	}
	joinID(document.forms[0].IDN, idType, len, '-');
}

function joinIDFieldsPA(idType){
	if (idType.length > 1) {
		idType = idType.substring(0, 1);
	}
	var len = 4;
	if (idType == 'C' || idType == '1') {
		len = 3;
	}
	joinID(document.forms[0].IDN, idType, len, '-');
}

function getIdTypeHelp(clientTypeSelected){
   // Display the id screen help 
   if (clientTypeSelected == "1") 
     GetCode('03XIDN0','STATIC_client_help_id_type.jsp?clientType=CORPORATIVE');
   else
     GetCode('03XIDN0','STATIC_client_help_id_type.jsp?clientType=PERSONAL');
}
