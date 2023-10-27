<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Mantenimiento de Entidades</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ESD1080List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

<%
String ope = (userPO.getProdCode() == null ? "22" : userPO.getProdCode());
%> 

sessionStorage.removeItem('tab-index');
var ok = false; 

function goSearch(type) {
	if (type == 'C') {
		if (getElement("SEARCHCUN").value == "") {
			alert("Favor digitar un Código para posicionarse en la lista!!!");
			return;
		}
		getElement("SEARCHCDE").value = getElement("SEARCHCUN").value;
	}

	if (type == 'S') {
		if (getElement("SEARCHSHN").value == "") {
			alert("Favor digitar un nombre para posicionarse en la lista!!!");
			return;
		}
		getElement("SEARCHCDE").value = getElement("SEARCHSHN").value;
	}
	if (type == 'I') {
		if (getElement("SEARCHIDN").value == "") {
			alert("Favor digitar una identificacion para posicionarse en la lista!!!");
			return;
		}
		getElement("SEARCHCDE").value = getElement("SEARCHIDN").value;
	}
	
	getElement("SEARCHTYPE").value = type;
	document.forms[0].SCREEN.value="26";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Mantenimiento!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="23";
	document.forms[0].submit();
}


function goSel() {
	if ( getElement("NEWMNT").value == "0" || getElement("NEWMNT").value == "" ) {
		alert("Favor seleccionar una Entidad!!!");
		return;	 
	}
	getElement("E01CUN").value = getElement("NEWMNT").value;
	document.forms[0].SCREEN.value="23";
	document.forms[0].submit();
}


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				getElement("E01CUN").value = document.forms[0].elements[n].value;
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

<h3 align="center">Mantenimiento de Entidades<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="entity_list.jsp, ESD1080"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="26">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01CUN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01SHN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01IDN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="OPE" VALUE="<%=userPO.getProdCode()%>">
  <INPUT TYPE="HIDDEN" name="SEARCHCDE" value="">
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" value="C">
  
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goProcess()"><b>Modificar<br>Mantenimiento</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goSel()"><b>Nuevo<br>Mantenimiento</b></a>
			<br>
			<input type="text" name="NEWMNT" id="NEWMNT" size="12" maxlength="9" value="">
	 		<A href="javascript:GetCustomerDescId('NEWMNT','','')">
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
			</A> 
		</td>		 
	  	<TD align="CENTER" class="TDBKG" width="34%">
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
			<a href="javascript:goProcess()"><b>Consultar<br>Mantenimiento</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( ESD1080List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Mantenimientos Pendientes</h4> 
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
		<td NOWRAP align="center" width="30%"><B>Nombre Legal</B></td>
		<TD nowrap align="center" width="20%"><B>Nombre Corto</B></TD>
		<TD nowrap align="center" width="15%"><B>Numero de<br>Identificación</B></TD>
		<TD nowrap align="center" width="10%"><B>Tipo de<br>Identificación</B></TD>
		<td NOWRAP align="center" width="5%"><B>Tipo<br>Legal</B></td>
		<td NOWRAP align="center" width="5%"><B>Tipo<br>Mnto.</B></td>
		
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="10%">
			<INPUT type="text" name="SEARCHCUN" size="11" maxlength="10" value="<%= userPO.getCusNum() %>">
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('C')" width="15" height="11"
			 title="Ordenar y posicionarse en...">
		</td>
		<td NOWRAP align="center" width="30%"></td>
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
		<TD nowrap align="center" width="5%"></TD>
	</TR>
 
        <%
    	  int i = 0;
          ESD1080List.initRow();    
          while (ESD1080List.getNextRow()) {
            ESD108001Message msgList = (ESD108001Message) ESD1080List.getRecord(); 
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
		<td NOWRAP align="left" width="30%" ><%= msgList.getE01NA1() %></td>
		<td NOWRAP align="left" width="20%" ><%= msgList.getE01SHN() %></td>
		<td NOWRAP align="left" width="15%" ><%= msgList.getE01IDN() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01TID() %></td>
		<td NOWRAP align="center" width="5%" >
			<% if (msgList.getE01LGT().equals("2")) out.print("Natural") ;
			    else out.print("Juridico");
			%>
		</td>
		<td NOWRAP align="center" width="5%" style="color:green;font-size:10;">
			<% if (msgList.getE01CRT().equals("Y")) out.print("CREAR") ;
			    else out.print("ACTUALIZAR");
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
        
		int screen = 26;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 21;
		} 
    	if ( ESD1080List.getShowPrev() ) {
  			int pos = ESD1080List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1080?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "&OPE=" + ope + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ESD1080List.getShowNext()) {
  			int pos = ESD1080List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1080?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "&OPE=" + ope + "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD1080List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD1080List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
