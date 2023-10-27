<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<title>Consulta de Tasas de Pizarra</title>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
</head>

<body>

<h3 align="center">Consulta de Tasas de Pizarra<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table_pizz_enter.jsp, ECN0030"></h3>
<hr size="4">
<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.tables.JSECN0030">
  <input type=HIDDEN name="SCREEN" value="400">
  
  <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
      <tr>
        <td width="50%"> 
          <div align="right">Código de Tabla :</div>
        </td>
        <td>
        	<input type="text" name="E02CDRRTB" size="3" maxlength="2">
              <a href="javascript:GetRateTable('E02CDRRTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"  ></a> 
        </td>
      </tr>
	  <tr>
	    <td width="50%"> 
          <div align="right">Moneda :</div>
        </td>
	  	<td>
	  	   <input type="text" name="E02CDRCCY" size="4" maxlength="3">
	  	   <a href="javascript:GetCurrency('E02CDRCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>         
        </td>
	  </tr>
	  <tr>
	  	<td width="50%"> 
          <div align="right">Fecha de Proceso :</div>
        </td>
        <td>
        	<eibsinput:date fn_month="E02CDRDTM" fn_day="E02CDRDTD" fn_year="E02CDRDTY"  />
        </td>
      </tr>
  </table>
      
  <p align="center">         
      <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  
<script type="text/javascript">
  document.forms[0].E02CDRRTB.focus();
  document.forms[0].E02CDRRTB.select();
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



