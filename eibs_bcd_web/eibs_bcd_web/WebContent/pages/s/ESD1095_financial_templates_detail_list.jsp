<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Clients</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
<%
		  int row = 0;
    	  int i = 0;
          msgList.initRow();
          msgList.getNextRow();
          ESD109501Message msgRcd = (ESD109501Message) msgList.getRecord();
%> 

var ok = false;

function goNew() {
	getElement("SCREEN").value="2";
	submitForm();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar una Linea!!!");
		return;	 
	}
	getElement("SCREEN").value="3";
	submitForm();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione la linea a borrar!!!");
		return;	 
	}
	getElement("SCREEN").value="4";
	if (!confirm("Desea borrar la linea seleccionada?")) {
		return;
	}
	submitForm();
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

function setKey(rpn, lin) {
	getElement("E01IFTRPN").value = rpn;
	getElement("E01IFTLIN").value = lin;
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

<h3 align="center">Formato Financiero para Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="financial_templates_detail_list.jsp, ESD1095"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1095">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01IFTLIN" NAME="E01IFTLIN" VALUE="">
  
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Formato : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01IFTRPN" maxlength="5" size="3" readonly value="<%= msgRcd.getE01IFTRPN().trim()%>" >
			</td>
            <td nowrap width="15%" align="right">Tipo de Formato : </td>
			<td nowrap align="left" width="35%">
				<select name="E01IFTTIN" disabled>
                	<option value=" " <% if (!(msgRcd.getE01IFTTIN().equals("IFG")||msgRcd.getE01IFTTIN().equals("IFD") || msgRcd.getE01IFTTIN().equals("IFF"))) out.print("selected"); %>> 
                    </option>
                    <option value="IFD" <% if (msgRcd.getE01IFTTIN().equals("IFD")) out.print("selected"); %>>Detallado</option>                   
                    <option value="IFF" <% if (msgRcd.getE01IFTTIN().equals("IFF")) out.print("selected"); %>>Fiscal</option>
                    <option value="IFG" <% if (msgRcd.getE01IFTTIN().equals("IFG")) out.print("selected"); %>>General</option>
                </select>
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width="15%" align="right">Descripción : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01IFTLID" maxlength="65" size="60" value="<%= msgRcd.getE01IFTLID().trim()%>" readonly>
			</td>
            <td nowrap width=10% align="right"> </td>
            <td  nowrap width=40% align="left">
       		</td>
	     </tr>
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Tipo Legal :</td>
			<td  nowrap width=40% align="left">
				<select name="E01IFTLGT" disabled>
          		<option value="1" <% if (msgRcd.getE01IFTLGT().equals("1")) out.print("selected"); %>>JURIDICA</option>
               	<option value="2" <% if (msgRcd.getE01IFTLGT().equals("2")) out.print("selected"); %>>PERSONA</option>
               	<option value="B" <% if (msgRcd.getE01IFTLGT().equals("B")) out.print("selected"); %>>TODAS</option>
           		</select>
			</td>
            <td nowrap width=10% align="right">Estado : </td>
            <td  nowrap width=40% align="left">
            	<select name="E01IFTEST" disabled>
          		<option value="A" <% if (msgRcd.getE01IFTEST().equals("A")) out.print("selected"); %> >ACTIVO</option>
               	<option value="I" <% if (msgRcd.getE01IFTEST().equals("I")) out.print("selected"); %>>INACTIVO</option>
           		</select>
       		</td>
	    </tr>	
	  </table> 
    
   
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
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1095?SCREEN=1"><b>Salir</b></a>
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
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1095?SCREEN=6"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( msgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      		<TD align="center"><h4 style="text-align:center"> No hay Lineas para este Formato.</h4></TD>
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
				<th NOWRAP align="center" width="5%"><B>Linea</B></th>
				<th nowrap align="center" width="40%"><B>Descripción</B></th>
 				<th NOWRAP align="center" width="10%"><B>Tipo</B></th>
 				<th nowrap align="center" width="40%"><B>Calculos</B></th>
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
          while (msgList.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}          	
            msgRcd = (ESD109501Message) msgList.getRecord();
		%>              
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"> 
				<input type="radio" id="ROW" name="ROW" value="<%= msgList.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgRcd.getE01IFTRPN()%>','<%=msgRcd.getE01IFTLIN()%>'); highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="5%" ><%= msgRcd.getE01IFTLIN() %></td>
			<td NOWRAP align="left" width="40%" ><%= msgRcd.getE01IFTLID() %></td>
			<td NOWRAP align="center" width="10%" >
				<% if (msgRcd.getE01IFTLIT().equals("T")) out.print("TITULO");
				    else if (msgRcd.getE01IFTLIT().equals("I")) out.print("DIGITADO");
				    else if (msgRcd.getE01IFTLIT().equals("C")) out.print("CALCULADO");
				    else if (msgRcd.getE01IFTLIT().equals("B")) out.print("CALCULADO O DIGITADO");
				 %>
			</td>
			<td NOWRAP align="center" width="40%" >
				<% if (msgRcd.getE01IFTLIT().equals("C") || msgRcd.getE01IFTLIT().equals("B")) {
					if (!msgRcd.getE01IFTO01().equals("")) out.print(msgRcd.getE01IFTO01() + msgRcd.getE01IFTL01());
					if (!msgRcd.getE01IFTO02().equals("")) out.print(msgRcd.getE01IFTO02() + msgRcd.getE01IFTL02());
					if (!msgRcd.getE01IFTO03().equals("")) out.print(msgRcd.getE01IFTO03() + msgRcd.getE01IFTL03());
					if (!msgRcd.getE01IFTO04().equals("")) out.print(msgRcd.getE01IFTO04() + msgRcd.getE01IFTL04());
					if (!msgRcd.getE01IFTO05().equals("")) out.print(msgRcd.getE01IFTO05() + msgRcd.getE01IFTL05());
					if (!msgRcd.getE01IFTO06().equals("")) out.print(msgRcd.getE01IFTO06() + msgRcd.getE01IFTL06());
					if (!msgRcd.getE01IFTO07().equals("")) out.print(msgRcd.getE01IFTO07() + msgRcd.getE01IFTL07());
					if (!msgRcd.getE01IFTO08().equals("")) out.print(msgRcd.getE01IFTO08() + msgRcd.getE01IFTL08());
					if (!msgRcd.getE01IFTO09().equals("")) out.print(msgRcd.getE01IFTO09() + msgRcd.getE01IFTL09());
					if (!msgRcd.getE01IFTO10().equals("")) out.print(msgRcd.getE01IFTO10() + msgRcd.getE01IFTL10());
				   }	
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
		int screen = 9;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 8;
		} 
		String parm = "?SCREEN=" + screen + "&SEARCHCDE=" + userPO.getSeqNum();
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 1000;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1095" + parm + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1095" + parm + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
