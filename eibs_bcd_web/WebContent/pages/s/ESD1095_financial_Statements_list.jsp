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
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

<%
		  int row = 0;
    	  int i = 0;
          msgList.initRow();
          msgList.getNextRow();
          ESD109502Message msgRcd = (ESD109502Message) msgList.getRecord();
%>

var ok = false;
var finWindow = null;
var win = 0;

function goProcess(screenF) {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Estado!!!");
		return;	 
	}
	var cli = getElement("E02IFICUN").value;
	var rpn = getElement("E02IFIRPN").value;
	var dte = getElement("E02IFIRDT").value;
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1095?SCREEN=" + screenF + "&E02IFIRPN=" + rpn + "&E02IFICUN=" + cli + "&E02IFIRDT=" + dte;
	win =  win + 1;
  	finWindow = window.open(pg,"finWindow"+ win, "width=600,height=700,toolbar=no,scrollbars=yes,resizable=yes");
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

function setKey(cun, rpn, dte) {
	getElement("E02IFICUN").value = cun;
	getElement("E02IFIRPN").value = rpn;
	getElement("E02IFIRDT").value = dte;
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

<h3 align="center">Estados Financieros del Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="financial_statements_list.jsp, ESD1095"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1095">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E02IFIRPN" NAME="E02IFIRPN" VALUE="">
  <INPUT TYPE=HIDDEN id="E02IFICUN" NAME="E02IFICUN" VALUE="">
  <INPUT TYPE=HIDDEN id="E02IFIRPN" NAME="E02IFIRDT" VALUE="">
   
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess(13)"><b>Consultar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:window.close()"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<table cellspacing="0" cellpadding="2" width="100%" border="0">
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Cliente :</td>
			<td  nowrap width=40% align="left">
				<INPUT type="text" name="E02IFICUN" maxlength="9" size="10" readonly value="<%= msgRcd.getE02IFICUN().trim()%>" >
				<INPUT type="text" name="D02IFINA1" maxlength="45" size="50" readonly value="<%= msgRcd.getD02IFINA1().trim()%>" >
			</td>
            <td nowrap width=10% align="right"></td>
            <td  nowrap width=40% align="left">
       		</td>
		<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right"></td>
			<td  nowrap width=40% align="left">
			</td>
            <td nowrap width=10% align="right"></td>
            <td  nowrap width=40% align="left">
       		</td>
	    </tr>	       		
	    </tr>	
	  </table> 

<%
	if ( msgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      		<TD align="center"><h4 style="text-align:center"> No hay Estados Financieros.</h4></TD>
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
				<th NOWRAP align="center" width="10%"><B>Date</B></th>
				<th nowrap align="center" width="10%"><B>Formato</B></th>
				<th nowrap align="center" width="40%"><B>Descripción</B></th>
 				<th NOWRAP align="center" width="25%"><B>Tipo</B></th>
 				<th nowrap align="center" width="10%"><B>Caducidad</B></th>
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
            msgRcd = (ESD109502Message) msgList.getRecord();
		%>              
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"> 
				<input type="radio" id="ROW" name="ROW" value="<%= msgList.getCurrentRow()-1 %>"  class="highlight" 
				onClick="setKey('<%=msgRcd.getE02IFICUN()%>','<%=msgRcd.getE02IFIRPN()%>','<%=msgRcd.getE02IFIRDT()%>'); highlightRow('dataTable', <%= msgList.getCurrentRow()-1 %>)"/>
			</td>
			<td NOWRAP align="center" width="10%" >
				<%= Util.formatCustomDate(currUser.getE01DTF(),	msgRcd.getBigDecimalE02IFIMDM().intValue(),
					     				  msgRcd.getBigDecimalE02IFIMDD().intValue(), msgRcd.getBigDecimalE02IFIMDY().intValue())%>
			</td>
			<td NOWRAP align="center" width="10%" ><%= msgRcd.getE02IFIRPN() %></td>
			<td NOWRAP align="left" width="40%" ><%= msgRcd.getE02IFILID() %></td>
			
			<%String type = (msgRcd.getE02IFITIN().equals("IFG")?"GENERAL":"DETALLADO"); 
					 type = (msgRcd.getE02IFITIN().equals("IFF")?"FISCAL":type);
			%>
			<td NOWRAP align="center" width="25%" ><%=type%></td>
			<td NOWRAP align="center" width="10%" >
			<%= Util.formatCustomDate(currUser.getE01DTF(),	msgRcd.getBigDecimalE02IFIMDM().intValue(),
					     				  msgRcd.getBigDecimalE02IFIMDD().intValue(), msgRcd.getBigDecimalE02IFIMDY().intValue() + 1)%>
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
		int screen = 11;
		String parm = "?SCREEN=" + screen;
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
