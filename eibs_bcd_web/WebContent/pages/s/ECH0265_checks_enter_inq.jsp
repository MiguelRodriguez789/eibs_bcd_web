<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html> 
<head>
<title>Mantenimiento de Stock - Chequeras Universal</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECH026501Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


</head>
<body>

<H3 align="center">Consulta de Stock - Chequeras Universal
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_checks_enter_inq,ECH0265">
</H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0265">
   
 <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
<%int row = 0; %>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    

     <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>"> 
      <td nowrap width="50%"> 
        <div align="right">Banco : </div>
      </td>
      <td nowrap colspan=2> 
        <input type="text" name="E01SELBNK" size="3" maxlength="2" value="<%=msgMT.getE01SELBNK()%>" onKeypress="enterInteger(event)">
      </td>
     </tr>

     <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>"> 
      <td nowrap width="50%"> 
        <div align="right">Oficina : </div>
      </td>
      <td nowrap colspan=2> 
        <input type="text" name="E01SELBRN" size="5" maxlength="4" onKeypress="enterInteger(event)">
        <a href="javascript:GetBranch('E01SELBRN',document.forms[0].E01SELBNK.value)">
        <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
      </td>
     </tr> 
     <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>"> 
      <td nowrap width="50%"> 
        <div align="right">Tipo Chequera : </div>
      </td>
      <td nowrap colspan=2> 
        <input type="text" name="E01SELTCB" size="3" maxlength="2">
        <a href="javascript:GetCodeCNOFC('E01SELTCB','CH')">
        <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
      </td>
     </tr> 
     
    </table>
    </td>
   </tr>
  </table>
<!-- <br>   -->
<!--   <table class="tableinfo"> -->
<!--   	<tr bordercolor="#FFFFFF">  -->
<!--   		<td nowrap width="50%"> -->
<!--   		<table cellspacing="0" cellpadding="2" width="100%" border="0"> -->

<%--           <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>">   --%>
<!--           <td nowrap width="50%"><div align="right">N&uacute;mero de Cuenta : </div></td> -->
<!--       		<td nowrap width="50%"><input type="text" name="E01SELACC" size="13" maxlength="12" onKeypress="enterInteger(event)"> -->
<%--       			<a href="javascript:GetAccount('E01SELACC','','RT','0')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> --%>
<!--       		</td> -->
<!--           </tr> -->
<!-- 		</table> -->
<!--   		</td> -->
<!--   	</tr> -->
<!--   </table> -->
  
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onclick="">
          </div>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
