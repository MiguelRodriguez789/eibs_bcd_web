<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Consulta Historico Indices Oficiales</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgdata" class="datapro.eibs.beans.EDL064001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" 	scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

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

<h3 align="center">Consulta Historico &Iacute;ndices Oficiales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="float_table_enter.jsp, EDL0640"></h3>
<hr size="4">
<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.tables.JSEDL0640">
  <input type=HIDDEN name="SCREEN" value="200">

  <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
      <tr>
        <td width="50%"> 
          <div align="right">Código de &Iacute;ndice :</div>
        </td>
        <td>
          <eibsinput:cnofc name="msgdata" flag="I1" property="E01IFHRCD" fn_description="" required="false"/>
        </td>
	  </tr>
	  <tr>
	  	<td width="50%"> 
          <div align="right">Fecha Inicio :</div>
        </td>
        <td>
        	<eibsinput:date name="msgdata" fn_year="E01FRDTEY" fn_month="E01FRDTEM" fn_day="E01FRDTED" /> 
         </td>
      </tr>
      	  <tr>
	  	<td width="50%"> 
          <div align="right">Fecha Final :</div>
        </td>
        <td>
        	<eibsinput:date name="msgdata" fn_year="E01TODTEY" fn_month="E01TODTEM" fn_day="E01TODTED" /> 
         </td>
      </tr>
      
  </table>
  
    <p align="center">         
      <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  
  

</form>
</body>

</html>
