<html> 
<head>
<title>Consulta Calificaci�n Adicional Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckNum(){
	if(isNaN(document.forms[0].E01CUSCUN.value)||(document.forms[0].E01CUSCUN.value.length < 1)){
		alert("Debe ingresar un n�mero de CLIENTE valido");
		document.forms[0].E01CUSCUN.value='';
		document.forms[0].E01CUSCUN.focus();
  		return false;
	}
	else {
  		return true;
	}
}

</SCRIPT>
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "clasif" class= "datapro.eibs.beans.EDL051802Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<body   bgcolor="#FFFFFF">

<h3 align="center">
Consulta Calificaciones Adicionales Cliente
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_clasif_consul_enter, EDL0518"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0518" onSubmit="return(CheckNum())">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
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
              <div align="right">Ingrese el N&uacute;mero del Cliente 
                :</div>
            </td>
			
            <td nowrap width="50%"> 
              <input type="text" name="E02CUSCUN" id="E02CUSCUN" size="10" maxlength="9" value="" onKeyPress="enterInteger(event)">
                <a href="javascript:GetCustomerDescId('E02CUSCUN','E02CUSNA1','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
			<input  type="text" name="E01CUSNA2" id="E01CUSNA2" size="25" maxlength="25" readonly >
              
            </td>
			
        </table>
      </td>
    </tr>
  </table>

	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>

<script language="JavaScript">
  document.forms[0].E01CUSCUN.focus();
  document.forms[0].E01CUSCUN.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
