<html>
<head>
<title>Tabla de Indices de Avalúos para Bienes Inmuebles</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA008301Message"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>
 <%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 
 
<H3 align="center">Tabla de Indices Valoración Inmobiliaria Urbana y Rural (IVIUR)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="modules_enter,ERA0083"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0083">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="D">
  </p>
  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=3 width="100%" border="0">
    <tr> 
      <td width="50%"> 
        <div align="right">Año : </div>
      </td>
      <td width="50%"> 
		<INPUT type="text" name="E01TB3YEA" size="5" maxlength="4" value="<%=gaDetail.getE01TB3YEA().trim()%>" onKeyPress="enterInteger(event)">
        <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
      </td>
    </tr>
    <tr> 
      <td width="50%"> 
        <div align="right">Departamento/Ciudad (Bogotà): </div>
      </td>
      <td width="50%"> 
		<INPUT type="text" name="E01TB3DPT" size="5" maxlength="4" value="11" onKeyPress="enterInteger(event)" readonly>
		<INPUT type="text" name="E01TB3CTY" size="5" maxlength="4" value="001" onKeyPress="enterInteger(event)" readonly>
        <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
      </td>
    </tr>
  </table>
  
  <div align="center"> 
    <p><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
  </div>

<script type="text/javascript">

</script>
</form>
</body>
</html>
