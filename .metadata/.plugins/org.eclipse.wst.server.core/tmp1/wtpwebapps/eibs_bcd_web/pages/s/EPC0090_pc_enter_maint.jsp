<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Calculo de Valuación Proyecto de Constructor</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckACC(){
if(document.forms[0].E01PCMACC.value.length < 1){
alert("A valid number must be entered");
document.forms[0].E01PCMACC.value='';
document.forms[0].E01PCMACC.focus();
}
else {
  document.forms[0].submit();
}
}

</SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "pcMant" class= "datapro.eibs.beans.EPC009001Message"  scope="session" />

<body bgcolor="#FFFFFF">

<h3 align="center">Calculo de Valuación Proyecto de Constructor<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_enter_maint, EPC0090"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0090">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  </p>

  <table class="tbenter" height="75%" width="100%" border="0">
    <tr>
          <td nowrap align="center">
              Número de Proyecto :
              <INPUT type="text" name="E01PCMACC" size="14" maxlength="12" onkeypress="enterInteger(event)" value="<%= pcMant.getE01PCMACC() %>">
              <a href="javascript:GetAccount('E01PCMACC','','19','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
		<p align="center"> 
			<% 
			if (error.getERWRNG().equals("Y")) { 
				error.setERWRNG(" ");
			%>
				<input type="checkbox" name="H01FLGWK2" value="A">
      				Reactivar Cuenta.
			<% 
			} 
			%>
		</p>              
		 <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="CheckACC()">
  </div>
            </td>
          </tr>
        </table>
      
  </form>
<script type="text/javascript">
document.forms[0].E01PCMACC.focus();
document.forms[0].E01PCMACC.select();
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
</body>
</html>
