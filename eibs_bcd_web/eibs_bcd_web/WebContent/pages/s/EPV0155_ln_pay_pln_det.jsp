<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="datapro.eibs.sockets.DecimalField" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<html>
<head>
<title>Esquema de Pagos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="header" class="datapro.eibs.beans.EPV015501Message" scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

</head>

<style>
label:after {
    content: "\A";
    white-space: pre;
    margin-bottom: 10px;
}

input[type=text]{
    margin-left: 3px;
}
</STYLE>

<body>
<%
  int row = list.getNoResult() ? 0 : list.getLastRow() + 1;
  double suma = 0;
  double valor = 0;
  if (!error.getERRNUM().equals("0") && "S".equals(request.getAttribute("ERR"))) {
    error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println(" showErrors()");
    out.println("</SCRIPT>");
  }
%> 




<SCRIPT type="text/javascript">

function SendInfo(){
	getElement("SCREEN").value = 508;		
	
  var intinc = "";
  try {
    var myTable = getElement("DINTABLE");
    for (i = 1; i <= myTable.rows.length; i++) {
      intinc = getElement("DLPIIP_" + i).value;  
      vlrpri = parseFloat((getElement("DLPPRI_" + i).value));
    }
    if ((intinc == "N") || (vlrpri == 0)) {
      if (intinc == "N") {
      	alert("La ultima cuota debe tener los intereses incluidos.");
      }
      if (vlrpri == "0") {
      	alert("El valor de capital de la ultima cuota debe ser mayor a cero.");
      }
    } else {
      document.forms[0].submit();
    }
  } catch(e) {
    //alert("SendInfo: "+e);
  }
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

function checkRowValue() {
	if (trim(document.forms[0].TEMP_ROW.value) != "") {
   		var r = parseInt(document.forms[0].TEMP_ROW.value);
   		if (r > 99 ) {
    		alert("Valor fuera de limites, el numero maximo es 99.");
   		} else if (r == 0) {
   			document.forms[0].TEMP_ROW.value = 1;
   		}
  	} else document.forms[0].TEMP_ROW.value = 1;
}

function orderTable(tableName){ 
	var elemsName = ["DLPPNU_", "DLPPD1_", "DLPPD2_", "DLPPD3_", "DLPPRI_", "DLPINT_", "DLPIIP_","DLPSAL_","DLPAMT_","FLGPRO_"];
	var inputs;
	
	$.each(elemsName, function(index, value ){
	    var $this = $(this);
		$('#DINTABLE :input').each(function(i){
			if(this.name.indexOf(value) == 0 && !this.name.endsWith("_0")){
				this.name = value + parseInt($(this).closest('tr')[0].sectionRowIndex + 1);
				this.disabled = false;
			}
			
			if(this.name.indexOf("DLPPNU_") == 0 ){
				this.value = parseInt($(this).closest('tr')[0].sectionRowIndex + 1);
				getElement("ROW").value = this.value;
			}
		});
	});
}

function OrderElements(tableName){   
  	var maxRow;
  	var numOrd;
  	try {
  		var myTable = getElement(tableName);
		maxrow = myTable.rows.length;
		numOrd = 0;
		for (i=1; i < maxrow; i++) {    
			if (i+1 < maxrow) {			
				var mm1 = parseInt(getElement("DLPPD1_" +i).value);
				var dd1 = parseInt(getElement("DLPPD2_" +i).value);
				var yy1 = parseInt(getElement("DLPPD3_" +i).value);
				var mm2 = parseInt(getElement("DLPPD1_" +(i+1)).value);
				var dd2 = parseInt(getElement("DLPPD2_" +(i+1)).value);
				var yy2 = parseInt(getElement("DLPPD3_" +(i+1)).value);
				var myDate1 = new Date(yy1, mm1-1, dd1);
				var myDate2 = new Date(yy2, mm2-1, dd2);
				if (myDate1 > myDate2) {
					numOrd = numOrd + 1;
 					ReplaceElements(i+1, i);
 				}
			}
  		}
  		if (numOrd > 0) {
  			OrderElements(tableName);
  		}
  	} catch(e) {
  		//alert("OrderElements: "+e);
  	}
}

function ReplaceElements(posIni, posEnd){   
  	try {
	    document.forms[0].elements("DLPPD1_0").value = document.forms[0].elements("DLPPD1_" + posEnd).value;
	    document.forms[0].elements("DLPPD2_0").value = document.forms[0].elements("DLPPD2_" + posEnd).value;    
	    document.forms[0].elements("DLPPD3_0").value = document.forms[0].elements("DLPPD3_" + posEnd).value;
	    document.forms[0].elements("DLPAMT_0").value = document.forms[0].elements("DLPAMT_" + posEnd).value;
	    document.forms[0].elements("DLPPRI_0").value = document.forms[0].elements("DLPPRI" + posEnd).value;    
	    document.forms[0].elements("DLPINT_0").value = document.forms[0].elements("DLPINT_" + posEnd).value;    
	    document.forms[0].elements("DLPIIP_0").value = document.forms[0].elements("DLPIIP_" + posEnd).selectedIndex;
	    //
	    document.forms[0].elements("DLPPD1_" + posEnd).value = document.forms[0].elements("DLPPD1_" + posIni).value;
	    document.forms[0].elements("DLPPD2_" + posEnd).value = document.forms[0].elements("DLPPD2_" + posIni).value;    
	    document.forms[0].elements("DLPPD3_" + posEnd).value = document.forms[0].elements("DLPPD3_" + posIni).value;
	    document.forms[0].elements("DLPAMT_" + posEnd).value = document.forms[0].elements("DLPAMT_" + posIni).value;    
	    document.forms[0].elements("DLPPRI_" + posEnd).value = document.forms[0].elements("DLPPRI_" + posIni).value;    
	    document.forms[0].elements("DLPINT_" + posEnd).value = document.forms[0].elements("DLPINT_" + posIni).value;    
	    document.forms[0].elements("DLPIIP_" + posEnd).selectedIndex = document.forms[0].elements("DLPIIP_" + posIni).selectedIndex;
	    //
	    document.forms[0].elements("DLPPD1_" + posIni).value = document.forms[0].elements("DLPPD1_0").value;
	    document.forms[0].elements("DLPPD2_" + posIni).value = document.forms[0].elements("DLPPD2_0").value;    
	    document.forms[0].elements("DLPPD3_" + posIni).value = document.forms[0].elements("DLPPD3_0").value;
	    document.forms[0].elements("DLPAMT_" + posIni).value = document.forms[0].elements("DLPAMT_0").value;   
	    document.forms[0].elements("DLPPRI_" + posIni).value = document.forms[0].elements("DLPPRI_0").value;    
	    document.forms[0].elements("DLPINT_" + posIni).value = document.forms[0].elements("DLPINT_0").value;
	    document.forms[0].elements("DLPIIP_" + posIni).selectedIndex = document.forms[0].elements("DLPIIP_0").value;      
  	} catch(e) {
  		alert("MoveElements: "+e);
  	}
}

function MoveElements(posIni, posEnd){   
  	try {
	    document.forms[0].elements("DLPPD1_" + posEnd).value = document.forms[0].elements("DLPPD1_" + posIni).value;
	    document.forms[0].elements("DLPPD2_" + posEnd).value = document.forms[0].elements("DLPPD2_" + posIni).value;    
	    document.forms[0].elements("DLPPD3_" + posEnd).value = document.forms[0].elements("DLPPD3_" + posIni).value;
	    document.forms[0].elements("DLPAMT_" + posEnd).value = document.forms[0].elements("DLPAMT_" + posIni).value;    
	    document.forms[0].elements("DLPPRI_" + posEnd).value = document.forms[0].elements("DLPPRI_" + posIni).value;    
	    document.forms[0].elements("DLPINT_" + posEnd).value = document.forms[0].elements("DLPINT_" + posIni).value;    
	    document.forms[0].elements("DLPIIP_" + posEnd).selectedIndex = document.forms[0].elements("DLPIIP_" + posIni).selectedIndex;
  	} catch(e) {
  		//alert("MoveElements: "+e);
  	}
}
 
// Rename the fields de una specific table dependiendo del flag. If the field's sufix is different  a la row donde esta,
// then se renombra
function UpdateTable(tableName, chkboxName, noRow) {  
   	var maxRow;
   	var restRow;
	try {
        var myTable = getElement(tableName);
     	maxRow = myTable.rows.length;
     	restRow = maxRow - noRow;
     	for (i=restRow; i < maxRow; i++) {
     	  	myTable.deleteRow(restRow);
      	}     	
     	if (restRow > 1) {
     	   var myChkB = document.forms[0][chkboxName];     	   
     	   if (myChkB.length == null) {
     	   		myChkB.checked = false;
     	   } else {
     	   	  	for (j=0; j < myChkB.length; j++) {     	      	 
     	      		myChkB[j].checked = false;
     	   	  	}
     	   }
     	}     	
    } catch(e) {
    	//alert("UpdateTable: "+e);
    }
}

function DeleteRowSel(tableName, chkboxName){
  try {
    /* var noRow = DeleteRows(tableName, chkboxName);  
    if (noRow > 0) {
      UpdateTable(tableName, chkboxName, noRow);    
      document.forms[0].ROW.value = "" + document.all[tableName].rows.length -1;
    } */
    $('#DINTABLE input[type="checkbox"][name="ROWSEL"]:checked').each(function(){ 
    	$(this).closest('tr').remove();
    });
	
    
    orderTable("DINTABLE");
    
    if(document.forms[0]["SELALL"].checked){
    	document.forms[0]["SELALL"].checked = false;
    }
    
	loadPaymentTable(true);

    //updateTotal();
  } catch(e) {
    //alert("DeleteRowSel: "+e);
  }
}

function updateTotal() {  
  var total = 0.00;
  try {
    var myTable = getElement("DINTABLE");
    for (i = 1; i <= myTable.rows.length-1; i++) {
      total = total + parseFloat((getElement("DLPAMT_" + i).value));  
    }
    getElement("RESUMEN").rows[0].cells[3].innerHTML = formatCCY(total);
    setSelection(false);
    OrderElements("DINTABLE");
  } catch(e) {
    //alert("updateTotal: "+e);
  }
}
    
function DeleteRows(tableName, chkboxName){  
	var maxrow;
   	var noRow = 0;
   	var firstTime = true;
   	var okdel = false;
    
    try {
        var myTable = getElement(tableName);
     	maxrow = myTable.rows.length;
     	if (maxrow > 1) {
     	   var myChkB = document.forms[0][chkboxName];
     	   if (myChkB.length == null) {
     	   		if (myChkB.checked) {
     	      		if (firstTime) {
     	      			okdel = confirm("Todos los pagos seleccionados se borraran");
    					if ( !okdel ) return(noRow);
     	      	 	}
     	         	myTable.deleteRow(1);
     	         	return noRow;
     	      	}
     	   } else {     	   
   	      		for (i=0; i < myChkB.length; i++) {     	   			
   	      			if (myChkB[i].checked){
   	      	 			if (firstTime) {
   	      					okdel = confirm("Todos los pagos seleccionados se borraran");
   							if ( !okdel ) break;
   							firstTime = false;
   						}
   						noRow++;   	         		     	         		
   	         		} else {
   	         	    	if (noRow > 0) {
   	         	    	     var row = i+1;     	         	     
   	         		 		 MoveElements(row,row - noRow);     	         		 
   	         			} 
   	         		}
 	      		}
   	         	if (noRow == 0) {
 	      			//alert("Seleccione un registro antes de realizar esta operacion ");
 	      			//okdel = confirm("Todos los pagos se borraran");
 	      			//if (okdel) {
 	      			   //DeleteAll(tableName);
 	      			//}
   	         	} 	      		
     	   		return(noRow);
     		}
     	} else return(noRow);
    } catch(e) {
    	//alert("DeleteRows: "+e);
       return(noRow);
    }
}

function DeleteAll(tableName){  
  try {
    var myTable = getElement(tableName);
	for(var i = myTable.rows.length - 1; i > 0; i--) {
      myTable.deleteRow(i);
    }
  } catch(e) {
    //alert("DeleteAll: "+e);
    return(noRow);
  }
}
  
// Adiciona una row a una tabla  
 function AddRow(tableName, nRow, hiddenRow) {
   	var maxcell = 8;
   	var idxrow;
   	var okdel = false;
   	var sufix = "";
    try {
    	var myTable = getElement(tableName);
      	if (myTable.rows.length < 360) {
        	myTable.insertRow();
     		idxrow = myTable.rows.length - 1;
     		sufix = "" + parseInt(idxrow+1).toString();
     		myTable.rows[idxrow].className = "trclear";

     		for (i=0; i<maxcell; i++) {
          		myTable.rows[idxrow].insertCell();
          		myTable.rows[idxrow].cells[i].align = "center";
          		myTable.rows[idxrow].cells[i].setAttribute("nowrap","nowrap");
          		myTable.rows[idxrow].cells[i].style.padding = "1px";       		
     		}       	
     		
     		myTable.rows[idxrow].style.display = hiddenRow;
       		myTable.rows[idxrow].cells[0].innerHTML = "<input type='checkbox' name='ROWSEL' value='" + sufix + "'><input type='hidden' name='FLGPRO_" + sufix + "' value=''>";
      		myTable.rows[idxrow].cells[1].innerHTML = "<input type='text' name='DLPPNU_" + sufix + "' size='4' maxlength='3'  value='" +sufix + "' readonly>";
        	myTable.rows[idxrow].cells[2].innerHTML = getDateCells(sufix);
        	myTable.rows[idxrow].cells[3].innerHTML = "<input type='text' name='DLPAMT_" + sufix + "' id='MANDATORY' size='21' maxlength='20' value='' style ='text-align: right' onblur='this.value = formatCCY(this.value)' onKeypress='enterDecimal(event, 2)'> ";
           	myTable.rows[idxrow].cells[4].innerHTML = "<select name='DLPIIP_" + sufix + "'>" +
											        	"<option value='F' selected> Cuota Fija</option>" +
											        	"<option value='Y' > Capital + Inter&eacute;s </option>" +
											        	"<option value='N' > Capital Solamente </option>" +
											        	"<option value='I' > Inter&eacute;s Solamente </option>" +
											        	"</select>";        	
        	myTable.rows[idxrow].cells[5].innerHTML = "<input type='text' name='DLPPRI_" + sufix + "' size='21' maxlength='20' value='' id='txtright' onblur='this.value = formatCCY(this.value)' onKeypress='enterDecimal(event, 2)' >";
        	myTable.rows[idxrow].cells[6].innerHTML = "<input type='text' name='DLPINT_" + sufix + "' size='21' maxlength='20' value='' id='txtright' onblur='this.value = formatCCY(this.value)' onKeypress='enterDecimal(event, 2)' >";
        	myTable.rows[idxrow].cells[7].innerHTML = "<input type='text' name='DLPSAL_" + sufix + "' size='21' maxlength='20' value='' id='txtright' onblur='this.value = formatCCY(this.value)' onKeypress='enterDecimal(event, 2)' readonly>";
     	
        	if (nRow > 1) {
        		AddRow(tableName, nRow - 1, hiddenRow); 
        	} else {
        		document.forms[0].ROW.value = "" + sufix;
        	}
      	}      
    } catch(e) {
    	//alert("AddRow: "+e);
    }
}
 
function delLeftChar(value, character) {
	var result = value;
  	var posi = value.indexOf(character);
  	if(posi > -1 && value.length > 1) {
	  	while(posi == 0) {
			result = value.substring(1);
	      	posi = result.indexOf(character);
	      	value = result;
	  	}    
  	}
  	return(result);
}

function checkAutomaticFields() {
	return true;
	var coll = document.forms[0].elements["AUTOMATICINT"];
  	var elem = null;
  	var v;
  	if (coll != null) {
    	var collength = coll.length;
    	if (collength > 1) {
      		for (i=0; i<collength; i++) {
		 		try {
		    		if (trim(coll[i].value) == "") 
		    			v = 0;
		    		else {
		    			if (coll[i].name == "AMOUNT") {
		       				v = parseFloat(delLeftChar(coll[i].value, '0'));
		       				coll[i].value = formatFloat("" + v);
		    			} else {
		       				v = parseInt(delLeftChar(coll[i].value, '0'));
		       				coll[i].value = "" + v;
		    			}
		    		}
		 			if (v <= 0) {
	          			elem = coll[i];
	          			break;
		 			}
		 		} catch (e) {
           			elem = coll[i];
	       			break;
		 		}
      		}
    	} else {
		 	try {
		    	if (trim(coll.value) == "") 
		    		v = 0;
		    	else {
		       		v = parseInt(delLeftChar(coll.value,'0'));
		       		coll.value = "" + v;	
		    	} 	
		 		if (v <= 0) {
	          		elem = coll;
		 		}
		 	} catch (e) {
           		elem = coll;
		 	}
    	}
    	if ( elem == null) 
    		return true;
    	else {
      		alert("Los campos de Generacion Automatica deben poseer un valor valido.");
      		elem.focus();
      		return false;
    	}
  	} else return true;
}
 
function checkMandatoryFields() {
  	var coll = document.forms[0].elements["MANDATORY"];
  	var elem = null;
  	var v;
  	OrderElements("DINTABLE");
  	if (coll != null) {
    	var collength = coll.length;
    	if (collength > 1) {
      		for (i =0; i< collength; i++) {
		 		try {
		    		if (trim(coll[i].value) == "") {
	          			elem = coll[i];
	          			break;
		 			}
		 		} catch (e) {
           			elem = coll[i];
	       			break;
		 		}
      		}
    	} else {
		 	try {
		    	if (trim(coll.value) == "") {
	          		elem = coll;
		 		}
		 	} catch (e) {
           		elem = coll;
		 	}
    	}
    	if ( elem == null) 
    		return true;
    	else {
      		//alert("Los Fechas y Montos de los pagos deben poseer un valor valido.");
      		elem.focus();
      		return false;
    	}
  	} else return true;
}

function delRowsFrom(tablename,noRow){
   var myTable = getElement("DINTABLE");
   var maxRows = myTable.rows.length;   
   for (j=noRow; j < maxRows;j++) {
       myTable.deleteRow(noRow);
   }
}

function daysInMonth(year, month) {
    return new Date(year, month, 0).getDate();
}

function getDateCells(sufix) {
	var result = "";
	if (document.forms[0]["DFORMAT"].value == "MDY") {
		result = " <input type='text' name='DLPPD1_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>" +
          	 	 " <input type='text' name='DLPPD2_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>" +
          		 " <input type='text' name='DLPPD3_" + sufix + "' id='MANDATORY' size='5' maxlength='4' value='' onKeypress='enterInteger(event)'>";
	} else if (document.forms[0]["DFORMAT"].value == "YMD") {
		result = " <input type='text' name='DLPPD3_" + sufix + "' id='MANDATORY' size='5' maxlength='4' value='' onKeypress='enterInteger(event)'>" +
				 " <input type='text' name='DLPPD1_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>" +
          	 	 " <input type='text' name='DLPPD2_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>";
	} else {
		result = " <input type='text' name='DLPPD2_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>" + 
				 " <input type='text' name='DLPPD1_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>" +
          		 " <input type='text' name='DLPPD3_" + sufix + "' id='MANDATORY' size='5' maxlength='4' value='' onKeypress='enterInteger(event)'>";
	}
  	return(result);
}

function validateValue(valamt) {
	try {
		valamt = getElement(valamt).value;
		valamt = valamt.replace(/\,/g,'');
		valamt = parseFloat(valamt);
		if (isNaN(valamt)) { 
			valamt = 0.00;
		}
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

function isLastDay(dt) {
    var test = new Date(dt.getTime());
    test.setDate(test.getDate() + 1);
    return test.getDate() === 1;
}

function daysInMonth(dt) {
    var dt_temp = new Date(dt.getFullYear(), dt.getMonth()+1, 0);
    return dt_temp.getDate();
}

function isNotWeirdFeburary(mth,day) {
	if(mth == 2){
		if(day == 29 || day == 30 || day == 31){
			return false;
			
		}else{
			return true;
		}		
		
	}else{
		return true;
	}
}

function AutomaticGen() {
	if (checkAutomaticFields()) {
		var maxRows = getElement("DINTABLE").rows.length;
		if (maxRows > 1) {
			var okdel = true; //confirm("Agregar pagos");
			if ( !okdel ) return false;
		}
		var first = maxRows;
		var number = parseInt(getElement("NUMBER").value);
		var amounttype = getElement("AMOUNTTYPE").value;
		var amount = parseFloat(getElement("AMOUNT").value).toString();
		var valpri = validateValue("AMOUNT");
		var deaoam = formatFloat(getElement("E01DEAOAM").value);      
		var month = parseInt(getElement("E01RDM").value);
		var day = parseInt(getElement("E01RDD").value);
		var year = parseInt(getElement("E01RDY").value);
		var feq = parseInt(getElement("FREQUENCY").value);
		var code = getElement("CODE").options[getElement("CODE").selectedIndex].value;
		var myDate = new Date(year, month - 1, day);
		var oyear = parseInt(getElement("E01DEAODY").value);
		var omonth = parseInt(getElement("E01DEAODM").value);
		var oday = parseInt(getElement("E01DEAODD").value);
		var opnDate = new Date(oyear, omonth - 1, oday);
		var ryear = <%= currUser.getBigDecimalE01RDY().intValue() %>;
		var rmonth = <%= currUser.getBigDecimalE01RDM().subtract(new BigDecimal("1")).intValue() %>;
		var rday = <%= currUser.getBigDecimalE01RDD().intValue() %>;
		var runDate = new Date(ryear, rmonth, rday);
		var runDate = new Date(ryear, rmonth, rday);
		var isEndMonth = isLastDay(myDate);

		if(isMonth(month) && isDay(day) && isYear(year.toString()) && isNotWeirdFeburary(month,day)){
			
			if (opnDate > myDate) {
				alert("La Primera Fecha de Pago no puede ser anterior a la Fecha de Apertura.");
				return;
			} else {	
				
				if (code == "D") {
					if (feq % 30 == 0) {
						code = "M";
						feq = feq / 30;
					}
				}
				AddRow("DINTABLE", number,'none');
				for (i=first; i < first - 1 + number + 2; i++) {
					if (i > first) {
						if (code == "D") {
							myDate.set(myDate.getDate() + feq);
						} else if (code == "M") {
							myDate.addMonths(feq);
							
							if(day != myDate.getDate() && myDate.getMonth() + 1 != 2){
								if(isEndMonth){
									if(daysInMonth(myDate) == 30){
										myDate = new Date(myDate.getFullYear(), myDate.getMonth(), 30);
									}else{
										myDate = new Date(myDate.getFullYear(), myDate.getMonth(), 31);
									}
								}else{
									myDate.setDate(day);
								}
							}						
							
						} else {
							year = myDate.getFullYear() + feq;
							var lastday = daysInMonth(year, myDate.getMonth());
							if (day > lastday) {
								myDate.setDate(lastday);
							} else {
								myDate.setDate(day);
							}
							myDate.setFullYear(year);
						}	
					}
					if (i < first - 1 + number + 1) {
						getElement("DLPPD1_" + parseInt(i+1)).value = "" + (myDate.getMonth() + 1);
						getElement("DLPPD2_" + parseInt(i+1)).value = "" + myDate.getDate();
						getElement("DLPPD3_" + parseInt(i+1)).value = "" + myDate.getFullYear();
						getElement("DLPAMT_" + parseInt(i+1)).value = formatCCY(valpri);
						getElement("DLPINT_" + parseInt(i+1)).value = formatCCY("0");
						getElement("DLPIIP_" + parseInt(i+1)).value = $('input[name="form[distribution]"]:checked').val() == "S" ? "Y" : $('input[name="form[distribution]"]:checked').val() ;
						// Porcentaje
						if (amounttype == 'P') {
							getElement("DLPAMT_" + i).value = formatFloat(getElement("AMOUNT").value) * deaoam / 100;
						}
					}
					
					getElement("E01RDM").value = "" + (myDate.getMonth() + 1);
					getElement("E01RDD").value = "" + myDate.getDate();
					getElement("E01RDY").value = "" + myDate.getFullYear();
				}
			}
		}else{
			alert("Error en La Fecha");
			getElement("E01RDD").focus();
			return;
		}
		closeHiddenDiv();
		//updateTotal();
		loadPaymentTable(false);
		
	}
} 

function FileGen() {
  if (document.forms[1].FILENAME.value.length < 1) {
    alert("Nombre de Archivo no Válidos");
    document.forms[1].FILENAME.value='';
    document.forms[1].FILENAME.focus();
  } else {	
    document.forms[1].submit();
  }
}

function closeHiddenDiv(){
	setVisibility(getElement("hiddenDivPln"), "hidden");
	setVisibility(getElement("hiddenDivFil"), "hidden");
}

function showHiddenDivPln(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");

	var hiddenDiv = getElement("hiddenDivPln");
	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
	//var x=(document.body.clientWidth-hiddenDiv.clientWidth)/2;
     
	cancelBub(evt);

	moveElement(hiddenDiv, y, x);
	setVisibility(hiddenDiv, "visible");
}

function showHiddenDivFil(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");

	var hiddenDiv = getElement("hiddenDivFil");
	var y=evt.clientY + document.body.scrollTop;
//	var x=evt.clientX + document.body.scrollLeft;
	var x=(document.body.clientWidth-hiddenDiv.clientWidth)/2;
     
	cancelBub(evt);

	moveElement(hiddenDiv, y, x);
	setVisibility(hiddenDiv, "visible");
}

function setSelection(chk){
  var myTable = getElement("DINTABLE");
  var myChkB  = document.forms[0]["ROWSEL"];
  document.forms[0]["SELALL"].checked = chk;

  if (!(myChkB == null)) {
	  if (!(myChkB.length == null)) {
		  for (i=0; i < myChkB.length; i++) { 
			  if(myChkB[i].disabled && !myChkB[i].checked){
	       	  } else {
	           myChkB[i].checked = chk;
	     	   myChkB[i].disabled = chk; 
	      	 }
          }
	  }
   }
} 

addEventHandler(document, 'click', closeHiddenDiv);

  
</SCRIPT>

<h3 align="center">Cuadro Manual - Plan de Pagos
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_pay_pln_det.jsp, EPV0155"> 
</h3>
<hr size="4">

<%int row1 = 0; %>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0155" onsubmit="return(checkMandatoryFields())">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="508">
  <INPUT TYPE=HIDDEN NAME="firstTime" VALUE="true">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row %>">
  <INPUT TYPE=HIDDEN NAME="DFORMAT" VALUE="<%= currUser.getE01DTF() %>">
  <INPUT TYPE=HIDDEN NAME="DLPPD1_0" VALUE="">
  <INPUT TYPE=HIDDEN NAME="DLPPD2_0" VALUE="">
  <INPUT TYPE=HIDDEN NAME="DLPPD3_0" VALUE="">
  <INPUT TYPE=HIDDEN NAME="DLPPRI_0" VALUE="">
  <INPUT TYPE=HIDDEN NAME="DLPINT_0" VALUE="">
  <INPUT TYPE=HIDDEN NAME="DLPIIP_0" VALUE="">  
  <INPUT TYPE=HIDDEN NAME="E01DEABNK" VALUE="<%= header.getE01DEABNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEABRN" VALUE="<%= header.getE01DEABRN().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEACCY" VALUE="<%= header.getE01DEACCY().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARTE" VALUE="<%= header.getE01DEARTE().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAFRT" VALUE="<%= header.getE01DEAFRT().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAOAM" VALUE="<%= header.getE01DEAOAM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAODM" VALUE="<%= header.getE01DEAODM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAODD" VALUE="<%= header.getE01DEAODD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAODY" VALUE="<%= header.getE01DEAODY().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEABAS" VALUE="<%= header.getE01DEABAS().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAICT" VALUE="<%= header.getE01DEAICT().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEATYP" VALUE="<%= header.getE01DEATYP().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEASPR" VALUE="<%= header.getE01DEASPR().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEA2TC" VALUE="<%= header.getE01DEA2TC().trim()%>">

  <table class="tableinfo" width="100%">
    <tr >
      <td nowrap="nowrap">
        <table cellspacing="0" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap="nowrap" width="16%" >
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap="nowrap" width="20%" >
              <div align="left">
                <input type="text" name="E01DEACUN" id="E01DEACUN" size="10" maxlength="9" value="<%= header.getE01DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap="nowrap" width="16%" >
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap="nowrap" width="20%" >
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= header.getE01CUSNA1().trim()%>" readonly>
                </font></font></font>
              </div>
            </td>
            <td nowrap="nowrap" width="16%">
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap="nowrap" width="16%">
              <div align="left"><b>
                <input type="text" readonly name="E01DEAPRO" size="5" maxlength="4" value="<%= header.getE01DEAPRO().trim()%>">
                </b> 
              </div>
            </td>            
          </tr>
          <tr id="trdark">
            <td nowrap="nowrap" width="16%">
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap="nowrap" width="20%">
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="14" maxlength="12"  readonly
                  value="<% if(userPO.getPurpose().equals("MAINTENANCE")) {out.print(header.getE01DEAACC().trim());} else { 
                    if (header.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(header.getE01DEAACC().trim());} %>"
                  >
              </div>
            </td>
            <td nowrap="nowrap" width="16%">
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap="nowrap" width="16%">
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= header.getE01DEACCY().trim()%>" readonly>
                </b> 
              </div>
            </td>
            <td nowrap="nowrap" width="16%">
              <div align="right"><b>Monto : </b></div>
            </td>
            <td nowrap="nowrap" width="16%">
              <eibsinput:text property="E01DEAOAM" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>            
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap="nowrap" width="16%">
              <div align="right"><b>Fecha Apertura :</b></div>
            </td>
            <td nowrap="nowrap" width="20%">
              <eibsinput:date name="lnBasic" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" readonly="true" />
            </td>
            <td nowrap="nowrap" width="16%">
              <div align="right"><b>Fecha Vencimiento :</b></div>
            </td>
            <td nowrap="nowrap" width="20%">
              <eibsinput:date name="lnBasic"  fn_month="E01DEAMAM" fn_day="E01DEAMAD" fn_year="E01DEAMAY" readonly="true" />
            </td>
            <td nowrap="nowrap" width="16%">
              <div align="right"><b>Inter&eacute;s : </b></div>
            </td>
            <td nowrap="nowrap" width="16%">
              <eibsinput:text property="E01DEARTE" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true"/>            
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  
  
  <table class="tbenter" width="100%" >
    <tr> 
      <td style="width: 20%"></td>
      <td class="TDBKG"><div id="buttonPln" align="center" style="cursor:pointer"><a><b>Generar</b></a></div></td> 
      <td class="TDBKG"><a href="javascript:DeleteRowSel('DINTABLE','ROWSEL')">Eliminar</a></td>    
      <td class="TDBKG"><div id="buttonFil" align="center" style="cursor:pointer"><a><b>Archivo</b></a></div></td>
      <td style="width: 20%"></td>
      <td style="width: 20%"></td>      
    </tr>
  </table>

  <h4>Pagos</h4>  
  <div  id="planPago"></div>
   
  <p align="center"> 
    <input id="EIBSBTN" type=button name="Submit" onclick="SendInfo()" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
  </p>

<!-- hiddenDivPln debe esta dentro del Form para que funcione el calendario -->
<div id="hiddenDivPln" class="hiddenDiv">
  <INPUT TYPE="HIDDEN" NAME="INTEREST" VALUE="Y">
  <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style: solid solid solid solid;" cellspacing=0; >
    <tr>
      <td>
        <table width="100%" cellspacing="0" cellpadding="0" style="font-weight: bold;" >
          <tr class ="trdark">
            <td nowrap="nowrap" width="40%">
              <div align="right">N&uacute;mero de Cuotas :</div>
            </td>
            <td nowrap="nowrap" width="60%">
              <div align="left"> 
                <input type="text" name="NUMBER" size="4" maxlength="3" id="AUTOMATICINT" value="0">
              </div>
            </td>
          </tr>
          <tr class ="trdark">
            <td nowrap="nowrap" width="40%">
              <div align="right">Frecuencia :</div>
            </td>
            <td nowrap="nowrap" width="60%">
              <input type="text" name="FREQUENCY" size="4" maxlength="3" onKeypress="enterInteger(event)" id="AUTOMATICINT" value="1">
              <select name="CODE">
                <option value="D">Día(s)</option>
                <option value="M" selected>Mes(es)</option>
                <option value="Y">Año(s)</option>
              </select>
            </td>
          </tr>   
          <tr class ="trdark">
            <td nowrap="nowrap" width="40%">
              <div align="right">Fecha Inicio de Pago :</div>
            </td>
            <td nowrap="nowrap" width="60%"> 
              <eibsinput:date name="currUser" fn_month="E01RDM" fn_day="E01RDD" fn_year="E01RDY" />
            </td>
          </tr>
          <tr class ="trdark">
            <td nowrap="nowrap" width="40%">
              <div align="right">Monto :</div>
            </td>
            <td nowrap="nowrap" width="60%"> 
              <input type="text" name="AMOUNT" size="14" maxlength="13" id="AUTOMATICINT" value="0" onkeypress="enterDecimal(event, 2)" onblur="this.value = formatCCY(this.value)">
              <select name="AMOUNTTYPE" id="AMOUNTTYPE">
                <option value="F" selected>Monto Fijo</option>
                <option value="P" >Porcentaje</option>
              </select>
            </td>
          </tr>
          <tr class ="trdark">
            <td nowrap="nowrap" width="40%">
			</td>     
            <td nowrap="nowrap" width="60%"> 
         		 <div id="form_distribution">
			        <input type="radio" id="form_distribution_0" name="form[distribution]" value="F" checked="checked"/>
			        <label for="form_distribution_0" style="font-weight: bold;">Cuota Fija</label>
			       		 <input type="radio" id="form_distribution_1" name="form[distribution]" value="Y" />
			      		 <label for="form_distribution_1" style="font-weight: bold;">Capital + Inter&eacute;s</label>
			       			 <input type="radio" id="form_distribution_2" name="form[distribution]" value="N" />
			        		 <label for="form_distribution_2" style="font-weight: bold;">Capital Solamente</label>
				       			 <input type="radio" id="form_distribution_3" name="form[distribution]" value="I" />
			        		 	 <label for="form_distribution_3" style="font-weight: bold;">Inter&eacute;s Solamente</label>		
					       			 <input type="radio" id="form_distribution_4" name="form[distribution]" value="S" onclick="calculateSaldo();"/>
				        		 	 <label for="form_distribution_4" style="font-weight: bold;">Saldo Previo</label>		
			        		 	 	<br>        		 
    			</div>   
    		</td>      
		</tr>          
          <!-- 
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap="nowrap" width="40%">
              <div align="right">Incluir Intereses :</div>
            </td>
            <td nowrap="nowrap" width="60%">
              <div align="left">
                <select name="INTEREST">
                  <option value="Y" selected>Sí</option>
                  <option value="N">No</option>
                </select>
              </div>
            </td>
          </tr>
          -->
        </table>
      </td>
    </tr>
    <tr class="trclear"> 
        <td align=center nowrap="nowrap"> 
          <input class="styled-button-Search" type=button name="Procesar" value="Procesar" onClick="AutomaticGen()">
        </td>
    </tr>
  </table>
</div>
  
</form>

<FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0155?SCREEN=507" ENCTYPE="multipart/form-data">
<div id="hiddenDivFil" class="hiddenDiv">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style: solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
    <tr>
      <td>
        <table width="100%" cellspacing="0" cellpadding="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td align=CENTER width="50%"> 
              <div align="right">Seleccione Archivo :</div>
            </td>
            <td align=CENTER width="50%"> 
              <div align="left"> 
 	            <input type="file" name="FILENAME" size="50" >
              </div>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
          </tr>
        </table>
      </td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td class="TDBKG"><a href="javascript:FileGen()">Procesar</a></td>
    </tr>
  </table>
</div>
</FORM>

<SCRIPT type="text/javascript">
  getElement("hiddenDivPln").onclick = cancelBub;
  getElement("hiddenDivFil").onclick = cancelBub;
  getElement("buttonPln").onclick = showHiddenDivPln;
  getElement("buttonFil").onclick = showHiddenDivFil;
</SCRIPT>

<% if ("S".equals(request.getAttribute("ACT")) || "N".equals(request.getAttribute("ERR"))) { %>
  <script type="text/javascript">
    window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0155?SCREEN=2&E01DEAACC=<%=header.getE01DEAACC().trim()%>';	   	   
    cerrarVentana();	  
  </script>
<% } %>  

<script type="text/javascript">
function loadPaymentTable(delteOption){
	getElement("SCREEN").value = 1000;
	var firstime = getElement("firstTime").value;
	var serialize = $('form').serialize();
	var scrollPos = $( "#dataDiv1" ).scrollTop();
	$("body").css("cursor", "progress");
	
	$.ajax({
		  type: 'POST',
		  url: "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0155",
          cache: false,
          data: serialize,
	  
          error: function(e) { 
  		    $( "#planPago" ).html( "Error en la Comunicacion [" + String(e) + "]");
  			$("body").css("cursor", "default");	
          },
          success : function(response){
				$( "#planPago" ).html(response);
				
				if(firstime != "true"){
					if($("#dataDiv1")[0].scrollHeight == scrollPos || delteOption){ //Keep same Scroll Position
						$( "#dataDiv1" ).scrollTop(scrollPos);				
					
					} else {//Animate to bottom of Table
						$( "#dataDiv1" ).animate({ scrollTop: $("#dataDiv1")[0].scrollHeight }, 200);
					
					}
				}	
				getElement("firstTime").value = "false";				
				$("body").css("cursor", "default");	
          }
	});	
}

function calculateSaldo(){
	
	var lastIndex = getElement("DINTABLE").rows.length;
	
	if(lastIndex > 0){
		getElement("AMOUNT").value = getElement("DLPSAL_"+lastIndex).value;
	} else {
		getElement("AMOUNT").value = getElement("E01DEAOAM").value;
	}
		
	getElement("AMOUNTTYPE").value = "F"; //Fixed Amount
	getElement("NUMBER").value = 1;  //1 quota
}


$( document ).ready(function() {
	$.ajaxSettings.cache = false;
	$.ajaxSettings.dataType= "html";
	loadPaymentTable(false);
	
	<%if(list.getNoResult()) {%> 
		getElement("E01RDM").value = getElement("E01DEAODM").value;
		getElement("E01RDD").value = getElement("E01DEAODD").value;
		getElement("E01RDY").value = getElement("E01DEAODY").value;
	<% } else {%>
		getElement("E01RDM").value = 0;
		getElement("E01RDD").value = 0;
		getElement("E01RDY").value = 0;
	<% } %>
});

</script>
</body>
</html>
