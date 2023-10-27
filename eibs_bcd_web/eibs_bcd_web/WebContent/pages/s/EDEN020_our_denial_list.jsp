<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Lista de Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EDEN020List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;

function goSearch(type) {
	if (type == 'C') {
		if (document.getElementById("SEARCHCUN").value == "") {
			alert("Favor digitar un Código para posicionarse en la lista!!!");
			return;
		}
		document.getElementById("SEARCHCDE").value = document.getElementById("SEARCHCUN").value;
	}

	if (type == 'N') {
		if (document.getElementById("SEARCHNME").value == "") {
			alert("Favor digitar un Nombre para posicionarse en la lista!!!");
			return;
		}
		document.getElementById("SEARCHCDE").value = document.getElementById("SEARCHNME").value;
	}

	if (type == 'I') {
		if (document.getElementById("SEARCHIDN").value == "") {
			alert("Favor digitar una Identificacion para posicionarse en la lista!!!");
			return;
		}
		document.getElementById("SEARCHCDE").value = document.getElementById("SEARCHIDN").value;
	}
	
	document.getElementById("SEARCHTYPE").value = type;
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			document.getElementById("SCREEN").value="1";
	<% } else { %>
			document.getElementById("SCREEN").value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
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

function goSel() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un registro!!!");
		return;	 
	}
	window.opener.document.forms[0].E01OCOUN.value = document.getElementById("E01OCOUN").value;
	window.close();
}


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				document.getElementById("E01OCOUN").value = document.forms[0].elements[n].value;
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
%>

<h3 align="center">Lista de Control - Lista Propia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="our_denial_list.jsp, EDEN020"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN020">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" id="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" id="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" id="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01OCOUN" id="E01OCOUN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01ONAME" id="E01ONAME" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01OIDN" id="E01OIDN" VALUE="">
  <INPUT TYPE="HIDDEN" name="SEARCHCDE" id="SEARCHCDE" value="">
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="C">
  
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
			<a href="javascript:goProcess()"><b>Consultar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( EDEN020List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay registros.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
 <TABLE  id="mainTable" class="tableinfo" height="50%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="95%">
    			<TR id="trdark">  
					<th NOWRAP align="center" width="5%"><B>Sel</B></th>
					<th NOWRAP align="center" width="10%"><B>Código</B>
	                	<table border="0">
    					<tr id="trdark">
    					<td nowrap>
			    			<INPUT type="text" name="SEARCHCUN" id="SEARCHCUN" size="13" maxlength="11" value="<%= userPO.getCusNum() %>">
			    			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('C')" width="15" height="11" title="Ordenar y posicionarse en...">
			    		</td>
						</tr>
    					</table>
					</th>
					<th NOWRAP align="center" width="35%"><B>Nombre</B>
	                	<table border="0">
    					<tr id="trdark">
    					<td nowrap>
			    			<INPUT type="text" name="SEARCHNME" id="SEARCHNME" size="45" maxlength="60" value="<%= userPO.getCusName() %>">
			    			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('N')" width="15" height="11" title="Ordenar y posicionarse en...">
			    		</td>
						</tr>
    					</table>
					</th>
					<th nowrap align="center" width="20%"><B>Numero de<br>Identificación</B>
	                	<table border="0">
    					<tr id="trdark">
    					<td nowrap>
			    			<INPUT type="text" name="SEARCHIDN" id="SEARCHIDN" size="26" maxlength="25" value="<%= userPO.getIdentifier() %>">
			    			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('I')" width="15" height="11" title="Ordenar y posicionarse en...">
			    		</td>
						</tr>
    					</table>
					</th>
					<th nowrap align="center" width="10%"><B>Tipo de<br>Identificación</B></th>
					<th NOWRAP align="center" width="20%"><B>Tipo Legal</B></th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:500px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
        <%
    	  int i = 0;
          EDEN020List.initRow();    
		  boolean firstTime = true;
		  String chk = "";
          while (EDEN020List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
            EDEN02001Message msgList = (EDEN02001Message) EDEN020List.getRecord(); 
		%>              
		<tr id="dataTable<%= EDEN020List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="CODE" name="CODE" value="<%=msgList.getE01OCOUN()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EDEN020List.getCurrentRow() %>)"/></td>
			<td NOWRAP align="center" width="10%" ><%= msgList.getE01OCOUN() %></td>
			<td NOWRAP align="left" width="35%" ><%= msgList.getE01ONAME() %></td>
			<td NOWRAP align="center" width="20%" ><%= msgList.getE01OIDN() %></td>
			<td NOWRAP align="center" width="10%" ><%= msgList.getE01OTID() %></td>
			<td NOWRAP align="left" width="20%" >
				<% if (msgList.getE01OLGT().equals("N")) out.print("Natural") ;
					else if (msgList.getE01OLGT().equals("J")) out.print("Juridico") ;
					else if (msgList.getE01OLGT().equals("A")) out.print("Asociación") ;
				    else out.print("Desconocido");
				%>
			</td>
		</TR>
       <% i++; } %> 
             </table>
             </div>
             </td>
             </tr>
</table>
  
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <% 
		int screen = 6;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1;
		} 
    	if ( EDEN020List.getShowPrev() ) {
  			int pos = EDEN020List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN020?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EDEN020List.getShowNext()) {
  			int pos = EDEN020List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN020?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	showChecked("CODE");
	document.getElementById("TOTROWS").value = <%= i%>;
	document.getElementById("NEXTROWS").value = <%= EDEN020List.getLastRec()%>;
	document.getElementById("CURRROWS").value = <%= EDEN020List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
