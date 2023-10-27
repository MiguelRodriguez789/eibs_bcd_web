<%@ page language="java" %>
<%-- set document type to Javascript (addresses a bug in Netscape according to a web resource --%>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error"    class= "datapro.eibs.beans.ELEERRMessage"     scope="session" />

<%@ page contentType="application/x-javascript" %>


//Function to set the page read Only

function readOnlyPage(){
	
   //$("input").css("background-color", "LightGray");
   //$("input").css("border-style", "groove");
	$("input[type='text']").attr("readonly", "readonly").prop("onchange",null).prop("change",null);  
	$("select").add("button").add("textarea").add("submit").add("input[type='radio']").add("input[type='checkbox']").attr("disabled", "disabled").prop("onchange",null).prop("change",null);  
	$("img[title='null']").add("img[src*='1b.gif']").add("img[src*='Check.gif']").add("img[src*='calendar.gif']").hide(); 	
	$("input.context-menu-help").removeAttr("onmousedown").removeClass();
}




<% if( "1".equals( currUser.getH01WK1() ) ){ %>

	$(document).ready(function(){
		readOnlyPage();
	});
<% } %>






