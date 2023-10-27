<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Mantenimiento de Convenios</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </SCRIPT>

<jsp:useBean id="cdeObj" class="datapro.eibs.beans.ECO105001Message"  scope="session" /> 
<jsp:useBean id="cdeObj2" class="datapro.eibs.beans.ECO105002Message"  scope="session" />
<jsp:useBean id="cdeObj3" class="datapro.eibs.beans.ECO105003Message"  scope="session" />

 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

 <script>
 //esto es para cliente
 var Selection;
$(function() {
$( "#tabs" ).tabs();
});

$(document).ready(function () {

	var tbs = '<%=cdeObj.getH01TABSEC()%>';
	var tbs = 'YYYYYY';
	$("#tabs").tabs({disabled: [0,1,2,3,4,5]});
	var m = tbs.length;
   	for(n=0; n<m ;n++) {
     	var tb = tbs.substring(n, n+1);
      	if(tb == "Y") {
			enableTab($("#tabs"), n);
		}
    }
    
	
    var currentTabIndex = "0";

    $tab = $("#tabs").tabs({
         activate : function (e, ui) {
            currentTabIndex = ui.newTab.index().toString();
            sessionStorage.setItem('tab-index', currentTabIndex);
         }
    });

    if (sessionStorage.getItem('tab-index') != null) {
        currentTabIndex = sessionStorage.getItem('tab-index');
        console.log(currentTabIndex);
        <% if (error.getERRNUM().equals("0")  ) { %>
        	<% if ( "S".equals(request.getAttribute("VEZ"))) {        		
        	 %>
        		$tab.tabs('option', 'active', "0");
        	<% } else {
        	%>		
        		$tab.tabs('option', 'active', currentTabIndex);
        	<% } %>
        <% } else { %>	
        	$tab.tabs('option', 'active', <%=cdeObj.getH01SCR()%>);
        <% } %>
    }
    $('#btn-sub').on('click', function () {
        sessionStorage.setItem("tab-index", currentTabIndex);
    });
   
   
    
});

function enableTab(obj, num){
    obj.tabs("enable", num);
}

function disableTab(obj, num){
    obj.tabs("disable", num);
}

	function DesHabInfEnvioCliente(valor) {
		if (valor=="CONVENIO"){
			enableTab($("#tabs"), 3);
			document.forms[0].E01COMBDE.disabled=true;
			if (document.forms[0].E01COMBDE.checked){
				document.forms[0].E01COMBDE.checked=false;
				document.forms[0].E01COMBDL.disabled=false;
				document.forms[0].E01COMBDO.disabled=false;
			}
		}else{//NO CONVENIO
		 	disableTab($("#tabs"), 3);
		 	if (document.forms[0].E01COMBDL.checked==false && document.forms[0].E01COMBDE.checked==false && 
			 document.forms[0].E01COMBDO.checked==false){
		 		document.forms[0].E01COMBDE.disabled=false;
		 	}
		 	
		}
	}
	
	function DesHabCodbarra(comp) {	
		if (comp.checked){
 			enableTab($("#tabs"), 4);
 		}else{
 			//$("#tabs").tabs({disabled: [4]});
 			disableTab($("#tabs"), 4);
 		} 
	}	
	
	
	function yaCargado(){
		DesHabCodbarra(document.forms[0].E01COMFCB);
		DesHabInfEnvioCliente(document.forms[0].E01COMINC.value);
		showPanelBd();
	}

	function dos(comp){
		excluye(comp);
		showPanelBd();
	}
	
	function ceroIzquierda(comp){
		var lg = comp.maxLength * -1;
		var val=comp.value;
		val=("000000" + val).slice (lg);
		comp.value =val;
	}

	function showPanelBd(){
		if ((document.forms[0].E01COMVBD.checked) &&
			(document.forms[0].E01COMBDL.checked || document.forms[0].E01COMBDE.checked || 
			 document.forms[0].E01COMBDO.checked)){
			 Basedatos2.style.display='block';
			 Basedatos1.style.display='block';
		}else{
			 Basedatos2.style.display='none';
			 Basedatos1.style.display='none';
		}
		
	}

	function llenarData(comp){
		if (comp.checked){
			document.forms[0].E01COMTCC.value = document.forms[0].E01COMTCR.value;
 			document.forms[0].E01COMCTC.value = document.forms[0].E01COMCTR.value;
 			document.forms[0].E01COMCCC.value = document.forms[0].E01COMCCR.value;
 			document.forms[0].E01COMDCC.value = document.forms[0].E01COMNCR.value;
 			document.forms[0].E01COMBKC.value = document.forms[0].E01COMBKR.value;
 			document.forms[0].E01COMBRC.value = document.forms[0].E01COMBRR.value;
 			document.forms[0].E01COMDRC.value = document.forms[0].E01COMDBR.value;
 			document.forms[0].E01COMCRC.value = document.forms[0].E01COMCRR.value;
 			document.forms[0].E01COMYRC.value = document.forms[0].E01COMDRR.value;		
 		}
	}

	function BorraDatosCuenta(comp,borrar){
		if (comp.name=="E01COMTCR"){
			if (comp.value=="0" || comp.value=="2"){ //Cuenta Corriente o Ahorros || Crédito Rotativo
				//blanqueamos cuenta contable
				document.forms[0].E01COMCCR.value = "";
				document.forms[0].E01COMNCR.value = "";
				document.forms[0].E01COMCCR.disabled=true;//contable			
				document.forms[0].E01COMCTR.disabled=false;//cuenta financiera								
				con1.style.visibility='hidden';//escondemos ayuda de cta contable
				if (comp.value=="0"){ //Cuenta Corriente o Ahorros
					cta1.style.visibility='';//mostramos ayuda de cuenta financiera
					pre1.style.visibility='hidden';//escondemos ayuda de  credito
				}else{// Crédito Rotativo
					cta1.style.visibility='hidden';//escondemos ayuda de  cuenta financiera
					pre1.style.visibility='';//mostramos ayuda de  credito
				}
			}			
			if (comp.value=="1"){ //Cuenta contable
				//blanqueamos Cuenta Corriente o Ahorros || Crédito Rotativo
				document.forms[0].E01COMCTR.value = "";
				document.forms[0].E01COMCTR.disabled=true;//cuenta financiera				
				document.forms[0].E01COMCCR.disabled=false;//contable					
				cta1.style.visibility='hidden';//escondemos ayuda de  cuenta financiera
				pre1.style.visibility='hidden';//escondemos ayuda de  credito
				con1.style.visibility='';//mostramos ayuda de cta contable
			}			
			if (comp.value=="9"){ //No aplica
				//blanqueamos todo
				document.forms[0].E01COMCCR.value = "";
				document.forms[0].E01COMNCR.value = "";				
				document.forms[0].E01COMCTR.value = "";
				document.forms[0].E01COMCTR.disabled=true;//cuenta financiera				
				document.forms[0].E01COMCCR.disabled=true;//contable				
				cta1.style.visibility='hidden';//escondemos ayuda de  cuenta financiera
				pre1.style.visibility='hidden';//escondemos ayuda de  credito
				con1.style.visibility='hidden';//escondemos ayuda de cta contable
			}
			if (borrar){//Borramos Data extra
				//banco
				document.forms[0].E01COMBKR.value = "";
				//agencia
				document.forms[0].E01COMBRR.value = "";
				document.forms[0].E01COMDBR.value = "";
				//moneda
				document.forms[0].E01COMCRR.value = "";
				document.forms[0].E01COMDRR.value = "";						
			}			
 		}

		if (comp.name=="E01COMTCE"){
			if (comp.value=="0" || comp.value=="2"){ //Cuenta Corriente o Ahorros || Crédito Rotativo
				//blanqueamos cuenta contable
				document.forms[0].E01COMCCE.value = "";
				document.forms[0].E01COMDET.value = "";
				document.forms[0].E01COMCCE.disabled=true;//contable			
				document.forms[0].E01COMCTE.disabled=false;//cuenta financiera					
				con2.style.visibility='hidden';//escondemos ayuda de cta contable
				if (comp.value=="0"){ //Cuenta Corriente o Ahorros
					cta2.style.visibility='';//mostramos ayuda de cuenta financiera
					pre2.style.visibility='hidden';//escondemos ayuda de  credito
				}else{// Crédito Rotativo
					cta2.style.visibility='hidden';//escondemos ayuda de  cuenta financiera
					pre2.style.visibility='';//mostramos ayuda de  credito
				}				
			}
			
			if (comp.value=="1"){ //Cuenta contable
				//blanqueamos Cuenta Corriente o Ahorros || Crédito Rotativo
				document.forms[0].E01COMCTE.value = "";
				document.forms[0].E01COMCCE.disabled=false;//contable			
				document.forms[0].E01COMCTE.disabled=true;//cuenta financiera					
				cta2.style.visibility='hidden';//escondemos ayuda de  cuenta financiera
				pre2.style.visibility='hidden';//escondemos ayuda de  credito
				con2.style.visibility='';//mostramos ayuda de cta contable				
			}
			if (comp.value=="9"){ //No aplica
				//blanqueamos todo
				document.forms[0].E01COMCCE.value = "";
				document.forms[0].E01COMDET.value = "";			
				document.forms[0].E01COMCTE.value = "";
				document.forms[0].E01COMCCE.disabled=true;//contable			
				document.forms[0].E01COMCTE.disabled=true;//cuenta financiera				
				cta2.style.visibility='hidden';//escondemos ayuda de  cuenta financiera
				pre2.style.visibility='hidden';//escondemos ayuda de  credito
				con2.style.visibility='hidden';//escondemos ayuda de cta contable				
			}
			if (borrar){//Borramos Data extra
				//banco
				document.forms[0].E01COMBKE.value = "";
				//agencia
				document.forms[0].E01COMBRE.value = "";
				document.forms[0].E01COMDRE.value = "";
				//moneda
				document.forms[0].E01COMCRE.value = "";
				document.forms[0].E01COMYCE.value = "";						
			}						
 		}
 		
		if (comp.name=="E01COMTCC"){
			if (comp.value=="0" || comp.value=="2"){ //Cuenta Corriente o Ahorros || Crédito Rotativo
				//blanqueamos cuenta contable
				document.forms[0].E01COMCCC.value = "";
				document.forms[0].E01COMDCC.value = "";
				document.forms[0].E01COMCCC.disabled=true;//contable			
				document.forms[0].E01COMCTC.disabled=false;//cuenta financiera				
				con3.style.visibility='hidden';//escondemos ayuda de cta contable
				if (comp.value=="0"){ //Cuenta Corriente o Ahorros
					cta3.style.visibility='';//mostramos ayuda de cuenta financiera
					pre3.style.visibility='hidden';//escondemos ayuda de  credito
				}else{// Crédito Rotativo
					cta3.style.visibility='hidden';//escondemos ayuda de  cuenta financiera
					pre3.style.visibility='';//mostramos ayuda de  credito
				}				
			}
			if (comp.value=="1"){ //Cuenta contable
				//blanqueamos Cuenta Corriente o Ahorros || Crédito Rotativo
				document.forms[0].E01COMCTC.value = "";
				document.forms[0].E01COMCCC.disabled=false;//contable			
				document.forms[0].E01COMCTC.disabled=true;//cuenta financiera					
				cta3.style.visibility='hidden';//escondemos ayuda de  cuenta financiera
				pre3.style.visibility='hidden';//escondemos ayuda de  credito
				con3.style.visibility='';//mostramos ayuda de cta contable				
			}
			if (comp.value=="9"){ //No aplica
				//blanqueamos todo
				document.forms[0].E01COMCCC.value = "";
				document.forms[0].E01COMDCC.value = "";			
				document.forms[0].E01COMCTC.value = "";
				document.forms[0].E01COMCCC.disabled=true;//contable			
				document.forms[0].E01COMCTC.disabled=true;//cuenta financiera				
				cta3.style.visibility='hidden';//escondemos ayuda de  cuenta financiera
				pre3.style.visibility='hidden';//escondemos ayuda de  credito
				con3.style.visibility='hidden';//escondemos ayuda de cta contable				
			}
			if (borrar){//Borramos Data extra
				//banco
				document.forms[0].E01COMBKC.value = "";
				//agencia
				document.forms[0].E01COMBRC.value = "";
				document.forms[0].E01COMDRC.value = "";
				//moneda
				document.forms[0].E01COMCRC.value = "";
				document.forms[0].E01COMYRC.value = "";						
			}			
			
 		}  		 		
	}
	
	function asignadescstatus(val) {
		var desc= "";
			
		if (val=="D" || val=="d" || val=="W" || val=="w" || val=="B" || val=="b" || val=="M" || 
		    val=="m" || val=="Q" || val=="q" || val=="S" || val=="s" || val=="Y" || val=="y"){
		     
		     		if (val=="D" || val=="d"){
						desc= "Diario";
					}
					if (val=="W" || val=="w"){
						desc= "Semanal";
					}
			        if (val=="B" || val=="b"){
						desc= "Quincenal";
					}
					if (val=="M" || val=="m"){
						desc= "Mensual";
					}
					if (val=="Q" || val=="q"){
						desc= "Trimestral";
					} 
					if (val=="S" || val=="s"){
						desc= "Semestral";
					}
					if (val=="Y" || val=="y"){
						desc= "Anual";
					}
					document.forms[0].E01COMDPL.value = desc;
		    }else{
		    	alert("Valor no permitido!!! \nValores Permitidos; D,W,B,M,Q,S,Y  ");
		    	document.forms[0].E01COMDPL.value="";
		    	document.forms[0].E01COMPLC.value="";
		    	//document.forms[0].E01COMPLC.focus();
		    }	


	}	
	
	function blockCuponesCheques(){
		if (document.forms[0].E01COMCCP00.checked){
	 		document.forms[0].E01COMCCP01.checked=false;
	 		document.forms[0].E01COMCCP02.checked=false;
	 		document.forms[0].E01COMCCP01.disabled=true;
	 		document.forms[0].E01COMCCP02.disabled=true;
	 	}
		if (document.forms[0].E01COMCCP01.checked){
	 		document.forms[0].E01COMCCP00.checked=false;
	 		document.forms[0].E01COMCCP02.checked=false;
	 		document.forms[0].E01COMCCP00.disabled=true;
	 		document.forms[0].E01COMCCP02.disabled=true;
	 	}	
		if (document.forms[0].E01COMCCP02.checked){
	 		document.forms[0].E01COMCCP00.checked=false;
	 		document.forms[0].E01COMCCP01.checked=false;
	 		document.forms[0].E01COMCCP00.disabled=true;
	 		document.forms[0].E01COMCCP01.disabled=true;
	 	}	 	
	 	if (!document.forms[0].E01COMCCP00.checked && 
	 		!document.forms[0].E01COMCCP01.checked && 
	 		!document.forms[0].E01COMCCP02.checked){
	 		document.forms[0].E01COMCCP00.disabled=false;
	 		document.forms[0].E01COMCCP01.disabled=false;
	 		document.forms[0].E01COMCCP02.disabled=false;
	 	} 	
	}

</script>

</head>
 
<body onload="yaCargado();">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
	
function goAction(op) {
	if (op==450){
		//Concatenar los checkbox de ser el caso;
		concatenaCheckbox();
		//para que grabe la pestaña 03	
		if (document.forms[0].E03MEICCC.value!="0"){
			document.forms[0].GRABAR03.value="S";
		}else {//es cero pero verificamos que el historico no sea cero
			if (document.forms[0].E03MEICCC.value != document.forms[0].E03MEICCC_H.value && document.forms[0].E03MEICCC_H.value.trim() != ""){
				document.forms[0].GRABAR03.value="S";
			}else{
				//Siempre ha sido cero no debo guardar
			}			
		}
		

		// valida montos minimo y maximo del convenio
		//monto minimo
		if (document.forms[0].E01COMVMR.value!="0" && document.forms[0].E01COMVMR.value!="0,00" 
			&& document.forms[0].E01COMVMR.value!=""){		
			var montoMin = parseFloat(document.forms[0].E01COMVMR.value); 			
			var montoMax =  parseFloat(document.forms[0].E01COMVXR.value);
			if (montoMin > montoMax){
				alert("Informacion Principal: Monto Maximo Debe ser Mayor a Monto Minimo");
				document.forms[0].E01COMVXR.focus();
				return;
			}			
		}

		//Monto maximo
		if (document.forms[0].E01COMVXR.value!="0" && document.forms[0].E01COMVXR.value!="0,00" 
			&& document.forms[0].E01COMVXR.value!=""){		
			var montoMin = parseFloat(document.forms[0].E01COMVMR.value); 			
			var montoMax =  parseFloat(document.forms[0].E01COMVXR.value);
			if (montoMin > montoMax){
				alert("Informacion Principal: Monto Maximo Debe ser Mayor a Monto Minimo");
				document.forms[0].E01COMVXR.focus();
				return;
			}			
		}

		//valida Hora Inicio Cambio de Jornada 
		if (!validadFormato(document.forms[0].E03MEICJI.value)){
			document.forms[0].E03MEICJI.focus();
			return;
		}
		//valida Hora Cierre Cambio de Jornada  
		if (!validadFormato(document.forms[0].E03MEICJC.value)){
			document.forms[0].E03MEICJC.focus();
			return;
		}
		
		
		if (document.forms[0].E03MEIPAD.checked || document.forms[0].E03MEIPAH.checked){
			//valida Hora Inicio Envió Información  Diario/Día Habil
			if (!validadFormato(document.forms[0].E03MEIHED.value)){
				document.forms[0].E03MEIHED.focus();
				return;
			}		
		}
	
		
		
		if (document.forms[0].E03MEIPAP.checked){
			//valida Hora Inicio Envió Información  Parcial
			if (!validadFormato(document.forms[0].E03MEIHIP.value)){
				document.forms[0].E03MEIHIP.focus();
				return;
			}				
			//valida Hora Hora Final Envió Información   Parcial
			if (!validadFormato(document.forms[0].E03MEIHFP.value)){
				document.forms[0].E03MEIHFP.focus();
				return;
			}		
		}
				
	}
	
	
	document.forms[0].SCREEN.value = op;
<% 	if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")) { %>	
	document.forms[0].Submit.disabled = true;
<%} %>	
	document.forms[0].Exit.disabled = true;		
	document.forms[0].E01COMRFL.disabled = false;
	document.forms[0].submit();
}


 function golistaModalidad() {
 	if (document.forms[0].E01COMNUM.value!="999999999999"){
		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050?SCREEN=600&E01COMCUN="+document.forms[0].E01COMCUN.value+"&E01COMNUM="+document.forms[0].E01COMNUM.value;
		//alert(page);		
  		CenterWindow(page,800,500,2);
	}else{
		alert("Debe Grabar el convenio para agregar ciudades en la Modalidad de Recaudo");
	}  		
 }

 function golistaCanales() {
 	if (document.forms[0].E01COMNUM.value!="999999999999"){
		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050?SCREEN=700&E01COMCUN="+document.forms[0].E01COMCUN.value+"&E01COMNUM="+document.forms[0].E01COMNUM.value;
		//alert(page);		
  		CenterWindow(page,800,600,2);
	}else{
		alert("Debe Grabar el convenio para agregar Canales - Referencias");
	}  		
 }

 function golistaDependencias() {
 	if (document.forms[0].E01COMNUM.value!="999999999999"){ 		
 		if (document.forms[0].E01DCBTFM.value!=""){
			page = "<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1072?SCREEN=300&E01IMPCNV="+document.forms[0].E01COMNUM.value+"&E01IMPTFR="+document.forms[0].E01DCBTFM.value;
			//alert(page);		
		 	CenterWindow(page,800,600,2); 		 			
 		}else{
 			alert("Debe Escoger un Tipo de Formulario en la primera pantalla para agregar Dependecias..!!!");
 		}
	}else{
		alert("Debe Grabar el convenio para agregar Dependecias");
	}  		
 }
  
  function golistaCodigoBarraHeader() {
 	if (document.forms[0].E01COMNUM.value!="999999999999"){
		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050?SCREEN=850&E01COMCUN="+document.forms[0].E01COMCUN.value+"&E01COMNUM="+document.forms[0].E01COMNUM.value;
		//alert(page);		
  		CenterWindow(page,1000,500,2);
	}else{
		alert("Debe Grabar el convenio para agregar Codigo de Barra");
	}  		
 }
 
 function concatenaCheckbox() {
 	var formaPago="";
 	if (document.forms[0].E01COMFPG00[0].checked){
 		formaPago = formaPago + document.forms[0].E01COMFPG00[0].value;
 	}
 	if (document.forms[0].E01COMFPG00[1].checked){
 		formaPago = formaPago + document.forms[0].E01COMFPG00[1].value;
 	}
 	if (document.forms[0].E01COMFPG00[2].checked){
 		formaPago = formaPago + document.forms[0].E01COMFPG00[2].value;
 	}
 	if (document.forms[0].E01COMFPG00[3].checked){
 		formaPago = formaPago + document.forms[0].E01COMFPG00[3].value;
 	}
 	if (document.forms[0].E01COMFPG00[4].checked){
 		formaPago = formaPago + document.forms[0].E01COMFPG00[4].value;
 	}
 	if (document.forms[0].E01COMFPG00[5].checked){
 		formaPago = formaPago + document.forms[0].E01COMFPG00[5].value;
 	}
 	if (document.forms[0].E01COMFPG00[6].checked){
 		formaPago = formaPago + document.forms[0].E01COMFPG00[6].value;
 	}
 	if (document.forms[0].E01COMFPG00[7].checked){
 		formaPago = formaPago + document.forms[0].E01COMFPG00[7].value;
 	}
 	document.forms[0].E01COMFPG.value=formaPago;
 	
 	var formaMixto="";
	if (document.forms[0].E01COMMFP00.checked){
 		formaMixto = formaMixto + document.forms[0].E01COMMFP00.value;
 	}
	if (document.forms[0].E01COMMFP01.checked){
 		formaMixto = formaMixto + document.forms[0].E01COMMFP01.value;
 	}
	if (document.forms[0].E01COMMFP02.checked){
 		formaMixto = formaMixto + document.forms[0].E01COMMFP02.value;
 	}
	if (document.forms[0].E01COMMFP03.checked){
 		formaMixto = formaMixto + document.forms[0].E01COMMFP03.value;
 	}
	if (document.forms[0].E01COMMFP04.checked){
 		formaMixto = formaMixto + document.forms[0].E01COMMFP04.value;
 	}
	if (document.forms[0].E01COMMFP05.checked){
 		formaMixto = formaMixto + document.forms[0].E01COMMFP05.value;
 	} 	 	 	 	 	
 	document.forms[0].E01COMMFP.value=formaMixto;
 	
 	var formaCheque="";
	if (document.forms[0].E01COMCCP00.checked){
 		formaCheque = formaCheque + document.forms[0].E01COMCCP00.value;
 	}
	if (document.forms[0].E01COMCCP01.checked){
 		formaCheque = formaCheque + document.forms[0].E01COMCCP01.value;
 	}
	if (document.forms[0].E01COMCCP02.checked){
 		formaCheque = formaCheque + document.forms[0].E01COMCCP02.value;
 	} 	 
	if (document.forms[0].E01COMCCP03.checked){
 		formaCheque = formaCheque + document.forms[0].E01COMCCP03.value;
 	} 
 	if (document.forms[0].E01COMCCP04.checked){
 		formaCheque = formaCheque + document.forms[0].E01COMCCP04.value;
 	} 
 	document.forms[0].E01COMCCP.value=formaCheque;
 }
 
 function excluye(comp) {
 //manual
 	if (comp.name == "E01COMMCF") {//Manual, con factura
 	 	if (comp.checked)
			document.forms[0].E01COMMSF.disabled=true;
		else
			document.forms[0].E01COMMSF.disabled=false;
	}
	if (comp.name == "E01COMMSF") {//Manual, sin factura	
	 	if (comp.checked)
			document.forms[0].E01COMMCF.disabled=true;
		else
			document.forms[0].E01COMMCF.disabled=false;
		
	}
	
 //codigo de barra	
 	if (comp.name == "E01COMCBS") {//Código de Barras, Standard
 	 	if (comp.checked){
			document.forms[0].E01COMMCB.disabled=true;
			document.forms[0].E01COMCBP.disabled=true;
		}else{
			document.forms[0].E01COMMCB.disabled=false;
			document.forms[0].E01COMCBP.disabled=false;
		}
	}
 	if (comp.name == "E01COMMCB") {//Código de Barras, Múltiple Códigos de Barras
 	 	if (comp.checked){
			document.forms[0].E01COMCBS.disabled=true;
			document.forms[0].E01COMCBP.disabled=true;
		}else{
			document.forms[0].E01COMCBS.disabled=false;
			document.forms[0].E01COMCBP.disabled=false;
		}
	}
 	if (comp.name == "E01COMCBP") {//Código de Barras, Personalizado
 	 	if (comp.checked){
			document.forms[0].E01COMCBS.disabled=true;
			document.forms[0].E01COMMCB.disabled=true;
		}else{
			document.forms[0].E01COMCBS.disabled=false;
			document.forms[0].E01COMMCB.disabled=false;
		}
	}

 //Base de Datos	
 	if (comp.name == "E01COMBDL") {//Base de Datos, Local
 	 	if (comp.checked){
			document.forms[0].E01COMBDE.disabled=true;
			document.forms[0].E01COMBDO.disabled=true;
		}else{
			if (document.forms[0].E01COMINC.value != "CONVENIO") document.forms[0].E01COMBDE.disabled=false;
			document.forms[0].E01COMBDO.disabled=false;
		}
	}
 	if (comp.name == "E01COMBDE") {//Base de Datos, Externa
 	 	if (comp.checked){
			document.forms[0].E01COMBDL.disabled=true;
			document.forms[0].E01COMBDO.disabled=true;
		}else{
			document.forms[0].E01COMBDL.disabled=false;
			document.forms[0].E01COMBDO.disabled=false;
		}
	}
 	if (comp.name == "E01COMBDO") {//Base de Datos, Otros 
 	 	if (comp.checked){
			document.forms[0].E01COMBDL.disabled=true;
			document.forms[0].E01COMBDE.disabled=true;
		}else{
			document.forms[0].E01COMBDL.disabled=false;
			if (document.forms[0].E01COMINC.value != "CONVENIO") document.forms[0].E01COMBDE.disabled=false;
		}
	}		
					
}

function showHide(comp,cargado) {
 	if (comp.name == "E01COMIRM") {//Manual
 		if (comp.checked){
 				rowManual.style.display='block';
 		}else{
 				rowManual.style.display='none';				
 		} 	
	}
 	if (comp.name == "E01COMFCB") {//Codigo de Barra
 		if (comp.checked){
 				rowCodigo.style.display='block';			
 		}else{
 				rowCodigo.style.display='none';				
 		} 
 		if (cargado=='Y'){
 			DesHabCodbarra(comp);//Habilitaro deshabilitar la pestaña respectiva
 		}
	}
 	if (comp.name == "E01COMVBD") {//Base de datos
 		if (comp.checked){
 				rowBase.style.display='block';				
 		}else{
 				rowBase.style.display='none';				
 		}
 		showPanelBd(); 		 	
	}
	
	if (comp.name == "E01COMFPG00") {//selecciono Forma de pago			
 		
 		if (document.forms[0].E01COMFPG00[1].checked){// Forma de Pago :cheques
 				rowCheque.style.display='block';
 				//habilitamos campos de cheques
 				document.forms[0].E01COMNCP.disabled=false;
 				document.forms[0].E01COMCPP.disabled=false;
 		}else{
 				rowCheque.style.display='none';
 				//deshabilitamos y blanqueamos
				document.forms[0].E01COMNCP.disabled=true;				
 				document.forms[0].E01COMCPP.disabled=true;
 				if (document.forms[0].E01COMFPG00[7].checked && document.forms[0].E01COMMFP01.checked){//selecciono Forma de pago Mixto y// sub Forma de mixto :cheques
 					//nada, no blanqueamos
 				}else{
 				 	document.forms[0].E01COMNCP.value="";
 					document.forms[0].E01COMCPP.value=""; 	
 				}

 		}
 		 
 		if (document.forms[0].E01COMFPG00[7].checked){//selecciono Forma de pago Mixto
 				rowMixto.style.display='block';
 				//verificar si en mixto tiene cheque para habilitarlo
 				if (document.forms[0].E01COMMFP01.checked){// sub Forma de mixto :cheques
 					rowCheque.style.display='block';
 					//habilitamos campos de cheques
 					document.forms[0].E01COMNCP.disabled=false;
 					document.forms[0].E01COMCPP.disabled=false;
 				}else{
 					rowCheque.style.display='none';
	 				//deshabilitamos y blanqueamos
					document.forms[0].E01COMNCP.disabled=true;				
	 				document.forms[0].E01COMCPP.disabled=true;
	 				document.forms[0].E01COMNCP.value="";
	 				document.forms[0].E01COMCPP.value="";  					
 				}
 		}else{
 				rowMixto.style.display='none';
 		} 
	}

	if (comp.name == "E01COMMFP01") {//selecciono Forma de pago	Mixto y subforma Cheque	
 		if (comp.checked){// Forma de Pago :cheques
 				rowCheque.style.display='block';
				document.forms[0].E01COMNCP.disabled=false;
 				document.forms[0].E01COMCPP.disabled=false; 				
 		}else{
 				rowCheque.style.display='none';
				document.forms[0].E01COMNCP.disabled=true;
 				document.forms[0].E01COMCPP.disabled=true; 				
 		} 
	}

	
	//***********para la pantalla: envio de inf. al cliente  (petaña 3)
	 	if (comp.name == "E03MEIPAD" || comp.name == "E03MEIPAH") {//selecciono diario/diario habil
	 		if (comp.checked){
	 				rowDiario.style.display='block';
	 		}else{
			 		if (!document.forms[0].E03MEIPAD.checked && !document.forms[0].E03MEIPAH.checked) {
			 			rowDiario.style.display='none';
			 		}	 				
	 		} 	
		}
		
		if (comp.name == "E03MEIPAP") {//selecciono parcial
	 		if (comp.checked){
	 				rowParcial.style.display='block';
	 		}else{
	 				rowParcial.style.display='none';
	 		} 	
		}				
	
 }
 
 
 
	function HabilitarConvenioGrupo(valor) {
		if (valor == "PRINCIPAL" || valor == "SECUNDARIO") {
			document.getElementById("E01COMCGR").disabled=false;
		}else{
			document.getElementById("E01COMCGR").value="";
			document.getElementById("E01COMCGR").disabled=true;		
		}
	}

	function habDeshCiudades(valor) {
		if (valor == "CIUDAD - OFICINA") {
			document.forms[0].listaModalidad.disabled=false;
		}else{
			document.forms[0].listaModalidad.disabled=true;		
		}
	}	

	function getValChk(v) {
		var formLength= document.forms[0].elements.length;
	   	var vc = " ";
		for(n=0;n<formLength;n++) {
	     	var elementName= document.forms[0].elements[n].name;
	      	if(elementName == v) {
				if (document.forms[0].elements[n].checked == true) {
					vc = document.forms[0].elements[n].value;
	        		break;
				}
	      	}
	    }
	    return vc;
	}
 
	function cnvN(s) {
		s = s.replace(/,/g,'');
		return parseFloat(s);
	}	

	function ChequearTipos(obj) {
		if (obj.value=="0"){
			document.forms[0].E01COMTPS.value="";
			document.forms[0].E01COMDPS.value="";
			document.forms[0].E01COMSPS.value="";
			document.forms[0].E01COMDSP.value="";
			//---
			document.forms[0].E01COMTPS.disabled=true;
			document.forms[0].E01COMSPS.disabled=true;	
			document.getElementById("lupa1").style.visibility='hidden';
			document.getElementById("chulo1").style.visibility='hidden';				
			document.getElementById("lupa2").style.visibility='hidden';
			document.getElementById("chulo2").style.visibility='hidden';									
		}else{
			//---
			document.forms[0].E01COMTPS.disabled=false;
			document.forms[0].E01COMSPS.disabled=false;
			document.getElementById("lupa1").style.visibility='';
			document.getElementById("chulo1").style.visibility='';																			
			document.getElementById("lupa2").style.visibility='';
			document.getElementById("chulo2").style.visibility='';																
		}
	}		
	
	function habDesAceptaDebitoCredito(value) {
		if (value=="0016"){
			document.forms[0].E01COMDOC.disabled=false;
		}else{
			document.forms[0].E01COMDOC.disabled=true;
		}
		//habilitar la parte de impuestos
		if (value=="0006"){
			document.forms[0].E01COMICS.disabled=false;
			document.forms[0].E01COMTPS.disabled=false;
			document.forms[0].E01COMSPS.disabled=false;
			document.forms[0].E01COMERE.disabled=false;
		}else{
			document.forms[0].E01COMICS.disabled=true;
			document.forms[0].E01COMTPS.disabled=true;
			document.forms[0].E01COMSPS.disabled=true;
			document.forms[0].E01COMERE.disabled=true;
		}
	}
	

	
	function validadFormato(value) {
	
		if (value.length !=6){
			alert("Debe colocar Hora en formato HHMMSS");
			return false;
		}
		var cad1 = value.substring(0,2) * 1;//00 y 23
		var cad2 = value.substring(2,4) * 1;//00 y 59
		var cad3 = value.substring(4) * 1; //00 y 59

		if (cad1>23){
			alert("La Hora Debe ser menor o igual a 23");
			return false;		
		}
		if (cad2>59){
			alert("Los Minutos Deben ser menor o igual a 59");
			return false;		
		}
		if (cad3>59){
			alert("Los Segundos Deben ser menor o igual a 59");
			return false;		
		}
		
		return true;
		
	}
</SCRIPT>  
 

<% 
	if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
        
    String readMant = (userPO.getPurpose().equals("MAINTENANCE")?"readonly":"");
    String mTitle = "Mantenimiento ";
	String read = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	
 	String tf = "false";
 	Boolean isReadOnly = false;
 	Boolean isNew = false;
 	Boolean readMntS = false; 
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) { 
		read = " readonly ";
		disabled = " disabled";
		tf = "true";
		isReadOnly = true;
	}
		
	String readMnt = (isNew?"":" readonly");
	readMntS = (isNew?true:false);
	
	if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL")) {
		readMnt = " readonly";
		mTitle = "Consulta ";
		readMntS = true;
	}	

%>


<H3 align="center"><%=mTitle%> - Convenio de Recaudos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="collect_deal_maintenance, ECO1050"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="450">
  <INPUT TYPE=HIDDEN NAME="H01SCR" VALUE="">
  
  <INPUT TYPE=HIDDEN NAME="E01OPE" VALUE="<%= cdeObj.getE01OPE().trim()%>">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
             <td nowrap width="15%" align="right">Cliente: 
              </td>
             <td nowrap width="15%" align="left">
	  			<eibsinput:text name="cdeObj" property="E01COMCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right">Identificación:  
             </td>
             <td nowrap width="15%" align="left">
	  			<eibsinput:text name="cdeObj" property="E01COMIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
             <td nowrap width="15%" align="right"> Nombre: 
               </td>
             <td nowrap width="20%"align="left">
	  			<eibsinput:text name="cdeObj" property="E01COMDCL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"  size="50"/>
             </td>
         </tr>
          
		<tr id="trclear"> 
            <td nowrap align="right">Código Convenio: </td>
            <td nowrap align="left" colspan="2">
            	<table border="0" width="100%" cellpadding="0" cellspacing="0">
            		<tr>
            			<td align="left">
	            			<input type="text" name="E01COMNUM" maxlength="6" size="14" value="<%=cdeObj.getE01COMNUM()%>" <%=readMant%> 
	            	 		onkeypress="enterInteger(event)" class="TXTRIGHT" <%if (!"999999999999".equals(cdeObj.getE01COMNUM())){ out.print("readonly");} %>
	            	 		>
            			</td>
            			<td align="right">
            				Descripción del Convenio:
            			</td>
            		</tr>
            	</table>          	 
            </td>         
			<td nowrap align="left" colspan="3">
				<input type="text" name="E01COMDCO" maxlength="60" size="64" value="<%=cdeObj.getE01COMDCO()%>" <%=readMant%> class="TXTBASE">				
			</td>		
		</tr>			
		<tr id="trdark"> 
            <td nowrap align="right">Gerente / Oficial:</td>
            <td nowrap align="left">
                <eibsinput:cnofc name="cdeObj" property="E01COMOFL" value="<%=cdeObj.getE01COMOFL()%>" required="false" flag="15" fn_code="E01COMOFL" fn_description="E01COMDOF" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="E01COMDOF" size="20" value="<%= cdeObj.getE01COMDOF().trim()%>" readonly>
            </td>          
            <td nowrap align="right">Estado: </td> 
			<td nowrap align="left"><input type="text" name="E01COMDST" size="25" value="<%= cdeObj.getE01COMDST().trim()%>" readonly></td>
            <td nowrap align="right">Fecha<br>Aprobación:</td>
			<td nowrap align="left">			
				<eibsinput:date name="cdeObj" fn_year="E01COMAYY" fn_month="E01COMAMM" fn_day="E01COMADD" required="false" readonly="true"/>
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap align="left" colspan="6">
            <%=cdeObj.getE01COMOST()%>        	 
            </td>         		
		</tr>
    </table>
     
<div id="tabs">  
	<ul>
    	<li><a href="#tab1">Datos Principales</a></li>
    	<li><a href="#tab2">Base de Datos y Adhesivos</a></li>
    	<li><a href="#tab3">Modalidad Del Recaudo</a></li>
    	<li><a href="#tab4">Envio de Inf. al cliente</a></li>
    	<li><a href="#tab5">Def. Codigo de Barra</a></li>
    	<li><a href="#tab6">Def. de Referencias</a></li>
	</ul>

<div id="tab1">  <!-- Datos Principales del Convenio  -->
<!-- campos ucultos del convenio dds01 -->
  <INPUT TYPE=HIDDEN NAME="E01COMBNK" VALUE="<%= cdeObj.getE01COMBNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01COMOFA" VALUE="<%=cdeObj.getE01COMOFA() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMOST" VALUE="<%=cdeObj.getE01COMOST() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMFSM" VALUE="<%=cdeObj.getE01COMFSM() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMFSD" VALUE="<%=cdeObj.getE01COMFSD() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMFSY" VALUE="<%=cdeObj.getE01COMFSY() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMLPO" VALUE="<%=cdeObj.getE01COMLPO() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMPOV" VALUE="<%=cdeObj.getE01COMPOV() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMRPV" VALUE="<%=cdeObj.getE01COMRPV() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMCCB" VALUE="<%=cdeObj.getE01COMCCB() %>">    
  <INPUT TYPE=HIDDEN NAME="E01COMCOU" VALUE="<%=cdeObj.getE01COMCOU() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMSTE" VALUE="<%=cdeObj.getE01COMSTE() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMCTY" VALUE="<%=cdeObj.getE01COMCTY() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMSPM" VALUE="<%=cdeObj.getE01COMSPM() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMSPD" VALUE="<%=cdeObj.getE01COMSPD() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMSPY" VALUE="<%=cdeObj.getE01COMSPY() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMARA" VALUE="<%=cdeObj.getE01COMARA() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMARH" VALUE="<%=cdeObj.getE01COMARH() %>"> 
  <INPUT TYPE=HIDDEN NAME="E01COMARM" VALUE="<%=cdeObj.getE01COMARM() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMARC" VALUE="<%=cdeObj.getE01COMARC() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMACA" VALUE="<%=cdeObj.getE01COMACA() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMACH" VALUE="<%=cdeObj.getE01COMACH() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMACM" VALUE="<%=cdeObj.getE01COMACM() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMACC" VALUE="<%=cdeObj.getE01COMACC() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMEDS" VALUE="<%=cdeObj.getE01COMEDS() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMEMM" VALUE="<%=cdeObj.getE01COMEMM() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMEDD" VALUE="<%=cdeObj.getE01COMEDD() %>">
  
  <INPUT TYPE=HIDDEN NAME="E01COMEYY" VALUE="<%=cdeObj.getE01COMEYY() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMETM" VALUE="<%=cdeObj.getE01COMETM() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMEUS" VALUE="<%=cdeObj.getE01COMEUS() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMADS" VALUE="<%=cdeObj.getE01COMADS() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMAMM" VALUE="<%=cdeObj.getE01COMAMM() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMADD" VALUE="<%=cdeObj.getE01COMADD() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMAYY" VALUE="<%=cdeObj.getE01COMAYY() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMATM" VALUE="<%=cdeObj.getE01COMATM() %>">
  <INPUT TYPE=HIDDEN NAME="E01COMAUS" VALUE="<%=cdeObj.getE01COMAUS() %>">
   

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
      <b>Informacion Principal</b>
      <table cellspacing="0" cellpadding="2" width="100%" border="1">
       <tr>
       <td> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="10%" align="right">Categoria: </td>
            <td nowrap width="25%" align="left"> 
				<select name="E01COMINC" <%=isReadOnly?"disabled":""%> onchange="DesHabInfEnvioCliente(this.value);">
                    <option value="CONVENIO" <% if (cdeObj.getE01COMINC().equals("CONVENIO")) out.print("selected"); %>>CONVENIO</option>
                    <option value="NO CONVENIO" <% if (cdeObj.getE01COMINC().equals("NO CONVENIO")) out.print("selected"); %>>NO CONVENIO</option>                   
                </select>                	
              	<%=mandatory%> 
             </td>
            <td nowrap width="10%" align="right">Tipo de servicio: </td>
            <td nowrap width="25%" align="left">
             	<eibsinput:cnofc name="cdeObj" property="E01COMCTS" value="<%=cdeObj.getE01COMCTS()%>" required="true" readonly="<%=isReadOnly %>" flag="VA" fn_code="E01COMCTS" fn_description="E01COMDTS"  onchange="habDesAceptaDebitoCredito(this.value)" />
       	        <input type="text" name="E01COMDTS" size="20" value="<%= cdeObj.getE01COMDTS().trim()%>" readonly>            	
            </td>
			<td nowrap width="10%" align="right">Recepción Fuera <br> de Línea: </td>
			<td nowrap width="20%" align="left"> 
				<select name="E01COMRFL">
                    <option value="Y" <% if (cdeObj.getE01COMRFL().equals("Y") || cdeObj.getE01COMRFL().trim().equals("") ) out.print("selected"); %>>Si</option>
                    <option value="N" <% if (cdeObj.getE01COMRFL().equals("N")) out.print("selected"); %>>No</option>                   
                </select>
                <%=mandatory%>                
			</td>            
         </tr>                  
          <tr id="trdark"> 
            <td nowrap  align="right">Moneda del Convenio: </td>
            <td nowrap  align="left">
					<input type="text" name="E01COMCCY" maxlength="3" size="4" value="<%=cdeObj.getE01COMCCY()%>">
					<%if (!isReadOnly){ %>
					<a id="linkHelp" href="javascript:GetCurrencyDesc('E01COMCCY','E01COMDCY','')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Moneda" align="bottom" border="0"/>
					<img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/></a>
					<%} %>
	       	        <input type="text" name="E01COMDCY" size="20" value="<%=cdeObj.getE01COMDCY()%>" readonly>	       	                     
             </td>
            <td nowrap align="right">Fecha de Inicio: </td>
            <td nowrap  align="left">
             	<eibsinput:date name="cdeObj" fn_year="E01COMVIY" fn_month="E01COMVIM" fn_day="E01COMVID" required="true"  readonly="<%=isReadOnly %>" />        	
            </td>
			<td nowrap  align="right">Fecha Final: </td>
			<td nowrap align="left"> 
				<eibsinput:date name="cdeObj" fn_year="E01COMVFY" fn_month="E01COMVFM" fn_day="E01COMVFD" required="true"  readonly="<%=isReadOnly %>" />
			</td>            
         </tr>          
          <tr id="trclear"> 
            <td nowrap  align="right">Clase de Recaudo: </td>
            <td nowrap  align="left" >   
             	<eibsinput:cnofc name="cdeObj" property="E01COMCDR" value="<%=cdeObj.getE01COMCDR()%>" required="true" flag="VM" fn_code="E01COMCDR" fn_description="E01COMDDR" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="E01COMDDR" size="20" value="<%= cdeObj.getE01COMDDR().trim()%>" readonly>  
             </td>
			<td nowrap align="right">Acepta Deb./Cred. : </td>
            <td nowrap  align="left">
				<select name="E01COMDOC" <%=isReadOnly?"disabled":""%>>
                    <option value="A" <% if (cdeObj.getE01COMDOC().equals("A") || cdeObj.getE01COMDOC().trim().equals("") ) out.print("selected"); %>>Ambos</option>				
                    <option value="D" <% if (cdeObj.getE01COMDOC().equals("D")) out.print("selected"); %>>Debito</option>				
                    <option value="C" <% if (cdeObj.getE01COMDOC().equals("C")) out.print("selected"); %>>Credito</option>
                   
                </select>           	        	
            </td>             
			<td nowrap  align="right" >Indicador Ajustes de Pagos: </td>
			<td nowrap align="left">
				<select name="E01COMIAR" <%=isReadOnly?"disabled":""%>>
                    <option value="Y" <% if (cdeObj.getE01COMIAR().equals("Y")) out.print("selected"); %>>Si</option>
                    <option value="N" <% if (cdeObj.getE01COMIAR().equals("N") || cdeObj.getE01COMIAR().trim().equals("") ) out.print("selected"); %>>No</option>                   
                </select>
                <%=mandatory%>   
			</td>            
         </tr> 
          <tr id="trdark"> 
            <td nowrap  align="right">Nivel Grupo: </td>
            <td nowrap  align="left">
            
				<eibsinput:cnofc name="cdeObj" property="E01COMNVG" value="<%=cdeObj.getE01COMNVG()%>" required="true" flag="VN" fn_code="E01COMNVG" fn_description="E01COMDNG" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="E01COMDNG" size="20" value="<%= cdeObj.getE01COMDNG().trim()%>" readonly>  
<%--        	                    
          		 <select name="E01COMNVG" onchange="HabilitarConvenioGrupo(this.value)" <%=isReadOnly?"disabled":""%>>
                    <option value="INDIVIDUAL" <% if (cdeObj.getE01COMNVG().equals("INDIVIDUAL")) out.print("selected"); %>>INDIVIDUAL</option>
					<option value="PRINCIPAL"  <% if (cdeObj.getE01COMNVG().equals("PRINCIPAL") )  out.print("selected"); %>>PRINCIPAL</option>
                    <option value="SECUNDARIO" <% if (cdeObj.getE01COMNVG().equals("SECUNDARIO")) out.print("selected"); %>>SECUNDARIO</option>                  
                </select>
                <%=mandatory%>
--%>                                 
             </td>
            <td nowrap align="right">Código Convenio <br>Grupo: </td>
            <td nowrap  align="left">                   	
              	<input type="text" id="E01COMCGR" name="E01COMCGR" maxlength="12" size="14" value="<%=cdeObj.getE01COMCGR()%>" onkeypress=" enterInteger(event)" class="TXTRIGHT">
              	<%if (!isReadOnly){%>
				<a id="linkHelp" href="javascript:GetCodeCovenantRequest('E01COMCGR',document.forms[0].E01COMCUN.value)">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="Convenios de recaudos" align="bottom" border="0"/>
				</a>
				<%} %>
            </td>
			<td nowrap  align="right">Tipo Pago <br>Permitido:  </td>
			<td nowrap align="left">
				 <eibsinput:cnofc name="cdeObj" property="E01COMTPP" value="<%=cdeObj.getE01COMTPP()%>" required="true" flag="CV" fn_code="E01COMTPP" fn_description="E01COMDTP" readonly="<%=isReadOnly %>"/>
              	<input type="text" name="E01COMDTP" size="20" value="<%= cdeObj.getE01COMDTP().trim()%>" readonly>
			</td>            
         </tr> 
          <tr id="trclear"> 
            <td nowrap  align="right">Monto Mínimo: </td>
            <td nowrap  align="left"> 
            	<eibsinput:text name="cdeObj" property="E01COMVMR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" required="false" readonly="<%=isReadOnly %>"/>              	
             </td>
            <td nowrap align="right">Monto Máximo: </td>
            <td nowrap  align="left">
				<eibsinput:text name="cdeObj" property="E01COMVXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" required="false" readonly="<%=isReadOnly %>"/>                   	
            </td>
			<td nowrap  align="right"> </td>
			<td nowrap align="left">  
           </td>            
         </tr>  
         <tr id="trdark"> 
            <td nowrap  align="right"> Tipo Fecha Permitida: </td>
            <td nowrap  align="left"> 
              	<eibsinput:cnofc name="cdeObj" property="E01COMTFP" value="<%=cdeObj.getE01COMTFP()%>" required="true" flag="VL" fn_code="E01COMTFP" fn_description="E01COMFPD" readonly="<%=isReadOnly %>"/>
              	<input type="text" name="E01COMFPD" size="20" value="<%= cdeObj.getE01COMFPD().trim()%>" readonly>
             </td>
            <td nowrap align="right">Días de Posterioridad: </td>
            <td nowrap  align="left">
				<eibsinput:text name="cdeObj" property="E01COMDPO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" required="true" readonly="<%=isReadOnly %>"/>                   	
            </td>
			<td nowrap  align="right">Recaudo Jornada <br>Adicional: </td>
			<td nowrap align="left"> 
				<select name="E01COMIPJ" <%=isReadOnly?"disabled":""%>>
                    <option value="Y" <% if (cdeObj.getE01COMIPJ().equals("Y")) out.print("selected"); %>>Si</option>
                    <option value="N" <% if (cdeObj.getE01COMIPJ().equals("N") || cdeObj.getE01COMIPJ().trim().equals("") ) out.print("selected"); %>>No</option>                   
                </select> 
			</td>            
         </tr>
          <tr id="trclear"> 
            <td nowrap  align="right" colspan="2"> Observaciones del Recaudo: </td>
            <td nowrap align="left" colspan="4">
				<textarea rows="3" cols="103"  name=E01COMOBR onKeyDown="limitText(this, 200)" <%=isReadOnly?"readonly":""%>
				onKeyUp="limitText(this, 200)"><%=cdeObj.getE01COMOBR()%></textarea>
           </td>            
         </tr>
          <tr id="trdark"> 
            <td nowrap  align="right" colspan="2"> Observaciones del Estatus: </td>
            <td nowrap align="left" colspan="4">
				<textarea rows="3" cols="103"  name=" E01COMOST" onKeyDown="limitText(this, 512)" <%=isReadOnly?"readonly":""%>
				onKeyUp="limitText(this, 512)"><%=cdeObj.getE01COMOST()%></textarea>
           </td>            
         </tr>         
    </table> 
    </td>
    </tr>
    </table>
    <br>
     <b>Tipos de Recaudos</b>
    <table cellspacing="0" cellpadding="2" width="100%" border="1">
     <tr>
       <td> 
 	<table cellspacing="0" cellpadding="2" width="100%" border="0">         
         <tr id="trdark"> 
            <td nowrap  align="right" width="10%">&nbsp; </td>
            <td nowrap  align="left" width="10%"> Tipo de Recaudo:</td>
            <td nowrap  align="left"  width="50%">
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E01COMIRM" value="Y" <% if (cdeObj.getE01COMIRM().equals("Y")) out.print(" checked"); %>
            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%>>Manual
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E01COMFCB" value="Y" <% if (cdeObj.getE01COMFCB().equals("Y")) out.print(" checked"); %>
            	onclick="showHide(this,'Y');" <%=isReadOnly?"disabled":""%>>Formato Codigo de Barra
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E01COMVBD" value="Y" <% if (cdeObj.getE01COMVBD().equals("Y")) out.print(" checked"); %>
            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%>>Base de Datos
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<%=mandatory%> 
			</td> 
			<td nowrap  align="right" width="10%">Código Barras<br> Obligatorio: </td>
			<td nowrap align="left" width="20%"> 
				<select name="E01COMIAB" <%=isReadOnly?"disabled":""%>>
                    <option value="Y" <% if (cdeObj.getE01COMIAB().equals("Y")) out.print("selected"); %>>Si</option>
                    <option value="N" <% if (cdeObj.getE01COMIAB().equals("N") || cdeObj.getE01COMIAB().trim().equals("") ) out.print("selected"); %>>No</option>                   
                </select>
			</td> 
         </tr>
         <tr id="rowManual"  style="display:none;"> 
            <td nowrap  align="right"> &nbsp;</td>
 			<td nowrap  align="right" valign="middle"> Manual: </td>            
            <td nowrap  align="left" colspan="3">
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<table width="100%" border="0">
            		<tr>
            			<td width="25%">
            				<INPUT type="CHECKBOX" name="E01COMMCF" value="Y" <% if (cdeObj.getE01COMMCF().equals("Y")) out.print(" checked"); %>
            				onclick="excluye(this)" <%=isReadOnly?"disabled":""%>>Con Factura
            			</td>
            			<td width="25%">
            				<INPUT type="CHECKBOX" name="E01COMMSF" value="Y" <% if (cdeObj.getE01COMMSF().equals("Y")) out.print(" checked"); %>
            				onclick="excluye(this)" <%=isReadOnly?"disabled":""%>>Sin Factura
            			</td>
            			<td width="25%">
            				&nbsp;
            			</td>
            			<td width="25%">
            				<%=mandatory%>            			
            			</td>
            		</tr>
            	</table>            
			</td>            
         </tr> 
         <tr id="rowCodigo"  style="display:none;"> 
            <td nowrap  align="right"> &nbsp;</td>
 			<td nowrap  align="right" valign="middle"> Código de Barras: </td>            
            <td nowrap  align="left" colspan="4">
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<table width="100%" border="0">
            		<tr>
            			<td width="25%">
            				<INPUT type="CHECKBOX" name="E01COMCBS" value="Y" <% if (cdeObj.getE01COMCBS().equals("Y")) out.print(" checked"); %>
            				onclick="excluye(this)" <%=isReadOnly?"disabled":""%>>Standard
            			</td>
            			<td width="25%">
            				<INPUT type="CHECKBOX" name="E01COMMCB" value="Y" <% if (cdeObj.getE01COMMCB().equals("Y")) out.print(" checked"); %>
            				onclick="excluye(this)" <%=isReadOnly?"disabled":""%>>Múltiple Códigos de Barras 
            			</td>
            			<td width="25%">
            				<INPUT type="CHECKBOX" name="E01COMCBP" value="Y" <% if (cdeObj.getE01COMCBP().equals("Y")) out.print(" checked"); %>
            				onclick="excluye(this)" <%=isReadOnly?"disabled":""%>>Personalizado
            			</td>
            			<td width="25%">
            				<%=mandatory%>            			
            			</td>
            		</tr>
            	</table>             	
			</td>            
         </tr> 
         <tr id="rowBase"  style="display:none;"> 
            <td nowrap  align="right"> &nbsp;</td>
 			<td nowrap  align="right" valign="middle"> Base de Datos: </td>            
            <td nowrap  align="left" colspan="4" >
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<table width="100%" border="0">
            		<tr>
            			<td width="25%">
            				<INPUT type="CHECKBOX" name="E01COMBDL" value="Y" <% if (cdeObj.getE01COMBDL().equals("Y")) out.print(" checked"); %>
            				onclick="dos(this) " <%=isReadOnly?"disabled":""%> >Local 
            			</td>
            			<td width="25%">
            				<INPUT type="CHECKBOX" name="E01COMBDE" value="Y" <% if (cdeObj.getE01COMBDE().equals("Y")) out.print(" checked"); %>
            				onclick="dos(this)" <%=isReadOnly?"disabled":""%> >Externa 
            			</td>
            			<td width="25%">
            				<INPUT type="CHECKBOX" name="E01COMBDO" value="Y" <% if (cdeObj.getE01COMBDO().equals("Y")) out.print(" checked"); %>
            				onclick="dos(this)" <%=isReadOnly?"disabled":""%> >Otros
            			</td>
            			<td width="25%">
            				<%=mandatory%>            			
            			</td>
            		</tr>
            	</table>
			</td>            
         </tr>  
	   </table>
       </td>
       </tr>
       </table>
	 <br>
     <b>Formas de Pagos</b>
      <table cellspacing="0" cellpadding="2" width="100%" border="1">
       <tr>
       <td>     
 	   <table cellspacing="0" cellpadding="2" width="100%" border="0">            
         <tr id="trclear" > 
            <td nowrap  align="right" height="40"> Forma de Pago: </td>
            <%
            	String  cad= cdeObj.getE01COMFPG();
            	//cad="000200040007";
            	java.util.Vector<String> vec = null;
            	vec = new java.util.Vector<String>();
            	int inic =0;
            	int cont=0; 
            	for(int i=0;i<=cad.length();i++){
            		if (cont==4){
            			vec.add(cad.substring(inic,i));
            			inic=i;
            			cont=0;
            		}
            		cont++;
            	}
            %>
            <td nowrap  align="left" colspan="5">
            	<INPUT TYPE=HIDDEN NAME="E01COMFPG" VALUE="">
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="radio" name="E01COMFPG00" value="0001" <% if (vec.contains("0001")) out.print(" checked"); %>
            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%>>Efectivo  
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="radio" name="E01COMFPG00" value="0002" <% if (vec.contains("0002")) out.print(" checked"); %>
            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%>>Cheque   
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="radio" name="E01COMFPG00" value="0003" <% if (vec.contains("0003")) out.print(" checked"); %>
            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%>>Cargo Cuenta 
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="radio" name="E01COMFPG00" value="0004" <% if (vec.contains("0004")) out.print(" checked"); %>
            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%>>CERT  
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="radio" name="E01COMFPG00" value="0005" <% if (vec.contains("0005")) out.print(" checked"); %>
            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%>>Tarjeta de Credito   
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="radio" name="E01COMFPG00" value="0006" <% if (vec.contains("0006")) out.print(" checked"); %>
            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%>>Credito Rotativo 
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="radio" name="E01COMFPG00" value="0007" <% if (vec.contains("0007")) out.print(" checked"); %>
            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%>>Cuenta Contable  
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="radio" name="E01COMFPG00" value="0008" <% if (vec.contains("0008")) out.print(" checked"); %>
            	onclick="showHide(this,'Y')"<%=isReadOnly?"disabled":""%>>Mixto  
            	&nbsp;&nbsp;&nbsp;&nbsp;            	
            	<%=mandatory%> 
			</td>            
         </tr> 
         
         <tr id="rowMixto" style="display:none;" > 
            <td nowrap  align="right" height="40"> &nbsp;</td>
 			<td nowrap  align="right" valign="middle"> Mixto: </td>	 
 			<%
            	String  cad1= cdeObj.getE01COMMFP();
            	//cad1="000200040005";
            	java.util.Vector<String> vec1 = null;
            	vec1 = new java.util.Vector<String>();
            	int inic1 =0;
            	int cont1=0; 
            	for(int i1=0;i1<=cad1.length();i1++){
            		if (cont1==4){
            			vec1.add(cad1.substring(inic1,i1));
            			inic1=i1;
            			cont1=0;
            		}
            		cont1++;
            	}
            %>
            <td nowrap  align="left" colspan="4">
            	<INPUT TYPE=HIDDEN NAME="E01COMMFP" VALUE="">
            	<INPUT type="CHECKBOX" name="E01COMMFP00" value="0001" <% if (vec1.contains("0001")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Efectivo
            	&nbsp;&nbsp;&nbsp;&nbsp;
				<INPUT type="CHECKBOX" name="E01COMMFP01" value="0002" <% if (vec1.contains("0002")) out.print(" checked"); %>
				onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%>>Cheque
				&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E01COMMFP02" value="0003" <% if (vec1.contains("0003")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Cargo a Cuenta
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E01COMMFP03" value="0004" <% if (vec1.contains("0004")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>CERT
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E01COMMFP04" value="0005" <% if (vec1.contains("0005")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Tarjeta Crédito
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E01COMMFP05" value="0006" <% if (vec1.contains("0006")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Crédito Rotativo
				<%=mandatory%>            			              
			</td>            
         </tr> 
         <tr id="rowCheque" style="display:none;"> 
            <td nowrap  align="right"  height="40"> &nbsp;</td>
 			<td nowrap  align="right" valign="middle"> Cheque: </td>
 			<%
            	String  cad2= cdeObj.getE01COMCCP();
            	//cad2="00020003";
            	java.util.Vector<String> vec2 = null;
            	vec2 = new java.util.Vector<String>();
            	int inic2 =0;
            	int cont2=0; 
            	for(int i2=0;i2<=cad2.length();i2++){
            		if (cont2==4){
            			vec2.add(cad2.substring(inic2,i2));
            			inic2=i2;
            			cont2=0;
            		}
            		cont2++;
            	}
            %>      
            <td nowrap  align="left" colspan="4">
            	<INPUT TYPE=HIDDEN NAME="E01COMCCP" VALUE="">         				
				<INPUT type="CHECKBOX" name="E01COMCCP00" value="0001" <% if (vec2.contains("0001")) out.print(" checked"); %>
				<%=isReadOnly?"disabled":""%> onclick="blockCuponesCheques()">N Cupones 1 Cheque  
				&nbsp;&nbsp;           				
				<INPUT type="CHECKBOX" name="E01COMCCP01" value="0002" <% if (vec2.contains("0002")) out.print(" checked"); %>
				<%=isReadOnly?"disabled":""%> onclick="blockCuponesCheques()">N Cheques 1 Cupón     
          		&nbsp;&nbsp;		
				<INPUT type="CHECKBOX" name="E01COMCCP02" value="0003" <% if (vec2.contains("0003")) out.print(" checked"); %>
				<%=isReadOnly?"disabled":""%> onclick="blockCuponesCheques()">1 Cupón 1 Cheque 
				&nbsp;&nbsp;
				<INPUT type="CHECKBOX" name="E01COMCCP03" value="0004" <% if (vec2.contains("0004")) out.print(" checked"); %>
				<%=isReadOnly?"disabled":""%>>Cheque Local  
				&nbsp;&nbsp;
				<INPUT type="CHECKBOX" name="E01COMCCP04" value="0005" <% if (vec2.contains("0005")) out.print(" checked"); %>
				<%=isReadOnly?"disabled":""%>>Cheque Otras Plazas 
            	<%=mandatory%>            			
			</td>            
         </tr> 
                  
         <tr id="trdark"> 
            <td nowrap  align="right">Número Cheques<br>Permitidos: </td>
            <td nowrap  align="left"> 
					<eibsinput:text name="cdeObj" property="E01COMNCP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ENTITY %>" required="false" readonly="<%=isReadOnly %>"/>              
			</td>
            <td nowrap align="right">Número de Cupones: </td>
            <td nowrap  align="left">
					<eibsinput:text name="cdeObj" property="E01COMCPP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ENTITY %>" required="false" readonly="<%=isReadOnly %>"/>                  	
            </td>
			<td nowrap  align="right">&nbsp;</td>
			<td nowrap align="left"> 

			</td>            
         </tr>                 
		</table>
       </td>
       </tr>
       </table>
       
	 <br>
     <b>Referencias de Impuestos y Conceptos de Formularios</b>
   <table cellspacing="0" cellpadding="2" width="100%" border="1">
     <tr>
     <td>  		 
		<table cellspacing="0" cellpadding="2" width="100%" border="0">                 
		 <tr id="trdark"> 
            <td nowrap align="right">Tipo de Formulario:</td>
            <td nowrap align="left">      
				<eibsinput:cnofc name="cdeObj" property="E01DCBTFM" value="<%=cdeObj.getE01DCBTFM()%>" required="false" flag="VU" fn_code="E01DCBTFM"  readonly="<%=isReadOnly %>"/>            
            </td>
            <td nowrap align="right">Tipo Impreso <br>Formulario:</td>
            <td nowrap align="left">
	            <eibsinput:cnofc name="cdeObj" property="E01DCBTIF" value="<%=cdeObj.getE01DCBTIF()%>" required="false" flag="W1" fn_code="E01DCBTIF"  readonly="<%=isReadOnly %>"/>            
            </td>
	    	<td nowrap align="right">Tipo de Impreso:</td>
	    	<td nowrap align="left">
				<eibsinput:cnofc name="cdeObj" property="E01DCBTIP" value="<%=cdeObj.getE01DCBTIP()%>" required="false" flag="W2" fn_code="E01DCBTIP"  readonly="<%=isReadOnly %>"/>					    		    	
	    	</td>            
         </tr> 
<%--         
         <tr id="trclear"> 
            <td nowrap align="right">Código de Impuesto:</td>
            <td nowrap align="left">            
				<eibsinput:text name="cdeObj" property="E01DCBCIM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="5" maxlength="4"/>            
            </td>
            <td nowrap align="right">Tipo de Impuesto:</td>
            <td nowrap align="left">
				<eibsinput:text name="cdeObj" property="E01DCBTIM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="5" maxlength="4"/>            
            </td>
	    	<td nowrap align="right">Tipo Pago de <br>Impuesto:</td>
	    	<td nowrap align="left">
				<eibsinput:text name="cdeObj" property="E01DCBTPI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="5" maxlength="4"/>	    	
	    	</td>            
         </tr>
 --%>         
		</table>
      </td>
      </tr>
    </table>
           		
	 <br>
     <b>Cuenta Recaudadora</b>		
      <table cellspacing="0" cellpadding="2" width="100%" border="1">
       <tr>
       <td> 		
        <table cellspacing="0" cellpadding="2" width="100%" border="0">  		
         <tr id="trclear"> 
	            <td nowrap  align="right" colspan="2"><b>&nbsp; </b></td>
	            <td nowrap  align="right">Tipo Cuenta: </td>
	            <td nowrap  align="left">
					<select name="E01COMTCR" <%=isReadOnly?"disabled":""%> onchange="BorraDatosCuenta(this,true)">
	                    <option value="0" <% if (cdeObj.getE01COMTCR().equals("0")  ) out.print("selected"); %>>Cuenta Corriente o Ahorros</option>
	                    <option value="1" <% if (cdeObj.getE01COMTCR().equals("1")) out.print("selected"); %>>Cuenta Contable</option>
	                    <option value="2" <% if (cdeObj.getE01COMTCR().equals("2")  ) out.print("selected"); %>>Crédito Rotativo</option>
	                    <option value="9" <% if (cdeObj.getE01COMTCR().equals("9")) out.print("selected"); %>>No Aplica</option>                
	                </select>
	            </td>
				<td nowrap  align="right">&nbsp; </td>
				<td nowrap  align="left">&nbsp;</td>            
	         </tr>
	         <tr id="trdark"> 
	            <td nowrap  align="right">Número Cuenta /<br>Crédito Rotativo: </td>
	            <td nowrap  align="left"> 
	            
	             	<eibsinput:text name="cdeObj" property="E01COMCTR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" required="true" readonly="<%=isReadOnly %>"/>
	             	<!--  GetAccountInfoExtras(name, bnk, app, sel, id, cust, ccy, type, prod,brn,desbrn,desccy,bnkback)-->
	             	<a id="cta1"  href="javascript:GetAccountInfoExtras('E01COMCTR',document.forms[0].E01COMBNK.value,'RT',document.forms[0].E01COMCUN.value,'','','E01COMCRR','','','E01COMBRR','E01COMDBR','E01COMDRR','E01COMBKR')">
	             		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" >
	             	</a>
	             	<a id="pre1"  href="javascript:GetAccountInfoExtras('E01COMCTR',document.forms[0].E01COMBNK.value,'10',document.forms[0].E01COMCUN.value,'','','E01COMCRR','','','E01COMBRR','E01COMDBR','E01COMDRR','E01COMBKR')">
	             		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" >
	             	</a>	             	
	       	    </td> <!-- RA CORRIENTE -->
	            <td nowrap  align="right">Cuenta Contable: </td>
	            <td nowrap  align="left" colspan="2">
					<eibsinput:text  name="cdeObj" property="E01COMCCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="true" readonly="<%=isReadOnly %>"/>
					<%if (!isReadOnly){ %>
					<!-- GetLedgerExtras(name, bnk, ccy, apc, desc, prodType,ccyback,desccy,bnkback)-->
	            	<A id="con1" href="javascript:GetLedgerExtras('E01COMCCR','','','','E01COMNCR','','E01COMCRR','E01COMDRR','E01COMBKR')">
	            		<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Cuenta Contable" border="0" align="top">
	            	</A>	
	            	<%} %>       	          					
	       	        <input type="text" name="E01COMNCR" size="20" value="<%= cdeObj.getE01COMNCR().trim()%>" readonly>
	            </td>			
				<td nowrap  align="left">&nbsp;</td>            
	         </tr>	         
	         <tr id="trclear"> 
	            <td nowrap  align="right">Banco: </td>
	            <td nowrap  align="left"> 
					<eibsinput:text  name="cdeObj" property="E01COMBKR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" required="true" readonly="<%=isReadOnly %>"/>	             	
	       	    </td>
	            <td nowrap  align="right">Sucursal: </td>
	            <td nowrap  align="left">
                	<eibsinput:help name="cdeObj" property="E01COMBRR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"
               	    	fn_param_one="E01COMBRR" fn_param_two="document.forms[0].E01COMBKR.value" fn_param_three="E01COMDBR" readonly="<%=isReadOnly %>"/>
               	    	<input type="text" name="E01COMDBR" size="20" value="<%=cdeObj.getE01COMDBR()%>" readonly>                	    		            
	            </td>
				<td nowrap  align="right">Moneda: </td>
				<td nowrap  align="left">
					<input type="text" name="E01COMCRR" maxlength="3" size="4" value="<%=cdeObj.getE01COMCRR()%>" <%=isReadOnly?"readonly":""%>>
					<%if (!isReadOnly){ %>
					<a id="linkHelp" href="javascript:GetCurrencyDesc('E01COMCRR','E01COMDRR','document.forms[0].E01COMBKR.value')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Moneda" align="bottom" border="0"/>
					</a>
					<%} %>
					<img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
	       	        <input type="text" name="E01COMDRR" size="20" value="<%=cdeObj.getE01COMDRR()%>" readonly> 		       	        		
				</td>            
	         </tr>
	         <tr id="trdark"> 
	            <td nowrap  align="right"> &nbsp;</td>
	            <td nowrap  align="left" colspan="5">
	             <input type="checkbox"  name="copiarC" onclick="llenarData(this)">Copiar Valores a Cuenta Cargo de las Comisiones.
	            </td>            
	         </tr>	         	        
	
	         </table>
			</td>            
         </tr>                 
		</table>	         
	 <br>
     <b>Cuenta Consolidadora</b>	
	<table cellspacing="0" cellpadding="2" width="100%" border="1">
     <tr>
      <td> 		         
		<table cellspacing="0" cellpadding="2" width="100%" border="0">  	         
        	<tr id="trdark"> 
	            <td nowrap  align="right" colspan="2"><b>&nbsp;</b></td>
	            <td nowrap  align="right">Tipo Cuenta: </td>
	            <td nowrap  align="left">
					<select name="E01COMTCE" <%=isReadOnly?"disabled":""%> onchange="BorraDatosCuenta(this,true)">
	                    <option value="0" <% if (cdeObj.getE01COMTCE().equals("0")  ) out.print("selected"); %>>Cuenta Corriente o Ahorros</option>
	                    <option value="1" <% if (cdeObj.getE01COMTCE().equals("1")) out.print("selected"); %>>Cuenta Contable</option>
	                    <option value="2" <% if (cdeObj.getE01COMTCE().equals("2")  ) out.print("selected"); %>>Crédito Rotativo</option>
	                    <option value="9" <% if (cdeObj.getE01COMTCE().equals("9")) out.print("selected"); %>>No Aplica</option>                
	                </select>
	            </td>
				<td nowrap  align="right">&nbsp; </td>
				<td nowrap  align="left">&nbsp;</td>            
	         </tr>         
	         <tr id="trclear"> 
	            <td nowrap  align="right">Número Cuenta /<br>Crédito Rotativo: </td>
	            <td nowrap  align="left"> 
	             	<eibsinput:text name="cdeObj" property="E01COMCTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" required="true" readonly="<%=isReadOnly %>"/>
					<!--  GetAccountInfoExtras(name, bnk, app, sel, id, cust, ccy, type, prod,brn,desbrn,desccy,bnkback)-->
	             	<a id="cta2"  href="javascript:GetAccountInfoExtras('E01COMCTE',document.forms[0].E01COMBNK.value,'RT',document.forms[0].E01COMCUN.value,'','','E01COMCRE','','','E01COMBRE','E01COMDRE','E01COMYCE','E01COMBKE')">
	             		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" >
	             	</a>
	             	<a id="pre2"  href="javascript:GetAccountInfoExtras('E01COMCTE',document.forms[0].E01COMBNK.value,'10',document.forms[0].E01COMCUN.value,'','','E01COMCRE','','','E01COMBRE','E01COMDRE','E01COMYCE','E01COMBKE')">
	             		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" >
	             	</a>	             	 
	       	    </td>
	            <td nowrap  align="right">Cuenta Contable: </td>
	            <td nowrap  align="left" colspan="2">
					<eibsinput:text  name="cdeObj" property="E01COMCCE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="true" readonly="<%=isReadOnly %>"/>
					<%if (!isReadOnly){ %>	
					<!-- GetLedgerExtras(name, bnk, ccy, apc, desc, prodType,ccyback,desccy,bnkback)-->	            	
	            	<A id="con2" href="javascript:GetLedgerExtras('E01COMCCE','','','','E01COMDET','','E01COMCRE','E01COMYCE','E01COMBKE')">
	            	<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Cuenta Contable" border="0" align="top">
					</A>
	            	<%} %>  
	       	        <input type="text" name="E01COMDET" size="20" value="<%= cdeObj.getE01COMDET().trim()%>" readonly>
	            </td>			
				<td nowrap  align="left">&nbsp;</td>            
	         </tr>
	         <tr id="trdark"> 
	            <td nowrap  align="right">Banco: </td>
	            <td nowrap  align="left"> 
					<eibsinput:text  name="cdeObj" property="E01COMBKE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" required="true" readonly="<%=isReadOnly %>"/>	             	
	       	    </td>
	            <td nowrap  align="right">Sucursal: </td>
	            <td nowrap  align="left">
                	<eibsinput:help name="cdeObj" property="E01COMBRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"
               	    	fn_param_one="E01COMBRE" fn_param_two="document.forms[0].E01COMBKE.value" fn_param_three="E01COMDRE" readonly="<%=isReadOnly %>"/>
               	    	<input type="text" name="E01COMDRE" size="20" value="<%=cdeObj.getE01COMDRE()%>" readonly>                	    		            
	            </td>
				<td nowrap  align="right">Moneda: </td>
				<td nowrap  align="left">
					<input type="text" name="E01COMCRE" maxlength="3" size="4" value="<%=cdeObj.getE01COMCRE()%>" <%=isReadOnly?"readonly":""%>>
					<%if (!isReadOnly){ %>					
					<a id="linkHelp" href="javascript:GetCurrencyDesc('E01COMCRE','E01COMYCE','document.forms[0].E01COMBKE.value')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Moneda" align="bottom" border="0"/>
					</a>
	            	<%} %> 
					<img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>	            	
	       	        <input type="text" name="E01COMYCE" size="20" value="<%=cdeObj.getE01COMYCE()%>" readonly> 			
				</td>            
	         </tr>		         
			</table>	         
		   </td>            
         </tr>                 
		</table>	
		 <br>
     <b>Cuenta Cargo de las Comisiones</b>		
	<table cellspacing="0" cellpadding="2" width="100%" border="1">
     <tr>
      <td> 		         
			<table cellspacing="0" cellpadding="2" width="100%" border="0">
	         <tr id="trclear"> 
	            <td nowrap  align="right" colspan="2"><b>&nbsp; </b></td>
	            <td nowrap  align="right">Tipo Cuenta: </td>
	            <td nowrap  align="left">
					<select name="E01COMTCC" <%=isReadOnly?"disabled":""%> onchange="BorraDatosCuenta(this,true)">
	                    <option value="0" <% if (cdeObj.getE01COMTCC().equals("0")  ) out.print("selected"); %>>Cuenta Corriente o Ahorros</option>
	                    <option value="1" <% if (cdeObj.getE01COMTCC().equals("1")) out.print("selected"); %>>Cuenta Contable</option>
	                    <option value="2" <% if (cdeObj.getE01COMTCC().equals("2")  ) out.print("selected"); %>>Crédito Rotativo</option>
	                    <option value="9" <% if (cdeObj.getE01COMTCC().equals("9")) out.print("selected"); %>>No Aplica</option>                
	                </select>
	            </td>
				<td nowrap  align="right">&nbsp; </td>
				<td nowrap  align="left">&nbsp;</td>            
	         </tr>
	         <tr id="trdark"> 
	            <td nowrap  align="right">Número Cuenta /<br>Crédito Rotativo: </td>
	            <td nowrap  align="left"> 
	             	<eibsinput:text name="cdeObj" property="E01COMCTC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" required="true" readonly="<%=isReadOnly %>"/>
					<!--  GetAccountInfoExtras(name, bnk, app, sel, id, cust, ccy, type, prod,brn,desbrn,desccy,bnkback)-->
	             	<a id="cta3"  href="javascript:GetAccountInfoExtras('E01COMCTC',document.forms[0].E01COMBNK.value,'RT',document.forms[0].E01COMCUN.value,'','','E01COMCRC','','','E01COMBRC','E01COMDRC','E01COMYRC','E01COMBKC')">
	             		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" >
	             	</a>
	             	<a id="pre3"  href="javascript:GetAccountInfoExtras('E01COMCTC',document.forms[0].E01COMBNK.value,'10',document.forms[0].E01COMCUN.value,'','','E01COMCRC','','','E01COMBRC','E01COMDRC','E01COMYRC','E01COMBKC')">
	             		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" >
	             	</a>	             	 
	       	    </td>
	            <td nowrap  align="right">Cuenta Contable: </td>
	            <td nowrap  align="left" colspan="2">
					<eibsinput:text  name="cdeObj" property="E01COMCCC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="true" readonly="<%=isReadOnly %>"/>
					<%if (!isReadOnly){ %>
					<!-- GetLedgerExtras(name, bnk, ccy, apc, desc, prodType,ccyback,desccy,bnkback)-->	            	
	            	<A id="con3" href="javascript:GetLedgerExtras('E01COMCCC','','','','E01COMDCC','','E01COMCRC','E01COMYRC','E01COMBKC')">
	            	<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Cuenta Contable" border="0" align="top">
					</A>
					<%} %> 
	       	        <input type="text" name="E01COMDCC" size="20" value="<%= cdeObj.getE01COMDCC().trim()%>" readonly>
	            </td>			
				<td nowrap  align="left">&nbsp;</td>            
	         </tr> 
	         <tr id="trclear"> 
	            <td nowrap  align="right">Banco: </td>
	            <td nowrap  align="left"> 
					<eibsinput:text  name="cdeObj" property="E01COMBKC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" required="true" readonly="<%=isReadOnly %>"/>	             	
	       	    </td>
	            <td nowrap  align="right">Sucursal: </td>
	            <td nowrap  align="left">
                	<eibsinput:help name="cdeObj" property="E01COMBRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"
               	    	fn_param_one="E01COMBRC" fn_param_two="document.forms[0].E01COMBKC.value" fn_param_three="E01COMDRC" readonly="<%=isReadOnly %>"/>
               	    	<input type="text" name="E01COMDRC" size="20" value="<%=cdeObj.getE01COMDRC()%>" readonly>                	    		            
	            </td>
				<td nowrap  align="right">Moneda: </td>
				<td nowrap  align="left">
					<input type="text" name="E01COMCRC" maxlength="3" size="4" value="<%=cdeObj.getE01COMCRC()%>" <%=isReadOnly?"readonly":""%>>
					<%if (!isReadOnly){ %>					
					<a id="linkHelp" href="javascript:GetCurrencyDesc('E01COMCRC','E01COMYRC','document.forms[0].E01COMBKC.value')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Moneda" align="bottom" border="0"/>
				     <%} %>  
				     <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/></a>
	       	        <input type="text" name="E01COMYRC" size="20" value="<%=cdeObj.getE01COMDRR()%>" readonly> 			
				</td>            
	         </tr>	         
	         
       	  </table>
		 </td>            
       </tr>                 
    </table>
                
       </td>
       </tr>
    </table>

</div> 

<div id="tab2">  <!-- Base de Datos y Adhesivos  -->

	
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap>
      	<% int f=0;%> 
     <b>Tipos de Adhesivos</b>	
      <table cellspacing="0" cellpadding="2" width="100%" border="1">
       <tr>
       <td>       
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		
			<tr id="trdark"> 
	            <td nowrap width="10%" align="right">Indicador Adhesivo: </td>
	            <td nowrap width="25%" align="left"> 
					<select name="E01COMICS" <%=isReadOnly?"disabled":""%> onchange="ChequearTipos(this)">
	                    <option value="0" <% if (cdeObj.getE01COMICS().equals("0")  ) out.print("selected"); %>>No Aplica</option>
	                    <option value="1" <% if (cdeObj.getE01COMICS().equals("1")  ) out.print("selected"); %>>Adhesivo  Físico</option>
	                    <option value="2" <% if (cdeObj.getE01COMICS().equals("2")  ) out.print("selected"); %>>Adhesivo  Virtual</option>              
	                </select>
	       	    </td>
	            <td nowrap width="10%" align="right">Tipo Adhesivo: </td>
	            <td nowrap width="25%" align="left">
	             	<input type="text" name="E01COMTPS" size="5" maxlength="4" value="<%= cdeObj.getE01COMTPS()%>">
	            	<a href="javascript:GetCodeDescCNOFC('E01COMTPS', 'E01COMDPS','YJ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" id="lupa1" ></a><img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0" id="chulo1"/>	            					
	       	        <input type="text" name="E01COMDPS" size="20" value="<%= cdeObj.getE01COMDPS().trim()%>" readonly>  
	            </td>
				<td nowrap width="10%" align="right">Subtipo Adhesivo: </td>
				<td nowrap width="20%" align="left">
				
				    <input type="text" name="E01COMSPS" size="5" maxlength="4" value="<%= cdeObj.getE01COMSPS()%>">
					<a href="javascript:GetCodeDescAuxCNOFC('E01COMSPS','E01COMDSP','YI',document.forms[0].E01COMTPS.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" id="lupa2" ></a><img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0" id="chulo2"/> 
				    <input type="text" name="E01COMDSP" size="20" value="<%= cdeObj.getE01COMDSP().trim()%>" readonly>	       	        
				</td>
	         </tr>
			<tr id="trclear"> 
	            <td nowrap width="10%" align="right">Reportes en efectivo: </td>
	            <td nowrap width="25%" align="left"> 
					<select name="E01COMERE" <%=isReadOnly?"disabled":""%>>
	                    <option value="Y" <% if (cdeObj.getE01COMERE().equals("Y")) out.print("selected"); %>>Si</option>
	                    <option value="N" <% if (cdeObj.getE01COMERE().equals("N") || cdeObj.getE01COMERE().equals("") ) out.print("selected"); %>>No</option>              
	                </select>
	       	    </td>
	            <td nowrap width="10%" align="right">&nbsp;</td>
	            <td nowrap width="25%" align="left">&nbsp;</td>
				<td nowrap width="10%" align="right">&nbsp;</td>
				<td nowrap width="20%" align="left">&nbsp;</td>            
	         </tr>	         		
		</table>
       </td>
       </tr>
       </table>
	<br>
     <b>Cargos</b>
      <table cellspacing="0" cellpadding="2" width="100%" border="1">
       <tr>
       <td>       		
		<table cellspacing="0" cellpadding="2" width="100%" border="0">	                  
			<tr id="trdark"> 
	            <td nowrap width="10%" align="right">Codigo Liq.<br>Comisiones: </td>
	            <td nowrap width="25%" align="left"> 
					<input type="text" name="E01COMTLC" maxlength="4" size="5" value="<%= cdeObj.getE01COMTLC().trim()%>" readonly="readonly">
					<a href="javascript:GetCommDefEx('E01COMTLC','E01COMDLC','E01COMVMT','E01COMVXT','E01COMPLC')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>					
	       	        <input type="text" name="E01COMDLC" size="20" value="<%= cdeObj.getE01COMDLC().trim()%>" readonly>  
	       	    </td>
	            <td nowrap width="10%" align="right">Periodicidad Liq.<br>de la Comisión: </td>
	            <td nowrap width="25%" align="left">
	            	<input type="text" name="E01COMPLC" maxlength="1" size="5" value="<%= cdeObj.getE01COMPLC().trim()%>" onchange="asignadescstatus(this.value)" onblur="asignadescstatus(this.value)" onfocus="asignadescstatus(this.value)" title="Valores Permitidos; D,W,B,M,Q,S,Y " readonly="readonly">					
	       	        <input type="text" name="E01COMDPL" size="20" value="<%= cdeObj.getE01COMDPL().trim()%>" readonly>  
	            </td>
				<td nowrap width="10%" align="right">Nro. Días Reciprocidad: </td>
				<td nowrap width="20%" align="left"> 
					<eibsinput:text name="cdeObj" property="E01COMNDR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS %>" required="true" readonly="<%=isReadOnly %>"/> 
				</td>            
	         </tr>	
			<tr id="trclear"> 
	            <td nowrap align="right">Valor Mínimo Cobro<br>por Transacción: </td>
	            <td nowrap align="left"> 
					<eibsinput:text name="cdeObj" property="E01COMVMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="<%=true%>"/> 
	       	    </td>
	            <td nowrap  align="right">Valor Máximo Cobro<br>por Transacción: </td>
	            <td nowrap  align="left">
					<eibsinput:text name="cdeObj" property="E01COMVXT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="<%=true %>"/>
	            </td>
				<td nowrap align="right">&nbsp; </td>
				<td nowrap width="20%" align="left"> 
					&nbsp;
				</td>            
	         </tr>	
			<tr id="trdark"> 
	            <td nowrap align="right">Tipo Consolidación<br> en el Extracto:  </td>
	            <td nowrap  align="left"> 
	 				<select name="E01COMCEC" <%=isReadOnly?"disabled":""%>>
	                    <option value="DETALLADO" <% if (cdeObj.getE01COMCEC().equals("DETALLADO") || cdeObj.getE01COMCEC().trim().equals("") ) out.print("selected"); %>>DETALLADO</option>
	                    <option value="CONSOLIDADO" <% if (cdeObj.getE01COMCEC().equals("CONSOLIDADO")) out.print("selected"); %>>CONSOLIDADO</option>                   
	                </select>
	       	    </td>
	            <td nowrap align="right">Tipo de Resumen en el Extracto:</td>
	            <td nowrap  align="left">
						<eibsinput:cnofc name="cdeObj" property="E01COMTCI" value="<%=cdeObj.getE01COMTCI()%>" required="true" flag="VE" fn_code="E01COMTCI" fn_description="E01COMDCI" readonly="<%=isReadOnly %>"/>
	       				<input type="text" name="E01COMDCI" size="20" value="<%= cdeObj.getE01COMDCI().trim()%>" readonly>
	            </td>
				<td nowrap  align="right">&nbsp; </td>
				<td nowrap  align="left"> 
					&nbsp;
				</td>            
	         </tr>
	         <tr id="trclear"> 
	            <td nowrap align="right">Resumen Información 0: </td>
	            <td nowrap align="left"> 
						<eibsinput:cnofc name="cdeObj" property="E01COMTR0" value="<%=cdeObj.getE01COMTR0()%>" required="true" flag="VO" fn_code="E01COMTR0" fn_description="E01COMTD0" readonly="<%=isReadOnly %>"/>
	       				<input type="text" name="E01COMTD0" size="20" value="<%= cdeObj.getE01COMTD0().trim()%>" readonly> 
	       	    </td>
	            <td nowrap  align="right">Resumen Información 1: </td>
	            <td nowrap  align="left">
						<eibsinput:cnofc name="cdeObj" property="E01COMTR1" value="<%=cdeObj.getE01COMTR1()%>" required="true" flag="VO" fn_code="E01COMTR1" fn_description="E01COMTD1" readonly="<%=isReadOnly %>"/>
	       				<input type="text" name="E01COMTD1" size="20" value="<%= cdeObj.getE01COMTD1().trim()%>" readonly>
	            </td>
				<td nowrap align="right">&nbsp; </td>
				<td nowrap width="20%" align="left"> 
					&nbsp;
				</td>            
	         </tr>
			<tr id="trdark"> 
	            <td nowrap align="right">Lista de Chequeo:  </td>
	            <td nowrap  align="left"> 
						<eibsinput:cnofc name="cdeObj" property="E01COMLCC" value="<%=cdeObj.getE01COMLCC()%>" required="true" flag="VP" fn_code="E01COMLCC" fn_description="E01COMLDC" readonly="<%=isReadOnly %>"/>
	       				<input type="text" name="E01COMLDC" size="20" value="<%= cdeObj.getE01COMLDC().trim()%>" readonly>
	       	    </td>
	            <td nowrap align="right">&nbsp; </td>
	            <td nowrap  align="left">&nbsp; </td>
				<td nowrap  align="right">&nbsp; </td>
				<td nowrap  align="left">&nbsp;</td>            
	         </tr>	         
	         	
        </table>
       </td>
       </tr>
       </table>
     <br>
     <b>Información del Contacto</b>       
      <table cellspacing="0" cellpadding="2" width="100%" border="1">
       <tr>
       <td>                
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
	         <tr id="trdark"> 
	            <td nowrap  align="right" colspan="1">Contacto Principal:</td>
	            <td nowrap  align="left" colspan="5"> 
						<eibsinput:text name="cdeObj" property="E01COMDCP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="true" readonly="<%=isReadOnly %>" />
						<%if (!isReadOnly){ %>
						<a href="javascript:GetCustomerContactRequest(document.forms[0].E01COMCUN.value,'E01COMDCP','E01COMECP','E01COMTCP')">
	              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
	              		<%} %> 
				</td>            
	         </tr> 
         
	         <tr id="trclear"> 
	            <td nowrap  align="right">Email:</td>
	            <td nowrap  align="left" colspan="3">
					<eibsinput:text name="cdeObj" property="E01COMECP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="true" readonly="<%=isReadOnly %>"/>
				</td>     			
	            <td nowrap align="right">Teléfono: </td>
	            <td nowrap  align="left"> 
					<eibsinput:text name="cdeObj" property="E01COMTCP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="true" readonly="<%=isReadOnly %>"/>					                    	
	            </td>
	         </tr>  	         
	         <tr id="trdark"> 
	            <td nowrap  align="right" colspan="1">Contacto Secundario: </td>
	            <td nowrap  align="left" colspan="5"> 
						<eibsinput:text name="cdeObj" property="E01COMNCS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="<%=isReadOnly %>" />
						<%if (!isReadOnly){ %>
						<a href="javascript:GetCustomerContactRequest(document.forms[0].E01COMCUN.value,'E01COMNCS','E01COMECS','E01COMTCS')">
	              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
	              		<%} %> 
				</td>            
	         </tr> 	         	        
	         <tr id="trclear"> 
	            <td nowrap  align="right">Email:</td>
	            <td nowrap  align="left" colspan="3">
					<eibsinput:text name="cdeObj" property="E01COMECS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false" readonly="<%=isReadOnly %>"/>
				</td>     			
	            <td nowrap align="right">Teléfono: </td>
	            <td nowrap  align="left"> 
					<eibsinput:text name="cdeObj" property="E01COMTCS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" readonly="<%=isReadOnly %>"/>					                    	
	            </td>       
	         </tr> 	         
	    </table>
       </td>
       </tr>
       </table>
 	 <br>
     <b id="Basedatos2" style="display:none;">Base de Datos</b>       	    
      <table cellspacing="0" cellpadding="2" width="100%" border="1" style="display:none;" id="Basedatos1">
       <tr>
       <td>        	    
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
        	 <tr id="trclear"> 
	            <td nowrap  align="right" colspan="2"><b>Validación Base de Datos: </b></td>
				<td nowrap  align="center" colspan="4">&nbsp;</td>	            
	         </tr>
	         <tr id="trdark"> 
	            <td nowrap  align="right" colspan="2">Entidad Valida Base de Datos: </td>
	            <td nowrap  align="left" colspan="2"> 
					<eibsinput:cnofc name="cdeObj" property="E01COMEVB" value="<%=cdeObj.getE01COMEVB()%>" required="true" flag="VC" fn_code="E01COMEVB" fn_description="E01COMDEB" readonly="<%=isReadOnly %>"/>
	       	        <input type="text" name="E01COMDEB" size="20" value="<%= cdeObj.getE01COMDEB().trim()%>" readonly>  	             	
	       	    </td>
				<td nowrap  align="right" >Tipo de Carga:</td>
				<td nowrap  align="left">
					<select name="E01COMTDB" <%=isReadOnly?"disabled":""%>>
	                    <option value="P" <% if (cdeObj.getE01COMTDB().equals("P")  ) out.print("selected"); %>>Carga Parcial</option>
	                    <option value="T" <% if (cdeObj.getE01COMTDB().equals("T")  ) out.print("selected"); %>>Carga Total</option>            
	                </select>
				</td>            
	         </tr>
	         <tr id="trclear"> 
	            <td nowrap  align="right" colspan="2">Número Convenio Red Externa: </td>
	            <td nowrap  align="left" colspan="2">
	                <input type="text" name="E01COMCIB" size="5" value="<%= cdeObj.getE01COMCIB().trim()%>" readonly>
	                <%if (!isReadOnly){ %>
					<a href="javascript:Get2FilterCodes('E01COMCIB','E01COMDIB','VD', '',document.forms[0]['E01COMEVB'].value)" >
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
					<%} %>
					<%=mandatory%>					
					<input type="text" name="E01COMDIB" size="20" maxlength="20" value="<%= cdeObj.getE01COMDIB().trim()%>"  readonly="readonly">
	       	    </td>
				<td nowrap  align="right">Canal de Comunicación<br>con el Cliente:</td>
				<td nowrap  align="left">
					<select name="E01COMTCB" <%=isReadOnly?"disabled":""%>>
	                    <option value="0" <% if (cdeObj.getE01COMTCB().equals("0")  ) out.print("selected"); %>>No Aplica</option>
	                    <option value="1" <% if (cdeObj.getE01COMTCB().equals("1")  ) out.print("selected"); %>>VPN</option>
						<option value="2" <% if (cdeObj.getE01COMTCB().equals("2")  ) out.print("selected"); %>>Webservices</option>
						<option value="3" <% if (cdeObj.getE01COMTCB().equals("3")  ) out.print("selected"); %>>Email</option>	                                
	                </select>				
				</td>            
	         </tr>
	         <tr id="trdark"> 
	            <td nowrap  align="right" colspan="2">URL o Ruta Cliente Acceso BD: </td>
	            <td nowrap  align="left" colspan="4">
					<eibsinput:text  name="cdeObj" property="E01COMRCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_WEB %>" required="false" size="100" maxlength="128" readonly="<%=isReadOnly %>"/> 	             	
	       	    </td>            
	         </tr>
	         <tr id="trclear"> 
	            <td nowrap  align="right" colspan="2">Usuario Habilitado BD: </td>
	            <td nowrap  align="left" colspan="2"> 					
	            	<eibsinput:text  name="cdeObj" property="E01COMUSH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_USER %>" required="false" size="20" maxlength="25" readonly="<%=isReadOnly %>"/>
	       	    </td>
				<td nowrap  align="right">Contraseña BD:</td>
				<td nowrap  align="left">
					<INPUT TYPE="password" SIZE=25 MAXLENGTH=64 NAME="E01COMPWD" autocomplete="off" value="<%= cdeObj.getE01COMDIB().trim()%>" <%=isReadOnly?"readonly":""%>>
				</td>            
	         </tr>	                  	         
       </table>
       </td>
       </tr>
       </table>
                   
       </td>
       </tr>
    </table>		
</div>		

<div id="tab3">  <!-- MODALIDAD DEL RECAUDO  -->
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="trdark"> 
	            <td nowrap align="right" width="30%">Modalidad de Recaudo: </td>
	            <td nowrap align="left" width="40%"> 
  					<select name="E01COMMDR" onclick="habDeshCiudades(this.value)" <%=isReadOnly?"disabled":""%>>
	                    <option value="NACIONAL" <% if (cdeObj.getE01COMMDR().equals("NACIONAL")  ) out.print("selected"); %>>NACIONAL</option>
	                    <option value="CIUDAD - OFICINA" <% if (cdeObj.getE01COMMDR().equals("CIUDAD - OFICINA")  ) out.print("selected"); %>>CIUDAD - OFICINA</option>                                
	                </select>
	       	    </td>          
	         </tr>	         	
        	 <tr id="trclear"> 
				<td nowrap  align="right">Lista Ciudades Recepción de Recaudos: </td>        	 
	            <td nowrap  align="left">
	            	<input id="EIBSBTN" type=button name="listaModalidad" value="Lista" onClick="golistaModalidad();" <%= disabled %>>
	            </td>	            
	         </tr>
	         	                  
          </table>
        </td>
      </tr>
    </table>
</div>
    
<div id="tab4">  <!-- Datos de Envió de Información al Cliente  -->
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF" >  
      <td nowrap> 
     			
     			<INPUT TYPE=HIDDEN NAME="E03MEIBNK" VALUE="<%= cdeObj.getE01COMBNK().trim()%>"><%//TODO: REVISAR SI VA AQUI.%>
     			<INPUT TYPE=HIDDEN NAME="E03MEICUN" VALUE="<%= cdeObj.getE01COMCUN().trim()%>">
     			<INPUT TYPE=HIDDEN NAME="E03MEINUM" VALUE="<%= cdeObj.getE01COMNUM().trim()%>">
     			<INPUT TYPE=HIDDEN NAME="E03MEIDCL" VALUE="<%= cdeObj.getE01COMDCL().trim()%>">
     			<INPUT TYPE=HIDDEN NAME="E03MEIIDN" VALUE="<%= cdeObj.getE01COMIDN().trim()%>">
     			<INPUT TYPE=HIDDEN NAME="GRABAR03" VALUE="N">
     			<INPUT TYPE=HIDDEN NAME="E03OPE" VALUE="<%= cdeObj3.getE03OPE().trim()%>">
     			<!-- CAMPOS Ocultos -->
     			<INPUT TYPE=HIDDEN NAME="E03MEICMM" VALUE="<%= cdeObj3.getE03MEICMM().trim()%>">
     			<INPUT TYPE=HIDDEN NAME="E03MEICDD" VALUE="<%= cdeObj3.getE03MEICDD().trim()%>">
     			<INPUT TYPE=HIDDEN NAME="E03MEICYY" VALUE="<%= cdeObj3.getE03MEICYY().trim()%>">
     			<INPUT TYPE=HIDDEN NAME="E03MEICTM" VALUE="<%= cdeObj3.getE03MEICTM().trim()%>">
				<INPUT TYPE=HIDDEN NAME="E03MEICUS" VALUE="<%= cdeObj3.getE03MEICUS().trim()%>">     			
     			                       
     			
     <b>Canales de Información</b>				
      <table cellspacing="0" cellpadding="2" width="100%" border="1">
       <tr>
       <td>      			
        <table cellspacing="0" cellpadding="2" width="100%" border="0">                
			<tr id="trdark"> 
	            <td nowrap align="right">Canal de Comunicacion con el Cliente: </td>
	            <td nowrap align="left">  
	                <INPUT TYPE=HIDDEN NAME="E03MEICCC_H" VALUE="<%=cdeObj3.getE03MEICCC()%>">			
	            	<select name="E03MEICCC" <%=isReadOnly?"disabled":""%>>
	                    <option value="0"  <% if (cdeObj3.getE03MEICCC().equals("0")  ) out.print("selected"); %>>No Aplica</option>
	                    <option value="1"  <% if (cdeObj3.getE03MEICCC().equals("1")  ) out.print("selected"); %>>VPN</option>
	                    <option value="2"  <% if (cdeObj3.getE03MEICCC().equals("2")  ) out.print("selected"); %>>WebServices</option>   
	                    <option value="3"  <% if (cdeObj3.getE03MEICCC().equals("3")  ) out.print("selected"); %>>Email</option>                      
	                </select>
	            </td>            
				<td nowrap align="right"></td>
				<td nowrap align="left">
       	        </td>
       	        <td nowrap align="left">&nbsp;</td>	
       	        <td nowrap align="left">&nbsp;</td>	
	         </tr>
			<tr id="trclear"> 
	            <td nowrap align="right">Tipo Estructura del Archivo:</td>
	            <td nowrap align="left">					
	            	<eibsinput:cnofc name="cdeObj3" property="E03MEITEA" value="<%=cdeObj3.getE03MEITEA()%>" required="true" flag="VF" fn_code="E03MEITEA" fn_description="E03MEIDEA" readonly="<%=isReadOnly %>"/>
	       	        <input type="text" name="E03MEIDEA" size="20" value="<%= cdeObj3.getE03MEIDEA().trim()%>" readonly>
	       	    </td>
	            <td nowrap align="right">Indicador de Multirecaudo:</td>
	            <td nowrap align="left">
	            	 <select name="E03MEIIMR" <%=isReadOnly?"disabled":""%>>
	                    <option value="Y"  <% if (cdeObj3.getE03MEIIMR().equals("Y")  ) out.print("selected"); %>>SI</option>
	                    <option value="N"  <% if (cdeObj3.getE03MEIIMR().equals("N") || cdeObj3.getE03MEIIMR().trim().equals("") ) out.print("selected"); %>>NO</option>                      
	                </select>
	            </td>
	        </tr>
			<tr id="trdark"> 
	            <td nowrap align="right">Hora Inicio Cambio de Jornada (HHMMSS):</td>
	            <td nowrap align="left">
	            	<eibsinput:text name="cdeObj3" property="E03MEICJI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="false" readonly="<%=isReadOnly %>" size="8" maxlength="6" />	            	  
	            </td>
	            <td nowrap align="right">Hora Cierre Cambio de Jornada (HHMMSS):</td>
	            <td nowrap align="left">
	            	<eibsinput:text name="cdeObj3" property="E03MEICJC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="false" readonly="<%=isReadOnly %>" size="8" maxlength="6"/>
	            </td>
	        </tr>  
		</table>
       </td>
       </tr>
       </table>
       
     <br>
     <b>Frecuencias de Envio</b>
       <table cellspacing="0" cellpadding="2" width="100%" border="1">
       <tr>
       <td> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark"> 
	            <td nowrap align="right">Periodicidad del Archivo:</td>
	            <td nowrap align="left">
		             &nbsp;&nbsp;&nbsp;&nbsp;
	            	<INPUT type="CHECKBOX" name="E03MEIPAD" value="Y" <% if (cdeObj3.getE03MEIPAD().equals("Y")) out.print(" checked"); %>
	            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%> >Diario
	            	&nbsp;&nbsp;&nbsp;&nbsp;
	            	<INPUT type="CHECKBOX" name="E03MEIPAH" value="Y" <% if (cdeObj3.getE03MEIPAH().equals("Y")) out.print(" checked"); %>
	            	onclick="showHide(this,'Y')" <%=isReadOnly?"disabled":""%> >Dia Habil
	            	&nbsp;&nbsp;&nbsp;&nbsp;
	            	<INPUT type="CHECKBOX" name="E03MEIPAP" value="Y" <% if (cdeObj3.getE03MEIPAP().equals("Y")) out.print(" checked"); %>
	            	onclick="showHide(this,'Y')"<%=isReadOnly?"disabled":""%> >Parcial
	            	&nbsp;&nbsp;&nbsp;&nbsp;
	            	<%=mandatory%>	            	  
	            </td>
	            <td nowrap align="right">&nbsp;</td>
	            <td nowrap align="left">&nbsp;</td>
	        </tr>
			   <tr id="rowDiario" style="display:none;" >
		 			<td nowrap  align="right" valign="middle"> Diario/Día Habil: </td>            
		            <td nowrap  align="left" colspan="3">
		            	&nbsp;&nbsp;&nbsp;&nbsp;
		            	<table width="100%" border="0">
		            		<tr>
		            			<td width="40%">
		            				 Fecha Siguiente de Envió:
		            			</td>
		            			<td width="50%">
		            				<eibsinput:date name="cdeObj3" fn_year="E03MEISDY" fn_month="E03MEISDM" fn_day="E03MEISDD" required="false" readonly="<%=isReadOnly %>"/>		            				
		            			</td>
		            			<td width="10%">
		            				<%=mandatory%>            			
		            			</td>
		            		</tr>
		            		<tr>
		            			<td >
		            				 Hora Inicio Envió Información (HHMMSS):
		            			</td>
		            			<td >
		            				<eibsinput:text name="cdeObj3" property="E03MEIHED" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="false" readonly="<%=isReadOnly %>" size="8" maxlength="6"/>
		            			</td>
		            			<td >
		            				<%=mandatory%>            			
		            			</td>
		            		</tr>            		
		            	</table>            
					</td>            
		         </tr> 

   				 <tr id="rowParcial" style="display:none;" >
		 			<td nowrap  align="right" valign="middle"> Parcial: </td>            
		            <td nowrap  align="left" colspan="3">
		            	&nbsp;&nbsp;&nbsp;&nbsp;
		            	<table width="100%" border="0">
		            		<tr>
		            			<td width="40%">
		            				 Fecha Siguiente de Envió:
		            			</td>
		            			<td width="50%">
		            				<eibsinput:date name="cdeObj3" fn_year="E03MEISPY" fn_month="E03MEISPM" fn_day="E03MEISPD" required="false" readonly="<%=isReadOnly %>"/> 
		            			</td>
		            			<td width="10%">
		            				<%=mandatory%>            			
		            			</td>
		            		</tr>
		            		<tr>
		            			<td >
		            				 Hora Inicio Envió Información (HHMMSS):
		            			</td>
		            			<td >
		            				<eibsinput:text name="cdeObj3" property="E03MEIHIP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="false" readonly="<%=isReadOnly %>" size="8" maxlength="6"/>
		            			</td>
		            			<td >
		            				<%=mandatory%>            			
		            			</td>
		            		</tr>
		            		<tr>
		            			<td >
		            				 Hora Final Envió Información (HHMMSS):
		            			</td>
		            			<td >
		            				<eibsinput:text name="cdeObj3" property="E03MEIHFP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="false" readonly="<%=isReadOnly %>" size="8" maxlength="6"/>
		            			</td>
		            			<td >
		            				<%=mandatory%>            			
		            			</td>
		            		</tr>
		            		<tr>
		            			<td >
		            				 Indicador Cálculo Acumulado / Transacciones:
		            			</td>
		            			<td >
						           	 	<select name="E03MEITAR" <%=isReadOnly?"disabled":""%>>
						           	 		<option value=""  <% if (cdeObj3.getE03MEITAR().trim().equals("") ) out.print("selected"); %>>No Aplica</option>
						                    <option value="A"  <% if (cdeObj3.getE03MEITAR().equals("A") ) out.print("selected"); %>>por Acumulado</option>
						                    <option value="T"  <% if (cdeObj3.getE03MEITAR().equals("T") ) out.print("selected"); %>>por Transaccion</option>                      
						                </select>
		            			</td>
		            			<td >
		            				<%=mandatory%>            			
		            			</td>
		            		</tr>
		            		<tr>
		            			<td >
		            				 Intervalo en Minutos Información:
		            			</td>
		            			<td >
		            				<eibsinput:text name="cdeObj3" property="E03MEIIHE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="false" readonly="<%=isReadOnly %>" size="4" maxlength="3"/>
		            			</td>
		            			<td >
		            				<%=mandatory%>            			
		            			</td>
		            		</tr>		            				            				            		            		
		            	</table>            
					</td>            
		         </tr>		         
			</table>
       </td>
       </tr>
       </table>
     <br>
     <b>Rutas de Envio</b>       
      <table cellspacing="0" cellpadding="2" width="100%" border="1">
       <tr>
       <td>        			
			<table cellspacing="0" cellpadding="2" width="100%" border="0">		         
			<tr id="trdark"> 
	            <td nowrap align="right">Ruta Cliente Envió Información:</td>
	            <td nowrap align="left" colspan="3">
	            	<eibsinput:text name="cdeObj3" property="E03MEIREI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="100" maxlength="128"/>	            	            	  
	            </td>
	        </tr>
			<tr id="trclear"> 
	            <td nowrap align="right">Nombre del Archivo de Salida:</td>
	            <td nowrap align="left" colspan="3">
	            	   <eibsinput:text name="cdeObj3" property="E03MEIISI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="40" maxlength="25"/>         	  
	            </td>
	        </tr>
	       <tr id="trdark"> 
	            <td nowrap align="right" >Usuario Habilitado:</td>
	            <td nowrap align="left">
	            	<eibsinput:text name="cdeObj3" property="E03MEIUSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="30" maxlength="25"/>
	            </td>
	            <td nowrap align="right">Contraseña:</td>
	            <td nowrap align="left">
	            	<INPUT TYPE="password" SIZE=40 MAXLENGTH=64 NAME="E03MEIPWD" autocomplete="off" value="<%= cdeObj3.getE03MEIPWD().trim()%>">	            	
	            </td>
	        </tr>	        	        	        		         
        </table>
       </td>
       </tr>
       </table>
               
        </td>
    </tr>
  </table>
</div>  
  
<div id="tab5">  <!-- Datos Definición de Código de Barras -->
    
 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">    	
        	 <tr id="trclear"> 
				<td nowrap  align="right" width="30%">Lista de Codigos de Barra : </td>        	 
	            <td nowrap  align="left" width="70%">
	            	<input id="EIBSBTN" type=button name="listaCodigoBarra" value="Lista" onClick="golistaCodigoBarraHeader();">
	            </td>	            
	         </tr>          
        </table>
      </td>
    </tr>
  </table>
</div>

<div id="tab6"> <!-- Datos Definición de Canales - Referencias  -->

 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">    	
        	 <tr id="trclear"> 
				<td nowrap  align="right" width="30%">Lista de Referencias - Canales : </td>        	 
	            <td nowrap  align="left" width="70%">
	            	<input id="EIBSBTN" type=button name="listaCanales" value="Lista" onClick="golistaCanales();">
	            </td>	            
	         </tr> 
	         <tr id="trclear"> 
				<td nowrap  align="right" width="30%">Dependencias : </td>        	 
	            <td nowrap  align="left" width="70%">
	            	<input id="EIBSBTN" type=button name="listaDependecias" value="Lista" onClick="golistaDependencias();">
	            </td>	            
	         </tr>
        </table>
      </td>
    </tr>
  </table>
</div>

</div>  <!-- Fin de Tabs  -->

<% 	if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")) { %>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1" >Aceptar con Avisos</td>
    	</tr>
  	</table>    
    
    <table width="100%">		
	<tr>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Guardar" onClick="goAction(450);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Exit" value="Regresar" 
			<% if ("D".equals(userPO.getType())) {%>
			    onClick="goAction(100);" 
			<% } else { %>
				onClick="goAction(200);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>
	</table>
<% }else if (userPO.getPurpose().equals("INQUIRY")){%>
 <table width="100%">		
	<tr>  	
  		<td width="100%"> 
  		  <div align="center">   		       
				<input id="EIBSBTN" type=button name="Exit" value="Regresar" onClick="goAction(200);"> 
     	  </div>	
  		</td>
  	</tr>
	</table>
<% }else if (userPO.getPurpose().equals("APPROVAL")){%>
 <table width="100%">		
	<tr>  	
  		<td width="100%" class="tdbkg"> 
  		  <div align="center">
			   <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a> 
     	  </div>	
  		</td>
  	</tr>
	</table>
<%} %>
	</td>
  	</tr>	
  </table>	
  
  </form>
</body> 

<SCRIPT type="text/javascript">
<% 	if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")) { %>   
    //document.forms[0].Submit.focus(); 
<% } %>    
  
  habDesAceptaDebitoCredito(document.forms[0].E01COMDOC.value);
  
  if (document.forms[0].E01COMMCF.checked) excluye(document.forms[0].E01COMMCF);
  if (document.forms[0].E01COMMSF.checked) excluye(document.forms[0].E01COMMSF);

  if (document.forms[0].E01COMCBS.checked) excluye(document.forms[0].E01COMCBS);
  if (document.forms[0].E01COMMCB.checked) excluye(document.forms[0].E01COMMCB);
  if (document.forms[0].E01COMCBP.checked) excluye(document.forms[0].E01COMCBP);
  
  if (document.forms[0].E01COMBDL.checked) excluye(document.forms[0].E01COMBDL);
  if (document.forms[0].E01COMBDE.checked) excluye(document.forms[0].E01COMBDE);
  if (document.forms[0].E01COMBDO.checked) excluye(document.forms[0].E01COMBDO);
      
  showHide(document.forms[0].E01COMIRM,'N');
  showHide(document.forms[0].E01COMFCB,'N');
  showHide(document.forms[0].E01COMVBD,'N');  
  showHide(document.forms[0].E01COMFPG00[1],'N');
  showHide(document.forms[0].E01COMFPG00[7],'N');
  HabilitarConvenioGrupo(document.forms[0].E01COMNVG.value);
  
    //colocando solo lectura los campos de fecha inicio y fecha fin.
    
  document.forms[0].E01COMVIY.readOnly = true;
  document.forms[0].E01COMVIM.readOnly = true;
  document.forms[0].E01COMVID.readOnly = true;

  document.forms[0].E01COMVFY.readOnly = true;
  document.forms[0].E01COMVFM.readOnly = true;
  document.forms[0].E01COMVFD.readOnly = true;
  
  //habilitar para la pantalla 3
  showHide(document.forms[0].E03MEIPAD,'N');
  showHide(document.forms[0].E03MEIPAH,'N');
  showHide(document.forms[0].E03MEIPAP,'N'); 
  habDeshCiudades(document.forms[0].E01COMMDR.value);
  BorraDatosCuenta(document.forms[0].E01COMTCR,false);
  BorraDatosCuenta(document.forms[0].E01COMTCE,false);
  BorraDatosCuenta(document.forms[0].E01COMTCC,false);
  
  ceroIzquierda(document.forms[0].E03MEICJI);
  ceroIzquierda(document.forms[0].E03MEICJC);
  ceroIzquierda(document.forms[0].E03MEIHED);
  ceroIzquierda(document.forms[0].E03MEIHIP);
  ceroIzquierda(document.forms[0].E03MEIHFP);
  ChequearTipos(document.forms[0].E01COMICS);
  
  //colocando solo lectura los campos de fecha.
  document.forms[0].E03MEISDY.readOnly = true;
  document.forms[0].E03MEISDM.readOnly = true;
  document.forms[0].E03MEISDD.readOnly = true;

  document.forms[0].E03MEISPY.readOnly = true;
  document.forms[0].E03MEISPM.readOnly = true;
  document.forms[0].E03MEISPD.readOnly = true;
  
</SCRIPT>

</html>
