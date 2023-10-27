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
<jsp:useBean id= "msgPar" class= "datapro.eibs.beans.EATM00101Message"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

var ok = false;

function goNew() {
	document.forms[0].SCREEN.value="7";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="8";
	document.forms[0].submit();
}


function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Registro a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="9";
	if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goSalir() {
	document.forms[0].SCREEN.value="1";
	document.forms[0].submit();
}


function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar un Código para posicionarse en la lista!!!");
		return;
	}
	getElement("SCREEN").value="6";
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


function setKey(typ,ban) {

	getElement("E02PBABTY").value = typ;
	getElement("E02PBABAN").value = ban;

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

<h3 align="center">ATM Bandejas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="atm_ban_list.jsp, EATM001"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEATM001">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E02PBABNK" VALUE="<%=msgPar.getE01PARBNK()%>">
  <INPUT TYPE=HIDDEN NAME="E02PBATID" VALUE="<%=msgPar.getE01PARTID()%>">
  <INPUT TYPE=HIDDEN NAME="E02PBABTY" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E02PBABAN" VALUE="0">

  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="<%= userPO.getType() %>">

<%int row = 0; %>

 <h4>Informacion Basica</h4>
  
 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Banco : </td>
				<td nowrap width=30% align="left">
					<input type="text" name="E01PARBNK" size="3" maxlength="2" value="<%=msgPar.getE01PARBNK() %>" readonly />
				</td>
				<td nowrap width=20% align="right">Cajero :</td>
				<td nowrap width=30% align="left">
					<input type="text" name="E01PARTID" size="15" maxlength="10" value="<%=msgPar.getE01PARTID()%>" readonly>
				</td>
			</tr>
    	</table> 
      </td>  
    </tr>
  </table>

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
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
			<a href="javascript:goSalir()"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goProcess()"><b>Consultar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>  


<%
  }	 
	if ( msgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Registros.</h4></div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <table  class="tableinfo" width="100%">
  
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>Banco</B></td>
		<TD nowrap align="center" width="15%"><B>Cajero</B></TD>
		<TD nowrap align="center" width="15%"><B>Tipo</B></TD>
		<TD nowrap align="center" width="15%"><B>Descripcion</B></TD>
		<TD nowrap align="center" width="20%"><B>Bandeja</B></TD>
		<TD nowrap align="center" width="20%"><B>Denominacion</B></TD>

	</TR>
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="10%"></td>
		<TD nowrap align="center" width="15%"></TD>
		<td NOWRAP align="left" width="15%">
			<INPUT type="text" name="SEARCHCDE" size="5" maxlength="2" value="<%= userPO.getHeader2() %>" >
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="10" height="10" title="Posicionarse en...">
		</td>
		<TD nowrap align="center" width="15%"></TD>
		<TD nowrap align="center" width="20%"></TD>
		<TD nowrap align="center" width="20%"></TD>
	</TR> 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            EATM00102Message msgRcd = (EATM00102Message) msgList.getRecord();
		%>              
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE02PBABTY()%>','<%= msgRcd.getE02PBABAN()%>')">
		</td>
		<td NOWRAP align="center" width="10%"><%= msgRcd.getE02PBABNK()%></td>
		<td NOWRAP align="left" width="15%" ><%= msgRcd.getE02PBATID()%></td>
		<td NOWRAP align="left" width="15%" ><%= msgRcd.getE02PBABTY()%></td>
		<td NOWRAP align="left" width="15%" ><%= msgRcd.getD02PBABTY()%></td>
		<td NOWRAP align="left" width="20%" ><%= msgRcd.getE02PBABAN()%></td>		
		<td NOWRAP align="left" width="20%" ><%= msgRcd.getE02PBADEN()%></td>		
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
  
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <tr>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <% 
		int screen = 6;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 6;
		} 
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEATM001?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEATM001?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
