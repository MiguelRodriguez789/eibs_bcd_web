<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Lista de Cuentas a Aprobar</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>

<SCRIPT type="text/javascript">
 	var reason = '';
 	var accOfac = '';
 	var accWarn = '';

 	function goLetterDetail(op, flag, typ, accnum){
 		clickElement("ACCNUM_TEMP", accnum);
 	 	
 		if (op == "V") {
			document.forms[0].E01LCMOPT.value = flag;
			document.forms[0].E01LCMTYP.value = typ;
			document.forms[0].E01LCMACC.value = accnum;
	    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525?SCREEN=5&E01LCMACC=" + accnum + "&E01LCMTYP=" + typ + "&E01LCMOPT=" + flag + "&userPOKey=CC";
	    	CenterNamedWindow(page, 'inquiry', 750, 650, 2);			
 		}
 	}

 	function goAction(op) {
		document.forms[0].reason.value = reason;
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
 		var account = letterOfCreditForm.E01LCTNLC.value != "0" ? letterOfCreditForm.E01LCTNLC.value : letterOfCreditForm.E01LCMACC.value;
    	if (account !== "") {
   		    var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=8&TRANSREFNUM=" + account;
 	        CenterWindow(page, 420, 300, 2);
     	}
 	}
 
	function showInqWarn(fieldValue){
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
        CenterWindow(page, 420, 300, 2);
 	}

 	function showAddInfo(value, idxRow, transf) {
 		document.forms[0].E01LCMACC.value = value; 
 		document.forms[0].E01LCTNLC.value = transf; 
   		getElement("tbAddInfo").rows[0].cells[1].style.color = "#d0122c";   
   		getElement("tbAddInfo").rows[0].cells[1].innerHTML = extraInfo(getElement("TXTDATA"+idxRow).value,9);   
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

<FORM name="letterOfCreditForm" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525">
	<INPUT TYPE=HIDDEN NAME="E01LCMACC" value="">	
	<INPUT TYPE=HIDDEN NAME="E01LCTNLC" value="">	
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
	<INPUT TYPE=HIDDEN NAME="E01LCMOPT" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01LCMTYP" VALUE="">
	<INPUT TYPE=HIDDEN NAME="reason">
	<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="nivAp" VALUE="<%= userPO.getHeader10().trim() %>">
	<H3 align="center">
		Aprobacion de Aperturas y Enmiendas 
		<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ELC0525_approval_letter_of_credit_list.jsp">
	</H3>
	<HR size="4">
    
	<TABLE class="tbenter" width="100%">
		<TR> 
			<TD width="17%" class=TDBKG> 
				<DIV align="center"><A name="linkApproval" href="javascript:goAction('A')"><B>Aprobar</B></A></DIV>
		  </TD>
			<TD width="17%" class=TDBKG> 
				<DIV align="center"><A name="linkDelete" href="javascript:enterReason('D', '40')"><B>Eliminar</B></A></DIV>
		  </TD>
			<TD width="17%" class=TDBKG> 
				<DIV align="center"><A name="linkReject" href="javascript:enterReason('R', '40')"><B>Rechazar</B></A></DIV>
		  </TD>
			<TD width="17%" class=TDBKG> 
				<DIV align="center"><A href="javascript:goMsgSwift()"><B>Mensaje<BR>
			  SWIFT</B></A></DIV>
		  </TD>
			<TD width="15%" class=TDBKG> 
				<DIV align="center"><A href="javascript:checkClose()"><B>Salir</B></A></DIV>
		  </TD>  
	  </TR>
	</TABLE>
  
 <TABLE  id="mainTable" class="tableinfo">
 <tr height="5%">
	<td NOWRAP valign="top" width="80%">
  		<TABLE id="headTable" width="100%" >
			<TR id="trdark"> 
				<TH width="5%" ALIGN=CENTER nowrap></TH>
				<TH width="15%" ALIGN=CENTER nowrap>Carta de Credito</TH>
				<TH width="30%" ALIGN=CENTER nowrap>Nombre</TH>						
				<TH width="10%" ALIGN=CENTER nowrap>Producto</TH>
				<TH width="10%" ALIGN=CENTER nowrap>Moneda</TH>
				<TH width="15%" ALIGN=CENTER nowrap>Monto</TH>
				<TH width="15%" ALIGN=CENTER nowrap>Comentario</TH>						
			</TR>
		</TABLE>
	</td>		
   	<TD nowrap ALIGN="RIGHT" valign="top" width="20%">
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Información Básica</TH>
        </tr>
      </Table>
	</TD> 
</tr>	 
 <tr height="95%">
	<td NOWRAP valign="top" width="80%">
		<div id="dataDiv1" style="height:200; overflow:auto;">  
			<table id=dataTable cellspacing="0" cellpadding="0" border="0" width="100%" >
						<%
					       	int k=0;
					        jbList.initRow(); 
							boolean firstTime = true;
							String chk = "";
					        while (jbList.getNextRow()) {
								if (firstTime) {
									firstTime = false;
									chk = "checked";
								} else {
									chk = "";
								}
					           ELC052501Message msgPart = (ELC052501Message) jbList.getRecord();
					    %>               
						        <TR>
									<TD width="5%" NOWRAP ALIGN="CENTER"><INPUT type="radio" name="ACCNUM_TEMP" value="<%=msgPart.getE01LCMACC()%>" onClick="showAddInfo(this.value, <%=k%>, '<%=msgPart.getE01LCTNLC()%>'); highlightRow('dataTable', <%= jbList.getCurrentRow() %>)""></TD>
									<TD width="15%" NOWRAP ALIGN="CENTER"><A   href="javascript:goLetterDetail('V','<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMACC())%></A>
										<%if(msgPart.getH01FLGWK2().equals("A")){%>
											<a href="javascript:showInqWarn('<%=msgPart.getE01LCMACC()%>')"><img src="<%=request.getContextPath()%>/images/warning01.gif" title="Warnings" align="middle" border="0" ></a> <%} %></TD>
									<TD width="30%" NOWRAP ALIGN="LEFT"><A href="javascript:goLetterDetail('V','<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01CUSNA1())%></A></TD>
									<TD width="10%" NOWRAP ALIGN="CENTER"><A href="javascript:goLetterDetail('V','<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMPRO())%></A></TD>
									<TD width="10%" NOWRAP ALIGN="CENTER"><A href="javascript:goLetterDetail('V','<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMCCY())%></A></TD>									
									<TD width="15%" NOWRAP ALIGN="center"><A href="javascript:goLetterDetail('V','<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01LCMAMN())%></A></TD>									
									<TD width="15%" ALIGN="center"><A href="javascript:goLetterDetail('V','<%=msgPart.getE01LCMOPT()%>','<%=msgPart.getE01LCMTYP()%>','<%=msgPart.getE01LCMACC()%>');"><%=Util.formatCell(msgPart.getE01REMARK())%></A>
									<%
										String ls = "";
										ls = ls + Util.formatCell(msgPart.getE01REMARK()) + "<br>";
										ls = ls + Util.fcolorCCY(msgPart.getE01LCMCCY())  + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMAMN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMBNK()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMBRN()) + "<br>";
										ls = ls + Util.formatCell(msgPart.getE01LCMGLN()) + "<br>";
										ls = ls + Util.formatCustomDate(currUser.getE01DTF(), msgPart.getE01LCMOPM(),msgPart.getE01LCMOPD(),msgPart.getE01LCMOPY()) + "<br>";
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
   		<TD nowrap ALIGN="RIGHT" valign="top" width="20%">
				<Table id="tbAddInfo" >
					<TR id="trclear">
						<TD ALIGN="RIGHT" nowrap><B>Comentario : <BR>
							Moneda : <BR>
							Monto : <BR>
							Banco : <BR>
							Sucursal : <BR>
							Cuenta Contable : <BR>
							Fecha de Ingreso : <BR>
							Lote :<BR>
							Operador : 
						</B></TD>
						<TD ALIGN="LEFT" nowrap class="tdaddinfo"></TD>
					</TR>
				</Table>
			</TD>
		</TR>	
	</TABLE>

	<SCRIPT type="text/javascript">
	document.forms[0].totalRow.value="<%=k%>";
  
  	function resizeDoc() {
    	divResize(true);
   		adjustEquTables(getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"), 1, false, ".78");
  	}
  	radioClick("ACCNUM_TEMP", 0);
  	resizeDoc();
  	getElement("tbAddInfoH").rows[0].cells[0].height = getElement("headTable").rows[0].cells[0].clientHeight;
  	window.onresize = resizeDoc;
	</SCRIPT>


</FORM>
</BODY>
</HTML>
