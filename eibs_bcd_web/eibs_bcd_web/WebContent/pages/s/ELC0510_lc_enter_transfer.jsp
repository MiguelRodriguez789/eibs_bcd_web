<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Transferencias/Cesiones de Cartas de Crédito</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">
 function goAction() {
	if (document.forms[0].OPE[0].selected == true){
		document.forms[0].SCREEN.value = '105';
		document.forms[0].H05FLGWK3.value = 'T';
		document.forms[0].submit();		 
	}
	else if (document.forms[0].OPE[1].selected == true){
		document.forms[0].SCREEN.value = '110';
		document.forms[0].H05FLGWK3.value = 'A';
		document.forms[0].submit();
	}
 }
</script>

</head>
<body>

<h3 align="center">Transferencias/Cesiones de Cartas de Crédito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="lc_enter_transfer.jsp, ELC0510"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510">
    <input TYPE=HIDDEN NAME="SCREEN" VALUE="105">
    <input TYPE=HIDDEN NAME="H05FLGWK3" VALUE="">
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr> 
      <td nowrap width="50%" align="right">Número de Carta de Crédito : </td>
      <td nowrap width="50%"> 
        <input type="text" name="E05LCMACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
        <a href="javascript:GetAccount('E05LCMACC','','40','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0" align="bottom"></a> 
      </td>
    </tr>
    <tr> 
      <td nowrap width="50%" align="right">Tipo de Operación : </td>
      <td nowrap width="50%"> 
		<select name="OPE">
			<option value="T">Transferencia</option>
			<option value="A">Cesión</option>
		</select>
      </td>
    </tr>
  </table>
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction()">
          </div>

</form>
<P><BR>
<script type="text/javascript">
  document.forms[0].E05LCMACC.focus();
  document.forms[0].E05LCMACC.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <script type="text/javascript">
            showErrors();
     </script>
 <%
 }
%>
</body>
</html>
