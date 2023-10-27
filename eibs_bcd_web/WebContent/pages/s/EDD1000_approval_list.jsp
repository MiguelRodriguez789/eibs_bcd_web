<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Approval List Account </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"  scope="session" />
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

  	function goApproval(op) {
  		if( getElementChecked("ACCNUM") != null){
			document.getElementById("action").value = "A";
			document.forms[0].submit();
			
  		} else {
			alert("Debe seleccionar un registro.");
  		}			
  	}

  	function goAction(op) {
    	var op2 = '';
     	if (op == 'Z') {op2 = 'A';} else {op2 = op;}
     
     	document.getElementById("action").value = op2;
     	document.getElementById("reason").value = reason;
     	
  		if( getElementChecked("ACCNUM") != null){
		 	if (op == 'D') {
	    		if (confirm("Desea eliminar este registro seleccionado?")) {
					document.forms[0].submit();		
	    		}
	    	} else if (op == 'R'){
	    		if (confirm("Desea rechazar este registro seleccionado?")) {
					document.forms[0].submit();		
	    		}
	  		} else if (op == 'Z') {
	  			if (confirm("Desea aprobar este registro seleccionado?")) {
					document.forms[0].submit();		
	    		}
			}  
	        
	        if (op == 'A') {
	        	if (accOfac.trim() != "") {
	            	var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accOfac + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
		     		CenterWindow(page, 600, 500, 2);
	        	} else if (accWarn.trim() != "") {
	   		 		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accWarn+"&APP=1";
	 	        	CenterWindow(page, 420, 300, 2);
	        	} else {
	        		document.forms[0].submit();
	        	}
	        }
	        
  		} else {
			alert("Debe seleccionar un registro.");
  		}
 	}
  
 	function goExit(){
    	window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  	}

	function showAddInfo(idxRow) {
   		if (getElement("STSOFAC"+idxRow).value == "3") {
            accOfac = getElementChecked("ACCNUM").value;
   		} else {
      		accOfac = "";
   		}
   		
   		if (getElement("STSWARN"+idxRow).value == "A") {
        	accWarn = getElementChecked("ACCNUM").value;
   		} else {
      		accWarn = "";
   		}

   		document.getElementById("tbAddInfo").rows[0].cells[1].style.color = "#d0122c";
   		document.getElementById("tbAddInfo").rows[0].cells[1].innerHTML = getElement("TXTDATA"+idxRow).value;
  
   		for ( var i=0; i<document.getElementById("dataTable").rows.length; i++ ) {
       		document.getElementById("dataTable").rows[i].className = "trnormal";
    	}
 
   		document.getElementById("dataTable").rows[idxRow].className = "trhighlight";
  	}   

 	function showInqOFAC(fieldValue) {
		var formLength = document.forms[0].elements.length;
   		for (n=0; n<formLength; n++) {
      		var elementName = document.forms[0].elements[n].name;
      		var elementValue= document.forms[0].elements[n].value;
      		if (elementName == "ACCNUM" && elementValue == fieldValue) {
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
		CenterWindow(page, 600, 500, 2);    
 	}

	function showInqWarn(fieldValue) {
		var formLength = document.forms[0].elements.length;
   		for (n=0; n<formLength; n++) {
      		var elementName = document.forms[0].elements[n].name;
      		var elementValue= document.forms[0].elements[n].value;
      		if(elementName == "ACCNUM" && elementValue == fieldValue) {
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
		CenterWindow(page, 420, 300, 2);    
	}

</script>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1000" >
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" id="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" id="reason">
<INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="<%=appList.getLastRec()%>">
 <h3 align="center">
  Aprobación de 
<%
 	if (userPO.getOption().equals("RT")) {
 %>
		          Cuentas Corrientes
		  			<INPUT TYPE=HIDDEN NAME="appCode" id="appCode" VALUE="RT">
		<%
			}
			if (userPO.getOption().equals("CP")) {
		%>
		          Cuotas de Participacion
		  			<INPUT TYPE=HIDDEN NAME="appCode" id="appCode" VALUE="06">
			<%
				}

				if (userPO.getOption().equals("SV")) {
			%>
		         	Cuentas de Ahorro
		  			<INPUT TYPE=HIDDEN NAME="appCode" id="appCode" VALUE="04">
			<%
				}
			%>
 	</h3>
   <hr size="4">
   <TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval"><b>Aprobar</b></a></div>
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
  
 <TABLE  id="mainTable" class="tableinfo" height="70%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="100%">
			    <TR id="trdark">  
			      <TH ALIGN=CENTER rowspan="2" nowrap width="5%">&nbsp;</TH>
			      <TH ALIGN=CENTER rowspan="2" nowrap width="20%">Cuenta</TH>
			      <TH ALIGN=CENTER colspan="2" nowrap width="55%">Cliente</TH>
			      <TH ALIGN=CENTER rowspan="2" nowrap width="20%">C&oacute;digo <br> Producto</TH>
			    </TR>
			    <TR id="trdark">  
			      <TH ALIGN=CENTER nowrap width="15%">Numero</TH>
			      <TH ALIGN=CENTER nowrap width="40%">Nombre</TH>
			    </TR>
		   </TABLE>
  		<TD nowrap ALIGN="RIGHT" valign="top" width="20%">
	        <Table id="tbAddInfoH"  width="100%" >
	        <tr id="trdark">
	            <TH ALIGN=CENTER nowrap rowspan="2"> Informaci&oacute;n B&aacute;sica</TH>
	        </tr>
	        <TR id="trdark"></TR>  
	      	</Table>
  		</TD>
  	</TR>	
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
			  	<div id="dataDiv1" style="height:400px; overflow:auto;">  
				<table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
				<%
					appList.initRow();
					while (appList.getNextRow()) {
						out.println(appList.getRecord());
					}
				%>
				
				</table>
				</div>

  	</TD>
   	<TD nowrap ALIGN="RIGHT" valign="top">
     <Table id="tbAddInfo" width="100%">
      <tr id="trclear" >
         <TD  ALIGN="RIGHT"  nowrap ><b>Comentario : <br>Monto : <br>Moneda : <br>Banco : <br>Sucursal : <br>Cuenta Contable : <br>Centro de Costo : <br>Lote :<br>Operador : </b></TD>
         <TD ALIGN="LEFT" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>

  </TD>
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
  	showChecked("ACCNUM");
</SCRIPT>

</FORM>

</BODY>
</HTML>
