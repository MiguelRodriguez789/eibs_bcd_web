<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.beans.ECN000701Message" %>
<html>
<head>
<% 
String title = "Aprobacion de Tasas";
String pOption = (null == request.getParameter("OPTION") || "".equals(request.getParameter("OPTION")) )?"":request.getParameter("OPTION");
if( "P".equals(pOption) ){
	title = "Aprobación Tasas Para Prestamos";
} else if( "X".equals(pOption) ){ 
	title = "Aprobación Tasas Para Seguros";
}

%>

<title><%=title%></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="rtRate" class= "datapro.eibs.beans.ECN000701Message"  scope="session" />
<jsp:useBean id="ECN000701List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function pasarrow(a){
document.forms[0].ROW.value=a;
}


function goAction( action ){
	
	if( ! document.forms[0].ROW ){
		alert( "Por favor seleccione un registro." );
		return;
	}
	
	if( "I" == action ){
		var row = document.forms[0].ROW.value ;
		var page = document.forms[0].action + "?SCREEN=200&ROW=" + row 
					+ "&OPTION=<%=pOption%>" ;
		CenterWindow(page, 600, 500, 2);
		return ;
	} else {
		document.forms[0].SCREEN.value = 300;
		document.forms[0].pACTION.value = action ;
	}
	
	document.forms[0].submit();
}

</SCRIPT>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   out.println("<SCRIPT> initMenu(); </SCRIPT>");

%> 
<h3 align="center"><%=title %>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_approval_list.jsp, ECN0007"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECN0007" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="0">
    <INPUT TYPE=HIDDEN NAME="pACTION" value="">
    <INPUT TYPE=HIDDEN NAME="OPTION" value="<%=pOption%>">
    <INPUT TYPE=HIDDEN NAME="E71CDRRTB" value="">
    <INPUT TYPE=HIDDEN NAME="E71CDRSFL" value="">
    <INPUT TYPE=HIDDEN NAME="E71CDRCCY" value="">
    <INPUT TYPE=HIDDEN NAME="E71CDRDTM" value="">
    <INPUT TYPE=HIDDEN NAME="E71CDRDTD" value="">
    <INPUT TYPE=HIDDEN NAME="E71CDRDTY" value="">
  </p>
  


<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goAction('I')"><b>Consultar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goAction('A')"><b>Aprobar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goAction('R')"><b>Eliminar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>

<%
   if ( ECN000701List.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height=30%">
   <TR>
      <TD>         
         <div align="center"> <h4 style="text-align:center">No se han encontrado registros</h4></div>
      </TD>
   </TR>
</TABLE>

<%
   }
   else
   {
%>   

<table  class="tableinfo" width="100%">
   <TR id=trdark> 
      <td NOWRAP align="center" width="5%"><B>Sel</B></td>
	  <td NOWRAP align="center" width="5%"><B>Codigo Tabla</B></td>
	  <td NOWRAP align="center" width="35%"><B>Descripcion</B></td>
	  <td NOWRAP align="center" width="5%"><B>Moneda</B></td>
	  <td nowrap align="center" width="15%"><B>Fecha</B></td>
   </TR>
   
   <%
      int i = 0;
      ECN000701List.initRow();    
      while (ECN000701List.getNextRow()) {
      ECN000701Message msgList = (ECN000701Message) ECN000701List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="5%" >
   
   		<INPUT type="radio"  onclick="pasarrow('<%= ECN000701List.getCurrentRow() %>');"  name="ROW" value="<%= ECN000701List.getCurrentRow() %>"   
   			<%= (i==0)?"  ":"" %>	>
   </td>
   <td NOWRAP align="left" width="5%" ><%= msgList.getE71CDRRTB() %></td>
   <td NOWRAP align="left" width="35%"><%= msgList.getE71CDRDSC() %></td>
   <td NOWRAP align="left" width="5%"><%= msgList.getE71CDRCCY() %></td>
   <td NOWRAP align="left" width="15%"><%=datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
  																					msgList.getBigDecimalE71CDRDTM().intValue(),
  																					msgList.getBigDecimalE71CDRDTD().intValue(),
  																					msgList.getBigDecimalE71CDRDTY().intValue())%>
   </td></TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

<SCRIPT type="text/javascript">

</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
