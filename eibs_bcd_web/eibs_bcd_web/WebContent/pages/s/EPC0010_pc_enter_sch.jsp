<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Participantes de Pool Asociados a Proyecto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT> 

<SCRIPT type="text/javascript">

function CheckACC(){
if ( document.forms[0].E01PCPACC.value.length < 1) {
  alert("Debe entrar un cuenta valida");
  document.forms[0].E01PCPACC.value='';
  document.forms[0].E01PCPACC.focus();
  return false;
}
else {
  return true;
  }
}

</SCRIPT>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "pcScheme" class= "datapro.eibs.beans.EPC001001Message"  scope="session" />

<body bgcolor="#FFFFFF">

<h3 align="center">Participantes de Pool Asociados a Proyecto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_enter_sch,EPC0010"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0010" onsubmit="return(CheckACC())">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
  
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" height="80%" border="0">
		  <tr> 
            <td nowrap align="center"> 
              Número de Proyecto :
              <INPUT type="text" name="E01PCPACC" size="15" maxlength="12" onkeypress="enterInteger(event)" value="<%= pcScheme.getE01PCPACC() %>">
              <a href="javascript:GetAccount('E01PCPACC','','19','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
              <p align="center"> 
		</p> 
        <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</td>
</tr>
</table>
     
  
  <script type="text/javascript">
  document.forms[0].E01PCPACC.focus();
  document.forms[0].E01PCPACC.select();
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
