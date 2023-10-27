<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<html>
<head>
<title>Variables Scoring LAFT</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "JBOList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<%
    	  int i = 0;
          JBOList.initRow();
          JBOList.getNextRow();
          ESD109701Message msgRcd = (ESD109701Message) JBOList.getRecord();
          JBOList.removeRow(0);
%> 

<SCRIPT >
var ok = false;

function goNew() {
	getElement("SCREEN").value="12";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
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
	getElement("E01SEQ").value = seq;
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

<h3 align="center">Porcentajes para Variables Scoring LAFT<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="scoring_variables_values_list.jsp, ESD1097"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1097">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="16">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01LGT" VALUE="<%= msgRcd.getE01LGT().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01VAR" VALUE="<%= msgRcd.getE01VAR().trim()%>">
  <INPUT TYPE=HIDDEN id="E01SEQ" NAME="E01SEQ" VALUE="0">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
      	<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
   			<td nowrap width="15%" align="right"><b>Tipo Legal / Variable : </b></td>
			<td nowrap width="35%">
				<% if (msgRcd.getE01LGT().equals("1")) out.print("Jurídico ");
				    else if (msgRcd.getE01LGT().equals("2")) out.print("Persona");
				%> / <%= msgRcd.getE01VAR().trim()%> - <%= msgRcd.getE01DSC().trim()%> 
            </td>
            <td nowrap width="15%" align="right"><b>Estado : </b></td>
            <td nowrap width="35%" align="left"> 
                <% if (msgRcd.getE01STS().equals("I")) out.print("<FONT color=\"red\"> INACTIVO");
				    else if (msgRcd.getE01STS().equals("A")) out.print("<FONT color=\"#d0122c\"> ACTIVO");
				 %>
			</td>
        </tr> 
		<tr id="trclear">  
            <td nowrap width="15%" align="right"><b>Peso en % : </b></td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01WGT().trim()%>
			</td>
            <td nowrap width="15%" align="right"><b>Tipo : </b></td>
			<td nowrap width="35%" align="left">
				<% if (msgRcd.getE01TYP().equals("AMT")) out.print("RANGO MONTOS");
				    else if (msgRcd.getE01TYP().equals("FLG")) out.print("VALOR");
				    else if (msgRcd.getE01TYP().equals("CNO")) out.print("TABLA");
				    else if (msgRcd.getE01TYP().equals("BRN")) out.print("OFICINA");
				    else if (msgRcd.getE01TYP().equals("AGE")) out.print("EDAD"); 
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
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1097?SCREEN=1"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
	  	<TD align="CENTER" class="TDBKG" width="100%">
	  		<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1097?SCREEN=6"><b>Salir</b></a>
		</TD>
	</TR>
</TABLE> 


<% 	}	 
	if ( JBOList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Porcentajes Definidos.</h4> 
      </div>
      </TD></TR>
   	</TABLE>

<% } else { %>    


    
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th NOWRAP align="center" width="5%"><B>Sel</B></th>
				<th NOWRAP align="center" width="15%"><B>Secuencia</B>
				<% if (msgRcd.getE01TYP().equals("AMT")) { %>
				<th NOWRAP align="center" width="20%"><B>Rango Inicial</B></th>
				<th NOWRAP align="center" width="20%"><B>Rango Final</B></th>
				<% } else if (msgRcd.getE01TYP().equals("FLG")) { %>
				<th NOWRAP align="center" width="40%"><B>Valor</B></th>
				<% } else if (msgRcd.getE01TYP().equals("CNO")) { %>
				<th NOWRAP align="center" width="40%"><B>Descripción</B></th>
				<% } else if (msgRcd.getE01TYP().equals("BRN")) { %>
				<th NOWRAP align="center" width="40%"><B>Oficina</B></th>
				<% } else if (msgRcd.getE01TYP().equals("AGE")) { %>
				<th NOWRAP align="center" width="20%"><B>Edad Inicial</B></th>
				<th NOWRAP align="center" width="20%"><B>Edad Final</B></th> 
				<% } %>
				<th NOWRAP align="center" width="40%"><B>Porcentaje % Aplicado al<br>Peso de la variable</B></th>
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
		  JBOList.initRow();
          while (JBOList.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}          	
            ESD109701Message msgList = (ESD109701Message) JBOList.getRecord();
		%>              
		<tr id="dataTable<%= JBOList.getCurrentRow() %>">
			<td nowrap align="center" width="5%">
				<input type="radio" id="ROW" name="ROW" value="<%= JBOList.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgList.getE01SEQ()%>'); highlightRow('dataTable', <%= JBOList.getCurrentRow() %> -1)"/>
			</td>
			<td NOWRAP align="center" width="15%" ><%= msgList.getE01SEQ() %></td>
			<% if (msgRcd.getE01TYP().equals("AMT")) { %>
				<td NOWRAP align="center" width="20%"><%= msgList.getE01RAI()%></td>
				<td NOWRAP align="center" width="20%"><%= msgList.getE01RAF()%></td>
				<% } else if (msgRcd.getE01TYP().equals("FLG")) { %>
				<td NOWRAP align="left" width="40%"><%= msgList.getE01FLG()%> - <%= msgList.getD01RCD()%></td>
				<% } else if (msgRcd.getE01TYP().equals("CNO")) { %>
				<td NOWRAP align="left" width="40%"><%= msgList.getE01CNO()%> - <%= msgList.getD01RCD()%></td>
				<% } else if (msgRcd.getE01TYP().equals("BRN")) { %>
				<td NOWRAP align="left" width="40%"><%= msgList.getE01BRN()%> - <%= msgList.getD01RCD()%></td>
				<% } else if (msgRcd.getE01TYP().equals("AGE")) { %>
				<td NOWRAP align="center" width="20%"><%= msgList.getE01RAI()%></td>
				<td NOWRAP align="center" width="20%"><%= msgList.getE01RAF()%></td> 
				<% } %>	
			<td NOWRAP align="center" width="40%" ><%= msgList.getE01WGTD()%></td>
		</tr>
      
       <% 	i++; } %>
        
             </table>
             </div>
             </td>
             </tr>
</table>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <%
        String lgt = msgRcd.getE01LGT().trim();
        String var = msgRcd.getE01VAR().trim();
		int screen = 16;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 10;
		} 
    	if ( JBOList.getShowPrev() ) {
  			int pos = JBOList.getFirstRec() - 51;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1097?SCREEN=" + screen + "&E01LGT=" + lgt +"&E01VAR=" + var + "&FromRecord=" + pos +  "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (JBOList.getShowNext()) {
  			int pos = JBOList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1097?SCREEN="+ screen + "&E01LGT=" + lgt + "&E01VAR=" + var + "&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%= i%>;
	getElement("NEXTROWS").value = <%= JBOList.getLastRec()%>;
	getElement("CURRROWS").value = <%= JBOList.getFirstRec()%>;
</SCRIPT>
<% } %> 
</form>
</body>
</html>
