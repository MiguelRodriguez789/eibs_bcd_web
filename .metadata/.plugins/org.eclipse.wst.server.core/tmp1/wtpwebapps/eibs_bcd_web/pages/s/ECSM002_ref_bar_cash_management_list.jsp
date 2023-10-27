<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="msgHdr5" class= "datapro.eibs.beans.ECSM00205Message"  scope="session"  />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

var ok = false;

function goAction() {
	document.forms[0].SCREEN.value="11";
	document.forms[0].submit();
}


function goNew() {
	document.forms[0].SCREEN.value="17";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="18";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Registro a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="19";
	if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar un Código para posicionarse en la lista!!!");
		return;
	}
	getElement("SCREEN").value="16";
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


function setKey(bnk,num,cnl,tip,seq) {

	getElement("E05CREBNK").value = bnk;
	getElement("E05CRENUM").value = num;
	getElement("E05CRECNL").value = cnl;
	getElement("E05CRETIP").value = tip;
	getElement("E05CRESEQ").value = seq;

}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click', closeHiddenDivNew);

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

<h3 align="center">Convenios - Referencias - Codigo de Barras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="ref_bar_cash_management_list.jsp, ECSM002"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM002">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E05CREBNK" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E05CRENUM" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E05CRECNL" VALUE=" ">
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="<%= userPO.getType() %>">

	<div id="hiddenDivNew" class="hiddenDiv">
	 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
		border-color: #0b23b5;
		border-style : solid solid solid solid;
		filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
		<tr id="trdark"> 
	      <td align=CENTER width="40%"> 
	        <div align="right">Convenio :</div>
	      </td>
	      <td align=CENTER width="60%"> 
	        <div align="left"> 
				<INPUT type="text" name="E05CRENUM" size="13" maxlength="12" value="<%=userPO.getAccNum()%>" readonly> 
	        </div>
	      </td>
	    </tr>
		<tr id="trclear"> 
	      <td align=CENTER width="40%"> 
	        <div align="right">Canal :</div>
	      </td>
	      <td align=CENTER width="60%"> 
	        <div align="left"> 
				<INPUT type="text" name="E05CRECNL" size="3" maxlength="2" value="<%=userPO.getHeader3()%>" readonly> 
	        </div>
	      </td>
	    </tr>
		<tr id="trdark"> 
	      <td align=CENTER width="40%"> 
	        <div align="right">Tipo :</div>
	      </td>
	      <td align=CENTER width="60%"> 
	        <div align="left"> 
				<select name="E05CRETIP">
					<option value="B" <%if (msgHdr5.getE05CRETIP().equals("B")) { out.print("selected");}%>>Codigo de Barras</option>
					<option value="R" <%if (msgHdr5.getE05CRETIP().equals("R")) { out.print("selected");}%>>Referencia</option>
					<option value="P" <%if (msgHdr5.getE05CRETIP().equals("P")) { out.print("selected");}%>>PIN</option>
				</select>
		    </div>
	      </td>
	    </tr>
		<tr id="trclear"> 
	      <td align=CENTER width="40%"> 
	        <div align="right">Secuencia :</div>
	      </td>
	      <td align=CENTER width="60%"> 
	        <div align="left"> 
				<INPUT type="text" name="E05CRESEQ" size="5" maxlength="5" value="<%=msgHdr5.getE05CRESEQ().trim()%>">
	        </div>
	      </td>
	    </tr>

	   <tr id="trdark">
	   <TD ALIGN=center nowrap colspan="2">
		     <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goNew()"> 
	   </TD>
	   
	   </tr>
	 </TABLE>
	 </div>


<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="20%">
			<div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goAction()"><b>Salir</b></a>
      	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goProcess()"><b>Consultar></b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goAction()"><b>Salir</b></a>
      	</TD>
	</TR>
</TABLE>  


<%
  }	 
	if ( msgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Registros.</h4></div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <table  class="tableinfo" width="100%">
  
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="5%"><B>Banco</B></td>
		<TD nowrap align="center" width="10%"><B>Convenio</B></TD>
		<TD nowrap align="center" width="10%"><B>Canal</B></TD>
		<TD nowrap align="center" width="30%"><B>Descripcion</B></TD>
		<TD nowrap align="center" width="5%"><B>Tipo</B></TD>
		<TD nowrap align="center" width="5%"><B>Secuencia</B></TD>
		<TD nowrap align="center" width="30%"><B>Nombre</B></TD>
	</TR>
	<TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"></td>
		<TD nowrap align="center" width="10%"><B></B></TD>
		<td NOWRAP align="left" width="10%"></td>
		<TD nowrap align="center" width="30%"><B></B></TD>
		<TD nowrap align="center" width="5%">
			<INPUT type="text" name="SEARCHCDE" size="13" maxlength="12" value="<%= userPO.getHeader2() %>" >
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Posicionarse en...">
		</TD>
		<TD nowrap align="center" width="5%"><B></B></TD>
		<td NOWRAP align="center" width="30%"><B></B></td>
		
	</TR> 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            ECSM00205Message msgRcd = (ECSM00205Message) msgList.getRecord(); 
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE05CREBNK()%>','<%= msgRcd.getE05CRENUM() %>','<%= msgRcd.getE05CRECNL() %>','<%= msgRcd.getE05CRETIP() %>','<%= msgRcd.getE05CRESEQ() %>')">
		</td>
		<td NOWRAP align="center" width="5%"><%= msgRcd.getE05CREBNK()%></td>
		<td NOWRAP align="left" width="10%" ><%= msgRcd.getE05CRENUM()%></td>
		<td NOWRAP align="left" width="10%" ><%= msgRcd.getE05CRECNL()%></td>
		<td NOWRAP align="left" width="30%" ><%= msgRcd.getD05CRECNL()%></td>
		<td NOWRAP align="left" width="5%" ><%= msgRcd.getE05CRETIP()%></td>
		<td NOWRAP align="left" width="5%" ><%= msgRcd.getE05CRESEQ()%></td>
		<td NOWRAP align="left" width="30%" ><%= msgRcd.getE05CRENOM()%></td>
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
			screen = 6;
		} 
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
  <SCRIPT type="text/javascript">
     showChecked("key");
	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;
 </SCRIPT>
 
</form>
</body>
</html>
