<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>

<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Tabla de Unidades de Valor Tibutario (UVT)</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ETX9020List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;

function goSearch() {
	if (getElement("SEARCHCDE").value == "0") {
		alert("Favor digitar un Código para posicionarse en la lista!!!");
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
		alert("Favor Seleccione un Registro");
		return;	 
	}
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor Seleccione un Registro para Borrar");
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
				var I = document.forms[0].elements[n].value.indexOf("|");
				getElement("E01TXUVDY").value = document.forms[0].elements[n].value.substr(3,4);
				getElement("E01TXUVDM").value = document.forms[0].elements[n].value.substr(I+1,2);
				getElement("E01TXUVDD").value = document.forms[0].elements[n].value.substr(I+4,2);
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

<h3 align="center">Tabla Unidades Valor Tributario - UVT<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="uvt_table_list.jsp, ETX9020"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSETX9020">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" id="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" id="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" id="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01TXUVDY" id="E01TXUVDY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TXUVDM" id="E01TXUVDM" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TXUVDD" id="E01TXUVDD" VALUE="">
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


<%}if ( ETX9020List.getNoResult() ) {%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No hay Registros.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<% }else {%>    
    
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
				<td NOWRAP align="center" width="5%"><B>Sel</B></td>
				<td NOWRAP align="center" width="24%"><B>Año Vencimiento</B></td>
				<td NOWRAP align="center" width="24%"><B>Mes Vencimiento</B></td>
				<td nowrap align="center" width="24%"><B>Dia Vencimiento</B></td>
				<td NOWRAP align="center" width="23%"><B>Valor Base</B></td>	
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
         <%
    	  ETX9020List.initRow();    
	      boolean firstTime = true;
	      String chk = "";
          while (ETX9020List.getNextRow()) {
            if (firstTime) {
   				firstTime = false;
   				chk = "checked";
   			} else {
   				chk = "";
   			}  
            ETX902001Message msgList = (ETX902001Message) ETX9020List.getRecord();
		%>              
		<tr id="dataTable<%= ETX9020List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="CODE" value="<%=ETX9020List.getCurrentRow()%>; <%= msgList.getE01TXUVDY()%>|<%= msgList.getE01TXUVDM()%>|<%= msgList.getE01TXUVDD()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ETX9020List.getCurrentRow() %>)"/></td>
			<td NOWRAP align="center" width="24%" ><%= msgList.getE01TXUVDY() %></td>
			<td NOWRAP align="center" width="24%" ><%= msgList.getE01TXUVDM() %></td>
			<td NOWRAP align="center" width="24%" ><%= msgList.getE01TXUVDD() %></td>
			<td NOWRAP align="center" width="23%" ><%= msgList.getE01TXUBAS() %></td>
		</tr>
       <% } %> 
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
    	if ( ETX9020List.getShowPrev() ) {
  			int pos = ETX9020List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.taxes.JSETX9020?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ETX9020List.getShowNext()) {
  			int pos = ETX9020List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.taxes.JSETX9020?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	showChecked("CODE");
	document.forms[0].NEXTROWS.value = <%= ETX9020List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ETX9020List.getFirstRec()%>;
</SCRIPT>
<% } %> 
</form>
</body>
</html>
