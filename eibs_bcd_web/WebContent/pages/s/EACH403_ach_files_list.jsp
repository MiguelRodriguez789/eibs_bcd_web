<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>ACH Pending Files</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EACH403List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<%
 String sc = "1";
%>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;
 
function goSearch() {
	if (document.getElementById("SEARCHCDE").value == "") {
		alert("Favor digitar un originador para posicionarse en la lista!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="<%=sc%>";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Originador!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="5";
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

function setKey(cde,typ,rdy,rdm,rdd) {
	document.getElementById("E01ACPCDE").value = cde;
	document.getElementById("E01ACPTYP").value = typ;
	document.getElementById("E01ACPRDY").value = rdy;
	document.getElementById("E01ACPRDM").value = rdm;
	document.getElementById("E01ACPRDD").value = rdd;
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
	Generación de archivos de Pago o Rechazos para Originadores
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ach_files_list.jsp, EACH403">
</h3>


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH403">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE="HIDDEN" name="E01ACPCDE" value="">
  <INPUT TYPE="HIDDEN" name="E01ACPTYP" value="">
  <INPUT TYPE="HIDDEN" name="E01ACPRDY" value="0">
  <INPUT TYPE="HIDDEN" name="E01ACPRDM" value="0">
  <INPUT TYPE="HIDDEN" name="E01ACPRDD" value="0">

<TABLE class="tbenter"> 
<% 
 if (userPO.getPurpose().equals("MAINTENANCE") && !EACH403List.getNoResult() ){
%>
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Generar<br>Archivo Texto</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
      	</TD>
	</TR>
<%      
  	} else {
%> 
	<TR>
	  	<TD align="CENTER" class="TDBKG" width="100%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
      	</TD>
	</TR>
<% } %>
</TABLE> 

<%	if ( EACH403List.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Archivos Pendientes.</h4></div>
      </TD>
	</TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>Originador</B></td>
		<td NOWRAP align="center" width="35%"><B>Nombre</B></td>
		<td NOWRAP align="center" width="10%"><B>Tipo</B></td>
		<TD nowrap align="center" width="10%"><B>Fecha<br>Proceso</B></TD>
		<TD nowrap align="center" width="15%"><B>Usuario</B></TD>
		<TD nowrap align="center" width="15%"><B>Procesado en</B></TD>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="10%">
			<INPUT type="text" name="SEARCHCDE" size="11" maxlength="10" value="<%= userPO.getProdCode() %>">
				<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11"
				 title="Ordenar y posicionarse en...">
		</td>
		<td NOWRAP align="center" width="35%"></td>
		<td NOWRAP align="center" width="10%"></td>
		<TD nowrap align="center" width="10%"></TD>
		<TD nowrap align="center" width="15%"></TD>
		<TD nowrap align="center" width="15%"></TD>
	</TR>
 
        <%
    	  int i = 0;
          EACH403List.initRow();    
          while (EACH403List.getNextRow()) {
            EACH40301Message msgList = (EACH40301Message) EACH403List.getRecord();
         %>              
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= EACH403List.getCurrentRow()%>" 
           		onClick="setKey('<%=msgList.getE01ACPCDE()%>','<%= msgList.getE01ACPTYP()%>','<%= msgList.getE01ACPRDY()%>','<%= msgList.getE01ACPRDM()%>','<%= msgList.getE01ACPRDD()%>')">
		</td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01ACPCDE() %></td>
		<td NOWRAP align="left" width="35%" ><%= msgList.getE01ACPNME() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01ACPTYP() %></td>
		<td NOWRAP align="center" width="10%" ><%= Util.formatCustomDate(currUser.getE01DTF(),
															msgList.getBigDecimalE01ACPRDM().intValue(),
															msgList.getBigDecimalE01ACPRDD().intValue(),
															msgList.getBigDecimalE01ACPRDY().intValue()) 
																		%></td>
		<td NOWRAP align="center" width="15%" ><%= msgList.getE01ACPRUS() %></td>
		<td NOWRAP align="left" width="15%" ><%= msgList.getE01ACPRTS() %></td>
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
    	if ( EACH403List.getShowPrev() ) {
  			int pos = EACH403List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ach.JSEACH403?SCREEN=" + sc + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EACH403List.getShowNext()) {
  			int pos = EACH403List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ach.JSEACH403?SCREEN=" + sc + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EACH403List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EACH403List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
