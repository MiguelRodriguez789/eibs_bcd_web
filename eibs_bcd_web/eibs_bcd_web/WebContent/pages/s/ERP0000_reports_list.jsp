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
	document.forms[0].SCREEN.value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value = '3';
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
	document.forms[0].SCREEN.value="4";
	if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goRptPrm() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	if ( getElement("E01IBSPRM").value != "Y" ) {
		alert("El Registro seleccionado no maneja Parametros!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="11";
	document.forms[0].submit();
}

function goParameters() {
	if ( adm != 'A' ) {
		alert("Opcion solo para Administradores!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="21";
	document.forms[0].submit();
}

function goModules() {
	if ( adm != 'A' ) {
		alert("Opcion solo para Administradores!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="31";
	document.forms[0].submit();
}

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar un Código para posicionarse en la lista!!!");
		return;
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
		getElement("SCREEN").value="1";
	<% } else { %>
		getElement("SCREEN").value="6";
	<% } %>	
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


function setKey(rpn,lif, prm) {
	getElement("E01IBSRPN").value = rpn;
	getElement("E01IBSLIF").value = lif;
	getElement("E01IBSPRM").value = prm;
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

<h3 align="center">Parámetros de Reportes y Procesos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="reports_list.jsp, ERP0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSERP0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01IBSRPN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01IBSLIF" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01IBSPRM" VALUE="N">
  
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="15%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="15%">
			<a href="javascript:goProcess()"><b>Detalle</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="15%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="15%">
			<a href="javascript:goRptPrm()"><b>Parámetros<br>Por Reporte</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="15%">
			<a href="javascript:goParameters()"><b>Definición<br> de Parámetros</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="15%">
			<a href="javascript:goModules()"><b>Definición<br> de Módulos</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="10%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Consultar<BR>Detalle</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
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
		<td NOWRAP align="center" width="10%"><B>Nombre</B></td>
		<TD nowrap align="center" width="5%"><B>Idioma</B></TD>
		<TD nowrap align="center" width="35%"><B>Descripción</B></TD>
		<TD nowrap align="center" width="20%"><B>Módulo</B></TD>
		<TD nowrap align="center" width="15%"><B>Periodicidad</B></TD>
		<TD nowrap align="center" width="10%"><B>Parámetros</B></TD>
	</TR>
	<TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="left" width="10%">
			<INPUT type="text" name="SEARCHCDE" size="13" maxlength="10" value="<%= userPO.getHeader2() %>" >
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Posicionarse en...">
		</td>
		<TD nowrap align="center" width="5%"><B></B></TD>
		<TD nowrap align="center" width="35%"><B></B></TD>
		<TD nowrap align="center" width="20%"><B></B></TD>
		<TD nowrap align="center" width="15%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
	</TR> 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            ERP000001Message msgRcd = (ERP000001Message) msgList.getRecord(); 
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" 
                   onClick="setKey('<%=msgRcd.getE01IBSRPN()%>' , '<%=msgRcd.getE01IBSLIF()%>' , '<%=msgRcd.getE01IBSPRM()%>')">
		</td>

		<td NOWRAP align="left" width="10%" ><%= msgRcd.getE01IBSRPN()%></td>
		<td NOWRAP align="center" width="5%" >
			<% 	if (msgRcd.getE01IBSLIF().equals("S"))	out.print("Español");
			else if (msgRcd.getE01IBSLIF().equals("E")) out.print("Ingles");
		 	%>
		</td>
		<td NOWRAP align="left" width="35%" ><%= msgRcd.getE01IBSDSC()%></td>
		<td NOWRAP align="center" width="20%" ><%= msgRcd.getD01MODDSC()%></td>
		<td NOWRAP align="center" width="15%" >
			<% 	if (msgRcd.getE01IBSPER().equals("D"))	out.print("Diario");
			else if (msgRcd.getE01IBSPER().equals("S")) out.print("Semanal");
			else if (msgRcd.getE01IBSPER().equals("Q")) out.print("Quincenal");
			else if (msgRcd.getE01IBSPER().equals("M")) out.print("Mensual");
			else if (msgRcd.getE01IBSPER().equals("T")) out.print("Trimestral");
			else if (msgRcd.getE01IBSPER().equals("E")) out.print("Semestral");
			else if (msgRcd.getE01IBSPER().equals("Y")) out.print("Anual");
			else if (msgRcd.getE01IBSPER().equals("B")) out.print("Demanda");
			else if (msgRcd.getE01IBSPER().equals("O")) out.print("Otra");
			else if (msgRcd.getE01IBSPER().equals("N")) out.print("No Aplica");
		 	%>
		</td>
		<td NOWRAP align="center" width="10%" >
			<% 	if (msgRcd.getE01IBSPRM().equals("Y"))	out.print("SI");
			else if (msgRcd.getE01IBSPRM().equals("N")) out.print("NO");
		 	%>
		</td>
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
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.reports.JSERP0000?SCREEN="+screen + "&SEARCHCDE=" + userPO.getHeader2() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.reports.JSERP0000?SCREEN="+screen + "&SEARCHCDE=" + userPO.getHeader2() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
