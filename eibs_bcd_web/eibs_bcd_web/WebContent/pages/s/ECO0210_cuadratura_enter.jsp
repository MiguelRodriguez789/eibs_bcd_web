<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sistema Bancario: Mantenedor Convenios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
 function enterCode(){
	
	if (trim(document.forms[0].file.value).length > 0) {
	    document.forms[0].submit();
	}else{
		alert("Es requerido que se entre un valor");
		document.forms[0].file.focus();
	}
 }
</script>

</head>

<body>
 
<H3 align="center">Carga de Cuadraturas automaticas
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cuadratura_enter.jsp, ECO0210"></H3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0210" enctype="multipart/form-data">

  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0"> 
    <tr id="trdark">
      <td width="50%"></td>
      <td width="50%"></td>
    </tr>

  	<tr id="trdark"> 
        <td align=CENTER width="50%"></td>
        <td align=CENTER width="50%"></td>
      </tr>
  	<tr id="trdark"> 
        <td align=CENTER width="50%"> 
          <div align="right">Seleccione Archivo :</div>
        </td>
        <td align=CENTER width="50%"> 
          <div align="left"> 
 	         <input type="file" name="file" size="50" >
          </div>
        </td>
      </tr>
        
        
  </table>
  <p align="center">
      <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="enterCode()">
  </p>
<script type="text/javascript">
  document.forms[0].file.focus();
  document.forms[0].file.select();
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
