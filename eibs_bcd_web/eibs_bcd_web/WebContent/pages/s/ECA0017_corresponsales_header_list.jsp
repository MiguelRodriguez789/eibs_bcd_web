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

function goProcess() {
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

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar un C�digo para posicionarse en la lista!!!");
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


function setKey(bnk,cun) {

	getElement("E01CORBNK").value = bnk;
	getElement("E01CORCUN").value = cun;

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

<h3 align="center">Corresponsales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="corresponsales_header_list.jsp, ECA0017"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0017">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01CORBNK" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01CORCUN" VALUE="0">
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="<%= userPO.getType() %>">

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="20%">
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
			<a href="javascript:goProcess()"><b>Consultar></b></a>
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
		<TD nowrap align="center" width="15%"><B>Cliente</B></TD>
		<TD nowrap align="center" width="50%"><B>Nombre</B></TD>
		<TD nowrap align="center" width="10%"><B>Estado</B></TD>
		<TD nowrap align="center" width="15%"><B>Descripcion</B></TD>
	</TR>
	<TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="left" width="15%">
			<INPUT type="text" name="SEARCHCDE" size="9" maxlength="9" value="<%= userPO.getHeader2() %>" >
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="10" height="10" title="Posicionarse en...">
		</td>
		<TD nowrap align="center" width="50%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
		<TD nowrap align="center" width="15%"><B></B></TD>
	</TR> 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            ECA001701Message msgRcd = (ECA001701Message) msgList.getRecord(); 
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE01CORBNK()%>','<%= msgRcd.getE01CORCUN()%>')">
		</td>
		<td NOWRAP align="center" width="5%"><%= msgRcd.getE01CORBNK()%></td>
		<td NOWRAP align="left" width="15%" ><%= msgRcd.getE01CORCUN()%></td>
		<td NOWRAP align="left" width="50%" ><%= msgRcd.getD01CORCUN()%></td>
		<td NOWRAP align="left" width="10%" ><%= msgRcd.getE01CORSTS()%></td>
		<td NOWRAP align="left" width="15%" ><input type="text" readonly name="D01CORSTS" size="20" maxlength="30" 
					     						value="<% 	if (msgRcd.getE01CORSTS().equals("A")) out.print("Activo");
								   							else if (msgRcd.getE01CORSTS().equals("C")) out.print("Bloqueado");
								   							else if (msgRcd.getE01CORSTS().equals("I")) out.print("Inactivo");
							       							else out.print("");%>"></td>
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
		int screen = 1;
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0017?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0017?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
