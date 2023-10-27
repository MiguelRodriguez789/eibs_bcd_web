<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL030502Message"%>

<HTML>
<HEAD>
<TITLE>
Detalle de Cuota
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cifPos" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<BODY>

<form>
	<h3 align="center">Detalle de la Relaci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_rel_det.jsp,EDL0305"></h3>
	<hr size="4">
	<h4></h4>
	 
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="16%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="20%" > 
							<div align="left"> 
								<input type="text" name="E02CUN2" size="14" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
							</div>
						</td>
						<td nowrap width="16%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap colspan="3" > 
							<div align="left"> 
								<input type="text" name="E02NA12" size="60" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
							</div>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="16%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="20%"> 
							<div align="left"> 
								<input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="16%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="16%"> 
							<div align="left"><b> 
								<input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
								</b> </div>
						</td>
						<td nowrap width="16%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="16%"> 
							<div align="left">
								<b><input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>"></b>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<%
		int curRow = 0;
		cifPos.initRow();
		try { curRow = Integer.parseInt(request.getParameter("Row")); } catch (Exception e) {};
		cifPos.setCurrentRow(curRow);
		EDL030502Message msgList = (EDL030502Message) cifPos.getRecord();
	%> 
	
	<h4>&nbsp;</h4> 
	<%int row = 1;%>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Relaci&oacute;n Prestamo :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%=msgList.getE02DSCTYP().trim()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Cuenta :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%=msgList.getE02RELACC().trim()%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Fecha :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%= Util.formatCustomDate(currUser.getE01DTF(), msgList.getBigDecimalE02RELMAM().intValue(), msgList.getBigDecimalE02RELMAD().intValue(), msgList.getBigDecimalE02RELMAY().intValue()) %></div>
						</td>
						<td nowrap width="25%" ><div align="right">Monto :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%= msgList.getE02RELPRI() %></div>
						</td>
					</tr>
					<!-- Credito Negociado -->
					<%if (msgList.getE02RELTYP().equals("U")) {%>
					<%}%>
					<!-- Credito Milagroso -->
					<%if (msgList.getE02RELTYP().equals("7")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">% Ahorro :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%= msgList.getE02RELRT1() %></div>
						</td>
						<td nowrap width="25%" ><div align="right">% Descuento :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%= msgList.getE02RELRT2() %></div>
						</td>
					</tr>
					<%}%>
					<!-- Cartera Sustituva -->
					<%if (msgList.getE02RELTYP().equals("8")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Estado :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
							<%= msgList.getE02RELSTS().equals("S") ? "MARCADO" :    "" %>
							<%= msgList.getE02RELSTS().equals("D") ? "DESMARCADO" :    "" %>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Motivo :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
							<%= msgList.getE02RELUC1().equals("0001") ? "Mora" : "" %>
							<%= msgList.getE02RELUC1().equals("0002") ? "Pagos Extras" : "" %>
							<%= msgList.getE02RELUC1().equals("0003") ? "Reversion" : "" %>
							<%= msgList.getE02RELUC1().equals("0004") ? "Cambio Tasa" : "" %>
							<%= msgList.getE02RELUC1().equals("0005") ? "Cambio Plazo" : "" %>
							<%= msgList.getE02RELUC1().equals("0006") ? "Cambio Fecha Pago " : "" %>
							<%= msgList.getE02RELUC1().equals("9999") ? "Manual" : "" %>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Nro. Operaci&oacute;n :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%=msgList.getE02RELDS1().trim()%></div>
						</td>
						<td nowrap width="25%" ></td>
						<td nowrap width="25%" > 
						</td>
					</tr>
					<%}%>
				</table>
			</td>
		</tr>
	</table>
	<br>

	<div align="center"> 
		<input class="EIBSBTN" type="button" name="Submit" OnClick="top.close()" value="Cerrar">
	</div>
	
</form>

</BODY>
</HTML>
