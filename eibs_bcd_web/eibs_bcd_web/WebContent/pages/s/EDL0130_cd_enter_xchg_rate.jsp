<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Mantenimiento - Cambio de Tasa</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "cdRate" class= "datapro.eibs.beans.EDL013006Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckACC(){
if ( document.forms[0].E06DEAACC.value.length < 1) {
  alert("Debe entrar un cuenta valida");
  document.forms[0].E06DEAACC.value='';
  document.forms[0].E06DEAACC.focus();
  return false;
}
else {
  return true;
  }
}

</SCRIPT>
<%
String blocked = "";
if (currUser.getE01AUT().trim() != "B") {
		blocked = "readonly disabled";
	}
%> 

</head>

<body bgcolor="#FFFFFF">

<h3 align="center">Cambio de Tasa de Certificados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_enter_xchg_rate, EDL0130"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130" onsubmit="return(CheckACC())">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2000">
  </p>
  
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" height="80%" border="0">
		  <tr> 
            <td nowrap align="center"> 
              Número de Cuenta :
              <INPUT type="text" name="E06DEAACC" size="13" maxlength="12" onkeypress="enterInteger(event)" value="<%= cdRate.getE06DEAACC() %>" <%=blocked%>> 
              <a href="javascript:GetAccount('E06DEAACC','','CD','')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              <p align="center"> 
		</p> 

	  <div align="center"> 
		<% if (currUser.getE01AUT().trim() == "B") { %>
    		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
		<% } else { %>
			<h3 align="center"><b>No Autorizado para Modificar Tasa</b></h3>
		<% } %>
	 </div>

	</td>
   </tr>
</table>
     
  
  <script type="text/javascript">
  document.forms[0].E06DEAACC.focus();
  document.forms[0].E06DEAACC.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
