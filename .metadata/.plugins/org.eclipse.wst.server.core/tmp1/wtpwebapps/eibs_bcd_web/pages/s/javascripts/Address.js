function changeAddressFields(block, country){

	var prefix = block+"_";
	tabDiv = document.getElementsByTagName('div');
	if (tabDiv!=null){
		for (i=0; i<tabDiv.length; i++) {
			var elem = tabDiv[i];
			if(elem.id.match(prefix) == prefix){
				var countryPrefix = prefix + country;
				if((elem.id.match(countryPrefix) == countryPrefix)){
					elem.style.display='block';
				} else {
					elem.style.display='none';
				}
			} 
	    }
  	}
}

function addressCountryChanged(block, field){
	if(changeEntityAddressFields){
		changeEntityAddressFields(block);
	}
} 

function clrfield(idField,idFieldClr){
	if (document.forms[0][""+idField+""].value == "") {
		document.forms[0][""+idFieldClr+""].value = "";
	}
}

function checkResidentBlock(block, isResident){
	var residentBlock = document.getElementById("resident"+block);
	if(residentBlock.checked != isResident){
		var warning = "El país de la dirección no coincide con el estado de residencia";
		var proceed = true;
		//var proceed = confirm(warning + ", ¿Desea continuar?");
		//alert(warning);
		if(!proceed){
			return residentBlock.checked;
		}
	}
	residentBlock.checked = isResident;
	return residentBlock.checked;
}

function checkCountryHasChanged(countryAddress, countryResidence, bankCountry){
	var countryHasChanged = countryAddress.value != countryResidence.value;
	var noneIsBankCountry = countryAddress.value != bankCountry && countryResidence.value != bankCountry
	countryHasChanged = countryHasChanged && !noneIsBankCountry;
	return countryHasChanged;
}