<html>
<head> 
<title>Gestion de Cobranzas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECB003001Message"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
%>

<script type="text/javascript">
	function checkNum() {
		var accNum = document.forms[0].E01ECBACC.value;
		if (!isNumeric(accNum)) {
			alert("Debe ingresar un número de Prestamo valido");
			document.forms[0].E01ECBACC.value = '';
			document.forms[0].E01ECBACC.focus();
		} else {
  			document.forms[0].submit();
		}
	}
   
</script>

</head>
<body>

<H3 align="center">Gestion de Cobranzas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="params_officer_enter_inq,ECB0030"></H3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECB0030">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
  </p>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	
        <tr id=trdark> 
		  <td nowrap width="40%"> 
		     <div align="right">N&uacute;mero del Pr&eacute;stamo : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01ECBACC" size="13" maxlength="12" value="<%= msgMT.getE01ECBACC()%>" onkeypress="enterInteger(event)">
      	    <a href="javascript:GetAccount('E01ECBACC','','10','<%= client %>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	  </td>
      	</tr>
     </table>
    </td>
   </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="checkNum()">
  </p>
  
	<script type="text/javascript">
	  document.forms[0].E01ECBACC.focus();
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
