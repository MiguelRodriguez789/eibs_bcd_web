<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Relaciones entre Clientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ESD0092List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
var ok = false;

function goSearchMst() {
	if (getElement("SEARCHMST").value == "") {
		alert("Favor seleccionar un Código para posicionarse en la lista!!!");
		return;	 
	}
	getElement("SEARCHCDE").value = "";
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			getElement("SCREEN").value="1";
	<% } else { %>
			getElement("SCREEN").value="6";
	<% }%>
	document.forms[0].submit();
}

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor seleccionar un Código para posicionarse en la lista!!!");
		return;	 
	}
	getElement("SEARCHMST").value = "";
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

function goFilial() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			getElement("SCREEN").value="10";
	<% } else { %>
			getElement("SCREEN").value="16";
	<% }%>
	getElement("E01GEMCUN").value = "0";
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

  function goInquiry() {
	isCheck(); 
    if ( ok ) {
    	var cun = getElement("E01GEMCUN").value;
		pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?SCREEN=8&OPE=00&E01CUN=" + cun;
	   	CenterWindow(pg,600,500,2);
    } else {
		alert("Favor seleccionar un código!!!");	   
     }

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

function setKey(grp,mst,cun) {
	getElement("E01GEMGRP").value = grp;
	getElement("E01GEMMST").value = mst;
	getElement("E01GEMCUN").value = cun;
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

<h3 align="center">Relaciones entre Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="client_groups_list.jsp, ESD0092"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0092">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01GEMGRP" NAME="E01GEMGRP" VALUE="">
  <INPUT TYPE=HIDDEN id="E01GEMMST" NAME="E01GEMMST" VALUE="">
  <INPUT TYPE=HIDDEN id="E01GEMCUN" NAME="E01GEMCUN" VALUE="">
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
			<a href="javascript:goFilial()"><b>Filiales</b></a>
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
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goInquiry()"><b>Consultar<BR>Cliente</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goFilial()"><b>Filiales</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( ESD0092List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width="100%" height="30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Relaciones.</h4> 
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
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th NOWRAP align="center" width="5%"><B>Sel</B></th>
				<th NOWRAP align="center" width="5%"><B>Secuencia</B>
					<table border="0">
					<tr id="trdark">
					<td nowrap>
			   			<input type="text" name="SEARCHMST" id="SEARCHMST"  size="5" maxlength="10" value="<%=userPO.getPorfNum()%>" onKeypress="enterInteger(event)" >
			   			<A href="javascript:goSearchMst()" >
						<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Ordenar y Posicionarse en..." align="bottom" border="0" style="cursor:hand" >
	        			</a>
		   			</td>
		   			</tr> 
					</table>
				</th>
				<th NOWRAP align="center" width="15%"><B>Tipo Relación</B></th>
				<th NOWRAP align="center" width="10%"><B>Codigo<br>Cliente</B>
					<table border="0">
					<tr id="trdark">
					<td nowrap>
			   			<input type="text" name="SEARCHCDE" id="SEARCHCDE"  size="5" maxlength="10" value="<%=userPO.getCusNum()%>" onKeypress="enterInteger(event)" >
			   			<A href="javascript:goSearch()" >
						<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Ordenar y Posicionarse en..." align="bottom" border="0" style="cursor:hand" >
	        			</a>
	        			<A href="javascript:GetCustomerDescId('SEARCHCDE','','')">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
						</A>
		   			</td>
		   			</tr> 
					</table>
				</th>
				<th NOWRAP align="center" width="15%"><B>Identificación</B></th>
				<th nowrap align="center" width="30%"><B>Nombre Relacion</B></th>
				<th nowrap align="center" width="10%"><B>Fecha</B></th>
				<th NOWRAP align="center" width="10%"><B>Estado</B></th>
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
          ESD0092List.initRow();
     	  boolean firstTime = true;
		  String chk = "";
          while (ESD0092List.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}          	
            ESD009201Message msgList = (ESD009201Message) ESD0092List.getRecord();
		%>              
		<tr id="dataTable<%= ESD0092List.getCurrentRow() %>">
			<td nowrap align="center" width="5%">
				<input type="radio" id="ROW" name="ROW" value="<%= ESD0092List.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgList.getE01GEMGRP()%>','<%=msgList.getE01GEMMST()%>','<%=msgList.getE01GEMCUN()%>'); highlightRow('dataTable', <%= ESD0092List.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="5%" ><%= msgList.getE01GEMMST() %></td>
			<td NOWRAP align="center" width="15%" ><%= msgList.getD01GRP() %></td>
			<td NOWRAP align="center" width="10%" ><%= msgList.getE01GEMCUN() %></td>
			<td NOWRAP align="center" width="15%" ><%= msgList.getE01GEMTID() %> - <%= msgList.getE01GEMIDN() %></td>
			<td NOWRAP align="center" width="30%" ><%= msgList.getE01GEMNA1() %></td>
			<td NOWRAP align="center" width="10%" ><%= Util.formatCustomDate(currUser.getE01DTF(),
															msgList.getBigDecimalE01GEMRLM().intValue(),
															msgList.getBigDecimalE01GEMRLD().intValue(),
															msgList.getBigDecimalE01GEMRLY().intValue())%></td>
			<td NOWRAP align="left" width="10%" >
				<% if (msgList.getH01FLGWK1().equals("M")) out.print("Cabeza-");
				    else if (msgList.getH01FLGWK1().equals("G")) out.print("Filial-");
				   if (msgList.getE01GEMSTS().equals("A")) out.print("Activo");
				    else if (msgList.getE01GEMSTS().equals("I")) out.print("Inactivo"); 
				 %>
			</td>
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
    	if ( ESD0092List.getShowPrev() ) {
  			int pos = ESD0092List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0092?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getCusNum() + "&SEARCHMST=" + userPO.getPorfNum() + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ESD0092List.getShowNext()) {
  			int pos = ESD0092List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0092?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getCusNum() + "&SEARCHMST=" + userPO.getPorfNum() + "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%= i%>;
	getElement("NEXTROWS").value = <%= ESD0092List.getLastRec()%>;
	getElement("CURRROWS").value = <%= ESD0092List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
