<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Reversión de Descuento de Documentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function btnAction() {
	document.getElementById("EIBSBTN").disabled = true;
	document.forms[0].submit();
}

function CheckACC(){
if ( document.forms[0].E01DEAACC.value.length < 1) {
  alert("Teclee un numero de cuenta valido");
  document.forms[0].E01DEAACC.value='';
  document.forms[0].E01DEAACC.focus();
  return false;
}
else {
  return true;
  }
}
 function goAction() {
	if ( document.forms[0].E01DEAACC.value.length < 1) {
  		alert("Teclee un numero de cuenta valido");
  		document.forms[0].E01DEAACC.value='';
  		document.forms[0].E01DEAACC.focus();
  		return false;
  	}
  	if ( document.forms[0].E01DLDNDR.value.length < 1) {
  		alert("Teclee un numero de documento valido");
  		document.forms[0].E01DLDNDR.value='';
  		document.forms[0].E01DLDNDR.focus();
  		return false;
  	}
  	
  
  	document.forms[0].submit();
  }
</SCRIPT>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>

<h3 align="center">Reversi&oacute;n de Pago de Factoreo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_enter_rever,EDL0830"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0830" onsubmit="return(CheckACC())">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
  
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
		  <tr> 
            <td nowrap align="right"> 
                 Número de Factoreo :
            </td> 
            <td nowrap align="left">
              <INPUT type="text" name="E01DEAACC" size="15" maxlength="12" onkeypress="enterInteger(event)" value="">
              <a href="javascript:GetAccount('E01DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a>               
          	</td>
          </tr>
          <tr>
          	<td nowrap align="right">
              Número de Documento :
           </td>
           <td nowrap align="left">
              <INPUT type="text" name="E01DLDNDR" size="15" maxlength="9" onkeypress="enterInteger(event);" value="">
              <a href="javascript:GetDocument('E01DLDNDR', document.forms[0].E01DEAACC.value, '', '')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda Documento" align="middle" border="0"></a>
            </td>
           </tr>
            <tr>
            <td nowrap colspan="2" align="center">
  				<div align="center"> 
    				<input id="EIBSBTN" type="button" onClick="goAction();" name="Submit" value="Enviar" onclick="btnAction()" >
  				</div>
 			</td>
          </tr>
        </table>
     
  
  <script type="text/javascript">
  document.forms[0].E01DEAACC.focus();
  document.forms[0].E01DEAACC.select();
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
