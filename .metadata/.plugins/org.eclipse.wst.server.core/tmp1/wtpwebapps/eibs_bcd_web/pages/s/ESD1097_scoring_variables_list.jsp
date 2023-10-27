<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Variables Scoring</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "JBOList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
var ok = false;


function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar una Variable!!!");
		return;	 
	}
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}

function goValues() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar una Variable!!!");
		return;	 
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			getElement("SCREEN").value="10";
	<% } else { %>
			getElement("SCREEN").value="16";
	<% }%>
	getElement("E01SEQ").value = "0";
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

function setKey(lgt, vrb ) {
	getElement("E01LGT").value = lgt;
	getElement("E01VAR").value = vrb;
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

<h3 align="center">Variables Scoring LAFT<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="scoring_variables_list.jsp, ESD1097"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1097">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01LGT" NAME="E01LGT" VALUE="">
  <INPUT TYPE=HIDDEN id="E01VAR" NAME="E01VAR" VALUE="">
  <INPUT TYPE=HIDDEN id="E01SEQ" NAME="E01SEQ" VALUE="0">
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goValues()"><b>Valores</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
      	<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goValues()"><b>Valores</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( JBOList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Variables.</h4> 
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
				<th NOWRAP align="center" width="10%"><B>Tipo<br>Legal</B></th>
				<th NOWRAP align="center" width="10%"><B>Variable</B></th>
				<th NOWRAP align="center" width="30%"><B>Descripción</B></th>
				<th nowrap align="center" width="15%"><B>Tipo</B></th>
				<th nowrap align="center" width="10%"><B>Peso %</B></th>
				<th nowrap align="center" width="10%"><B>Acumulado %</B></th>
				<th nowrap align="center" width="10%"><B>Estado</B></th>
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
          JBOList.initRow();
     	  boolean firstTime = true;
		  String chk = "";
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
				onClick="setKey('<%=msgList.getE01LGT()%>','<%=msgList.getE01VAR()%>'); highlightRow('dataTable', <%= JBOList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="10%" >
				<% if (msgList.getE01LGT().equals("1")) out.print("<FONT color=\"green\"> Jurídico ");
				    else if (msgList.getE01LGT().equals("2")) out.print("<FONT color=\"orange\"> Persona");
				%>
			<td NOWRAP align="center" width="10%" ><%= msgList.getE01VAR() %></td>
			<td NOWRAP align="left" width="30%" ><%= msgList.getE01DSC() %></td>
			<td NOWRAP align="left" width="15%" >
				<% if (msgList.getE01TYP().equals("AMT")) out.print("Rango Montos");
				    else if (msgList.getE01TYP().equals("FLG")) out.print("Valor");
				    else if (msgList.getE01TYP().equals("CNO")) out.print("Tabla");
				    else if (msgList.getE01TYP().equals("BRN")) out.print("Oficina");
				    else if (msgList.getE01TYP().equals("AGE")) out.print("Edad"); 
				 %>
			</td>
			<td NOWRAP align="right" width="10%" ><%= msgList.getE01WGT() %></td>
			<td NOWRAP align="right" width="10%" >
				<% if (msgList.getE01LGT().equals("1")) out.print("<FONT color=\"green\">");
				    else if (msgList.getE01LGT().equals("2")) out.print("<FONT color=\"orange\">");
				 %>
				<%= msgList.getE01WGTD() %>
			</td>
			<td NOWRAP align="center" width="10%" >
				<% if (msgList.getE01STS().equals("I")) out.print("<FONT color=\"red\"> INACTIVO");
				    else if (msgList.getE01STS().equals("A")) out.print("<FONT color=\"#d0122c\"> ACTIVO");
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
		int screen = 6;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1;
		} 
    	if ( JBOList.getShowPrev() ) {
  			int pos = JBOList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1097?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getCusNum() + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (JBOList.getShowNext()) {
  			int pos = JBOList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1097?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getCusNum() + "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
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
<%      
  }
%> 
</form>
</body>
</html>
