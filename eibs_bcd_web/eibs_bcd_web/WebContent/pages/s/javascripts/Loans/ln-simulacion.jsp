<%@page import="com.datapro.constants.EibsFields"%>
<%@ page contentType="text/javascript"%>

   (function(EIBS, document){
		if(typeof EIBS.isNewLoan !== 'object'){
				EIBS.isNewLoan = function(){
									return true;
								 }
		}
		
		if(typeof EIBS.REDIRECTS !== 'object'){
					EIBS.REDIRECTS = {
						planURL1 : '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0900',
						planURL2 : '${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0900?SCREEN=100&Type=S',
						recConvenio: '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0900?SCREEN=311',
						calCharges : '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0900?SCREEN=312',
						loadProductInfo : '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0900?SCREEN=105'
					};
		} else {
			EIBS.REDIRECTS.planURL1 = '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0900';
			EIBS.REDIRECTS.planURL2 = '${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0900?SCREEN=100&Type=S';
			EIBS.REDIRECTS.recConvenio = '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0900?SCREEN=311';
			EIBS.REDIRECTS.calCharges = '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0900?SCREEN=312';
			EIBS.REDIRECTS.loadProductInfo = '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0900?SCREEN=105';			
		}		
   })(window.EIBS =  typeof window.EIBS !== 'undefined' ? window.EIBS : {} , window.document);

	function IncludeJavaScript(jsFile) {
		document.write('<script type="text/javascript" src="'+jsFile+'"></script>');
	}
	
	IncludeJavaScript('${pageContext.request.contextPath}/pages/s/javascripts/Loans/Loans.js');
	IncludeJavaScript('${pageContext.request.contextPath}/pages/s/javascripts/Loans/ln-simulacion.js');
	
	function updateIframes(sec) {	
		<%--Reloads Iframe to Reflect Any New "Cargo Addicionales"--%>
		if( (sec =="SG") && isValidObject(document.getElementById("ifrempca"))) {
			getElement("ifrempca").contentWindow.location.href = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&appType=LS&ACT=S&E01PVHCUN=" 
																							+ document.forms[0].E01DEACUN.value  + "&E01PVHNUM=" +  document.forms[0].E01DEAACC.value;//Reload Other Iframe to Refresh Totals 
		}
		<%--Reloads Iframe to Reflect Any New "Seguros"--%>
		if( sec =="DS" && isValidObject(document.getElementById("ifrempsg"))) {
			getElement("ifrempsg").contentWindow.location.href = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&appType=LS&ACT=S&E01PSGCUN=" 
																							+ document.forms[0].E01DEACUN.value  + "&E01PSGNUM=" +  document.forms[0].E01DEAACC.value;//Reload Other Iframe to Refresh Totals 
		}	
	}	
