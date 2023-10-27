<%@ page contentType="application/x-javascript" %>

<%-- Global Variables --%>

var fieldName;
var fieldDesc;
var fieldAux1;
var fieldAux2;
var fieldAux3;
var language = "s/";
var prefix = "<%=request.getContextPath()%>/pages/";
var webapp = "<%=request.getContextPath()%>";

	function IncludeJavaScript(jsFile) {
		document.write('<script type="text/javascript" src="<%=request.getContextPath()%>' + '/pages/s/javascripts/' + jsFile + '"></script>');
	}
	
	IncludeJavaScript('eIBSTreasury.js');
