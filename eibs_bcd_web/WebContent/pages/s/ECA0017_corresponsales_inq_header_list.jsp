<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
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

function goInquiry() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="12";
	document.forms[0].submit();
} 

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="13";
	document.forms[0].submit();
}

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar un C�digo para posicionarse en la lista!!!");
		return;
	}
	getElement("SCREEN").value="11";
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


function setKey(bnk,cun) {

	getElement("E03CORBNK").value = bnk;
	getElement("E03CORCUN").value = cun;

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

<h3 align="center">Corresponsales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="corresponsales_inq_header_list.jsp, ECA0017"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0017">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="11">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E03CORBNK" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E03CORCUN" VALUE="0">
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="<%= userPO.getType() %>">

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goInquiry()"><b>Consultar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess()"><b>Detalle</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
	 
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
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="5%"><B>Banco</B></td>
		<TD nowrap align="center" width="15%"><B>Cliente</B></TD>
		<TD nowrap align="center" width="75%"><B>Descripcion</B></TD>
	</TR>
	<TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="left" width="15%">
			<INPUT type="text" name="SEARCHCDE" size="9" maxlength="9" value="<%= userPO.getHeader2() %>" >
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="10" height="10" title="Posicionarse en...">
		</td>
		<TD nowrap align="center" width="75%"><B></B></TD>
	</TR> 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            ECA001703Message msgRcd = (ECA001703Message) msgList.getRecord(); 
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE03CORBNK()%>','<%= msgRcd.getE03CORCUN()%>')">
		</td>
		<td NOWRAP align="center" width="5%"><%= msgRcd.getE03CORBNK()%></td>
		<td NOWRAP align="left" width="15%" ><%= msgRcd.getE03CORCUN()%></td>
		<td NOWRAP align="left" width="75%" ><%= msgRcd.getD03CORCUN()%></td>
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
		int screen = 11;
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0017?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0017?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
</form>
</body>
</html>
