<html>
<head>
<title>Sobregiros Cuentas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckNum(){
if(isNaN(document.forms[0].E03ACMACC.value)||(document.forms[0].E03ACMACC.value.length < 1)){
alert("Debe introducir un valor valido de cuenta");
document.forms[0].E03ACMACC.value='';
document.forms[0].E03ACMACC.focus();
}
else {   
  document.forms[0].submit();
}
}

</SCRIPT>   

</head>



<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body bgcolor="#FFFFFF">

<h3 align="center">Sobregiros Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_enter_sobregiro, EDD0000"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2005">
  </p>
  
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr><td>&nbsp;</td></tr>
		   <tr><td>&nbsp;</td></tr>
		    <tr><td>&nbsp;</td></tr>
			 <tr><td>&nbsp;</td></tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Ingrese el n&uacute;mero de cuenta :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E03ACMACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
              <a href="javascript:GetAccount('E03ACMACC','','RA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"  ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
<script type="text/javascript">
  document.forms[0].E03ACMACC.focus();
  document.forms[0].E03ACMACC.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>;
 <%
 }
%>
</form>
</body>
</html>
