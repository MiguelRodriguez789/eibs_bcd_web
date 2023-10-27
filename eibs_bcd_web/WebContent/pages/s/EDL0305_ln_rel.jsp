<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL030502Message"%>

<html>
<head>
<title>Deducciones y Relaciones entre Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cifPos" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%
if (userPO.getPurpose().equals("INQUIRY")){
	if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
		builtNewMenu(ln_i_1_opt);
<%   
	} else  {
%>
		builtNewMenu(ln_i_2_opt);
<% 
	}  
} else if (userPO.getPurpose().equals("APPROVAL_INQ")) {
%>
	builtNewMenu(ln_a_opt);
<% 
}  
%>	
</SCRIPT>

<SCRIPT type="text/javascript">

function showInqRel(typ, acc, row) {
	// U - Negociacion
	// 7 - Credito Milagroso
	var inqAcc = true;
	if (typ == 'U' || typ == '7') {
		inqAcc = false;
	} else {
		if (getElement("E02ACC").value == (acc)) {
			inqAcc = false;
		}
	} 
	if (inqAcc) {
		showInqAcc(acc);
	} else {
		showPage("EDL0305_ln_rel_det.jsp?Row=" + row);
	}
}

</SCRIPT>

</head>

<BODY>

<SCRIPT> initMenu(); </SCRIPT>

<h3 align="center">Relaciones entre Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_rel.jsp,EDL0305"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JEDL0305" >
	<input TYPE=HIDDEN NAME="SCREEN" value="2">
	<input TYPE=HIDDEN NAME="CODE" VALUE="">
	<input TYPE=HIDDEN NAME="TYPE" VALUE="">
	<input TYPE=HIDDEN NAME="ACCOUNT" VALUE="">
	
	<% if ( cifPos.getNoResult() ) { %>
	<TABLE class="tbenter" width=100% height=100%>
		<TR>
			<TD><div align="center"><font size="3"><b>No hay resultados que correspondan a su criterio de búsqueda</b></font></div></TD>
		</TR>
	</TABLE>
	<% } else { %> 
	<table class="tableinfo" width=100% >
		<tr> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" class="tbhead" style="border: 0px">
					<tr id="trdark"> 
						<td nowrap width="16%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="20%" > 
							<div align="left"> 
								<input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
							</div>
						</td>
						<td nowrap width="16%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap colspan="3" > 
							<div align="left">
								<input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
							</div>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="16%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="20%"> 
							<div align="left"> 
								<input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="16%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="16%"> 
							<div align="left"><b> 
								<input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
							</b></div>
						</td>
						<td nowrap width="16%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="16%"> 
							<div align="left"><b> 
								<input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
							</b></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
 
	<h4>Relaciones entre Cuentas</h4>
	<table id="mainTable" class="tableinfo" style="height: 400px;" width=100% >
		<tr height="5%"> 
			<td NOWRAP valign="top" width="80%"> 
				<table id="headTable" width="100%">
					<TR id="trdark">  
						<TH ALIGN=CENTER width="25%">Tipo</TH>
						<TH ALIGN=CENTER width="15%">Cuenta</TH>
						<TH ALIGN=CENTER width="30%">Nombre</TH>
						<TH ALIGN=CENTER width="10%">Fecha</TH>
						<TH ALIGN=CENTER width="20%">Monto</TH>
					</TR>
				</table>
			</td>
		</tr>
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:400px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					   cifPos.initRow();
					   while (cifPos.getNextRow()) {
					     EDL030502Message msgList = (EDL030502Message) cifPos.getRecord();
					%> 
						<tr> 
							<td NOWRAP align="left"   width="25%"><a href="javascript:showInqRel('<%=msgList.getE02RELTYP()%>','<%=msgList.getE02RELACC()%>','<%=cifPos.getCurrentRow()%>')"><%= msgList.getE02DSCTYP() %></a></td>
							<td NOWRAP align="center" width="15%"><a href="javascript:showInqRel('<%=msgList.getE02RELTYP()%>','<%=msgList.getE02RELACC()%>','<%=cifPos.getCurrentRow()%>')"><%= msgList.getE02RELACC() %></a></td>
							<td NOWRAP align="left"   width="30%"><a href="javascript:showInqRel('<%=msgList.getE02RELTYP()%>','<%=msgList.getE02RELACC()%>','<%=cifPos.getCurrentRow()%>')"><%= msgList.getE02RELNME() %></a></td>
							<td NOWRAP align="center" width="10%"><a href="javascript:showInqRel('<%=msgList.getE02RELTYP()%>','<%=msgList.getE02RELACC()%>','<%=cifPos.getCurrentRow()%>')"><%= Util.formatCustomDate(currUser.getE01DTF(), msgList.getBigDecimalE02RELMAM().intValue(), msgList.getBigDecimalE02RELMAD().intValue(), msgList.getBigDecimalE02RELMAY().intValue()) %></a></td>
							<td NOWRAP align="right"  width="20%"><a href="javascript:showInqRel('<%=msgList.getE02RELTYP()%>','<%=msgList.getE02RELACC()%>','<%=cifPos.getCurrentRow()%>')"><%= msgList.getE02RELPRI() %></a></td>
						</tr>          
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>
	<% } %>

</form>
</body>
</html>
