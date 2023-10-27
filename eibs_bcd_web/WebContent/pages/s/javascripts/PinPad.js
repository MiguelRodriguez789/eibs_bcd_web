function eIBSPrint() {
   window.focus();
   window.print();
   return;
}

function replaceAll(value,char){

  var result = value;
  var posi = value.indexOf(char);
  if(posi > -1){
	  while(posi > -1){
		  result = value.substring(0,posi);
	      result = result + value.substring(posi+1);
	      posi = result.indexOf(char);
	      value = result;
	  }
  }

  return(result);

 }

function formatCCY(num) {
 	var num2 = "00";
 	var result = "";
 	var sign = "";
 	sign = num.substring(0,1);
 	if(sign == "-") num = num.substring(1);
 	else sign="";

 	var posi = num.indexOf(".");
 	if(posi > -1){
	 num2 = num.substring(posi + 1, num.length);
	 num = num.substring(0, posi);
	 if (num2.length == 1) num2= num2 +"0";
	 else if (num2.length > 2) num2 = num2.substring(0, 2)
 	}
 	num2 = decSeparator + num2;
 	var count = 0;
 	var y = num.length -1;
 	for(x=y;x>-1;x--) {
		var nx = num.charAt(x);
		result = nx + result;
		++count;
		if(count == 3 || count == 6 || count == 9 || count == 12){
	  		if(x > 0) { result = grpSeparator + result; } // add grouping separator
		}

  	}

  	result = sign + result + num2;
  	return(result);
  }

 function roundFCCY(num) {
 	var num2 = "";
 	var result = 0;
 	//var num1 = replaceAll("" + num,grpSeparator);
 	var num1 = ""+num;
 	var sign = num1.substring(0,1);
 	if(sign == "-") num1 = num1.substring(1);
 	else sign="";
 	var posi = num1.indexOf(".");
 	if (posi != -1) {
 	 num2 = num1.substring(posi +1, num1.length);
 	 if (num2.length > 2) {
 	   if (parseInt(num2.substring(2, 3)) > 5) {
 	     result = parseFloat(num1.substring(0,posi + 3)) + 0.01;
 	     return(sign + result);
 	   } else return( sign + num1.substring(0,posi + 3));
 	 } else return("" + num);
 	} else return("" + num);

 }

function formatFloat(value) {
	if (value == "") return "0.00";
	value = replaceAll(value, grpSeparator)
	if (decSeparator != '.') value = value.replace(decSeparator, '.');
	return value
}

function formatValor(campo,preformat,dec) {

	var	vr = campo.value;
		vr = vr.replace( decSeparator, "" );
		vr = replaceAll( vr, grpSeparator );
	var sign = "";

    if (vr.indexOf('-') != -1) {
	    vr = replaceAll( vr, "-" );
    	sign = "-";
    }	
	var	tam = (preformat) ? vr.length : vr.length + 1;
	
	if ( tam <= dec ){
	    var strDecimals="";
	    for(i=0; i < dec-tam; i++){
	    	strDecimals = "0" + strDecimals;
	    }
 		campo.value = "0" + decSeparator + strDecimals + vr;
	} else {
	    var tamInt = tam - dec;
	    var result = "";
	    var count = 0;
	    for ( x = tamInt - 1; x > -1; x--) {
			var nx = vr.charAt(x);
			result = nx + result;
			++count;
			if (count == 3 || count == 6 || count == 9 || count == 12) {
				if (x > 0) {
					result = grpSeparator + result;
				} // add separator
			}
		}
		campo.value = result + decSeparator + vr.substr( tamInt, tam );
	}
		
	var pos = campo.value.indexOf(decSeparator);
		if (pos != -1) {
		vr = campo.value.substr( 0, pos );
		if (vr == "00" || (vr.length == 2 && vr.substr( 0, 1) == "0")) campo.value = campo.value.substr(1, tam);
	}
	campo.value = sign + campo.value;	
}

function isCharCodeNumber(kcode) {
	var isNumber = false;
	if (kcode > 47 && kcode < 58) isNumber = true; //Numbers - 48 --> 57
	return isNumber;
}

function isCharNumber(character) {
	if (character.length != 1) return false;
	return isCharCodeNumber(character.charCodeAt(0));
}

function addLeftChar(character,len,value) {
	if (value != '') {
		for(n=value.length;n<len;n++){
 		    value = character +  value;
		}
	}
	return value;
}

function rightAlignCharNumber(e) {
	var evt = getEvent(e);
	var elem = evt.srcElement;
	var value = elem.value;
	var kcode;

	if (value != '') {
		for (n = 0; n < value.length; n++) {
			kcode = value.charCodeAt(n);
			if (!isCharCodeNumber(kcode))
				return;
		}
		for (n = value.length; n < elem.maxLength; n++) {
			elem.value = "0" + elem.value;
		}
	}
}

function enterCharNumber(e) {
	var evt = getEvent(e);
	var elem = evt.srcElement;
	var kcode = evt.keyCode;
	var newVal = "";

	var kdata = String.fromCharCode(kcode);
	newVal = kdata;

	if (isCharCodeNumber(kcode))
		if (elem.maxLength > elem.value.length)
			elem.value = elem.value + newVal;
	evt.returnValue = false;
}

function checkDecimal(e, dec) {
	var evt = getEvent(e);
	if (!dec)
		dec = decimalPartDefaultLength;

	var elem = evt.srcElement;
	var kcode = evt.keyCode;
	switch (kcode) {
	case 8:
	case 46: {
		if (amountformat) {
			formatValor(elem, true, dec);
		}
		break;
	}
	}
}

function enterDecimal(e, dec) {
	var evt = getEvent(e);
	if (!dec)
		dec = decimalPartDefaultLength;
	var elem = EventElement(evt);
	var kcode = EventKeyCode(evt);
	
	if (elem.readOnly) return;
	var val;
	var newVal = "";

	var kdata = String.fromCharCode(kcode);
	if (amountformat) {
		// elem.value = formatFloat(elem.value);
		// elem.blur();
		// elem.focus();
	}
	switch (kcode) {
	case 66:
	case 98: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000000.00";
				else if (elem.maxLength - elem.value.length > 12)
					elem.value = elem.value + "000000000.00";
			} else
				elem.value = "1000000000.00";
		} else {
			val = parseFloat(elem.value) * 100000000000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000000000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
		}
		if (amountformat)
			formatValor(elem, true, dec);
		break;
	}
	case 72:
	case 104: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "100.00";
				else if (elem.maxLength - elem.value.length > 5)
					elem.value = elem.value + "00.00";
			} else
				elem.value = "100.00";
		} else {
			val = parseFloat(elem.value) * 10000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "100.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
		}
		if (amountformat)
			formatValor(elem, true, dec);
		break;
	}
	case 77:
	case 109: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000.00";
				else if (elem.maxLength - elem.value.length > 9)
					elem.value = elem.value + "000000.00";
			} else
				elem.value = "1000000.00";
		} else {
			val = parseFloat(elem.value) * 100000000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
		}
		if (amountformat)
			formatValor(elem, true, dec);
		break;
	}
	case 84:
	case 116: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000.00";
				else if (elem.maxLength - elem.value.length > 6)
					elem.value = elem.value + "000.00";
			} else
				elem.value = "1000.00";
		} else {
			val = parseFloat(elem.value) * 100000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
		}
		if (amountformat)
			formatValor(elem, true, dec);
		break;
	}
	default: {
		if (amountformat) {
			if (kcode == 44) {
				cancelEvent(evt);
				if (decSeparator == ',' && elem.value.split(",").length > 1) {
					return;
				}
				elem.value = elem.value + kdata;
			} else if (kcode == 46 && decSeparator == '.') {
				cancelEvent(evt);
				if (decSeparator == '.' && elem.value.split(".").length > 1) {
					return;
				}
				elem.value = elem.value + kdata;
			} else if ((kcode < 48 || kcode > 57) && kcode != 13) {
				cancelEvent(evt);
				// formatValor(elem,true,dec);
			} else if (kcode != 13) {
				// formatValor(elem,false,dec);
				// elem.value = elem.value + kdata;
				// event.returnValue = false;
			}
		} else {
			if ((kcode < 48 || kcode > 57) && kcode != 46 && kcode != 13) {
				cancelEvent(evt);
			} else if (kcode == 46 && elem.value.indexOf('.') != -1) {
				cancelEvent(evt);
			}
		}
	}
	}
}

function enterSignCCY(e, dec) {
	var evt = getEvent(e);
	if (!dec)
		dec = decimalPartDefaultLength;

	var elem = EventElement(evt);
	var kcode = EventKeyCode(evt);
	var val;
	var newVal = "";
	switch (kcode) {
	case 45: {
		cancelEvent(evt);
		if (elem.value.indexOf('-') == -1)
			elem.value = "-" + elem.value;
		break;
	}
	case 43: {
		cancelEvent(evt);
		if (elem.value.indexOf('-') !== -1)
			elem.value = elem.value.substring(1, elem.value.length);
		break;
	}
	default: {
		enterSignDecimal(dec);
	}
	}
}

function enterSignDecimal(e, dec) {
	var evt = getEvent(e);
	if (!dec)
		dec = decimalPartDefaultLength;

	var elem = EventElement(evt);
	var kcode = EventKeyCode(evt);
	if (elem.readOnly)
		return;
	var val;
	var newVal = "";

	var kdata = String.fromCharCode(kcode);
	if (amountformat) {
		// elem.value = formatFloat(elem.value);
	}

	switch (kcode) {
	case 66:
	case 98: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000000.00";
				else if (elem.maxLength - elem.value.length > 12)
					elem.value = elem.value + "000000000.00";
			} else
				elem.value = "1000000000.00";
		} else {
			val = parseFloat(elem.value) * 100000000000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000000000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
			if (amountformat)
				formatValor(elem, true, dec);
		}
		break;
	}
	case 72:
	case 104: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "100.00";
				else if (elem.maxLength - elem.value.length > 5)
					elem.value = elem.value + "00.00";
			} else
				elem.value = "100.00";
		} else {
			val = parseFloat(elem.value) * 10000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "100.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
			if (amountformat)
				formatValor(elem, true, dec);
		}
		break;
	}
	case 77:
	case 109: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000.00";
				else if (elem.maxLength - elem.value.length > 9)
					elem.value = elem.value + "000000.00";
			} else
				elem.value = "1000000.00";
		} else {
			val = parseFloat(elem.value) * 100000000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
			if (amountformat)
				formatValor(elem, true, dec);
		}
		break;
	}
	case 84:
	case 116: {
		cancelEvent(evt);
		if (elem.value.indexOf('.') == -1) {
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000.00";
				else if (elem.maxLength - elem.value.length > 6)
					elem.value = elem.value + "000.00";
			} else
				elem.value = "1000.00";
		} else {
			val = parseFloat(elem.value) * 100000.00;
			newVal = "" + val;
			if (newVal.indexOf('.') == -1)
				newVal = newVal + ".00";
			else {
				val = newVal.length - newVal.indexOf('.');
				if (val == 2)
					newVal = newVal + "0";
			}
			if (newVal == "0.00")
				elem.value = "1000.00";
			else if (elem.maxLength > newVal.length)
				elem.value = newVal;
			if (amountformat)
				formatValor(elem, true, dec);
		}
		break;
	}
	case 45: {
		cancelEvent(evt);
		if (elem.value.indexOf('-') == -1)
			elem.value = "-" + elem.value;
		// if (amountformat) formatValor(elem,true,dec);
		break;
	}
	case 43: {
		cancelEvent(evt);
		if (elem.value.indexOf('-') !== -1)
			elem.value = elem.value.substring(1, elem.value.length);
		// if (amountformat) formatValor(elem,true,dec);
		break;
	}
	default: {
		if (amountformat) {
			if (kcode == 44) {
				cancelEvent(evt);
				if (decSeparator == ',' && elem.value.split(",").length > 1) {
					return;
				}
				elem.value = elem.value + kdata;
			} else if (kcode == 46 && decSeparator == '.') {
				cancelEvent(evt);
				if (decSeparator == '.' && elem.value.split(".").length > 1) {
					return;
				}
				elem.value = elem.value + kdata;
			} else if ((kcode < 48 || kcode > 57) && kcode != 13) {
				cancelEvent(evt);
				// formatValor(elem,true,dec);
			} else if (kcode != 13) {
				// formatValor(elem,false,dec);
				// elem.value = elem.value + kdata;
				// event.returnValue = false;
			}
		} else {
			if ((kcode < 48 || kcode > 57) && kcode != 46 && kcode != 13) {
				cancelEvent(evt);
			} else if (kcode == 46 && elem.value.indexOf('.') != -1) {
				cancelEvent(evt);
			}
		}
	}
	}
}

function enterInteger(evt) {
	evt = getEvent(evt);
	var elem = EventElement(evt);
	var kcode = EventKeyCode(evt);
	switch (kcode) {
		case 66:
		case 98: {
			cancelEvent(evt);
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000000";
				else if (elem.maxLength - elem.value.length > 9)
					elem.value = elem.value + "000000000";
			} else
				elem.value = "1000000000";
			break;
		}
		case 72:
		case 104: {
			cancelEvent(evt);
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "100";
				else if (elem.maxLength - elem.value.length > 2)
					elem.value = elem.value + "00";
			} else
				elem.value = "100";
			break;
		}
		case 77:
		case 109: {
			cancelEvent(evt);
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000000";
				else if (elem.maxLength - elem.value.length > 6)
					elem.value = elem.value + "000000";
			} else
				elem.value = "1000000";
			break;
		}
		case 84:
		case 116: {
			cancelEvent(evt);
			if (elem.value.length > 0) {
				if (parseInt(elem.value) == 0)
					elem.value = "1000";
				else if (elem.maxLength - elem.value.length > 3)
					elem.value = elem.value + "000";
			} else
				elem.value = "1000";
			break;
		}
		default: {
			if ((kcode < 48 || kcode > 57) && kcode != 13)
				cancelEvent(evt);
		}
	}
}

function enterDecimalNum(evt) {
	evt = getEvent(evt);
	var charCode = EventKeyCode(evt);
	// alert (charCode);
	if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46
			&& charCode != 45)
		return false;
	return true;
}

function radioClick(name,idx) {
//var oObject = document.all.item(name);
var oObject = document.getElementsByName(name);
if (oObject != null){
   if (oObject.length != null){
      oObject(idx).click();
   }
   else{
      oObject.click();
   }
 }
}

function go(op) {
   var dist= op -1
       dataDiv.scrollTop= dataDiv.clientHeight * dist;
}

function adjustEquTables(Table1,Table2,Div1,rb,footTb) {
   var T1= Table1.rows[0];
   var T2= Table2.rows[0];
   var wT1=0;
   var wT2=0;
   var maxCol=0;
   var incr=0;
   var maxWidth=0;
   var adjPerCol=0;
   var adjust=0;
   var mainTb= Table1.parentNode;

  if ( Table2.rows.length >= 1 ) {

   maxCol= T2.cells.length;
   incr= maxCol * 2;


   for(var i=0;i<maxCol;i++){
      T1.cells[i].style.pixelWidth=0;
      T2.cells[i].style.pixelWidth=0;

      wT1= T1.cells[i].clientWidth;
      wT2= T2.cells[i].clientWidth;

      T1.cells[i].style.pixelWidth= ( wT1 >= wT2 ) ? wT1: wT2;
      T2.cells[i].style.pixelWidth= ( wT1 >= wT2 ) ? wT1: wT2;
      maxWidth= ( wT1 >= wT2 ) ? maxWidth + wT1: maxWidth + wT2;

   }


   if (footTb) {
     footTable.rows[0].cells[0].style.pixelWidth= (maxWidth + 8 ) - T1.cells[maxCol-1].style.pixelWidth;
     footTable.rows[0].cells[1].style.pixelWidth= T1.cells[maxCol-1].style.pixelWidth;
   }
   maxWidth += incr;


   Table1.width= maxWidth;
   Table2.width= Table1.width;
   if (footTb) { footTable.width= Table1.width;}

   //incr= (footTb) ? 21 : 40;

   if ( Table1.clientWidth < mainTb.clientWidth ){
       incr= (Div1.style.overflowY=="scroll") ? Table1.clientWidth + 23: Table1.clientWidth;
       adjust= mainTb.clientWidth - incr ;
       adjPerCol= adjust / (maxCol - rb);
       adjPerCol= Math.round(adjPerCol);

     for(k=0;k<maxCol;k++){
       wT1= T1.cells[k].style.pixelWidth;
       T1.cells[k].style.pixelWidth= ( k == (rb-1) ) ? wT1: wT1 + adjPerCol;
       wT2= T2.cells[k].style.pixelWidth;
       T2.cells[k].style.pixelWidth= ( k == (rb-1) ) ? wT2: wT2 + adjPerCol;
     }
   if (footTb) {
     footTable.rows[0].cells[0].style.pixelWidth += adjPerCol * 5 ;
     footTable.rows[0].cells[1].style.pixelWidth += adjPerCol;
    }
   }

  }
  else{Table1.width="100%"}

}

function adjustDifTables(Table1,Table2,Div1,column,rb) {
   var T1= Table1.rows[0];
   var T11= Table1.rows[1];
   var maxT11Col = T11.cells.length -1;
   var wT1= 0;
   var wT2= 0;
   var n= column;
   var maxWidth=0;
   var adjPerCol=0;
   var adjust=0;
   var mainTb= Table1.parentNode; //TD

   if ( Table2.rows.length >= 1 ) {

     var T2= Table2.rows[0];
     var maxCol=Table2.rows[0].cells.length;
     var incr= maxCol * 2;

     for(i=0;i<n;i++){
      T1.cells[i].style.pixelWidth=0;
      T2.cells[i].style.pixelWidth=0;
      wT1= T1.cells[i].offsetWidth;
      wT2= T2.cells[i].offsetWidth;
      if ( wT1 > wT2 ) {
          T1.cells[i].style.pixelWidth = wT1;
          T2.cells[i].style.pixelWidth = wT1;
       }else{
          T1.cells[i].style.pixelWidth = wT2;
          T2.cells[i].style.pixelWidth = wT2;
       }
      maxWidth= ( wT1 > wT2 ) ? maxWidth + wT1: maxWidth + wT2;
     }

     for(i=n;i<maxCol;i++){

      if ( i>=n && i<=(n+maxT11Col) ) {
       T11.cells[i-n].style.pixelWidth=0;
       wT1= T11.cells[i-n].offsetWidth;
      } else {
        T1.cells[i-maxT11Col].style.pixelWidth=0;
        wT1= T1.cells[i-maxT11Col].offsetWidth; }

      T2.cells[i].style.pixelWidth=0;
      wT2= T2.cells[i].offsetWidth;

      if ( wT1 > wT2 ) {
         T2.cells[i].style.pixelWidth=wT1;
         if (  i>=n && i<=(n+maxT11Col) ) {
           T11.cells[i -n].style.pixelWidth=wT1;
         } else {
           T1.cells[i -maxT11Col].style.pixelWidth=wT1;
         }
      } else {
         T2.cells[i].style.pixelWidth=wT2;
         if ( i>=n && i<=(n+maxT11Col) ) {
          T11.cells[i -n].style.pixelWidth=wT2;
         } else {
          T1.cells[i -maxT11Col].style.pixelWidth=wT2;
	 }
      }
     maxWidth= ( wT1 > wT2 ) ? maxWidth + wT1: maxWidth + wT2;
    }

    maxWidth += incr;
    Table1.width= maxWidth;
    Table2.Width= Table1.Width;

    if ( Table1.clientWidth < mainTb.clientWidth ){
       incr= (Div1.style.overflowY=="scroll") ? Table1.clientWidth + 18: Table1.clientWidth;
       adjust= mainTb.clientWidth - incr ;
       adjPerCol= adjust / (maxCol - rb);
       adjPerCol= Math.round(adjPerCol);

     for(k=0;k<n;k++){
       wT1= T1.cells[k].style.pixelWidth;
       T1.cells[k].style.pixelWidth= ( k == (rb-1) ) ? wT1: wT1 + adjPerCol;
       wT2= T2.cells[k].style.pixelWidth;
       T2.cells[k].style.pixelWidth= ( k == (rb-1) ) ? wT2: wT2 + adjPerCol;
     }

     for(k=n;k<maxCol;k++){
      if ( k>=n && k<=(n+maxT11Col) ) {
       wT1= T11.cells[k - n].style.pixelWidth;
       T11.cells[k - n].style.pixelWidth= ( k == (rb-1) ) ? wT1: wT1 + adjPerCol;
      }  else {
       wT1= T1.cells[k - maxT11Col].style.pixelWidth;
       T1.cells[k - maxT11Col].style.pixelWidth= ( k == (rb-1) ) ? wT1: wT1 + adjPerCol; }
      wT2= T2.cells[k].style.pixelWidth;
      T2.cells[k].style.pixelWidth= ( k == (rb-1) ) ? wT2: wT2 + adjPerCol;
     }

    }

 }
  else{ Table1.width="100%" }
}

function divResize(addInfo) {
  var minValue= mainTable.offsetTop + dataDiv1.offsetTop + 30;
  var h = document.body.clientHeight - minValue ;
  var totalrow= parseInt(document.forms[0].totalRow.value);
  var maxHeight= totalrow * 20; //dataDiv1.childNode.offsetHeight;


  if (addInfo) {
    minValue= mainTable.offsetTop + dataDiv1.offsetTop + tbAddInfo.offsetHeight + 4;
  }
  h = (h <= 0) ? maxHeight: h;
  if ( totalrow > 10 && document.body.clientHeight > minValue ) {
     if ( h  < maxHeight ) {
        dataDiv1.style.height= h + "";
   	dataDiv1.style.overflowY="scroll";
       }
    else {
           dataDiv1.style.height=maxHeight + "";
   	     dataDiv1.style.overflowY="";
        }
    }
  else if ( totalrow > 10 && document.body.clientHeight <= minValue ) {
        dataDiv1.style.height= (addInfo) ? "" + tbAddInfo.offsetHeight:"200";
        dataDiv1.style.overflowY="scroll";
   }
  }


 function showChecked(name) {
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elemt = document.forms[0].elements[n];
      	if(elemt.name == name )
      	{
        		if ( elemt.checked ) {
        		 elemt.click();
             break; 	}
      	}
      }
 }

function showOpt(showall){
 if (showall){
    dataDiv.style.overflowY= "visible";
 } else {
	dataDiv.style.overflowY= "scroll";
	dataDiv.style.height=  mainTable1.offsetTop + mainTable1.offsetHeight + "";
 }
}


function CenterWindow(u,w1,h1,tp) {
   CenterNamedWindow(u,'',w1,h1,tp);
}

function CenterNamedWindow(u,nm,w1,h1,tp)
{
  	var w=screen.width;
	var h=screen.height;
	var posTop=(h-h1)/2;
	var posLeft=(w-w1)/2;
	var position='left='+posLeft+',top='+posTop+',height='+h1+',width='+w1;

	var n =nm
	var X =null;
	var Y = null;
	var cU  =imgPath+'close_up.gif'
	var cO  =imgPath+'close_ovr.gif'
	var cL  =imgPath+'clock.gif'
	var mU  =imgPath+'min_up.gif'
	var mO  =imgPath+'min_ovr.gif'
	var xU  =imgPath+'max_up.gif'
	var xO  =imgPath+'max_ovr.gif'
	var rU  =imgPath+'res_up.gif'
	var rO  =imgPath+'res_ovr.gif'
	var tH  ='<font face=verdana size=1>eIBS - Datapro, Inc.</font>'
	var tW  ='eIBS - Datapro, Inc.'
	var wB  ='#000000'
	var wBs ='#FFFFFF'
	var wBG ='#ABBAD3'
	var wBGs='#ABBAD3'
	var wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0'
	var fSO ='scrolling=auto noresize'
	var brd =10;
	var ful =true;
	var min =false;
	var res =true;
	var tsz =20;

	var listin = null;

  switch (tp){
    case 1:
		 listin = window.open(u,nm,position);
		//wNS ='';
		//listin = chromeless(u,n,w1,h1,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,ful,min,res,tsz);
		break;
    case 2:
		 listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
		//wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=yes';
		//listin = chromeless(u,n,w1,h1,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,ful,min,res,tsz);
    	break;
    case 3:
		 listin = window.open(u,nm,'scrollbars=yes,'+position);
		//wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=yes';
		//listin = chromeless(u,n,w1,h1,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,ful,min,res,tsz);
		break;
    case 4:
		 listin = window.open(u,nm,'toolbar=yes,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
		//wNS ='toolbar=yes,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=yes';
		//listin = chromeless(u,n,w1,h1,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,ful,min,res,tsz);
    	break;
    case 5:
		 listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,'+position);
		//wNS ='toolbar=yes,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0';
		//listin = chromeless(u,n,w1,h1,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,ful,min,res,tsz);
    	break;
    case 6:
		 listin = window.open(u,nm,'scrollbars=no,'+position);
		//wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=yes';
		//listin = chromeless(u,n,w1,h1,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,ful,min,res,tsz);
		break;
    case 7:
		listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,'+position);
    	break;
    case 8:
		 listin = window.open(u,nm,'window.parent.location,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
		//wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=yes';
		//listin = chromeless(u,n,w1,h1,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,ful,min,res,tsz);
    	break;
	}


	return listin;


}

function SayThis(s)
{
	applet=document.applets.Speaker;
	s = prefix + language + "media/" + s;
	if(applet!=null)
		document.applets["Speaker"].SayThis(s)
}

function MM_swapImgRestore() {// v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() {// v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) {// v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_swapImage() {// v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function imgDown(name, img_over)  {
      MM_preloadImages(imgPath +language + img_over);
      MM_swapImage(name,'',imgPath +language + img_over,1);

      // alert("name=" + name + " --- image=" + imgPath +language + img_over);

      // setTimeout('document.forms[0].submit()','1000');
      // delay here and
      // MM_swapImgRestore();
}


function autotab(e){

 var elem;
	if( isIE() ){
        keyCode = event.keyCode;
		elem=event.srcElement;
	} else {
        keyCode = e.which;
        elem = e.target;
	}

 var coll=document.forms[0];
 var i=0;
  if (keyCode==9 || keyCode==16) return; //TAB=9 and SHIFT=16
  if (elem.type=="text" || elem.type=="password") {
   if (elem.value.length > (elem.maxLength-1)){
      while (i<coll.length){
        if (coll[i]==elem) { break;} else {i++;}
       }
      i++;
      while (i < coll.length) {
        if (coll[i].type=="hidden" || coll[i].readOnly || coll[i].style.visibilty =="hidden") {i++;}
        else {
         coll[i].focus();
         if (coll[i].tagName !=="SELECT") { coll[i].select();}
         break;}
       }

   }
 }
 }

 document.onkeyup=autotab;

  function isIE(){
  	if( document.all ){
		// IE
  		return true;
  	}
  }

 function getMSIEVer(){
  var ver=0;
  var start= (navigator.appVersion.indexOf("MSIE ") != -1) ? navigator.appVersion.indexOf("MSIE ") : 0;
  var end= (start > 0) ? navigator.appVersion.indexOf(";",start) : 0;

  ver= parseFloat(navigator.appVersion.substring(start + 5,end)); // +5 because length("MSIE ")=5
  return(ver);

 }

if ( getMSIEVer() < 5.5 ) {
  var tempStyle = "<STYLE>"+
  		  ".tdaddinfo{ filter:BlendTrans(duration=1);}"+
		  "</STYLE>"
  document.write(tempStyle);
}

// date validation .

function getActualDate(DTFMT, firstDay){
var now = new Date();
var year  = now.getYear();
var month  = now.getMonth()+1;
if (firstDay) var day = "01";
else var day  = now.getDate();
var today = '';
if (DTFMT == 'MDY') today = month+'/'+day+'/'+year;
else if (DTFMT == 'DMY') today = day+'/'+month+'/'+year;
     else
         if (DTFMT == 'YMD') today = year+'/'+day+'/'+month;

return today;
}

//////// Check whether string s is empty.
function isEmpty(s)
{   return ((s == null) || (s.length == 0))
}

// isYear (STRING s)
//
// isYear returns true if string s is a valid
// Year number.  Must be 2 or 4 digits only.
//
function isYear (s)
{   if (isEmpty(s)) return false;
    return ((s.length == 2) || (s.length == 4));
}

// isMonth (STRING s)
//
// isMonth returns true if string s is a valid
// month number between 1 and 12.
//
function isMonth (s)
{   if (isEmpty(s)) return false;
    return (parseInt(s,10) >=1 && parseInt(s,10) <=12);
}

// isDay (STRING s)
//
// isDay returns true if string s is a valid
// day number between 1 and 31.
//
function isDay (s)
{   if (isEmpty(s)) return false;
    return (parseInt(s,10) >=1 && parseInt(s,10) <=31);
}

// daysInFebruary (INTEGER year)
//
// Given integer argument year,
// returns number of days in February of that year.
function daysInFebruary (year)
{   // February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (  ((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0) ) ) ? 29 : 28 );
}


//validate date
function isDate (year, month, day)
{
    if (! (isYear(year) && isMonth(month) && isDay(day)) ) return false;
    var intYear = parseInt(year,10);
    var intMonth = parseInt(month,10);
    var intDay = parseInt(day,10);
    if ((intMonth == 2) && (intDay > daysInFebruary(intYear))) return false;
    return true;
}

//format date ,fills day & month with leading zeroes, and year with century
function fDate(vDate, fmtDate){
 var dateArray=vDate.split("/");
 var day = "";
 var month = "";
 var year = "";
 if (fmtDate == "MDY") {
    day = dateArray[1];
    month = dateArray[0];
    year = dateArray[2];
 } else if (fmtDate == "DMY") {
           day = dateArray[0];
           month = dateArray[1];
           year = dateArray[2];
	} else if (fmtDate == "YMD") {
                  day = dateArray[2];
                  month = dateArray[1];
                  year = dateArray[0];}
                else return "";
day = ((day.length == 1)?"0"+day:day);
month = ((month.length == 1)?"0"+month:month);
year = ((year.length == 2)? ((parseInt(year,10)>50)?"19":"20") + year:year);
if (fmtDate == "MDY") return (month+'/'+day+'/'+year);
else if (fmtDate == "DMY") return (day+'/'+month+'/'+year);
     else if (fmtDate == "YMD") return (year+'/'+month+'/'+day);
          else return "";
}

//yy/mm/dd
function isDateValid (year, month, day)
{
    day = ((day.length == 1)?"0"+day:day);
    month = ((month.length == 1)?"0"+month:month);
    year = ((year.length == 2)? ((parseInt(year,10)>50)?"19":"20") + year:year);

    return isDate(year,month,day);
}

// disable click right
function right(evt) {
	evt = getEvent(evt);
	if ((evt.button == 2 || evt.button == 3)) {
		cancelEvent(evt);
		var message = BrowserDetect.browser + " - " + BrowserDetect.version 
			+ "\neIBS \nDatapro, inc.\nAll Right Reserved";
		alert(message);
	} else {
		return true;
	}
}

function closeError() {

 if (errorwin !== null) {
   if (errorwin !== window)
	errorwin.close();
 }

}

// document.onmousedown=right;
function RestoreFilter(){
  var tabcoll=document.all.tags("TABLE");
  if (tabcoll!=null)
	{
    for (i=0; i<tabcoll.length; i++)
      if (tabcoll[i].className=="tableinfo") tabcoll[i].style.filter="progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true')";
  }

}

function RemoveFilter(){
  var tabcoll=document.all.tags("TABLE");
  if (tabcoll!=null)
	{
    for (i=0; i<tabcoll.length; i++)
      if (tabcoll[i].className=="tableinfo") tabcoll[i].style.filter="";
  }
}

window.onafterprint=RestoreFilter;
window.onbeforeprint=RemoveFilter;
window.onunload=closeError;

/*
	CHROMELESS WINDOWS v.35.1 [ 8.1K ]
	Licensed under GNU LGPL (www.gnu.org)

	(c) Gabriel Suchowolski,2000 >> www.microbians.com
	Thanks to Gustavo Ponce >> www.urbanlove.org (resize addon)
*/

function chromeless(u,n,W,H,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,max,min,res,tsz){
	var c=(document.all&&navigator.userAgent.indexOf("Win")!=-1)?1:0
	var v=navigator.appVersion.substring(navigator.appVersion.indexOf("MSIE ")+5,navigator.appVersion.indexOf("MSIE ")+8)
	min=(v>=5.5?min:false);
	var w=window.screen.width; var h=window.screen.height
	var W=W||w; W=(typeof(W)=='string'?Math.ceil(parseInt(W)*w/100):W); W+=(brd*2+2)*c
	var H=H||h; H=(typeof(H)=='string'?Math.ceil(parseInt(H)*h/100):H); H+=(tsz+brd+2)*c
	var X=X||Math.ceil((w-W)/2)
	var Y=Y||Math.ceil((h-H)/2)
	var s=",width="+W+",height="+H

	if(c){
		var cTIT='\n'+
		'<html><head><META HTTP-EQUIV="imagetoolbar" CONTENT="no">\n'+
		'<script>\n'+
		'var IcU=new Image();IcU.src="'+cU+'";var IcO=new Image();IcO.src="'+cO+'";var IcL=new Image();IcL.src="'+cL+'";var IxU=new Image();IxU.src="'+xU+'";var IxO=new Image();IxO.src="'+xO+'";var IrU=new Image();IrU.src="'+rU+'";var IrO=new Image();IrO.src="'+rO+'";var ImU=new Image();ImU.src="'+mU+'";var ImO=new Image();ImO.src="'+mO+'"\n'+
		'document.onmousemove=document.onselectstart=document.ondragstart=document.oncontextmenu=new Function("wMOV();return false");\n'+
		'b=-1\n'+
		'wLOA=function(){if(top.ok&&document.body){'+(min?'bMIN.style.visibility="visible";':'')+'bLOA.style.visibility="hidden";wRSZ()}else setTimeout("wLOA()",500)};wLOA()\n'+
		'wRSZ=function(){var dw=document.body.clientWidth;bCLO.style.pixelLeft=dw-22;bMIN.style.pixelLeft=bLOA.style.pixelLeft=dw-62;bFUL.style.pixelLeft=bRES.style.pixelLeft=dw-42}\n'+
		'wMAX=function(m){top.mod=m;if(m){top.mT(0,0);top.rT('+w+','+h+');bFUL.style.visibility="hidden";bRES.style.visibility="visible"}else{top.mT(top.px,top.py);top.rT(top.sW,top.sH);bFUL.style.visibility="visible";bRES.style.visibility="hidden"}}\n'+
		'wDBL=function(){if(!top.mod)wMAX(1);else wMAX(0)}\n'+
		'wMIN=function(){top.window.moveTo(0,-4000);if(top.opener&&!top.opener.closed){top.opener.window.focus()};top.window.blur()}\n'+
		'wMOV=function(){\n'+
		'if(b==0){top.bCOL("'+wBG+'","'+wB+'");b=-1}\n'+
		'if(b==2&&!top.mod){top.px=event.screenX-ofx-1;top.py=event.screenY-ofy-1;top.mT(top.px,top.py)}\n'+
		'if(b==1){top.bCOL("'+wBGs+'","'+wBs+'");ofx=event.x;ofy=event.y;b=2}\n'+
		'}</script></head>\n'+
		'<body onresize="wRSZ()" bgcolor='+wBG+'>\n'+
		'<div style="position:absolute;left:5px;top:4px;width:2000px">'+tH+'</div>\n'+
		'<img id=bMOV style="position:absolute;left:-50px;top:-50px" '+(max?'ondblclick="wDBL()"':'')+' onmousemove="wMOV()" onmousedown="b=1;wMOV()" onmouseup="b=0;wMOV()" border=0 src="" width=2000 height=2000>\n'+
		'<img id=bFUL style="position:absolute;top:4px;left:'+(W-42)+'px;'+(max?'':'display:none')+'" src="'+xU+'" border=0 width=11 height=11 onmouseover="this.src=IxO.src" onmouseout="this.src=IxU.src" onmouseup="this.src=IxU.src" onmousedown="this.src=IxU.src" onclick="wMAX(1)">\n'+
		'<img id=bRES style="position:absolute;top:4px;left:'+(W-42)+'px;visibility:hidden" src="'+rU+'" border=0 width=11 height=11 onmouseover="this.src=IrO.src" onmouseout="this.src=IrU.src" onmouseup="this.src=IrU.src" onmousedown="this.src=IrU.src" onclick="wMAX(0)">\n'+
		'<img id=bCLO style="position:absolute;top:4px;left:'+(W-22)+'px;" src="'+cU+'" border=0 width=11 height=11 onmouseover="this.src=IcO.src" onmouseout="this.src=IcU.src" onmouseup="this.src=IcU.src" onmousedown="this.src=IcU.src" onclick="top.window.close()">\n'+
		'<img id=bLOA style="position:absolute;top:4px;left:'+(W-62)+'px;" src="'+cL+'" border=0 width=11 height=11>\n'+
		'<img id=bMIN style="position:absolute;top:4px;left:'+(W-62)+'px;visibility:hidden" src="'+mU+'" border=0 width=11 height=11 onmouseover="this.src=ImO.src" onmouseout="this.src=ImU.src" onmouseup="this.src=ImU.src" onmousedown="this.src=ImU.src" onclick="wMIN()">\n'+
		'</body>\n'+
		'</html>'

		cTIT=cTIT.replace(/\//g,"\\\/").replace(/\"/g,"\\\"").replace(/\n/g,"\\n")

		cRES=function(b,s){
			var tmp='\n'+
			'<html><head><META HTTP-EQUIV="imagetoolbar" CONTENT="no">\n'+
			'<script>\n'+
			'document.onmousemove=document.onselectstart=document.ondragstart=document.oncontextmenu=new Function("wMOV();return false");\n'+
			'b=-1\n'+
			'wMOV=function(){if(!top.mod){\n'+
			'if(b==0){top.sH=top.fH;top.sW=top.fW;b=-1}\n'+
			'if(b==2&&(1=='+b+'||4=='+b+'||5=='+b+')){tmp=event.screenY-oH;if(top.sH+tmp>100){top.fH=top.sH+tmp}}\n'+
			'if(b==2&&(2=='+b+'||4=='+b+')){tmp=event.screenX-oW;if(top.sW-tmp>100){top.fW=top.sW-tmp;top.px=event.screenX-ofx-1}}\n'+
			'if(b==2&&(3=='+b+'||5=='+b+')){tmp=event.screenX-oW;top.fW=top.sW+tmp}\n'+
			'if(b==2){setTimeout("top.rT(top.fW,top.fH);top.mT(top.px,top.py);",10)}\n'+
			'if(b==1){ofx=event.x;oH=event.screenY;oW=event.screenX;b=2}\n'+
			'}}</script></head>\n'+
			'<body bgcolor='+wBG+'>\n'+
			'<img style="cursor:'+s+'-resize" id=bMOV style="position:absolute;left:-50px;top:-50px" onmousemove="wMOV()" onmousedown="b=1;wMOV()" onmouseup="b=0;wMOV()" border=0 src="" width=3000 height=2000>\n'+
			'</body>\n'+
			'</html>'
			return tmp.replace(/\//g,"\\\/").replace(/\"/g,"\\\"").replace(/\n/g,"\\n")
		}

		var cRESd=cRES(1,'s'),cRESl=cRES(2,'w'),cRESr=cRES(3,'e'),cRESbl=cRES(4,'sw'),cRESbr=cRES(5,'se')

		var cFRM='<HTML><HEAD><TITLE>'+tW+'</TITLE>\n'+
		'<script>\n'+
		'ok=0;mod=0;sH=fH='+(H)+';sW=fW='+(W)+';px='+(X)+';py='+(Y)+'\n'+
		'bCOL=function(c1,c2){fT.document.bgColor=n0.document.bgColor=n1.document.bgColor=n2.document.bgColor=n3.document.bgColor=n4.document.bgColor=c1;bL.document.bgColor=bT.document.bgColor=bR.document.bgColor=bB.document.bgColor=c2}\n'+
		'mTIT=function(){if(frames.length>8){fT.document.write("'+cTIT+'");fT.document.close();if ('+res+'){n2.document.write("'+cRESd+'");n2.document.close();n1.document.write("'+cRESr+'");n1.document.close();n0.document.write("'+cRESl+'");n0.document.close();n3.document.write("'+cRESbl+'");n3.document.close();n4.document.write("'+cRESbr+'");n4.document.close()};top.bCOL("'+wBG+'","'+wB+'")}else{setTimeout("mTIT()",20)}}\n'+
		'mT=function(x,y){top.window.moveTo(x,y)}\n'+
		'rT=function(w,h){top.window.resizeTo(w,h)}\n'+
		'top.rT(fW,fH);top.mT(px,py)\n'+
		'mTIT()\n'+
		'</script></HEAD>\n'+
		'<frameset onselectstart="return false" onload="top.ok=1" onfocus="if (top.ok&&fT&&fT.wMAX) fT.wMAX(top.mod)" border=0 framespacing=0 frameborder=0 rows="'+tsz+',100%,'+brd+'">\n'+
		'	<frame name=fT src="about:blank" scrolling=no noresize>\n'+
		'	<frameset border=0 framespacing=0 frameborder=0 cols="'+brd+',1,100%,1,'+brd+'">\n'+
		'		<frame name=n0 src="about:blank" scrolling=no noresize>\n'+
		'		<frame name=bL src="about:blank" scrolling=no noresize>\n'+
		'			<frameset border=0 framespacing=0 frameborder=0 rows="1,100%,1">\n'+
		'				<frame name=bT src="about:blank" scrolling=no noresize>\n'+
		'				<frame name=frm_main src="'+u+'" '+fSO+'>\n'+
		'				<frame name=bB src="about:blank" scrolling=no noresize>\n'+
		'			</frameset>\n'+
		'		<frame name=bR src="about:blank" scrolling=no noresize>\n'+
		'		<frame name=n1 src="about:blank" scrolling=no noresize>\n'+
		'	</frameset>\n'+
		'	<frameset border=0 framespacing=0 frameborder=0 cols="'+brd+',100%,'+brd+'">\n'+
		'		<frame name=n3 src="about:blank" scrolling=no noresize>\n'+
		'		<frame name=n2 src="about:blank" scrolling=no noresize>\n'+
		'		<frame name=n4 src="about:blank" scrolling=no noresize>\n'+
		'	</frameset>\n'+
		'</frameset>\n'+
		'</HTML>'

		var CWIN=window.open("",n,"fullscreen=1"+s)
		CWIN.moveTo(5000,0)
		CWIN.ft=true
		CWIN.document.write(cFRM)
		CWIN.document.close()
	} else {
		var CWIN=window.open(u,n,wNS+s,true)
		CWIN.moveTo(X,Y)
	}
	CWIN.focus()
	CWIN.setURL=function(u) { if (this && !this.closed) { if (this.frames.frm_main) this.frames.frm_main.location.href=u; else this.location.href=u } }
	CWIN.closeIT=function() { if (this && !this.closed) this.close() }
	return CWIN
}

function openIT(u,W,H) {
	var n ='eibs'
	var X =null;
	var Y = null;
	var cU  =imgPath+'close_up.gif'
	var cO  =imgPath+'close_ovr.gif'
	var cL  =imgPath+'clock.gif'
	var mU  =imgPath+'min_up.gif'
	var mO  =imgPath+'min_ovr.gif'
	var xU  =imgPath+'max_up.gif'
	var xO  =imgPath+'max_ovr.gif'
	var rU  =imgPath+'res_up.gif'
	var rO  =imgPath+'res_ovr.gif'
	var tH  ='<font face=verdana size=1>eIBS - Datapro, Inc.</font>'
	var tW  ='eIBS - Datapro, Inc.'
	var wB  ='#000000'
	var wBs ='#FFFFFF'
	var wBG ='#ABBAD3'
	var wBGs='#ABBAD3'
	var wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0'
	var fSO ='scrolling=yes noresize'
	var brd =10;
	var ful =true;
	var min =false;
	var res =true;
	var tsz =20;
	chromeless(u,n,W,H,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,ful,min,res,tsz)
}

function setCenterSize(w1,h1) {
		top.resizeTo(w1,h1);
		var w=screen.width;
		var h=screen.height;
		var posTop=(h-h1)/2;
		var posLeft=(w-w1)/2;
		top.moveTo(posLeft,posTop);

}

// To test a rate value consisting of maximum 3 integers and maximum 6 decimals
function enterRate() {
	enterDecimal(event, 6);
}
