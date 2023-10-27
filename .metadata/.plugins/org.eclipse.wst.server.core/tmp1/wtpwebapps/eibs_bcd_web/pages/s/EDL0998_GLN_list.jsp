<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Cuentas Cartera Vencida</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "hdList" class= "datapro.eibs.beans.EDL099803Message"  scope="session" />
<jsp:useBean id= "EDL099803List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">


function goNew() {
	document.forms[0].SCREEN.value="10";
	document.forms[0].submit();
}

function goMaintenance() {
	isCheck();
	if ( !ok ) {
		alert("Realizar alguna seleccion!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="12";
	document.forms[0].submit();
}

function goInquiry() {
	isCheck();
	if ( !ok ) {
		alert("Realizar alguna seleccion!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="13";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Realizar alguna seleccion!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="14";
	document.forms[0].submit();
}

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
     		   var values = document.forms[0].elements[n].value.split('|');
			   getElement("E03GLNCDE").value = values[0];
			   getElement("E03GLNBNK").value = values[1];
			   getElement("E03GLNCCY").value = values[2];
			   getElement("E03GLNGLN").value = values[3];
				ok = true;
        		break;
			}
      	}
    }
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
<h3 align="center">Cuentas Cartera Vencida

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="GLN_list.jsp, EDL0998"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0998" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E03GLNCDE" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E03GLNBNK" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E03GLNCCY" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E03GLNGLN" VALUE="">
  </p>
  
   
<TABLE class="tbenter"> 
   <TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goNew()"><b>Crear</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="34%">
			<a href="javascript:goInquiry()"><b>Consultar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goDelete()"><b>Eliminar</b></a>
      	</TD>
	</TR>
</TABLE>


<%
   if ( EDL099803List.getNoResult() ) {
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
      <td NOWRAP align="center" width="10%"><B>Sel</B></td>
	  <td NOWRAP align="center" width="15%"><B>Banco</B></td>
	  <td NOWRAP align="center" width="15%"><B>Moneda</B></td>
	  <td NOWRAP align="center" width="20%"><B>Cuenta</B></td>
	  <td NOWRAP align="center" width="40%"><B>Descripcion</B></td>
   </TR>
   
   <%
      int i = 0;
      EDL099803List.initRow();    
      while (EDL099803List.getNextRow()) {
      EDL099803Message msgList = (EDL099803Message) EDL099803List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="10%"><INPUT type="radio" name="CODE" value="<%= msgList.getE03GLNCDE() %>|<%= msgList.getE03GLNBNK() %>|<%= msgList.getE03GLNCCY() %>|<%= msgList.getE03GLNGLN() %>"></td>
   <td NOWRAP align="center" width="15%" ><%= msgList.getE03GLNBNK() %> </td>
   <td NOWRAP align="center" width="15%" ><%= msgList.getE03GLNCCY() %></td>
   <td NOWRAP align="center" width="20%" ><%= msgList.getE03GLNGLN() %></td>
   <td NOWRAP align="center" width="40%" ><%= msgList.getD03GLNGLN() %></td>

</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EDL099803List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EDL099803List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
