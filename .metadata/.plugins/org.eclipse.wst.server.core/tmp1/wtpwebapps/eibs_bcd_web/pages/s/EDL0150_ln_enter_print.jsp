<html>
<head>
<title>Solicitud de Mantenimiento</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckNum(){
	if(isNaN(document.forms[0].E20DEAACC.value)||(document.forms[0].E20DEAACC.value.length < 1)){
	alert("Debe ingresar un n�mero de Certificado valido");
	document.forms[0].E20DEAACC.value='';
	document.forms[0].E20DEAACC.focus();
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

<h3 align="center">Impresi&oacute;n de Pr&eacute;stamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_print,EDL0150"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1000">
  </p>
  <!--<h4>Por favor Ingrese el n&uacute;mero del Certificado de Dep&oacute;sito</h4>-->
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
              <div align="right">Ingrese el N&uacute;mero de Pr&eacute;stamo :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E20DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
              <a href="javascript:GetAccount('E20DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
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
  document.forms[0].E20DEAACC.focus();
  document.forms[0].E20DEAACC.select();
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
