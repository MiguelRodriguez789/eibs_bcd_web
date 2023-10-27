<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>
Lista de Cuentas a Aprobar
</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>

<script type="text/javascript">
 	
 	var accOfac = '';
 	var accWarn = '';
 	var reason = '';

 	function goLetterDetail(x, y) {
		document.forms[0].SCREEN.value = "5";
		SelectReg(x, y);
		document.forms[0].submit();
 	}
 
	function enter(acc, dno) {
    	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0220?SCREEN=8&E02LCRNUM=" + acc + "&E02DRWNUM=" + dno;
    	CenterNamedWindow(page, 'inquiry', 750, 650, 2);
 	}


 	function SelectReg(fld1, fld2, idxRow) {
    	document.forms[0].E02LCIACC.value = fld1;
    	document.forms[0].E01LCMACC.value = fld1;
    	document.forms[0].E02LCIDNO.value = fld2;
    	showAddInfo(idxRow);
 	}	 
 
 	function goAction(op) {
		document.forms[0].E02ACTION.value = op;
		document.forms[0].E02MSGTXT.value = reason;
		document.forms[0].submit();
 	}

 	function goMsgSwift() {
    	if (document.letterOfCreditForm.E01LCMACC.value !== "") {
			var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0100?SCREEN=0&E01LCMACC="+letterOfCreditForm.E01LCMACC.value;
    	   	CenterNamedWindow(page, 'SWIFT', 750, 650, 2);
         
     	} else {
		  	alert("Seleccione una cuenta ");	   
     	}
 	}



 	function showAddInfo(idxRow){
   		document.getElementById("tbAddInfo").rows[0].cells[1].style.color = "#d0122c";   
   		document.getElementById("tbAddInfo").rows[0].cells[1].innerHTML = extraInfo(getElement("TXTDATA"+idxRow).value, 6);   
  	}   
  
 	function extraInfo(textfields, noField) {
 		var pos = 0;
 		var s = textfields;
 		for ( var i=0; i<noField ; i++ ) {
   			pos = textfields.indexOf("<br>", pos + 1);
 		}
 		s = textfields.substring(0, pos);
 		return(s);
 	}
 
  	
  	function goMsgSwift(opt) {
  		var FldPar = "TRANSREFNUM=";    
      	if (opt == "A"){
        	FldPar += document.forms[0].E01LCMACC.value ;
      	} else {
        	FldPar += document.forms[0].E01TRFNUM.value ;
      	}
   	   	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=8&" + FldPar;
    	CenterNamedWindow(page, 'SWIFT', 750, 650, 2);
 	}
</script>


</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }%>

<form name="letterOfCreditForm" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0220">
	<input type=HIDDEN name="E01LCMACC" value="">	
	<input type=HIDDEN name="SCREEN" value="2">
	<input type=HIDDEN name="E01LCMOPT" value="">
	<input type=HIDDEN name="E01LCMTYP" value="">
	<input type=HIDDEN name="E02ACTION" value="">
	<input type=HIDDEN name="E02LCIACC" value="">
	<input type=HIDDEN name="E02LCIDNO" value="">	
	<input type=HIDDEN name="E02MSGTXT" value="">
	<input type=HIDDEN name="totalRow" value="0">
	
	<h3 align="center">
	Aprobacion de Documentos Recibidos
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ELC0220_apr_list.jsp">
	</h3>
	<hr size="4">
    
	<table class="tbenter" width="100%">
		<tr> 
			<td width="20%" class=TDBKG> 
				<div align="center"><a name="linkApproval" href="javascript:goAction('A')"><b>Aprobar</b></a></div>
		  	</td>
	      	<td width="20%" class="TDBKG"> 
	      		<div align="center"><a href="javascript:enterReason('R', '40')" id="linkReject"><b>Rechazar</b></a></div> 
	      	</td>
			<td width="20%" class=TDBKG> 
				<div align="center"><a name="linkReject" href="javascript:goAction('D')"><b>Eliminar</b></a></div>
		  	</td>
		  	<TD width="20%" class=TDBKG> 
				<DIV align="center"><A href="javascript:goMsgSwift('A')"><B>Mensaje<BR>SWIFT</B></A></DIV>
		  	</TD>		 
			<td width="20%" class=TDBKG> 
				<div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		  </td>  
	  </tr>
	</table>
	
	
	<TABLE id="mainTable" class="tableinfo" width="100%">
		<TR height="5%">
			<TD NOWRAP valign="top" width="60%">
				<TABLE id="headTable" width="100%">
					<tr id="trdark"> 
						<th align=CENTER nowrap width="5%">&nbsp;</th>
						<th align=CENTER nowrap width="15%">Carta Credito</th>
						<th align=CENTER nowrap width="5%">Doc</th>						
						<th align=CENTER nowrap width="10%">Moneda</th>						
						<th align=CENTER nowrap width="15%">Monto</th>						
						<th align=CENTER nowrap width="30%">Nombre del Cliente</th>
						<th align=CENTER nowrap width="20%">Comentario</th>						
					</tr>
				</TABLE>
			</TD>
			<TD nowrap ALIGN="RIGHT" valign="top" width="40%">
				<Table id="tbAddInfoH" width="100%" >
					<TR id="trdark">
					 <TH ALIGN=CENTER nowrap >Información Básica</TH>
					</TR>
				</Table>
			</TD>	
		</TR>
	    <tr height="95%">    
			<TD NOWRAP valign="top" width="60%">
				<div id="dataDiv1" class="scbarcolor"  style="height:347px;  overflow:auto;" >
					<table id="dataTable" width="100%" >
<% 
						jbList.initRow(); 
						boolean firstTime = true;
						String chk = "";
						String warnImg = "";
						String warnFlag = "";
						int k = 0;
						while (jbList.getNextRow()) {
							ELC022001Message msgPart = (ELC022001Message) jbList.getRecord();
							if (firstTime) {
								firstTime = false;
								chk = "checked";
							} else {
								chk = "";
							} 
							if (msgPart.getH01FLGWK2().trim().equals("A")) {
								warnImg = "<IMG border=\"0\" src=\"" + request.getContextPath() + "/images/warning01.gif\" ALT=\"\" onClick=\"showWarnings('" + msgPart.getE01LCIACC() + "','ACCNUM_TEMP')\">";
								warnFlag = msgPart.getH01FLGWK2().trim();
							} else {
								warnImg= "";
								warnFlag = "";
							}
%>
						    <tr>
								<td nowrap align="CENTER" width="5%">
									<input type="radio" name="ACCNUM_TEMP" value="<%= msgPart.getE01LCIACC() %>" 
									   	onClick="SelectReg('<%= msgPart.getE01LCIACC() %>','<%= msgPart.getE01LCIDNO() %>', <%=k%>)" <%=chk%>>
								</td>
								<td nowrap align="CENTER" width="15%"><a href="javascript:enter('<%= msgPart.getE01LCIACC() %>','<%= msgPart.getE01LCIDNO() %>')"><%=Util.formatCell(msgPart.getE01LCIACC())%></a><%=warnImg%></td>
								<td nowrap align="CENTER" width="5%"><a href="javascript:enter('<%= msgPart.getE01LCIACC() %>','<%= msgPart.getE01LCIDNO() %>')"><%=Util.formatCell(msgPart.getE01LCIDNO())%></a></td>
								<td nowrap align="center" width="10%"><a href="javascript:enter('<%= msgPart.getE01LCIACC() %>','<%= msgPart.getE01LCIDNO() %>')"><%=Util.formatCell(msgPart.getE01LCICCY())%></a></td>									
								<td nowrap align="right" width="15%"><a href="javascript:enter('<%= msgPart.getE01LCIACC() %>','<%= msgPart.getE01LCIDNO() %>')"><%=Util.formatCell(msgPart.getE01LCIAMN())%></a></td>
								<td nowrap align="left" width="30%"><a href="javascript:enter('<%= msgPart.getE01LCIACC() %>','<%= msgPart.getE01LCIDNO() %>')"><%=Util.formatCell(msgPart.getE01CUSNA1())%></a></td>
								<td nowrap align="left" width="20%"><a href="javascript:enter('<%= msgPart.getE01LCIACC() %>','<%= msgPart.getE01LCIDNO() %>')"><%=Util.formatCell(msgPart.getE01DSCOPT())%></a>
								<%
									String ls = "";		
									ls += Util.formatCell(msgPart.getE01LCIACC()) + "<br>";							
									ls += Util.formatCell(msgPart.getE01LCIDNO()) + "<br>";
									ls += Util.formatCell(msgPart.getE01LCICCY()) + "<br>";																		
									ls += Util.formatCell(msgPart.getE01LCIAMN()) + "<br>";
									ls += Util.formatCell(msgPart.getE01CUSNA1()) + "<br>";
									ls += Util.formatCell(msgPart.getE01DSCOPT()) + "<br>";
								%>
								<input type="HIDDEN" name="TXTDATA<%=k%>" value="<%=ls%>">
								</td>
							</tr>
<%     
							k++;          
						}
%>					
					</table>
				</div>
			</TD>		
			<TD nowrap ALIGN="RIGHT" valign="top" width="40%">
				<Table id="tbAddInfo" width="100%">
					<TR id="trclear">
						<td align="RIGHT" nowrap><b>Numero de Cuenta: <br>Set Doc : <br>Moneda : <br>   Monto : <br>Nombre del Cliente : <br>Comentario : </b></td>
						<td align="LEFT" nowrap class="tdaddinfo"></td>
					</TR>
				</Table>
			</TD>
		</tr>			
	</TABLE>	
		  
<script type="text/javascript">
	document.forms[0].totalRow.value="<%=jbList.size()%>";
	
	function resizeDoc() {
	    divResize(true);
	    adjustEquTables(document.getElementById("headTable"), 
	       					document.getElementById("dataTable"), 
	       					document.getElementById("dataDiv1"), 2, false);
	}
	radioClick("ACCNUM_TEMP", 0);
	resizeDoc();
	document.getElementById("tbAddInfoH").rows[0].cells[0].height = document.getElementById("headTable").rows[0].cells[0].clientHeight;
	window.onresize = resizeDoc;
</script>


</form>

</body>
</html>
