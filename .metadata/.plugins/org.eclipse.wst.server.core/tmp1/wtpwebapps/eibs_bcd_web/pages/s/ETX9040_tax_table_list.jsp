<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>

<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Control Tax And Witholding Information</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ETX9040List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;


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
				getElement("E01TAXBNK").value = document.forms[0].elements[n].value.substr(0,I);
				getElement("E01TAXCOD").value = document.forms[0].elements[n].value.substr(I+1,3);
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

<h3 align="center">IMPUESTOS Y RETENCION DE IMPUESTOS - PARAMETROS<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="tax_table_list.jsp, ETX9040"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSETX9040">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01TAXBNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TAXCOD" VALUE="">
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<!-- -->
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
      	<!-- -->
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Actualizar</b></a>
      	</TD>
		<!--
		<TD align="CENTER" class="TDBKG" width="25%">
			 <a href="javascript:goDelete()"><b>Borrar</b></a>
		</TD> 
		-->
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
	if ( ETX9040List.getNoResult() ) {
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
    
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<td NOWRAP align="center" width="5%"><B>Sel</B></td>
				<td NOWRAP align="center" width="5%"><B>Banco</B></td>
				<td NOWRAP align="center" width="5%"><B>Código</B></td>
				<td NOWRAP align="center" width="15%"><B>Porcentaje</B></td>	
				<td nowrap align="left" width="45%"><B>Descripción</B></td>
				<td nowrap align="left" width="20%"><B>Tipo</B></td>
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
          ETX9040List.initRow();
    	  boolean firstTime = true;
          String chk = "";    
          while (ETX9040List.getNextRow()) {
          if (firstTime) {
   				firstTime = false;
   				chk = "checked";
   			} else {
   				chk = "";
   			}  
            ETX904001Message msgList = (ETX904001Message) ETX9040List.getRecord();
		%>              
	<tr id="dataTable<%= ETX9040List.getCurrentRow() %>">
		<td nowrap align="center" width="5%"><input type="radio" name="CODE" value="<%=ETX9040List.getCurrentRow()%>; <%= msgList.getE01TAXBNK()%>|<%= msgList.getE01TAXCOD()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ETX9040List.getCurrentRow() %>)"/></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01TAXBNK() %></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01TAXCOD() %></td>
		<td NOWRAP align="center" width="15%" ><%= msgList.getE01TAXPRC() %></td>
		<td NOWRAP align="left"   width="45%" ><%= msgList.getE01TAXDSC() %></td>
		<td NOWRAP align="left"   width="20%" >
			<% if (msgList.getE01TAXFL2().equals("I")) { out.print("BASICO"); } else {out.print("ADICIONAL");}%>
			- 
			<% if (msgList.getE01TAXFL1().equals("R")) out.print("RETENCION RENTA");%>
			<% if (msgList.getE01TAXFL1().equals("E")) out.print("RETENCION IVA");%>
			<% if (msgList.getE01TAXFL1().equals("I")) out.print("IVA");%>
			<% if (msgList.getE01TAXFL1().equals("G")) out.print("GMF");%>
			<% if (msgList.getE01TAXFL1().equals("T")) out.print("TIMBRE");%>
			<% if (msgList.getE01TAXFL1().equals("C")) out.print("RETENCION ICA");%>
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
    	if ( ETX9040List.getShowPrev() ) {
  			int pos = ETX9040List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.taxes.JSETX9040?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ETX9040List.getShowNext()) {
  			int pos = ETX9040List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.taxes.JSETX9040?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	showChecked("CODE");
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ETX9040List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ETX9040List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
