<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>

<jsp:useBean id="msgRec" class="datapro.eibs.beans.ESD109401Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<title>Verificacion RNEC</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/Homini/jsHomini.js"> </SCRIPT>
<script src="<%=request.getContextPath()%>/jquery/jquery-3.1.1.min.js"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	var ref = getElement("E01REF").value;
	var est = getElement("EST").value;
	var sts = getElement("STS").value;
	if (ref != "" || est != "") {
		getElement("E01EXC").value = "";
		getElement("E01RMK").value = est;
		getElement("E01STA").value = "E";
		if (sts == "V") {
			getElement("E01STA").value = "P";
		}
	}
	var exc = getElement("E01EXC").value;
	if (exc != "") {
		sts = "X"
		getElement("E01STA").value = sts;
	}
	if (isValidObject(opener.document.getElementById("E01CABSTS"))) {
		opener.document.getElementById("E01CABSTS").value = sts;
	}	
	submitForm();
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

function viewMessage(msg, dtl) {
	if (dtl) {
		var jRes = getElement("JSONRES").value;
		var text = jRes;
		page = "${pageContext.request.contextPath}/pages/s/MISC_message_viewer.jsp?MESSAGE=" + text;
		CenterWindow(page,600,200,2);
	} else {
		alert(msg);
	};
}

function randomNut(length) {
   var result           = '';
   var characters       = 'abcdefghijklmnopqrstuvwxyz0123456789';
   var charactersLength = characters.length;
   for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
   }
   return result;
}

function getDesc(dsc) {
	var dscStr = "";
	var dscArr = dsc.split(':');
	if (dscArr.length > 0) {
		dscStr = dscArr[1]; 
	}
	if (dscStr == "" || dscStr == null){
		dscStr = dsc;
	}	
	return dscStr.replace(',', '').trim();
}

// RNEC //
function RNEC() {
 	var idn = getElement("E01IDN").value;
 	var tid = getElement("E01TID").value;
 	var exc = getElement("E01EXC").value;
 	if (idn ==  '' || tid == '') {
 		alert('Debe Digitar Primero Tipo e Identificación !!!')
 		return;
 	}
 	if (exc != '') {
 		alert('Excepcion debe estar en blanco!!!')
 		return;
 	}
// 	if (confirm("Simular Validacion?")) {
// 		RNECSuc("0,|Consulta Exitosa Realizada con Nut: " + randomNut(12) + "|Nombre: UNO DOS TRES CUATRO,|Fecha Expedicion: 03.07.2013,|Lugar de Expedicion: BOGOTA D.C.,|Cotejo Autorizado Estado del Documento VIGENTE,|Puede Continuar con su Proceso");
// 		RNECSuc("0,|Consulta Exitosa Realizada con Nut: " + randomNut(12) + "|Nombre: UNO DOS TRES CUATRO,|Fecha Expedicion: 03.07.2013,|Lugar de Expedicion: BOGOTA D.C.,|Cotejo No autorizado Estado del documento REVOCATORIA CANCELACION POR EXPEDICION A UN MENOR DE SIETE AÑOS,|Puede Continuar con su Proceso");
// 		RNECSuc("0,Consulta No Exitosa Realizada con Nut: " + randomNut(12) + ", !!!Aplicar Protocolo Comercial... !!!");
// 		RNECSuc("0,-1|Persona no encontrada en Base de datos de la Registraduria");
// 		return;
// 	}
	hominiRNEC(tid,idn,'<%=currUser.getH01TIM()%>','<%=currUser.getH01USR()%>','<%=currUser.getE01UBR()%>');
}
// RNEC - Successful //
function RNECSuc(res){
	var msg = "RNEC exitoso [" + res + "]";
	var auxStr = "";
	var resStr = "";
	var nut = ""; var nom = ""; var fex = ""; var lex = ""; var est = ""; var com = "";
	var sts = "N"; // N=NoExitoso, V=Exitoso, E=Error
	if (res.length < 3) {
		res = "0,-2|Error no conocido";
	}
	if (res.toLowerCase().indexOf('nut:') !== -1) {
		if (res.substr(0,3) == "0,|") {
			sts = "V";
		}
	} else {
		sts = "E";
	}
	// N=No Exitoso
	if (sts == "N") {
		var resArr = res.split(',');
		for (var i=0; i < resArr.length; i++) {
			if (i > 0) {
				if (i == 1 ) nut = resArr[i];  
				if (i == 2 ) est = resArr[i];
				if (i == 3 ) com = resArr[i];
				auxStr = resArr[i];
				while (auxStr.length < 80){
					auxStr += " ";
				}
				resStr += auxStr;
			}
		}
	}
	// V=Exitoso
	if (sts == "V") {
		var resArr = res.split('|');
		for (var i=0; i < resArr.length; i++) {
			if (i > 0) {
				if (i == 1 ) nut = resArr[i];  
				if (i == 2 ) nom = resArr[i];
				if (i == 3 ) fex = resArr[i];
				if (i == 4 ) lex = resArr[i];
				if (i == 5 ) est = resArr[i];
				if (i == 6 ) com = resArr[i];
				auxStr = resArr[i];
				while (auxStr.length < 80){
					auxStr += " ";
				}
				resStr += auxStr;
			}
		}
	}
	// E=Error
	if (sts == "E") {
		var resArr = res.split(',');
		for (var i=0; i < resArr.length; i++) {
			if (i > 0) {
				if (i == 1 ) est = resArr[i];
				auxStr = resArr[i];
				while (auxStr.length < 80){
					auxStr += " ";
				}
				resStr += auxStr;
			}
		}
	}
	if (resStr == "" || resStr == null){
		resStr = res;
	}
	if (isValidObject(document.getElementById("divresultado"))) {
		document.getElementById("divresultado").innerHTML = res;
	}
	document.getElementById("E01REF").value = getDesc(nut);
	document.getElementById("NOM").value = getDesc(nom);
	document.getElementById("FEX").value = getDesc(fex);
	document.getElementById("LEX").value = getDesc(lex);
	document.getElementById("EST").value = getDesc(est);
	document.getElementById("COM").value = getDesc(com);
	document.getElementById("STS").value = sts;
}
// RNEC - Error //
function RNECErr(res) {
	msg = "RNEC con error [" + res + "]";
	if (isValidObject(document.getElementById("divresultado"))) {
		document.getElementById("divresultado").innerHTML = "ResRNECError: " + res;
	}
	getElement("JSONRES").value = "RNECErr: " + res;
	viewMessage(msg, true);
}
</script>

<% 
	int row = 0;
%>

</head>

<body bgcolor="#FFFFFF">

<h3 align="center">Consulta RNEC
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="verify_RNEC, ESD1094">
</h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1094" >
	<input type="hidden" name="SCREEN" value="5">
	<input type="hidden" name="E01TYP" value="R">
	<input type="hidden" name="E01STA" value="">
	<input type="hidden" name="E01SEQ" value="<%=msgRec.getE01SEQ().trim()%>">
	<input type="hidden" name="JSONRES" value="">
	<input type="hidden" id="STS" name="STS" VALUE="">

<table class="tableinfo">
	<tr>
		<td nowrap>
	<table  cellspacing="0" cellpadding="2" width="100%" border="0">
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
			<td nowrap width="15%" align="right">Tipo e Identificaci&oacute;n : </td>
			<td nowrap width="35%" align="left">
				<input type="text" id="E01TID" name="E01TID" maxlength="4"  size="5"  value="<%=msgRec.getE01TID().trim()%>" readonly>
				<input type="text" id="E01IDN" name="E01IDN" maxlength="25" size="27" value="<%=msgRec.getE01IDN().trim()%>" readonly>
			</td>
			<td nowrap width="15%" align="right">Nombre :</td>
			<td nowrap width="35%" align="left">
				<input type="text" id="NOM" name="NOM" size="45" maxlength="40" value="" readonly>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
			<td nowrap width="15%" align="right">Fecha Expedici&oacute;n :</td>
			<td nowrap width="35%" align="left">
				<input type="text" id="FEX" name="FEX" size="45" maxlength="40" value="" readonly>
			</td>
			<td nowrap width="15%" align="right">Lugar Expedici&oacute;n :</td>
			<td nowrap width="35%" align="left">
				<input type="text" id="LEX" name="LEX" maxlength="40" size="45" value="" readonly="readonly">
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
			<td nowrap width="15%" align="right">NUT :</td>
			<td nowrap width="35%" align="left">
				<input style="text-transform: none;" type="text" id="E01REF" name="E01REF" size="45" maxlength="40" value="" readonly>
			</td>
			<td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left"></td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
			<td nowrap width="15%" align="right">Estado :</td>
			<td nowrap width="85%" align="left" colspan="3">
				<input style="text-transform:none; width:100%;" type="text" id="EST" name="EST" value="" readonly>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
			<td nowrap width="15%" align="right">Comentario :</td>
			<td nowrap width="85%" align="left" colspan="3">
				<input style="text-transform:none; width:100%;" type="text" id="COM" name="COM" value="" readonly>
			</td>
		</tr>
	</table>
		</td>
	</tr>
</table>

<table class="tableinfo">
	<tr>
		<td nowrap>
	<table  cellspacing="0" cellpadding="2" width="100%" border="0">
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
			<td nowrap width="15%" align="right">Excepci&oacute;n :</td>
			<td nowrap width="35%" align="left">
				<eibsinput:cnofc name="msgRec" property="E01EXC" value="" size="3" maxlength="2" required="false" flag="BO" fn_code="E01EXC" fn_description="D01EXC" />
				<input type="text" id="D01EXC" name="D01EXC" size="20" value="" readonly>
			</td>
			<td nowrap width="15%" align="right">Observaci&oacute;n :</td>
			<td nowrap width="35%" align="left">
				<textarea name="E01RMK" cols="45" rows="5" ></textarea>
			</td>
		</tr>
	</table>
		</td>
	</tr>
</table>

<% if (!msgRec.getE01REF().trim().equals("") || !msgRec.getE01EXC().trim().equals("")) { %>
<h4>&Uacute;ltima Verificaci&oacute;n</h4>
<table class="tableinfo" >
	<tr>
		<td nowrap>
	<table cellspacing="0" cellpadding="2" width="100%" border="0">
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
			<td nowrap width="16%" align="right"> 
			<%
				if (!msgRec.getE01REF().trim().equals("")) {
					out.print("NUT :");
				} else {
					out.print("Excepci&oacute;n :");
				}
			%>
			</td>
			<td nowrap width="16%" align="left"><b>
			<%
				if (!msgRec.getE01REF().trim().equals("")) {
					out.print(msgRec.getE01REF().trim());
				} else {
					out.print(msgRec.getE01EXC().trim() + " " + msgRec.getD01EXC().trim());
				}
			%>
			</b></td>
			<td nowrap width="16%" align="right">Usuario: </td>
			<td nowrap width="16%" align="left"><b><%=msgRec.getE01MUS().trim()%></b></td>
			<td nowrap width="16%" align="right">Fecha y Hora: </td>
			<td nowrap width="16%" align="left"><b><%=msgRec.getE01MTM().trim()%></b></td>
		</tr>
	</table>
		</td>
	</tr>
</table>
<% } %>

	<table width="100%">		
		<tr>
			<td width="50%" align="center"> 
				<input id="EIBSBTN" type=button name="cmdVerify" value="Iniciar" onClick="RNEC();" >
			</td>
			<td width="50%" align="center"> 
				<input id="EIBSBTN" type=button name="Submit" value="Guardar" onClick="goAction(5);" >
			</td>
		</tr> 	  
	</table>

	<!--
	<br><br><br><br><br> 
	<h4>Trama</h4>
	<table class="tableinfo" width="100%" >
		<tr>
			<td nowrap>
				<table cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr>
							<td >
								<div id="divresultado" class="alert alert-success" ></div>
							</td>
					</tr>
				</table>
			</td> 
		</tr> 
	</table>
	-->

</form>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
	cerrarVentana();	  
</script>
<% } %>  

</body>

</html>
