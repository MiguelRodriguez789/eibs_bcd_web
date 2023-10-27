<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">


var ok = false;

function goNew() {
	document.forms[0].SCREEN.value="12";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="13";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Registro a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="14";
	if (!confirm("Desea borrar el Registro seleccionado?")) {
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


function setKey(cnl, pty, acc, brn, seq) {
	getElement("E02ISCNOI").value = cnl;
	getElement("E02ISCPTY").value = pty;
	getElement("E02ISCACC").value = acc;
	getElement("E02ISCBRN").value = brn;
	getElement("E02ISCSEQ").value = seq;
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
%>

<h3 align="center">Horario de Interfaces y Canales para <%= userPO.getIdentifier().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="interfaces_channels_schedule_list.jsp, ECA0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E02ISCNOI" VALUE="<%= userPO.getIdentifier().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E02ISCPTY" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E02ISCACC" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E02ISCBRN" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E02ISCSEQ" VALUE=" ">

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
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0000?SCREEN=1"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Consultar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0000?SCREEN=1"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>  


<%
  }	 
	if ( msgList.getNoResult() ) {
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
		<TD nowrap align="center" width="16%"><B>Tipo<br>Producto</B></TD>
		<TD nowrap align="center" width="17%"><B>Cuenta</B></TD>
		<TD nowrap align="center" width="17%"><B>Sucursal</B></TD>
		<TD nowrap align="center" width="5%"><B>Seq</B></TD>
		<TD nowrap align="center" width="20%"><B>Dia</B></TD>
		<TD nowrap align="center" width="20%"><B>Horas</B></TD>
	</TR>
 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            ECA000002Message msgRcd = (ECA000002Message) msgList.getRecord(); 
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE02ISCNOI()%>','<%=msgRcd.getE02ISCPTY()%>','<%=msgRcd.getE02ISCACC()%>','<%=msgRcd.getE02ISCBRN()%>','<%=msgRcd.getE02ISCSEQ()%>')">
		</td>

		<td NOWRAP align="left" width="16%" ><%= msgRcd.getE02ISCPTY()%> - <%= msgRcd.getD02PTYDSC()%></td> 
		<td NOWRAP align="left" width="17%" ><%= msgRcd.getE02ISCACC()%> - <%= msgRcd.getD02ACCDSC()%></td>
		<td NOWRAP align="left" width="17%" ><%= msgRcd.getE02ISCBRN()%> - <%= msgRcd.getD02BRNNME()%></td>
		<td NOWRAP align="center" width="5%" ><%= msgRcd.getE02ISCSEQ()%></td>
		<td NOWRAP align="center" width="20%" >
			<% if (msgRcd.getE02ISCDAY().equals("*ALL")) out.print("TODOS");%>
          	<% if (msgRcd.getE02ISCDAY().equals("*WRK")) out.print("HABILES"); %>
          	<% if (msgRcd.getE02ISCDAY().equals("*MON")) out.print("LUNES"); %>
            <% if (msgRcd.getE02ISCDAY().equals("*TUE")) out.print("MARTES"); %>
            <% if (msgRcd.getE02ISCDAY().equals("*WED")) out.print("MIERCOLES"); %>
            <% if (msgRcd.getE02ISCDAY().equals("*THU")) out.print("JUEVES"); %>
            <% if (msgRcd.getE02ISCDAY().equals("*FRI")) out.print("VIERNES"); %>
            <% if (msgRcd.getE02ISCDAY().equals("*SAT")) out.print("SABADO"); %>
            <% if (msgRcd.getE02ISCDAY().equals("*SUN")) out.print("DOMINGO"); %>
		</td>
		<td NOWRAP align="center" width="20%" ><%= msgRcd.getE02ISCFTH()%>:<%= msgRcd.getE02ISCFTM()%> a <%= msgRcd.getE02ISCTTH()%>:<%= msgRcd.getE02ISCTTM()%></td>
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
		int screen = 16;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 11;
		} 
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0000?SCREEN="+screen + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0000?SCREEN="+screen + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= msgList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= msgList.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
