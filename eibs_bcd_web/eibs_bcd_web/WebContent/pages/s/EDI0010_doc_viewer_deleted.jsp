<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>
Blank
</TITLE>
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css">
<jsp:useBean id= "ROW" class= "java.lang.String"  scope="session" />

<script>
  	function closeWindow() {
	  	if (parent.opener.flagFI != null) {
    		if (!parent.opener.flagFI && !parent.opener.flagFI.value == 'Y'){
	  			parent.opener.window.location.href="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=2&opt=3&ROW=<%=ROW%>&FLGDEL=1";
			}
	  	}	
		top.close();
	}
</script>
</HEAD>

<BODY>

	<h3> La imagen ha sido borrada de la base de datos </h3>
	<div align="CENTER">
	   <input type="button" name="Continuar" value="Continuar" onclick="closeWindow();" />
	
	</div>
	

</BODY>
</HTML>
