<%@ page language="java" %>
<%-- set document type to Javascript (addresses a bug in Netscape according to a web resource --%>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error"    class= "datapro.eibs.beans.ELEERRMessage"     scope="session" />

<%@ page contentType="application/x-javascript" %>

var authUrl = "<%=request.getContextPath()%>/pages/s/ESS0300_Authorization.jsp" ; 


function enableDeleteAuthorization( ){
	
	if( $("#auth").length == 0 ){
		//$("#EIBSBTNDEL").closest("table").after("<br/><div id='auth' > </div><div id='authAfter' >&nbsp; </div>");	
		$("form").before("<br/><div id='auth' > </div><div id='authAfter' >&nbsp; </div>");
	}

    
	$("#auth").load( authUrl ) ;
	
}





