<%@page import="datapro.eibs.sockets.MessageRecord"%>
<%@ page language="java" %>
<%-- set document type to Javascript (addresses a bug in Netscape according to a web resource --%>

<%@ page contentType="application/x-javascript" %>

var changedFields = [

<%
	String msgObject = request.getParameter("MSGOBJ");
	if( msgObject == null ){
		throw new RuntimeException("INVALID REQUEST PARAMETER 'MSGOBJ'");
	}
	
	MessageRecord mr = (MessageRecord)session.getAttribute( msgObject ) ;
	for (int i = 0; i < mr.getFieldCount(); i++) {
		
		if( mr.getField( i ).getTag().startsWith("F") && "Y".equalsIgnoreCase( mr.getField( i ).getString() ) ) {
%>
			"<%= "E" + mr.getField( i ).getTag().substring(1) %>",
<%			
		}
	}
%>
];

$(document).ready(function(){

	for	(index = 0; index < changedFields.length; index++) {
	    $( ":input[name='" + changedFields[index] + "']" ).addClass("TXTCHANGED");
	}

});

