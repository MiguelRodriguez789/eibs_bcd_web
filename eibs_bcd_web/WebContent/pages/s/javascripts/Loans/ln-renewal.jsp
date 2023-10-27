<%@page import="com.datapro.constants.EibsFields"%>
<%@page contentType="text/javascript"%>

	(function(EIBS, document){
		if (typeof EIBS.isNewLoan !== 'object'){
			EIBS.isNewLoan = function() {
				return true;
			}
		}
	})
	(window.EIBS =  typeof window.EIBS !== 'undefined' ? window.EIBS : {} , window.document);
