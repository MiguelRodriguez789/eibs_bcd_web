<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Acceso Usuarios por Banco Oficina</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ESD0018List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

var ok = false;

function goProcess() {

	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="7";
	document.forms[0].submit();
}

function goApproval() {
	document.getElementById("E01ACT").value="A";
	document.getElementById("SCREEN").value="14";
	document.forms[0].submit();
} 


function goSearch() {
	if (document.getElementById("SEARCHCDE").value == " ") {
		alert("Favor digitar un Código para posicionarse en la lista!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="6";
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

function setKey(usr,dusr) {
	document.getElementById("E01USR").value = usr;
	document.getElementById("D01USR").value = dusr;
	
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

<h3 align="center">
	<% 	
	 	if (userPO.getPurpose().equals("APPROVAL")) {
		 	out.println("Aprobar Acceso Banco Oficina");
	   	} else {
	   		out.println("Acceso Banco Oficina por Usuario ");
	   	}
	%>  
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="user_acess_list.jsp, ESD0018">
</h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD0018">

  <INPUT TYPE=HIDDEN name="SCREEN"     value="7"> 
  <INPUT TYPE=HIDDEN name="actRow"     value="0">
  <INPUT TYPE=HIDDEN name="TOTROWS"    value="0">
  <INPUT TYPE=HIDDEN name="NEXTROWS"   value="0">
  <INPUT TYPE=HIDDEN name="CURRROWS"   value="0">
  <INPUT TYPE=HIDDEN name="FromRecord" value="0">  
  <INPUT TYPE=HIDDEN name="E01USR"     value=" ">
  <INPUT TYPE=HIDDEN name="D01USR"     value=" "> 
  <INPUT TYPE=HIDDEN name="SEARCHCDE"  value=""> 
  <INPUT TYPE=HIDDEN name="E01ACT"     value="N"> 
<table  class="tbenter" width="100%"> <tr bordercolor="#FFFFFF">  <td nowrap> 


<% 
 if (userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter" width="100%"> 
  <TR>
	<TD align="CENTER" class="TDBKG" width="50%">
		<a href="javascript:goProcess()"><b>Modificar</b></a>
	</TD>
	<TD align="CENTER" class="TDBKG" width="50%">
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
			<a href="javascript:goApproval()"><b>Aprobar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 
<%
  }	 
	if ( ESD0018List.getNoResult() ) {
%>

<TABLE class="tbenter" width="100%">
	<tr valign="middle">
		<TD align="center" height="100" nowrap valign="middle" width="100%"> 
			<H4 style="text-align:center">No hay resultados para su criterio de búsqueda.</H4>
		</TD>
	</tr>
</TABLE>
<%
	}
	else {
%>     
  <TABLE class="tableinfo" id="dataTable" width="100%">
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>Usuario</B></td>
		<td NOWRAP align="center" width="85%"><B>Nombre</B></td>	
	</TR>
 	<TR id=trdark> 
		<TD nowrap align="center" width="5%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B>
			<INPUT type="text" name="SEARCHCDE" size="13" maxlength="10" value="<%= userPO.getHeader1() %>">
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11"
				 title="Order and position in...">
		</TD>
		<TD nowrap align="center" width="85%"><B></B></TD>
		
	</TR>
        <%
    	  int i = 0;
          ESD0018List.initRow();    
          while (ESD0018List.getNextRow()) {
            ESD001801Message msgList = (ESD001801Message) ESD0018List.getRecord();	 
         %>   
                    
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
			<INPUT TYPE="radio" name="ROW"  value="<%= ESD0018List.getCurrentRow()%>"  
				onClick="setKey('<%=msgList.getE01USR()%>','<%=msgList.getD01USR()%>')">
		</td>
		<td NOWRAP align="left"   width="10%"  ><%= msgList.getE01USR()%></td>
		<td NOWRAP align="left"   width="85%" ><%= msgList.getD01USR()%></td>
		
		
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE> 

  <TABLE  class="tbenter" WIDTH="100%" ALIGN=CENTER>
   	 <TR>
		<TD WIDTH="50%" ALIGN=LEFT height="25">
		<% 
		 int screen = 6;
		 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1;
		} 
    	if ( ESD0018List.getShowPrev() ) {
  			int pos = ESD0018List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESD0018?SCREEN="+screen+"&FromRecord=" + pos 
  			+ "&SEARCHCDE=" + userPO.getHeader1() + 
  			"\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
		</TD>
		<TD WIDTH="50%" ALIGN=RIGHT height="25"> 
		 <%       
		  if (ESD0018List.getShowNext()) {
  			int pos = ESD0018List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESD0018?SCREEN="+screen+"&FromRecord=" + pos 
  			+ "&SEARCHCDE=" + userPO.getHeader1() + 
  			"\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
		  } %>
		</TD>
	</TR>
 </TABLE>
  
<BR>

<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD0018List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD0018List.getFirstRec()%>;
</SCRIPT>
	</TD> </TR> </table> 
<%
	} 
%>
 
</form>
</body>
</html>
