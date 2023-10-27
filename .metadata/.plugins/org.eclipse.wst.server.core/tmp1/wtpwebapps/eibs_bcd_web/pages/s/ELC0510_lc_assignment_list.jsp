<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Cesiones de Cartas de Crédito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="jbList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
 var reason = '';
 var accOfac = '';
 var accWarn = '';

 function goAction(op) {
	if (op == "N") {
		document.forms[0].opCode.value = '0001';
		document.forms[0].submit();		 
	} else if(op == "M") {
		document.forms[0].opCode.value = '0002';
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
 
</script>
</HEAD>
<BODY>

<%if (!error.getERRNUM().equals("0")) {
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>

<H3 align="center">Cesión de Cartas de Crédito
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="lc_assignment_list.jsp, ELC0510"></H3>
<HR size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="111">
<INPUT TYPE=HIDDEN NAME="opCode" value="opCode">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">

<TABLE class="tbenter">
	<TR>
		<TD class=TDBKG>
			<div align="center"><a href="javascript:goAction('N')"><b>Nuevo</b></a></div>
		</TD>
		<TD class=TDBKG>
			<div align="center"><a href="javascript:goAction('M')"><b>Mantenimiento</b></a></div>
		</TD>
		<TD class=TDBKG>
			<div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</TD>
	</TR>
</TABLE>

<% if (jbList.getNoResult()) { 
   		out.print("<H4><center><BR><BR><B>No hay Cesiones para esta Carta de Credito</B></center></H4>");
   } else { %>
   
<TABLE  id="mainTable" class="tableinfo" height="70%">
<tr height="5%">
	<td NOWRAP valign="top" width="70%">
  		<TABLE id="headTable" width="95%" >
			<TR id="trdark">
				<TH ALIGN=CENTER nowrap></TH>
				<TH ALIGN=CENTER nowrap>Carta de Crédito</TH>
				<TH ALIGN=CENTER nowrap>Asig.</TH>
				<TH ALIGN=CENTER nowrap>Monto Asignado</TH>
				<TH ALIGN=CENTER nowrap>Beneficiario</TH>
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
				ELC051005Message msgPart = (ELC051005Message) jbList.getRecord();
			%>
			<TR>
				<TD NOWRAP><input type="radio" name="E05LCTNUM"
					value="<%=msgPart.getE05LCTNUM()%>" onClick="showAddInfo(<%=k%>)"
					<%=chk%>></TD>
				<TD NOWRAP ALIGN="CENTER"><a href="javascript:goAction('M');"><%=Util.formatCell(msgPart.getE05LCMACC())%></a></TD>
				<TD NOWRAP ALIGN="CENTER"><a href="javascript:goAction('M');"><%=Util.formatCell(msgPart.getE05LCTNUM())%></a></TD>
				<TD NOWRAP ALIGN="CENTER"><a href="javascript:goAction('M');"><%=Util.formatCell(msgPart.getE05LCTAMT())%></a></TD>
				<TD NOWRAP ALIGN="LEFT"><a href="javascript:goAction('M');"><%=Util.formatCell(msgPart.getE05LCTBN1())%></a>
				<%	String ls = "";
					ls += Util.formatCell(msgPart.getE05LCMBNK()) + "<br>";
					ls += Util.formatCell(msgPart.getE05LCTNLC()) + "<br>";
					ls += Util.formatCell(msgPart.getE05LCMPRO()) + "<br>";
					ls += Util.fcolorCCY(msgPart.getE05LCMMEB()) + "<br>";%>
				<INPUT TYPE="HIDDEN" NAME="TXTDATA<%=k%>" value="<%=ls%>"></TD>
			</TR>
			<%	k++;
				}%>
			</table>
		</div>
	</td>
   	<TD nowrap ALIGN="RIGHT" valign="top" width="30%">
     	<Table id="tbAddInfo" width="100%">
			<tr id="trclear">
				<TD ALIGN="RIGHT" align="center" nowrap><b>Banco : <br>
				Nuestra Ref : <br>
				Producto : <br>
				Saldo Disponible : </b><BR>
				</TD>
				<TD ALIGN="LEFT" align="center" nowrap class="tdaddinfo"></TD>
			</tr>
		</table>
	</TD>		
</tr>			
</TABLE>			   

<SCRIPT type="text/javascript">
	  radioClick('E05LCTNUM', 0);
</SCRIPT>

<% } %>

</FORM>
</BODY>
</HTML>
