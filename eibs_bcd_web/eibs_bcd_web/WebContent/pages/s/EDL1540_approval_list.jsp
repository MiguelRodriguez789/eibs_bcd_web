<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.math.BigDecimal"%>
<%@page import="java.lang.Double"%>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>NIIF 9 Provisiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT >
var ok = false;

function goNew() {
	getElement("SCREEN").value="12";
	submitForm();
}

function goInquiry() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	getElement("SCREEN").value="24";
	submitForm();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el registro a borrar!!!");
		return;	 
	}
	getElement("E01ACT").value="D";
	if (!confirm("Desea borrar el registro seleccionado?")) {
		return;
	}
	submitForm();
} 

function goApproval() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el registro a Aprobar!!!");
		return;	 
	}
	getElement("E01ACT").value="A";
	if (!confirm("Desea Aprobar la operación seleccionada?")) {
		return;
	}
	submitForm();
} 

function goInqAcc(op,acc) {
	var pg = "";
  	switch (op) {
		case 1 :  // Account Inquiry
		  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=10&ACCNUM=" + acc + "&opt=" + op;
			break;
		case 2 :  // Customer Accounts
		  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=1&opt=1";
			break;
	}
	CenterWindow(pg,600,500,2);
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

function setKey(mod, con, pdy, pdm) {
	getElement("E01MOD").value = mod;
	getElement("E01CON").value = con;
	getElement("E01PDY").value = pdy;
	getElement("E01PDM").value = pdm;
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

<h3 align="center">
		Aprobaci&oacute;n de Calculo NIIF 9 - Provision
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="approval_list.jsp, EDL1540"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEDL1540">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="25">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01MOD" NAME="E01MOD" VALUE="<%=userPO.getSource()%>">
  <INPUT TYPE=HIDDEN id="E01CON" NAME="E01CON" VALUE="<%=userPO.getIdentifier()%>">
  <INPUT TYPE=HIDDEN id="E01ACT" NAME="E01ACT" VALUE="">
  <INPUT TYPE=HIDDEN id="E01PDY" NAME="E01PDY" VALUE="">
  <INPUT TYPE=HIDDEN id="E01PDM" NAME="E01PDM" VALUE="">
   

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goApproval()"><b>Aprobar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goInquiry()"><b>Consultar</b></a>
      	</TD>
      		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
	</TR>
</TABLE>
<%
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
				<th NOWRAP align="center" width="9%"><B>Modalidad</B></th>
				<th NOWRAP align="center" width="9%"><B>Concepto</B></th>
				<th NOWRAP align="center" width="6%"><B>Periodo</B></th>
 				<th NOWRAP align="center" width="9%"><B>PE<BR>Ponderado</B></th>
 				<th NOWRAP align="center" width="9%"><B>Saldo<BR>Provision</B></th>
 				<th NOWRAP align="center" width="9%"><B>Diferencia</B></th>
 				<th NOWRAP align="center" width="6%"><B>Tarifa<BR>Impuesto</B></th>
 				<th NOWRAP align="center" width="9%"><B>Monto<BR>Impuesto</B></th>
 				<th NOWRAP align="center" width="7%"><B>Fecha<br>Proceso</B></th>
 				<th NOWRAP align="center" width="7%"><B>Total<br>Registros</B></th>
 				<th NOWRAP align="center" width="15%"><B>Comentario</B></th>
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
            EDL154001Message msgRcd = (EDL154001Message) msgList.getRecord();
		%>              
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"> 
				<input type="radio" id="ROW" name="ROW" value="<%= msgList.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgRcd.getE01MOD()%>','<%=msgRcd.getE01CON()%>','<%=msgRcd.getE01PDY()%>','<%=msgRcd.getE01PDM()%>'); highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="9%" >
			<a href="javascript:goInquiry()" >
				<% if (msgRcd.getE01MOD().equals("H")) out.print("Hipotecario ");
					else if (msgRcd.getE01MOD().equals("M")) out.print("Microcredito");
					else if (msgRcd.getE01MOD().equals("C")) out.print("Consumo");
					else if (msgRcd.getE01MOD().equals("L")) out.print("Comercial");
			    else out.print("Otro"); 
				%></a>
			</td>
			<td NOWRAP align="center" width="9%" >
				<a href="javascript:goInquiry()" >
				<% if (msgRcd.getE01CON().equals("C")) out.print("Capital ");
					else if (msgRcd.getE01CON().equals("I")) out.print("Interes");
					else if (msgRcd.getE01CON().equals("O")) out.print("Otros");
				    else out.print("No Existe"); 
				%></a>
			</td>
			<td NOWRAP align="center" width="6%" ><%= msgRcd.getE01PDY()%>-<%=msgRcd.getE01PDM()%></td>
			<td NOWRAP align="center" width="9%" ><%= msgRcd.getE01PON() %></td>
			<td NOWRAP align="center" width="9%" ><%= msgRcd.getE01SPV() %></td>
			<td NOWRAP align="center" width="9%" ><%= msgRcd.getE01DIF() %></td>
			<td NOWRAP align="center" width="6%" ><%= msgRcd.getE01TIM() %></td>
			<td NOWRAP align="center" width="9%" ><%= msgRcd.getE01AIM() %></td>
			<td NOWRAP align="center" width="7%" ><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01DTM()),Integer.parseInt(msgRcd.getE01DTD()),Integer.parseInt(msgRcd.getE01DTY()))%></td>
			<td NOWRAP align="center" width="7%" ><%= msgRcd.getE01TOT() %></td>
			<td NOWRAP align="left" width="15%" >
 				<% if (Double.valueOf(msgRcd.getE01DIF().replace(",", "")) > 0) out.print("<FONT color=\"green\">GASTO</FONT>"); 
 			    else if (Double.valueOf(msgRcd.getE01DIF().replace(",", "")) < 0) out.print("<FONT color=\"green\">RECUPERACION</FONT>");
 			    else out.print("<FONT color=\"red\">DIFERENCIA EN CERO</FONT>"); 
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
		int screen = 21;
		String parm = "?SCREEN=" + screen + "&E01MOD=" + userPO.getSource() + "&E01CON=" + userPO.getIdentifier();;
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.misc.JSEDL1540" + parm + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.misc.JSEDL1540" + parm + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
