<%@page import="java.math.BigDecimal"%>

<html>
<head>
<title>Esquema de Pagos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "pmnt" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>

<body>
<%
	int row = pmnt.getNoResult() ? 0 : pmnt.getLastRow() + 1;  
%> 

<SCRIPT type="text/javascript">

function checkRowValue() {
	if (trim(document.forms[0].TEMP_ROW.value).trim() != "") {
   		var r = parseInt(document.forms[0].TEMP_ROW.value);
   		if (r > 99 ) {
    		alert("Valor fuera de limites, el numero maximo es 99.");
   		} else if (r == 0) {
   			document.forms[0].TEMP_ROW.value = 1;
   		}
  	} else document.forms[0].TEMP_ROW.value = 1;
}

function MoveElements(posIni, posEnd){   
  	try {
	    document.forms[0].elements("DLPPD1_" + posEnd).value = document.forms[0].elements("DLPPD1_" + posIni).value;
	    document.forms[0].elements("DLPPD2_" + posEnd).value = document.forms[0].elements("DLPPD2_" + posIni).value;    
	    document.forms[0].elements("DLPPD3_" + posEnd).value = document.forms[0].elements("DLPPD3_" + posIni).value;
	    document.forms[0].elements("DLPPRI_" + posEnd).value = document.forms[0].elements("DLPPRI_" + posIni).value;    
	    document.forms[0].elements("DLPINT_" + posEnd).value = document.forms[0].elements("DLPINT_" + posIni).value;    
	    document.forms[0].elements("DLPIIP_" + posEnd).selectedIndex = document.forms[0].elements("DLPIIP_" + posIni).selectedIndex;
  	} catch(e) {
  	}      
}
 
//Rename the fields de una specific table dependiendo del flag. If the field's sufix is different  a la row donde esta,
// then se renombra
function UpdateTable(tableName, chkboxName, noRow) {  
   	var maxRow;
   	var restRow;
	try {
        var myTable = document.getElementById(tableName);
     	maxRow = myTable.rows.length;
     	restRow = maxRow - noRow;
     	for (var i=restRow; i < maxRow; i++) {
     	  	myTable.deleteRow(restRow);
      	}     	
     	if (restRow > 1) {
     	   var myChkB = document.getElementsByName(chkboxName);     	   
     	   if (myChkB.length == null) {
     	   		myChkB.checked = false;
     	   } else {
     	   	  	for (var j=0; j < myChkB.length; j++) {     	      	 
     	      		myChkB[j].checked = false;
     	   	  	}
     	   }
     	}     	
    } catch(e) {
    }
}
  
function DeleteRows(tableName, chkboxName){  
	var maxrow;
   	var noRow = 0;
   	var firstTime = true;
   	var okdel = false;
    
    try {
        var myTable = document.getElementById(tableName);
     	maxrow = myTable.rows.length;
     	if (maxrow > 1) {
     	   var myChkB = document.getElementsByName(chkboxName); 
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
   	      		for (var i=0; i < myChkB.length; i++) {     	   			
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
   	         		 		 MoveElements(row, (row - noRow));     	         		 
   	         			} 
   	         		}	 
 	      		}
     	   		return(noRow);
     		}
     	} else return(noRow);
    } catch(e) {
       return(noRow);
    }
}
  
//Esta funciton se llama en el click del button de borrado
function DeleteRowSel(tableName, chkboxName){
    var noRow = DeleteRows(tableName, chkboxName);  
    if ( noRow > 0 ) {
    	UpdateTable(tableName, chkboxName, noRow);    
    	document.forms[0].ROW.value = document.getElementById(tableName).rows.length - 1;
    }
}
  
//adiciona una row a una tabla  
 function AddRow(tableName, nRow) {
   	var maxcell = 6;
   	var idxrow;
   	var sufix = "";
    try {
    	var myTable = document.getElementById(tableName);
      	if (myTable.rows.length < 360) {
        	myTable.insertRow();
     		idxrow = myTable.rows.length - 1;
     		sufix = "" + idxrow;
     	
     		for (var i=0; i<maxcell; i++) {
          		myTable.rows[idxrow].insertCell();
          		myTable.rows[idxrow].cells[i].align = "center";
       		}       	
       		
       		myTable.rows[idxrow].cells[0].innerHTML = "<input type='checkbox' name='ROWSEL' value='" + sufix + "'>";
      		myTable.rows[idxrow].cells[1].innerHTML = "<input type='text' name='DLPPNU_" + sufix + "' size='4' maxlength='3'  value='" + idxrow + "' readonly>";
        	myTable.rows[idxrow].cells[2].innerHTML = "<input type='text' name='DLPPD1_" + sufix + "' id='MANDATORY' size='3' maxlength='2'  value='' onKeypress='enterInteger(event)'>" +
          		" <input type='text' name='DLPPD2_" + sufix + "' id='MANDATORY' size='3' maxlength='2'  value='' onKeypress='enterInteger(event)'>" +
          		" <input type='text' name='DLPPD3_" + sufix + "' id='MANDATORY' size='5' maxlength='4'  value='' onKeypress='enterInteger(event)'>";
        	myTable.rows[idxrow].cells[3].innerHTML = "<input type='text' name='DLPPRI_" + sufix + "' id='MANDATORY' size='17' maxlength='15' value='' style ='text-align: right' onKeypress='enterDecimal(event)'>";
        	myTable.rows[idxrow].cells[4].innerHTML = "<input type='text' name='DLPINT_" + sufix + "' size='17' maxlength='15' value='' id='txtright' onKeypress='enterDecimal(event)'>";
        	myTable.rows[idxrow].cells[5].innerHTML = "<select name='DLPIIP_" + sufix + "'>" +
            	"<option value='Y' selected>Sí</option>" +
            	"<option value='N' >No</option>" +
            	"</select>";
     	
     		myTable.refresh();
        	document.forms[0]["DLPPD1_" + sufix ].focus();
        	if (nRow > 1) {
        		AddRow(tableName, nRow - 1); 
        	} else {
        		document.forms[0].ROW.value = "" + idxrow;
        	}
      	}      
    } catch(e) {
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
	var coll = document.forms[0].elements["AUTOMATICINT"];
  	var elem = null;
  	var v;
  	if (coll != null) {
    	var collength = coll.length;
    	if (collength > 1) {
      		for (var i=0; i<collength; i++) {
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
		       		v = parseInt(delLeftChar(coll.value, '0'));
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
  	if (coll != null) {
    	var collength = coll.length;
    	if (collength > 1) {
      		for (var i=0; i< collength; i++) {
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
    	if (elem == null) 
    		return true;
    	else {
      		alert("Los Fechas y Montos de los pagos deben poseer un valor valido.");
      		elem.focus();
      		return false;
    	}
  	} else return true;
}

function delRowsFrom(tableName, noRow){
   var myTable = document.getElementById(tableName);
   var maxRows = myTable.rows.length;   
   for (var j=noRow; j < maxRows;j++) {
       myTable.deleteRow(noRow);
   }
   myTable.refresh(); 
}

function daysInMonth(year, month) {
    return new Date(year, month, 0).getDate();
}

function AutomaticGen() {
    if (checkAutomaticFields()) {
    	var maxRows = document.getElementById("DINTABLE").rows.length;
    	if (maxRows > 1) {
        	var okdel = confirm("Todos los pagos existentes se eliminaran para ser generados automaticamente");
        	if ( !okdel ) return false;
        	delRowsFrom("DINTABLE", 1);
      	}
	      
      	var number = parseInt(document.forms[0]["NUMBER"].value);
      	var amount = document.forms[0]["AMOUNT"].value; 
      	     
	  	var month = parseInt(document.forms[0]["DATE1"].value);
	  	var day = parseInt(document.forms[0]["DATE2"].value);
      	var year = parseInt(document.forms[0]["DATE3"].value);
      	var feq = parseInt(document.forms[0]["FREQUENCY"].value);
      	var code = document.forms[0]["CODE"].options[document.forms[0]["CODE"].selectedIndex].value;

      	var myDate = new Date(year, month - 1, day);
      	var ryear = <%= currUser.getBigDecimalE01RDY().intValue() %>;
      	var rmonth = <%= currUser.getBigDecimalE01RDM().subtract(new BigDecimal("1")).intValue() %>;
      	var rday = <%= currUser.getBigDecimalE01RDD().intValue() %>;
      	var runDate = new Date(ryear, rmonth, rday);
      	
      	if (runDate > myDate) {
      		alert("La Primera Fecha de Pago no puede ser anterior a la Fecha del Sistema.");
      	} else {
      		if (code == "D") {
      			if (feq % 30 == 0) {
      				code = "M";
      				feq = feq / 30;
      			}
      		}
	        AddRow("DINTABLE", number);
	      	for (var i=1; i < number + 1; i++) {
	      		if (i > 1) {
		  	  		if (code == "D") {
	  	      			myDate.setDate(myDate.getDate() + feq);
		  	  		} else if (code == "M") {
	      				//alert(myDate.toDateString());
		  	  			month =  myDate.getMonth() + feq;
		  	  			month++;
		  	  			//alert(day + " - " + month + " - " + myDate.getFullYear());
		  	  			var lastday = daysInMonth(myDate.getFullYear(), month);
		  	  			if (myDate.getDate() < lastday) {
		  	  				//alert("Next Month is " + month + " because " + myDate.getDate() + " is less than " + lastday);
			     			myDate = new Date(myDate.getFullYear(), month - 1, day);
		  	  			} else {
		  	  				//alert("New Date is " + month + " because " + myDate.getDate() + " is bigger than " + lastday);
			     			myDate = new Date(myDate.getFullYear(), month - 1, lastday);
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
				if (document.forms[0]["DFORMAT"].value == "MDY") {
					document.forms[0]["DLPPD1_" + i].value = (myDate.getMonth() + 1) + "";
					document.forms[0]["DLPPD2_" + i].value = myDate.getDate() + "";
					document.forms[0]["DLPPD3_" + i].value = myDate.getFullYear() + "";;	
				} else if (document.forms[0]["DFORMAT"].value == "YMD") {
					document.forms[0]["DLPPD1_" + i].value = myDate.getFullYear() + "";	
					document.forms[0]["DLPPD2_" + i].value = (myDate.getMonth() + 1) + "";
					document.forms[0]["DLPPD3_" + i].value = myDate.getDate() + "";	
				} else {
					document.forms[0]["DLPPD1_" + i].value = myDate.getDate() + "";
					document.forms[0]["DLPPD2_" + i].value = (myDate.getMonth() + 1) + "";	
					document.forms[0]["DLPPD3_" + i].value = myDate.getFullYear() + "";
				}
				document.forms[0]["DLPPRI_" + i].value = document.forms[0]["AMOUNT"].value;
				document.forms[0]["DLPIIP_" + i].selectedIndex = document.forms[0]["INTEREST"].selectedIndex;
	    	}
      	}
    }
} 
  
</SCRIPT>

<h3 align="center"> Plan de Pagos</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150" onsubmit="return(checkMandatoryFields())">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="508">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row %>">
  <INPUT TYPE=HIDDEN NAME="DFORMAT" VALUE="<%= currUser.getE01DTF() %>">
  
  <h4>Generaci&oacute;n Autom&aacute;tica</h4>
  
  <%int row1 = 0; %>
  <table class="tableinfo">
   <tr> 
   <td>      
   <table width="100%" cellspacing="0" cellpadding="0">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
      <td nowrap width="14%"> 
        <div align="right">N&uacute;mero de Pagos : </div>
      </td>
      <td nowrap width="42%"> 
        <div align="left"> 
          <input type="text" name="NUMBER" size="4" maxlength="3" id="AUTOMATICINT">
        </div>
      </td>
      <td nowrap width="10%"> 
        <div align="right">Monto : </div>
      </td>
      <td nowrap width="9%"> 
        <input type="text" name="AMOUNT" size="14" maxlength="13" id="AUTOMATICINT" onkeypress="enterDecimal(event)">
      </td>
    </tr>
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
      <td nowrap width="14%"> 
        <div align="right">Primera Fecha de Pago:</div>
      </td>
      <td nowrap width="42%"> <%
          if ( currUser.getE01DTF().equals("YMD") ) {
        %> 
              <input type="text" name="DATE3" size="5" maxlength="4" onKeypress="enterInteger(event)" id="AUTOMATICINT" value="<%= currUser.getE01RDY() %>">
              <input type="text" name="DATE1" size="3" maxlength="2" onKeypress="enterInteger(event)" id="AUTOMATICINT" value="<%= currUser.getE01RDM() %>">
              <input type="text" name="DATE2" size="3" maxlength="2" onKeypress="enterInteger(event)" id="AUTOMATICINT" value="<%= currUser.getE01RDD() %>">
              <font face="Arial" size="2">(aa/mm/dd)</font> 
              <%
          }
          else if ( currUser.getE01DTF().equals("MDY") ) {
        %>
              <input type="text" name="DATE1" size="3" maxlength="2" onKeypress="enterInteger(event)" id="AUTOMATICINT" value="<%= currUser.getE01RDM() %>">
              <input type="text" name="DATE2" size="3" maxlength="2" onKeypress="enterInteger(event)" id="AUTOMATICINT" value="<%= currUser.getE01RDD() %>">
              <input type="text" name="DATE3" size="5" maxlength="4" onKeypress="enterInteger(event)" id="AUTOMATICINT" value="<%= currUser.getE01RDY() %>">
              <font face="Arial" size="2">(mm/dd/aa)</font> 
              <%
          }
          else {
        %>
              <input type="text" name="DATE2" size="3" maxlength="2" onKeypress="enterInteger(event)" id="AUTOMATICINT" value="<%= currUser.getE01RDD() %>">
              <input type="text" name="DATE1" size="3" maxlength="2" onKeypress="enterInteger(event)" id="AUTOMATICINT" value="<%= currUser.getE01RDM() %>">
              <input type="text" name="DATE3" size="5" maxlength="4" onKeypress="enterInteger(event)" id="AUTOMATICINT" value="<%= currUser.getE01RDY() %>">
              <font face="Arial" size="2">(dd/mm/aa)</font> 
              <%
          }
        %>
            </td>
      <td nowrap width="10%"> 
        <div align="right">Frecuencia : </div>
      </td>
      <td nowrap width="9%"> 
        <input type="text" name="FREQUENCY" size="4" maxlength="3" onKeypress="enterInteger(event)" id="AUTOMATICINT">
        <select name="CODE">
          <option value="D" selected>Día(s)</option>
          <option value="M">Mes(es)</option>
          <option value="Y">Año(s)</option>
        </select>
      </td>
    </tr>
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
     <td nowrap > 
        <div align="right">Incluir Intereses :</div>
      </td>
      <td nowrap colspan="3"> 
        <div align="left">
          <select name="INTEREST">
            <option value="Y" selected>Sí</option>
            <option value="N">No</option>
          </select>
        </div>
      </td>
    </tr>
  </table>
  </td>
  </tr>
  </table>
  
  <h4>Pagos</h4>  
  <table class="tbenter" >
    <tr> 
      <td class="TDBKG"><a href="javascript:AutomaticGen()">Generar</a></td>
      <td class="TDBKG"><a href="javascript:DeleteRowSel('DINTABLE','ROWSEL')">Eliminar</a></td>    
      <td > 
        <div align="right">Cantidad de Registros a A&ntilde;adir : 
          <input type="text" name="TEMP_ROW" size="4" maxlength="3" value="1" onBlur="checkRowValue()" onKeypress="enterInteger(event)">
        </div>
      </td>
      <td class="TDBKG" width="2%"><a href="javascript:AddRow('DINTABLE', document.forms[0].TEMP_ROW.value)">A&ntilde;adir</a></td>
    </tr>
  </table>
  <table class="tableinfo" id=DINTABLE>
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
      <td align=center width="1%">
      </td>
      <td nowrap> 
        <div align="center">N&uacute;mero</div>
      </td>
      <td nowrap> 
        <div align="center">Fecha</div>
      </td>
      <td nowrap> 
        <div align="center">Principal</div>
      </td>
      <td nowrap>
        <div align="center">Inter&eacute;s</div>
      </td>
      <td nowrap> 
        <div align="center">Intereses Incluidos</div>
      </td>
    </tr>
<%
 	pmnt.initRow();
 	int actrow = 0;
       while (pmnt.getNextRow()) {
       	actrow++;
%> 
	    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">    
	      <td align=center>
	    	<input type="checkbox" name="ROWSEL" value="<%= actrow %>">
	      </td>
	      <td nowrap> 
	        <div align="center"> 
	          <input type="text" name="DLPPNU_<%= actrow %>" size="4" maxlength="3"  value="<%= pmnt.getRecord(0) %>" readonly>
	        </div>
	      </td>
	      <td nowrap> 
	        <div align="center"> 
	          <input type="text" name="DLPPD1_<%= actrow %>" id="MANDATORY" size="3" maxlength="2"  value="<%= pmnt.getRecord(1) %>" onKeypress="enterInteger(event)">
	          <input type="text" name="DLPPD2_<%= actrow %>" id="MANDATORY" size="3" maxlength="2"  value="<%= pmnt.getRecord(2) %>" onKeypress="enterInteger(event)">
	          <input type="text" name="DLPPD3_<%= actrow %>" id="MANDATORY" size="5" maxlength="4"  value="<%= pmnt.getRecord(3) %>" onKeypress="enterInteger(event)">
	        </div>
	      </td>
	      <td nowrap> 
	        <div align="center"> 
	          <input type="text" name="DLPPRI_<%= actrow %>" id="MANDATORY" style ="text-align: right" size="17" maxlength="15" value="<%= pmnt.getRecord(4) %>" onKeypress="enterDecimal(event)">
	        </div>
	      </td>
	      <td nowrap>
	        <div align="center">
	          <input type="text" name="DLPINT_<%= actrow %>" size="17" maxlength="15" value="<%= pmnt.getRecord(5) %>" class="txtright" onKeypress="enterDecimal(event)">
	        </div>
	      </td>
	      <td nowrap> 
	        <div align="center"> 
	          <select name="DLPIIP_<%= actrow %>">
	            <option value="Y" <% if (pmnt.getRecord(6).equals("Y")) out.print("selected"); %>>Sí</option>
	            <option value="N" <% if (pmnt.getRecord(6).equals("N")) out.print("selected"); %>>No</option>
	          </select>
	        </div>
	      </td>
	    </tr>
<%
	}
%> 
    
  </table>
   
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  
  </form>
</body>
</html>
