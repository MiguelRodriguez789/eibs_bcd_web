<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">

<TITLE>Ayuda Complemento Colombia</TITLE>

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
 	getElement('CNA').value = getElement('COMPLEMENTO1').value + " " +
							getElement('CMP1').value + " " +
							getElement('COMPLEMENTO2').value + " " +
							getElement('CMP2').value + " ";
	getElement('CNA').value = getElement('CNA').value.replace(/ +(?= )/g,'');
	getElement('CNA').value = getElement('CNA').value.replace(/^\s+|\s+$/g,'');
	send(getElement('CNA').value);
}
 
function goClear() {
 	getElement('COMPLEMENTO1').value = " ";
	getElement('CMP1').value = " ";
	getElement('COMPLEMENTO2').value = " ";
	getElement('CMP2').value = " ";
	getElement('CNA').value = " ";
}

 </script>
 
</HEAD>

<BODY>
	<form>
		<INPUT TYPE=HIDDEN NAME="CNA" VALUE="">
		
		<h4>Ayuda - Complemento para Direcciones en Colombia</h4>
		<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 			<TR> 
    			<TD NOWRAP width="100%" >
   			    	<div id="dataDiv1" class="scbarcolor">
    					<table id="dataTable"> 
    						<TR id="trclear">
		           				<td nowrap width="50%">
            						<fieldset><legend>A : </legend>
              							<SELECT class="inputs" name="COMPLEMENTO1" size="1"></SELECT>
              							<INPUT type="text" name="CMP1" maxlength="20" size="21">
              						</fieldset>
            					</td>
            					<td nowrap width="50%">
            						<fieldset><legend>B : </legend>
              							<SELECT class="inputs" name="COMPLEMENTO2" size="1"></SELECT>
              							<INPUT type="text" name="CMP2" maxlength="20" size="21">
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
  
  tobox = document.forms[0].COMPLEMENTO1;
  tobox.options.length = 0;
  tobox.options[tobox.options.length] = new Option(' ',' ',true,'selected');
  tobox.options[tobox.options.length] = new Option('Administracion','AD');
  tobox.options[tobox.options.length] = new Option('Agrupacion','AG');
  tobox.options[tobox.options.length] = new Option('Altillo','AL');
  tobox.options[tobox.options.length] = new Option('Apartamento','AP');
  tobox.options[tobox.options.length] = new Option('Barrio','BR');
  tobox.options[tobox.options.length] = new Option('Bloque','BQ');
  tobox.options[tobox.options.length] = new Option('Bodega','BG');
  tobox.options[tobox.options.length] = new Option('Casa','CS');
  tobox.options[tobox.options.length] = new Option('Cedula','CU');
  tobox.options[tobox.options.length] = new Option('Centro Comercial','CE');
  tobox.options[tobox.options.length] = new Option('Ciudadela','CD');
  tobox.options[tobox.options.length] = new Option('Conjunto Residencial','CO');
  tobox.options[tobox.options.length] = new Option('Consultorio','CN');
  tobox.options[tobox.options.length] = new Option('Deposito','DP');
  tobox.options[tobox.options.length] = new Option('Deposito Sotano','DS');
  tobox.options[tobox.options.length] = new Option('Edificio','ED');
  tobox.options[tobox.options.length] = new Option('Entrada','EN');
  tobox.options[tobox.options.length] = new Option('Esquina','EQ');
  tobox.options[tobox.options.length] = new Option('Estacion','ES');
  tobox.options[tobox.options.length] = new Option('Etapa','ET');
  tobox.options[tobox.options.length] = new Option('Exterior','EX');
  tobox.options[tobox.options.length] = new Option('Finca','FI');
  tobox.options[tobox.options.length] = new Option('Garaje','GA');
  tobox.options[tobox.options.length] = new Option('Garaje Sotano','GS');
  tobox.options[tobox.options.length] = new Option('Interior','IN');
  tobox.options[tobox.options.length] = new Option('Kilometro','KM');
  tobox.options[tobox.options.length] = new Option('Local','LC');
  tobox.options[tobox.options.length] = new Option('Local Mezzanine','LM');
  tobox.options[tobox.options.length] = new Option('Lote','LT');
  tobox.options[tobox.options.length] = new Option('Manzana','MZ');
  tobox.options[tobox.options.length] = new Option('Mezzanine','MN');
  tobox.options[tobox.options.length] = new Option('Modulo','MD');
  tobox.options[tobox.options.length] = new Option('Oficina','OF');
  tobox.options[tobox.options.length] = new Option('Parque','PQ');
  tobox.options[tobox.options.length] = new Option('Parqueadero','PA');
  tobox.options[tobox.options.length] = new Option('Pent-House','PN');
  tobox.options[tobox.options.length] = new Option('Piso','PI');
  tobox.options[tobox.options.length] = new Option('Planta','PL');
  tobox.options[tobox.options.length] = new Option('Porteria','PR');
  tobox.options[tobox.options.length] = new Option('Predio','PD');
  tobox.options[tobox.options.length] = new Option('Puesto','PU');
  tobox.options[tobox.options.length] = new Option('Round Point','RP');
  tobox.options[tobox.options.length] = new Option('Sector','SC');
  tobox.options[tobox.options.length] = new Option('Semisotano','SS');
  tobox.options[tobox.options.length] = new Option('Sotano','SO');
  tobox.options[tobox.options.length] = new Option('Suite','ST');
  tobox.options[tobox.options.length] = new Option('Supermanzana','SM');
  tobox.options[tobox.options.length] = new Option('Terraza','TZ');
  tobox.options[tobox.options.length] = new Option('Torre','TO');
  tobox.options[tobox.options.length] = new Option('Unidad','UN');
  tobox.options[tobox.options.length] = new Option('Unidad Residencial','UL');
  tobox.options[tobox.options.length] = new Option('Urbanizacion','UR');
  tobox.options[tobox.options.length] = new Option('Zona','ZN');
  //
  for (m = 0; m < tobox.options.length; m++) {
  	document.forms[0].COMPLEMENTO2.options[m] = new Option(tobox.options[m].text,tobox.options[m].value);
  }
    
</SCRIPT>

</BODY>
</HTML>
