<html>
<head>
<title>Solicitud de Transacciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	function CheckNum(){
		if (isNumeric(document.forms[0].E03DEAACC.value)) {
			alert("Debe ingresar un número de Certificado valido");
			document.forms[0].E03DEAACC.value = '';
			document.forms[0].E03DEAACC.focus();
		} else {
  			document.forms[0].submit();
		}
	}

</SCRIPT>

</head>

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
%>

<body bgcolor="#FFFFFF">

<h3 align="center">Transacciones de Certificados de Dep&oacute;sito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_enter_transac,EDL0130"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1000">
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
              <div align="right">Ingrese el N&uacute;mero del Certificado :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E03DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
              <a href="javascript:GetAccount('E03DEAACC','','CD','<%=client%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Numero de Certificado" align="bottom" border="0" ></a> 
            </td>
            </tr>
        </table>
      </td>
    </tr>
  </table>
   <p>&nbsp;</p>

	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>

<script type="text/javascript">
  document.forms[0].E03DEAACC.focus();
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
