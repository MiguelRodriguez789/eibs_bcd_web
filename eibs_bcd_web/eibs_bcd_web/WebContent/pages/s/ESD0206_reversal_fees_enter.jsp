<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Reintegro/Reversi�n de Comisiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckACC(){

	if(document.forms[0].E01CACACC.value.length < 1){
		alert("Ingrese un N�mero de Cuenta V�lido.");
		document.forms[0].E01CACACC.value='';
		document.forms[0].E01CACACC.focus();
	} else {
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

<h3 align="center">Reintegro/Reversi�n de Comisiones
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reversal_fees_enter.jsp , ESD0206"> 
</h3><hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0206" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>

  <table class="tbenter" height="75%" width="100%" border="0">
    <tr>
          
      <td nowrap align="center"> N&uacute;mero de Cuenta : 
        <input type="text" name="E01CACACC" size="13" maxlength="12" onkeypress="enterInteger(event)">
              <a href="javascript:GetAccount('E01CACACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"  ></a> 
        
    	  <div align="center"> 
   		   <input id="EIBSBTN" type=button name="Submit" OnClick="CheckACC()" value="Enviar">
    	  </div>
  		 
      </td>
    </tr>
  </table>
<script type="text/javascript">
  document.forms[0].E01CACACC.focus();
  document.forms[0].E01CACACC.select();
</script>

</form>
</body>
</html>
