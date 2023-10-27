<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Lista de Cuentas a Aprobar</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
 	var reason = '';
 	var accOfac = '';
 	var accWarn = '';

 	function goLetterDetail(op, flag, accnum){
 		if (op == "V") {
			document.forms[0].SCREEN.value = "5";
			document.forms[0].H01FLGWK3.value = flag;
			document.forms[0].E01LCMACC.value = accnum;
			document.forms[0].submit();
 		}
 	}

 	function goAction(op) {
		if(op == "A") {
			document.forms[0].SCREEN.value = 1;
			document.forms[0].submit();		 
		} else if(op == "D") {
			document.forms[0].SCREEN.value = 2;
			document.forms[0].submit();
		} else if(op == "R") {
			document.forms[0].SCREEN.value = 4;
			document.forms[0].submit();
		} else if(op == "M") {
			document.forms[0].SCREEN.value = 0;
			document.forms[0].submit();
		}
 	}

 	function goMsgSwift() {
    	if (letterOfCreditForm.E01LCMACC.value !== "") {
			var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525?SCREEN=0&E01LCMACC="+letterOfCreditForm.E01LCMACC.value;
 	        CenterWindow(page, 420, 300, 2);
     	}
 	}



 	function showAddInfo(value, idxRow) {
 		document.forms[0].E01LCMACC.value = value; 
   		document.getElementById("tbAddInfo").rows[0].cells[1].style.color = "#d0122c";   
   		document.getElementById("tbAddInfo").rows[0].cells[1].innerHTML = extraInfo(getElement("TXTDATA"+idxRow).value,9);   
  	}   
  
 	function extraInfo(textfields, noField) {
 		var pos = 0;
 		var s = textfields;
 		for (var i=0; i<noField ; i++ ) {
   			pos = textfields.indexOf("<br>", pos+1);
  		}
 		s = textfields.substring(0, pos);
 		return(s);
 	}
 
</script>


</HEAD>

<BODY>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
%>

<FORM name="letterOfCreditForm" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525">
	<INPUT TYPE=HIDDEN NAME="E01LCMACC" value="">	
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
	<INPUT TYPE=HIDDEN NAME="H01FLGWK3" VALUE="">	
	<INPUT TYPE=HIDDEN NAME="reason">
	<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
	<h3 align="center">
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="approva_lletter_of_credit_list.jsp,ELC0525">
	</h3>
	<hr size="4">
    
	<TABLE class="tbenter">
		<TR> 
			<TD class=TDBKG> 
				<div align="center"><a name="linkApproval" href="javascript:goAction('A')"><b>Aprobar</b></a></div>
			</TD>
			<TD class=TDBKG> 
				<div align="center"><a name="linkDelete" href="javascript:enterReason('D', '40')"><b>Eliminar</b></a></div>
			</TD>
			<TD class=TDBKG> 
				<div align="center"><a name="linkReject" href="javascript:enterReason('R', '40')"><b>Rechazar</b></a></div>
			</TD>
			<TD class=TDBKG> 
				<div align="center"><a href="javascript:goMsgSwift()"><b>Mensaje<BR>SWIFT</b></a></div>
			</TD>
			<TD class=TDBKG> 
				<div align="center"><a href="javascript:checkClose()"><b>Salir</b></a></div>
			</TD>  
			</TR>
	</TABLE>
  
 <TABLE  id="mainTable" class="tableinfo" height="70%">
 <tr height="5%">
	<td NOWRAP valign="top" width="70%">
  		<TABLE id="headTable" width="95%" >
			<TR id="trdark"> 
				<TH ALIGN=CENTER nowrap></TH>
				<TH ALIGN=CENTER nowrap>Cuenta</TH>
				<TH ALIGN=CENTER nowrap>Nombre</TH>						
				<TH ALIGN=CENTER nowrap>Producto</TH>
				<TH ALIGN=CENTER nowrap>Moneda</TH>
				<TH ALIGN=CENTER nowrap>Monto</TH>
				<TH ALIGN=CENTER nowrap>Comentario</TH>						
			</TR>
		</TABLE>
	</td>		
   	<TD nowrap ALIGN="RIGHT" valign="top" width="30%">
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Información Básica</TH>
        </tr>
      </Table>
	</TD>  
 <tr height="95%">
	<td NOWRAP valign="top" width="70%">
		<div id="dataDiv1" style="height:70% overflow:auto;">  
			<table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
						<%
					       	int k=0;
					        appList.initRow(); 
							boolean firstTime = true;
							String chk = "";
					        while (appList.getNextRow()) {
								if (firstTime) {
									firstTime = false;
									chk = "checked";
								} else {
									chk = "";
								}
					           ELC052501Message msgPart = (ELC052501Message) appList.getRecord();
					    %>               
						        <TR>
									<TD NOWRAP ><input type="radio" name="ACCNUM_TEMP" value="<%=msgPart.getE01LCMACC()%>" onclick="showAddInfo(this.value, <%=k%>);" <%=chk%>></TD>
									<TD NOWRAP ALIGN="LEFT"><a href="javascript:goLetterDetail('V','<%=msgPart.getH01FLGWK3()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMACC())%></a></TD>
									<TD NOWRAP ALIGN="CENTER"><a href="javascript:goLetterDetail('V','<%=msgPart.getH01FLGWK3()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01CUSNA1())%></a></TD>
									<TD NOWRAP ALIGN="CENTER"><a href="javascript:goLetterDetail('V','<%=msgPart.getH01FLGWK3()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMPRO())%></a></TD>
									<TD NOWRAP ALIGN="CENTER"><a href="javascript:goLetterDetail('V','<%=msgPart.getH01FLGWK3()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMCCY())%></a></TD>									
									<TD NOWRAP ALIGN="CENTER"><a href="javascript:goLetterDetail('V','<%=msgPart.getH01FLGWK3()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMAMN())%></a></TD>									
									<TD NOWRAP ALIGN="CENTER"><a href="javascript:goLetterDetail('V','<%=msgPart.getH01FLGWK3()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01REMARK())%></a>
									<%
										String ls = "";
										ls = ls + Util.formatCell(msgPart.getE01REMARK()) + "<br>";
										ls = ls + Util.fcolorCCY(msgPart.getE01LCMCCY())  + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMAMN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMBNK()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMBRN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMGLN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMCCN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMUBT()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMOPR()) + "<br>";
									%>
										<INPUT TYPE="HIDDEN" NAME="TXTDATA<%=k%>" value="<%=ls%>">
									</TD>
								</TR>    		
				    	<%
				    			k++;
				    		}
				    	%>    
				</TABLE>
			</div>
			</TD>	
   		<TD nowrap ALIGN="RIGHT" valign="top" width="30%">
				<Table id="tbAddInfo" >
					<tr id="trclear">
						<TD ALIGN="RIGHT" align="center" nowrap><b>Comentario : <br>Moneda : <br>Monto : <br>Banco : <br>Sucursal : <br>Cuenta Contable : <br>Centro de Costo : <br>Lote :<br>Operador : </b></TD>
						<TD ALIGN="LEFT" align="center" nowrap class="tdaddinfo"></TD>
					</tr>
				</Table>
			</TD>
		</TR>	
	</TABLE>

<SCRIPT type="text/javascript">
	document.forms[0].totalRow.value="<%=k%>";
  
  	function resizeDoc() {
    	divResize(true);
   		adjustDifTables(document.getElementById("headTable"), document.getElementById("dataTable"), document.getElementById("dataDiv1"), 2, true);
  	}
  	radioClick("ACCNUM_TEMP", 0);
  	resizeDoc();
  	document.getElementById("tbAddInfoH").rows[0].cells[0].height = document.getElementById("headTable").rows[0].cells[0].clientHeight;
  	window.onresize = resizeDoc;
</SCRIPT>


</FORM>

</BODY>
</HTML>
