<html>
<head>
<title>Pago de Préstamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckNum(){
	if(isNaN(document.forms[0].E01DLHNRO.value)||(document.forms[0].E01DLHNRO.value.length < 1)){
		alert("Debe ingresar un número de Planilla valido");
		document.forms[0].E01DLHNRO.value='';
		document.forms[0].E01DLHNRO.focus();
  		return false;
	}
	else {
  		return true;
	}
}

</SCRIPT>
</head>

<body  bgcolor="#FFFFFF">

<h3 align="center">Carta Guia de Cobranzas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="collection_enter_maint, EDL0810"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0810" onsubmit="return(CheckNum())">
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
              <div align="right">Ingrese el N&uacute;mero de Planilla :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01DLHNRO" size="13" maxlength="12" onKeypress="enterInteger(event)">
              <a href="javascript:GetCollDraft('E01DLHNRO')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
	</p>
<script type="text/javascript">
  document.forms[0].E01DLHNRO.focus();
  document.forms[0].E01DLHNRO.select();
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
