<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<title>Tasas de Captadora</title>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "tbRate" class= "datapro.eibs.beans.ECN000003Message"  scope="session" />
<jsp:useBean id= "tbRate2" class= "datapro.eibs.beans.ECN000002Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.ECN000002Message"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
</head>

<body >

<h3 align="center">Nueva Tabla para Prestamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table_enter_loans, ECN0000"></h3>
<hr size="4">
<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECN0000">
  <input type=HIDDEN name="SCREEN" value="9">
  <INPUT TYPE=HIDDEN NAME="E03CDRSFL" VALUE="P">
  
  <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
	  <% if (userPO.getPurpose().equals("NEW")) {%>  
      <tr>
        <td width="50%"> 
          <div align="right">C&oacute;digo de Tabla : </div>
        </td>
        <td>
        	<input type="text" name="E03CDRRTB" size="3" maxlength="2" value="<%=tbRate.getE03CDRRTB()%>">
        </td>
      </tr>
	  <tr>
	  	<td width="50%"> 
          <div align="right">Fecha Proceso : </div>
        </td>
        <td>
            <eibsinput:date name="tbRate" fn_year="E03CDRDTY" fn_month="E03CDRDTM" fn_day="E03CDRDTD" /> 
            	           	
        </td>
      </tr>
	  <tr>
	    <td width="50%"> 
          <div align="right">C&oacute;digo de Moneda : </div>
        </td>
	  	<td>
	  	   <input type="text" name="E03CDRCCY" size="3" maxlength="3" value="<%=tbRate.getE03CDRCCY()%>">
	  	   <a href="javascript:GetCurrency('E03CDRCCY','')">
	  	   <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>         
        </td>
	  </tr>
	  <%} else if (userPO.getPurpose().equals("COPY")) {%>
      <tr>
        <td width="50%"> 
          <div align="right">C&oacute;digo de Tabla : </div>
        </td>
        <td>
        	<input type="text" name="E02CDRRTB" size="3" maxlength="2" value="<%=tbRate2.getE02CDRRTB()%>">
        </td>
      </tr>
	  <tr>
	  	<td width="50%"> 
          <div align="right">Fecha Proceso : </div>
        </td>
        <td>
            <eibsinput:date name="tbRate2" fn_year="E02CDRDTY" fn_month="E02CDRDTM" fn_day="E02CDRDTD" /> 
        </td>
      </tr>
	  <tr>
	    <td width="50%"> 
          <div align="right">C&oacute;digo de Moneda : </div>
        </td>
	  	<td>
	  	   <input type="text" name="E02CDRCCY" size="3" maxlength="3" value="<%=tbRate2.getE02CDRCCY()%>">
	  	   <a href="javascript:GetCurrency('E02CDRCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>         
        </td>
	  </tr>	  
	  <tr>
        <td width="50%" align=right> 
          <br>
          <h4 style="text-align: right"> Copiar Tasas de :</h4>
        </td>
        <td></td>
      </tr>
	  <tr>
        <td width="50%"> 
          <div align="right">Tabla : </div>
        </td>
        <td>
        	<input type="text" name="E02CFRRTB" size="3" maxlength="2" value="<%=tbRate2.getE02CFRRTB()%>">
        </td>
      </tr>
	  <tr>
	  	<td width="50%"> 
          <div align="right">Fecha : </div>
        </td>
        <td>
            <eibsinput:date name="tbRate2" fn_year="E02CFRDTY" fn_month="E02CFRDTM" fn_day="E02CFRDTD" /> 
            	            	
        </td>
      </tr>
	  <tr>
	    <td width="50%"> 
          <div align="right">Moneda : </div>
        </td>
	  	<td>
	  	   <input type="text" name="E02CFRCCY" size="3" maxlength="3" value="<%=tbRate2.getE02CFRCCY()%>">
	  	   <a href="javascript:GetCurrency('E02CFRCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>         
        </td>
	  </tr>
      <% } %>
  </table>
      
  <p align="center">         
      <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
<% if (userPO.getPurpose().equals("NEW")) { %>
<script type="text/javascript">
  document.forms[0].E03CDRRTB.focus();
  document.forms[0].E03CDRRTB.select();
</script>
<% } else if (userPO.getPurpose().equals("COPY")) { %>
<script type="text/javascript">
  document.forms[0].E02CDRRTB.focus();
  document.forms[0].E02CDRRTB.select();
</script>
 
<% }
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



