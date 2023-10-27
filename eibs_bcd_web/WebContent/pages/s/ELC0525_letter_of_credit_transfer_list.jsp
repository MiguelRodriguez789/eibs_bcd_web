<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Lista de Cuentas a Aprobar</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lcList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">
 var reason = '';
 var accOfac = '';
 var accWarn = '';

function goMsgSwift() {
	if (document.forms[0].E01LCMACC.value !== "") {
   		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525?SCREEN=0&E01LCMACC="+document.forms[0].E01LCMACC.value;
		CenterWindow(page, 600, 500, 2);  
    } else {
		alert("Seleccione una cuenta ");	   
    }
}

function goAction(op) {
	if (op == "A") {
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

 function goTranser(op, num) {
	if (op == "M") {
		document.forms[0].E05LCTNUM.value = num;
		document.forms[0].submit();
	}
 }

 function showAddInfo(idxRow){
	document.getElementById("tbAddInfo").rows[0].cells[1].style.color = "#d0122c";   
   	document.getElementById("tbAddInfo").rows[0].cells[1].innerHTML = extraInfo(getElement("TXTDATA"+idxRow).value, 9);
 }   
  
  
 function extraInfo(textfields, noField) {
 	var pos = 0;
 	var s = textfields;
 	for ( var i=0; i<noField ; i++ ) {
   		pos = textfields.indexOf("<br>", pos+1);
  	}
 	s = textfields.substring(0, pos);
 	return(s);
 }
 


   builtNewMenu(lc_transfer_detail);

</script>
<SCRIPT> initMenu();  </SCRIPT>
</HEAD>
<BODY>

<%if (!error.getERRNUM().equals("0")) {
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="106">
<INPUT TYPE=HIDDEN NAME="pCode" value="T">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="E01LCMACC" value="<%=userPO.getIdentifier()%>">	
<INPUT TYPE=HIDDEN NAME="E05LCTNUM" VALUE="">	
	<INPUT TYPE=HIDDEN NAME="reason">
<H3 align="center">Transferencia de Carta De Credito 
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="letter_of_credit_transfer_list,ELC0525"></H3>

<HR size="4">

<TABLE  id="mainTable" class="tableinfo" height="70%">
<tr height="5%">
	<td NOWRAP valign="top" width="70%">
  		<TABLE id="headTable" width="95%" >
			<TR id="trdark">
				<TH ALIGN=CENTER nowrap></TH>
				<TH ALIGN=CENTER nowrap>Transferencia Numero</TH>
				<TH ALIGN=CENTER nowrap>Monto Transfierido</TH>
				<TH ALIGN=CENTER nowrap>Benificiario</TH>
				<TH ALIGN=CENTER nowrap>Identificación</TH>
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
</tr>
<tr height="95%">
	<td NOWRAP valign="top" width="70%">
		<div id="dataDiv1" style="height:70% overflow:auto;">  
			<table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
			<%	int k = 0;
				lcList.initRow();
				boolean firstTime = true;
				String chk = "";
				String ls_E05LCTNUM = "";
				while (lcList.getNextRow()) {
				ELC051005Message msgPart = (ELC051005Message) lcList.getRecord();
				if (firstTime) {
					firstTime = false;
					chk = "checked";

				} else {
					chk = "";
				}
			%>
			<TR>
				<TD NOWRAP><input type="radio" name="E05LCTNUM_TEMP"
					value="<%=msgPart.getE05LCTNUM()%>" onClick="document.forms[0].E05LCTNUM.value = this.value;showAddInfo(<%=k%>)"
					<%=chk%>></TD>
				<TD NOWRAP ALIGN="LEFT"><a href="javascript:goTranser('M','<%=Util.formatCell(msgPart.getE05LCTNUM())%>');"><%=Util.formatCell(msgPart.getE05LCTNUM())%></a></TD>
				<TD NOWRAP ALIGN="CENTER"><a href="javascript:goTranser('M','<%=Util.formatCell(msgPart.getE05LCTNUM())%>');"><%=Util.formatCell(msgPart.getE05LCTAMT())%></a></TD>
				<TD NOWRAP ALIGN="CENTER"><a href="javascript:goTranser('M','<%=Util.formatCell(msgPart.getE05LCTNUM())%>');"><%=Util.formatCell(msgPart.getE05LCTBN1())%></a></TD>
				<TD NOWRAP ALIGN="CENTER"><a href="javascript:goTranser('M','<%=Util.formatCell(msgPart.getE05LCTNUM())%>');"><%=Util.formatCell(msgPart.getE05LCTBID())%></a>
				<%	String ls = "";
					ls += Util.formatCell(msgPart.getE05LCMBNK()) + "<br>";
					ls += Util.fcolorCCY(msgPart.getE05LCMORF()) + "<br>";
					ls += Util.formatCell(msgPart.getE05LCMTRF()) + "<br>";
					ls += Util.formatCell(msgPart.getE05LCMPRO()) + "<br>";
					ls += Util.formatCell(msgPart.getE05LCMMEB()) + "<br>";%>
				<INPUT TYPE="HIDDEN" NAME="TXTDATA<%=k%>" value="<%=ls%>"></TD>
			</TR>
			<%		k++;
				}%>
			</table>
		</div>
	</td>
   	<TD nowrap ALIGN="RIGHT" valign="top" width="30%">
     	<Table id="tbAddInfo" width="100%">
			<tr id="trclear">
				<TD ALIGN="RIGHT" align="center" nowrap><b>Banco : <br>
				Nustra Ref : <br>
				Ref Del Otro Banco: <br>
				Producto : <br>
				Saldo Disponible : </b><BR>
				</TD>
				<TD ALIGN="LEFT" align="center" nowrap class="tdaddinfo"></TD>
			</tr>
     	</Table>
    </TD> 
</tr>			
</TABLE>		

<SCRIPT type="text/javascript">
	  function resizeDoc() {
		  radioClick('E05LCTNUM_TEMP', 0);
		  document.forms[0].E05LCTNUM.value = getElementChecked("E05LCTNUM_TEMP").value;	  
	  }
	  resizeDoc();
	</SCRIPT>
</FORM>
</BODY>
</HTML>
