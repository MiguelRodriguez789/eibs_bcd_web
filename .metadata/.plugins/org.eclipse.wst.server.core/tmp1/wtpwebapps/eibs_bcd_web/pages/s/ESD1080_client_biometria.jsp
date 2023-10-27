<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" 	scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD108001Message"  scope="session" /> 

<title>Biometria</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" 	rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/Homini/jsHomini.js"> </SCRIPT>

<script language="JavaScript">
var msg = '';
sessionStorage.removeItem('tab-index');

 function getIdTypeHelp(){
   // Get the client type selected
   var cusType = getElementChecked("E01LGT").value;
   // Display the id screen help 
   if (cusType.toUpperCase() == "1") {
     GetCodeDescAuxCNOFC('E01TID','','34','1');
   } else {
   	GetCodeDescAuxCNOFC('E01TID','','34','2');
   }
 }
 
function showIdFields() {

	var cusType = getElementChecked("E01LGT").value; 
	
	if (cusType.toUpperCase() == "2" ){
		getElement('IDCOL').style.display='block';
		getElement('NATURAL').style.display='block';
		getElement('JURIDICO').style.display='none';
		document.forms[0].Submit.disabled = true;
		document.forms[0].Submit.style.display = 'none';
		document.forms[0].cmdMatricular.disabled = false;
		document.forms[0].cmdMatricular.style.display = 'block';
		document.forms[0].cmdProcesar.disabled = false;
		document.forms[0].cmdProcesar.style.display = 'block';
		document.forms[0].cmdMatSinHuellas.disabled = false;
		document.forms[0].cmdMatSinHuellas.style.display = 'block';
		document.forms[0].cmdRNEC.disabled = false;
		document.forms[0].cmdRNEC.style.display = 'block';
	} else {
		getElement('IDCOL').style.display='block';
		getElement('NATURAL').style.display='none';
		getElement('JURIDICO').style.display='block';
		document.forms[0].Submit.disabled = true;
		document.forms[0].Submit.style.display = 'none';
		document.forms[0].cmdMatricular.disabled = true;
		document.forms[0].cmdMatricular.style.display = 'none';
		document.forms[0].cmdProcesar.disabled = true;
		document.forms[0].cmdProcesar.style.display = 'none';
		document.forms[0].cmdMatSinHuellas.disabled = true;
		document.forms[0].cmdMatSinHuellas.style.display = 'none';
		document.forms[0].cmdRNEC.disabled = true;
		document.forms[0].cmdRNEC.style.display = 'none';
		alert('No se realiza Biometría para Personas Jurídicas !!!!')
	}
	
	<% if (currUser.getH01WK3().equals("N")) { // Non Automatic Number Generation %>  
		getElement('IDCUN').style.display='block';			
	<% } else {%>
		getElement('IDCUN').style.display='none';	
	<% } %>	
	
}

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	// Unify variables use to Persona & Juridica
	var cusType = getElementChecked("E01LGT").value; 
	if (cusType == "1") {    
 	 	// Juridica  
 	 	if (getElement("E01NM6").value == '') { 
			alert("Falta Razon Social.");
    		return;
    	}
	} else { 
		// Persona
		if (getElement("E01FNA").value  == '') { 
			alert("Falta Nombre.");
    		Return;
    	}
    	if (getElement("E01LN1").value == '') { 
			alert("Falta Apellido.");
    		return;
    	}	
	}	
	submitForm();
}

function DesHabilitarBotones(){
	document.forms[0].cmdMatricular.disabled = true;
	document.forms[0].cmdProcesar.disabled = true;
	document.forms[0].cmdMatSinHuellas.disabled = true;        
}

function HabilitarBotones(){
	document.forms[0].cmdMatricular.disabled = false;
	document.forms[0].cmdProcesar.disabled = false;
	document.forms[0].cmdMatSinHuellas.disabled = false;
}

function viewMessage(msg, dtl) {
	if (dtl) {
		var jSol = getElement("JSONSOL").value;
		var jRes = getElement("JSONRES").value;
		var text = jSol + "<br><br>" + jRes;
		page = "${pageContext.request.contextPath}/pages/s/MISC_message_viewer.jsp?MESSAGE=" + text;
		CenterWindow(page,600,200,2);
	} else {
		alert(msg);
	};
}

// Matricular Persona //
function MatricularPersona() {
	hominiMatricularPersona(getElement("E01TID").value,getElement("E01IDN").value,getElement("E01FNA").value,getElement("E01LN1").value);
}
// Procesar Persona - Successful //
function MatricularPersonaSuc(res){
	var msg = "Matricular exitoso [" + res + "]";
	document.forms[0].Submit.disabled = false;
	document.forms[0].Submit.style.display = 'block'; 
	getElement("E01RMK").value = getElement("E01RMK").value + res + '|';
	getElement("JSONRES").value = "ResMatPerSuc: " + res;
	viewMessage(msg, false);
}
// Matricular Persona - Error //
function MatricularPersonaErr(res) {
	msg = "Matricular con error [" + res + "]";
	getElement("E01RMK").value  = getElement("E01RMK").value + msg + '|';
	getElement("JSONRES").value = "ResMatPerError: " + res;
	viewMessage(msg, true);
}

// Procesar Persona //
function ProcesarPersona() {
	hominiProcesarPersona(getElement("E01TID").value,getElement("E01IDN").value,getElement("E01FNA").value,getElement("E01LN1").value);
}
// Procesar Persona - Successful //
function ProcesarPersonaSuc(res){
	var msg = "Procesar exitoso [" + res + "]";
	document.forms[0].Submit.disabled = false;
	document.forms[0].Submit.style.display = 'block'; 
	getElement("E01RMK").value = getElement("E01RMK").value + res + '|';
	getElement("JSONRES").value = "ResProPerSuc: " + res;
	viewMessage(msg, false);
}
// Procesar Persona - Error //
function ProcesarPersonaErr(res) {
	msg = "Procesar con error [" + res + "]";
	getElement("E01RMK").value  = getElement("E01RMK").value + msg + '|';
	getElement("JSONRES").value = "ResProPerError: " + res;
	viewMessage(msg, true);
}

// Verificar Persona //
function VerificarPersona() {
	hominiVerificarPersona(getElement("E01TID").value,getElement("E01IDN").value);
}
function VerificarPersonaSuc(res){
	var msg = "Verificar exitoso [" + res + "]";
	HabilitarBotones();
	getElement("E01RMK").value = getElement("E01RMK").value + res + '|';
	getElement("JSONRES").value = "ResVerificacionSuc: " + res + " - " + res;
	viewMessage(msg, false);
}
// Resultado error
function VerificarPersonaErr(res) {
	msg = "Verificar con error [" + res + "]";
	getElement("E01RMK").value  = getElement("E01RMK").value + res + '|';
	getElement("JSONRES").value = "ResVerificacionError: " + res;
	viewMessage(msg, true);
}

// VerifyRNEC //
function VerifyRNEC() { 
	var lgt = getElementChecked("E01LGT").value;
	if (lgt ==  '1') {
		alert('Solo valido para Personas Naturales !!!')
		return;
	}
	var idn = getElement("E01IDN").value;
	var tid = getElement("E01TID").value;
	if (idn ==  '' || tid == '') {
		alert('Debe Digitar Primero Tipo e Identificación !!!')
		return;
	}
	//page = "${pageContext.request.contextPath}/pages/s/ESD1080_verify_RNEC.jsp?IDN=" + idn + "&TID=" + tid;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD1094?SCREEN=3&E01IDN=" + idn + "&E01TID=" + tid;
	CenterWindow(page,1000,500,2);
}  

function MatricularSinHuellas() {
	if (!confirm("Desea continuar sin matricular huellas?")) {
		return;
	}
	document.forms[0].Submit.disabled = false;
	document.forms[0].Submit.style.display = 'block'; 
	DesHabilitarBotones();  
	msg = "Usuario selecciono Matriculada Sin Huellas"; 
	getElement("E01RMK").value = getElement("E01RMK").value + msg +  '|';
}  
    
</script>
<% 
	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
	int row = 0;
%>
</head>

<body bgcolor="#FFFFFF">

<h3 align="center">Actualizar / Verificar Biometría
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_biometria, ESD1080">
</h3>
<hr size="4">

<form name="forma" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="OPE" VALUE="30">
<INPUT TYPE=HIDDEN NAME="E01RMK" VALUE="">
<INPUT TYPE=HIDDEN NAME="JSONSOL" VALUE="">
<INPUT TYPE=HIDDEN NAME="JSONRES" VALUE="">

<table class="tableinfo">
 
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap align="right" valign="middle" width="15%">País : </td>
				<td colspan="3">
				<eibsinput:cnofc name="client" property="E01PID" value="<%=client.getE01PID()%>" required="false" flag="03" fn_code="E01PID" fn_description="D01PID" readonly="true"/> 
				<INPUT TYPE="text" NAME="D01PID" value="<%=client.getD01PID()%>" readonly> 
				</td>
			</tr>

			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap align="right" valign="middle" width="15%">Tipo de Cliente :</td>
				<td colspan="3">
				<p>
				<input type="radio" name="E01LGT" value="1" <%if (client.getE01LGT().equals("1")) out.print("checked"); %> onclick="showIdFields();" disabled>Jurídico 
				<input type="radio" name="E01LGT" value="2" <%if (client.getE01LGT().equals("2")) out.print("checked"); %> onclick="showIdFields();" disabled>Persona Natural
				</p>
				</td>
			</tr>
		</table>

		<div id="IDCOL" style="position:relative; display:none;">
		<table  cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap align="right" valign="middle" width="15%">Tipo e Identificación : </td>
				<td nowrap align="left" valign="middle" colspan="3">
					<input type="text" name="E01TID" value="<%=client.getE01TID()%>" maxlength="4" size="5" readonly>
					<eibsinput:text name="client" property="E01IDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="NATURAL" style="position:relative; display:none;">
		<table  cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Primer Nombre :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01FNA" size="45" maxlength="40" value="<%= client.getE01FNA().trim()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">Segundo Nombre :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01FN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="false" readonly="true"/>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Primer Apellido :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01LN1" size="45" maxlength="40" value="<%= client.getE01LN1().trim()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">Segundo Apellido :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01LN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="false" readonly="true"/>
            </td>
         </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap align="right" valign="middle" width="15%">Genero : </td>
				<td nowrap align="left" valign="middle" colspan="3">
					<p> 
                    <input type="radio" name="E01SEX" value="F" <%if (client.getE01SEX().equals("F")) out.print("checked"); %> disabled>Femenino 
                    <input type="radio" name="E01SEX" value="M" <%if (client.getE01SEX().equals("M")) out.print("checked"); %> disabled>Masculino
                    </p>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap align="right" valign="middle" width="15%">Fecha de Nacimiento :</td>
				<td nowrap align="left" valign="middle" colspan="3">
					<eibsinput:date name="client" fn_year="E01BDY" fn_month="E01BDM" fn_day="E01BDD" required="false" readonly="true"/>
				</td>
			</tr>
		</table>
		</div>

<div id="JURIDICO" style="position:relative; display:none;">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Razón Social :</td>
            <td nowrap width="85%" align="left"> 
               	<input type="text" name="E01NM6" size="120" maxlength="160" value="<%= client.getE01NM6().trim()%>" readonly>
            </td>
         </tr>
       </table>
</div>

	   	<div id="IDCUN" style="position:relative; display:none;">
	   	<table  cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap align="right" valign="middle" width="30%">Número de Cliente :</td>
				<td nowrap align="left" valign="middle" colspan="2">
					<input type="text" name="E01CUN" maxlength="9" size="11" value="<%=client.getE01CUN()%>" onKeypress="enterInteger(event)" readonly>
				</td>
			</tr>
		</table>	
		</div>
        
		</td>
	</tr> 

</table>

<% 	if (client.getH01FLGWK3().equals("3")) { %>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center">
      			<input type="checkbox" name="H01FLGWK2" value="1" >Enviar a Aprobacion de Control de Listas</td>
    	</tr>
  	</table>    
<% } %>

	<table width="100%">		
		<tr>
			<td width="16%" align="center"> 
				<input id="EIBSBTN" type=button name="cmdRNEC" value="RNEC" onClick="VerifyRNEC();" >
			</td>
			<td width="16%" align="center"> 
				<input id="EIBSBTN" type=button name="cmdMatricular" value="Matricular" onClick="MatricularPersona();" disabled>
			</td>
			<td width="16%" align="center"> 
				<input id="EIBSBTN" type=button name="cmdProcesar" value="Procesar" onClick="ProcesarPersona();" disabled>
			</td>
			<td width="16%" align="center"> 
				<input id="EIBSBTN" type=button name="cmdMatSinHuellas" value="Mat. sin Huellas" onClick="MatricularSinHuellas();" disabled>
			</td>
			<td width="16%" align="center"> 
				<input id="EIBSBTN" type=button name="cmdVerificar" value="Verificar" onClick="VerificarPersona();">
			</td>
			<td width="16%" align="center"> 
				<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(2);" disabled>
			</td>
		</tr> 	  
	</table>

</form>
</body>

<SCRIPT Language="Javascript">;
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");	
%>
      	showErrors();
<% 	
	} 
%>

	showIdFields();
		
</SCRIPT>

</html>
