<html>
<head>
<title>Re-impresion Certificados de Depósito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="javascript">

	function CheckNum(){
		if (document.forms[0].R01ACC.value == 0) {
			alert("Debe ingresar un número de Certificado valido");
			document.forms[0].R01ACC.value = '';
			document.forms[0].R01ACC.focus();
		} else {
			document.forms[0].submit();
		}
	}

</SCRIPT>

</head>

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String type = "11";
	String txtch = !userPO.getApplicationCode().equals("12")?" Certificado de Depósito":" Bono";
	String txacd = !userPO.getApplicationCode().equals("12")?"11":"12";
%>

<body bgcolor="#FFFFFF">
<%
 String titletxt=null;
 if (userPO.getPurpose().equals("REPRINT")){
 	titletxt="Re-Imprimir "+txtch;
  } else {
   titletxt = "Anular Impresion "+ txtch ;
  }
%> 

<h3 align="center"><%=titletxt %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_enter_acc,EDL2050"></h3>
<hr size="4">
<p>&nbsp;</p>


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.timedeposits.JSEDL2050" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1060">
    <INPUT TYPE=HIDDEN NAME="appcode" VALUE="<%=txacd%>">
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
              <div align="right">Ingrese el N&uacute;mero del <%=txtch %></div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="R01ACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
              <a href="javascript:GetAccount('R01ACC','','<%=txacd %>','<%=client%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Numero de Certificado" align="bottom" border="0" ></a> 
            </td>
            </tr>
        </table>
      </td>
    </tr>
  </table>
   <p>&nbsp;</p>

	<div align="center"> 
    	<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="CheckNum()">
  	</div>

<script language="JavaScript">
  document.forms[0].R01ACC.focus();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>;
 <%
 }
%>
</form>
</body>
</html>
