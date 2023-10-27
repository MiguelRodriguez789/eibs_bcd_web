<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<head>
<title>Anulación Certificados de Depósito</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="javascript">
 function finish(){
 	document.forms[0].submit();
 }
</script>

</head>

<body>
 
<h3 align="center">Anulación Certificados de Depósito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_rever_confirm, EDL0130" ></h3>
<hr size="4">
<br>
<form>  
<table class="tableinfo">
  <tr > 
    <td> 
      <p align="center">Las operaciones realizadas para el Certificado de Dep&oacute;sito 
        n&uacute;mero <b><%= datapro.eibs.master.Util.justifyRight(userPO.getIdentifier(),12)%></b> 
        han sido satisfactoriamente concluidas.</p>
    </td>
  </tr>
  <tr > 
    <td>&nbsp;</td>
  </tr>
  <!--

  <tr > 
    <td><div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="finish()" ></div></td>
  </tr>

-->
</table>
</form>

</body>
</html>
