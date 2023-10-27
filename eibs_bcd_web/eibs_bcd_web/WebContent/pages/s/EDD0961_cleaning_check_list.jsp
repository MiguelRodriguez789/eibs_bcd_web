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
	document.forms[0].SCREEN.value="2";
	document.forms[0].submit();
}

function goUpdate() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="3";
	document.forms[0].submit();
}


function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Registro a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="4";
	if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goCE() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="7";
	document.forms[0].submit();
} 

function goDR() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="10";
	document.forms[0].submit();
} 

function goCR() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="13";
	document.forms[0].submit();
} 

function goDE() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="16";
	document.forms[0].submit();
} 


function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar un Código para posicionarse en la lista!!!");
		return;
	}
	getElement("SCREEN").value="1";
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


function setKey(bnk,ccy,cca,com,ckn,ack,amt) {

	getElement("E01CANBNK").value = bnk;
	getElement("E01CANCCY").value = ccy;
	getElement("E01CANCCA").value = cca;
	getElement("E01CANCOM").value = com;
	getElement("E01CANCKN").value = ckn;
	getElement("E01CANACK").value = ack;
	getElement("E01CANAMT").value = amt;

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

<h3 align="center">Canje Manual<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="cleaning_check_list.jsp, EDD0961"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cleaning.JSEDD0961">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01CANBNK" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01CANCCY" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01CANCCA" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01CANCOM" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01CANCKN" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01CANACK" VALUE="0">
   <INPUT TYPE=HIDDEN NAME="E01CANAMT" VALUE="0">
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="<%= userPO.getType() %>">

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="12%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="12%">
			<a href="javascript:goUpdate()"><b>Modificar</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="12%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="13%">
			<a href="javascript:goCE()"><b>Canje <br> Enviado</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="13%">
			<a href="javascript:goDR()"><b>Devolucion <br> Recibida</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="13%">
			<a href="javascript:goCR()"><b>Canje <br> Recibido</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="13%">
			<a href="javascript:goDE()"><b>Devolucion <br> Enviada</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="12%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goProcess()"><b>Consultar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
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
		<td NOWRAP align="center" width="5%"><B>Banco</B></td>
		<TD nowrap align="center" width="10%"><B>Centro de <br> Compensacion</B></TD>
		<TD nowrap align="center" width="15%"><B>Descripcion</B></TD>
		<TD nowrap align="center" width="5%"><B>Codigo <br> Compensacion<br> Banco</B></TD>
		<TD nowrap align="center" width="15%"><B>Descripcion</B></TD>
        <TD nowrap align="center" width="10%"><B>Cheque</B></TD>
        <TD nowrap align="center" width="10%"><B>Cuenta Cheque</B></TD>
        <TD nowrap align="center" width="10%"><B>Monto</B></TD>
        <TD nowrap align="center" width="5%"><B>C. E.</B></TD>
        <TD nowrap align="center" width="5%"><B>D. R.</B></TD>
        <TD nowrap align="center" width="5%"><B>C. R.</B></TD>
        <TD nowrap align="center" width="5%"><B>D. E.</B></TD>
	</TR>
	<TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="left" width="10%">
			<INPUT type="text" name="SEARCHCDE" size="13" maxlength="12" value="<%= userPO.getHeader2() %>" >
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Posicionarse en...">
		</td>
		<TD nowrap align="center" width="15%"><B></B></TD>
		<TD nowrap align="center" width="5%"><B></B></TD>
		<TD nowrap align="center" width="15%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
        <TD nowrap align="center" width="5%"><B></B></TD>
        <TD nowrap align="center" width="5%"><B></B></TD>
        <TD nowrap align="center" width="5%"><B></B></TD>
        <TD nowrap align="center" width="5%"><B></B></TD>
	</TR> 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            EDD096101Message msgRcd = (EDD096101Message) msgList.getRecord();
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE01CANBNK()%>','<%=msgRcd.getE01CANCCY()%>','<%=msgRcd.getE01CANCCA()%>','<%= msgRcd.getE01CANCOM()%>','<%= msgRcd.getE01CANCKN()%>','<%= msgRcd.getE01CANACK()%>','<%=msgRcd.getE01CANAMT()%>')">
		</td>
		<td NOWRAP align="left" width="5%"><%= msgRcd.getE01CANBNK()%></td>
		<td NOWRAP align="left" width="15%" ><%= msgRcd.getE01CANCCA()%></td>
		<td NOWRAP align="left" width="15%" ><%= msgRcd.getD01CANCCA()%></td>
		<td NOWRAP align="left" width="10%" ><%= msgRcd.getE01CANCOM()%></td>
		<td NOWRAP align="left" width="15%" ><%= msgRcd.getD01CANCOM()%></td>
		<td NOWRAP align="left" width="10%" ><%= msgRcd.getE01CANCKN()%></td>
		<td NOWRAP align="left" width="10%" ><%= msgRcd.getE01CANACK()%></td>
		<td NOWRAP align="left" width="10%" ><%= msgRcd.getE01CANAMT()%></td>
		<td NOWRAP align="center" width="5%"><%= msgRcd.getE01CANSCE()%></td>
		<td NOWRAP align="center" width="5%"><%= msgRcd.getE01CANSDR()%></td>
		<td NOWRAP align="center" width="5%"><%= msgRcd.getE01CANSCR()%></td>
		<td NOWRAP align="center" width="5%"><%= msgRcd.getE01CANSDE()%></td>
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
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cleaning.JSEDD0961?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cleaning.JSEDD0961?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
