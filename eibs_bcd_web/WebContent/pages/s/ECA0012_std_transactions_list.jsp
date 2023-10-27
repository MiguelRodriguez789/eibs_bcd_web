<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Homologación de Transacciones</title>
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
		alert("Favor seleccionar Transaccion IBS para posicionarse en la lista!!!");
		return;	 
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			getElement("SCREEN").value="1";
	<% } else { %>
			getElement("SCREEN").value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	getElement("SCREEN").value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código de Transaccion!!!");
		return;	 
	}
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}


function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el registro a borrar!!!");
		return;	 
	}
	getElement("SCREEN").value="4";
	if (!confirm("Desea borrar el registro seleccionado?")) {
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

function setKey(ibs, acd, apc) {
	getElement("E01ITSIBS").value = ibs;
	getElement("E01ITSACD").value = acd;
	getElement("E01ITSAPC").value = apc;
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

<h3 align="center">Homologación de Transacciones - Codigos de Operación<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="std_transactions_list.jsp, ECA0012"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0012">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01ITSIBS" NAME="E01ITSIBS" VALUE="">
  <INPUT TYPE=HIDDEN id="E01ITSACD" NAME="E01ITSACD" VALUE="">
  <INPUT TYPE=HIDDEN id="E01ITSAPC" NAME="E01ITSAPC" VALUE="">
   
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
				<th NOWRAP align="center" width="10%"><B>Transacción<BR>IBS</B>
					<table border="0" align="center">
					<tr id="trdark" align="center">
					<td nowrap align="center">
			   			<input type="text" name="SEARCHCDE" id="SEARCHCDE"  size="5" maxlength="4" value="<%=userPO.getSource()%>">
			   			<A href="javascript:goSearch()" >
						<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Ordenar y Posicionarse en..." align="bottom" border="0" style="cursor:hand" >
	        			</a>
		   			</td>
		   			</tr> 
					</table>
				</th>
				<th nowrap align="center" width="30%"><B>Descripción</B></th>
 				<th NOWRAP align="center" width="10%"><B>Código de<BR>Aplicación</B>
 					<table border="0" align="center">
					<tr id="trdark" align="center">
					<td nowrap align="center">
			   			<input type="text" name="SEARCHCOD" id="SEARCHCOD"  size="3" maxlength="2" value="<%=userPO.getIdentifier()%>">
			   			<A href="javascript:goSearch()" >
						<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Ordenar y Posicionarse en..." align="bottom" border="0" style="cursor:hand" >
	        			</a>
		   			</td>
		   			</tr> 
					</table>
 				</th>
 				<th nowrap align="center" width="25%"><B>Evento</B></th>
 				<th nowrap align="center" width="10%"><B>Código<br>Operación<br>DB</B></th>
 				<th nowrap align="center" width="10%"><B>Código<br>Operación<br>CR</B></th>
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
            ECA001201Message msgRcd = (ECA001201Message) msgList.getRecord();
		%>              
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"> 
				<input type="radio" id="ROW" name="ROW" value="<%= msgList.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgRcd.getE01ITSIBS()%>','<%=msgRcd.getE01ITSACD()%>','<%=msgRcd.getE01ITSAPC()%>'); highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="10%" ><%= msgRcd.getE01ITSIBS() %></td>
			<td NOWRAP align="left" width="30%" ><%= msgRcd.getE01ITSDSC() %></td>
			<td NOWRAP align="center" width="10%" ><%= msgRcd.getE01ITSACD() %></td>
			<td NOWRAP align="left" width="25%" >
				<% 	if (msgRcd.getE01ITSAPC().equals("")) { out.println("Todos"); 
			   		} else if (msgRcd.getE01ITSAPC().equals("P")) { out.println("Principal"); 
			   		} else if (msgRcd.getE01ITSAPC().equals("I")) { out.println("Intereses");
			   		} else if (msgRcd.getE01ITSAPC().equals("L")) {	out.println("Mora");  	
					} else if (msgRcd.getE01ITSAPC().equals("1")) { out.println("Impuestos");
               		} else if (msgRcd.getE01ITSAPC().equals("2")) { out.println("Comisiones"); 
               		} else if (msgRcd.getE01ITSAPC().equals("3")) { out.println("Deducciones");
               		} else if (msgRcd.getE01ITSAPC().equals("4")) { out.println("IVA"); 
               		} else if (msgRcd.getE01ITSAPC().equals("5")) { out.println("Cobranzas");
               		} else if (msgRcd.getE01ITSAPC().equals("9")) { out.println("GMF"); 
               		} else if (msgRcd.getE01ITSAPC().equals("*")) { out.println("Refinanceado");
               		} else if (msgRcd.getE01ITSAPC().equals("A")) { out.println("Pago Revaluación UF"); 
               		} else if (msgRcd.getE01ITSAPC().equals("C")) { out.println("Reversión Revaluación UF");
               		} else if (msgRcd.getE01ITSAPC().equals("R")) { out.println("INC/DEC Revaluación"); 
               		} else if (msgRcd.getE01ITSAPC().equals("X")) { out.println("Abono a Principal");
               		} else if (msgRcd.getE01ITSAPC().equals("Y")) { out.println("Abono a Revaluación UF"); 
               		} else if (msgRcd.getE01ITSAPC().equals("Q")) { out.println("Reverso Abono Revaluación UF");
               		} else if (msgRcd.getE01ITSAPC().equals("Z")) { out.println("Interes Prepagado"); 
               		} else if (msgRcd.getE01ITSAPC().equals("B")) { out.println("Pago Reajuste Mora");
               		} else if (msgRcd.getE01ITSAPC().equals("D")) { out.println("Reverso Pago Reajuste Mora"); 
               	    } else if (msgRcd.getE01ITSAPC().equals("S")) { out.println("INC/DEC Reajuste Mora");
           		} %>
           	</td>	
           	<td NOWRAP align="center" width="10%" ><%= msgRcd.getE01ITSEXD() %></td>
           	<td NOWRAP align="center" width="10%" ><%= msgRcd.getE01ITSEXC() %></td>
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
		int screen = 6;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1;
		} 
		String parm = "?SCREEN=" + screen + "&SEARCHCDE=" + userPO.getSource() + "&SEARCHCOD=" + userPO.getIdentifier();
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0012" + parm + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0012" + parm + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
