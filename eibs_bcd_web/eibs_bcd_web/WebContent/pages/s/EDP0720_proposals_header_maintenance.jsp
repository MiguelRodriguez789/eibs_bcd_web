<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Propuesta de Crédito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"	rel="stylesheet">

<jsp:useBean id="bComments" class="datapro.eibs.beans.JBCreditProposalComm"  scope="session" />
<jsp:useBean id="EDP072101Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="EDP072601Help" class="datapro.eibs.beans.JBObjList" scope="session" />

<jsp:useBean id="msgRT" class="datapro.eibs.beans.EDP072001Message" scope="session" />
<jsp:useBean id="EDP073701Help" class="datapro.eibs.beans.JBObjList" scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<jsp:useBean id="optLP4" class="datapro.eibs.beans.JBList" scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<jsp:useBean id="ga0726" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="ga0726T" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="gaCodeList" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="gaList" class="datapro.eibs.beans.JBListRec" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<%
	boolean isNew = true;
	String readonly = "";
	String disabled = "";
		
	if (!"N".equals(request.getParameter("NEW"))){
		isNew = false;
		readonly = "readonly";
		disabled = "disabled";
	}
	
%>

<SCRIPT type="text/javascript">

	builtNewMenu(pc_optionHeader);  
	initMenu(); 
	
	//Options Menu
	var customer = "<%=msgRT.getE01CUSCUN().trim()%>";
	var custName = "<%=msgRT.getE01CUSNA1().trim()%>";
	var propuesta = "<%=msgRT.getE01PLPNPR().trim()%>";
	
	function callFormPDF() {
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000PDF?SCREEN=1&OPE_CODE=01&APP_CODE=PC&ACCOUNT=" + propuesta;
    	CenterNamedWindow(page, 'Information', 700, 500, 2);
	}
	function callInfF() {
    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0730?SCREEN=200&OPT=5&E01IFMCUN=" + customer;
    	CenterNamedWindow(page, 'Information', 700, 600, 2);
	}

	function callCupo() {
    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0110?SCREEN=1&customer="+customer;
    	CenterNamedWindow(page, 'Information', 700, 600, 2);
	}
	
	function callPosition() {
    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=5&CUSTOMER="+customer;
    	CenterNamedWindow(page, 'Information', 650, 500, 2);
	}

	function callDocum() {
		var TABLE_NUM = document.forms[0].TABLE_NUM1.value;   
   		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=S&TABLE_NUM="+TABLE_NUM+"&IDENTIFIER="+propuesta+"&CusName="+custName;
		if (<%="5".equals(userPO.getHeader16())%>) {
    		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=S&TABLE_NUM="+TABLE_NUM+"&IDENTIFIER="+propuesta+"&CusName="+custName;
		}
   		CenterNamedWindow(page, 'Information', 650, 500, 2);
	}
	function callCust() {
	var customer = getElement("E01CUSCUN").value;    
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=600&E01CUN="+customer;
    	CenterNamedWindow(page,'Information',650,500,2);
	}
	function callEntid() {
	var customer = getElement("E01CUSCUN").value;    
	if (<%="5".equals(userPO.getOption())%>) {
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD2080?SCREEN=900&E01CUN="+customer;
    	CenterNamedWindow(page,'Information',650,500,2);
		}else{
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD2080?SCREEN=500&E01CUN="+customer;
    	CenterNamedWindow(page,'Information',650,500,2);
		}
	}

	function callGuard() {
    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0725?SCREEN=200"
    			+ "&NPR=" + propuesta
    			+ "&CUN=" + customer
				+ "&NAM=" + custName
				+ "&opt=2";
    	CenterNamedWindow(page, 'Information', 650, 500, 2);
	}

	function callImpP() {
		document.forms[0].PROP.value = document.forms[0].E01PLPNPR.value;
		document.forms[0].FMT.value = "H";
    	document.forms[0].SCREEN.value = "730";
		document.forms[0].submit();		  	       	       

	}

	function callSegP() {
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0750?SCREEN=300&PROP="+ propuesta;
    	CenterNamedWindow(page, 'Information', 700, 500, 2);
	}

	function callPayS() {
		<% 	
			String prod = "";
	  		
	  		EDP072101Help.initRow();
	  		if (EDP072101Help.getNextRow()) {
	  			datapro.eibs.beans.EDP072101Message msgList = (datapro.eibs.beans.EDP072101Message) EDP072101Help.getRecord();
	  			prod =  msgList.getField("E01PLTPRO").getString().trim();
	  		}
	  		
	  	%>
    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=8&Type=P&PROP=" + propuesta
    														+"&CUN="
        													+ customer
        													+"&NAM="
        													+ custName
        													+"&PROD="
        													+ "<%=prod%>";
		CenterNamedWindow(page, 'Information', 700, 500, 2);
	}

	function callCreditScor() {
		var option = document.forms[0].OPTION.value;
    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0883?SCREEN=100&NPR="+ propuesta
    														+"&CUN="
        													+ customer
        													+"&CUNAM="
        													+ custName
        													+"&OPTION="
        													+ option;
    	CenterNamedWindow(page, 'Information', 700, 600, 2);
	}

	function callDebtOthers() {
		var option = '5';
    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0800?SCREEN=200&NPR="+ propuesta
    														+"&E01DUECUN="
        													+ customer
        													+"&E01DUENA1="
        													+ custName
        													+"&OPTION="
        													+ option;
    	CenterNamedWindow(page, 'Information', 650, 500, 2);
	}

	function callSummaryCreditScor() {
		var option = document.forms[0].OPTION.value;
    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0886?SCREEN=100&NPR="+ propuesta
    														+"&CUN="
        													+ customer
        													+"&CUNAM="
        													+ custName
        													+"&OPTION="
        													+ option;
    	CenterNamedWindow(page, 'Information', 700, 600, 2);
	}

	function callAmountCreditScor() {
		var option = document.forms[0].OPTION.value;
    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0882?SCREEN=100&NPR="+ propuesta
    														+"&CUN="
        													+ customer
        													+"&CUNAM="
        													+ custName
        													+"&OPTION="
        													+ option;
    	CenterNamedWindow(page,'Information',700,600,2);
	}

	function callInfBasic() {
		document.forms[0].PROP.value = document.forms[0].E01PLPNPR.value;
    	document.forms[0].SCREEN.value = "500";
    	document.forms[0].opt.value = "9";
		document.forms[0].submit();		  	       	       

	}
	//End Options	

	function showCollItems(idx) {
	  	document.forms[0].COLLCODW.value = idx;
	  	var dataTable = document.getElementById("dataTable");
	  	for ( var i=0; i<dataTable.rows.length; i++ ) {
	       dataTable.rows[i].className="trnormal";
	    }
	   	dataTable.rows[idx].className="trhighlight"; 
	}

	function showCollItemsRD(idx, TNU) {
	  	document.forms[0].DOCSEL.value = idx;
	  	document.forms[0].TABLE_NUM.value = TNU;
	  	var dataTableRD = document.getElementById("dataTableRD");
	  	for ( var i=0; i<dataTableRD.rows.length; i++ ) {
	       dataTableRD.rows[i].className = "trnormal";
	    }
	   	dataTableRD.rows[idx].className="trhighlight"; 
	}

	function procRecaudoDocumento(value){
 		if (value) {
   			document.getElementById("SecRecaudoDocumento").style.display = "none";
   		} else {
   			document.getElementById("SecRecaudoDocumento").style.display = ""; 
  	 	}
	}

	function procRegistroGarantia(value){
		 if (<%=msgRT.getE01DPZDXX().trim().equals("1")%>) {
	 		if (value) {
	   			document.getElementById("SecRegistroGarantia").style.display="none";
	   		} else {
	   			document.getElementById("SecRegistroGarantia").style.display=""; 
	   		}
 		}
	}

	function procDocGarantia(value){
		if (<%=msgRT.getE01DPZDXX().trim().equals("1")%>) {
 			if (value) {
   				document.getElementById("SecDocGarantia").style.display="none";
   			} else {
   				document.getElementById("SecDocGarantia").style.display=""; 
   			}
 		}
	}

	function goConfirm(opt, PARAM) {
		document.forms[0].OPECOD.value = "0004";
		document.forms[0].PARAM.value = PARAM;

		var op = opt;  	  
		document.forms[0].opt.value = op;

		var error = 0;
		var smsg = "";
		var emsg = "";
		var smsg1 = "";
		var emsg1 = "";
	
		if ("<%=msgRT.getE01DPPCOM().trim()%>" == "1") { 
	
			if (document.forms[0].E01DPSCOM.value == "") { 
				smsg1 = 'Especifique comentarios de '+"<%=msgRT.getE01XXXEJ1().trim()%>";
				emsg1 = 'Specify comments of '+"<%=msgRT.getE01XXXEJ1().trim()%>";
				error = 1;
			}
		}

		if (document.forms[0].E02DPAC99.value == "") { 
			smsg = 'Especifique comentarios de Análisis de Credito';
			emsg = 'Specify Credit Analysis comments';
			error = 1;
			document.forms[0].E02DPAC99.focus(); 		
		}

		if (error  == 0){
    
			switch (op) {
			case  "1": 
			    document.forms[0].PARAM.value = "1-1-1";
				break; 
			case  "2":
			 	break;   
			case  "3":  
				ok = confirm(smsg1 + " Eliminar " + smsg2);
			    document.forms[0].SCREEN.value="630";
			 	break;
			}
	
			document.forms[0].OPECOD.value = "0004";
	    	document.forms[0].SCREEN.value="600";
	
			document.forms[0].submit();		  	       	       

		} else {
			if (document.forms[0].LAN.value == 'S') {
				alert(smsg+"\n\n"+smsg1+"\n\n");
			} else {
				alert(emsg+"\n\n"+emsg1+"\n\n");
			}
		}
	}

	function goControlDoc(opt) {

		var error = 0;
		var smsg = "";
		var emsg = "";
		var smsg1 = "";
		var smsg2 = "";
		var smsg3 = "";
		var emsg1 = "";
		var emsg2 = "";
		var emsg3 = "";
		
		if (<%=(gaCodeList.getNoResult())%>) {
			smsg = 'Debe adicionar un producto para esta propuesta \n\n';
			emsg = 'It should add a product for this proposal\n\n';
			error = 1;
		}
	
		if (document.forms[0].E01CUSCUN.value == 0) {
			smsg3 = 'Debe Asignar un numero de cliente \n\n';
			emsg3 = 'It Should Assign client number \n\n';
			error = 1;
		}
	
		if (document.forms[0].E01CUSNA1.value == 0) {
			smsg3 = 'Error en datos del cliente \n\n';
			emsg3 = 'Error in client data \n\n';
			error = 1;
		}
		
		var op = opt;  
		switch (op) {
		case  "1": 	document.forms[0].OPECOD.value = "0001";
		            document.forms[0].PARAM.value = "1-1-1";
	
		 			break; 
		case  "2":  //ok = confirm(msg1 + " Actualizar " + msg2);
		            //document.forms[0].SCREEN.value="600";
		 			break;   
		case  "3":  if (document.forms[0].LAN.value == 'S') {
						ok = confirm(smsg1 + " Eliminar " + smsg2);
					} else {
						ok = confirm(emsg1 + " Delete " + emsg2);
					};
		            document.forms[0].SCREEN.value="630";
		 			break;
		};

		if (op != "1") {
			if (document.forms[0].E02DPAC99.value == "") { 
				smsg1 = 'Especifique comentarios de Análisis de Credito';
				emsg1 = 'Specify Credit Analysis comments';
				error = 1;
				document.forms[0].E02DPAC99.focus();	
			}
	
			if ("<%=msgRT.getE01DPPCOM().trim()%>" == "1") {
				if (document.forms[0].E01DPSCOM.value == "") { 
				smsg2 = 'Especifique comentarios de '+"<%=msgRT.getE01XXXEJ1().trim()%>";
				emsg2 = 'Especify comments of '+"<%=msgRT.getE01XXXEJ1().trim()%>";
				error = 1;
				}
			}
		}

		if (error  == 0){

    		ok = confirm("Esta seguro que desea avanzar a esta actividad?");
			if (ok) {

				document.forms[0].SCREEN.value="600";
				document.forms[0].submit(); 
			}

		} else {
			if (document.forms[0].LAN.value == 'S') {
				alert(smsg+smsg1+smsg2+smsg3);
			} else {
				alert(emsg+emsg1+emsg2+emsg3);
			}
		}
	}
	
	function limitText(limitField, limitNum) {

		if (limitField.value.length > limitNum + 1) { 
			if (document.forms[0].LAN.value == 'S') {
				alert('Límite de texto excedido');
			} else {
				alert('Your input has been truncated');
			}	
		}		
		if (limitField.value.length > limitNum) {
			limitField.value = limitField.value.substring(0, limitNum);
		}
	}

	function goCancel(fmt) {
		document.forms[0].SCREEN.value="100";
		document.forms[0].submit(); 
	}

	function moveOver() {
		var selectedItem = document.forms[0].available.selectedIndex;
		if (selectedItem > -1) {
			var selectedText = document.forms[0].available.options[selectedItem].text;
			var selectedValue = document.forms[0].available.options[selectedItem].value;
   			document.forms[0].E01DPPPXX.value = selectedValue;
   			document.forms[0].E01DPPDXX.value = selectedText;
		}
	}
	
// ACTUALIZA GARANTIA
	function updGuar(value, prdg, typg, doc) {
		document.forms[0].PRDG.value = prdg;
		document.forms[0].TYPG.value = typg;
		document.forms[0].REGG.value = doc;
		document.forms[0].TGAR.value = "G";
		document.forms[0].SCREEN.value = "710";
		document.forms[0].submit();
	}
	

// ACTUALIZA GARANTIA
	function updGuarT(value, prdg, typg, doc){
		document.forms[0].PRDG.value = prdg;
		document.forms[0].TYPG.value = typg;
		document.forms[0].REGG.value = doc;
		document.forms[0].TGAR.value = "T";
		document.forms[0].SCREEN.value = "710";
		document.forms[0].submit();
	}
	
// TRABAJA CON CAMPOS CREADOS DINAMICAMENTE
	function asigDat(name) {
		var DPUBCHK =  getElement("E01DPUB" + name).checked;
		if (DPUBCHK) {
			getElement("E01DPUB" + name).value = 1;
		}
	}
	
	function goAction(op) {
		switch (op) {
		case 1: 
			document.forms[0].opt.value = op;
		    document.forms[0].SCREEN.value = "210";
		    document.forms[0].submit();
			break; 
		case 2: 
			document.forms[0].opt.value = op;
		    document.forms[0].SCREEN.value = "220";
		    document.forms[0].submit();
			break;   
		case 3: 
		  	if (confirm("Esta seguro que desea eliminar el registro seleccionado?")) {
		       	document.forms[0].opt.value = op;
		       	document.forms[0].SCREEN.value = "230";
		    	document.forms[0].submit();
		    }
			break;   
		}
	}

	function goActionProd(op) {
		document.forms[0].optH.value = op;
	    switch (op) {
	    case 1 :    
	    	//ingreso 
			if (document.forms[0].E01CUSCUN.value == 0) {
				alert('Debe Asignar un numero de cliente \n\n');
			} else {
				document.forms[0].OPPRODUCT.value = 1;
		       	document.forms[0].SCREEN.value = "410";
		       	document.forms[0].submit();
			}
	        break;
	    case 2 :
	    	//modificion
		    document.forms[0].OPPRODUCT.value = 2;
	        document.forms[0].SCREEN.value = "420";
	        document.forms[0].submit();
            break;
	    case 3 :
            //consulta 
             document.forms[0].OPPRODUCT.value = 3;
	         document.forms[0].SCREEN.value = "420";
	         document.forms[0].submit();
            break;
	    default : 
            document.forms[0].OPPRODUCT.value = 0;
            break;
	    }
 	}
 	
// RETRIEVE CUSTOMER INFORMATION FOR NEW PROPOSAL
 	function retCustInf() {
 		if (isValidObject(getElement("E01PLPPTY9"))) {
		    document.forms[0].E01PLPPTY.value = document.forms[0].E01PLPPTY9.value;
		    document.forms[0].SCREEN.value = "720";
			document.forms[0].submit();   
 		}
 	}

	function goDOFA(op) {
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0720?SCREEN=800&opt=" + op;
		CenterWindow(page,800,600,2);
	}
	
	
 	function goRetrComm() {
 		// traer texto comentarios
 		var text = "<%=bComments.getComRecomendacionesInstanciasResolutivas()%>";
		document.forms[0].E01DPSCOM.value = text.replace(/¶/gi, "\n");
	}
 	
 	function hideAMT(){
    	document.getElementById("AMT").style.visibility = "hidden";
 	}

	
 	function cancelBub() {
  		event.cancelBubble = true;
 	}

	addEventHandler(document, 'click', hideAMT);
 	
	function init() {
		// texto comentarios
 		var text = "<%=bComments.getCapacidadPago()%>";
		getElement("E02DPAC99").value = text.replace(/¶/gi, "\n");
		
 		text = "<%=!error.getERRNUM().equals("0") ? bComments.getComRecomendacionesInstanciasResolutivas() : ""%>";
		document.forms[0].E01DPSCOM.value = text.replace(/¶/gi, "\n");
		
		// asume siguiente actividad cuando hay una sola actividad para seleccionar si no es apertura
		if (isValidObject(getElement("available")) && getElement("available").value != 0) {
			var boxLength = getElement("available").length;
			if (boxLength == 1) {
		   		var selectedText = document.forms[0].available.options[0].text;
		   		var selectedValue = document.forms[0].available.options[0].value;
		   		document.forms[0].E01DPPPXX.value = selectedValue;
		   		document.forms[0].E01DPPDXX.value = selectedText;
			}

	  		boxLength = document.forms[0].E01PLPBRN.length;
	  		document.forms[0].E01PLPBRN.selectedIndex = 0;
	  		if (boxLength > 0) {
	   			for (var i = 0; i < boxLength; i++) {
	    			var thisvalue = document.forms[0].E01PLPBRN.options[i].value;
	      			if (thisvalue == document.forms[0].BRN.value) {
		     			document.forms[0].E01PLPBRN.selectedIndex = i;
		     			break;
	      			}
	     		}
			}
		}	

		// SOLO MUESTRA GARANTIAS POR ESTADO = 70
		var pty = "<%=msgRT.getE01PLPPTY().trim()%>";

   		if (<%="1".equals(userPO.getHeader16()) && "".equals(msgRT.getE01PLPPTY())%>) { 
			procRecaudoDocumento(true);
			procRegistroGarantia(true);
			procDocGarantia(true);
		} else {		
	    	if (pty == "1") {	
	    		procRecaudoDocumento(false);
				procRegistroGarantia(false);
				procDocGarantia(false);
			} else {
		    	procRecaudoDocumento(true);
		    	procRegistroGarantia(true);
		    	procDocGarantia(true); 	
			}
		}

		if ( isValidObject(getElement("dataTable"))) {
			resizeDoc();
		}

		if ( isValidObject(getElement("dataTable2"))) {
			resizeDoc2();
		}

		if ( isValidObject(getElement("dataTable3"))) {
			resizeDoc3();
		}
	}
	
</script>


</head>
<body onload="init()">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
%>
	<SCRIPT type="text/javascript">
		showErrors();
	</SCRIPT>
<%
	}
%>

<H3 align="center">Propuesta de Cr&eacute;dito<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="proposals_header_maintenance.jsp, EDP0720"></H3>
<hr size="4">

<form method="post"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0720">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600"> 
	<INPUT TYPE=HIDDEN NAME="OPTION" VALUE="<%=userPO.getOption()%>"> 
	<INPUT TYPE=HIDDEN NAME="opt" VALUE="<%=userPO.getHeader16().trim()%>"> 
	<INPUT TYPE=HIDDEN NAME="optH" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="optH1"	VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="PROP" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="FMT" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="OPPRODUCT"	VALUE=""> 
	<INPUT type=HIDDEN name="E01PLPPTY"	value="<%=msgRT.getE01PLPPTY().trim()%>"> 
	<INPUT type=HIDDEN name="TIPPROPUESTA" value="<%=msgRT.getE01PLPPTY().trim()%>"> 
	<input type=HIDDEN name="OPECOD" value=""> 
	<input type=HIDDEN name="PARAM"	value="<%=msgRT.getE01DPWPAR().trim()%>"> 
	<input type=HIDDEN name="TASK" value="<%=userPO.getHeader23().trim()%>"> 
	<input type=HIDDEN name="E01YYYFIL" value="<%=msgRT.getE01YYYFIL().trim()%>"> 
	<input type=HIDDEN name="AGD" value="<%=msgRT.getE01PLPAGD().trim()%>"> 
	<input type=HIDDEN name="pos" value="<%=msgRT.getE01RECPOS().trim()%>"> 
	<INPUT TYPE=HIDDEN NAME="COLLCODW" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="CCOD" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="ICOD" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0"> 
	<INPUT TYPE=HIDDEN NAME="PRDG" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="TYPG" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="REGG" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="TGAR" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="CCODRD" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="DOCSEL" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="TABLE_NUM" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="LAN" value="<%=msgRT.getE01CNTLAN().trim()%>"> 
	<input type=HIDDEN name="E01DPWOPC" value="<%=msgRT.getE01DPWOPC().trim()%>"> 
	<input type=HIDDEN name="E01PLPRUT" value="<%=msgRT.getE01PLPRUT().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FILEST" VALUE="<%=userPO.getHeader20().trim()%>"> 
	<%-- E01CRTACT ES EL CODIGO DE ACTIVIDAD ACTUAL A PROCESAR. E01PLPACT ES EL CODIGO DE ACTIVIDAD ANTERIOR --%>
	<input type=HIDDEN name="E01CRTACT" value="<%=msgRT.getE01CRTACT().trim()%>">
<%
	if (userPO.getHeader16().equals("1")) {
%>
	<input type=HIDDEN name="E01DPPPXX" value=""> 
	<input type=HIDDEN name="E01DPPDXX" value=""> 
	<input type=HIDDEN name="E01PLPSRU" value="<%=msgRT.getE01PLPSRU().trim()%>"> 
	<input type=HIDDEN name="E01PLPACT" value="<%=msgRT.getE01PLPACT().trim()%>">
<%
	}
%>
	<input type=HIDDEN name="E01DEARRC"	value="<%=msgRT.getE01DEARRC().trim() %>">
<%
	if (userPO.getHeader16().equals("1")) {
%>
		<P align="center"><input type="text" name="DSC1" size="45" maxlength="45"
			value="<%= userPO.getHeader16().equals("1") ? "APERTURA NUEVA PROPUESTA" : "" %>" readonly style="text-align: center;"></P>
<%
	} else {
%>
		<P align="center"><INPUT type="text" name="DSC" size="45" maxlength="45"
			value="<%=msgRT.getE01PLPPSR()%>-<%=msgRT.getE01DESAC2()%>" readonly style="text-align: center;"></P>

<%
	}
%>

<div id="AMT"
	style="position: absolute; visibility: hidden; left: 0px; top: -10px; z-index: 3; filter: progid : DXImageTransform . Microsoft . Fade(duration=1 .0, overlap=1 .0)"
	onclick="cancelBub()">
<TABLE class=tbhelp
	style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-color: #0b23b5; border-style: solid solid solid solid; filter: progid : DXImageTransform . Microsoft . dropshadow(OffX=3, OffY=3, Color='gray', Positive='true')">
	<tr bordercolor="#FFFFFF">
		<td nowrap width="750">

		<TABLE id="tbenter" align="center" style="width: 100%; border-color: transparent;">
			<TBODY>
				<TR>
					<TD width="100%">
					<div align="left">Observacion:</div>
					<input type="text" name="E01DPOBSR" size="81" maxlength="80" value=""
						<%if (userPO.getHeader16().equals("5")) {out.print("readonly");}%>>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		</td>
	</tr>
</TABLE>
</div>

<h4>Propuesta</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="3" width="100%" border="0">

			<tr id="trdark">
				<td width="15%">
				<div align="right">Tipo de Propuesta</div>
				</td>

				<td width="30%" colspan="1">
					<input type="radio" name="E01PLPPTY9" value="1" disabled
						<%if (msgRT.getE01PLPPTY().equals("1"))	out.print("checked");%>>Solicitud 
				</td>
				<td width="50%" align="left">Estado Propuesta: <INPUT type="text"
					name="E01XXXEST" size="35" maxlength="35"
					value="<%=msgRT.getE01XXXEST().trim()%>" readonly></td>

			</tr>

			<tr id="trdark">
				<td width="15%">
				<div align="right">N&uacute;mero:</div>
				</td>

				<td width="30%"><INPUT type="text" name="E01PLPNPR" size="12"
					maxlength="12" value="<%=msgRT.getE01PLPNPR().trim()%>" readonly></td>
				<td width="50%" align="left">Fecha Apertura: <INPUT type="text"
					name="E01PLPIPD" size="2" maxlength="2"
					value="<%=msgRT.getE01PLPIPD().trim()%>" readonly> <INPUT
					type="text" name="E01PLPIPM" size="2" maxlength="2"
					value="<%=msgRT.getE01PLPIPM().trim()%>" readonly> <INPUT
					type="text" name="E01PLPIPY" size="5" maxlength="4"
					value="<%=msgRT.getE01PLPIPY().trim()%>" readonly></td>
			</tr>

			<tr id="trdark">
				<td width="15%" align="right">Banco</td>
				<td width="30%"><%if (userPO.getHeader16().equals("x")) {%> <input
					type="text" name="E01PLPBNK" size="3" maxlength="2" value=""
					onKeypress="enterInteger(event)"> <a
					href="javascript:GetBank('E01PLPBNK','')"> <img
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda"
					align="bottom" border="0"></a> <%} else {%> <input type="text"
					name="E01PLPBNK" size="3" maxlength="2"
					value="<%=msgRT.getE01PLPBNK().trim()%>" readonly> <%};%></td>
				<td width="50%" align="left">Sucursal de Apertura: <input
					type="text" name="E01PLPBRN" size="5" maxlength="4"
					value="<%=msgRT.getE01PLPBRN().trim()%>" readonly></td>

			</tr>

			<tr id="trdark">
				<td width="15%">
				<div align="right">C&oacute;digo Ejecutivo:</div>
				</td>
				<td width="30%"><input type="text" name="E01PLPAID" size="12"
					maxlength="10" value="<%=msgRT.getE01PLPAID().trim()%>" readonly> <INPUT
					type="text" readonly name="E01XXXAID" size="24" maxlength="24"
					value="<%=msgRT.getE01XXXAID().trim()%>"></td>
				<td width="50%" align="left">Sujeto de Crédito <input type="text"
					name="E01PLPCN2" size="5" maxlength="4"
					value="<%=msgRT.getE01PLPCN2().trim()%>"
					<%if (userPO.getHeader16().equals("5")) {out.print("readonly");}%>>
				<%if (!userPO.getHeader16().equals("5")) {%> <A
					href="javascript:GetCodeDescCNOFC('E01PLPCN2','E01PLPRE2','PD')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda"
					align="bottom" border="0"> </A> <%}%> <INPUT type="text"
					name="E01PLPRE2" size="30" maxlength="15"
					value="<%=msgRT.getE01PLPRE2().trim()%>" readonly></td>
			</tr>
			<tr id="trdark">
				<td width="15%"></td>
				<td width="30%"></td>
				<td width="50%" align="left">Destino de Crédito <input type="text"
					name="E01PLPCN3" size="5" maxlength="4"
					value="<%=msgRT.getE01PLPCN3().trim()%>"
					<%if (userPO.getHeader16().equals("5")) {out.print("readonly");}%>>
				<%if (!userPO.getHeader16().equals("5")) {%> <A
					href="javascript:GetCodeDescCNOFC('E01PLPCN3','E01PLPRE3','XB')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda"
					align="bottom" border="0"> </A> <%}%> <INPUT type="text"
					name="E01PLPRE3" size="30" maxlength="15"
					value="<%=msgRT.getE01PLPRE3().trim()%>" readonly></td>
			</tr>
			
			<tr id="trdark">         		          
            <td nowrap width="25%" > 
              <div align="right">Código Sub-Producto:</div>
            </td>
            <td nowrap width="25%" > 
            <%String E01DEAOBL = msgRT.getE01DEAOBL().trim();
              if (session.getAttribute("msgList") != null) {
              	datapro.eibs.beans.EDP072101Message bean = ((datapro.eibs.beans.EDP072101Message)session.getAttribute("msgList"));
              	if(msgRT.getE01PLPNPR().trim().equals(bean.getE01PLTNPR().trim()))
              		E01DEAOBL = bean.getE01DEAOBL();
              }
            %>
              <input type="text" <%=readonly %> name="E01DEAOBL" size="3" maxlength="2" value="<%= E01DEAOBL%>">
              <%if (isNew){ %>
              <a href="javascript:GetCodeDescCNOFC('E01DEAOBL','','YY')"><img src="<%=request.getContextPath()%>/images/1b.gif" 
              alt="Ayuda" align="bottom" border="0" ></a> 
              <%} %>
            </td>
                      
             <td>
            Situación Nuevo :
            <select name="E01DEARRC" <%=disabled %>>
                      <option value=" " <% if (!(msgRT.getE01DEARRC().equals("01") || msgRT.getE01DEARRC().equals("03"))) out.print("selected"); %>></option>
                      <option value="01" <% if (msgRT.getE01DEARRC().equals("01")) out.print("selected"); %>>01-Vigente</option>
                      <option value="03" <% if (msgRT.getE01DEARRC().equals("03")) out.print("selected"); %>>03-Reestructurado</option>
             </select>
            </td>	 
          </tr> 
			
		</table>
		</td>
	</tr>
</table>

<h4>Datos del Cliente</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td width="20%">
				<div align="right">N&uacute;mero Cliente :</div>
				</td>
					<td width="30%">
					<%if (userPO.getHeader16().equals("1")) {%> 
					<input type=TEXT name="E01CUSCUN" size=10 maxlength=9 onKeypress="enterInteger(event)" value="<%=msgRT.getE01CUSCUN().trim()%>" onblur="retCustInf();"> 
					<a href="javascript:GetCustomerDescId('E01CUSCUN','E01CUSNA1','')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="middle" border="0">
					</a> 
					<%} else {%> 
					<input type="text" name="E01CUSCUN" size="27" maxlength="4" value="<%=msgRT.getE01CUSCUN().trim()%>" readonly> <%};%>
				</td>
				<td width="20%">
				<div align="right">Nombre Cliente :</div>
				</td>
				<td width="30%"><input type="text" name="E01CUSNA1" size="36"
					maxlength="35" value="<%=msgRT.getE01CUSNA1().trim()%>" readonly></td>
			</tr>
			<tr id="trdark">
				<td width="20%">
				<div align="right">Clasificación:</div>
				</td>
				<td width="30%"><input type="text" name="E01CUFCL1" size="27"
					maxlength="35" value="<%=msgRT.getE01CUFCL1().trim()%>" readonly></td>
				<td width="20%" align="right"></td>
				<td width="30%"></td>
			</tr>
			<tr id="trdark">
				<td width="20%">
				<div align="right">Grupo:</div>
				</td>
				<td width="30%"><INPUT type="TEXT" name="E01PLPGRP" size="10"
					maxlength="9" onkeypress="enterInteger(event)"
					value="<%=msgRT.getE01PLPGRP().trim()%>" readonly> 
					<INPUT type="text" name="E01XXXGR1" size="27"
					maxlength="4" value="<%=msgRT.getE01XXXGR1().trim()%>" readonly></td>
				<td width="20%">
				<div align="right">Actividad Económica:</div>
				</td>
				<td width="30%"><INPUT type="TEXT" name="E01PLPBUC" size="4"
					maxlength="4" onkeypress="enterInteger(event)" readonly
					value="<%=msgRT.getE01PLPBUC().trim()%>"> <input type="text"
					name="E01XXXBUC" size="27" maxlength="4"
					value="<%=msgRT.getE01XXXBUC().trim()%>" readonly></td>
			</tr>
			<tr id="trdark">
				<td width="20%">
				<div align="right">Fecha Nacimiento/Constitución:</div>
				</td>
				<td width="30%"><INPUT type="text" name="E01CUSIDD" size="2"
					maxlength="2" value="<%=msgRT.getE01CUSIDD().trim()%>" readonly> <INPUT
					type="text" name="E01CUSIDM" size="2" maxlength="2"
					value="<%=msgRT.getE01CUSIDM().trim()%>" readonly> <INPUT
					type="text" name="E01CUSIDY" size="5" maxlength="4"
					value="<%=msgRT.getE01CUSIDY().trim()%>" readonly></td>
				<td width="20%" align="right">Fecha Vencimiento:</td>
				<td width="30%"><INPUT type="text" name="E01XXXVAD" size="2"
					maxlength="2" value="<%=msgRT.getE01XXXVAD().trim()%>" readonly> <INPUT
					type="text" name="E01XXXVAM" size="2" maxlength="2"
					value="<%=msgRT.getE01XXXVAM().trim()%>" readonly> <INPUT
					type="text" name="E01XXXVAY" size="5" maxlength="4"
					value="<%=msgRT.getE01XXXVAY().trim()%>" readonly></td>
			</tr>
			<tr id="trdark">
			<td width="20%" align="right">Sector Económico:</td>
			<td width="30%">
			   <input type="text" name="E01PLPINC" size="5" maxlength="4" value="<%=msgRT.getE01PLPINC().trim()%>" readonly>
			   <input type="text" name="E01XXXINC" size="34" maxlength="33" value="<%=msgRT.getE01XXXINC().trim()%>" readonly>	
			</td>
			<td width="20%" align="right">Tipo de Crédito:</td>
			<td width="30%">
			   <input type="text" name="E01PLPCL9" size="5" maxlength="4" value="<%=msgRT.getE01PLPCL9().trim()%>" readonly>
			   <input type="text" name="E01XXXCL9" size="34" maxlength="33" value="<%=msgRT.getE01XXXCL9().trim()%>" readonly>	
			</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<center>
<A id="producto">
	<A HREF="#producto">Producto</A> &nbsp; |&nbsp; 
	<A HREF="#recaudos">Recaudos</A> &nbsp; |&nbsp; 
	<A HREF="#comentarios">Comentarios Analista</A> &nbsp;|&nbsp;
</A>	
</center>

<%	if (gaCodeList.getNoResult()) { %>
	<h4>Producto</h4>
	<TABLE class="tbenter" height="20%" width="100%">
		<TR>
			<TD ALIGN=CENTER VALIGN=MIDDLE>
				<H4 style="text-align: center">No existe ningun Producto creado para esta propuesta. <br></h4>
		<	/TD>
		</TR>
		<tr>
			<td class=TDBKG width="20%">
				<div align="center"><a href="javascript:goActionProd(1)"><b>Crear</b></a></div>
			</td>
		</tr>
	</TABLE>
<%	} else {%>
	<h4>Producto</h4>
	<TABLE id="mainTable1" class="tableinfo">
		<TR>
			<TD NOWRAP valign="top" width="100%">
				<table class="tbenter" width=100% align=center>
					<tr>
					<%if ((msgRT.getE01SWMPRD().trim().equals("1"))
						&& (!userPO.getHeader16().equals("5"))) {%>
						<td class=TDBKG align="center">
							<div align="center"><a href="javascript:goActionProd(1)"><b>Crear</b></a></div>
						</td>
					<%}%>
					<%if (!msgRT.getE01CRTEST().equals("AA")) {%>
						<%if (!userPO.getHeader16().equals("5")
							&& (!msgRT.getE01CRTEST().equals("AA"))) {%>
							<td class=TDBKG align="center">
								<div align="center"><a href="javascript:goActionProd(2)"><b>Modificar</b></a></div>
							</td>	
						<%}
					}%>
						<td class=TDBKG align="center">
						<div align="center"><a href="javascript:goActionProd(3)"><b>Consultar</b></a></div>
						</td>	
					</tr>
				</table>
			</TD>	
		</TR>
		<TR>
			<TD NOWRAP width="100%">
				<TABLE id="headTable1">
					<tr id="trdark">
						<th align=CENTER nowrap width="5%">&nbsp;</th>
						<th align=CENTER nowrap width="10%">
						<div align="center">Cód.</div>
						</th>
						<th align=CENTER nowrap width="30%">
						<div align="center">Descripción</div>
						</th>
						<th align=CENTER nowrap width="15%">
						<div align="center">Tipo</div>
						</th>
						<th align=CENTER nowrap width="20%">
						<div align="center">Monto Solicitado</div>
						</th>
						<th align=CENTER nowrap width="20%"><%if (!msgRT.getE01CRTEST().equals("AA")) {%>
						<div align="center">Monto Recomendado</div>
						<%} else {%>
						<div align="center">Monto Aprobado</div>
						<%}%></th>
					</tr>
				</TABLE>
				<div id="dataDiv1" class="scbarcolor">
					<table id="dataTable">
<%
					boolean firstTime = true;
					String gaChk = "";
					gaCodeList.initRow();
					int i = 0;
					
					EDP072101Help.initRow();
					
					while (gaCodeList.getNextRow()) {
						if (gaCodeList.getFlag().equals("")) {
							gaChk = (firstTime) ? "checked" : "";
							firstTime = false;
					
							EDP072101Help.getNextRow();
							datapro.eibs.beans.EDP072101Message msgList =
								(datapro.eibs.beans.EDP072101Message) EDP072101Help.getRecord();%>
								<TR>
									<TD ALIGN=CENTER NOWRAP width="5%"><input type="radio" name="COLLCOD"
										value="<%=EDP072101Help.getCurrentRow()%>"
										onClick="showCollItems(this.value)"
										<%=gaChk%>></TD>
									<TD ALIGN=CENTER NOWRAP width="10%"><%=gaCodeList.getRecord(0)%></TD>
									<TD ALIGN=LEFT NOWRAP width="30%"><%=gaCodeList.getRecord(1)%></TD>
									<TD ALIGN=CENTER NOWRAP width="15%"><%=gaCodeList.getRecord(2)%></TD>
									<TD ALIGN=CENTER NOWRAP width="20%"><%=gaCodeList.getRecord(3)%></TD>
									<TD ALIGN=CENTER NOWRAP width="20%"><%=gaCodeList.getRecord(4)%></TD>
								</TR>

<%							i++;
						}
					}
%>
					</table>
				</div>
			</TD>
		</TR>	
	</TABLE>
<% 	} %>

<center>
<A id="recaudos">
	<A HREF="#producto">Producto</A> &nbsp; |&nbsp; 
	<A HREF="#recaudos">Recaudos</A> &nbsp; |&nbsp; 
	<A HREF="#comentarios">Comentarios Analista</A> &nbsp;|&nbsp;
</A>
</center>

	<div id="SecRecaudoDocumento" style="display: none"></DIV>	
	<h4 align="left">Recaudo Documentos</h4>
	<div id="dataDiv3" align="center"
		style="height: 200; overflow-y: scroll; width: 100%; padding-left: 10; padding-right: 5"
		class="scbarcolor">

		<TABLE class="tableinfo" id="dataTableRD" width="100%">
			<TR id=trdark>
				<TD ALIGN="center" NOWRAP width="5%"><b>Sel</b></TD>
				<TD ALIGN="center" NOWRAP width="70%"><b>Documento</b></TD>
				<TD ALIGN="center" NOWRAP width="15%"><b>Check</b></TD>
				<TD ALIGN=center NOWRAP width="10%"><b>Condición</b>
				</TD>
			</TR>
<%
			EDP073701Help.initRow();
			int recnum = 1;
			String gaChkRD = "";
			String name = "";
			boolean firstTimeRD = true;
			while (EDP073701Help.getNextRow()) {
				gaChkRD = (firstTimeRD) ? "checked" : "";
				firstTimeRD = false;
				if (recnum < 10)
					name = "" + recnum;
				else
					name = "" + recnum;
				datapro.eibs.beans.EDP073701Message msgRTR =
					(datapro.eibs.beans.EDP073701Message) EDP073701Help.getRecord();%>

				<TR id=trclear>
					<TD ALIGN="center" NOWRAP width="5%"><input type="radio" name="COLLCODRD"
						value="<%=name%>"
						onClick="showCollItemsRD(<%=name%>,'<%=msgRTR.getField("E01DPDTNU").getString().trim()%>')"
						<%=gaChkRD%>></TD>
					<TD ALIGN="left" NOWRAP width="70%"><INPUT type="hidden"
						name="E01PLTPRO<%=name%>"
						value="<%=msgRTR.getField("E01PLTPRO").getString().trim()%>"> <INPUT
						type="hidden" name="E01DPDD<%=name%>"
						value="<%=msgRTR.getField("E01DPDD01").getString().trim()%>"> <INPUT
						type="hidden" name="E01DPDT<%=name%>"
						value="<%=msgRTR.getField("E01DPDT01").getString().trim()%>"> <INPUT
						type="text" maxlength="40" size="40" name="E01DPDX<%=name%>"
						value="<%=msgRTR.getField("E01DPDX01").getString().trim()%>" readonly
						width="20%"> <INPUT type="text" name="E01DPOB<%=name%>" size="81"
						maxlength="80"
						value='<%=msgRTR.getField("E01DPOBSR").getString().trim()%>'
						<%if (userPO.getHeader16().equals("5")) {out.print("readonly");}%>><INPUT
						type="text" maxlength="10" size="10" name="NIVDOC<%=name%>"
						<%if (msgRTR.getField("E01DPDT01").getString().trim().equals("1")) {%>
						value="REQUERIDO" <%};%>
						<%if (msgRTR.getField("E01DPDT01").getString().trim().equals("2")) {%>
						value="ADICIONAL" <%};%>
						<%if (msgRTR.getField("E01DPDT01").getString().trim().equals("3")) {%>
						value="OPCIONAL" <%};%> readonly width="10%"></TD>
					<TD ALIGN=center NOWRAP width="15%"><INPUT type="checkbox"
						name="E01DPUB<%=name%>"
						value="<%=msgRTR.getField("E01DPUB01").getString().trim()%>"
						<%if (!msgRTR.getField("E01DPUB01").getString().trim().equals(""))	out.print("checked");%>
						width="5%" onClick="asigDat(<%=name%>);"
						<%if (userPO.getHeader16().equals("5")) {out.print("DISABLED");}%>>
					</TD>
					<TD ALIGN=center NOWRAP width="10%"><SELECT name="E01DPFR<%=name%>"
						<%if (userPO.getHeader16().equals("5")) {out.print("DISABLED");}%>>
						<option value=" "
							<%if (msgRTR.getField("E01DPFR01").getString().equals(" ")) {out.print("selected");}%>></option>
						<option value="1"
							<%if (msgRTR.getField("E01DPFR01").getString().equals("1")) {out.print("selected");}%>>Conforme</option>
						<option value="2"
							<%if (msgRTR.getField("E01DPFR01").getString().equals("2")) {out.print("selected");}%>>Incompleto</option>
						<option value="3"
							<%if (msgRTR.getField("E01DPFR01").getString().equals("3")) {out.print("selected");}%>>Ilegible</option>
						<option value="4"
							<%if (msgRTR.getField("E01DPFR01").getString().equals("4")) {out.print("selected");}%>>Faltante</option>
					</SELECT>
					<INPUT type="hidden" name="TABLE_NUM<%=name%>" value="<%=msgRTR.getField("E01DPDTNU").getString().trim()%>"> 
				</TR>

<%
				recnum += 1;
			}
%>
			<input type="HIDDEN" name="RECNUM" value="<%=recnum%>">
		</TABLE>
	</div>

<center>
<A id="comentarios">
	<A HREF="#producto">Producto</A> &nbsp; |&nbsp; 
	<A HREF="#recaudos">Recaudos</A> &nbsp; |&nbsp; 
	<A HREF="#comentarios">Comentarios Analista</A> &nbsp;|&nbsp;
</A>
</center>

<%	if (msgRT.getE01DPZDXX().equals("1")) { %>
<%	if (ga0726.getNoResult()) {%>
		<div id="SecRegistroGarantia" style="display: none">Seccion Registro Garantia</DIV>
		<h4>Registro de Garantia</h4>
		<TABLE class="tbenter" height="20%">
			<TR>
				<TD ALIGN=CENTER VALIGN=MIDDLE>
				<	H4 style="text-align: center">No existen Registro Garantias requeridas para esta propuesta.</h4>
				</TD>
			</TR>
		</TABLE>
<%	} else { %>	
		<h4>Registro de Garantia</h4>
		<TABLE id="mainTable2" class="tableinfo">
			<TR>
				<TD NOWRAP width="100%">
					<TABLE id="headTable2">
						<tr id="trdark">
							<th align=CENTER nowrap width="5%">&nbsp;</th>
							<th align=CENTER nowrap width="5%">
							<div align="center">Cód.</div>
							</th>
							<th align=CENTER nowrap width="25%">
							<div align="center">Descripción</div>
							</th>
							<th align=CENTER nowrap width="10%">
							<div align="center">Fecha</div>
							</th>
							<th align=CENTER nowrap width="15%">
							<div align="center">.</div>
							</th>
							<th align=CENTER nowrap width="15%">
							<div align="center">.</div>
							</th>
							<th align=CENTER nowrap width="10%">
							<div align="center">.</div>
							</th>
						</tr>
					</TABLE>
					<div id="dataDiv2" class="scbarcolor">
						<table id="dataTable2">
<%
						boolean firstTime = true;
						String gaChk = "";
						ga0726.initRow();
						int i = 0;
						
						EDP072601Help.initRow();
						
						while (ga0726.getNextRow()) {
							if (ga0726.getFlag().equals("")) {
								EDP072601Help.getNextRow();
								datapro.eibs.beans.EDP072601Message msgL0726 =
									(datapro.eibs.beans.EDP072601Message) EDP072601Help.getRecord();
						
								if (!msgL0726.getE01DPEFAD().trim().equals("0")) {
									gaChk = "checked";
								}%>
								<TR>
									<TD ALIGN=center NOWRAP width="5%"><input type="checkbox"
										name="COLLCOD2" value="<%=EDP072601Help.getCurrentRow()%>"
										onClick="updGuar(this.value, '<%=msgL0726.getE01DPEPRD().trim()%>', '<%=msgL0726.getE01DPETYP().trim()%>', '<%=msgL0726.getE01DPEREG().trim()%>')"
										<%=gaChk%>
										<%if (msgRT.getE01PLPEST().trim() == ("99")) {out.print("disabled");}%>>
									</TD>
									<TD ALIGN=CENTER NOWRAP width="5%"><%=ga0726.getRecord(0)%></TD>
									<TD ALIGN=CENTER NOWRAP width="25%"><%=ga0726.getRecord(1)%></TD>
									<TD ALIGN=CENTER NOWRAP width="10%"><%=ga0726.getRecord(2)%></TD>
									<TD ALIGN=CENTER NOWRAP width="15%"><%=ga0726.getRecord(3)%></TD>
									<TD ALIGN=CENTER NOWRAP width="15%"><%=ga0726.getRecord(4)%></TD>
									<TD ALIGN=CENTER NOWRAP width="10%"><%=ga0726.getRecord(5)%></TD>
						
								</TR>
<%
								i++;
							}
						}
%>
						</table>
					</div>
				</TD>
			</TR>
		</TABLE>
<% 	} %>
<div id="SecDocGarantia" style="display: none">Seccion Documentos a Recaudar por Garantias</DIV>
<A id="Documentos Garantías"></A>
	<h4>Recaudos por Garantia</h4>
<%	if (!ga0726T.getNoResult()) { %>	
		<TABLE id="mainTable3" class="tableinfo">
			<TR>
				<TD NOWRAP width="100%">
					<TABLE id="headTable3">
						<tr id="trdark">
							<th align=CENTER nowrap width="5%">&nbsp;</th>
							<th align=CENTER nowrap width="5%">
							<div align="center">Cód.</div>
							</th>
							<th align=CENTER nowrap width="10%">
							<div align="center">Descripción</div>
							</th>
							<th align=CENTER nowrap width="5%">
							<div align="center">Cód.</div>
							</th>
							<th align=CENTER nowrap width="15%">
							<div align="center">Fecha</div>
							</th>
							<th align=CENTER nowrap width="20%">
							<div align="center">.</div>
							</th>
							<th align=CENTER nowrap width="20%">
							<div align="center">.</div>
							</th>
						</tr>
					</TABLE>
					<div id="dataDiv3" class="scbarcolor">
						<table id="dataTable3">
<%
						boolean firstTime = true;
						String gaChkT = "";
						ga0726T.initRow();
						int i = 0;
						
						while (ga0726T.getNextRow()) {
							if (ga0726T.getFlag().equals("")) {
						
								EDP072601Help.getNextRow();
								datapro.eibs.beans.EDP072601Message msgL0726T =
									(datapro.eibs.beans.EDP072601Message) EDP072601Help.getRecord();
						
								if (!msgL0726T.getE01DPZFAD().trim().equals("0")) {
									gaChkT = "checked";
								}%>
								<TR>
									<TD ALIGN=LEFT NOWRAP width="5%"><input type="checkbox"
										name="COLLCOD3" value="<%=EDP072601Help.getCurrentRow()%>"
										onClick="updGuarT(this.value, '<%=msgL0726T.getE01DPZNPR().trim()%>', '<%=msgL0726T.getE01DPZGRT().trim()%>', '<%=msgL0726T.getE01DPZDGA().trim()%>')"
										<%=gaChkT%>
										<%if (msgRT.getE01PLPEST().trim() == ("70")) {out.print("disabled");}%>>
									</TD>
									<TD ALIGN=CENTER NOWRAP width="5%"><%=ga0726T.getRecord(0)%></TD>
									<TD ALIGN=CENTER NOWRAP width="10%"><%=ga0726T.getRecord(1)%></TD>
									<TD ALIGN=LEFT NOWRAP width="15%"><%=ga0726T.getRecord(2)%></TD>
									<TD ALIGN=CENTER NOWRAP width="20%"><%=ga0726T.getRecord(3)%></TD>
									<TD ALIGN=CENTER NOWRAP width="20%"><%=ga0726T.getRecord(4)%></TD>
									<TD ALIGN=CENTER NOWRAP width="10%"><%=ga0726T.getRecord(5)%></TD>
						
								</TR>
<%
								i++;
							}
						}
%>
						</table>
					</div>
				</TD>
			</TR>
		</TABLE>
<% 	} %>
<% } %>

<br>

<table class="tableinfo">
	<tr id="trdark">
		<td width="20%">
			<div align="right">	Ubicación Geográfica</div>
		</td>

		<td width="80%" align="left"><input type="text" name="E01PLPUGE" size="5" maxlength="4" value="<%=msgRT.getE01PLPUGE().trim()%>" <%= userPO.getHeader16().equals("5") ? "readonly"  : "" %>>
		<%if (!userPO.getHeader16().equals("5")) {%> 
			<%if(currUser.getE01INT().equals("04")){%>
				<A href="javascript:GetCodeDescCNOFC('E01PLPUGE','D01PLPUGE','EM')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"> </A> 
           		<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
			<% } else {%>
				<A href="javascript:GetCodeDescCNOFC('E01PLPUGE','D01PLPUGE','27')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"> </A> 
           		<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
			<%} 
		}%> 
			<INPUT type="text" name="D01PLPUGE" size="35" maxlength="35" value="<%=msgRT.getD01DPZMUN().trim()%>" readonly>
		 </td>
	</tr>
</table>

<%	if ((userPO.getHeader16().equals("9")) || (userPO.getHeader16().equals("5"))) {%>
<table class="tableinfo">
	<tr id="clear">
		<TD ALIGN=CENTER width="100%" class=tdbkg>
			<a href="javascript:goDOFA(1)"><b>Otros Comentarios</b></a>
		</TD>
	</tr>
</table>
<%	} %>

<h4>Comentarios Solicitud</h4>
<table class="tableinfo">
	<tr id="trdark">
		<td width="100%" align="center"><TEXTAREA name="E02DPAC99" rows="10"
			cols="80" wrap="hard"
			onKeyDown="limitText(this.form.E02DPAC99,5000);"
			onKeyUp="limitText(this.form.E02DPAC99,5000);" onchange="this.value=this.value.substring(0, 5000);"
			<%if (userPO.getHeader16().equals("5")) {out.print("readonly");
			} else {
				if ((userPO.getHeader16().equals("9"))
					&& (!msgRT.getH01USERID().trim().equals(msgRT.getE01PLPAID().trim()))) {
				out.print("readonly");
			}}%>></TEXTAREA>
       		<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
			</td>
	</tr>
</table>

<h4>Comentarios Analista</h4>
<table class="tableinfo">
	<tr id="trdark">
		<td width="100%" align="center"><TEXTAREA name="E01DPSCOM"
			maxlength="512" rows="10" cols="80" wrap="hard"
			onKeyDown="limitText(this.form.E01DPSCOM,1500);"
			onKeyUp="limitText(this.form.E01DPSCOM,1500);" onchange="this.value=this.value.substring(0, 1500);"
			<%if (userPO.getHeader16().equals("5")) {out.print("readonly");}%>></TEXTAREA>
		</td>
	</tr>
</table>
<table class="tbenter">
	<tr id="trclear">
		<td class=TDBKG align="center">
		<div align="center"><a href="javascript:goRetrComm()"><b>Traer	Comentario Anterior</b></a></div>
		</td>
	</tr>
</table>
<br>

<table cellspacing="0" cellpadding="0" width="100%" border="0">
	<tr>
		<td width="802">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr id="trclear">
				<%if (msgRT.getE01DPUBXX().equals("1")) {%>
					<td width="20%">Monto Aprobado: 
						<INPUT type="text" name="E01PLPAM2"	size="20" maxlength="20" value="<%=msgRT.getE01PLPAM2().trim()%>"
					<% if (userPO.getHeader16().equals("5")
							|| msgRT.getE01CRTEST().equals("AA")) {out.print("readonly");}%>
							onkeypress="enterDecimal()">
					</td>
					<td width="20%">Fecha Decision: <INPUT type="text" name="E01PLPNFD"
						size="2" maxlength="2" value="<%=msgRT.getE01PLPNFD().trim().equals("0")?currUser.getE01RDD():msgRT.getE01PLPNFD().trim()%>"
						readonly> <INPUT type="text" name="E01PLPNFM" size="2"
						maxlength="2" value="<%=msgRT.getE01PLPNFM().trim().equals("0")?currUser.getE01RDM():msgRT.getE01PLPNFM().trim()%>" readonly> 
						<INPUT	type="text" name="E01PLPNFY" size="5" maxlength="4" value="<%=msgRT.getE01PLPNFY().trim().equals("0")?currUser.getE01RDY():msgRT.getE01PLPNFY().trim()%>" readonly> <%if (!userPO.getHeader16().equals("5")
						&& (!msgRT.getE01CRTEST().equals("AA"))) {%> 
						<%}%>
					</td>
					<td nowrap width="20%" align="left">Numero de Acta: <INPUT
						type="text" name="E01PLPNAC" size="17" maxlength="15"
						value="<%=msgRT.getE01PLPNAC().trim()%>"
						<%if (userPO.getHeader16().equals("5")
							|| msgRT.getE01CRTEST().equals("AA")) {out.print("readonly");}%>>
					</td>
				<%} else if (msgRT.getE01CRTFG2().equals("1")) {%>
				<td width="20%" colspan="3">Monto Recomendado: <INPUT type="text"
					name="E01PLPAM2" size="20" maxlength="20"
					value="<%=msgRT.getE01PLPAM2().trim()%>"
					<%if (userPO.getHeader16().equals("5")
						|| msgRT.getE01CRTEST().equals("AA")) {out.print("readonly");}%>
					onkeypress="enterDecimal()"></td>
				<%}%>
			</tr>		
		</table>
		</td>
	</tr>
</table>	

<br>	

<%	if (!(userPO.getHeader16().equals("1"))) {%>
	<h4>Seleccione Próxima Actividad:</h4>

	<TABLE id="tbenter" border="0" cellspacing="1" cellpadding="0" width="100%">
	<TR id="trdark" >
		<td width="30%" align="center"><SELECT name="available" 
			<%if (userPO.getHeader16().equals("X")) {out.print("DISABLED");}%>>
			<%optLP4.initRow();
			while (optLP4.getNextRow()) {
				if (optLP4.getFlag().equals("")) {
					out.println(optLP4.getRecord());
				}
			}%>
				</SELECT></td>
				<td width="20%" align="center"><INPUT class="EIBSBTN" type="button" value="Seleccionar"
					onclick="moveOver();"
					<%if (userPO.getHeader16().equals("X") || userPO.getHeader16().equals("5")) {
			out.print("DISABLED");}%>>
		</td>
		<td width="50%" align="left" ><INPUT type="text"
			name="E01DPPPXX" size="5" maxlength="5"
			value="<%=msgRT.getE01DPPPXX().trim()%>" readonly> <INPUT type="text"
			name="E01DPPDXX" size="35" maxlength="35"
			value="<%=msgRT.getE01DPPDXX().trim()%>" readonly></td>
	</tr>
</TABLE>
<%	} %>

<div align="center"><input class="EIBSBTN_LARGE" type="button" name="Submit"
	value="Siguiente Actividad"
	onclick="goControlDoc('<%=userPO.getHeader16()%>')"
	<%if (userPO.getHeader16().equals("5")) {out.print("DISABLED");}%>>
<%if (!userPO.getPurpose().equals("NEW")
	&& !(userPO.getHeader16().equals("1"))) {%> <INPUT class="EIBSBTN"
	type="button" name="Submit0" value="Salvar"
	onclick="goConfirm('<%=userPO.getHeader16()%>', '<%=userPO.getHeader21()%>')"
	<%if (userPO.getHeader16().equals("5")) {out.print("DISABLED");}%>>
<%}%> <INPUT class="EIBSBTN" type="button" name="Cancel" value="Cancelar"
	onclick="goCancel('<%=userPO.getHeader9().trim()%>')">
</div>

<script type="text/javascript">
    showChecked("COLLCODRD");
    
    function resizeDoc() {
    	adjustEquTables( getElement("headTable1"), getElement("dataTable"), getElement("dataDiv1"), 1, false);
    }
	
	function resizeDoc2() {
    	adjustEquTables( getElement("headTable2"), getElement("dataTable2"), getElement("dataDiv2"), 1, false);
    }

    function resizeDoc3() {
       adjustEquTables( getElement("headTable3"), getElement("dataTable3"), getElement("dataDiv3"), 1, false);
    }
</script>

</form>
</body>
</html>
