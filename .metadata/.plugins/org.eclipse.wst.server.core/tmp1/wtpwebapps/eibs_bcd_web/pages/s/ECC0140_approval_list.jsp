<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Customer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script >

	var reason = '';
	var accOfac = '';
	var accWarn = '';

	function setbio(bio) {
		getElement("BIO").value =  bio;	
	}

	function goApproval() {
		document.forms[0].action.value = "A";
			document.forms[0].submit();
		}
		function goAction(op) {
		
		 var op2 = '';
		 if (op == 'Z') {op2 = 'A';} else {op2 = op;}
		 document.forms[0].action.value = op2;
		 document.forms[0].reason.value = reason;
		 
		 var formLength= document.forms[0].elements.length;
		 var ok = false;
		 for(var n=0;n<formLength;n++)
		 {
				var elementName= document.forms[0].elements[n].name;
				if(elementName == "ACCNUM") {
					if (document.forms[0].elements[n].checked == true) {
						ok = true;
						break;
					}	
				}
			}
			if ( ok ) {
					if (accOfac.trim() != "" && op != 'Z' && op != 'D') {

						 page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accOfac + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
	
			 CenterWindow(page,600,500,2);

					} else {
						if (accWarn.trim() != "" && op != 'D') {
			 page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accWarn+"&APP=1";
					CenterWindow(page,420,300,2);
						} else {
							document.forms[0].submit();
						}
					}
			}
			else {
		alert("Seleccione Una Cuenta Primero");	   
			}

	}
	
	function extraInfo(textfields,noField) {
		var pos=0
		var s= textfields;
		for ( var i=0; i<noField ; i++ ) {
			pos = textfields.indexOf("<br>",pos+1);
		}
		s = textfields.substring(0,pos);
		return(s);
	}
 
	function showAddInfo(idxRow){
		tbAddInfo.rows[0].cells[1].style.color="#d0122c";
		<% if (userPO.getOption().equals("CD")) { %>
		tbAddInfo.rows[0].cells[1].innerHTML=extraInfo(getElement("TXTDATA"+idxRow).value,11);
		<% } else { %>
		tbAddInfo.rows[0].cells[1].innerHTML=getElement("TXTDATA"+idxRow).value;
		<% } %>
		if (getElement("STSOFAC"+idxRow).value == "3") {
			var formLength = document.forms[0].elements.length;
			for (var n=0;n<formLength;n++){
				var elemt = document.forms[0].elements[n];
				if ( elemt.checked ) {
					accOfac=elemt.value;
					break;
				}
			}      
		} else {
			accOfac = "";
		}
		if (getElement("STSWARN"+idxRow).value == "A") {
			var formLength = document.forms[0].elements.length;
			for (var n=0;n<formLength;n++){
				var elemt = document.forms[0].elements[n];
				if ( elemt.checked ) {
					accWarn=elemt.value;
					break;
				}
			}      
		} else {
			accWarn = "";
	 }
	 dataTable.rows[idxRow].className="trhighlight";
	 adjustDifTables(headTable, dataTable, dataDiv1,2,1);
	}   

function showInqOFAC(fieldValue){
				document.forms[0].ACCNUM.value=fieldValue;

	var formLength= document.forms[0].elements.length;
		for(n=0;n<formLength;n++)
			{
					var elementName= document.forms[0].elements[n].name;
					var elementValue= document.forms[0].elements[n].value;
					if(elementName == "ACCNUM" && elementValue== fieldValue) 
						{
						document.forms[0].elements[n].click();
						break;
					}
				}
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
 }

 function showInqWarn(fieldValue){
			 document.forms[0].ACCNUM.value=fieldValue;
	var formLength= document.forms[0].elements.length;
		for(n=0;n<formLength;n++)
			{
					var elementName= document.forms[0].elements[n].name;
					var elementValue= document.forms[0].elements[n].value;
					if(elementName == "ACCNUM" && elementValue== fieldValue) 
						{
						document.forms[0].elements[n].click();
						break;
					}
				}
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
	CenterWindow(page,420,300,2);    
 }
 
 function showReceipt() {
	var page="";
	page= "<%=request.getContextPath()%>/pages/s/EDL0140_receipt_CD_viewer.jsp";
	CenterWindow(page,500,400,2);
 }
 
</script>
</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
		 error.setERRNUM("0");
		 out.println("<SCRIPT Language=\"Javascript\">");
		 out.println("       showErrors()");
		 out.println("</SCRIPT>");
 } else {
	 if (userPO.getRedirect().equals("DO_PRINT")) {
		 out.println("<SCRIPT Language=\"Javascript\">");
		 out.println("       showReceipt()");
		 out.println("</SCRIPT>"); 
		 userPO.setRedirect("");    
	 }
 } 
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">

<h3 align="center"> Aprobacion de tarjetas</h3>
<hr size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0140">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
	<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
	<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
	<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="BIO" VALUE="N">
	<input type=HIDDEN name="appCode" value="<%= userPO.getHeader10()%>">
	
	<TABLE class="tbenter" >
		<TR>
			<TD class=TDBKG> 
				<div align="center"><a href="javascript:goAction('A')"><b>Aprobar</b></a></div>
			</TD>
			<TD class=TDBKG> 
				<div align="center"><a href="javascript:enterReason('R')"><b>Rechazar</b></a></div>
			</TD>
			<!-- 
			<TD class=TDBKG> 
				<div align="center"><a href="javascript:goAction('D')"><b>Eliminar</b></a></div>
			</TD>
			 -->
		</TR>
	</TABLE>
	
	<TABLE id="mainTable" class="tableinfo" width="100%" >
		<TR > 
			<TD NOWRAP valign="top" width="70%" >
				<TABLE id="headTable" width="100%" >
					<TR id="trdark"> 
						<TH ALIGN=CENTER rowspan="2" NOWRAP></TH>
						<TH ALIGN=CENTER rowspan="2" NOWRAP>Cuenta</TH>
						<TH ALIGN=CENTER colspan="2" NOWRAP>Cliente</TH>
						<TH ALIGN=CENTER rowspan="2" NOWRAP>Codigo<br>Producto</TH>
					</TR>
					<TR id="trdark"> 
						<TH ALIGN=CENTER NOWRAP>Numero</TH>
						<TH ALIGN=CENTER NOWRAP>Nombre</TH>
					</TR>
				</TABLE>
				<div id="dataDiv1" class="scbarcolor" >
					<table id="dataTable" >
						<%
							appList.initRow(); 
							boolean firstTime = true;
							String chk = "";
							int indexRow = 0;
							while (appList.getNextRow()) {
							if (firstTime) {
								firstTime = false;
								// chk = "checked";
							} else {
								// chk = "";
							}
							datapro.eibs.beans.ECC014001Message msgPart = (datapro.eibs.beans.ECC014001Message) appList.getRecord();
							String chkOfac = (msgPart.getH01FLGWK3().equals("3") ? "<a href=\"javascript:showInqOFAC('"	
								+ msgPart.getE01CCMACC()
								+ "')\"><img src=\""+request.getContextPath()+"/images/warning_16.jpg\" title=\"OFAC Match List\" align=\"middle\" border=\"0\" ></a>"
								: "");
							String chkWarn = (msgPart.getH01FLGWK2().equals("A") ? "<a href=\"javascript:showInqWarn('"
								+ msgPart.getE01CCMACC()
								+ "')\"><img src=\""+request.getContextPath()+"/images/warning01.gif\" title=\"Warnings\" align=\"middle\" border=\"0\" ></a>"
								: "");        
						%>               
						<TR>
							<TD NOWRAP width="2%"><input type="radio" name="ACCNUM" value="<%= msgPart.getE01CCMACC()%>"<%=chk%> onClick="setbio('<%=msgPart.getH01SCRCOD()%>'); showAddInfo(<%=indexRow%>)"></TD>
							<TD NOWRAP ALIGN="LEFT">
								<A HREF="javascript:showInqApprovalCards('<%=msgPart.getE01CCMACD()%>', '<%=msgPart.getE01CCMACC()%>', '<%=msgPart.getH01FLGWK1()%>', '<%=msgPart.getE01CCMNUM()%>' )">
								<%=Util.formatCell(msgPart.getE01CCMACC())%></A><%=chkOfac%><%=chkWarn%>
							</TD>
							<TD NOWRAP ALIGN="CENTER">
								<A HREF="javascript:showInqApprovalCards('<%=msgPart.getE01CCMACD()%>', '<%=msgPart.getE01CCMACC()%>', '<%=msgPart.getH01FLGWK1()%>', '<%=msgPart.getE01CCMNUM()%>')">
								<%=Util.formatCell(msgPart.getE01CCMCUN())%></A>
							</TD>
							<TD NOWRAP ALIGN="CENTER">
								<A HREF="javascript:showInqApprovalCards('<%=msgPart.getE01CCMACD()%>', '<%=msgPart.getE01CCMACC()%>', '<%=msgPart.getH01FLGWK1()%>', '<%=msgPart.getE01CCMNUM()%>')">
								<%=Util.formatCell(msgPart.getE01CUSNA1())%></A>
							</TD>
							<TD NOWRAP ALIGN="CENTER">
								<A HREF="javascript:showInqApprovalCards('<%=msgPart.getE01CCMACD()%>', '<%=msgPart.getE01CCMACC()%>', '<%=msgPart.getH01FLGWK1()%>', '<%=msgPart.getE01CCMNUM()%>')">
								<%=Util.formatCell(msgPart.getE01CCMPRO())%></A>
								<INPUT TYPE=HIDDEN NAME="STSOFAC<%=indexRow%>" VALUE="<%=msgPart.getH01FLGWK3()%>">
								<INPUT TYPE=HIDDEN NAME="STSWARN<%=indexRow%>" VALUE="<%=msgPart.getH01FLGWK2()%>">
								<INPUT TYPE=HIDDEN NAME="TXTDATA<%=indexRow%>" VALUE="<%=Util.formatCell(msgPart.getE01CCMRMK())%><br>
								<%=Util.formatCell(msgPart.getE01CCMCCY())%><br>
								<%=Util.formatCell(msgPart.getE01CCMBNK())%><br>
								<%=Util.formatCell(msgPart.getE01CCMBRN())%><br>
								<%=Util.formatCell(msgPart.getE01CCMGLN())%><br>
								<%=Util.formatCell(msgPart.getE01CCMCCN())%><br>
								<%=Util.formatCell(msgPart.getE01CCMUBT())%><br>
								<%=Util.formatCell(msgPart.getE01CCMUSR())%> ">
							</TD>
						</TR>    		
						<%	indexRow++;
							}
						%>      
					</table>
				</div>
			</TD>
			<TD nowrap ALIGN="RIGHT" valign="top" width="30%">
				<Table id="tbAddInfoH" width="100%" >
					<tr id="trdark">
						<TH ALIGN=CENTER nowrap >Informacion Basica</TH>
					</tr>
				</Table>
				<Table id="tbAddInfo" border=1>
					<tr id="trclear" >
						<TD ALIGN="RIGHT"  nowrap >
							<b>Narrativa :<br>Moneda :<br>Banco :<br>Agencia :<br>
							Cta. Contable :<br>Centro Costo :<br>Num. Lote :<br>Usuario :  
							</b>
						</TD>
						<TD ALIGN="LEFT"  nowrap class="tdaddinfo"></TD>
					</tr>
				</Table>
			</TD>
		</TR>	
	</TABLE>

</FORM>

<SCRIPT type="text/javascript">
	document.forms[0].totalRow.value="<%= indexRow %>";
	function resizeDoc() {
		divResize(true);
		adjustDifTables("headTable", "dataTable", "dataDiv1",2,1);
	}
	resizeDoc();
	tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
	window.onresize=resizeDoc;
</SCRIPT>

</BODY>

</HTML>

