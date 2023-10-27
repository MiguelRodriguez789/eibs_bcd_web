<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="datapro.eibs.beans.EGL134001Message"%>
<HTML>
<HEAD>
<TITLE> Approval List Account </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "EGL1340GLList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<%
	if (!error.getERRNUM().equals("0")) {
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<script type="text/javascript">

  	var reason = '';
  	var accOfac = '';
  	var accWarn = '';

  	function goApproval() {
		getElement("pAction").value = 'A';
		document.forms[0].submit();
  	}

  	function goAction(op) {
    	var op2 = op == 'Z' ? op2 = 'A' : op2 = op;
     	getElement("pAction").value = op2;
     	getElement("reason").value = reason;
     	
	 	if (op == 'D') {
    		if (confirm("Desea eliminar este registro seleccionado?")) {
				document.forms[0].submit();		
    		}
  		} else if (op == 'Z') {
  			if (confirm("Desea aprobar este registro seleccionado?")) {
				document.forms[0].submit();		
    		}
		} else if (op == 'A' || op == 'R') {
        	document.forms[0].submit();
        }
 	}
  
 	function goInq( row ){
		clickElement("ROW", row);
 		highlightRow('mainTable', row);
		var page = document.getElementById("f1").action + "?SCREEN=200&ROW=" + row ;
		CenterWindow(page, 600, 500, 2);    
  	} 	
 
  	function goExit() {
  		window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  	}	
</script>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">
<FORM id="f1" Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL1340" >
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="300">
<INPUT TYPE=HIDDEN NAME="pAction" id="pAction" VALUE="">
<INPUT TYPE=HIDDEN NAME="reason" id="reason">

<h3 align="center"> Aprobación de Cuentas Contables</h3>

<hr size="4">

<%	 
	if ( EGL1340GLList.getNoResult() ) {
%>
	<TABLE class="tbenter" width="100%"> 
		<TR>
	  		<TD align="center" class="TDBKG" width="50%" nowrap><a href="javascript:checkClose()"><b>Salir</b></a></TD>
		</TR>
 		<TR>
      		<TD>         
      			<div align="center"> <h4 style="text-align:center">No hay registros que mostrar para ser borrados.</h4></div>
      		</TD>
      	</TR>
   	</TABLE>
<%
	} else {
%>    
<TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goApproval('A')" id="linkApproval"><b>Aprobar</b></a></div>
      </TD>
    <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')" id="linkDelete"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:enterReason('R')" id="linkReject"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goExit()" id="linkExit"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>
   
 <TABLE  id="mainTable" class="tableinfo"  >
 	<TR class="trdark" > 
	      <TH ALIGN=CENTER  nowrap width="5%">&nbsp;</TH>
	      <TH ALIGN=CENTER  nowrap >Cuenta</TH>
	      <TH ALIGN=CENTER  nowrap >Moneda</TH>
	      <TH ALIGN=CENTER  nowrap >Descripción</TH>
	</TR>

	<%
    	  int i = 0;
		  EGL1340GLList.initRow();    
          while (EGL1340GLList.getNextRow()) {
            	EGL134001Message msgList = (EGL134001Message) EGL1340GLList.getRecord();
	%>  

			<tr class="trclear" >
				<td NOWRAP align="center" width="2%"><INPUT type="radio" name="ROW" id="ROW" value="<%=EGL1340GLList.getCurrentRow() %>" ></td>
				<td NOWRAP align="center"  > <a href="#" onclick="goInq( <%=EGL1340GLList.getCurrentRow() %> );" > <%= msgList.getE01GLMGLN() %> </a> </td>
				<td NOWRAP align="center"  ><%= msgList.getE01GLMCCY() %> </td>
				<td NOWRAP align="center"  ><%= msgList.getE01GLMDSC() %> </td>
			</tr>
				
	<%
			i++;
		}
    %>

	
</TABLE>


<SCRIPT type="text/javascript">
  	radioClick("ROW", 0);
</SCRIPT>

<%	}  %>    


</FORM>

</BODY>
</HTML>
