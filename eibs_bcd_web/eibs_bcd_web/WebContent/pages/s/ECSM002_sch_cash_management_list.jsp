<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="msgHdr8" class= "datapro.eibs.beans.ECSM00208Message"  scope="session"  />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

var ok = false;

function goAction() {
	document.forms[0].SCREEN.value="11";
	document.forms[0].submit();
}

function goNew() {
	document.forms[0].SCREEN.value="37";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="38";
	document.forms[0].submit();
}


function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Registro a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="39";
	if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar un Código para posicionarse en la lista!!!");
		return;
	}
	getElement("SCREEN").value="36";
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


function setKey(bnk,num,seq) {
	getElement("E08SCHBNK").value = bnk;
	getElement("E08SCHNUM").value = num;
	getElement("E08SCHSEQ").value = seq;
}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click', closeHiddenDivNew);

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

<h3 align="center">Convenios - Programador <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="sch_cash_management_list.jsp, ECSM002"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM002">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="36">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E08SCHBNK" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E08SCHNUM" VALUE="0">
   <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="<%= userPO.getType() %>">

	<div id="hiddenDivNew" class="hiddenDiv">
	 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
		border-color: #0b23b5;
		border-style : solid solid solid solid;
		filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
		<tr id="trdark"> 
	      <td align=CENTER width="40%"> 
	        <div align="right">Convenio :</div>
	      </td>
	      <td align=CENTER width="60%"> 
	        <div align="left"> 
				<INPUT type="text" name="E08SCHNUM" size="13" maxlength="12" value="<%=userPO.getAccNum()%>" readonly> 
	        </div>
	      </td>
	    </tr>
		<tr id="trclear"> 
	      <td align=CENTER width="40%"> 
	        <div align="right">Secuencia :</div>
	      </td>
	      <td align=CENTER width="60%"> 
	        <div align="left"> 
				<INPUT type="text" name="E08SCHSEQ" size="5" maxlength="5" value="<%=msgHdr8.getE08SCHSEQ().trim()%>">
	        </div>
	      </td>
	    </tr>
	   <tr id="trdark">
	   <TD ALIGN=center nowrap colspan="2">
		     <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goNew()"> 
	   </TD>
	   </tr>
	 </TABLE>
	 </div>

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>


<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="20%">
			<div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goAction()"><b>Salir</b></a>
      	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goProcess()"><b>Consultar></b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goAction()"><b>Salir</b></a>
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
      <div align="center"> <h4 style="text-align:center"> No hay Registros.</h4></div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <table  class="tableinfo" width="100%">
  
    <TR id=trdark> 
		<td NOWRAP align="center" width="10%"><B>Sel</B></td>
		<td NOWRAP align="center" width="15%"><B>Banco</B></td>
		<TD nowrap align="center" width="20%"><B>Convenio</B></TD>
		<TD nowrap align="center" width="15%"><B>Secuencia</B></TD>
		<TD nowrap align="center" width="20%"><B>Dia</B></TD>
		<TD nowrap align="center" width="20%"><B>Horas</B></TD>
	</TR>
	<TR id=trdark>
		<td NOWRAP align="center" width="10%"></td>
		<td NOWRAP align="center" width="15%"></td>
		<td NOWRAP align="center" width="20%"></td>
		<td NOWRAP align="left" width="15%">
			<INPUT type="text" name="SEARCHCDE" size="13" maxlength="12" value="<%= userPO.getHeader2() %>" >
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Posicionarse en...">
		</td>
		<td NOWRAP align="center" width="20%"></td>
		<td NOWRAP align="center" width="20%"></td>
	</TR> 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            ECSM00208Message msgRcd = (ECSM00208Message) msgList.getRecord(); 
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="10%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE08SCHBNK()%>','<%= msgRcd.getE08SCHNUM() %>','<%= msgRcd.getE08SCHSEQ() %>')">
		</td>
		<td NOWRAP align="center" width="15%"><%= msgRcd.getE08SCHBNK()%></td>
		<td NOWRAP align="right" width="20%" ><%= msgRcd.getE08SCHNUM()%></td>
		<td NOWRAP align="center" width="15%" ><%= msgRcd.getE08SCHSEQ()%></td>
		<td NOWRAP align="center" width="20%" ><%= msgRcd.getD08SCHDAY()%></td>
		<td NOWRAP align="center" width="15%" ><%= msgRcd.getD08SCHTIM()%></td>
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
		int screen = 36;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 36;
		} 
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= msgList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= msgList.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 

  <SCRIPT type="text/javascript">
     showChecked("key");
	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;
 </SCRIPT>

</form>
</body>
</html>
