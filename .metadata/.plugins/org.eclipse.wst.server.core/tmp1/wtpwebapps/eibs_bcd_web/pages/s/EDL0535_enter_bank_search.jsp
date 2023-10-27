<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tasa Maxima Permitida Search </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="data" class="datapro.eibs.beans.EDL053501Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

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

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0535">
<input type="hidden" id="SCREEN" name="SCREEN" value="200">
	
	<h3 align="center">Tasa Maxima Permitida
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_bank_search.jsp,EDL0535"> 
	</h3> 
    <hr size="4">
    <p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>


<table id="TBHELPN" width="100%" border="0" cellspacing="0"
	cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="right" width="50%" nowrap>Banco :&nbsp;</td>
		<td  width="50%">
 			<eibsinput:text property="E01MRTBNK" name="data" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
 		</td>
	</tr>
	<tr>
		<td align="right" width="50%" nowrap>Moneda :&nbsp;</td>
		<td  width="50%">
			<eibsinput:help fn_param_one="E01MRTCCY" property="E01MRTCCY" name="data" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" />
 		</td>
	</tr>
	<tr align="center" >
		<td nowrap colspan="2" align="center">
		<div id="DIVSUBMIT" align="center">
			<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
		</div>
		</td>
	</tr>
</table>

</form>
</body>
</html>