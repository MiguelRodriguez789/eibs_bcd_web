<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

var ok = false;

function goAction() {
	document.forms[0].SCREEN.value="1";
	document.forms[0].submit();
}

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


function setKey(bnk,tip,evt,res) {

	getElement("E01MEGBNK").value = bnk;
	getElement("E01MEGTIP").value = tip;
	getElement("E01MEGEVT").value = evt;
	getElement("E01MEGRES").value = res;

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

<h3 align="center">Convenios - Mensajes Estandar<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="messsage_cash_management_list.jsp, ECSM003"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM003">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01MEGBNK" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01MEGTIP" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01MEGRES" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01MEGEVT" VALUE=" ">  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="<%= userPO.getType() %>">

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
			<a href="javascript:goAction()"><b>Salir</b></a>
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
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goAction()"><b>Salir</b></a>
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
		<TD nowrap align="center" width="10%"><B>Tipo</B></TD>
		<TD nowrap align="center" width="10%"><B>Evento</B></TD>
		<TD nowrap align="center" width="10%"><B>Resultado</B></TD>
		<TD nowrap align="center" width="60%"><B>Asunto</B></TD>
	</TR>
	<TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"></td>

		<td NOWRAP align="left" width="10%">
			<INPUT type="text" name="SEARCHCDE" size="13" maxlength="12" value="<%= userPO.getHeader2() %>" >
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="16" height="11" title="Posicionarse en...">
		</td>
		<td NOWRAP align="center" width="10%"></td>
		<td NOWRAP align="center" width="10%"></td>
		<td NOWRAP align="center" width="60%"></td>
	</TR> 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            ECSM00301Message msgRcd = (ECSM00301Message) msgList.getRecord(); 
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE01MEGBNK()%>','<%= msgRcd.getE01MEGTIP() %>','<%= msgRcd.getE01MEGEVT() %>','<%= msgRcd.getE01MEGRES() %>')">
		</td>
		<td NOWRAP align="center" width="5%"><%= msgRcd.getE01MEGBNK()%></td>
		<td NOWRAP align="left" width="10%" ><% if (msgRcd.getE01MEGTIP().equals("C")) out.print("Crear/Asociar") ;
			    else if (msgRcd.getE01MEGTIP().equals("R")) out.print("Recaudo") ;
			    else if (msgRcd.getE01MEGTIP().equals("N")) out.print("Nomina") ;
			    else if (msgRcd.getE01MEGTIP().equals("A")) out.print("Ahorro") ;
			    else if (msgRcd.getE01MEGTIP().equals("P")) out.print("Proveedor Interno") ;
			    else if (msgRcd.getE01MEGTIP().equals("Q")) out.print("Proveedor Externo") ;
			    else if (msgRcd.getE01MEGTIP().equals("X")) out.print("Monitoreo") ;
			    else out.print(" ");
			    %>
		</td>
		<td NOWRAP align="left" width="10%" >
          <% if (msgRcd.getE01MEGEVT().equals("VA")) out.print("Validar") ;
			    else if (msgRcd.getE01MEGEVT().equals("PA")) out.print("Proceso") ;
			    else if (msgRcd.getE01MEGEVT().equals("AB")) out.print("Asobancaria") ;
			    else if (msgRcd.getE01MEGEVT().equals("V1")) out.print("Validacion Monto") ;
			    else if (msgRcd.getE01MEGEVT().equals("V2")) out.print("Validacion Cantidad") ;
			    else out.print(" ");
			    %>
		</td>
		<td NOWRAP align="left" width="10%" >
          <% if (msgRcd.getE01MEGRES().equals("Y")) out.print("Sin Errores") ;
			    else if (msgRcd.getE01MEGRES().equals("N")) out.print("Con Errores") ;
			    else out.print(" ");
			    %>
		</td>
		<td NOWRAP align="left" width="60%" ><%= msgRcd.getE01MEGASU()%></td>
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
		int screen = 26;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 26;
		} 
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
