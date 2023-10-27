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

function goNew() {
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}

function goMaint(action) {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	getElement("SCREEN").value="4";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
	}
	getElement("SCREEN").value="17";
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

function setKey(bnk, ccy, cor) {
	getElement("E01BNK").value = bnk;
	getElement("E01CCY").value = ccy;
	getElement("E01COR").value = cor;
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

<h3 align="center">Parametros de Remanentes - GMF Asumido por la Instituci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="scoring_variables_list.jsp, ESD1097"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSERM0200">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01BNK" NAME="E01BNK" VALUE="<%=userPO.getBank()%>">
  <INPUT TYPE=HIDDEN id="E01CCY" NAME="E01CCY" VALUE="<%=userPO.getCurrency()%>">
  <INPUT TYPE=HIDDEN id="E01COR" NAME="E01COR" VALUE="">
  <INPUT TYPE=HIDDEN id="E01CSO" NAME="E01CSO" VALUE="">
  



<%
	if ( JBOList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay resultados para su b&uacute;squeda.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter"> 
	<TR>
      	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goNew()"><b>Crear</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 
   	
<%
	}
	else {
%>    
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>
  <TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
	
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goMaint()"><b>Modificar</b></a>
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
      	<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goValues()"><b>Consultar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
 %>  
    
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th NOWRAP align="center" width="5%"><B>Sel</B></th>
				<th NOWRAP align="center" width="10%"><B>Origen</B></th>
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
            ERM020001Message msgList = (ERM020001Message) JBOList.getRecord();
		%>              
		<tr id="dataTable<%= JBOList.getCurrentRow() %>">
			<td nowrap align="center" width="5%">
				<input type="radio" id="ROW" name="ROW" value="<%= JBOList.getCurrentRow() %>"  class="highlight" <%=chk %>
				onClick="setKey('<%=msgList.getE01BNK()%>','<%=msgList.getE01CCY()%>','<%=msgList.getE01COR()%>'); highlightRow('dataTable', <%= JBOList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="10%" >
				<% if (msgList.getE01COR().equals("RM")) out.print(msgList.getE01COR()+"<FONT color=\"green\"> PRD ");
				    else if (msgList.getE01COR().equals("RV")) out.print(msgList.getE01COR()+"<FONT color=\"orange\"> Rechazos Varios");
					else if (msgList.getE01COR().equals("RP")) out.print(msgList.getE01COR()+"<FONT color=\"orange\"> Rechazo Planilla");
					else if (msgList.getE01COR().equals("PD")) out.print(msgList.getE01COR()+"<FONT color=\"orange\"> Primas Devueltas");
					else if (msgList.getE01COR().equals("LS")) out.print(msgList.getE01COR()+"<FONT color=\"orange\"> Liquidacion Seguros");
					else if (msgList.getE01COR().equals("MS")) out.print(msgList.getE01COR()+"<FONT color=\"orange\"> Miscelaneos");
					else if (msgList.getE01COR().equals("PN")) out.print(msgList.getE01COR()+"<FONT color=\"orange\"> Prestamos Negociados");
					else if (msgList.getE01COR().equals("DP")) out.print(msgList.getE01COR()+"<FONT color=\"orange\"> Depositos a Plazo");
				%>
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
		if ( JBOList.getShowPrev() ) {
  			int pos = JBOList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSERM0200?SCREEN=1&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (JBOList.getShowNext()) {
  			int pos = JBOList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSERM0200?SCREEN=1&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	showChecked("ROW");
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
