<html>
<head>
<title>Solicitud de Transacciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body bgcolor="#FFFFFF">

<h3 align="center">Transacciones de Documentarias <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_boleta,ELC5085"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5085" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="101">
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
              <div align="right">N&uacute;mero de Documento :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01LCMACC" size="13" maxlength="12" onKeypress="enterInteger(event)" onchange="CheckNum();">
              <a href="javascript:GetAccount('E01LCMACC','','43','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Numero de Boleta" align="bottom" border="0" ></a> 
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
  document.forms[0].E01LCMACC.focus();
  document.forms[0].E01LCMACC.select();
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

<SCRIPT type="text/javascript">
function CheckNum(){
	if(document.forms[0].E01LCMACC.value.length < 1){
		alert("Debe ingresar un número de Certificado valido");
		document.forms[0].E01LCMACC.value='';
		document.forms[0].E01LCMACC.focus();
	} else {
	  document.forms[0].submit();
	}
}

</SCRIPT>

</html>
