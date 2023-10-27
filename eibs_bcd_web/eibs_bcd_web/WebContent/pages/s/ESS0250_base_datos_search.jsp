<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Documents Source</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgSearch" class= "datapro.eibs.beans.ESS025001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.10.2.min.js"> </SCRIPT>

<SCRIPT type="text/javascript">
function selection(){
	if(getElement("cliente").checked){
		getElement("NumCliente1").style.display = 'block';
		getElement("NumCliente2").style.display = 'block';
		getElement("Application1").style.display = 'block';
		getElement("Application2").style.display = 'block';
		getElement("Account1").style.display = 'none';
		getElement("Account2").style.display = 'none';
		getElement("Archivo1").style.display = 'none';
		getElement("Archivo2").style.display = 'none';
		//getElement("show").style.display = 'block';
	} else if(getElement("cuenta").checked){
		getElement("NumCliente1").style.display = 'none';
		getElement("NumCliente2").style.display = 'none';
		getElement("Application1").style.display = 'none';
		getElement("Application2").style.display = 'none';
		getElement("Account1").style.display = 'block';
		getElement("Account2").style.display = 'block';
		getElement("Archivo1").style.display = 'none';
		getElement("Archivo2").style.display = 'none';
		//getElement("show").style.display = 'block';
	} else if(getElement("archivo").checked){
		getElement("NumCliente1").style.display = 'none';
		getElement("NumCliente2").style.display = 'none';
		getElement("Application1").style.display = 'none';
		getElement("Application2").style.display = 'none';
		getElement("Account1").style.display = 'none';
		getElement("Account2").style.display = 'none';
		getElement("Archivo1").style.display = 'block';
		getElement("Archivo2").style.display = 'block';
		//getElement("show").style.display = 'block';
	} else {
		getElement("NumCliente1").style.display = 'none';
		getElement("NumCliente2").style.display = 'none';
		getElement("Application1").style.display = 'none';
		getElement("Application2").style.display = 'none';
		getElement("Account1").style.display = 'none';
		getElement("Account2").style.display = 'none';
		getElement("Archivo1").style.display = 'none';
		getElement("Archivo2").style.display = 'none';
		//getElement("show").style.display = 'none';
	}
}

function goExcel() {
	cun = document.forms[0].E01SELCUN.value;
	acd = document.forms[0].E01SELACD.value;
	mod = document.forms[0].E01SELMOD.value;
	ipa = document.forms[0].E01SELIPA.value;
	usr = document.forms[0].E01SELUSR.value;
	usa = document.forms[0].E01SELUSA.value;
	acc = document.forms[0].E01SELACC.value;
	fil = document.forms[0].E01SELFIL.value;
	tey = document.forms[0].E01TODTEY.value;
	ted = document.forms[0].E01TODTED.value;
	tem = document.forms[0].E01TODTEM.value;
	fey = document.forms[0].E01FRDTEY.value;
	fed = document.forms[0].E01FRDTED.value;
	fem = document.forms[0].E01FRDTEM.value;
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0250?E01SECUN=" + cun + "&E01SELACD=" + acd
				+ "&E01SELMOD=" + mod + "&E01SELIPA=" + ipa + "&E01SELUSR=" + usr + "&E01SELUSA=" + usa
				+ "&E01SELACC=" + acc + "&E01SELFIL=" + fil + "&E01TODTEY=" + tey + "&E01TODTED=" + ted + "&E01TODTEM=" + tem
				+ "&E01FRDTEY=" + fey + "&E01FRDTED=" + fed + "&E01FRDTEM=" + fem + "&SCREEN=400";
	CenterWindow(pg, 600, 500, 2);
}
</SCRIPT>

</HEAD>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>

<h3 align="center">Consulta Auditoria Operaciones Base de Datos 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="base_datos_search.jsp, ESS0250">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0250">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <INPUT TYPE=HIDDEN NAME="E01CUSNA1" VALUE="<%=msgSearch.getE01CUSNA1() %>">
	<input type="HIDDEN" name="E01SELIPA" id="E01SELIPA" size="25" maxlength="20" value="" >

<% int row = 0; %>
<table  class="tableinfo">
	<tr bordercolor="#FFFFFF"> 
    	<td nowrap> 
        	<table width="100%" border="0">
        		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
					<td width="15%" align="right">Selecci&oacute;n Por :</td>
					<td width="15%">
						<input type="radio" name="sel" id="cliente" value="client" onclick="selection()"> Cliente <br>
						<input type="radio" name="sel" id="cuenta" value="account" onclick="selection()"> Cuenta <br>
						<input type="radio" name="sel" id="archivo" value="file" onclick="selection()"> Archivo
					</td>
					<td width="15%" align="right" id="NumCliente1" style="display: none;">Numero Cliente :</td>
					<td width="15%" align="left" id="NumCliente2" style="display: none;">
		                <input type="text" name="E01SELCUN" id="E01SELCUN" size="10" maxlength="9">
		                <a href="javascript:GetCustomerDescId('E01SELCUN','E01CUSNA1','')">
		                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" >
		                </a>
					</td>
					<td width="15%" align="right" id="Application1" style="display: none;">Aplicaci&oacute;n :</td>
					<td width="15%" align="left" id="Application2" style="display: none;">
		                <input type="text" name="E01SELACD" id="E01SELACD" size="3" maxlength="2" >
		                <a href="javascript:GetApplicationCode('E01SELACD')">
		                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" >
		                </a>
					</td>
					<td width="15%" align="right" id="Account1" style="display: none;">Numero Cuenta :</td>
					<td colspan="6" align="left" id="Account2" style="display: none;">
		                <input type="text" name="E01SELACC" id="E01SELACC" size="13" maxlength="12" >
		                <a href="javascript:GetAccount('E01SELACC')">
		                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" >
		                </a>
					</td>
					<td width="15%" align="right" id="Archivo1" style="display: none;">Archivo :</td>
					<td colspan="6" align="left" id="Archivo2" style="display: none;">
		                <input type="text" name="E01SELFIL" id="E01SELFIL" size="11" maxlength="10" >
					</td>
				</tr>
        		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
					<td width="15%" align="right">Evento :</td>
					<td colspan="6">
						<SELECT name="E01SELMOD">
							<OPTION value=""></OPTION>
							<OPTION <%= msgSearch.getE01SELMOD().trim().equals("NEW")?"Selected":"" %> value="NEW">Nuevo</OPTION>
							<OPTION <%= msgSearch.getE01SELMOD().trim().equals("DEL")?"Selected":"" %> value="DEL">Borrado</OPTION>
							<OPTION <%= msgSearch.getE01SELMOD().trim().equals("UPD")?"Selected":"" %> value="UPD">Actualizado</OPTION>
							<OPTION <%= msgSearch.getE01SELMOD().trim().equals("INQ")?"Selected":"" %> value="INQ">Consulta</OPTION>
							<OPTION <%= msgSearch.getE01SELMOD().trim().equals("APR")?"Selected":"" %> value="APR">Aprobado</OPTION>
							<OPTION <%= msgSearch.getE01SELMOD().trim().equals("REJ")?"Selected":"" %> value="REJ">Rechazado</OPTION>
							<OPTION <%= msgSearch.getE01SELMOD().trim().equals("OTR")?"Selected":"" %> value="OTR">Otros</OPTION>
						</SELECT> 
					</td>
				</tr>
        		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
					<td width="15%" align="right">Direccion IP :</td>
					<td colspan="6">
		                <input type="text" name="IP"  size="4" maxlength="3" >
		                <input type="text" name="IP"  size="4" maxlength="3" >
		                <input type="text" name="IP"  size="4" maxlength="3" >
		                <input type="text" name="IP"  size="4" maxlength="3" >
					</td>
				</tr>
        		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
					<td width="15%" align="right">Usuario :</td>
					<td colspan="6">
			   			<input type="text" name="E01SELUSR" id="E01SELUSR"  size="11" maxlength="10" >
			   			<a href="javascript:GetUser('E01SELUSR','E01USRNME',document.forms[0].E01SELUSR.value)" >
			   			<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0">
						</a>
			   			<input type="hidden" name="E01USRNME" id="E01USRNME"  size="45" maxlength="45">
					</td>
				</tr>
        		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
					<td width="15%" align="right">Surpervisor :</td>
					<td colspan="6">
			   			<input type="text" name="E01SELUSA" id="E01SELUSA"  size="11" maxlength="10">
			   			<a href="javascript:GetUser('E01SELUSA','E01USANME',document.forms[0].E01SELUSA.value)" >
			   			<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0">
						</a>
			   			<input type="hidden" name="E01USANME" id="E01USANME"  size="45" maxlength="45">
					</td>
				</tr>
        		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
					<td width="15%" align="right">Fecha Inicio :</td>
					<td colspan="6">
						<eibsinput:date fn_month="E01FRDTEM" fn_day="E01FRDTED" fn_year="E01FRDTEY" name="select"/>
					</td>
				</tr>
        		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
					<td width="15%" align="right">Fecha Final :</td>
					<td colspan="6">
						<eibsinput:date fn_month="E01TODTEM" fn_day="E01TODTED" fn_year="E01TODTEY" name="select"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

 <div align="center">
   <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
   <input type="button" name="EXCEL" id="EIBSBTN" value="Generar Excel" onclick="goExcel();">
 </div>
 
 <script type="text/javascript">
function validSelection(){
	var selection = $('input[name="sel"]:checked').val();
	var returnVal = true;

	if(selection == "client"){
		if(getElement("E01SELCUN").value.trim() == ""){
			alert("Numero de Cliente no puede estar en blanco");
			returnVal = false;
		}
		
	}else if ( selection == "account" ){
		if(getElement("E01SELACC").value.trim() == ""){
			alert("Numero de Cuenta no puede estar en blanco");
			returnVal = false;
		}
	}else if (typeof selection == "undefined" ){
		alert("Por favor, seleccione una opcion para la busqueda.");
		returnVal = false;
		
	} else {
		if(getElement("E01SELFIL").value.trim() == ""){
			alert("El Archivo no puede estar en blanco.");
			returnVal = false;
		}		
	}
	
	return returnVal;
} 
 
function chekcRepeat(str) {
    var repeats = /(\.)\1/;
    return repeats.test(str)
}	 
 
 
function getIPAddress(){
	var nodeList = document.getElementsByName("IP");
	
	var IParray = Array.prototype.slice.call(nodeList,0); 
	
	var IParrayVal = IParray.map(function(part, index, theArray){
		return theArray[index].value;
	});
	
	if(!chekcRepeat(IParrayVal.join("."))){
		getElement("E01SELIPA").value = IParrayVal.join(".");
	}
}

function setIPAddress(){
	var values = getElement("E01SELIPA").value.split(".");

	
	if(values.length > 3){
		var nodeList = document.getElementsByName("IP");
		
		var IParray = Array.prototype.slice.call(nodeList,0); 
		
		IParray.forEach(function(part, index, theArray){
			theArray[index].value = values[index];
		});
	}
}


function wrongIP(){
	var nodeList = document.getElementsByName("IP");
	var IParray = Array.prototype.slice.call(nodeList,0); 
	var isWrong = false;
	var emptyCounter = 0;
	
	IParray.forEach(function(part, index, theArray){
		if(theArray[index].value.trim() == ""){
			emptyCounter++;
		}
	});
	
	if(emptyCounter > 0 && emptyCounter < 4){
		isWrong = true;
		alert("Direccion IP: Formato Incompleto");
	}
	
	return isWrong;
}
 
$().ready(function(){
	setIPAddress();
	
    $("#EIBSBTN").click(function(e){
    	e.preventDefault();
    	
    	if( !wrongIP()){
    		getIPAddress();
    		
    		if(this.name == "EXCEL"){
				goExcel(); 	    			
    		} else {
    			document.forms[0].submit();
    		}
    	}
    });	
	
});


 	
 
 </script>
 
 

</form>
</body>
</HTML>
 