<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Clientes tipo Usuario</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ESD0087List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;

function goSearch(type) {
	if (type == 'C') {
		if (document.getElementById("SEARCHCUN").value == "") {
			alert("Favor digitar un Código para posicionarse en la lista!!!");
			return;
		}
		document.getElementById("SEARCHCDE").value = document.getElementById("SEARCHCUN").value;
	}

	if (type == 'S') {
		if (document.getElementById("SEARCHSHN").value == "") {
			alert("Favor digitar un nombre para posicionarse en la lista!!!");
			return;
		}
		document.getElementById("SEARCHCDE").value = document.getElementById("SEARCHSHN").value;
	}
	if (type == 'I') {
		if (document.getElementById("SEARCHIDN").value == "") {
			alert("Favor digitar una identificacion para posicionarse en la lista!!!");
			return;
		}
		document.getElementById("SEARCHCDE").value = document.getElementById("SEARCHIDN").value;
	}
	
	document.getElementById("SEARCHTYPE").value = type;
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			document.getElementById("SCREEN").value="1";
	<% } else { %>
			document.getElementById("SCREEN").value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	document.getElementById("SCREEN").value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="3";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el código a borrar!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="4";
	if (!confirm("Desea borrar el registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goCust() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un usuario!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="10";
	if (!confirm("Desea vincular el usuario como cliente?")) {
		return;
	}
	document.forms[0].submit();
}

function goSel() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un usuario!!!");
		return;	 
	}
	window.opener.document.forms[0].E01CUN.value = document.getElementById("E01CUN").value;
	window.close();
}


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				document.getElementById("E01CUN").value = document.forms[0].elements[n].value;
				ok = true;
        		break;
			}
      	}
    }
}

function showInqOFAC(fieldValue) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
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

<h3 align="center">Clientes Tipo Usuario<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="client_users_list.jsp, ESD0087"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0087">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01CUN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01SHN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01IDN" VALUE="">
  <INPUT TYPE="HIDDEN" name="SEARCHCDE" value="">
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" value="C">
  
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

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
		<% if (userPO.getHeader20().equals("Y")) { %>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goSel()"><b>Seleccionar</b></a>
		</td>		
		<%} else { %>
		<TD align="CENTER" class="TDBKG" width="20%">	
			<a href="javascript:goCust()"><b>Vincular</b></a>
		</td>	
		<%} %>	
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
	if ( ESD0087List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Usuarios.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <table  class="tableinfo" width="100%">
  
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>Código</B></td>
		<td NOWRAP align="center" width="35%"><B>Nombre Legal</B></td>
		<TD nowrap align="center" width="20%"><B>Nombre Corto</B></TD>
		<TD nowrap align="center" width="15%"><B>Numero de<br>Identificaciòn</B></TD>
		<TD nowrap align="center" width="10%"><B>Tipo de<br>Identificaciòn</B></TD>
		<td NOWRAP align="center" width="5%"><B>Tipo<br>Usuario</B></td>
		
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="10%">
			<INPUT type="text" name="SEARCHCUN" size="11" maxlength="10" value="<%= userPO.getCusNum() %>">
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('C')" width="15" height="11"
			 title="Ordenar y posicionarse en...">
		</td>
		<td NOWRAP align="center" width="35%"></td>
		<td NOWRAP align="center" width="20%">
			<INPUT type="text" name="SEARCHSHN" size="25" maxlength="24" value="<%= userPO.getCusName() %>">
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('S')" width="15" height="11"
			 title="Ordenar y posicionarse en...">
		</td>	 
		<TD nowrap align="center" width="15%">
			<INPUT type="text" name="SEARCHIDN" size="21" maxlength="20" value="<%= userPO.getIdentifier() %>">
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('I')" width="15" height="11"
			 title="Ordenar y posicionarse en...">
		</td>	 
		<TD nowrap align="center" width="10%"></TD>
		<TD nowrap align="center" width="5%"></TD>
	</TR>
 
        <%
    	  int i = 0;
          ESD0087List.initRow();    
          while (ESD0087List.getNextRow()) {
            ESD008701Message msgList = (ESD008701Message) ESD0087List.getRecord(); 
		%>              
    <TR id=trclear>

		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="CODE" value="<%= msgList.getE01CUN() %>">
            <% if (msgList.getE01STS().equals("4")) { %>
             <a href="javascript:showInqOFAC('<%= msgList.getE01CUN() %>')">
             <img src="<%=request.getContextPath()%>/images/warning_16.jpg" title="Lista de Control Posible Coincidencia" align="middle" border="0" >
             </a>
			<% } %>
            
		</td>

		<td NOWRAP align="left" width="10%" ><%= msgList.getE01CUN() %></td>
		<td NOWRAP align="left" width="35%" ><%= msgList.getE01NA1() %></td>
		<td NOWRAP align="left" width="20%" ><%= msgList.getE01SHN() %></td>
		<td NOWRAP align="left" width="15%" ><%= msgList.getE01IDN() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01TID() %></td>
		<td NOWRAP align="center" width="5%" >
			<% if (msgList.getE01LGT().equals("2")) out.print("Físico") ;
			    else out.print("Moral");
			%>
		</td>
		
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
		int screen = 6;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1;
		} 
    	if ( ESD0087List.getShowPrev() ) {
  			int pos = ESD0087List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0087?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ESD0087List.getShowNext()) {
  			int pos = ESD0087List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0087?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD0087List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD0087List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
