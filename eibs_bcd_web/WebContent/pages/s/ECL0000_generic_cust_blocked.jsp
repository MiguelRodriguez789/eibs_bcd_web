<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Operaciones del Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgCust" class= "datapro.eibs.beans.ECL0000DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp">
	setTimeout("document.forms[0].submit()", 7000);
</SCRIPT>

</head>

<body >

<%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<h3 align="center">Call Center<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="generic_cust_blocked.jsp, ECL0000">
</h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0000">
  <table class="tableinfo">
    <tr>
      <td>El cliente <%= msgCust.getE01CCLIDT() %><%= msgCust.getE01CCLIDN() %> ha superado el número de intentos permitidos, por seguridad se ha bloqueado su acceso. Por favor, diríjase a una agencia de BFC.
      </td>
    </tr>
  </table>
  <div align="center">
    <p>&nbsp;</p>
    </div>
</form>
</body>
</html>
