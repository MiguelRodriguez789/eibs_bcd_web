<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Parametros IPC</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "hdList" class= "datapro.eibs.beans.EDL099801Message"  scope="session" />
<jsp:useBean id= "dtList" class= "datapro.eibs.beans.EDL099802Message"  scope="session" />
<jsp:useBean id= "EDL099802List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">


function goAction() {
	document.forms[0].SCREEN.value="1";
	document.forms[0].submit();
}


function goNew() {
	document.forms[0].SCREEN.value="3";
	document.forms[0].submit();
}

function goMaintenance() {
	isCheck();
	if ( !ok ) {
		alert("Realizar alguna seleccion!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="5";
	document.forms[0].submit();
}

function goInquiry() {
	isCheck();
	if ( !ok ) {
		alert("Realizar alguna seleccion!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="6";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Realizar alguna seleccion!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="7";
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
			   getElement("E02INDVDM").value = values[0];
			   getElement("E02INDVDD").value = values[1];
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
<h3 align="center">IPC

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="IPC_year_list.jsp, EDL0998"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0998" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E02INDVDM" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E02INDVDD" VALUE="">
 
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
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goNew()"><b>Crear</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goMaintenance()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goInquiry()"><b>Consultar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goDelete()"><b>Eliminar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goAction()"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>


<%
   if ( EDL099802List.getNoResult() ) {
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
      <td NOWRAP align="center" width="20%"><B>Sel</B></td>
	  <td NOWRAP align="center" width="30%"><B>Mes</B></td>
	  <td NOWRAP align="center" width="50%"><B>Vr IPC</B></td>
   </TR>
   
   <%
      int i = 0;
      EDL099802List.initRow();    
      while (EDL099802List.getNextRow()) {
      EDL099802Message msgList = (EDL099802Message) EDL099802List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="20%"><INPUT type="radio" name="CODE" value="<%= msgList.getE02INDVDM() %>|<%= msgList.getE02INDVDD() %>"></td>
   <td NOWRAP align="center" width="30%" ><%= msgList.getE02INDVDM() %> </td>
   <td NOWRAP align="center" width="50%" ><%= msgList.getE02INDPRC() %></td>

</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EDL099802List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EDL099802List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
