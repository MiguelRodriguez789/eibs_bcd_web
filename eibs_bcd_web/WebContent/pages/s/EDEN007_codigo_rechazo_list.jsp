<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<%@ page import = "datapro.eibs.beans.*" %>
<title>Reserved Words</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EDEN007List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;

function removeSpaces(string) {
 	return string.split(' ').join('');
} 

function goSearch() {
	if (getElement("SEARCHWOR").value == "") {
			alert("Favor digitar un codigo de rechazo para posicionarse en la lista!!!");
			return;
		}
	getElement("SEARCHCDE").value = getElement("SEARCHWOR").value;
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			document.forms[0].SCREEN.value="1";
	<% } else { %>
			document.forms[0].SCREEN.value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
/*
	if ( getElement("E01DTCCDE").value == "" ) {
		alert("Favor digitar codigo a incluir!!!");
		return;	 
	}
	getElement("E01DTCCDE").value = removeSpaces(getElement("E01DTCCDE").value);
*/
	document.forms[0].SCREEN.value="6";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione codigo a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="4";
	if (!confirm("Desea borrar el codigo seleccionado?")) {
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

<h3 align="center">Lista de Control - Codigos de Rechazo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="codigo_rechazo_list.jsp, EDEN007"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN007">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE="HIDDEN" id="SEARCHCDE" name="SEARCHCDE" value="">
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
<%-- 	
		<TD align="CENTER" width="10%">Codigo a Incluir : </TD>
		<TD align="LEFT" width="30%">
			<input type="text" id="E01DTCCDE" name="E01DTCCDE" size="8" maxlength="5" value="">
		</TD>
--%>	
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goNew()"><b>Adicionar<br>Codigo</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goDelete()"><b>Borrar<br>Codigo</b></a>
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
	  	<TD align="CENTER" class="TDBKG" width="100%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  }
%> 


<% 
	if ( EDEN007List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Codigos de Rechazo.</h4></div>
      </TD>
	</TR>
   	</TABLE>
<%
	} else {
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>Codigo</B></td>
		<td NOWRAP align="center" width="40%"><B>Descripcion</B></td>
		<td NOWRAP align="center" width="20%"><B>Usuario</B></td>
		<td NOWRAP align="center" width="25%"><B>Fecha<br>Inclusión/Modificación</B></td>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="15%">
			<INPUT type="text" id="SEARCHWOR" name="SEARCHWOR" size="8" maxlength="5" value="<%= userPO.getHeader1() %>">
				<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" 
					title="Posicionarse en...">
		</td>
		<td NOWRAP align="center" width="25%"></td>
		<td NOWRAP align="center" width="25%"></td>
	</TR>
 
        <%
    	  int i = 0;
          EDEN007List.initRow();    
          while (EDEN007List.getNextRow()) {
            EDEN00701Message msgList = (EDEN00701Message) EDEN007List.getRecord();	 
         %>              
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= msgList.getE01DTCCDE()%>"> 
		</td>
		<td NOWRAP align="left" width="10%" ><%= msgList.getE01DTCCDE() %></td>
		<td NOWRAP align="center" width="40%" ><%= msgList.getE01DTCDSC() %></td>
		<td NOWRAP align="center" width="20%" ><%= msgList.getE01DTCUSR() %></td>
		<td NOWRAP align="center" width="25%" >
			<%=  Util.formatCustomDate(currUser.getE01DTF(),
													msgList.getBigDecimalE01DTCMDM().intValue(),
													msgList.getBigDecimalE01DTCMDD().intValue(),
													msgList.getBigDecimalE01DTCMDY().intValue())%>
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
    	if ( EDEN007List.getShowPrev() ) {
  			int pos = EDEN007List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN007?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EDEN007List.getShowNext()) {
  			int pos = EDEN007List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN007?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EDEN007List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EDEN007List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
