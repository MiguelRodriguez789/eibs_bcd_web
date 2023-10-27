<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Asignación de Tarjetas de Débito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckNum(){
	if (document.forms[0].E01PRICUN.value.length < 1){
		alert("Entre un numero de cliente valido");
		document.forms[0].E01PRICUN.value='';
		document.forms[0].E01PRICUN.focus();
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


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
	 out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Asignación de Tarjetas
de Débito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="assign_accounts.jsp, ECC0090"> 
</h3><hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0090" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  </p>
  
  <table class="tbenter" height="75%" width="100%" border="0">
    <tr>
          
      <td nowrap align="center">
      <div>
       Número de Cliente : 
        <input type="text" name="E01PRICUN" size="10" maxlength="9" onKeyPress="enterInteger(event)">
        <a href="javascript:GetCustomerDescId('E01PRICUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
        </div>
      </td>
    </tr>
  </table>
   	  <div align="center"> 
  		   <input id="EIBSBTN" type=button name="Submit" OnClick="CheckNum()" value="Enviar">
   	  </div>
<script type="text/javascript">
  document.forms[0].E01PRICUN.focus();
  document.forms[0].E01PRICUN.select();
</script>

</form>
</body>
</html>
 