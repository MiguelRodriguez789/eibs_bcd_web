<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Embargos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT >
var ok = false;

function goNew() {
	getElement("SCREEN").value="12";
	submitForm();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	getElement("SCREEN").value="13";
	submitForm();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el registro a borrar!!!");
		return;	 
	}
	getElement("SCREEN").value="14";
	if (!confirm("Desea borrar el registro seleccionado?")) {
		return;
	}
	submitForm();
} 

function goApproval() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el registro a Aprobar!!!");
		return;	 
	}
	getElement("SCREEN").value="25";
	if (!confirm("Desea Aprobar la operación seleccionada?")) {
		return;
	}
	submitForm();
} 

function goInqAcc(op,acc) {
	var pg = "";
  	switch (op) {
		case 1 :  // Account Inquiry
		  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=10&ACCNUM=" + acc + "&opt=" + op;
			break;
		case 2 :  // Customer Accounts
		  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=1&opt=1";
			break;
	}
	CenterWindow(pg,600,500,2);
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

function setKey(cun, num,acc) {
	getElement("E02EMDCUN").value = cun;
	getElement("E02EMDNUM").value = num;
	getElement("E02EMDACC").value = acc;
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
 
 String search = "<img src=\"" + request.getContextPath() + "/images/ico5.gif\" alt=\"Ordenar y Posicionarse en...\" align=\"bottom\" border=\"0\" >";
 String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >";
 
%>

<h3 align="center">
	<% if (userPO.getPurpose().equals("APPROVAL")) { %>
		Aprobación de Operaciones de Embargo
	<% } else { %>
	  Cuentas Pasivas para Cliente <%=userPO.getSource()%><br>
	  Embargo Número <%=userPO.getIdentifier()%> - (Limite de Inembargabilidad: <%=userPO.getHeader20()%>)
	<% } %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="embargos_accounts_list.jsp, EMB0010"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEMB0010">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="16">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E02EMDCUN" NAME="E02EMDCUN" VALUE="<%=userPO.getSource()%>">
  <INPUT TYPE=HIDDEN id="E02EMDNUM" NAME="E02EMDNUM" VALUE="<%=userPO.getIdentifier()%>">
  <INPUT TYPE=HIDDEN id="E02EMDACC" NAME="E02EMDACC" VALUE="">
   
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){ %>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Transacciones</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEMB0010?SCREEN=1"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else if (userPO.getPurpose().equals("APPROVAL")) { 
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goApproval()"><b>Aprobar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Consultar</b></a>
      	</TD>
	</TR>
</TABLE>

<% } else { %>
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Consultar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEMB0010?SCREEN=6"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( msgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      		<TD align="center"><h4 style="text-align:center"> No hay Registros.</h4></TD>
      	</TR>
   	</TABLE>
<%
	} 	else {
%>    
    
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th NOWRAP align="center" width="5%"><B>Sel</B></th>
				<th NOWRAP align="center" width="10%"><B>Cuenta</B></th>
 				<th NOWRAP align="center" width="20%"><B>Producto</B></th>
 				<th NOWRAP align="center" width="10%"><B>Fecha<br>Apertura</B></th>
 				<th NOWRAP align="center" width="15%"><B>Tipo<br>Titularidad</B></th>
 				<th NOWRAP align="center" width="10%"><B>%<br>Titularidad</B></th>
 				<th NOWRAP align="center" width="10%"><B>Saldo<br></B></th>
 				<th NOWRAP align="center" width="10%"><B>Retenido<BR>Por Embargo</B></th>
 				<th NOWRAP align="center" width="10%"><B>Comentario</B></th>
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
          msgList.initRow();
     	  boolean firstTime = true;
		  String chk = "";
          while (msgList.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}          	
            EMB001002Message msgRcd = (EMB001002Message) msgList.getRecord();
		%>              
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"> 
				<input type="radio" id="ROW" name="ROW" value="<%= msgList.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgRcd.getE02EMDCUN()%>','<%=msgRcd.getE02EMDNUM()%>','<%=msgRcd.getE02EMDACC()%>'); highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="10%" >
				<a href="javascript:goInqAcc(1,'<%= msgRcd.getE02EMDACC() %>')" ><%= msgRcd.getE02EMDACC() %></a>
			</td>
			<td NOWRAP align="left" width="20%" ><%= msgRcd.getD02PRO() %></td>
			<td NOWRAP align="center" width="10%" ><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE02EMDOPM()),Integer.parseInt(msgRcd.getE02EMDOPD()),Integer.parseInt(msgRcd.getE02EMDOPY()))%></td>
			<td NOWRAP align="center" width="15%" >
				<% if (msgRcd.getE02EMDTIT().equals("R")) out.print("1er TITULAR ");
			    else if (msgRcd.getE02EMDOPE().equals("S")) out.print("2do TITULAR");
			    else out.print("Otro"); 
				%>
			</td>
			<td NOWRAP align="center" width="10%" ><%= msgRcd.getE02EMDPTI() %></td>
			<td NOWRAP align="center" width="10%" ><%= msgRcd.getE02EMDAM3() %></td>
			<td NOWRAP align="center" width="10%" ><%= msgRcd.getE02EMDAM1() %></td>
			<td NOWRAP align="left" width="10%" >
				<% if (msgRcd.getE02EMDOPE().equals(" ")) out.print(" ");
			    else if (msgRcd.getE02EMDOPE().equals("R")) out.print("<FONT color=\"red\">RETENCION POR APROBAR</FONT>");
			    else if (msgRcd.getE02EMDOPE().equals("L")) out.print("<FONT color=\"green\">LIBERACION POR APROBAR</FONT>"); 
				else if (msgRcd.getE02EMDOPE().equals("T")) out.print("<FONT color=\"green\">TRASLADO POR APROBAR</FONT>"); 
				else if (msgRcd.getE02EMDOPE().equals("A")) out.print("Transacciones Activas"); 
			%>
			</td>
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
		int screen = 16;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 11;
		} else if (userPO.getPurpose().equals("APPROVAL")) {
			screen = 21;
		}
		String parm = "?SCREEN=" + screen + "&E01EMBCUN=" + userPO.getSource() + "&E01EMBNUM=" + userPO.getIdentifier();;
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEMB0010" + parm + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEMB0010" + parm + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
 
  
<SCRIPT type="text/javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%=i%>;
	getElement("NEXTROWS").value = <%=msgList.getLastRec()%>;
	getElement("CURRROWS").value = <%=msgList.getFirstRec()%>;
</SCRIPT>
<% } %>

</form>
</body>
</html>
