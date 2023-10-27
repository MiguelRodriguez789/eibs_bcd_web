<%@ page import = "datapro.eibs.master.Util" %>
<html> 
<head>
<title>Source Document Detail</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EBP0124Record" class="datapro.eibs.beans.EBP012401Message"  scope="session" />
<jsp:useBean id="EBP0120Record" class="datapro.eibs.beans.EBP012001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function goAction(op) { 
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].submit();
}


</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
	boolean display=false;
    String read = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) read = " readonly ";
%>


<H3 align="center">Línea <%= EBP0124Record.getE01BDDSEQ().trim()%> para el Documento Nro. <%= userPO.getIdentifier().trim() %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="source_document_detail.jsp, EBP0124"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0124" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01BDCNUM" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDDNUM" VALUE="<%= EBP0124Record.getE01BDDNUM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDDSEQ" VALUE="<%= EBP0124Record.getE01BDDSEQ().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDDKIN" VALUE="<%= EBP0124Record.getE01BDDKIN().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDDREF" VALUE="<%= EBP0124Record.getE01BDDREF().trim() %>">
  
<h4>Información Documento</h4>  
<table width="100%"> <tr> <td nowrap>
  <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
    <table class="tableinfo" cellspacing="0" width="100%" border="0" >		
		<tr id="trclear"> 
			<td nowrap width="13%" align="right"><B>Tipo Documento :</B> </td>
			<td nowrap width="20%" align="left"><%= EBP0120Record.getE01BDCKIN().trim()%>  
					<%= EBP0120Record.getE01BDCKIND().trim()%>
			</td>
			<td nowrap width="13%" align="right"><B>Proveedor : </B></td>
			<td nowrap width="20%" align="left"><%= EBP0120Record.getE01BDCCOD().trim()%>
					<%= EBP0120Record.getE01BDCVEND().trim()%>
			</td>
			<td nowrap width="14%" align="right"><B>Referencia : </B></td>
			<td nowrap width="20%" align="left"><%= EBP0120Record.getE01BDCREF().trim()%></td>
		</tr>
		<tr id="trclear"> 
			<td nowrap width="13%" align="right"><B>Fecha Documento :</B> </td>
			<td nowrap width="20%" align="left">
				<%=datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(),EBP0120Record.getE01BDCDD1(), EBP0120Record.getE01BDCDD2(), EBP0120Record.getE01BDCDD3())%>
					<B><%=currUser.getE01DTF()%></B>
			</td>    
			<td nowrap width="13%" align="right"><B>Banco :</B> <%= EBP0120Record.getE01BDCBNK().trim()%></td>
			<td nowrap width="20%" align="left"> <B>Oficina :</B> <%= EBP0120Record.getE01BDCBRN().trim()%>
												    <B>Moneda :</B> <%= EBP0120Record.getE01BDCCCY().trim()%>
			</td>
			<td nowrap width="14%" align="right"><B>Descripción Documento  : </B></td>
			<td nowrap width="20%" align="left" ><%= EBP0120Record.getE01BDCDSC().trim()%>
		</tr>
		<tr id="trclear"> 
				<td nowrap width="13%" align="right"><B>Monto Total : </B></td>
				<td nowrap width="20%" align="left"><%= EBP0120Record.getE01BDCAMT().trim()%></td>
				<td nowrap width="13%" align="right"><B>Observaciones :</B> </td>
				<td nowrap width="20%" align="left"> 
					<%= EBP0120Record.getE01BDCRM1().trim()%>
                	<BR>
					<%= EBP0120Record.getE01BDCRM2().trim()%>
				</td>
				<td nowrap width="14%" align="right"><B>Estado : </B></td>
				<td nowrap width="20%" align="left"> <%= EBP0120Record.getE01BDCSTSD().trim()%></td>
			</tr>
	</table>
  </td></tr></table>	

  <h4>Información Línea</h4>  
  
  <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		  
	<table class="tableinfo" cellspacing="0" width="100%" border="0">
		<tr id="clear">
			<TD nowrap width="30%" align="right">Descripción : </TD>
			<TD nowrap align="left" width="70%">
				<INPUT type="text" name="E01BDDDS1" size="60" maxlength="50" value="<%= EBP0124Record.getE01BDDDS1().trim()%> <%= read %>">
			</TD>
		<tr id="trdark">	
			<TD nowrap width="30%" align="right"></TD>
			<TD nowrap align="left" width="70%">
				<INPUT type="text" name="E01BDDDS2" size="60" maxlength="50" value="<%= EBP0124Record.getE01BDDDS2().trim()%>" <%= read %>> 
			</TD>
		</tr>
		<tr id="clear">
			<TD nowrap width="30%" align="right"></TD>
			<TD nowrap width="70%" align="left">
				<INPUT type="text" name="E01BDDDS3" size="60" maxlength="50" value="<%= EBP0124Record.getE01BDDDS3().trim()%>" <%= read %>> 	
			</TD>
		<tr id="trdark">
			<TD nowrap width="30%" align="right"></TD>
			<TD nowrap align="left" width="70%">
			 	<INPUT type="text" name="E01BDDDS4" size="60" maxlength="50" value="<%= EBP0124Record.getE01BDDDS4().trim()%>" <%= read %>> 	
			</TD>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="30%" align="right">Cantidad : </td>
			<td nowrap width="70%" align="left">
				<INPUT type="text" name="E01BDDQTY" size="15" maxlength="9" value="<%= EBP0124Record.getE01BDDQTY().trim()%>" onkeypress="enterDecimal()" <%= read %>> 
			</td>
		</tr>
		<tr id="trdark">
            <td nowrap width="30%" align="right">Valor  Unitario: </td>
			<td nowrap width="70%" align="left">
				<INPUT type="text" name="E01BDDUAM" size="20" maxlength="15" value="<%= EBP0124Record.getE01BDDUAM().trim()%>" onkeypress="enterDecimal()" <%= read %>> 
			</td>
		</tr>
		<tr id="clear"> 
			<td nowrap width="30%" align="right">Valor Total:  </td>
			<td nowrap width="70%" align="left">
				<INPUT type="text" name="E01BDDAMT" size="20" maxlength="15" value="<%= EBP0124Record.getE01BDDAMT().trim()%>" readonly> 
			</td>
		</tr>
		</table>
	</td></tr></table>

	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table width="100%">
		<tr>
			<td width="33%" align="center">
				<input id="EIBSBTN" type=submit name="Submit" value="Enviar" onClick="goAction(5);">
			</td>
			<td width="33%" align="center"> 
				<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);"
					<% if (userPO.getPurpose().equals("NEW")) out.print(" disabled"); %>>
			</td>
			<td width="34%" align="center">
				<input id="EIBSBTN" type=submit name="Submit" value="Salir" onClick="goAction(1);">
			</td>
		</tr>	
	</table>
  </td> </tr> </table>
</td></tr></table>
</form>

</body>
</html>
