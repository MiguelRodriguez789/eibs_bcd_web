<%@ page contentType="text/javascript"%>

   (function(EIBS, document){
		if(typeof EIBS.REDIRECTS !== 'object'){
					EIBS.REDIRECTS = {
						loadPlanDePago : '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSPaymentPlan'
					};
		} else{
					EIBS.REDIRECTS.loadPlanDePago = '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSPaymentPlan';
		}
		//This MessageName is the name of the object used in AJAX call 
		if(typeof EIBS.messageName !== 'object'){
				EIBS.messageName = function(){
									return '${sessionScope.messageName}';
								 }
		}	
		
   })(window.EIBS =  typeof window.EIBS !== 'undefined' ? window.EIBS : {} , document);

	function IncludeJavaScript(jsFile) {
		document.write('<script type="text/javascript" src="'+jsFile+'"></script>');
	}

	IncludeJavaScript('${pageContext.request.contextPath}/pages/s/javascripts/Loans/ln-paymentplan.js');

