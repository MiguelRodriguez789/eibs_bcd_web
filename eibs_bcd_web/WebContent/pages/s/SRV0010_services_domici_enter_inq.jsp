<html> 
<head>
<title>Mantenimiento de Domiciliaciones Pago y Cobro de Servicios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.SRV001001Message"  scope="session" />

</head>
<body>

<H3 align="center">Mantenimiento de Domiciliaciones - Pago y Cobro de Servicios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="services_domici_enter_inq,SRV0010"></H3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.services.JSSRV0010">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
  </p>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trdark> 
		  <td> 
		     <div align="right">N&uacute;mero de Cuenta : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01DOMACC" size="15" maxlength="12" value="<%= msgMT.getE01DOMACC()%>">
      	    <a href="javascript:GetAccount('E01DOMACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
     </table>
    </td>
   </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  
	<script type="text/javascript">
	  document.forms[0].E01DOMACC.focus();
	  document.forms[0].E01DOMACC.select();
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
