<html>
<head>
<title>Solicitud de Mantenimiento</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
%>

<body>

<H3 align="center">Consulta de Documentos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pay_inq_enter,EDL0825"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0825I">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    
    <tr> 
      <td align="right">N�mero de Cuenta : </td>
	  <td nowrap width="50%"> 
        <input type="text" name="E01SELLNS" size="13" maxlength="12" onKeypress="enterInteger(event)">
        <a href="javascript:GetAccount('E01SELLNS','','FA','<%=client%>')">
        <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
      </td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">N�mero de Identidad del Deudor : </div>
      </td>
      <td nowrap width="50%"> 
        <input type="text" name="E01SELIDE" size="28" maxlength="25">
        <a href="javascript:GetAcceptantId('E01SELIDE')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
      </td>
    </tr>
  </table>

	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>

<script type="text/javascript">
  document.forms[0].E01SELLNS.focus();
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
