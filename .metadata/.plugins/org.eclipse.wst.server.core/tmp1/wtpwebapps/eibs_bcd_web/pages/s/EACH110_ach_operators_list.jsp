<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>ACH Institutions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EACH110List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor seleccionar un Código para posicionarse en la lista!!!");
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

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el código a borrar!!!");
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
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				getElement("E01ACOCDE").value = document.forms[0].elements[n].value;
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

<h3 align="center">Instituciones ACH<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="ach_operators_list.jsp, EACH110"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH110">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01ACOCDE" NAME="E01ACOCDE" VALUE="">
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
	if ( EACH110List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Instituciones.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
				<th NOWRAP align="center" width="5%"><B>Sel</B></th>
				<th NOWRAP align="center" width="10%"><B>Código</B>
					<table border="0">
					<tr id="trdark">
					<td nowrap>
			   			<input type="text" name="SEARCHCDE" id="SEARCHCDE"  size="11" maxlength="10" value="<%= userPO.getProdCode() %>">
			   			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Ordenar y posicionarse en...">
		   			</td>
		   			</tr>
					</table>
				</th>
				<th NOWRAP align="center" width="20%"><B>Nombre</B></th>
				<th NOWRAP align="center" width="15%"><B>Tipo</B>
				</th>
				<th nowrap align="center" width="10%"><B>Oficina</B></th>
				<th nowrap align="center" width="20%"><B>Dirección</B></th>
				<th NOWRAP align="center" width="5%"><B>Estado</B></th>
				<th nowrap align="center" width="10%"><B>Ciudad</B></th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%" valign="top">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
        <%
    	  int i = 0;
          EACH110List.initRow();
     	  boolean firstTime = true;
		  String chk = "";
          while (EACH110List.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}          	
            EACH11001Message msgList = (EACH11001Message) EACH110List.getRecord();
		%>              
		<tr id="dataTable<%= EACH110List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="CODE" name="CODE" value="<%= msgList.getE01ACOCDE() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EACH110List.getCurrentRow() %>)"/></td>
			<td NOWRAP align="center" width="10%" ><%= msgList.getE01ACOCDE() %></td>
			<td NOWRAP align="left" width="20%" ><%= msgList.getE01ACONME() %></td>
			<td NOWRAP align="center" width="15%" >
				<% if (msgList.getE01ACOTYP().equals("D")) out.print("Institución Financiera");
				    else if (msgList.getE01ACOTYP().equals("O")) out.print("Operador");
				    else if (msgList.getE01ACOTYP().equals("R")) out.print("Originador");
				    else if (msgList.getE01ACOTYP().equals("C")) out.print("Compañía"); %>
			</td>
			<td NOWRAP align="center" width="10%" >
				<% if (msgList.getE01ACOOCO().equals("O")) out.print("Principal");
				    else if (msgList.getE01ACOOCO().equals("C")) out.print("Sucursal"); %>
			</td>
			<td NOWRAP align="left" width="20%" ><%= msgList.getE01ACOADD() %></td>
			<td NOWRAP align="center" width="5%" ><%= msgList.getE01ACOSTE() %></td>
			<td NOWRAP align="left" width="10%" ><%= msgList.getE01ACOCIT() %></td>
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
    	if ( EACH110List.getShowPrev() ) {
  			int pos = EACH110List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ach.JSEACH110?document.getElementById('SCREEN')="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EACH110List.getShowNext()) {
  			int pos = EACH110List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ach.JSEACH110?document.getElementById('SCREEN')="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%= i%>;
	getElement("NEXTROWS").value = <%= EACH110List.getLastRec()%>;
	getElement("CURRROWS").value = <%= EACH110List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
