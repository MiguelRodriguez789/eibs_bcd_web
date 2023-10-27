<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Monitoreo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EMN0010List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor seleccionar un Archivo para posicionarse en la lista!!!");
		return;	 
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			getElement("SCREEN").value="1";
	<% } else { %>
			getElement("SCREEN").value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	getElement("SCREEN").value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}

function goGenerate() {
	if ( getElement("NEWFIL").value == null || getElement("NEWFIL").value == "" ) {
		alert("Favor Digitar el nombre de un Archivo!!!");
		return;	 
	}
	getElement("E01LOGFIL").value = getElement("NEWFIL").value;
	getElement("SCREEN").value="10";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el registro a borrar!!!");
		return;	 
	}
	getElement("SCREEN").value="4";
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
      	if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
        		break;
			}
      	}
    }

}

function setKey(fil,fld) {
	getElement("E01LOGFIL").value = fil;
	getElement("E01LOGFLD").value = fld;
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

<h3 align="center">Archivos y Campos para Control de Monitoreo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="monitor_list.jsp, EMN0010"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.mntor.JSEMN0010">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01LOGFIL" NAME="E01LOGFIL" VALUE="">
  <INPUT TYPE=HIDDEN id="E01LOGFLD" NAME="E01LOGFLD" VALUE="">
   
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){ %>

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
			<a href="javascript:goGenerate()"><b>Generar<br>Campos</b></a>
			<br>Archivo : 
			<input type="text" name="NEWFIL" id="NEWFIL" size="12" maxlength="10" value="">
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
	if ( EMN0010List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      		<TD align="center"><h4 style="text-align:center"> No hay Archivos.</h4></TD>
      	</TR>
   	</TABLE>
<%
	} 	else {
%>    
    
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th NOWRAP align="center" width="5%"><B>Sel</B></th>
				<th NOWRAP align="center" width="10%"><B>Archivo</B>
					<table border="0">
					<tr id="trdark">
					<td nowrap>
			   			<input type="text" name="SEARCHCDE" id="SEARCHCDE"  size="12" maxlength="10" value="<%=userPO.getSource()%>">
			   			<A href="javascript:goSearch()" >
						<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Ordenar y Posicionarse en..." align="bottom" border="0" style="cursor:hand" >
	        			</a>
		   			</td>
		   			</tr> 
					</table>
				</th>
 				<th NOWRAP align="center" width="10%"><B>Campo</B>
 					<table border="0">
					<tr id="trdark">
					<td nowrap>
			   			<input type="text" name="SEARCHFLD" id="SEARCHFLD"  size="12" maxlength="10" value="<%=userPO.getHeader1()%>">
			   			<A href="javascript:goSearch()" >
						<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Ordenar y Posicionarse en..." align="bottom" border="0" style="cursor:hand" >
	        			</a>
		   			</td>
		   			</tr> 
					</table>
 				</th>
				<th nowrap align="center" width="30%"><B>Descripción DDS</B></th>
				<th nowrap align="center" width="35%"><B>Descripción Funcional</B></th>
				<th NOWRAP align="center" width="5%"><B>Monitorear</B></th>
				<th NOWRAP align="center" width="5%"><B>Tipo</B></th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
        <%
    	  int i = 0; 
          EMN0010List.initRow();
     	  boolean firstTime = true;
		  String chk = "";
          while (EMN0010List.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}          	
            EMN001001Message msgList = (EMN001001Message) EMN0010List.getRecord();
		%>              
		<tr id="dataTable<%= EMN0010List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"> 
				<input type="radio" id="ROW" name="ROW" value="<%= EMN0010List.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgList.getE01LOGFIL()%>','<%=msgList.getE01LOGFLD()%>'); highlightRow('dataTable', <%= EMN0010List.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="10%" ><%= msgList.getE01LOGFIL() %></td>
			<td NOWRAP align="center" width="10%" ><%= msgList.getE01LOGFLD() %></td>
			<td NOWRAP align="left" width="30%" ><%= msgList.getE01LOGDDS() %></td>
			<td NOWRAP align="left" width="35%" ><%= msgList.getE01LOGFNM() %></td>
			<td NOWRAP align="center" width="5%" >
				<% if (msgList.getE01LOGMON().equals("Y")) out.print("Sí");
				    else if (msgList.getE01LOGMON().equals("N")) out.print("No");
				 %>
			</td>
			<td NOWRAP align="center" width="5%" ><%= msgList.getE01LOGTYP() %></td>
		</tr>
      
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
    	if ( EMN0010List.getShowPrev() ) {
  			int pos = EMN0010List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.mntor.JSEMN0010?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getSource() + "&SEARCHFLD=" + userPO.getHeader1() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EMN0010List.getShowNext()) {
  			int pos = EMN0010List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.mntor.JSEMN0010?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getSource() + "&SEARCHFLD=" + userPO.getHeader1() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
 
  
<SCRIPT type="text/javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%=i%>;
	getElement("NEXTROWS").value = <%=EMN0010List.getLastRec()%>;
	getElement("CURRROWS").value = <%=EMN0010List.getFirstRec()%>;
</SCRIPT>
<% } %>

</form>
</body>
</html>
