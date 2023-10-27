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
<jsp:useBean id= "EDL0520List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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

function goSimula() {
	document.getElementById("SCREEN").value="8";
	document.forms[0].submit();
} 

function isCheck() {

	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(var n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				document.getElementById("E02DEAACC").value = document.forms[0].elements[n].value;
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

<h3 align="center">Lista Productos para Simulaci&oacute;n <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="simulacion_list_prestamos.jsp, EDL0520"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0520">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E02DEAACC" id="E02DEAACC" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" id="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" id="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" id="CURRROWS" VALUE="0">
    <input type=HIDDEN name="CURRENTROW" value="">
  <INPUT TYPE="HIDDEN" name="SEARCHCDE" id="SEARCHCDE" value="">
  <INPUT TYPE=HIDDEN NAME="H02FLGWK1" id="H02FLGWK1" value="<%= userPO.getHeader2()%>">
<% 
 if (userPO.getPurpose().equals("SIMULA")){
%>
<table class="tableinfo">
  <tr >
    <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
      <tr id="trdark">
        <td nowrap><div align="right">Producto :</div></td>
        <td nowrap><input type="text" readonly name="PRODU" size="10" maxlength="9" value="<%= userPO.getHeader1()%>">
        </td>
        <td nowrap><div align="right">Numero de Cliente :</div></td>
        <td nowrap><input type="text" readonly name="CLIEN" size="5" maxlength="4" value="<%= userPO.getHeader2()%>"></td>
        
      </tr>
     </table></td>
  </tr>
</table>
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goModifi()"><b>Modificar<br>Calificación</b></a>      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goSimula()"><b>Enviar Proceso <br> Simulación</b></a></TD>		
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
	if ( EDL0520List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No Existen Prestamos para la Simulaci&oacute;n Seleccionada.</h4>
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
  			      <td NOWRAP align="center" width="30%"><B>Pr&eacute;stamo</b></td>
  			      <td NOWRAP align="center" width="30%"><B>Cliente</b></td>				  
  			      <td NOWRAP align="center" width="30%"><B>Modalidad</b></td>				  				  
  			      <td NOWRAP align="center" width="30%"><B>Nombre</b></td>				  				  
  			      <td NOWRAP align="center" width="30%"><B>Identificacion</b></td>				  				  				  
  			      <td NOWRAP align="center" width="30%"><B>Calificación<br> Actual</b></td>				  				  				  
  			      <td NOWRAP align="center" width="30%"><B>Provisión <br>Capital Actual</b></td>				  				  				  				  
  			      <td NOWRAP align="center" width="30%"><B>Provisión <br>Interes Actual</b></td>				  				  				  				  				  
   			      <td NOWRAP align="center" width="30%"><B>Provisión <br>Otros Actual</b></td>				  				  				  				  				  
  			      <td NOWRAP align="center" width="30%"><B>Calificación <br>Subjetiva Simulación</b></td>				  				  				  				  
			    </tr>
	   
        <%
    	  int i = 0;
          EDL0520List.initRow();    
    	  boolean firstTime = true;
		  String chk = "";
          while (EDL0520List.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
            EDL052002Message msgList = (EDL052002Message) EDL0520List.getRecord();	 
         %>              
		<tr id="dataTable<%= EDL0520List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="CODE" name="CODE" value="<%=msgList.getE02DEAACC()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EDL0520List.getCurrentRow() %>)"/></td>
			<td NOWRAP align="center" width="30%" ><%= msgList.getE02DEAACC() %></td>
			<td NOWRAP align="center" width="30%" ><%= msgList.getE02DEACUN() %></td>
			<td NOWRAP align="center" width="30%" ><%= msgList.getE02MODALI() %></td>			
			<td NOWRAP align="left" width="30%" ><%= msgList.getE02CUSNA1() %></td>						
			<td NOWRAP align="left" width="30%" ><%= msgList.getE02CUSIDN() %></td>						
			<td NOWRAP align="center" width="30%" ><%= msgList.getE02DLCALI() %></td>									
			<td NOWRAP align="center" width="30%" ><%= msgList.getE02DLCPPR() %></td>												
			<td NOWRAP align="center" width="30%" ><%= msgList.getE02DLCPIN() %></td>															
			<td NOWRAP align="center" width="30%" ><%= msgList.getE02DLCPOT() %></td>																		
			<td NOWRAP align="center" width="30%" ><%= msgList.getE02CALNEW() %></td>																					
	</TR>
       <% 
       	 i++; 
        } 
       %> 
          </table>
      </td>
    </tr>
</table>

 
  
<BR>
<SCRIPT Language="javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%= i%>;
	getElement("NEXTROWS").value = <%= EDL0520List.getLastRec()%>;
	getElement("CURRROWS").value = <%= EDL0520List.getFirstRec()%>;
</SCRIPT>
<% } %> 
</form>
</body>
</html>
