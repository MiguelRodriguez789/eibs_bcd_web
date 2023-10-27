<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Assign Accounts to Cards</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckCard(){
if ( document.forms[0].E01CCANUM.value.length < 1) {
  alert("Debe entrar una tarjeta válida");
  document.forms[0].E01CCANUM.value='';
  document.forms[0].E01CCANUM.focus();
  return false;
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

<H3 align="center">Consulta de Cuentas Asignadas a Tarjetas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_inq_enter_card, ECC0080"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0080I" onsubmit="return(CheckCard())">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="800">
    <INPUT TYPE=HIDDEN NAME="opt" VALUE="<%=request.getParameter("opt")%>">
  </p>

  <table class="tbenter" HEIGHT="75%" width="100%" border="0">

    <tr> 
      <td nowrap ALIGN=CENTER>
        Numero de tarjeta: 
        <INPUT type="text" name="E01CCANUM" size="21" maxlength="20" value="639489"  onkeypress="enterInteger(event)">
			<A href="javascript:GetPlastic2('E01CCANUM','','')">
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Lista Tarjetas" align="bottom" border="0"></A> 
        <br>
 <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Aceptar">
  </div>     
      </td>
    </tr>
  </table>
  
<script type="text/javascript">
  document.forms[0].E01CCANUM.focus();
  document.forms[0].E01CCANUM.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
  <%
 }
%> 
</form>
</body>
</html>

