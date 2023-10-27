<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Mensajes de Alerta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckACC(){

	if(document.forms[0].E01ACMCUM.value.length < 1){
		alert("Por favor entre un número de cuenta o número de identificación");
		document.forms[0].E01ACMCUM.value='';
		document.forms[0].E01ACMCUM.focus();
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

<h3 align="center">Mensajes de Alerta
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_alert_messages_3.jsp , ESD0050"> 
</h3><hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0050" >
  <p> 
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="120">
 <input type="hidden" name="E01ACMCUM" value='E01ACMCUN'>


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
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="50%"> 
                <input type="text" name="E01ACMCUN" size="10" maxlength="9">
                <a href="javascript:GetCustomer('E01ACMCUN')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
            </td>
          </tr>

    <tr>
      <td nowrap align="center">  
      </td>
    </tr>

        </table>
      </td>
    </tr>
  </table>

    	  <div align="center"> 
   		   <input id="EIBSBTN" type=button name="Submit" OnClick="CheckACC()" value="Enviar">
    	  </div>




<script type="text/javascript">
  document.forms[0].E01ACMCUM.focus();
  document.forms[0].E01ACMCUM.select();
</script>

</form>
</body>
</html>
