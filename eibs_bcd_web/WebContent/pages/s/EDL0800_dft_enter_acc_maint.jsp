<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Loan Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

	function goAction(){
		if (!isNumeric(document.forms[0].E01DEACUN.value)) {
			alert("Debe ingresar un número de Liente valido");
			document.forms[0].E01DEACUN.value = '';
			document.forms[0].E01DEACUN.focus();
		} else {
			if (!isNumeric(document.forms[0].E01CUMMAN.value)) {
				alert("Debe ingresar una direccion de correo valida");
				document.forms[0].E01CUMMAN.value = '';
				document.forms[0].E01CUMMAN.focus();
			} else {
  				document.forms[0].submit();
  			}
		}
	}
function showDirecciones(){
	if (document.forms[0].E01DEACUN.value.trim() != ""){
		GetAcceptantAddr('E01CUMMAN','',document.forms[0].E01DEACUN.value,'','','E01CUMMAN','E'	);
	} else {
		alert("Primero debe ingresar Numero de Deudor ..");
        document.forms[0].E01DEACUN.focus();		
	}
}

</SCRIPT>


</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>


<body bgcolor="#FFFFFF">

<h3 align="center">Mantenimiento de Deudor/Nuevo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_enter_acc_maint, EDL0800"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
    <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="A">
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
              <div align="right">Numero de Cliente :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01DEACUN" size="13" maxlength="12" onKeypress="enterInteger(event)" >
              <a href="javascript:GetCustomerDescId('E01DEACUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            </td>
          </tr>
          <TR>
	  <TD ALIGN=right nowrap>
          Ingrese Número de Dirección : 
      </TD>
	  <TD ALIGN=left nowrap>
          <input type="text" maxlength=2 size="3" name="E01CUMMAN"
			value="">
		<a href="javascript:showDirecciones('N')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
      </TD>
   </TR>

        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>


	<div align="center"> 
    	<input id="EIBSBTN" type="button" onclick="goAction()" name="Submit" value="Enviar">
  	</div>


<script type="text/javascript">
  document.forms[0].E01DEACUN.focus();
  document.forms[0].E01DEACUN.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
