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
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">


var ok = false;
var adm = "<%=currUser.getE01AUT().trim()%>";

function goNew() {
	if ( adm != 'A' ) {
		alert("Opcion solo para Administradores!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="22";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="23";
	document.forms[0].submit();
}

function goDelete() {
	if ( adm != 'A' ) {
		alert("Opcion solo para Administradores!!!");
		return;	 
	}
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Registro a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="24";
	if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goExit() {
	document.forms[0].SCREEN.value="1";
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

function goSearch() {
	if (getElement("SEARCHCD2").value == "") {
		alert("Favor digitar un Código para posicionarse en la lista!!!");
		return;
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
		getElement("SCREEN").value="21";
	<% } else { %>
		getElement("SCREEN").value="26";
	<% } %>	
	document.forms[0].submit();
}

function setKey(cod, lif) {
	getElement("E03PMSCOD").value = cod;
	getElement("E03PMSLIF").value = lif;
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

<h3 align="center">Maestro de Parametros para Reportes / Procesos 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="parameters_list.jsp, ERP0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSERP0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="26">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E03PMSCOD" VALUE="<%= userPO.getHeader3().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E03PMSLIF" VALUE="S">
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Detalle</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goExit()"><b>Salir</b></a>
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
			<a href="javascript:goExit()"><b>Salir</b></a>
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
		<TD nowrap align="center" width="10%"><B>Código</B></TD>
		<TD nowrap align="center" width="45%"><B>Descripción</B></TD>
		<TD nowrap align="center" width="10%"><B>Idioma</B></TD>
		<TD nowrap align="center" width="20%"><B>Tipo</B></TD>
		<TD nowrap align="center" width="10%"><B>Longitud</B></TD>
	</TR>
 	<TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="10%">
			<INPUT type="text" name="SEARCHCD2" size="4" maxlength="2" value="<%= userPO.getHeader3() %>" >
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Posicionarse en...">
		</td>
		<TD nowrap align="center" width="5%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
		<TD nowrap align="center" width="45%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
		<TD nowrap align="center" width="20%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
	</TR> 
 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            ERP000003Message msgRcd = (ERP000003Message) msgList.getRecord(); 
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE03PMSCOD()%>','<%=msgRcd.getE03PMSLIF()%>')">
		</td>

		<td NOWRAP align="center" width="10%" ><%= msgRcd.getE03PMSCOD()%></td>
		<td NOWRAP align="left" width="45%" ><%= msgRcd.getE03PMSDSC()%></td>
		<td NOWRAP align="center" width="10%" >
			<% 	if (msgRcd.getE03PMSLIF().equals("S"))	out.print("Español");
			else if (msgRcd.getE03PMSLIF().equals("E")) out.print("Ingles");
		 	%>
		</td>
		<td NOWRAP align="center" width="20%" >
			<% if (msgRcd.getE03PMSPTY().equals("A")) out.print("ALFANUMERICO");%>
          	<% if (msgRcd.getE03PMSPTY().equals("N")) out.print("NUMERICO"); %>
          	<% if (msgRcd.getE03PMSPTY().equals("Z")) out.print("NUMERICO"); %>
            <% if (msgRcd.getE03PMSPTY().equals("D")) out.print("FECHA"); %>
		</td>
		<% if (msgRcd.getE03PMSPTY().equals("Z")) { %>
			<td NOWRAP align="center" width="10%" ><%= msgRcd.getE03PMSPLN()%>,<%= msgRcd.getE03PMSNDC()%></td>
		<% } else { %>
			<td NOWRAP align="center" width="10%" ><%= msgRcd.getE03PMSPLN()%></td>
		<% } %>	
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
			screen = 21;
		} 
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.reports.JSERP0000?SCREEN="+screen + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.reports.JSERP0000?SCREEN="+screen + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
