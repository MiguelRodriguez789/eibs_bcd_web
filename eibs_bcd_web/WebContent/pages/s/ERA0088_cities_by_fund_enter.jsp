<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Tabla de Ciudades Beneficiarias por Fondo de Garantías</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA008801Message"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>
 <%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 
 
<H3 align="center">Tabla de Ciudades Beneficiarias por Fondo de Garantías<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ERA0088_cities_by_found_enter,ERA0088"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0088">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="D">
  </p>
  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=3 width="100%" border="0">
    <tr> 
      <td width="50%"> 
        <div align="right">Código Fondo de Garantías : </div>
      </td>
      <td width="50%"> 
       <eibsinput:cnofc name="gaDetail" flag="FJ" property="E01TB5CFG" fn_description="D01TB5CFG" required="true" />
       <INPUT type="text" name="D01TB5CFG" size="32" maxlength="30" value="" readonly>
	    <eibsinput:text name="clMant" property="E01WLNREA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
      </td>
    </tr>
    <tr> 
      <td width="50%"> 
        <div align="right">Monto a Distribuir : </div>
      </td>
      <td width="50%"> 
	    <eibsinput:text name="gaDetail" property="E01TB5MXD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
      </td>
    </tr>
  </table>
  
  <div align="center"> 
    <p><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
  </div>

<script language="JavaScript">

</script>
</form>
</body>
</html>
