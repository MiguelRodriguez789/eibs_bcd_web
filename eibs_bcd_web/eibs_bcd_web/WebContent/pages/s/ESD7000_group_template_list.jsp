<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Perfiles/Usuarios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ESD7000List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="javascript">

var ok = false;

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar un Código para posicionarse en la lista!!!");
		return;	 
	}
	getElement("E01BTHKEY").value = getElement("SEARCHCDE").value;
	<% 	if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			document.forms[0].SCREEN.value="1";
	<%	} else if (userPO.getPurpose().equals("APPROVAL")){%>
	  		document.forms[0].SCREEN.value="6";	
	<%  } else {%> 
			document.forms[0].SCREEN.value="8";
	<%  }%>
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor Seleccione un Registro para Borrar");
		return;	 
	}
	document.forms[0].SCREEN.value="24";
	if (!confirm("Desea borrar el mantenimiento seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goInquiry() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione un Usuario!");
		return;	 
	}
    bthkey = getElement("E01BTHKEY").value;
    var pg = "";
    <% 	int scr = 7;
       	if (userPO.getPurpose().equals("INQUIRY")) scr = 9;
    %>   	
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD7000?SCREEN=<%=scr%>" + 
	        "&E01BTHKEY=" + bthkey;
	CenterWindow(pg,900,600,2);
}

function goApproval() {
	isCheck();
	if ( !ok ) {
		alert("Por Favor Seleccione un mantenimiento para Aprobar!!!");
		return;	 
	}
	getElement("E01ACT").value="A";
	document.forms[0].SCREEN.value="20";
	if (!confirm("Confirma Aprobar el Mantenimiento Seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goReject() {
	isCheck();
	if ( !ok ) {
		alert("Por favor seleccione un mantenimiento a Rechazar!!!");
		return;	 
	}
	getElement("E01ACT").value="R";
	document.forms[0].SCREEN.value="21";
	if (!confirm("Confirma Rechazar el mantenimiento Seleccionado?")) {
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
			    getElement("E01BTHKEY").value = document.forms[0].elements[n].value;
				ok = true;
				break;
			}
      	}
    }
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
		 	out.println("Aprobar Perfiles de Usuarios");
	   	} else {
	   		out.println("Perfiles de Usuarios ");
	   	}
	%>  
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="group_template_list.jsp, ESD7000">
</h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD7000">

  <INPUT TYPE=HIDDEN name="SCREEN" value="6"> 
  <INPUT TYPE=HIDDEN name="actRow" value="0">
  <INPUT TYPE=HIDDEN name="TOTROWS" value="0">
  <INPUT TYPE=HIDDEN name="NEXTROWS" value="0">
  <INPUT TYPE=HIDDEN name="CURRROWS" value="0">
  <INPUT TYPE=HIDDEN name="E01BTHKEY" value=" "> 
  <INPUT TYPE=HIDDEN name="bthkey" value=" "> 
  <INPUT TYPE=HIDDEN name="E01ACT"    value="N"> 
  
<table  class="tbenter" width="100%">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 


<%	if (ESD7000List.getNoResult() ) { %>
<TABLE class="tbenter" width="100%">
		<%if  (userPO.getPurpose().equals("APPROVAL")) { %>
	<TR>
		<TD align="center" class="TDBKG" width="100%" nowrap><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></TD>
		<%} %>	
	</TR>	
</table>
<TABLE class="tbenter" width="100%">
	<tr valign="middle">
		<TD align="center" height="100" nowrap valign="middle" width="100%"> 
			<H4 style="text-align:center">No hay resultados para su criterio de búsqueda.</H4>
		</TD>
	</tr>
</TABLE>
<%
	} else  if  (userPO.getPurpose().equals("APPROVAL")) {
%>
<TABLE class="tbenter" width="100%"> 
  <TR>
    <TD align="CENTER" class="TDBKG" width="20%">
	  	<a href="javascript:goInquiry()"><b>Consultar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="20%">
	  	<a href="javascript:goApproval()"><b>Aprobar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="20%">
	  	<a href="javascript:goReject()"><b>Rechazar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="20%">
		<a href="javascript:goDelete()"><b>Borrar<br>Mantenimiento</b></a></TD>  
	<TD align="CENTER" class="TDBKG" width="20%">
	  <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></TD>
  </TR>
</TABLE> 
<%
	} else  if  (userPO.getPurpose().equals("INQUIRY")) {
%>
<TABLE class="tbenter" width="100%"> 
  <TR>
    <TD align="CENTER" class="TDBKG" width="50%">
	  	<a href="javascript:goInquiry()"><b>Consultar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="50%">
	  <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></TD>
  </TR>
</TABLE> 
<% } %>
<%	if (!ESD7000List.getNoResult() ) { %>    
  <TABLE class="tableinfo" id="dataTable" width="100%">
    <TR id=trdark> 
		<TD nowrap align="center" width="5%"><B>Sel</B></TD>
		<TD nowrap align="center" width="5%"><B>Grupo</B></TD>
		<TD nowrap align="center" width="30%"><B>Nombre</B></TD>
		<TD nowrap align="center" width="5%"><B>Banco</B></TD>
		<TD nowrap align="center" width="5%"><B>Sucursal</B></TD>
		<TD nowrap align="center" width="10%"><B>Nivel<BR>Autorización</B></TD>
		<TD nowrap align="center" width="5%"><B>Nivel<BR>Consulta </B></TD>
		<TD nowrap align="center" width="10%"><B>Estado Usuario</B></TD>
		<TD nowrap align="center" width="10%"><B>Operación</B></TD>
	</TR>
 	<TR id=trdark> 
		<TD nowrap align="center" width="5%"><B></B></TD>
		<TD nowrap align="center" width="5%"><B></B>
			<INPUT type="text" name="SEARCHCDE" size="11" maxlength="10" value="<%= userPO.getHeader1() %>">
			<A href="javascript:goSearch()" >
				<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Ordenar y Posicionarse en..." align="bottom" border="0" style="cursor:hand" >
	        </a>
	         <a href="javascript:GetUserRegistry('SEARCHCDE','',document.forms[0].SEARCHCDE.value)">
        		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"> 
        	</a>  
		</TD>		
		<TD nowrap align="center" width="30%"><B></B></TD>
		<TD nowrap align="center" width="5%"><B></B></TD>
		<TD nowrap align="center" width="5%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
		<TD nowrap align="center" width="5%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
		<TD nowrap align="center" width="10%"><B></B></TD>
		
	</TR>
        <%
    	  int i = 0;
          ESD7000List.initRow();    
          while (ESD7000List.getNextRow()) {
            ESD700001Message msgList = (ESD700001Message) ESD7000List.getRecord();	 
         %>   
                    
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= msgList.getE01BTHKEY()%>">
			
		</td>
		
		<td NOWRAP align="left"   width="5%"  ><%= msgList.getE01BTHKEY()%></td>
		<td NOWRAP align="left"   width="30%" ><%= msgList.getE01BTHNME()%></td>
		<td NOWRAP align="center" width="5%"  ><%= msgList.getE01BTHUBK()%></td>
		<td NOWRAP align="center" width="5%"  ><%= msgList.getE01BTHUBR()%></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BTHAUT()%></td>
		<td NOWRAP align="center" width="5%"  ><%= msgList.getE01BTHINL()%></td>
		<td NOWRAP align="center" width="10%" >
			<% if (msgList.getE01BTHSTS().equals("1")) out.print("ACTIVO"); 
			    else if (msgList.getE01BTHSTS().equals("2")) out.print("INACTIVO"); 
			    else if (msgList.getE01BTHSTS().equals("3")) out.print("SUSPENDIDO");
			    else if (msgList.getE01BTHSTS().equals("4")) out.print("PENDIENTE");
			    else out.print("INACTIVO");
			%>
		</td>
		<td NOWRAP align="center" width="10%" > 
			<% if (msgList.getE01BTHOPE().equals("U")) out.print("ACTUALIZAR"); 
			    else if (msgList.getE01BTHOPE().equals("N")) out.print("CREAR"); 
			    else if (msgList.getE01BTHOPE().equals("D")) out.print("BORRAR");
			    else if (msgList.getE01BTHOPE().equals("R")) out.print("RECHAZADO");
			    else out.print(" ");
			%>
		</td> 
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
       	if (userPO.getPurpose().equals("INQUIRY")) screen = 8;
    	if ( ESD7000List.getShowPrev() ) {
  			int pos = ESD7000List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESD7000?SCREEN="+screen+"&FromRecord=" + pos 
  			+ "&SEARCHCDE=" + userPO.getHeader1() + 
  			"\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ESD7000List.getShowNext()) {
  			int pos = ESD7000List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESD7000?SCREEN="+screen+"&FromRecord=" + pos 
  			+ "&SEARCHCDE=" + userPO.getHeader1() + 
  			"\" > <img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
      </TD>
     </TR>
 </TABLE>
  
<BR>

<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD7000List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD7000List.getFirstRec()%>;
</SCRIPT>
<%} %>   
		</TD>
	</TR>
</TABLE>
</form>
</body>
</html>
