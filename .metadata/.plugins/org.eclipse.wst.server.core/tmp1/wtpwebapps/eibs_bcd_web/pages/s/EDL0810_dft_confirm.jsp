<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<head>
<title>Loan Confirmation </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>


<SCRIPT type="text/javascript">
 function finish(){
	//self.window.location.href = "${pageContext.request.contextPath}/pages/background.jsp";
	document.forms[0].submit();
 }

 setTimeout("finish()", 17000);
 
</SCRIPT>


</head>

<body>

			<!--			if (user.getE01AUT().trim().equals("O")) {
							res.sendRedirect(super.srctx+ "/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1800&E01DLHNRO="+ collBasic.getE01DLHNRO());
						} else {
							res.sendRedirect(super.srctx+ "/servlet/datapro.eibs.products.JSEDL0800?SCREEN=400&E01DLHNRO="+ collBasic.getE01DLHNRO());
						}-->

 
<h3 align="center"><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_confirm, EDL0810" ></h3>
<hr size="4">

<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0810" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1500">


  <table width="100%" height="100%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="100%">
          <tr> 
          <td align=center> La planilla <b><%= userPO.getIdentifier()%></b> ha sido creada satisfactoriamente. </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
</body>
</html>
