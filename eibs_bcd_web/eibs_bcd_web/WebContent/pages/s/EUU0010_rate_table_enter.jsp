<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<title>Tasa Maxima Convensional</title>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
</head>

<body >

<h3 align="center">Nueva Tabla de Tasa Maxima Convencional<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table_enter, EUU0010"></h3>
<hr size="4">
<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEUU0010">
  <input type=HIDDEN name="SCREEN" value="3">
  <INPUT TYPE=HIDDEN NAME="E02CDRSFL" VALUE="">
  
  <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
	  <tr>
	  	<td width="50%"> 
          <div align="right">Banco : </div>
        </td>
        <td>
        	<input type="text" name="E01USUBNK" size="3" maxlength="3" onkeypress="enterInteger(event)" value="01">
        </td>
      </tr>
	  <tr>
	    <td width="50%"> 
          <div align="right">C&oacute;digo de Moneda : </div>
        </td>
	  	<td>
			<eibsinput:help name="" property="E01USUCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>"  fn_param_one="E01USUCCY" fn_param_two="<%=\"document.forms[0].E01USUBNK.value\"%>" />
        </td>
	  </tr>
	  <tr>
	  	<td width="50%"> 
          <div align="right">Fecha : </div>
        </td>
        <td>
			<eibsinput:date name="" fn_year="E01USUDYY" fn_month="E01USUDMM" fn_day="E01USUDDD" />
        </td>
      </tr>
	  <tr>
	    <td width="50%"> 
          <div align="right">Plazo : </div>
        </td>
	  	<td>
	  	   <input type="text" name="E01USUPZO" size="6" maxlength="5">         
        </td>
	  </tr>      
	  <tr>
	    <td width="50%"> 
          <div align="right">Moneda Monto: </div>
        </td>
	  	<td>
			<eibsinput:help name="" property="E01USURCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>"  fn_param_one="E01USURCY" fn_param_two="<%=\"document.forms[0].E01USUBNK.value\"%>" />
        </td> 
	  </tr>
	  <tr>
	    <td width="50%"> 
          <div align="right">Dias Base: </div>
        </td>
	  	<td>
	  	   <input type="text" name="E01USUBSE" size="4" maxlength="3" onkeypress="enterInteger(event)" value="360">
        </td>
	  </tr>	 
	   
  </table>
      
  <p align="center">         
      <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  
<script language="JavaScript">
  document.forms[0].E01USUDDD.focus();
  document.forms[0].E01USUDDD.select();
</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>

</html>



