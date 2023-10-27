<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<HTML>
<HEAD>
<TITLE>
Customer Portfolio Approval 
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "rtExtra" class= "datapro.eibs.beans.ESD010202Message"  scope="session" />



<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="javascript">

function goApproval() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="9";
	document.forms[0].submit();
}
function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="10";
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
			   getElement("PORTFOLIO").value = values[0];
			   getElement("CUSTOMER").value = values[1];
				ok = true;
        		break;
			}
      	}
    }
}

function portInquiry(por, desc) {
		if (por != 0 && por != 9999999999) {
	    	CsmShowInq(por,desc); 
	    } else { 
	    	alert("Portafolio NO Existe aun en el Sistema");
	    }
	}

</script>
</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif','<%=request.getContextPath()%>/images/s/exit_over.gif')">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0102A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="CUSTOMER">
<INPUT TYPE=HIDDEN NAME="PORTFOLIO">
    <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">

  <h3 align="center">Aprobacion Cliente Portafolio<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
  		name="EIBS_GIF" ALT="approval_list.jsp,ESD0102"> 
  </h3>
<hr size="4">
<% int row = 0; %>  
  <TABLE class="tbenter">
    <TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goApproval()"><b>Aprobar</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
    
     </TR>
  </TABLE>
  
<%
   if ( appList.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height=30%">
   <TR>
      <TD>         
         <div align="center"> <h4 style="text-align:center"> No Se Encontraron Registros Activos</h4></div>
      </TD>
   </TR>
</TABLE>

<%
   }
   else
   {
%>   

<table  class="tableinfo" width="100%">
   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 

      <td NOWRAP align="center" width="5%"><b>Opcion</b></td>
      <td NOWRAP align="center" width="15%"><b>Portafolio</b></td>
	  <td NOWRAP align="center" width="15%"><b>Cliente</b></td>
	  <td NOWRAP align="center" width="35%"><b>Nombre</b></td>
	  <td NOWRAP align="center" width="10%"><b>Oficial <br>Cuenta</b></td>
	  <td NOWRAP align="center" width="20%"><b>Operacion</b></td>

  </tr>
   
   <%
      int i = 0;
      appList.initRow();    
      while (appList.getNextRow()) {
      ESD010201Message msgList = (ESD010201Message) appList.getRecord(); 
   %>  
   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 

      <td NOWRAP align="center" width="5%"><INPUT type="radio" name="CODE" value="<%= msgList.getE01PRFNUM() %>|<%= msgList.getE01PRFCUN() %>"></td>
      <td NOWRAP align="left" width="15%" ><A HREF="javascript:portInquiry('<%= msgList.getE01PRFNUM() %>','<%= msgList.getE01PRFDSC() %>')"><%= msgList.getE01PRFNUM() %> </td>
      <td NOWRAP align="left" width="15%" ><A HREF="javascript:portInquiry('<%= msgList.getE01PRFNUM() %>','<%= msgList.getE01PRFDSC() %>')"><%= msgList.getE01PRFCUN() %></td>
      <td NOWRAP align="left" width="35%" ><A HREF="javascript:portInquiry('<%= msgList.getE01PRFNUM() %>','<%= msgList.getE01PRFDSC() %>')"><%= msgList.getE01PRFDSC() %></td>
      <td NOWRAP align="left" width="10%" ><%= msgList.getE01OFCNME() %></td>
      <td NOWRAP align="left" width="20%" ><%= msgList.getE01OPEDSC() %></td>      
   </TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>






<SCRIPT language="JavaScript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= appList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= appList.getFirstRec()%>;
     
</SCRIPT>
<%      
   }
%> 
 
</FORM>

</BODY>
</HTML>
