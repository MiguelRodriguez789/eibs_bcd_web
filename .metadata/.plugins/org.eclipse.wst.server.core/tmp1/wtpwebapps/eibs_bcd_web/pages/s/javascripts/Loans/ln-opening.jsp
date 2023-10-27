<%@page import="com.datapro.constants.EibsFields"%>
<%@ page contentType="text/javascript"%>

   (function(EIBS, document){
		if(typeof EIBS.isNewLoan !== 'object'){
				EIBS.isNewLoan = function(){
									return ${sessionScope.lnBasic.E01FLGNEW == "N"};
								 }
			if(typeof EIBS.REDIRECTS !== 'object'){
				<%-- Redirects defines URI. Allows js code to live in .js rather than live in .jsp --%>
						EIBS.REDIRECTS = {
							recConvenio: '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=311' ,
							calCharges : '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=312'
						};
			} else{
						EIBS.REDIRECTS.recConvenio = '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=311';
						EIBS.REDIRECTS.calCharges = '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=312';
			}								 
		}	
   })(window.EIBS =  typeof window.EIBS !== 'undefined' ? window.EIBS : {} , window.document);

	function IncludeJavaScript(jsFile) {
		document.write('<script type="text/javascript" src="'+jsFile+'"></script>');
	}

	IncludeJavaScript('${pageContext.request.contextPath}/pages/s/javascripts/Loans/Loans.js');
	IncludeJavaScript('${pageContext.request.contextPath}/pages/s/javascripts/Loans/ln-opening.js');

	function goFutureRates(readOnly) {
		<%-- Allows user to set schedule of rate changes to Loan. --%>
		var acc = getElement('E01DEAACC').value;
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0158?SCREEN=100&E01FTRACC="+acc+"&APPROVAL="+readOnly;
		CenterWindow(page, 400, 500, 2);
	}
	
	function goMilagrosoRates(readOnly) {
		<%-- Allows user to set schedule of rate changes to Loan. --%>
		var acc = getElement('E01DEAOFN').value;
		var psu = getElement('E01DEAPSU').value;
		var brn = getElement('E01DEABRN').value;
		var rte = getElement('E01DEASPR').value;
		
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSEDL0547?SCREEN=300&E01CMLACC="+acc+"&E01CMLCON="+psu+"&E01CMLBRN="+brn+"&E01CMLRTI="+rte+"&APPROVAL="+readOnly;
		CenterWindow(page, 600, 500, 2);
	}
	
	function goSubsidizedRate() {
		if (isValidObject(getElement("E01DLCRFS")) && isValidObject(getElement("E01TOTRTE"))){
			var total = 0;
	    	total = parseFloat(getElement("E01DLCRFS").value) + parseFloat(getElement("E01LNSRTE").value);
	    	getElement("E01TOTRTE").value = String(total.toFixed( EIBS.currency.decimalLength() ));
	    }
	}
	
	function setCta(value){
		if (value == "Y"){
			$('#ctaHLP').show();
			getElement("ctaTD1").style.display = '';
			getElement("ctaTD2").style.display = '';
		} else {
			$('#ctaHLP').hide();
			getElement("ctaTD1").style.display = 'none';
			getElement("ctaTD2").style.display = 'none';
		}
		EIBS.UTILS.updateTableCSS('tableBasicInfo');
	}

	function crearAcc(flg) {
		var cun = "";
		var acc = "";
		var pro = "";
		if (isValidObject(getElement("E01DEACUN"))) {
			cun = getElement("E01DEACUN").value;
		}
		if (isValidObject(getElement("E01NEWACC"))) {
			acc = getElement("E01NEWACC").value;
		}
		if (isValidObject(getElement("E01PRODUC"))) {
			pro = getElement("E01PRODUC").value;
		}
		if (acc.trim() == "" && pro.trim() == "") {
			alert("Debe seleccionar Tipo de Cuenta.");
			return;
		}
		if (flg == 'Y') {
			if (!confirm("Desea crear cuenta de ahorros?")) {
				return;		
			}
		}
		var parameters = "?SCREEN=710";
		parameters += "&FLG=" + flg;
		parameters += "&CUN=" + cun;
		parameters += "&ACC=" + acc;
		parameters += "&PRO=" + pro;
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0150"; 
		url += parameters;
		//callWaiting("userWait", "<%=request.getContextPath()%>/images/throbber.gif", "Calculando");
		PostXMLRequest(url, parameters, sendCrearAcc, true);
	}

	function sendCrearAcc(res){ //Object of AJAX response
		//var userWait = getElement("userWait"); //Removes Waiting Throbber gif 
		//userWait.innerHTML = "";
		var data = JSON.parse(res.responseText);
		if (data.type == "error") {
			showErrors();
		} else {
			getElement("E01NEWACC").value = data.NEWACC;
			getElement("E01PRODUC").value = data.PRODUC;
			if (data.NEWACC == "0") {
				crearAcc('Y');
			} else {
				getElement("E01DEAPVI").value = data.DEAPVI;
				getElement("E01PAGOPE").value = data.PAGOPE;
				getElement("E01PAGGLN").value = data.PAGGLN;
				getElement("E01PAGCON").value = data.PAGCON;
				getElement("E01PAGACC").value = data.PAGACC;
				cuentas();
			}
		}
	}
	
	function showLimits(bank,prod){
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0380?loan=true&bnk=" + bank + "&prd=" + prod;
		CenterWindow(page, 700, 500, 2);
	}
	
	function showReassessment(acc) {
	  page = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=700&E01DEAACC=" + acc;		
	  CenterWindow(page, 750, 600, 2);
	}
		
	function setComissionTable(readOnly) {
		<%-- Allows user to set user defined comission schedule to Loan. --%>
	
		var notMissingInfo = true;
		var cun = getElement('E01DEACUN').value;
		var apcd = getElement('E01DEAACD').value;
		var bank = getElement('E01DEABNK').value;
		var type = getElement('E01DEATYP').value;
		var table = getElement('E01DEAOFT').value;
		var alertMessage = "Por Favor Ingresse : ";
		
		if(readOnly === "true" ){	
			page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table+"&readOnly="+readOnly;
		}else{
			page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table;
			
			if(trim(bank) == "") {
				alert(alertMessage + "Banco")
				notMissingInfo = false;			
			}
			
			if(trim(table) == "") {
				alert(alertMessage + "Tabla de Cargos")
				notMissingInfo = false;			
			}		
		}
		
		if(notMissingInfo){			
			CenterWindow(page, 1200, 1000, 2);
		}	
		
	}	
	
	function goAsign() {
		<%-- Server call to assign "convenio" to customer --%>
		var url = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=700";		
		CenterWindow(url, 30, 30, 2);		
	}
	
	function updateDist(sec) {	
		<%-- Function is called from Iframe ("Cargos, Seguros, etc"--%>
		<%-- Updates Field Element Values in Distribution Section. --%>
		// Updates Values in the Distribution Section based on changes from the Iframe.
	
		var valor1 = 0.00; var valor2 = 0.00; var total = 0.00; var totoam = 0.00; 
		var recalc = false;
		// Reliquidaciones
		if (sec == "RC") {
			if (isValidObject(getElement("RCTOT")) && isValidObject(getElement("E01TOTCRN"))) {
				valor1 = parseFloat((document.forms[0].RCTOT.value));
				valor2 = parseFloat((document.forms[0].E01TOTCRN.value));
				recalc = (valor1 != valor2) ? true : recalc;
				document.forms[0].E01TOTCRN.value = document.forms[0].RCTOT.value; 
			}
			if (isValidObject(getElement("RCTOT")) && isValidObject(getElement("E01DEAOAM"))) { 
				if (getElement("E01FLGREF").value == "Y") {
					document.forms[0].E01DEAOAM.value = formatCCY(document.forms[0].RCTOT.value); 
				}
			}
		}
		// Otros Conceptos a Reliquidar
		if (sec == "RN") {
			if (isValidObject(getElement("RNTOT")) && isValidObject(getElement("E01TOTORN"))) { 
				valor1 = parseFloat((document.forms[0].RNTOT.value));
				valor2 = parseFloat((document.forms[0].E01TOTORN.value));
				recalc = (valor1 != valor2) ? true : recalc;				
				document.forms[0].E01TOTORN.value = formatCCY(document.forms[0].RNTOT.value); 				
			}
		}				
		// Desembolso
		if (sec == "DS") {
			if (isValidObject(getElement("DSTOT")) && isValidObject(getElement("E01BALNET"))) {
				total = parseFloat((document.forms[0].E01BALNET.value)) - parseFloat((document.forms[0].DSTOT.value)); 
				document.forms[0].SALNET.value = formatCCY(total);
				//if(isValidObject(getElement("E01TOTGMF"))) document.forms[0].E01TOTGMF.value = document.forms[0].DSGMF.value;
			}
		}
		// Seguros
		if (sec == "SG") {
			if (isValidObject(getElement("SGTOT")) && isValidObject(getElement("E01TOTSGR"))) {
				valor1 = parseFloat((document.forms[0].SGTOT.value));
				valor2 = parseFloat((document.forms[0].E01TOTSGR.value)); 
				recalc = (valor1 != valor2) ? true : recalc;
				document.forms[0].E01TOTSGR.value = document.forms[0].SGTOT.value;
			}
		}
		// Cargos Adicionales
		if (sec == "CA") {
			if (isValidObject(getElement("CAIMP")) && isValidObject(getElement("E01TOTIMP"))) {
				valor1 = parseFloat((document.forms[0].CAIMP.value));
				valor2 = parseFloat((document.forms[0].E01TOTIMP.value)); 
				recalc = (valor1 != valor2) ? true : recalc;
	 			document.forms[0].E01TOTIMP.value = document.forms[0].CAIMP.value;
			}
			if (isValidObject(getElement("CACOM")) && isValidObject(getElement("E01TOTCOM"))) {
				valor1 = parseFloat((document.forms[0].CACOM.value));
				valor2 = parseFloat((document.forms[0].E01TOTCOM.value)); 
				recalc = (valor1 != valor2) ? true : recalc;
	 			document.forms[0].E01TOTCOM.value = document.forms[0].CACOM.value;
			}
			if (isValidObject(getElement("CADED")) && isValidObject(getElement("E01TOTDED"))) {
				valor1 = parseFloat((document.forms[0].CADED.value));
				valor2 = parseFloat((document.forms[0].E01TOTDED.value)); 
				recalc = (valor1 != valor2) ? true : recalc;
	 			document.forms[0].E01TOTDED.value = document.forms[0].CADED.value;
			}
			if (isValidObject(getElement("CAIVA")) && isValidObject(getElement("E01TOTIVA"))) {
				valor1 = parseFloat((document.forms[0].CAIVA.value));
				valor2 = parseFloat((document.forms[0].E01TOTIVA.value)); 
				recalc = (valor1 != valor2) ? true : recalc;
	 			document.forms[0].E01TOTIVA.value = document.forms[0].CAIVA.value;
			}
			if (isValidObject(getElement("CAOTH")) && isValidObject(getElement("E01TOTOTH"))) {
				valor1 = parseFloat((document.forms[0].CAOTH.value));
				valor2 = parseFloat((document.forms[0].E01TOTOTH.value)); 
				recalc = (valor1 != valor2) ? true : recalc;
	 			document.forms[0].E01TOTOTH.value = document.forms[0].CAOTH.value;
			}
		}
		
		<%-- Sums up Distribution. Finds remaining "Saldo"/Balance. --%>
		if (recalc) {
			setRecalculate(true);
			recalcDist();
		}
		
		<%--Reloads Iframe to Reflect Any New "Cargo Addicionales"--%>
		if( (sec =="DS" || sec =="SG" || sec =="RC") && isValidObject(document.getElementById("ifrempca"))) {
			document.getElementById("ifrempca").contentWindow.location.href = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&appType=LN&ACT=S&E01PVHCUN=" 
																							+ document.forms[0].E01DEACUN.value  + "&E01PVHNUM=" +  document.forms[0].E01DEAOFN.value + "&E01PVHRF1=" + document.forms[0].E01DLCRF1.value;//Reload Other Iframe to Refresh Totals 
		}
		<%--Reloads Iframe to Reflect Any New "Seguros"--%>
		if( sec =="DS" && isValidObject(document.getElementById("ifrempsg"))) {
			document.getElementById("ifrempsg").contentWindow.location.href = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&appType=LN&ACT=S&E01PSGCUN=" 
																							+ document.forms[0].E01DEACUN.value  + "&E01PSGNUM=" +  document.forms[0].E01DEAOFN.value;//Reload Other Iframe to Refresh Totals 
		}		
	}	
	
	function loadIframes(reload){
		<%-- Desembolso is in charge of loading sections. Loads Iframes when Desembolso Section is not present --%>
		if(!isValidObject( getElement("ifrempds")) || reload){
			if(isValidObject( getElement("ifrempca"))) {
				document.getElementById("ifrempca").contentWindow.location.href = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&ACT=S&appType=LN&E01PVHCUN=" 
																								+ document.forms[0].E01DEACUN.value  + "&E01PVHNUM=" +  document.forms[0].E01DEAOFN.value + "&E01PVHRF1=" + document.forms[0].E01DLCRF1.value;//Reload Other Iframe to Refresh Totals 
			}
			
			if( isValidObject( getElement("ifrempsg"))) {
				document.getElementById("ifrempsg").contentWindow.location.href = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&ACT=S&appType=LN&E01PSGCUN=" 
																								+ document.forms[0].E01DEACUN.value  + "&E01PSGNUM=" +  document.forms[0].E01DEAOFN.value;//Reload Other Iframe to Refresh Totals 
			}	
		}
	}	
	
		