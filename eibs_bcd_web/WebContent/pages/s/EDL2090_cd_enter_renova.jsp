<html>
<head>
<title>Renovaci�n de Dep�sitos a Plazo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

	function CheckNum(){
		if (!isNumeric(document.forms[0].E01DEAACC.value)) {
			alert("Debe ingresar un n�mero de Certificado valido");
			document.forms[0].E01DEAACC.value = '';
			document.forms[0].E01DEAACC.focus();
		} else {
  			document.forms[0].submit();
		}
	}

</SCRIPT>


</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
%>


<body  bgcolor="#FFFFFF">

<h3 align="center">Renovaci�n de Dep�sitos a Plazo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_enter_renova, EDL2090"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.timedeposits.JSEDL2090" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
 <!-- <h4>Por favor Ingrese el n&uacute;mero del Certificado de Dep&oacute;sito</h4>-->
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
              <div align="right">Ingrese el N&uacute;mero del Certificado :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)" value="<%= userPO.getIdentifier() %>">
              <a href="javascript:GetAccount('E01DEAACC','','11','<%=client%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
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

<script language="JavaScript">
  document.forms[0].E01DEAACC.focus();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>;
 <%
 }
%>
</form>
</body>
</html>
