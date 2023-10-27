<%@ page language="java" %>
<%-- set document type to Javascript (addresses a bug in Netscape according to a web resource --%>

<%@ page contentType="text/javascript"%>

<%-- Global Variables --%>
	var menuImgRef;
	var menuRef;
	var hPopupRef;
	var mnuHelpRef;
	var menuactive = false;
	var animactive = false;
	var ontime = "";
	var outtime = "";
	var outtime2 = "";
	var curlen = 0;
	var popupStatus = "open";
	
	function builtNewMenu(options) {
		<% 
			String optionMenu = (String)session.getAttribute("option-menu");
			if(optionMenu == null){
				optionMenu = pageContext.getServletContext().getInitParameter("default-option-menu");
			}
			optionMenu = optionMenu == null ? "" : optionMenu;
		%>
		createMenu('<%=optionMenu%>');
		var action = "${pageContext.request.contextPath}/servlet/datapro.eibs.menu.JSOptMenu?optMenu=" + options;
		GetXMLResponse(action, menuCallback, false);
	}		

	function IncludeJavaScript(jsFile) {
		document.write('<script type="text/javascript" src="'+jsFile+'"></script>');
	}
	
	function OptionURL(sid, den, code, index) {
		var url = "${pageContext.request.contextPath}&optMenuId="+sid+"&optMenuDen="+den+"&optMenu="+code+"&index="+index;
		return url;
	}
	
	IncludeJavaScript("${pageContext.request.contextPath}/pages/s/javascripts/Ajax.js");
	IncludeJavaScript("${pageContext.request.contextPath}/pages/s/javascripts/graphical.js");
	IncludeJavaScript("${pageContext.request.contextPath}/pages/s/javascripts/optMenu.js");
	IncludeJavaScript("${pageContext.request.contextPath}/pages/s/javascripts/optIBS.js");	
	


	
	
	