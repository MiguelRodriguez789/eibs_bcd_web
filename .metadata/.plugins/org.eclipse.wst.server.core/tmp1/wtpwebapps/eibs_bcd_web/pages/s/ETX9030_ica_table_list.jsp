<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Tabla de ICA</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ETX9030List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;

function goSearch(type) {
	if (type == 'D') {
		if (getElement("SEARCHCST").value == "") {
			alert("Favor digitar un Código para posicionarse en la lista!!!");
			return;	 
		}
		getElement("SEARCHCDE").value = getElement("SEARCHCST").value;
	}
	
	if (type == 'C') {
		if (getElement("SEARCHCTY").value == "") {
			alert("Favor digitar un Código para posicionarse en la lista!!!");
			return;	 
		}
		getElement("SEARCHCDE").value = getElement("SEARCHCTY").value;
	}
	
	if (type == 'A') {
		if (getElement("SEARCHCOD").value == "") {
			alert("Favor digitar un Código para posicionarse en la lista!!!");
			return;	 
		}
		getElement("SEARCHCDE").value = getElement("SEARCHCOD").value;
	}	
	
	getElement("SEARCHTYPE").value = type;
	
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			document.forms[0].SCREEN.value="1";
	<% } else { %>
			document.forms[0].SCREEN.value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	document.forms[0].SCREEN.value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor Seleccione un Registro");
		return;	 
	}
	document.forms[0].SCREEN.value="3";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor Seleccione un Registro para Borrar");
		return;	 
	}
	document.forms[0].SCREEN.value="4";
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
				var I = document.forms[0].elements[n].value.indexOf("|");
				getElement("E01TXICST").value = document.forms[0].elements[n].value.substr(0,I);
				getElement("E01TXICTY").value = document.forms[0].elements[n].value.substr(I+1,3);
				getElement("E01TXICOD").value = document.forms[0].elements[n].value.substr(I+5,4);
				ok = true;
        		break;
			}
      	}
    }
}

function stopRKey(evt) {
  var evt = (evt) ? evt : ((event) ? event : null);
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;}
}

document.onkeypress = stopRKey; 

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

<h3 align="center">Tabla Impuesto Industria, Comercio y Avisos - ICA<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="ica_table_list.jsp, ETX9030"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSETX9030">

  <INPUT type=HIDDEN name="SCREEN" value="6">
  <INPUT type=HIDDEN name="actRow" value="0">
  <INPUT type=HIDDEN name="TOTROWS" value="0">
  <INPUT type=HIDDEN name="NEXTROWS" value="0">
  <INPUT type=HIDDEN name="CURRROWS" value="0">
  <INPUT type=HIDDEN name="E01TXICST" value="">
  <INPUT type=HIDDEN name="E01TXICTY" value="">
  <INPUT type=HIDDEN name="E01TXICOD" value="">
  <INPUT type=HIDDEN name="SEARCHCDE" value="">
  <INPUT type=HIDDEN name="SEARCHTYPE" value="D">
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Actualizar</b></a>
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
	if ( ETX9030List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No hay Registros.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td nowrap align="center" width="5%"><B>Sel</B></td>
		<td nowrap align="center" width="5%"><B>Depto</B></td>
		<td nowrap align="center" width="15%"><B>Descripción Depto</B></td>
		<td nowrap align="center" width="10%"><B>Ciudad</B></td>
		<td nowrap align="center" width="15%"><B>Descripción Ciudad</B></td>
		<td nowrap align="center" width="10%"><B>Cod. Actividad <br>
		Economica</B></td>
		<td nowrap align="center" width="15%"><B>Descripción Actividad Economica</B></td>
		<td nowrap align="center" width="15%"><B>Tarifa ICA</B></td>
		<td nowrap align="center" width="10%"><B>Base <br>
		ICA</B></td>	
	</TR>
    <TR id=trdark>
		<td nowrap align="center" width="5%"></td>
		<td nowrap align="center" width="5%">
			<INPUT type="text" name="SEARCHCST" size="3" maxlength="2" value="<%= userPO.getHeader1() %>">
				<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('D')" width="15" height="11"
				 title="Order and position in...">
		</td> 
		<td nowrap align="center" width="15%"></td>
		<td nowrap align="center" width="10%">
			<INPUT type="text" name="SEARCHCTY" size="4" maxlength="3" value="<%= userPO.getHeader2() %>">
				<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('C')" width="15" height="11"
				 title="Order and position in...">
		</td>
		<td nowrap align="center" width="15%"></td>
		<td nowrap align="center" width="10%">
			<INPUT type="text" name="SEARCHCOD" size="6" maxlength="4" value="<%= userPO.getHeader3() %>">
				<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('A')" width="15" height="11"
				 title="Order and position in...">
		</td>		 
		<td nowrap align="center" width="15%"></td>
		<td nowrap align="center" width="15%"></td>
		<td nowrap align="center" width="10%"></td>	

	</TR>
         <%
    	  int i = 0;
          ETX9030List.initRow();    
          while (ETX9030List.getNextRow()) {
            ETX903001Message msgList = (ETX903001Message) ETX9030List.getRecord();
		%>              
    <TR id=trclear>

		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="CODE" value="<%= msgList.getE01TXICST()%>|<%= msgList.getE01TXICTY()%>|<%= msgList.getE01TXICOD()%>">
		</td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01TXICST() %></td>
		<td NOWRAP align="left" width="15%" ><%= msgList.getD01TXICST() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01TXICTY() %></td>
		<td NOWRAP align="left" width="15%" ><%= msgList.getD01TXICTY() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01TXICOD() %></td>
		<td NOWRAP align="left" width="15%" ><%= msgList.getD01TXICOD() %></td>
		<td nowrap align="center" width="15%"><%= msgList.getE01TXITAR() %></td>
		<td nowrap align="center" width="10%"><%= msgList.getE01TXIBAS() %></td>	
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
    	if ( ETX9030List.getShowPrev() ) {
  			int pos = ETX9030List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.taxes.JSETX9030?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ETX9030List.getShowNext()) {
  			int pos = ETX9030List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.taxes.JSETX9030?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ETX9030List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ETX9030List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
