<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Acceso Banco Oficina por Usuario</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ESD0018List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

var ok = false;

function goNew() {
	document.getElementById("E01USR").value = "<%=userPO.getHeader2()%>";
	document.getElementById("SCREEN").value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="3";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el código a borrar!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="4";
	if (!confirm("Desea borrar el registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goApproval() {
	isCheck();
	if ( !ok ) {
		alert("Por Favor Seleccione el registro para Aprobar!!!");
		return;	 
	}
	document.getElementById("E01ACT").value="A";
	document.getElementById("SCREEN").value="15";
	if (!confirm("Confirma Aprobar el Registro Seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
        		break;
			}
      	}
    }
}

function setKey(bnk,brn,usr) {
	document.getElementById("E01BNK").value = bnk;
	document.getElementById("E01BRN").value = brn;
	document.getElementById("E01USR").value = usr;
	
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

<h3 align="center">Acceso Por Banco y Oficina<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="users_bank_branch_access_list.jsp, ESD0018"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD0018">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01USR" VALUE="<%=userPO.getHeader2() %>">
  <INPUT TYPE=HIDDEN NAME="D01USR" VALUE="<%=userPO.getHeader3() %>">
  <INPUT TYPE=HIDDEN NAME="E01BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01BRN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01ACT" VALUE="">


 <table class="tableinfo">
  <tr> 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
        <tr>
          <td nowrap width="10%" align="right"> Usuario : </td>
          <td nowrap width="12%" align="left"><%= userPO.getHeader2()%></td>
          <td nowrap width="8%" align="right"> Nombre: </td>
          <td nowrap width="50%"align="left"><%= userPO.getHeader3()%></td>
        </tr>
      </table>
    </td>
  </tr>
 </table>

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()+"/servlet/datapro.eibs.security.JSESD0018?SCREEN=1"%>"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goApproval()"><b>Aprobar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()+"/servlet/datapro.eibs.security.JSESD0018?SCREEN=8"%>"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( ESD0018List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Registros.</h4></div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <table  class="tableinfo" width="100%">
  
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>Usuario</B></td>
		<td NOWRAP align="center" width="10%"><B>Banco</B></td>
		<td NOWRAP align="center" width="10%"><B>Oficina</B></td>
		<td NOWRAP align="center" width="65%"><B>Descripción</B></td>
		<td NOWRAP align="center" width="10%"><B>Estado Registro</B></td>		
	</TR>
 
        <%
    	  int i = 0;
          ESD0018List.initRow();    
          while (ESD0018List.getNextRow()) {
            ESD001801Message msgList = (ESD001801Message) ESD0018List.getRecord(); 
		%>              
    <TR id=trclear>

		<td NOWRAP align="center" width="5%"> 
            <INPUT TYPE="radio" name="ROW"  value="<%= ESD0018List.getCurrentRow()%>"  
				onClick="setKey('<%=msgList.getE01BNK()%>','<%=msgList.getE01BRN()%>','<%=msgList.getE01USR()%>')">
		</td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01USR() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BNK() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01ALL().equals("*")?"Todas": msgList.getE01BRN() %></td>
		<td NOWRAP align="left"   width="65%" ><%= msgList.getD01BRN() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01STS().equals("*")?"Marcado para Borrar":" " %></td>
		
		
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
  
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <% 
		int screen = 6;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1;
		} 
    	if ( ESD0018List.getShowPrev() ) {
  			int pos = ESD0018List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESD0018?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ESD0018List.getShowNext()) {
  			int pos = ESD0018List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESD0018?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD0018List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD0018List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
