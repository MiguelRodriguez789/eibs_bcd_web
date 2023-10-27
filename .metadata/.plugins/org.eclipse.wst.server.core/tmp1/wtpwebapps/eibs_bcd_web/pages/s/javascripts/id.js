
function rutChile(rut) {
	var rexp1 = new RegExp(/^([0-9])+\-([kK0-9])+$/);
	var rexp2 = new RegExp(/^([0-9])+([kK0-9])+$/);
	if (rut.match(rexp1) || rut.match(rexp2)) {
	    var elRut;
	    var digit;
	    if (rut.indexOf("-") > -1) {
	        var RUT = rut.split("-");
		    elRut = RUT[0].split('');
		    digit = RUT[1];
	    } else {
		     elRut = rut.substr(0, rut.length-1).split('');
		     digit = rut.substr(rut.length-1);
	    }
	    var factor = 2;
	    var suma = 0;
	    var dvr = '0';
	    var dv;
	    for (i = elRut.length-1; i>=0; i--) {
	        factor = factor > 7 ? 2 : factor;
	        suma += parseInt(elRut[i]) * parseInt(factor++);
	    }
	    var res = suma % 11;
		 if (res == 1)
			dvr = 'k';
		 else if (res == 0)
			dvr = '0';
		 else {
			dv = 11 - res;
			dvr = dv + "";
		 }
	    return (dvr == digit.toLowerCase()) ? elRut.join("") + dvr : 0;
	} else {
		return -1;
	}
}

function rifVenezuela(rif) {
	var rexp1 = new RegExp(/^([vVeEjJtTgG]{1})+\-([0-9]{8})+\-([0-9]{1})+$/);
	var rexp2 = new RegExp(/^([vVeEjJtTgG]{1})+([0-9]{9})+$/);
	if (rif.match(rexp1) || rif.match(rexp2)) {
	    var elRif;
	    var init;
	    var digit;
	    
	    if (rif.indexOf("-") > -1) {
	    	var RIF = rif.split("-");
	    	init = RIF[0];
	    	elRif = RIF[1].split('');
	    	digit = RIF[2];
	    } else {
		    init = rif.substr(0, 1);
	    	elRif = rif.substr(1, 8).split('');
		    digit = rif.substr(9, 1);
	    }
	    
	    var suma = 0;
	    switch (init.toLowerCase()) {
		case 'v':
			suma = 4;
			break;
		case 'e':
			suma = 8;
			break;
		case 'j':
			suma = 12;
			break;
		case 't':
			suma = 16;
			break;
		case 'g':
			suma = 20;
			break;
		default:
			suma = 0;
			break;
		}
	    
	    suma += parseInt(elRif[0]) * 3;
	    suma += parseInt(elRif[1]) * 2;
	    suma += parseInt(elRif[2]) * 7;
	    suma += parseInt(elRif[3]) * 6;
	    suma += parseInt(elRif[4]) * 5;
	    suma += parseInt(elRif[5]) * 4;
	    suma += parseInt(elRif[6]) * 3;
	    suma += parseInt(elRif[7]) * 2;
	    
	    var dvr = '0';
	    var dv;
	    var res = suma % 11;
		 if (res == 1)
			dvr = '0';
		 else if (res == 0)
			dvr = '0';
		 else {
			dv = 11 - res;
			dvr = dv + "";
		 }
		 return (dvr == digit.toLowerCase()) ? init + elRif.join("") + dvr : 0;
	} else {
		return 0;
	}
}

function rucPeru(ruc) {
	var rexp = new RegExp(/^([0-9]{11})+$/);
	if (ruc.match(rexp)) {
	    var elRuc = ruc.substr(0, 10).split('');
	    var digit = ruc.substr(11, 1);
	    
	    var suma = 0;
	    suma += parseInt(elRuc[0]) * 5;
	    suma += parseInt(elRuc[1]) * 4;
	    suma += parseInt(elRuc[2]) * 3;
	    suma += parseInt(elRuc[3]) * 2;
	    suma += parseInt(elRuc[4]) * 7;
	    suma += parseInt(elRuc[5]) * 6;
	    suma += parseInt(elRuc[6]) * 5;
	    suma += parseInt(elRuc[7]) * 4;
	    suma += parseInt(elRuc[8]) * 3;
	    suma += parseInt(elRuc[9]) * 2;
	    
	    var dvr = '0';
	    var dv;
	    var res = suma % 11;
		 if (res == 1)
			dvr = '0';
		 else if (res == 0)
			dvr = '0';
		 else {
			dv = 11 - res;
			dvr = dv + "";
		 }
		 return (dvr == digit.toLowerCase()) ? elRuc.join("") + dvr : 0;
	} else {
		return 0;
	}
}

function rucEcuador(ruc) {
	var rexp = new RegExp(/^([0-9]{13})+$/);
	if (ruc.match(rexp)) {
	    var elRuc = ruc.substr(0, 9).split('');
	    var digit = ruc.substr(10, 1);
	    var estab = ruc.substr(11, 3);
		
	    var prov = parseInt(elRuc[0] + elRuc[1]);
	    var type = parseInt(elRuc[2]);
	    if ((prov > 0) && (prov < 25) && (type < 6)) {
	    	var even = 0;
	    	var odd = 0;
	    	for (int = 0; int < elRuc.length; int+=2) {
	    		var oddt = parseInt(elRuc[i]) * 2;
	    		odd += (oddt > 9) ? oddt - 9 : oddt;
			}
	    	for (int = 1; int < elRuc.length; int+=2) {
	    		even += parseInt(elRuc[i]);
			}
	    	var suma = odd + even;
	    	var dec = parseInt(((suma + 10) + "").split('')[0] + "0");
	    	var dv = dec - suma;
	    	var dvr = (dv == 10) ? "0" : dv + "";
	    	
	    	return (dvr == digit.toLowerCase()) ? elRuc.join("") + dvr + estab : 0; 
	    } else {
	    	return 0;
	    }
	} else {
		return 0;
	}
}


function nitGuatemala(nit) {
	var rexp1 = new RegExp(/^([0-9])+\-([kK0-9])+$/);
	var rexp2 = new RegExp(/^([0-9])+([kK0-9])+$/);
	if (nit.match(rexp1) || nit.match(rexp2)) {
	    var elNit;
	    var digit;
	    if (rif.indexOf("-") > -1) {
	    	var NIT = nit.split("-");
	    	elNit = NIT[0].split('');
	    	digit = NIT[1];
	    } else {
		     elRut = nit.substr(0, nit.length-1).split('');
		     digit = nit.substr(nit.length-1);
	    }
	    
	    var factor = elNit.length + 1;
	    var suma = 0;
	    for ( int = 0; int < elNit.length; int++) {
			suma += parseInt(elNit[int]) * factor--;
		}
	    var dvr = '0';
	    var dv;
	    var res = suma % 11;
		 if (res == 1)
			dvr = 'k';
		 else if (res == 0)
			dvr = '0';
		 else {
			dv = 11 - res;
			dvr = dv + "";
		 }
	    return (dvr == digit.toLowerCase()) ? elNit.join("") + dvr : 0;
	} else {
		return 0;
	}
}

function validateId(id, country) {
	
	if (isNumeric(country)) { 
		switch (country) {
		case 3:
			return rifVenezuela(id); 
		case 6:
			return nitGuatemala(id);
		case 8:
			return rucEcuador(id);
		case 12:
			return rucPeru(id);
		case 18:
			return rutChile(id); 
		default:
			alert(id);
			return id;
		}
	} else {
		if (country == "CL") {
			return rutChile(id); 
		} else if (country == "VE") {
			return rifVenezuela(id); 
		} else if (country == "GT") {
			return nitGuatemala(id); 
		} else if (country == "EC") {
			return rucEcuador(id); 
		} else if (country == "PE") {
			return rucPeru(id); 
		} else {
			alert(id);
			return id;
		}
	}
}

function isCompany(rut) {
	var aux = rut.substr(0, rut.length-1);
	var num;
	try {
		num = parseInt(aux);
	} catch (err) {
		num = 0;
	}
	return num > 50000000;
}

