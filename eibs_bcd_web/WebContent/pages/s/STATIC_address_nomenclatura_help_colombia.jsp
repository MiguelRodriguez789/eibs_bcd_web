<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">

<TITLE>Ayuda Nomenclatura Colombia</TITLE>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function send(code) {
	top.opener.document.forms[0][top.opener.fieldName].value = code;
	if(window.opener.jQuery){
		window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
	}
	else{
	}
 	top.opener.document.forms[0][top.opener.fieldName].focus();
 	top.close();
 }

 
function goSubmit() {
 	getElement('CNA2').value =
	       		getElement('CLSVIA').value + " " +
				getElement('NROV').value + " " +
				getElement('LETRAV').value + " " +
				getElement('BIS').value + " " +
				getElement('CUADRANTE').value + " " +
				getElement('NROG1').value + " " +
				getElement('LETRAG').value + " " +
				getElement('BISG').value + " " +
				getElement('NROG2').value + " " +
				getElement('CUADRANTEG').value;
	getElement('CNA2').value = getElement('CNA2').value.replace(/ +(?= )/g,'');
	getElement('CNA2').value = getElement('CNA2').value.replace(/^\s+|\s+$/g,'');
	send(getElement('CNA2').value);
}
 
function goClear() {
 	getElement('CLSVIA').value = " ";
	getElement('NROV').value = " ";
	getElement('LETRAV').value = " ";
	getElement('BIS').value = " ";
	getElement('CUADRANTE').value = " ";
	getElement('NROG1').value = " ";
	getElement('LETRAG').value = " ";
	getElement('BISG').value = " ";
	getElement('NROG2').value = " ";
	getElement('CUADRANTEG').value = " ";
	getElement('CNA2').value = " ";
}
 
 </script>
 
</HEAD>

<BODY>
	<form>
		<INPUT TYPE=HIDDEN NAME="CNA2" VALUE="">
		
		<h4>Ayuda - Nomenclatura para Direcciones en Colombia</h4>
		<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 			<TR> 
    			<TD NOWRAP width="100%" >
   			    	<div id="dataDiv1" class="scbarcolor">
    					<table id="dataTable"> 
    						<TR id="trclear">
		           				<td nowrap width="30%">
            						<fieldset><legend>Via Principal</legend>
              							<SELECT class="inputs" name="CLSVIA" size="1"></SELECT>
              						</fieldset>
            					</td>
            					<td nowrap width="35%">
            						<fieldset><legend>Nro o Nombre</legend>
              							<INPUT type="text" name="NROV" maxlength="25" size="26">
              						</fieldset>
            					</td>	
            					<td nowrap width="10%">
              						<fieldset><legend>Letra</legend>
										<input type="text" name="LETRAV" value="" size="2" /><br />
										<select name="LETRAVS" size="1" 
											onChange="getElement('LETRAV').value = getElement('LETRAVS').options[getElement('LETRAVS').selectedIndex].value;getElement('LETRAVS').value=''">
											<option value=" " selected="selected">
										</select>
              						</fieldset>
            					</td>
            					<td nowrap width="10%">
              						<fieldset><legend>Prefijo</legend>
              							<SELECT class="inputs" name="BIS" size="1"></SELECT>
              						</fieldset>
            					</td>
            					<td nowrap width="15%">
            						<fieldset><legend>Cuadrante</legend>
              							<SELECT class="inputs" name="CUADRANTE" size="1"></SELECT>
              						</fieldset>
            					</td>
           					</tr>
							<tr id="trdark">
            					<td nowrap width="30%">
            						<fieldset><legend>Via<BR>Generadora</legend>
              							<INPUT type="text" name="NROG1" maxlength="15" size="16">
              						</fieldset>
            					</td>
            					<td nowrap width="35%">
              						<fieldset><legend>Letra</legend>
										<input type="text" name="LETRAG" value="" size="2" /><br />
										<select name="LETRAGS" size="1" 
											onChange="getElement('LETRAG').value = getElement('LETRAGS').options[getElement('LETRAGS').selectedIndex].value;getElement('LETRAGS').value=''">
											<option value=" " selected="selected">
										</select>
              						</fieldset>
            					</td>
            					<td nowrap width="10%">
              						<fieldset><legend>Sufijo</legend>
              							<SELECT class="inputs" name="BISG" size="1"></SELECT>
              						</fieldset>
            					</td>
            					<td nowrap width="10%">
              						<fieldset><legend>Nro</legend>
              							<INPUT type="text" name="NROG2" maxlength="3" size="4" onkeypress="enterInteger(event)">
              						</fieldset>
            					</td>
            					<td nowrap width="15%">
              						<fieldset><legend>Cuadrante</legend>
              							<SELECT class="inputs" name="CUADRANTEG" size="1"></SELECT>
              						</fieldset>
            					</td>
           					</tr>
			 			</table>
   					</div>
   				</TD>
   		    </TR>	
		 </TABLE>
		
		<table width="100%">		
  			<tr>
  				<td width="33%" align="center">
  					<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goSubmit();">
     	 		</td>
  				<td width="33%" align="center"> 
     				<input id="EIBSBTN" type=button name="Clear" value="Limpiar" onClick="goClear();"> 
  				</td>
  				<td width="34%" align="center">
     				<input id="EIBSBTN" type=button name="Close" value="Cerrar" onClick="window.close();return false;">
  				</td>
  			</tr>	
  		</table>	
		
	</form>

<SCRIPT type="text/javascript">

  // Clases de vias
  tobox = document.forms[0].CLSVIA;
  tobox.options.length = 0;
  tobox.options[tobox.options.length] = new Option(' ',' ',true,'selected');
  tobox.options[tobox.options.length] = new Option('Autopista','AU');
  tobox.options[tobox.options.length] = new Option('Avenida','AV');
  tobox.options[tobox.options.length] = new Option('Avenida Calle','AC');
  tobox.options[tobox.options.length] = new Option('Avenida Carrera','AK');
  tobox.options[tobox.options.length] = new Option('Bulevar','BL');
  tobox.options[tobox.options.length] = new Option('Calle','CL');
  tobox.options[tobox.options.length] = new Option('Carrera','KR');
  tobox.options[tobox.options.length] = new Option('Carretera','CT');
  tobox.options[tobox.options.length] = new Option('Circular','CQ');
  tobox.options[tobox.options.length] = new Option('Circunvalar','CV');
  tobox.options[tobox.options.length] = new Option('Cuentas Corridas','CC');
  tobox.options[tobox.options.length] = new Option('Diagonal','DG');
  tobox.options[tobox.options.length] = new Option('Pasaje','PJ');
  tobox.options[tobox.options.length] = new Option('Paseo','PS');
  tobox.options[tobox.options.length] = new Option('Peatonal','PT');
  tobox.options[tobox.options.length] = new Option('Transversal','TV');
  tobox.options[tobox.options.length] = new Option('Troncal','TC');
  tobox.options[tobox.options.length] = new Option('Variante','VT');
  tobox.options[tobox.options.length] = new Option('Via','VI'); 
  
  tobox = document.forms[0].LETRAVS;
  tobox.options.length = 1;
  tobox.options[tobox.options.length] = new Option('A','A');
  tobox.options[tobox.options.length] = new Option('B','B');
  tobox.options[tobox.options.length] = new Option('C','C');
  tobox.options[tobox.options.length] = new Option('D','D');
  tobox.options[tobox.options.length] = new Option('E','E');
  tobox.options[tobox.options.length] = new Option('F','F');
  tobox.options[tobox.options.length] = new Option('G','G');
  tobox.options[tobox.options.length] = new Option('H','H');
  tobox.options[tobox.options.length] = new Option('I','I');
  tobox.options[tobox.options.length] = new Option('J','J');
  tobox.options[tobox.options.length] = new Option('K','K');
  tobox.options[tobox.options.length] = new Option('L','L');
  tobox.options[tobox.options.length] = new Option('M','M');
  tobox.options[tobox.options.length] = new Option('N','N');
  tobox.options[tobox.options.length] = new Option('O','O');
  tobox.options[tobox.options.length] = new Option('P','P');
  tobox.options[tobox.options.length] = new Option('Q','Q');
  tobox.options[tobox.options.length] = new Option('R','R');
  tobox.options[tobox.options.length] = new Option('S','S');
  tobox.options[tobox.options.length] = new Option('T','T');
  tobox.options[tobox.options.length] = new Option('V','V');
  tobox.options[tobox.options.length] = new Option('W','W');
  tobox.options[tobox.options.length] = new Option('X','X');
  tobox.options[tobox.options.length] = new Option('Y','Y');
  tobox.options[tobox.options.length] = new Option('Z','Z');
  //
  for (m = 0; m < tobox.options.length; m++) {
  	document.forms[0].LETRAGS.options[m] = new Option(tobox.options[m].text,tobox.options[m].value);
  }
  //
  tobox = document.forms[0].BIS;
  tobox.options.length = 0;
  tobox.options[tobox.options.length] = new Option(' ',' ',true,'selected');
  tobox.options[tobox.options.length] = new Option('BIS','BIS');
  //
  for (m = 0; m < tobox.options.length; m++) {
  	document.forms[0].BISG.options[m] = new Option(tobox.options[m].text,tobox.options[m].value);
  }
  //
  tobox = document.forms[0].CUADRANTE;
  tobox.options.length = 0;
  tobox.options[tobox.options.length] = new Option(' ',' ',true,'selected');
  tobox.options[tobox.options.length] = new Option('Este','ESTE');
  tobox.options[tobox.options.length] = new Option('Norte','NORTE');
  tobox.options[tobox.options.length] = new Option('Oeste','OESTE');
  tobox.options[tobox.options.length] = new Option('Sur','SUR');
  //
  for (m = 0; m < tobox.options.length; m++) {
  	document.forms[0].CUADRANTEG.options[m] = new Option(tobox.options[m].text,tobox.options[m].value);
  }
  //
  
</SCRIPT>

</BODY>
</HTML>