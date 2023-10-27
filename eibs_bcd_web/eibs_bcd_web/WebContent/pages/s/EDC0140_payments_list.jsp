<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Lista de Cuentas a Aprobar
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
	var reason = "";
 	var accOfac = '';
 	var accWarn = '';

 	function goCollectionDetail(apc, accnum, seq, prinum){
    	var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.approval.JSEDC0140?SCREEN=7&E01DCMACD="+apc+"&E01DCMACC="+accnum+"&E01PMTNUM="+seq+"&E01PRINUM="+prinum;
 		CenterWindow(page, 920, 600, 2);
 	}

 	function goAction(op) {
 		document.forms[0].reason.value = reason;
		getElement("E02ACTION").value = op;
		document.forms[0].submit();
 	}

 	function SelectReg(fld1, fld2, fld3){
    	document.forms[0].E01DCMACC.value = fld1;
    	document.forms[0].E01PMTNUM.value = fld2;
    	document.forms[0].E01PRINUM.value = fld3;
 	} 
 
	function FValidateControlF(control) {
		var cl;
  		var checked = false;
  		cl = control.length;
  		for (var i=0; i<cl; i++) {
    		if (control[i].checked) {
      			facc = control[i].value;
      			checked = true;
      			break;
    		}
  		}
  		if (cl == undefined) {
    		facc = control.value;
    		checked = true;
  		}  
  		return checked;
	}
 
	function goMsgSwift(opt) {    
		if (!FValidateControlF(document.forms[0].E01DCMACC)){
      		alert("Seleccione una cuenta ");
   		} else {
      		var FldPar = "TRANSREFNUM=";
	    	if (opt=="A") {
	        	FldPar += document.forms[0].E01DCMACC.value ;
	    	} else {
	        	FldPar += document.forms[0].E01PRINUM.value ;
	    	}
	       
	   		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=8&" + FldPar;
 			CenterWindow(page, 820, 600, 2);
    	}    
	}

	function updateRow(table, idx, acc, num, pri) {
		highlightRow(table, idx);
		SelectReg(acc, num, pri);
	}

</SCRIPT>
</HEAD>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<H3 align="center">Aprobación de Pago/Liquidación
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="payments_list.jsp, EDC0140">
</H3>
<HR size="4">
    
<FORM name="letterOfCreditForm" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDC0140">
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="9">
	<INPUT TYPE=HIDDEN NAME="E02ACTION" id="E02ACTION" value="">	
	<input type=HIDDEN name="E01DCMACC" id="E01DCMACC" value="">
	<input type=HIDDEN name="E01PMTNUM" id="E01PMTNUM" value="">
	<input type=HIDDEN name="E01PRINUM" id="E01PRINUM" value="">
	<INPUT TYPE=HIDDEN NAME="reason">


<%  if (appList.isEmpty()) { %>
  		<p>&nbsp;</p>
  		<TABLE class="tbenter" width="100%" >
    		<TR>
      			<TD><div align="center"><p><b>No hay resultados para su b&uacute;squeda</b></p></div></TD>
			</TR>
    	</TABLE>
<%  } else { %> 
	<TABLE class="tbenter" width="100%" style="width: 1040px">
		<TR> 
			<TD width="25%" class=TDBKG> 
				<DIV align="center"><A id="linkApproval" href="javascript:goAction('A')"><B>Aprobar</B></A></DIV>
		  </TD>
			<TD width="17%" class=TDBKG> 
				<DIV align="center"><A id="linkDelete" href="javascript:enterReason('D')"><B>Eliminar</B></A></DIV>
		  </TD>
			<TD width="17%" class=TDBKG> 
				<DIV align="center"><A id="linkReject" href="javascript:enterReason('R')"><B>Rechazar</B></A></DIV>
		  </TD>
		  <TD width="17%" class=TDBKG> 
				<DIV align="center"><A href="javascript:goMsgSwift('A')"><B>Mensaje<BR>
			  SWIFT</B></A></DIV>
		  </TD>
		  <TD width="17%" class=TDBKG> 
				<DIV align="center"><A href="javascript:goMsgSwift('B')"><B>Transferencia<BR>SWIFT</B></A></DIV>
		  </TD>		  
		  <TD width="15%" class=TDBKG> 
				<DIV align="center"><A href="<%=request.getContextPath()%>/pages/background.jsp"><B>Salir</B></A></DIV>
		  </TD>  
	  </TR>
	</TABLE>
	
	<TABLE  id="mainTable" class="tableinfo" width="100%">
		<tr height="5%">
			<td NOWRAP valign="top" width="100%">
				<TABLE id="headTable" width="100%">
		        	<tr id="trdark">
						<TH ALIGN=CENTER nowrap width="5%">&nbsp;</TH>
						<TH ALIGN=CENTER nowrap width="10%">Cobranza</TH>
						<TH ALIGN=CENTER nowrap width="5%">Nro.</TH>
						<TH ALIGN=CENTER nowrap width="35%">Cliente</TH>						
						<TH ALIGN=CENTER nowrap width="15%">Monto</TH>
						<TH ALIGN=CENTER nowrap width="10%">Tipo</TH>		
						<TH ALIGN=CENTER nowrap width="10%">Fecha</TH>
						<TH ALIGN=CENTER nowrap width="10%">Usuario</TH>									
		        	</tr>
		        </TABLE>
		    </td>
		</tr>
		<tr height="95%">
			<td NOWRAP valign="top" width="100%">
				<div id="dataDiv1" style="height:70% overflow:auto;">
					<table id=dataTable width="100%">
<%
						appList.initRow();
						while (appList.getNextRow()) {
							EDC014001Message msgPart = (EDC014001Message) appList.getRecord();
%>    
							<tr id="dataTable<%= appList.getCurrentRow() %>"> 
						    	<td NOWRAP align=CENTER width="5%">
						    		<input class="highlight" type="radio" name="ITEM" value="<%= appList.getCurrentRow() %>" 
						            	onClick="updateRow('dataTable',<%=appList.getCurrentRow()%>,'<%=msgPart.getE01DCMACC()%>','<%=msgPart.getE01PMTNUM()%>','<%=msgPart.getE01PRINUM()%>');" >
						        </td>
								<TD NOWRAP ALIGN="CENTER" width="10%"><A href="javascript:goCollectionDetail('<%= msgPart.getE01DCMACD() %>','<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>','<%= msgPart.getE01PRINUM() %>');"><%=Util.formatCell(msgPart.getE01DCMACC())%></A></TD>
								<TD NOWRAP ALIGN="CENTER" width="5%"><A href="javascript:goCollectionDetail('<%= msgPart.getE01DCMACD() %>','<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>','<%= msgPart.getE01PRINUM() %>');"><%=Util.formatCell(msgPart.getE01PMTNUM())%></A></TD>
								<TD NOWRAP ALIGN="LEFT" width="35%"><A href="javascript:goCollectionDetail('<%= msgPart.getE01DCMACD() %>','<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>','<%= msgPart.getE01PRINUM() %>');"><%=Util.formatCell(msgPart.getE01CUSNA1())%></A></TD>
								<TD NOWRAP ALIGN="RIGHT" width="15%"><A href="javascript:goCollectionDetail('<%= msgPart.getE01DCMACD() %>','<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>','<%= msgPart.getE01PRINUM() %>');"><%=Util.formatCell(msgPart.getE01MNTPAG())%></A></TD>									
								<TD NOWRAP ALIGN="CENTER" width="10%"><A href="javascript:goCollectionDetail('<%= msgPart.getE01DCMACD() %>','<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>','<%= msgPart.getE01PRINUM() %>');"><%=Util.formatCell(msgPart.getE01DSCOPE())%></A></TD>									
								<TD NOWRAP ALIGN="CENTER" width="10%"><A href="javascript:goCollectionDetail('<%= msgPart.getE01DCMACD() %>','<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>','<%= msgPart.getE01PRINUM() %>');"><%=Util.formatCustomDate("DMY", "dd-MMMM-yyyy", "s", msgPart.getE01DATEDD(), msgPart.getE01DATEMM(), msgPart.getE01DATEYY())%></A></TD>									
								<TD NOWRAP ALIGN="CENTER" width="10%"><A href="javascript:goCollectionDetail('<%= msgPart.getE01DCMACD() %>','<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>','<%= msgPart.getE01PRINUM() %>');"><%=Util.formatCell(msgPart.getH01USERID())%></A></TD>									
							</tr>           
<%						
						}	 
%>						
					</table>
				</div>
			</td>
		</tr>			
	</TABLE>	      	 

	<SCRIPT type="text/javascript">
	 	radioClick("ITEM", 0);
	</SCRIPT>

<%	} %>		


</FORM>
</BODY>
</HTML>
