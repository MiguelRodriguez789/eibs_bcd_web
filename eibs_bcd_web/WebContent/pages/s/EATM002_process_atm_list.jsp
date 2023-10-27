<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgSel" class= "datapro.eibs.beans.EATM00201Message"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

var ok = false;

function goSalir() {
	document.forms[0].SCREEN.value="1";
	document.forms[0].submit();
}


function goNew() {
	document.forms[0].SCREEN.value="4";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="5";
	document.forms[0].submit();
}


function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Registro a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="6";
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
	getElement("SCREEN").value="3";
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


function setKey(tyr,bty,ban,den) {

    getElement("E02MOVTYR").value = tyr;
    getElement("E02MOVBTY").value = bty;
	getElement("E02MOVBAN").value = ban;
	getElement("E02MOVDEN").value = den;

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

<h3 align="center">ATM<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="process_atm_list.jsp, EATM002"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEATM002">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E02MOVBNK" VALUE="<%=msgSel.getE01MOVBNK()%>">
  <INPUT TYPE=HIDDEN NAME="E02MOVCCY" VALUE="<%=msgSel.getE01MOVCCY()%>">
  <INPUT TYPE=HIDDEN NAME="E02MOVTID" VALUE="<%=msgSel.getE01MOVTID()%>">
  <INPUT TYPE=HIDDEN NAME="E02MOVTYY" VALUE="<%=msgSel.getE01MOVTYY()%>">
  <INPUT TYPE=HIDDEN NAME="E02MOVTMM" VALUE="<%=msgSel.getE01MOVTMM()%>">
  <INPUT TYPE=HIDDEN NAME="E02MOVTDD" VALUE="<%=msgSel.getE01MOVTDD()%>">
  <INPUT TYPE=HIDDEN NAME="E02MOVTYR" VALUE="<%=msgSel.getE01MOVTYR()%>">
  <INPUT TYPE=HIDDEN NAME="E02MOVBTY" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E02MOVBAN" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E02MOVDEN" VALUE="0">

  
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="<%= userPO.getType() %>">

<%int row = 0; %>
 
 <h4>Informacion Basica</h4>
  
 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=8% align="right">Banco : </td>
				<td nowrap width=25% align="left">
					<input type="text" name="E01MOVBNK" size="3" maxlength="2" value="<%=msgSel.getE01MOVBNK() %>" readonly />
				</td>
				<td nowrap width=9% align="right">Moneda : </td>
				<td nowrap width=25% align="left">
					<input type="text" name="E01MOVCCY" size="4" maxlength="3" value="<%=msgSel.getE01MOVCCY().trim()%>" readonly />
				</td>
				<td nowrap width=8% align="right">Cajero :</td>
				<td nowrap width=25% align="left">
					<input type="text" name="E01MOVTID" size="15" maxlength="10" value="<%=msgSel.getE01MOVTID()%>" readonly>
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=8% align="right">Fecha: </td>
				<td nowrap width=25% align="left">
					<eibsinput:date readonly="true" name="msgSel" fn_month="E01MOVTMM" fn_day="E01MOVTDD" fn_year="E01MOVTYY"/>
				</td>
				<td nowrap width=9% align="right">Tipo :</td>
				<td nowrap width=25% align="left">
				     <input type="text" readonly name="E01MOVTYR" size="1" maxlength="1" value="<%=msgSel.getE01MOVTYR()%>" readonly> 
				     <input type="text" readonly name="D01MOVTYR" size="20" maxlength="30" 
					     value="<% if (msgSel.getE01MOVTYR().equals("A")) out.print("Arqueo");
								   else if (msgSel.getE01MOVTYR().equals("P")) out.print("Aprovisionamiento");
								   else if (msgSel.getE01MOVTYR().equals("M")) out.print("Movimiento Diario");
							       else out.print("");%>">
				</td>
				<td nowrap width=8% align="right"></td>
				<td nowrap width=25% align="left">
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=8% align="right">Timbre: </td>
				<td nowrap width=25% align="left">
					<input type="text" name="E01TOTTIM" size="15" maxlength="15" value="<%=msgSel.getE01TOTTIM()%>" readonly>
				</td>
				<td nowrap width=9% align="right"></td>
				<td nowrap width=25% align="left">
				</td>
				<td nowrap width=8% align="right">Valor Total</td>
				<td nowrap width=25% align="left">
					<input type="text" name="E01TOTVRA" size="15" maxlength="15" value="<%=msgSel.getE01TOTVRA()%>" readonly>
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
<%--
 	<TD align="CENTER" class="TDBKG" width="20%">
		<a href="javascript:goNew()"><b>Crear</b></a>
    </TD>
--%>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
<%--
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
--%>
	  	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goSalir()"><b>Salir</b></a>
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
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="javascript:goSalir()"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>  


<%
  }	 
	if ( msgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%>
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
  
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<TD nowrap align="center" width="10%"><B>Tipo<br>Bandeja</B></TD>
		<TD nowrap align="center" width="20%"><B>Descripcion</B></TD>
		<TD nowrap align="center" width="15%"><B>Bandeja</B></TD>
		<td NOWRAP align="center" width="15%"><B>Denominacion</B></td>
		<TD nowrap align="center" width="15%"><B>Cantidad</B></TD>
		<TD nowrap align="center" width="20%"><B>Valor<br> Cajero</B></TD>
	</TR>
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="10%"></td>
		<td NOWRAP align="center" width="20%"></td>
		<td NOWRAP align="center" width="15%">
			<INPUT type="text" name="SEARCHCDE" size="5" maxlength="2" value="<%= userPO.getHeader3() %>" >
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="10" height="10" title="Posicionarse en...">
		</td>
		<td NOWRAP align="center" width="15%"></td>
		<td NOWRAP align="center" width="15%"></td>
		<td NOWRAP align="center" width="20%"></td>
	</TR> 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            EATM00202Message msgRcd = (EATM00202Message) msgList.getRecord();
		%>              
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%= msgRcd.getE02MOVTYR()%>','<%= msgRcd.getE02MOVBTY()%>','<%= msgRcd.getE02MOVBAN()%>','<%= msgRcd.getE02MOVDEN()%>')">
		</td>
		<td NOWRAP align="center" width="10%"><%= msgRcd.getE02MOVBTY()%></td>
		<td NOWRAP align="left"  width="20%"> <%= msgRcd.getD02MOVBTY()%></td>
		<td NOWRAP align="center" width="15%"><%= msgRcd.getE02MOVBAN()%></td>
		<td NOWRAP align="right"  width="15%"><%= msgRcd.getE02MOVDEN()%></td>
		<td NOWRAP align="right"  width="15%"><%= msgRcd.getE02MOVQTY()%></td>		
		<td NOWRAP align="right"  width="20%"><%= msgRcd.getE02MOVVRA()%></td>		
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
		int screen = 3;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 3;
		} 
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEATM002?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEATM002?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
</form>
</body>
</html>
