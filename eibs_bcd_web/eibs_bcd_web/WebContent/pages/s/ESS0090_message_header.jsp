<!-- Sample HTML file -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 //EN">
<HTML>
<HEAD>
<TITLE>
Message Header
</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
  var reason = '';

  function goAction(op) {
		 
         parent.msgList.document.forms[0].opt.value = op;
       	 parent.msgList.document.forms[0].reason.value = reason;
       	 var ok = true;
		 
   	   	if ( ok ) {
           	switch ( op ) {
  					case 1 : 
             			parent.msgList.document.forms[0].target = "main";
     					break;
  					case 2 : 
             			parent.msgList.document.forms[0].target = "_parent";
				    	break;
  					default : 
             			parent.msgList.document.forms[0].target = "main";
             			break;
			}
            parent.msgList.document.forms[0].submit();
            top.close();
       	} else {
   			alert("Seleccione un cliente antes de realizar esta operaci�n");	   
       	}
  }

  function validate(op) {
  	
		 var apl = parent.msgList.document.forms[0].appCode.value;
		 
		 if (apl == "00") {
		 	alert("Esto es solo un mensaje informativo que no requiere Acci�n");
		   	goAction(3);
		 } else {
		  	if ( op == 2 ) {
		     	var msg = parent.msgList.document.forms[0].msgCode.value;
		     	if ( msg == "E" ) {
		     		enterReason(2);
			  	} else {
		    	   	alert("Esta operaci�n no aplica para este mensaje. Msg =" + msg + "valor");	   
			  	}
		
		  	} else {
		   		goAction(1);
		  	}
		}  	
 }

</script>
</HEAD>
<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/set_it_fixed_over.gif','<%=request.getContextPath()%>/images/s/go_to_action_over.gif')">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESS0090" target="main">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
  <TABLE width="100%" class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="33%">
  			<a href="javascript:validate(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/s/go_to_action_over.gif',1)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/s/go_to_action.gif" ></a>
      <TD ALIGN=CENTER width="33%">
  			<a href="javascript:validate(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/s/set_it_fixed_over.gif',1)"><img name="Image2" border="0" src="<%=request.getContextPath()%>/images/s/set_it_fixed.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="34%">
  			<a href="javascript:top.close()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<%=request.getContextPath()%>/images/s/exit_over.gif',1)"><img name="Image3" border="0" src="<%=request.getContextPath()%>/images/s/exit.gif" ></a>
      </TD>
    </TR>
  </TABLE>
</FORM>
</BODY>
</HTML>
