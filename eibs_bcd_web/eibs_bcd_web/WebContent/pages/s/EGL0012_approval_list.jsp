<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>  Lista de Lotes a Aprobar </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"    scope="session" />
<jsp:useBean id= "error"  class= "datapro.eibs.beans.ELEERRMessage"    scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
	var reason = '';
 
  	function goAction(op) {
    	document.getElementById("action").value = op;
     	document.getElementById("reason").value = reason;
     	var form = document.forms[0];
     	var formLength = form.elements.length;
     	var ok = false;
     	for (n=0; n<formLength; n++) {
      		var elementName = form.elements[n].name;
      		if (elementName == "BTHNUM") {
        		ok = true;
        		break;
      		}
      	}
	  	if ( ok ) {
          	form.submit();
     	} else {
			alert(" Seleccione un lote antes de realizar esta operación");	   
     	}
 	}  
 
 	function goExit() {
  		window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  	}  
  
 	function showAddInfo(idxRow) {
   		for ( var i=0; i<document.getElementById("dataTable").rows.length; i++ ) {
       		document.getElementById("dataTable").rows[i].className = "trnormal";
    	}
   		document.getElementById("dataTable").rows[idxRow].className = "trhighlight";
  	}
  	   
	function showInqApprovalBatch(batch, bank, branch) {
   		var pg = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEGL0035I?SCREEN=200&BATCH=" + batch + "&BANK=" + bank + "&BRANCH=" + branch;
   		CenterWindow(pg, 650, 500, 2);
	}
</script>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0"); 
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	}
%>

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0012" >
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" id="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" id="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="<%=appList.getLastRec()%>">

<h3 align="center">Aprobación de Lotes Contables</h3>

  <hr size="4">  
 <TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:enterReason('R')" id="linkReject"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="34%"> 
        <div align="center"><a href="javascript:goExit()" id="linkExit"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>


<TABLE  id="mainTable" class="tableinfo">
 <TR height="5%"> 
    <TD NOWRAP valign="top" width="100%">
	  <TABLE id="headTable" width="100%">
	  <TR id="trdark">  
	      <TH ALIGN=CENTER nowrap width="10%">&nbsp;</TH>
	      <TH ALIGN=CENTER nowrap width="10%">Lote</TH>
	      <TH ALIGN=CENTER nowrap width="10%">Banco</TH>
	      <TH ALIGN=CENTER nowrap width="10%">Suc.</TH>
	      <TH ALIGN=CENTER nowrap width="10%">Fecha</TH>
	      <TH ALIGN=CENTER nowrap width="10%">Operador</TH>
	      <TH ALIGN=CENTER nowrap width="10%">Status</TH>
	      <TH ALIGN=CENTER nowrap width="10%">Total Debitos</TH>
	      <TH ALIGN=CENTER nowrap width="10%">Total Creditos</TH>
	      <TH ALIGN=CENTER nowrap width="10%">No.Trans.</TH>
	  </TR>
	  </TABLE>
  </TD>
  </TR>	
  <TR height="95%"> 
    <TD NOWRAP valign="top" width="100%">
  
   	<div id="dataDiv1" style=" height:400px; overflow:auto;">  
	<table id="dataTable" width="100%">
    <%
                appList.initRow();
                while (appList.getNextRow()) {
               		out.println(appList.getRecord());
                }
    %> 
   </table>
   </div>
   
  </TD>
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
	showChecked("BTHNUM");
</SCRIPT>

</FORM>

</BODY>
</HTML>
