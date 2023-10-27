<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Collections"%>
<%@page import="java.util.Enumeration"%>
<%@page import="datapro.eibs.beans.JBObjList"%>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/events.js"> </script>
<title>Close Top Opener</title>
</head>
</body>
<script type="text/javascript">
function isValidObject(objToTest) {
	if (null == objToTest) return false;
	if ("undefined" == typeof(objToTest)) return false;
	return true;
}

	if(	isValidObject(top)){
		if(	isValidObject( window.opener || top.opener)){
			var formDummy = top.opener.document.forms[0];
			var elementName = "";
			<%
			JBObjList triggerVars = (JBObjList) request.getAttribute("triggerVars");
		    Enumeration enu = Collections.enumeration(triggerVars);
			String parname = "";
			while (enu.hasMoreElements()) {
				parname = (String)enu.nextElement();
			%>
			elementName = String('<%= parname %>');
			if(	isValidObject( formDummy[elementName] )){
				EventShooter(formDummy[elementName], "change");
			}
			<%	} %>	
		setTimeout(	top.close , 500); 
	} else {
		if(window.name !== 'main'){
			window.close;
		}
	}
  }
</script>
</html>