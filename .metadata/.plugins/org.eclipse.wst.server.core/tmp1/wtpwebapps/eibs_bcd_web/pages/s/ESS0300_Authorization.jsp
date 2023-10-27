<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script>

$(document).ready(function(){
	
	 $( "button#validate" ).click(function( e ){
		 e.preventDefault();
    
    	console.log("clicked called: #validate ");
    	
    	//$("button#validate").css("visibility", "hidden");
    	$("button#validate").hide();
    	$("#proc").show(); 
    	
        $.ajax(
                {
                	url:"<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSESS0300", 
                	type:"POST",
                	async:false,
                	
                	data: {
                		E01SID: $("#aUserid").val(),
                		E01PSW: $("#aPassword").val()
                    },
                    
                    success: function(result,status,xhr){
                    	
                    	$("input[name$='MAS']").val("A");
                    	$("form:first").prepend("<input name='E01DPAPPROVED' type='hidden' value='true' >");
                    	$("form:first").prepend("<input name='E01APPSID' type='hidden' value='" + $("#aUserid").val() + "' >");
                   		$("form:first").first().submit();
                    	
                    },
                    
                    error: function(xhr,status,error){
                        
						//$("button#validate").css("visibility", "visible");
						$("button#validate").show();
						$("#proc").hide();
						
                        if( xhr.status == 570 ){ //USER NOT AUTHORIZED TO APPROVE
                        	if( typeof showErrors == 'function' ){
                        		showErrors();	
                        	} else {
                        		console.log( "showErrors MOCK CALLLED " );
                        		$("button#validate").css("background-color", "pink");
                        	}
                        	
                        } else {
                        	alert("ERROR \nStatus: " + status + "\nError" + error );
                        }                        
                    	
                    }
                    
         });
    	
		 console.log("Autorization Processed");
	});	

	 
}); 

</script>


</head>
<body >

<span id="b1" style="text-align:center; background-color: LemonChiffon ;display:table;margin:0 auto;padding: 30px;border-style: dashed;border-color: Steel#d0122c ;box-shadow: 8px 8px 5px grey;"  >

<h3>Autorizaci&oacute;n</h3>

<table style="text-align:center; background-color: LemonChiffon ;" >
  <tr>
    <th>Usuario</th>
    <th>Clave</th>
  </tr>
  <tr>
    <td> <input type="text" id="aUserid" name="aUserid" size="17" maxlength="10" > </td>
    <td> <input type="password" id="aPassword" name="aPassword" size="17" maxlength="15" > </td>
  </tr>
</table>

<button id="validate" >Autorizar</button>
<img id="proc" alt="Processing" src="<%=request.getContextPath()%>/images/animated-processing.gif" style="width: 21px; height: 21px; display: none; "  >

</span>

</body>
</html>
