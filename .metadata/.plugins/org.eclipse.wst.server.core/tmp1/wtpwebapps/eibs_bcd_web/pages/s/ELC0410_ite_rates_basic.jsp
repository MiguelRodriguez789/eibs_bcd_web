 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
 <%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tasas I.T.E.</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id="msgPart" class="datapro.eibs.beans.ELC041001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>






<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
function enterCusRate(event) {
	enterDecimal(event, 3);
}
</SCRIPT>


</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%>

<h3 align="center"> <%="NEW".equals(userPO.getPurpose())?"Adición":"Mantenimiento"%> Tasa I.T.E. <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ite_rates_basic.jsp, ELC0410"> </h3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0410">
 
    <input type=HIDDEN name="SCREEN" value="15">

  <div id="OtherOpt">
<table class="tableinfo" width="570">
	<tr id="trdark">
		<td nowrap width="35%">
		<div align="right">Fecha Inicial :</div>
		</td>
		<td nowrap width="368">
			 <% if("NEW".equals(userPO.getPurpose())) { %>
             	<eibsinput:date readonly="false" name="msgPart" fn_year="E01MXIFIY" fn_month="E01MXIFIM" fn_day="E01MXIFID" required="true"/>
             <% } else { %>
             	<eibsinput:date readonly="true" name="msgPart" fn_year="E01MXIFIY" fn_month="E01MXIFIM" fn_day="E01MXIFID" required="false"/>
             <% } %>
		</td>
	</tr>
	<tr id="trclear">
		<td nowrap width="35%">
		<div align="right">Tasa Mensual :</div>
		</td>
		<TD nowrap width="368"><INPUT type="text" name="E01MXIRTE" size="15"
			maxlength="15" value="<%= msgPart.getE01MXIRTE().trim()%>" onkeypress="enterCusRate(event)"></TD>
	</tr>

	<tr id="trdark">
		<td nowrap width="35%">
		<div align="right">Tasa Anual :</div>
		</td>
		<td nowrap width="368"><input type="text" name="E01MXITAM" size="15"
			maxlength="15" value="<%= msgPart.getE01MXITAM().trim()%>" onkeypress="enterCusRate(event)"></td>
	</tr>
    <tr id="trclear">
		<td nowrap width="35%">
		<div align="right">Nro.Máximo de Períodos :</div>
		</td>
		<td nowrap width="368"><input type="text" name="E01MXIMNP" size="5"
			maxlength="2" value="<%= msgPart.getE01MXIMNP().trim()%>" onkeypress="enterInteger(event)"></td>
	</tr>
</Table>
  </div>
  
<p align="center"> 
    <input id="EIBSBTN" type=SUBMIT name="Submit" value="Enviar" >
  </p>

</form>
  

</body>
</html>
