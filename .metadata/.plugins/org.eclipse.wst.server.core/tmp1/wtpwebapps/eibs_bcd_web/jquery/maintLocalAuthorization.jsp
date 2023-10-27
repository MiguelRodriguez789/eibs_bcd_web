<%@ page language="java" %>
<%-- set document type to Javascript (addresses a bug in Netscape according to a web resource --%>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error"    class= "datapro.eibs.beans.ELEERRMessage"     scope="session" />

<%@ page contentType="application/x-javascript" %>

var authUrl = "<%=request.getContextPath()%>/pages/s/ESS0300_Authorization.jsp" ; 


function enableLocalAuthorization( autorizationServiceUrl ){
	
    $("form:first").after("<div id='auth' > </div><div id='authAfter' >&nbsp; </div>");
    $("#EIBSBTN").attr("type","button").attr("onClick","").unbind("click");
//    $("#EIBSBTN").insertAfter( $("form:first") );
    
//	$("#EIBSBTN").click(function(){
		$("#auth").load( autorizationServiceUrl ) ;
		$('html, body').animate({scrollTop: $(document).height()}, 'slow');
//	});
	

	
}



function getHostErrorCode(){

	var retCode = "-10";

	    $.ajax(
	    {
         	url:"<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSGetHostErrorCode", 
         	type:"POST",
         	async: false,
         	
         	data: {
         		SCREEN: "100"
            },
                    			                
			success: function(result,status,xhr){
				console.log( "DataproHostErrorCode:" + xhr.getResponseHeader( "DataproHostErrorCode" ) );
				retCode = xhr.getResponseHeader( "DataproHostErrorCode" ) ;
			},
			
			error: function(xhr,status,error){
				console.log( "Error processing error msg:" + status + ":" + error );
 				retCode = -1 ;
			}
                
	    });

	return retCode;

}

function deleteErrorFromSession(){

	    $.ajax(
	    {
         	url:"<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSGetHostErrorCode", 
         	type:"POST",
         	async: false,
         	
         	data: {
         		SCREEN: "200"
            }
                
	    });

}

function enableDataValidation(){

	var oHandler = document.getElementById("EIBSBTN").onclick ;
//	console.log( "oHandler 00:" + oHandler );

    $("#EIBSBTN").attr("type","button").attr("onClick","").unbind("click");
    $("#EIBSBTN").after( "<img id='procM' alt='Processing' src='<%=request.getContextPath()%>/images/animated-processing.gif' style='width: 21px; height: 21px; display: none; '  >" );
    
    $("#EIBSBTN").click(function(e){
    	e.preventDefault();
    
//    	console.log( "oHandler:" + oHandler );
//    	console.log( "typeof oHandler:" + (typeof oHandler == "function") );
//    	var res = oHandler() ;
//    	console.log( "oHandler3:" + res );
    	if( (typeof oHandler == "function") && ! oHandler() ){
    		return false ;
    	}
    
    	$("#EIBSBTN").hide();
    	$("#procM").show(); 
    
    	var addAttr = $("#aUserid").length? "&E01SID=" + $("#aUserid").val() : "" ;
    	console.log( $("#aUserid") );
    	console.log( addAttr );
    
	    $.ajax(
	    {
			url:$("form").first().attr("action"), 
			type:"POST",
			        	
			data: $("form").first().serialize() + addAttr , 
			                
			success: function(result,status,xhr){

				//validate Host Error Code
				var hostError = getHostErrorCode();
				console.log( "HostErrorCode:" + hostError );
				
				if( hostError == 2018 || hostError == 2038  ) {
					enableLocalAuthorization( authUrl );
					
				} else if( xhr.getResponseHeader( "DataproError" ) || hostError == -1 || hostError == 0  ) {
					alert( "Error: Servicio no disponible" );

					$("#EIBSBTN").show();
					
				} else {
					showErrors();
					
				    $("#EIBSBTN").show();
				
					deleteErrorFromSession();
				}
				
				$("#procM").hide();	
				
			},
			
			error: function(xhr,status,error){
			    alert("ERROR \nStatus: " + status + "\nError" + error );
			    $("#EIBSBTN").show();
    			$("#procM").hide(); 
			}
                
	    });
	    
	});

}

<% if( ! "1".equals( currUser.getH01WK1() ) ){ %>

	
	$(document).ready(function(){
	
		$(":input:not(:submit):not(:submit)").change(function(){
	        $(this).css("background-color", "#FFFF66");
	    });
		
		$(":radio").parent().change(function(){
	        $(this).css("background-color", "#FFFF66");
	    });
	    

	    console.log( '$("#EIBSBTNDEL").length:' + $("#EIBSBTNDEL").length );
	    
       	if( $("#EIBSBTNDEL").length == 0 ){
       		enableDataValidation();
       		
       	}

	    
	    
	});

<% } %>




