<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Pago de cuotas On-Line</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgData" class= "datapro.eibs.beans.EDL002001Message"  scope="session" />
</head>
<body>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0020" >

<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
<h3 align="center">Pago de cuotas On-Line<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="online_loan_payment.jsp,EDL0020"></h3>
<hr size="4">

  <CENTER><BR>
<BR>
<BR>
<BR>
<TABLE class="tableinfo" cellspacing="2" cellpadding="2"><CAPTION align="bottom"></CAPTION>
    <TR id="trclear" valign="middle"> 
	      <TD nowrap> 
	        <DIV align="right">Fecha de Inicio : </DIV>
	      </TD>
	      <TD nowrap>
	      	<eibsinput:date name="msgData" fn_month="E01FRMDTM" fn_day="E01FRMDTD" fn_year="E01FRMDTY" />
      	  </TD>
     	</TR>
      	<TR id="trdark"> 
	      <TD nowrap> 
	        <DIV align="right">Fecha de Fin : </DIV>
	      </TD>
	      <TD nowrap>
	      	<eibsinput:date name="msgData" fn_month="E01TODATM" fn_day="E01TODATD" fn_year="E01TODATY" />
      	  </TD>
     	</TR>
  </TABLE></CENTER>
  <p align="center">
	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
</p>

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