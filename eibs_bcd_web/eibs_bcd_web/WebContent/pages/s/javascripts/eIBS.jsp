<%@page import="datapro.eibs.master.USession"%>
<%@page import="datapro.eibs.beans.UserPos"%>
<%@ page language="java" %>
<%@ page contentType="text/javascript"%>
<%@ page import = "datapro.eibs.sockets.DecimalField" %>
<%@page import="datapro.eibs.plugins.AuthorizationManager"%>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<%
	UserPos userPO = USession.getPOSBean(request);
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0"); // Proxies.
%>

<%-- Global Variables --%>

   (function(EIBS, document){
   		if (typeof EIBS.currency !== 'object'){
   	   	 <%--Root Constant--%>
			var EIBS_CONTEXT = "${pageContext.request.contextPath}";
   	   		var EIBS_ROOT = "/" + EIBS_CONTEXT.split("/").slice(1)[0];   
			var EIBS_LANGUAGE = ${sessionScope.currUser != null} ? "${sessionScope.currUser.E01LAN}" : "s" ;
			var EIBS_LANGUAGEPATH = EIBS_LANGUAGE + "/";
			var EIBS_URL_SYMBOL = "<%= AuthorizationManager.isActive(request.getSession(false).getServletContext()) ? "&" : "?" %>";
			var EIBS_URL_WAIT = "${pageContext.request.contextPath}/pages/s/body_wait.jsp?ServletName=";				 			
			var EIBS_ERROR_PG = "${pageContext.request.contextPath}/pages/s/error_viewer.jsp";
			
		 <%--Path Constants--%>
			var EIBS_HTML_PATH = EIBS_CONTEXT + "/pages/";
			var EIBS_PAGES_PATH = EIBS_HTML_PATH + EIBS_LANGUAGEPATH ;
			var EIBS_IMAGE_PATH = EIBS_ROOT + "/images/";
			var EIBS_JAVASCRIPT_PATH = EIBS_ROOT + "/pages/" + EIBS_LANGUAGE +"/javascripts";   		
		<%--Currency Constants--%>
			var EIBS_AMOUNT_FORMAT = true;
			var EIBS_DecSeparator = '<%= DecimalField.getDecimalSeparator() %>';
			var EIBS_GrpSeparator = '<%= DecimalField.getGroupingSeparator()%>';
			var EIBS_DECIMAL_LENGTH = 2 ;   
		
		<%--Varaible Error Module--%>
			var errorArray = [
					<%  
						for (int i = 1; i <= 10; i++) {
							String sufix = i < 10 ? "0" + i : "" + i;
							Boolean warningFlag = error.getField("ERWF" + sufix).toString().trim().equals("Y");
							String errorField = error.getField("ERDF" + sufix).toString().toUpperCase().trim();
							String errorDsc = error.getField("ERDS" + sufix).toString().trim();
							String errorType = warningFlag ? "warning" : "error"; 
							
							if (!error.getField("ERNU" + sufix).toString().trim().equals("")) {
									
					 %>
						<%= i != 1 ? "," : "" %> { errorField : String('<%= errorField.replace("'", "") %>'),
												   errorDSC : String('<%= errorDsc.replace("'", "") %>') , 
												   errorType : String('<%= errorType.replace("'", "") %>')}
					<%		}
						}
					%>
		    	];

		<%--Function Returns Constants--%>	   
	   		EIBS.root = function(){ return EIBS_ROOT;};
			EIBS.language = function(){ return EIBS_LANGUAGE;};
			EIBS.languagePath = function(){ return EIBS_LANGUAGEPATH;};
			EIBS.context = function(){ return EIBS_CONTEXT;};
			EIBS.html = function(){ return EIBS_HTML_PATH;};
			EIBS.pagesPrefix = function(){ return EIBS_PAGES_PATH;};
			EIBS.imgPath = function(){return EIBS_LANGUAGE;};
			EIBS.javascriptsPath = function(){return EIBS_JAVASCRIPT_PATH;};
			EIBS.urlSymbol = function(){return EIBS_URL_SYMBOL;};
			EIBS.waitURL = function(){return EIBS_URL_WAIT;};
   			EIBS.goURL = function (){
   					var hid = ""; var parArr;
   					if(arguments[0]){
		     			hid = arguments[0];
	   					if(arguments[1]){ parArr = Array.prototype.slice.call(arguments,1);} <%--Remove HelpID from Array, leaves only request parameters in parameter array--%>	

		   				if(typeof parArr !== 'undefined' && parArr instanceof Array){
		   					 	parArr.substitue(undefined,''); 
		   				}
   					}
   					
   					return "${pageContext.request.contextPath}/servlet/datapro.eibs.menu.JSPopUpUrl?popUpID=" + hid + "&popUpJSON=" + encodeURIComponent(JSON.stringify(parArr)); 
   			};
							
		<%--Currency Module--%>		
			EIBS.currency = {
					amountformat : function(){return EIBS_AMOUNT_FORMAT;} ,
					decSeparator : function(){return EIBS_DecSeparator;} ,
					grpSeparator : function(){return EIBS_GrpSeparator;} ,
					decimalLength : function(){return EIBS_DECIMAL_LENGTH;} 
				};
				
		<%--ERROR MODULE--%>				
			EIBS.error = {
				page : function(){ return EIBS_ERROR_PG ;},
				errorToolTips : {},
				warningArray : {},
		    	errorArray : function() { return errorArray; }
			};
	 }	
	 
   })(window.EIBS =  typeof window.EIBS !== 'undefined' ? window.EIBS : {} , window.document);

	function IncludeJavaScript(jsFile) {
		document.write('<script type="text/javascript" src="'+jsFile+'"></script>');
	}
	
	<%--For JSP, full path is used.   --%>
	<%--For JS files, Context from EIBS is used.  
		When Security is active and Resource is replaced with hashed value, full path is used
	 --%>
	
	IncludeJavaScript( EIBS.javascriptsPath() + '/CrossBrowserFunctions.js');
	IncludeJavaScript( EIBS.javascriptsPath() + '/events.js');
	IncludeJavaScript( EIBS.javascriptsPath() + '/eIBS.js');
	IncludeJavaScript( EIBS.javascriptsPath() + '/graphical.js');
	IncludeJavaScript( EIBS.javascriptsPath() + '/jqueryImport.js');
	IncludeJavaScript( EIBS.javascriptsPath() + '/inputFields.js');
	IncludeJavaScript( EIBS.javascriptsPath() + '/id.js');
	IncludeJavaScript( EIBS.javascriptsPath() + '/General/help.js'); 
	
	<% 
	try {
		if ("CO".equals(userPO.getOption())) {
			String optAddMenu = "module" + userPO.getOption() + ".jsp";
			String reaonly = userPO.getPurpose().equals("INQUIRY") 
								|| userPO.getPurpose().equals("APPROVE") ? "readonly" : "";
			String popup = userPO.getPurpose().equals("APPROVE") ? "true" : "false";
	%>
			IncludeJavaScript( '${pageContext.request.contextPath}/pages/s/javascripts/<%=optAddMenu%>?reference=<%=userPO.getAccNum()%>&table=<%=userPO.getHeader18()%>&readOnly=<%=reaonly%>&popup=<%=popup%>');
	<% 
		} else if ("PR".equals(userPO.getOption())) {
			String optAddMenu = "module" + userPO.getOption() + ".jsp";
			String reaonly = userPO.getPurpose().equals("INQUIRY") 
								|| userPO.getPurpose().equals("APPROVE") ? "readonly" : "";
			String popup = reaonly.equals("readonly") ? "true" : "false";
	%>
			IncludeJavaScript( '${pageContext.request.contextPath}/pages/s/javascripts/<%=optAddMenu%>?reference=<%=userPO.getIdentifier()%>&readOnly=<%=reaonly%>&popup=<%=popup%>');
	<% 
		}
	} finally {
	}
	%>
	
function GetCNOFCSelect(code, table, ordered, filter1, filter2){
	var orderParam = 'false';
	if(ordered){
		orderParam = 'true';
	}
	$.ajax({
		url : ('${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSCNOFCodes'),
		data : {'nameId' : code, 'table' : table, 'order' : orderParam, 'filter1' : filter1, 'filter2' : filter2},
		async: false
	}).done(function(xmlResponse) {
		if (isValidObject(xmlResponse)) {
			if(typeof xmlResponse === 'string'){
				parseSelectXML($.parseXML(xmlResponse));
			} else {
				parseSelectXML(xmlResponse);
			}
		}
	}).fail(function(jqXHR, textStatus) {
	  alert( "La información del CNOFC no pudo ser consultada : tabla " + table );
	});	
}

