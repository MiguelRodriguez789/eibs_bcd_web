<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<title>Manejo Tarifas</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
</head>
<body>

<%
  if (!error.getERRNUM().equals("0")) {
    out.println("<script type=\"text/javascript\">");
    error.setERRNUM("0");
    out.println("showErrors()");
    out.println("</script>");
  }

	String title="";
	if (userPO.getApplicationCode().equals("10")) {
		title=" para Prestamos";
	} else if (userPO.getApplicationCode().equals("43")){
		title="para Documentarias";
	} else if (userPO.getApplicationCode().equals("CONVENIO") || userPO.getApplicationCode().equals("CV")){
		title="para Convenio";		
	} else {
		title="Genericas";
	}
%>


<h3 align="center">Mantenimiento Tabla de Cargos <%=title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tarifas_enter_search.jsp, ESD0525"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0525">
<input type="hidden" name="SCREEN" id="SCREEN" value="101">
<input type="hidden" name="E01DLSACD" id="E01DLSACD" value="<%= !userPO.getApplicationCode().equals("CONVENIO") ? userPO.getApplicationCode().trim() : "CV"%>">
<input type="hidden" name="E01UBK" id="E01UBK" value="<%=currUser.getE01UBK().trim()%>">

<br>
<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
  <%if(!userPO.getApplicationCode().equals("CONVENIO")) {%>
  <tr >
    <td align="right" width="50%" nowrap>Banco :&nbsp;</td>
    <td  width="50%" valign="top">
      <eibsinput:text property="E01DLSBNK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" value="${sessionScope.currUser.E01UBK}"/><br>
    </td>
  </tr>   
  <tr >
    <td align="right" width="50%" nowrap><br>Tipo de Producto :&nbsp;<br>&nbsp;</td>
    <td  width="50%" >
      <input type="text" name="E01DLSATY" size=5 maxlength="4" >
      <a href="javascript:GetProductRates('E01DLSATY','<%=userPO.getApplicationCode().trim()%>')"> 
      <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
    </td>
  </tr>
  <tr>
    <td align="right" width="50%" nowrap>Cliente :&nbsp;</td>
    <td  width="50%">
      <eibsinput:help fn_param_one="E01DLSCUN" property="E01DLSCUN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" />
    </td>
  </tr>
  <%}else{%>
  <tr >
    <td align="right" width="50%" nowrap>Banco :&nbsp;</td>
    <td  width="50%" valign="top">
      <eibsinput:text property="E01DLSBNK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" value="${sessionScope.currUser.E01UBK}" /><br>
		<input type="hidden" name="E01DLSATY" size=5 maxlength="4" value="CONV">
  </tr>     
  <%}%>
</table>

  <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>

</form>
</body>
</html>
 