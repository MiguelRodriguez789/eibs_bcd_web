<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<%@ page import = "datapro.eibs.beans.*" %>
<title>Mantenimiento de Incumplimientos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EDL0519List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
var ok = false;

function removeSpaces(string) {
 	return string.split(' ').join('');
} 


function goModifi() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Prestamo a Modificar!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="5";
	document.forms[0].submit();
}

function goConsul() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Prestamo a Consultar!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="4";
	document.forms[0].submit();
} 
function goAdicio() {
	document.getElementById("SCREEN").value="6";
	document.forms[0].submit();
} 
function isCheck() {

	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(var n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				document.getElementById("E01INCACC").value = document.forms[0].elements[n].value;
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

<h3 align="center">Mantenimiento de Incumplimientos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="ln_maint_incumplimiento.jsp, EDL0519"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0519">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01INCACC" id="E01INCACC" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" id="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" id="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" id="CURRROWS" VALUE="0">
    <input type=HIDDEN name="CURRENTROW" value="">
  <INPUT TYPE="HIDDEN" name="SEARCHCDE" id="SEARCHCDE" value="">
  <INPUT TYPE=HIDDEN NAME="H02FLGWK1" id="H02FLGWK1" value="<%= userPO.getHeader2()%>">
<% 
 if (userPO.getPurpose().equals("MAIN_INCUMP") || userPO.getPurpose().equals("NEW_INCUMP")){
%>
<table class="tableinfo">
  <tr >
    <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
      <tr id="trdark">
        <td nowrap><div align="right">Nro Cliente :</div></td>
        <td nowrap><input type="text" readonly name="E01CUSCUN" size="10" maxlength="9" value="<%= userPO.getHeader1()%>">
        </td>
        <td nowrap><div align="right">Identificaci&oacute;n :</div></td>
        <td nowrap><input type="text" readonly name="E01CUSTID" size="5" maxlength="4" value="<%= userPO.getHeader6()%>">
              <input type="text" readonly name="E01CUSIDN" size="26" maxlength="25" value="<%= userPO.getHeader7()%>">
        </td>
        <td nowrap><div align="right">Nombre :</div></td>
        <td nowrap colspan="3"><input type="text" readonly name="E01CUSNA1" size="60" maxlength="60" value="<%= userPO.getHeader8()%>">
        </td>
      </tr>
      <tr id="trclear">
        <td nowrap><div align="right">Modalidad :</div></td>
        <td nowrap colspan="3"><input type="text" readonly name="D01DLCMOD" size="20" maxlength="20" value="<%= userPO.getHeader5()%>">
        </td>
        <td nowrap><div align="right">Periodo</div></td>
        <td nowrap colspan="3">Mes:<input type="text" readonly name="E02PERMES" size="5" maxlength="4" value="<%= userPO.getHeader3()%>">
          Año:<input type="text" readonly name="E02PERAYO" size="5" maxlength="2" value="<%= userPO.getHeader4()%>"></td>
      </tr>
    </table></td>
  </tr>
</table>
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" width="10%">Prestamo a Incluir : </TD>
		<TD align="LEFT" width="30%">
			<input type="text" name="E01DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
              <a href="javascript:GetAccount('E01DEAACC','','10','<%= userPO.getHeader1()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
		</TD>	
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goModifi()"><b>Modificar</b></a>      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goConsul()"><b>Consultar</b></a></TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goAdicio()"><b>Adicionar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
 	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
	  	<TD align="CENTER" class="TDBKG" width="100%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  }
%> 


<% 
	if ( EDL0519List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No Existen Incumplimientos del cliente para el periodo dado.</h4>
      </div>
      </TD>
	</TR>
   	</TABLE>
<%
	} else {
%>    
    
 <TABLE  id="mainTable" class="tableinfo" height="70%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="100%">
    			<TR id="trdark">  
				  <td NOWRAP align="center" width="5%"><B>Sel</B></td>
				  <td NOWRAP align="center" width="30%"><B>Fecha<br>Incumplimiento</B></td>
				   <td NOWRAP align="center" width="30%"><B>Pr&eacute;stamo</b></td>
				  <td NOWRAP align="center" width="30%"><B>Tipo<br>Incumplimiento</B></td>
				  <td NOWRAP align="center" width="30%"><B>Dias<br>Incumplimiento</B></td>
				  <td NOWRAP align="center" width="30%"><B>Estado<br>Incumplimiento</B></td>
				  <td NOWRAP align="center" width="30%"><B>Fecha Estado</B></td>
				  <td NOWRAP align="center" width="30%"><B>Motivo<br></b></td>
 				  <td NOWRAP align="center" width="30%"><B>Registro<br></b></td>
			    </tr>
	   
        <%
    	  int i = 0;
          EDL0519List.initRow();    
    	  boolean firstTime = true;
		  String chk = "";
          while (EDL0519List.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
            EDL051901Message msgList = (EDL051901Message) EDL0519List.getRecord();	 
         %>              
		<tr id="dataTable<%= EDL0519List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="CODE" name="CODE" value="<%=msgList.getE01INCACC()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EDL0519List.getCurrentRow() %>)"/></td>
			<td NOWRAP align="center" width="30%" ><%= Util.formatDate(msgList.getE01INCIID(),msgList.getE01INCIIM(),msgList.getE01INCIIY())%></td>
			<td NOWRAP align="center" width="30%" ><%= msgList.getE01INCACC() %></td>
			<td NOWRAP align="center" width="30%" ><%= msgList.getD01INCTYP() %></td>
			<td NOWRAP align="center" width="30%" ><%= msgList.getE01INCDAY() %></td>
			<td NOWRAP align="center" width="30%" ><% if (msgList.getE01INCSTS().equals("I")) { %> Inactivo <% } else {%> Activo <% }%> </td>
			<td NOWRAP align="center" width="30%" ><%= Util.formatDate(msgList.getE01INCLMD(),msgList.getE01INCLMM(),msgList.getE01INCLMY())%></td>			
			<td NOWRAP align="center" width="30%" ><%= msgList.getD01INCMOT() %></td>
			<td NOWRAP align="center" width="30%" ><%= msgList.getE01PENDAP() %></td>
			
	</TR>
       <% 
       	 i++; 
        } 
       %> 
             </table>
            </td>
    </tr>
</table>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <%
			int screen = 1;
    	if ( EDL0519List.getShowPrev() ) {
  			int pos = EDL0519List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDL0519?SCREEN="+screen+"&FromRecord=" + pos + "&E01CUSCUN=" + userPO.getHeader1() + "&E01DLCMOD=" + userPO.getHeader2() + "&E01PERMES=" + userPO.getHeader3() + "&E01PERAYO=" + userPO.getHeader4() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EDL0519List.getShowNext()) {
  			int pos = EDL0519List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDL0519?SCREEN="+screen+"&FromRecord=" + pos + "&E01CUSCUN=" + userPO.getHeader1() + "&E01DLCMOD=" + userPO.getHeader2() + "&E01PERMES=" + userPO.getHeader3() + "&E01PERAYO=" + userPO.getHeader4() + "\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%= i%>;
	getElement("NEXTROWS").value = <%= EDL0519List.getLastRec()%>;
	getElement("CURRROWS").value = <%= EDL0519List.getFirstRec()%>;
</SCRIPT>
<% } %> 
</form>
</body>
</html>
