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
<jsp:useBean id= "EDEN005List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;

function removeSpaces(string) {
 	return string.split(' ').join('');
} 

function goSearch() {
	if (document.getElementById("SEARCHWOR").value == "") {
			alert("Favor digitar un palabra para posicionarse en la lista!!!");
			return;
		}
	document.getElementById("SEARCHCDE").value = document.getElementById("SEARCHWOR").value;
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			document.getElementById("SCREEN").value="1";
	<% } else { %>
			document.getElementById("SCREEN").value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	if ( document.getElementById("E01RSVWRD").value == "" ) {
		alert("Favor digitar la palabra a incluir!!!");
		return;	 
	}
	document.getElementById("E01RSVWRD").value = removeSpaces(document.getElementById("E01RSVWRD").value);
	document.getElementById("SCREEN").value="5";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione la palabra a borrar!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="4";
	if (!confirm("Desea borrar la palabra seleccionada?")) {
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
				getElement("E01RSVWRD").value = document.forms[0].elements[n].value;
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

<h3 align="center">Lista de Control - Palabras Reservadas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="reserved_words_list.jsp, EDEN005"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN005">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" id="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" id="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" id="CURRROWS" VALUE="0">
  <INPUT TYPE="HIDDEN" name="SEARCHCDE" id="SEARCHCDE" value="">
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" width="10%">Palabra a Incluir : </TD>
		<TD align="LEFT" width="30%">
			<input type="text" name="E01RSVWRD" id="E01RSVWRD" size="46" maxlength="45" value="">
		</TD>	
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goNew()"><b>Adicionar<br>Palabra</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goDelete()"><b>Borrar<br>Palabra</b></a>
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
	if ( EDEN005List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Palabras Reservadas.</h4></div>
      </TD>
	</TR>
   	</TABLE>
<%
	} else {
%>    
    
 <TABLE  id="mainTable" class="tableinfo" height="70%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="100%">
    			<TR id="trdark">  
					<th NOWRAP align="center" width="5%"><B>Sel</B></th>
					<th NOWRAP align="center" width="35%"><B>Palabra</B>
		                	<table border="0">
	    					<tr id="trdark">
	    					<td nowrap align="center">
				    			<INPUT type="text" name="SEARCHWOR" id="SEARCHWOR" size="45" maxlength="45" value="<%= userPO.getHeader1() %>">
				    			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Posicionarse en...">
				    		</td>
							</tr>
	    					</table>
					</th>
					<th NOWRAP align="center" width="30%"><B>Usuario</B></th>
					<th NOWRAP align="center" width="30%"><B>Fecha<br>Inclusión/Modificación</B></th>
			    </tr>
			    </TABLE>
			    </TD>
			    </TR>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:500px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
        <%
    	  int i = 0;
          EDEN005List.initRow();    
    	  boolean firstTime = true;
		  String chk = "";
          while (EDEN005List.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
            EDEN00501Message msgList = (EDEN00501Message) EDEN005List.getRecord();	 
         %>              
		<tr id="dataTable<%= EDEN005List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="ROW" name="ROW" value="<%= msgList.getE01RSVWRD() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EDEN005List.getCurrentRow() %>)"/></td>
			<td NOWRAP align="center" width="35%" ><%= msgList.getE01RSVWRD() %></td>
			<td NOWRAP align="center" width="30%" ><%= msgList.getE01RSVUSR() %></td>
			<td NOWRAP align="center" width="30%" >
				<%=  Util.formatCustomDate(currUser.getE01DTF(),
													msgList.getBigDecimalE01RSVMDM().intValue(),
													msgList.getBigDecimalE01RSVMDD().intValue(),
													msgList.getBigDecimalE01RSVMDY().intValue())%>
			</td>
		
	</TR>
       <% 
       	 i++; 
        } 
       %> 
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
    	if ( EDEN005List.getShowPrev() ) {
  			int pos = EDEN005List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN005?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EDEN005List.getShowNext()) {
  			int pos = EDEN005List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN005?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	showChecked("ROW");
	getElement("TOTROWS").value = <%= i%>;
	getElement("NEXTROWS").value = <%= EDEN005List.getLastRec()%>;
	getElement("CURRROWS").value = <%= EDEN005List.getFirstRec()%>;
</SCRIPT>
<% } %> 
</form>
</body>
</html>
