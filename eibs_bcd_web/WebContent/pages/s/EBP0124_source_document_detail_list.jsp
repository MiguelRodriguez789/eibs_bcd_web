<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Source Documents</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0124List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;
 
function goSearch() {
	if (document.getElementById("SEARCHCDE").value == "") {
		alert("Favor digitar un numero de Línea para posicionarse en la lista!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="1";
	document.forms[0].submit();
}

function goNew() {
	document.getElementById("SCREEN").value="2"
	document.getElementById("DOCUMENTO").value=document.getElementById("E01BDCNUM").value;
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar una Línea!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="3";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione la Línea a borrar!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="4";
	if (!confirm("Desea borrar esta Línea?")) {
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
				ok = true;
				break;
			}
      	}
    }
}

function setKey(seq) {
	document.getElementById("E01BDDSEQ").value = seq;
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

<h3 align="center">Líneas para el Documento Nro. <%= userPO.getIdentifier().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="source_document_detail_list.jsp, EBP0124"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0124">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" VALUE="<%= userPO.getIdentifier().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDCNUM" VALUE="<%= userPO.getIdentifier().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDDNUM" VALUE="<%= userPO.getIdentifier().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDDSEQ" VALUE="<%= userPO.getIdentifier().trim() %>">


<TABLE class="tbenter"> 
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Nueva<br>Línea</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Modificar<br>Línea</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goDelete()"><b>Borrar<br>Línea</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0120?SCREEN=2" + 
  			"&E01REQTYP=" + userPO.getHeader1() + 
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQSTS=" + userPO.getHeader3() +
  			"&E01REQFRM=" + userPO.getHeader4() +
  			"&E01REQPD1=" + userPO.getHeader5() +
  			"&E01REQPD2=" + userPO.getHeader6() +
  			"&E01REQPD3=" + userPO.getHeader7() +
  			"&E01REQKIN=" + userPO.getHeader8() %>">
			<b>Salir</b></a>
	  	</TD>
	</TR>
<%	} else { %>
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Ver <br>Línea</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0120?SCREEN=10"><b>Salir</b></a>
      	</TD>
	</TR>
<% 	} %>
</TABLE> 
 
<%	if ( EBP0124List.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Líneas.</h4></div>
      </TD>
	</TR>
   	</TABLE>
<%
	}
	else 
	{
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>Secuencia</B></td>
		<td NOWRAP align="center" width="20%"><B>Tipo Documento</B></td>
		<td NOWRAP align="center" width="15%"><B>Referencia</B></td>
		<TD nowrap align="center" width="20%"><B>Descripción</B></TD>
		<TD nowrap align="center" width="10%"><B>Cantidad</B></TD>
		<TD nowrap align="center" width="10%"><B>Valor Unitario</B></TD>
		<TD nowrap align="center" width="10%"><B>Valor Línea</B></TD>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="10%">
			<INPUT type="text" name="SEARCHCDE" size="13" maxlength="12" value="<%= userPO.getProdCode() %>">
				<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11"
				 title="Ordenar y posicionarse en...">
		</td>
		<TD nowrap align="center" width="20%"></TD>
		<TD nowrap align="center" width="15%"></TD>
		<TD nowrap align="center" width="20%"></TD>
		<TD nowrap align="center" width="10%"></TD>
		<TD nowrap align="center" width="10%"></TD>
		<TD nowrap align="center" width="10%"></TD>
	</TR>

        <%
    	  int i = 0;
          EBP0124List.initRow();    
          while (EBP0124List.getNextRow()) {
            EBP012401Message msgList = (EBP012401Message) EBP0124List.getRecord();	
			
         %>              
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= EBP0124List.getCurrentRow()%>" onClick="setKey('<%=msgList.getE01BDDSEQ()%>')">
			
		</td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BDDSEQ() %></td>
		<td NOWRAP align="left" width="20%" ><%= msgList.getE01BDDKIND() %></td>
		<td NOWRAP align="left" width="15%" ><%= msgList.getE01BDDREF() %></td>
		<td NOWRAP align="left" width="20%" ><%= msgList.getE01BDDDS1() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BDDQTY() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BDDUAM() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BDDAMT() %></td>

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
    	if ( EBP0124List.getShowPrev() ) {
  			int pos = EBP0124List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0124?SCREEN=1&DOCUMENTO=" + userPO.getProdCode() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EBP0124List.getShowNext()) {
  			int pos = EBP0124List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0124?SCREEN=1&DOCUMENTO=" + userPO.getProdCode() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EBP0124List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EBP0124List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
