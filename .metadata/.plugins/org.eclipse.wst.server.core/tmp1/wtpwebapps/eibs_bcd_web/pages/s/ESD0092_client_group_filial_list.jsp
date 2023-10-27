<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Relaciones entre Clientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ESD0092List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<%
    	  int i = 0;
          ESD0092List.initRow();
          ESD0092List.getNextRow();
          ESD009201Message ESD0092Record = (ESD009201Message) ESD0092List.getRecord();
%> 

<SCRIPT Language="javascript">
var ok = false;

function goSearch() {
	if (getElement("SEARCHCUN").value == "") {
		alert("Favor seleccionar un Código para posicionarse en la lista!!!");
		return;	 
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			getElement("SCREEN").value="10";
	<% } else { %>
			getElement("SCREEN").value="16";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	var mstrIsAct = '<%=ESD0092Record.getE01GEMSTM()%>'; 	
	if ( mstrIsAct != 'A' ) {
		alert("Cabeza de Grupo Inactiva. No puede crear Filial!!!");
		return;	 
	}
	getElement("SCREEN").value="12";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	
	getElement("SCREEN").value="13";
	document.forms[0].submit();
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
	document.forms[0].submit();
} 

  function goInquiry() {
	isCheck(); 
    if ( ok ) {
    	var cun = getElement("E01GEMCUN").value;
		pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?SCREEN=8&OPE=00&E01CUN=" + cun;
	   	CenterWindow(pg,600,500,2);
    } else {
		alert("Favor seleccionar un código!!!");	   
     }
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

function setKey(cun) {
	getElement("E01GEMCUN").value = cun;
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

<h3 align="center">Relaciones de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="client_group_filial_list.jsp, ESD0092"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0092">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="16">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01GEMCUN" NAME="E01GEMCUN" VALUE="0">
  
  
  <table  class="tableinfo" width="100%"> 
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
      	<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
      	 <tr id="trdark"> 
   			<td nowrap width="15%" align="right">Secuencia :</td>
			<td nowrap width="35%">
				<INPUT type="text" name="E01GEMMST" size="10" readonly value="<%= ESD0092Record.getE01GEMMST().trim()%>">
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left"> 
			</td>
        </tr> 
        <tr id="trclear"> 
   			<td nowrap width="15%" align="right">Cliente  : </td>
			<td nowrap width="35%">
				<INPUT type="text" name="E01GEMCUM" size="10" readonly value="<%= ESD0092Record.getE01GEMCUM().trim()%>">
				<INPUT type="text" name="E01GEMNA1" size="46" readonly value="<%= ESD0092Record.getE01GEMNA1().trim()%>">
            </td>
            <td nowrap width="15%" align="right">Tipo Relación :</td>
            <td nowrap width="35%" align="left"> 
                <INPUT type="text" name="E01GEMGRP" size="5" readonly value="<%= ESD0092Record.getE01GEMGRP().trim()%>">
                <INPUT type="text" name="D01GRP" size="45" readonly value="<%= ESD0092Record.getD01GRP().trim()%>">
			</td>
        </tr> 
		<tr id="trdark">  
            <td nowrap width="15%" align="right">Identificación :</td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01GEMPID" size="5" readonly value="<%= ESD0092Record.getE01GEMPID().trim()%>">
                <INPUT type="text" name="E01GEMTID" size="5" readonly value="<%= ESD0092Record.getE01GEMTID().trim()%>">
                <INPUT type="text" name="E01GEMIDN" size="26" readonly value="<%= ESD0092Record.getE01GEMIDN().trim()%>">
			</td>
            <td nowrap width="15%" align="right">Estado de la relación :</td>
			<td nowrap width="35%" align="left">
				<% if (ESD0092Record.getE01GEMSTM().equals("A")) out.print("Activo");
				    else if (ESD0092Record.getE01GEMSTM().equals("I")) out.print("Inactivo");
				%>
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
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0092?SCREEN=1"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goInquiry()"><b>Consultar<br>Cliente</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="10%">
	  		<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0092?SCREEN=6"><b>Salir</b></a>
		</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( ESD0092List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%>
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Filiales.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    


    
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th NOWRAP align="center" width="5%"><B>Sel</B></th>
				<th NOWRAP align="center" width="15%"><B>Filial</B>
					<table border="0">
					<tr id="trdark">
					<td nowrap>
			   			<input type="text" name="SEARCHCUN" id="SEARCHCUN"  size="5" maxlength="10" value="<%=userPO.getCusNum()%>" onKeypress="enterInteger(event)" >
			   			<A href="javascript:goSearch()" >
						<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Ordenar y Posicionarse en..." align="bottom" border="0" style="cursor:hand" >
	        			</a>
	        			<A href="javascript:GetCustomerDescId('SEARCHCUN','','')">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
						</A>
		   			</td>
		   			</tr> 
					</table>
				</th>
				<th NOWRAP align="center" width="20%"><B>Identificacion</B></th>
				<th nowrap align="center" width="40%"><B>Nombre Filial</B></th>
				<th nowrap align="center" width="10%"><B>Fecha</B></th>
				<th nowrap align="center" width="10%"><B>Estado<br>de la Filial</B></th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
        <%
     	  boolean firstTime = true;
		  String chk = "";
          while (ESD0092List.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}          	
            ESD009201Message msgList = (ESD009201Message) ESD0092List.getRecord();
		%>              
		<tr id="dataTable<%= ESD0092List.getCurrentRow() %>">
			<td nowrap align="center" width="5%">
				<input type="radio" id="ROW" name="ROW" value="<%= ESD0092List.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgList.getE01GEMCUN()%>'); highlightRow('dataTable', <%= ESD0092List.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="15%" ><%= msgList.getE01GEMCUN() %></td>
			<td NOWRAP align="left" width="20%" ><%= msgList.getE01GEMTID() %> - <%= msgList.getE01GEMIDN() %></td>
			<td NOWRAP align="left" width="40%" ><%= msgList.getE01GEMNA2() %></td>
			<td NOWRAP align="center" width="10%" ><%= Util.formatCustomDate(currUser.getE01DTF(),
															msgList.getBigDecimalE01GEMRLM().intValue(),
															msgList.getBigDecimalE01GEMRLD().intValue(),
															msgList.getBigDecimalE01GEMRLY().intValue()) %></td>
			<td NOWRAP align="center" width="10%" >
				<% if (msgList.getE01GEMSTS().equals("A")) out.print("Activo");
				    else if (msgList.getE01GEMSTS().equals("I")) out.print("Inactivo");
				%>
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
			screen = 10;
		} 
    	if ( ESD0092List.getShowPrev() ) {
  			int pos = ESD0092List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0092?SCREEN="+screen + "&E01GEMGRP=" + ESD0092Record.getE01GEMGRP().trim()  + "&E01GEMMST=" + ESD0092Record.getE01GEMMST().trim() + "&FromRecord=" + pos  + "&SEARCHCDE=" + userPO.getCusNum() + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ESD0092List.getShowNext()) {
  			int pos = ESD0092List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0092?SCREEN="+screen + "&E01GEMGRP=" + ESD0092Record.getE01GEMGRP().trim() + "&E01GEMMST=" + ESD0092Record.getE01GEMMST().trim() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getCusNum() + "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%= i%>;
	getElement("NEXTROWS").value = <%= ESD0092List.getLastRec()%>;
	getElement("CURRROWS").value = <%= ESD0092List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
