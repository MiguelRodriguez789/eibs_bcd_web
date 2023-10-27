<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Parametros Extractos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckAcc(){
if ( document.forms[0].E04STMBNK.value.length < 1) {
  alert("Introduzca un Codigo de Banco Válido");
  document.forms[0].E04STMBNK.value='';
  document.forms[0].E04STMBNK.focus();
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>
</head>

<jsp:useBean id= "rtStm" class= "datapro.eibs.beans.ESD006004Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body bgcolor="#FFFFFF">


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
	 out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Parámetros Extractos
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_param_bank_statements_1.jsp , ESD0060"> 
</h3><hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0031" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="601">
   
  </p>

  <table class="tbenter" height="75%" width="100%" border="0">
    <tr>
      <td nowrap align="center">  </td>
    </tr>
    <tr>
       <td nowrap align="center"> 
   		   Banco : 
           <INPUT type="text" name="E04STMBNK" size="3" maxlength="2" value='01'>
      </td>
    </tr>
    <tr>
       <td nowrap align="center"> 
   		   <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onClick="javascript:CheckAcc()">
      </td>

    </tr>
  </table>

<script type="text/javascript">
  document.forms[0].E04STMBNK.focus();
  document.forms[0].E04STMBNK.select();
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
