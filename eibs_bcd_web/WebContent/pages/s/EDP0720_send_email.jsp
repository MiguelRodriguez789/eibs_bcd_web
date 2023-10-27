<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Enviar Email</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="msgRT" class="datapro.eibs.beans.EDP072001Message" scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers
    function sendMail() {
        var link = "mailto:<%=msgRT.getE01DPZEXP ().trim()%>"
                        + "&subject=" + encodeURIComponent ('Procesar Propuesta <%=msgRT.getE01PLPNPR().trim()%>')
                        + "&body=" + encodeURIComponent ('<%=msgRT.getE01DPSCOM().trim()%>')
                ;

        window.location.href = link;
//		document.forms[0].submit();		  	       	       
    }
//-->
</script>
</head>
<body onload="javascript:sendMail()">
<form method="post"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0720">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100"> 
	<INPUT TYPE=HIDDEN NAME="OPTION" VALUE="<%=userPO.getOption()%>"> 

</form>
</body>
</html>			
