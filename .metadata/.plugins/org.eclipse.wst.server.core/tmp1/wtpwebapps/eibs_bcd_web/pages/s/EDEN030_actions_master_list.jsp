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
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;

function goSearch(type) {
	if (type == 'S') {
		if (document.getElementById("SEARCHSRC").value == "") {
			alert("Favor digitar un Código para posicionarse en la lista!!!");
			return;
		}
		document.getElementById("SEARCHSRC").value = document.getElementById("SEARCHSRC").value;
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


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
        		break;
			}
      	}
    }

}

function setKey(src,typ) {
	getElement("E01SRC").value = src;
	getElement("E01TYP").value = typ;
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

<h3 align="center">Lista de Control - Acciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="actions_master_list.jsp, EDEN030"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN030">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" id="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" id="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" id="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01SRC" id="E01SRC" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TYP" id="E01TYPE" VALUE="">
  <INPUT TYPE="HIDDEN" name="SEARCHSRC" id="SEARCHSRC" value="">
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="S">
  
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
	if ( msgList.getNoResult() ) {
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
   		<TD NOWRAP valign="top" width="100%"> 
    		<TABLE id="headTable" width="100%">
    			<TR id="trdark">  
					<th NOWRAP align="center" width="10%"><B>Sel</B></th>
					<th NOWRAP align="center" width="30%"><B>Fuente</B>
	                	<table border="0">
    					<tr id="trdark">
    					<td nowrap>
			    			<INPUT type="text" name="SEARCHSRC" id="SEARCHSRC" size="5" maxlength="4" value="<%= userPO.getHeader1() %>">
			    			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('S')" width="15" height="11" title="Ordenar y posicionarse en...">
			    		</td>
						</tr>
    					</table>
					</th>
					<th NOWRAP align="center" width="20%"><B>Tipo Coincidencia</B></th>
					<th nowrap align="center" width="20%"><B>Acción</B></th>
					<th nowrap align="center" width="20%"><B>Area</B></th>
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
          msgList.initRow();    
		  boolean firstTime = true;
          while (msgList.getNextRow()) {
            EDEN03001Message rcdList = (EDEN03001Message) msgList.getRecord(); 
		%>              
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="10%">
				<input type="radio" id="CODE" name="CODE" value="<%=rcdList.getE01SRC()%>" class="highlight" 
					onClick="setKey('<%=rcdList.getE01SRC()%>','<%=rcdList.getE01TYP()%>'); highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="left" width="30%" ><%= rcdList.getE01SRC() %> - <%= rcdList.getD01SRC() %></td>
			<td NOWRAP align="center" width="20%" >
			<% if (rcdList.getE01TYP().equals("I")) out.print("Por Identificación") ;
					else if (rcdList.getE01TYP().equals("W")) out.print("Por Palabra/Sonido") ;
					else if (rcdList.getE01TYP().equals("B")) out.print("Cualquiera") ;
				    else out.print("Desconocida");
				%> 
			<td NOWRAP align="center" width="20%" >
				<% if (rcdList.getE01ACC().equals("B")) out.print("Bloquear") ;
					else if (rcdList.getE01ACC().equals("A")) out.print("Alerta") ;
				    else out.print("Desconocida");
				%>
			</td>
			<td NOWRAP align="center" width="20%" ><%= rcdList.getD01ARE() %></td>
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
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN030?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHSRC=" + userPO.getHeader1() + "&SEARCHTYPE=" + userPO.getType() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  <%
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN030?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHSRC=" + userPO.getHeader1() + "&SEARCHTYPE=" + userPO.getType() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    }%>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.getElementById("TOTROWS").value = <%= i%>;
	document.getElementById("NEXTROWS").value = <%= msgList.getLastRec()%>;
	document.getElementById("CURRROWS").value = <%= msgList.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
