<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Interfaces y Canales</title>
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

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor seleccionar Proveedor para posicionarse en la lista!!!");
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

function goTrnNOExitosa() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	getElement("SCREEN").value="11";
	document.forms[0].submit();
}

function goExc() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	getElement("SCREEN").value="21";
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

function setKey(vdd, noe) {
	getElement("E01ITRVND").value = vdd;
	getElement("E01ITRNOE").value = noe;
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
 
 String search = "<img src=\"" + request.getContextPath() + "/images/ico5.gif\" alt=\"Ordenar y Posicionarse en...\" align=\"bottom\" border=\"0\" >";
 String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >";
 
%>

<h3 align="center">Transacciones por Proveedor<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="vendor_transactions_list.jsp, ECA0010"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0010">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01ITRVND" NAME="E01ITRVND" VALUE="">
  <INPUT TYPE=HIDDEN id="E01ITRNOE" NAME="E01ITRNOE" VALUE="">
   
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){ %>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="16%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="16%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="16%">
			<a href="javascript:goTrnNOExitosa()"><b>Códigos Trn.<br>NO Exitosa</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="16%">
			<a href="javascript:goExc()"><b>Transacciones<br>Exentas</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="16%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="17%">
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
      		<TD align="center"><h4 style="text-align:center"> No hay Registros.</h4></TD>
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
				<th NOWRAP align="center" width="3%"><B>Sel</B></th>
				<th NOWRAP align="center" width="10%"><B>Proveedor</B>
					<table border="0" align="center">
					<tr id="trdark" align="center">
					<td nowrap align="center">
			   			<input type="text" name="SEARCHCDE" id="SEARCHCDE"  size="5" maxlength="4" value="<%=userPO.getSource()%>">
			   			<A href="javascript:goSearch()" ><%=search%></a>
		   			</td>
		   			</tr> 
					</table>
				</th>
				<th nowrap align="center" width="20%"><B>Descripción</B></th>
 				<th NOWRAP align="center" width="10%"><B>Transacción</B>
 					<table border="0" align="center">
					<tr id="trdark" align="center">
					<td nowrap align="center">
			   			<input type="text" name="SEARCHCOD" id="SEARCHCOD"  size="5" maxlength="4" value="<%=userPO.getIdentifier()%>">
			   			<A href="javascript:goSearch()" ><%=search%></a>
		   			</td>
		   			</tr> 
					</table>
 				</th>
 				<th nowrap align="center" width="20%"><B>Descripcion</B></th>
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
          msgList.initRow();
     	  boolean firstTime = true;
		  String chk = "";
          while (msgList.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}          	
            ECA001001Message msgRcd = (ECA001001Message) msgList.getRecord();
		%>              
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="3%"> 
				<input type="radio" id="ROW" name="ROW" value="<%= msgList.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgRcd.getE01ITRVND()%>','<%=msgRcd.getE01ITRNOE()%>'); highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="10%" ><%= msgRcd.getE01ITRVND() %></td>
			<td NOWRAP align="left" width="20%" ><%= msgRcd.getD01VND() %></td>
			<td NOWRAP align="center" width="10%" ><%= msgRcd.getE01ITRNOE() %></td>
			<td NOWRAP align="left" width="20%" ><%= msgRcd.getE01ITRDSC() %></td>
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
		String parm = "?SCREEN=" + screen + "&SEARCHCDE=" + userPO.getSource() + "&SEARCHCOD=" + userPO.getIdentifier();
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0010" + parm + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0010" + parm + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
 
  
<SCRIPT type="text/javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%=i%>;
	getElement("NEXTROWS").value = <%=msgList.getLastRec()%>;
	getElement("CURRROWS").value = <%=msgList.getFirstRec()%>;
</SCRIPT>
<% } %>

</form>
</body>
</html>
