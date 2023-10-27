<%@ page contentType="text/javascript"%>

function IncludeJQuery(jsFile) {
		document.write('<script type="text/javascript" src="' + jsFile + '"></script>');
}
	
IncludeJQuery('${pageContext.request.contextPath}/jquery/jquery-2.1.4.min.js');
IncludeJQuery('${pageContext.request.contextPath}/jquery/plugins/contextMenu/jquery.contextMenu.js');
IncludeJQuery('${pageContext.request.contextPath}/jquery/plugins/contextMenu/jquery.ui.position.js');
IncludeJQuery('${pageContext.request.contextPath}/jquery/jquery-ui-1.10.4.js');
IncludeJQuery('${pageContext.request.contextPath}/pages/s/javascripts/jquery.js');
IncludeJQuery('${pageContext.request.contextPath}/pages/s/javascripts/context.menu.help.js');
IncludeJQuery('${pageContext.request.contextPath}/jquery/plugins/errorFields/jquery.errorFields.js');
