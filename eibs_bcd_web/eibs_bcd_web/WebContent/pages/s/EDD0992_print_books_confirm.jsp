<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Líneas de Impresión Libretas/Ahorros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="msg0992d" class="datapro.eibs.beans.EDD0992DSMessage" scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">



</SCRIPT>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body bgcolor="#FFFFFF">

<h3 align="center">Líneas de Impresión Libretas/Ahorros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="print_books_confirm, EDD0992"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0992">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  </p>
  
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="50%"> 
				<eibsinput:date name="msg0992d" fn_year="E01PBTDTY" fn_month="E01PBTDTM" fn_day="E01PBTDTD"/>
            </td>
          </tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Hora :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01PBTTIM" size="26" value= "<%= msg0992d.getE01PBTTIM()%>" >
            </td>
          </tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Transaccion :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01PBTCDE" size="5" value= "<%= msg0992d.getE01PBTCDE()%>" >
            </td>
          </tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Descripcion :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01PBTNAR" size="60" value= "<%= msg0992d.getE01PBTNAR()%>" >
            </td>
          </tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01PBTAMT" size="15" value= "<%= msg0992d.getE01PBTAMT()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>

  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>




<script type="text/javascript">
</script>
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
