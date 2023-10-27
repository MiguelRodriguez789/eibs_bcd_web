<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Source Documents</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0142List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

var ok = false;
 
function goNew() {
	document.getElementById("SCREEN").value="2"
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Beneficiario!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="3";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Beneficiario a borrar!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="4";
	if (!confirm("Desea borrar este Beneficiario?")) {
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
				document.getElementById("E01BPYBSQ").value = document.forms[0].elements[n].value;
				ok = true;
				break;
			}
      	}
    }
}

function setKey(seq) {
	document.getElementById("E01BPYBSQ").value = seq;
}

function goExit() {
    var pg = "";
 	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0140?SCREEN=2" + 
			"&E01REQBNK=<%=userPO.getBank()%>" +
			"&E01REQBRN=<%=userPO.getBranch()%>" +
			"&E01REQTYP=<%=userPO.getType()%>" +
			"&E01REQPVI=<%=userPO.getHeader1()%>" +
			"&E01REQDF1=<%=userPO.getHeader2()%>" +
			"&E01REQDF2=<%=userPO.getHeader3()%>" +
			"&E01REQDF3=<%=userPO.getHeader4()%>" +
			"&E01REQDT1=<%=userPO.getHeader5()%>" +
			"&E01REQDT2=<%=userPO.getHeader6()%>" +
			"&E01REQDT3=<%=userPO.getHeader7()%>";
	window.location.href=pg;
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

<h3 align="center">Beneficiarios para el pago de la Factura Nro. <%= userPO.getIdentifier().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="payment_beneficiary_list.jsp, EBP0142"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0142">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" VALUE="<%= userPO.getIdentifier() %>">
  <INPUT TYPE=HIDDEN NAME="E01BPYNUM" VALUE="<%= userPO.getIdentifier() %>">
  <INPUT TYPE=HIDDEN NAME="SEQUENCE" VALUE="<%= userPO.getProdCode() %>">
  <INPUT TYPE=HIDDEN NAME="E01BPYBSQ" VALUE="0">
  
<TABLE class="tbenter"> 
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Nuevo<br>Beneficiario</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Modificar<br>Beneficiario</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goDelete()"><b>Borrar<br>Beneficiario</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goExit()"><b>Salir</b></a>
	  	</TD>
	</TR>
<%	} else { %>
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Ver <br>Beneficiario</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0140?SCREEN=1"><b>Salir</b></a>
      	</TD>
	</TR>
<% 	} %>
</TABLE> 
 
<%	if ( EBP0142List.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Beneficiarios.</h4></div>
      </TD>
	</TR>
   	</TABLE>
<%
	}
	else 
	{
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>Numero Interno<BR>Pago</B></td>
		<td NOWRAP align="center" width="20%"><B>Secuencia<BR>Pago</B></td>
		<td NOWRAP align="center" width="15%"><B>Secuencia<BR>Beneficiario</B></td>
		<TD nowrap align="center" width="30%"><B>Nombre Beneficiario</B></TD>
		<TD nowrap align="center" width="10%"><B>Fecha<BR>Pago</B></TD>
		<TD nowrap align="center" width="10%"><B>Valor <BR>Pago</B></TD>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="10%"></td>
		<TD nowrap align="center" width="20%"></TD>
		<TD nowrap align="center" width="15%"></TD>
		<TD nowrap align="center" width="30%"></TD>
		<TD nowrap align="center" width="10%"></TD>
		<TD nowrap align="center" width="10%"></TD>
	</TR>

        <%
    	  int i = 0;
          EBP0142List.initRow();    
          while (EBP0142List.getNextRow()) {
            EBP014201Message msgList = (EBP014201Message) EBP0142List.getRecord();	
			
         %>              
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= msgList.getE01BPYBSQ()%>">
		</td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BPYNUM() %></td>
		<td NOWRAP align="center" width="20%" ><%= msgList.getE01BPYSEQ() %></td>
		<td NOWRAP align="center" width="15%" ><%= msgList.getE01BPYBSQ() %></td>
		<td NOWRAP align="left" width="30%" ><%= msgList.getE01BPYNM1() %></td>
		<td NOWRAP align="center" width="10%" ><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), msgList.getE01BPYPDM(),msgList.getE01BPYPDD(),msgList.getE01BPYPDY())%></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BPYAMT() %></td>

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
    	if ( EBP0142List.getShowPrev() ) {
  			int pos = EBP0142List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0142?SCREEN=1&DOCUMENTO=" + userPO.getProdCode() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EBP0142List.getShowNext()) {
  			int pos = EBP0142List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0142?SCREEN=1&DOCUMENTO=" + userPO.getProdCode() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EBP0142List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EBP0142List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
