<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Interfaces y Canales</title>
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

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor seleccionar Proveedor para posicionarse en la lista!!!");
		return;	 
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			getElement("SCREEN").value="21";
	<% } else { %>
			getElement("SCREEN").value="26";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	getElement("SCREEN").value="22";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	getElement("SCREEN").value="23";
	document.forms[0].submit();
}


function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el registro a borrar!!!");
		return;	 
	}
	getElement("SCREEN").value="24";
	if (!confirm("Desea borrar el registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goSalir() {
	getElement("SCREEN").value="1";
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

function setKey(bnk, noe, vdd, aty, tbl) {
	getElement("E03EXCBNK").value = bnk;
	getElement("E03EXCNOE").value = noe;
	getElement("E03EXCVND").value = vdd;
	getElement("E03EXCATY").value = aty;
	getElement("E03EXCTBL").value = tbl;
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

<h3 align="center">Cantidad de Transacciones <br> Exentas <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="vendor_transactions_exc_list.jsp, ECA0010"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0010">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="26">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E03EXCVND" NAME="E03EXCVND" VALUE="">
  <INPUT TYPE=HIDDEN id="E03EXCNOE" NAME="E03EXCNOE" VALUE="">
  <INPUT TYPE=HIDDEN id="E03EXCBNK" NAME="E03EXCBNK" VALUE="">
  <INPUT TYPE=HIDDEN id="E03EXCATY" NAME="E03EXCATY" VALUE="">
  <INPUT TYPE=HIDDEN id="E03EXCTBL" NAME="E03EXCTBL" VALUE="">
   
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){ %>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goSalir()"><b>Salir</b></a>
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
			<a href="javascript:goSalir()"><b>Salir</b></a>
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
				<th NOWRAP align="center" width="3%"><B>Sel</B></th>
				<th NOWRAP align="center" width="5%"><B>Banco</B>
				<th NOWRAP align="center" width="10%"><B>Proveedor</B>
				</th>
				<th nowrap align="center" width="15%"><B>Descripción</B></th>
 				<th NOWRAP align="center" width="10%"><B>Transacción</B>
 				</th>
 				<th nowrap align="center" width="15%"><B>Descripcion</B></th>
 				<th NOWRAP align="center" width="10%"><B>Tipo de Producto</B>
 					<table border="0" align="center">
					<tr id="trdark" align="center">
					<td nowrap align="center">
			   			<input type="text" name="SEARCHCDE" id="SEARCHCDE"  size="5" maxlength="4" value="<%=userPO.getSource()%>">
			   			<A href="javascript:goSearch()" ><%=search%></a>
		   			</td>
		   			</tr> 
					</table>
 				</th>
 				<th NOWRAP align="center" width="10%"><B>Tabla Cargos</B>
 					<table border="0" align="center">
					<tr id="trdark" align="center">
					<td nowrap align="center">
			   			<input type="text" name="SEARCHCOD" id="SEARCHCOD"  size="5" maxlength="4" value="<%=userPO.getIdentifier()%>">
			   			<A href="javascript:goSearch()" ><%=search%></a>
		   			</td>
		   			</tr> 
					</table>
 				</th>
 				<th NOWRAP align="center" width="15%"><B>Descripcion</B></th>
 				<th NOWRAP align="center" width="7%"><B>Transacciones<br>Excentas</B></th>
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
            ECA001003Message msgRcd = (ECA001003Message) msgList.getRecord();
		%>              
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="3%"> 
				<input type="radio" id="ROW" name="ROW" value="<%= msgList.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgRcd.getE03EXCBNK()%>','<%=msgRcd.getE03EXCNOE()%>','<%=msgRcd.getE03EXCVND()%>','<%=msgRcd.getE03EXCATY()%>','<%=msgRcd.getE03EXCTBL()%>'); highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="5%" ><%= msgRcd.getE03EXCBNK() %></td>
			<td NOWRAP align="left" width="10%" ><%= msgRcd.getE03EXCVND() %></td>
			<td NOWRAP align="left" width="15%" ><%= msgRcd.getD03EXCVND() %></td>
			<td NOWRAP align="left" width="10%" ><%= msgRcd.getE03EXCNOE() %></td>
			<td NOWRAP align="left" width="15%" ><%= msgRcd.getD03EXCNOE() %></td>
			<td NOWRAP align="left" width="10%" ><%= msgRcd.getE03EXCATY() %></td>
			<td NOWRAP align="left" width="10%" ><%= msgRcd.getE03EXCTBL() %></td>
			<td NOWRAP align="left" width="15%" ><%= msgRcd.getD03EXCTBL() %></td>
			<td NOWRAP align="right" width="7%" ><%= msgRcd.getE03EXCQTY() %></td>
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
		int screen = 26;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 21;
		} 
		String parm = "?SCREEN=" + screen + "&SEARCHCDE=" + userPO.getSource() + "&SEARCHCOD=" + userPO.getIdentifier();
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0010" + parm + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0010" + parm + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
