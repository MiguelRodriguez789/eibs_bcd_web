<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Datos Provision Adicional</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "hdList" class= "datapro.eibs.beans.EDL099801Message"  scope="session" />
<jsp:useBean id= "dtList" class= "datapro.eibs.beans.EDL099804Message"  scope="session" />
<jsp:useBean id= "EDL099804List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">



function goAction() {
	document.forms[0].SCREEN.value="16";
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
<h3 align="center">Datos Provision Adicional

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Data_list.jsp, EDL0998"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0998" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
  
  </p>
  
<table  class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            <tr id="trdark"> 
               <td nowrap width="10%" > 
                  <div align="right"><b>Año :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <input type="text" name="E01INDVDY" size="4" maxlength="4" readonly value="<%= hdList.getE01INDVDY().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="10%" > 
                </td>
               <td nowrap width="30%"> 
               </td>
            </tr>

         </table>
      </td>
   </tr>
</table>
   
<TABLE class="tbenter"> 
   <TR>
	  	<TD align="CENTER" class="TDBKG" width="100%">
			<a href="javascript:goAction()"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>


<%
   if ( EDL099804List.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height=30%">
   <TR>
      <TD>         
         <div align="center"> <h4 style="text-align:center"> No hay Registros Activos</h4></div>
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
	  <td NOWRAP align="center" width="10%"><B>Mes</B></td>
	  <td NOWRAP align="center" width="20%"><B>Cartera Venc.</B></td>
	  <td NOWRAP align="center" width="10%"><B>IPC</B></td>
	  <td NOWRAP align="center" width="20%"><B>Cartera Defl</B></td>
	  <td NOWRAP align="center" width="10%"><B>% Crec. Anual</B></td>
	  <td NOWRAP align="center" width="10%"><B>% Varia Semestral</B></td>	
	  <td NOWRAP align="center" width="10%"><B>% Prom Movil</B></td>	
	  <td NOWRAP align="center" width="10%"><B>Flag Prov Ad</B></td>	
   </TR>
   
   <%
      int i = 0;
      EDL099804List.initRow();    
      while (EDL099804List.getNextRow()) {
      EDL099804Message msgList = (EDL099804Message) EDL099804List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="10%" ><%= msgList.getE04TRAVDM() %> </td>
   <td NOWRAP align="center" width="20%" ><%= msgList.getE04TRAVRA() %></td>
   <td NOWRAP align="center" width="10%" ><%= msgList.getE04TRAIPC() %> </td>
   <td NOWRAP align="center" width="20%" ><%= msgList.getE04TRAVRD() %></td>
   <td NOWRAP align="center" width="10%" ><%= msgList.getE04TRATCR() %></td>
   <td NOWRAP align="center" width="10%" ><%= msgList.getE04TRAVSM() %></td>
   <td NOWRAP align="center" width="10%" ><%= msgList.getE04TRAPMS() %></td>
   <td NOWRAP align="center" width="10%" ><%= msgList.getE04TRASTS() %></td>





</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EDL099804List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EDL099804List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
