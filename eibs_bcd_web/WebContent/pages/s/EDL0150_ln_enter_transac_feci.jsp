<html>
<head>
<title>Solicitud de Transacciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function CheckNum(){
	if(isNaN(document.forms[0].E03DEAACC.value)||(document.forms[0].E03DEAACC.value.length < 1)){
	alert("Debe ingresar un n�mero de Certificado valido");
	document.forms[0].E03DEAACC.value='';
	document.forms[0].E03DEAACC.focus();
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

<h3 align="center">Transacciones de Pr&eacute;stamos (F.E.C.I)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_transac,EDL0150"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1800">
  </p>
  <p> 
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing=0 class="tbenter" cellpadding=2 width="100%" border="0">
		  <tr><td>&nbsp;</td></tr>
		   <tr><td>&nbsp;</td></tr>
		    <tr><td>&nbsp;</td></tr>
			 <tr><td>&nbsp;</td></tr>
			 <tr>
            <td nowrap width="50%"> 
              <div align="right">Ingrese el N&uacute;mero del Pr&eacute;stamo 
                :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E03DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
              <a href="javascript:GetAccount('E03DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Numero de Certificado" align="bottom" border="0" ></a> 
            </td>
            </tr>
        </table>
      </td>
    </tr>
  </table>
   <p>&nbsp;</p>

	  <div align="center"> 
    	<input id="EIBSBTN" type=button name="Submit" OnClick="CheckNum()" value="Enviar">
  	</div>

<script type="text/javascript">
  document.forms[0].E03DEAACC.focus();
  document.forms[0].E03DEAACC.select();
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
