<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cheques de Gerencia</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckCCY(){
	if(isNaN(document.getElementByID("E01STPCCY").value)||(document.getElementByID("E01STPCCY").value.length < 1)){
		alert("Debe introducir un valor valido de moneda.");
		document.getElementByID("E01STPCCY").value='';
		document.getElementByID("E01STPCCY").focus();
	}
	else {
		document.forms[0].submit();
	}
	
	if(isNaN(document.getElementByID("E01STPACC").value)||(document.getElementByID("E01STPACC").value.length < 1)){
		alert("Debe introducir un valor valido de cheque.");
		document.getElementByID("E01STPACC").value='';
		document.getElementByID("E01STPACC").focus();
	}
	else {
		document.forms[0].submit();
	}
}

</SCRIPT>
</head>

<body>

<%  if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Orden de No Pago - Cheques Oficiales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_enter_stop.jsp, EDD0180"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0180" >

  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="700">
  </p>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="50%">
              <div align="right">C&oacute;digo de Moneda : </div>
            </td>
            <td nowrap width="50%">
              <input type="text" name="E01STPCCY" id="E01STPCCY" size="4" maxlength="3" >
              <a href="javascript:GetCurrency('E01STPCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a> 
            </td>
          </tr>           
          <tr> 
            <td nowrap width="50%">               
              <div align="right">N&uacute;mero de Cheque :</div>        
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01STPACC" id="E01STPACC" size="12" maxlength="11" onKeypress="enterInteger(event)">
              <a href="javascript:GetOfficialCheck('E01STPACC',' ', '1',document.getElementById('E01STPCCY').value,'D')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0"></a> 
            </td>
          </tr>         
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>

	    <div align="center"> 
    	  <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
   		</div>

<script type="text/javascript">
  document.getElementByID("E01STPACC").focus();
  document.getElementByID("E01STPACC").select();
  
  document.getElementByID("E01STPCCY").focus();
  document.getElementByID("E01STPCCY")select();
</script>
 
</form>
</body>
</html>
