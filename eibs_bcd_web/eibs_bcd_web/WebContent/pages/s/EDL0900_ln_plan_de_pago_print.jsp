<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="datapro.eibs.beans.EDL090002Message"%>
<%@ page import="datapro.eibs.beans.EDL090003Message"%>
<%@ page import="datapro.eibs.beans.EDL016001Message"%>

<HTML>
<HEAD>
<TITLE>Cronograma de Plan de Pagos</TITLE>

<jsp:useBean id="header" class="datapro.eibs.beans.EDL090001Message"  scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="listUF" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="edl016001Record" class="datapro.eibs.beans.EDL016001Message" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<% if ( userPO.getSource().equals("EXCEL")  ) {
		String fileName = "";
		fileName += (userPO.getAccNum().equals("")  ? "" : (fileName.equals("") ? userPO.getAccNum().trim()  : "-" + userPO.getAccNum().trim()));
		fileName +=  (userPO.getCusNum().equals("")  ? "" : (fileName.equals("") ? userPO.getCusNum().trim()  : "-" + userPO.getCusNum().trim()));
		fileName +=  (userPO.getCusName().equals("") ? "" : (fileName.equals("") ? userPO.getCusName().trim() : "-" + userPO.getCusName().trim()));   	
		fileName = "PlanPagos(" + fileName.trim() + ").xls";
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition","attachment;filename=" + fileName) ;
	 } else {
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<% } %>

</HEAD>

<BODY>

<form>
	<h3 align="center">Cronograma de Plan de Pagos</h3>

	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<% if(!header.getE01DEACUN().equals("0") || userPO.getCusType().equals("S") ){ %>
					<tr id="trdark"> 
						<td nowrap width="15%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="35%" > 
							<div align="left"> 
								<%= userPO.getCusType().equals("S") ? "PENDIENTE" :header.getE01DEACUN().trim()%>
							</div>
						</td>
						<td nowrap width="15%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="35%" > 
							<div align="left"> 
								<%= header.getE01CUSNA1().trim()%>
							</div>
						</td>
					</tr>
					<% } %>
					<% if ((!header.getE01DEAPRO().equals("")) && (!header.getE01DSCPRD().equals(""))) { %>
					<tr id="trdark"> 
						<td nowrap width="15%" ><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="85%" colspan="3"> 
							<%=header.getE01DEAPRO().trim() %>&nbsp;<%=header.getE01DSCPRD().trim()%> 
						</td>
					</tr>
					<% }%>
					<%if ((!header.getE01DEACNV().equals("")) && (!header.getE01DSCCNV().equals(""))) { %>
					<tr id="trdark"> 
						<td nowrap width="15%" ><div align="right"><b>Convenio : </b></div></td>
						<td nowrap width="85%" colspan="3"> 
							<%=header.getE01DEACNV().trim()%>&nbsp;<%=header.getE01DSCCNV().trim()%> 
						</td>
					</tr>
					<% }%>
					<tr id="trdark"> 
						<td nowrap width="15%"><div align="right"><b>Prestamo :</b></div></td>
						<td nowrap width="35%"> 
							<div align="left"> 
									&nbsp;<%= header.getE01DEAACC().trim()%>
							</div>
						</td>
						<td nowrap width="15%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<%= header.getE01DEACCY().trim()%>
							</div>
						</td>
					</tr>
					<tr id="trclear"> 
						<td nowrap width="15%"><div align="right"><b>ESTADO :</b></div></td>
						<td nowrap width="35%"> 
							<div align="left"> 
								<b><font color="#ff6600"><%= edl016001Record.getE01STATUS().trim()%></font></b>
							</div>
						</td>
						<td nowrap width="15%"><div align="right"></div></td>
						<td nowrap width="35%"> 
							<div align="left">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br>
		
	<%int row = 0; %>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" >
							<div align="right">
							<% if (header.getE01DEACLF().equals("I")) out.print("Monto Cupo :");
							else out.print("Monto Inicial :");%>
							</div>
						</td>
						<td nowrap width="25%"  > 
							<div align="left"><%=header.getE01DEAOAM()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha de Apertura :</div></td>
						<td nowrap width="25%"  > 
							<div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(), header.getBigDecimalE01DEAODM().intValue(), header.getBigDecimalE01DEAODD().intValue(), header.getBigDecimalE01DEAODY().intValue())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Forma C&aacute;lculo Interes :</div></td>
						<td nowrap width="25%" > 
							<div align="left">
							<% if (header.getE01DEAICT().equals("S")) out.print("LINEAL/CALENDARIO/VENCIDO");
							else if (header.getE01DEAICT().equals("M")) out.print("LINEAL/COMERCIAL/VENCIDO");
							else if (header.getE01DEAICT().equals("P")) out.print("LINEAL/CALENDARIO/PREPAGADO");
							else if (header.getE01DEAICT().equals("A")) out.print("LINEAL/COMERCIAL/PREPAGADO");
							else if (header.getE01DEAICT().equals("D")) out.print("LINEAL/CALENDARIO/DESCONTADO");
							else if (header.getE01DEAICT().equals("R")) out.print("LINEAL/COMERCIAL/PREPAGADO");
							else if (header.getE01DEAICT().equals("1")) out.print("EXPON/CALENDARIO/VENCIDO");
							else if (header.getE01DEAICT().equals("2")) out.print("EXPON/COMERCIAL/VENCIDO");
							else if (header.getE01DEAICT().equals("3")) out.print("EXPON/CALENDARIO/PREPAGADO");
							else if (header.getE01DEAICT().equals("4")) out.print("EXPON/COMERCIAL/PREPAGADO");
							else if (header.getE01DEAICT().equals("5")) out.print("EXPON/CALENDARIO/DESCONTADO");
							else if (header.getE01DEAICT().equals("6")) out.print("EXPON/COMERCIAL/PREPAGADO");
							else out.print("");%>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha Inicio C&aacute;lculo :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(), header.getBigDecimalE01DEASDM().intValue(), header.getBigDecimalE01DEASDD().intValue(), header.getBigDecimalE01DEASDY().intValue())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right"> Base C&aacute;lculo Interes :</div></td>
						<td nowrap width="25%"  > 
							<div align="left">
							<% if (header.getE01DEAIFL().equals("1")) out.print("CAPITAL VIGENTE");
							else if (header.getE01DEAIFL().equals("2")) out.print("CAPITAL ORIGINAL");
							else if (header.getE01DEAIFL().equals("3")) out.print("CAPITAL(VIGENTE - VENCIDO)");
							else if (header.getE01DEAIFL().equals("N")) out.print("NO CALCULA INTERES");
							else out.print("");%>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha de Vencimiento :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(), header.getBigDecimalE01DEAMAM().intValue(), header.getBigDecimalE01DEAMAD().intValue(), header.getBigDecimalE01DEAMAY().intValue())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right"> Base C&aacute;lculo Mora :</div></td>
						<td nowrap width="25%" > 
							<div align="left">
							<% if (header.getE01DEAPCL().equals("1")) out.print("CAPITAL VENCIDO");
							else if (header.getE01DEAPCL().equals("2")) out.print("CAPITAL ORIGINAL");
							else if (header.getE01DEAPCL().equals("3")) out.print("CAPITAL VIGENTE");
							else if (header.getE01DEAPCL().equals("4")) out.print("(CAPITAL + INTERES)VENCIDO");
							else if (header.getE01DEAPCL().equals("N")) out.print("NO CALCULA MORA");
							else out.print("");%>
							</div>
						</td>
						<td nowrap width="25%"  ><div align="right">Ultimo C&aacute;lculo Interes :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(), header.getBigDecimalE01DEALCM().intValue(), header.getBigDecimalE01DEALCD().intValue(), header.getBigDecimalE01DEALCY().intValue())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ><div align="right">Tasa de Inter&eacute;s :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DEARTE()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Per&iacute;odo Base :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DEABAS()%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ><div align="right">Tasa Efectiva :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DEASPR()%></div>
						</td>
						<td nowrap width="25%"  ><div align="right">Tasa de Mora :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01RTEMOR().equals("0.000000") ? "N/A" : header.getE01RTEMOR() %></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" > 
							<% if (header.getE01FLGSBS().equals("Y")){ %>
							<div align="right">Tasa Subsidio :</div>
							<% } %>
						</td>
						<td nowrap width="25%" > 
							<% if (header.getE01FLGSBS().equals("Y")){ %>
							<div align="left"><%= header.getE01DLCRFS()%></div>
							<% } %>
						</td>
						<td nowrap width="25%" ><div align="right"></div></td>
						<td nowrap width="25%" ><div align="left"> </div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<br>
<div id="tabs">  
	<h4>General</h4>

<div id="tab1">  <!-- General  -->
	
	<TABLE class="tableinfo" cellpadding=2 cellspacing=3 >
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<TH ALIGN=CENTER nowrap width="9%" >Nro<br>Cuota</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Fecha <br>a Pagar</TH>
			<% if (header.getE01DEACLF().equals("I")){ %>
			<TH ALIGN=CENTER nowrap width="9%" >Fecha<br>Facturaci&oacute;n</TH>
			<% } %>
			<TH ALIGN=CENTER nowrap width="9%" >Principal</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Inter&eacute;s</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Otros<br>Cargos</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Total<br>Cuota</TH>
			<% if (!header.getE01DEACLF().equals("I") && !header.getE01DEACLF().equals("O")){ %>
			<TH ALIGN=CENTER nowrap width="9%" >Saldo</TH>
			<% } %>
			<TH ALIGN=CENTER nowrap width="9%" >Est.</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Dias<br>Ven.</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Fecha<br>Pago</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Monto<br>Pagado</TH>
			<% if (header.getE01FLGSBS().equals("Y")){ %>
			<TH ALIGN=CENTER nowrap width="9%" >Int.<br>Subsidio</TH>
			<% } %>
		</TR>
		<%
			double suma = 0;
			double sumb = 0;
			double sumc = 0;
			double sumd = 0;
			double sume = 0;
			list.initRow();
			while (list.getNextRow()) {
				EDL090002Message plan = (EDL090002Message) list.getRecord();
				suma += plan.getBigDecimalE02DLPPRN().doubleValue();
				sumb += plan.getBigDecimalE02DLPINT().doubleValue();
				sumc += plan.getBigDecimalE02DLPOTH().doubleValue();
				sumd += plan.getBigDecimalE02DLPPAG().doubleValue();
				sume = suma + sumb + sumc - sumd;
		%> 
		<tr id="dataTable<%= list.getCurrentRow() %>">
			<td nowrap align="center" width="9%">
				<% if   (plan.getE02DLPPNU().equals("77777")) out.print("Aceler.");
				else if (plan.getE02DLPPNU().equals("88888")) out.print("Abono");
				else if (plan.getE02DLPPNU().equals("88999")) out.print("Cargo");
				else if (plan.getE02DLPPNU().equals("96666")) out.print("Reest.");
				else if (plan.getE02DLPPNU().equals("96667")) out.print("Modif.");
				else if (plan.getE02DLPPNU().equals("99999")) out.print("Prepago");
				else out.print(plan.getE02DLPPNU());%>
			</td>
			<td nowrap align="center" width="9%">
				<%=Util.formatCustomDate(currUser.getE01DTF(), plan.getBigDecimalE02DLPPDM().intValue(), plan.getBigDecimalE02DLPPDD().intValue(), plan.getBigDecimalE02DLPPDY().intValue())%>
			</td>
			<% if (header.getE01DEACLF().equals("I")){ %>
			<td nowrap align="center" width="9%">
				<%=Util.formatCustomDate(currUser.getE01DTF(), plan.getBigDecimalE02DLPSDM().intValue(), plan.getBigDecimalE02DLPSDD().intValue(), plan.getBigDecimalE02DLPSDY().intValue())%>
			</td>
			<%} %>
			<td nowrap align="right" width="9%">
				<%=plan.getE02DLPPRN()%>
			</td>
			<td nowrap align="right" width="9%">
				<%=plan.getE02DLPINT()%>
			</td>
			<td nowrap align="right" width="9%">
				<%=plan.getE02DLPOTH()%>
			</td>
			<td nowrap align="right" width="9%">
				<%=plan.getE02DLPTOT()%>
			</td>
			<% if (!header.getE01DEACLF().equals("I") && !header.getE01DEACLF().equals("O")){ %>
			<td nowrap align="right" width="9%">
				<%=plan.getE02DLPBAL()%>
			</td>
			<% } %>
			<td nowrap align="center" width="9%">
				<%=plan.getE02DLPSTS()%>
			</td>
			<td nowrap align="center" width="9%">
				<%=plan.getE02DLPVEN()%>
			</td>
			<td nowrap align="center" width="9%">
				<%=Util.formatCustomDate(currUser.getE01DTF(), plan.getBigDecimalE02DLPDTM().intValue(), plan.getBigDecimalE02DLPDTD().intValue(), plan.getBigDecimalE02DLPDTY().intValue())%>
			</td>
			<td nowrap align="center" width="9%">
				<%=plan.getE02DLPPAG()%>
			</td>
			<% if (header.getE01FLGSBS().equals("Y")){ %>
			<td nowrap align="center" width="9%">
				<%=plan.getE02INTSBS()%>
			</td>
			<% } %>
		</tr>
		<% } %> 
	</TABLE>
	
	<h4>Totales</h4>
	<table class="tableinfo">
		<tr> 
			<td>
				<table >
					<tr> 
						<td><b>PRINCIPAL :</b></td>
						<td align="right"><%= Util.formatCCY(suma) %></TD>
					</tr>
					<tr> 
						<td><b>INTERES :</b></td>
						<td align="right"><%= Util.formatCCY(sumb) %></TD>
					</tr>
					<tr> 
						<td><b>OTROS CARGOS :</b></td>
						<td align="right"><%= Util.formatCCY(sumc) %></TD>
					</tr>
					<tr> 
						<td><b>MONTO PAGADO :</b></td>
						<td align="right"><%= Util.formatCCY(sumd) %></TD>
					</tr>
					<tr> 
						<td><b>TOTAL A PAGAR :</b></td>
						<td align="right"><%= Util.formatCCY(sume) %></TD>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<% if(!listUF.getNoResult()){ %>
	<br> <br>
	<h3 align="center">Cronograma de Plan de Pagos en Valor Reajustable </h3>
	<TABLE class="tableinfo"  cellpadding=2 cellspacing=3>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<TH ALIGN=CENTER nowrap width="9%" >Nro<br>Cuota</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Fecha <br>a Pagar</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Principal</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Inter&eacute;s</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Otros<br>Cargos</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Total<br>Cuota</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Saldo</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Est.</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Dias<br>Ven.</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Fecha<br>Pago</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Monto<br>Pagado</TH>
			<% if (header.getE01FLGSBS().equals("Y")){ %>
			<TH ALIGN=CENTER nowrap width="9%" >Int.<br>Subsidio</TH>
			<% } %>
		</TR>
		<%
				double sumaUF = 0;
				double sumbUF = 0;
				double sumcUF = 0;
				double sumdUF = 0;
				double sumeUF = 0;
				listUF.initRow();
				while (listUF.getNextRow()) {
					EDL090003Message planUF = (EDL090003Message) listUF.getRecord();
					sumaUF += planUF.getBigDecimalE03DLPPRN().doubleValue();
					sumbUF += planUF.getBigDecimalE03DLPINT().doubleValue();
					sumcUF += planUF.getBigDecimalE03DLPOTH().doubleValue();
					sumdUF += planUF.getBigDecimalE03DLPPAG().doubleValue();
					sumeUF = sumaUF + sumbUF + sumcUF - sumdUF;
		%> 
	<tr id="dataTable<%= listUF.getCurrentRow() %>">
		<td nowrap align="center" width="9%">
			<%=planUF.getE03DLPPNU().equals("77777") ? "Aceler."  :
				( planUF.getE03DLPPNU().equals("88888") ? "Abono" :
					( planUF.getE03DLPPNU().equals("99999") ? "Prepago" : planUF.getE03DLPPNU()))%>
		</td>
		<td nowrap align="center" width="9%">
			<%=Util.formatCustomDate(currUser.getE01DTF(),
														planUF.getBigDecimalE03DLPPDM().intValue(),
														planUF.getBigDecimalE03DLPPDD().intValue(),
														planUF.getBigDecimalE03DLPPDY().intValue())%>
		</td>
		<td nowrap align="right" width="9%">
			<%=planUF.getE03DLPPRN()%>
		</td>
		<td nowrap align="right" width="9%">
			<%=planUF.getE03DLPINT()%>
		</td>
		<td nowrap align="right" width="9%">
			<%=planUF.getE03DLPOTH()%>
		</td>
		<td nowrap align="right" width="9%">
			<%=planUF.getE03DLPTOT()%>
		</td>
		<td nowrap align="right" width="9%">
			<%=planUF.getE03DLPBAL()%>
		</td>
		<td nowrap align="center" width="9%">
			<%=planUF.getE03DLPSTS()%>
		</td>
		<td nowrap align="center" width="9%">
			<%=planUF.getE03DLPVEN()%>
		</td>
		<td nowrap align="center" width="9%">
			<%=Util.formatCustomDate(currUser.getE01DTF(),
														planUF.getBigDecimalE03DLPDTM().intValue(),
														planUF.getBigDecimalE03DLPDTD().intValue(),
														planUF.getBigDecimalE03DLPDTY().intValue())%>
		</td>
		<td nowrap align="center" width="9%">
			<%=planUF.getE03DLPPAG()%>
		</td>
		<% if (header.getE01FLGSBS().equals("Y")){ %>
		<td nowrap align="center" width="9%">
			<%=planUF.getE03INTSBS()%>
		</td>
		<% } %>
	</tr>
		<% } %> 
	</TABLE>
	
	<h4>Totales</h4>
		<table class="tableinfo">
		<tr> 
			<td>
				<table >
					<tr> 
						<td><b>PRINCIPAL :</b></td>
						<td align="right"><%= Util.formatCCY(sumaUF) %></TD>
					</tr>
					<tr> 
						<td><b>INTERES :</b></td>
						<td align="right"><%= Util.formatCCY(sumbUF) %></TD>
					</tr>
					<tr> 
						<td><b>OTROS CARGOS :</b></td>
						<td align="right"><%= Util.formatCCY(sumcUF) %></TD>
					</tr>
					<tr> 
						<td><b>MONTO PAGADO :</b></td>
						<td align="right"><%= Util.formatCCY(sumdUF) %></TD>
					</tr>
					<tr> 
						<td><b>TOTAL A PAGAR :</b></td>
						<td align="right"><%= Util.formatCCY(sumeUF) %></TD>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<% } %>
</div> <!-- fin div tab1 -->

</div> <!-- fin divs -->


	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" OnClick="doPrint()" value="Imprimir">
	</div>

</FORM>

<script type="text/javascript">
function doPrint(){
	if(!window.print){
		var msg ="Debe actualizar su navegador para imprimir";
		alert(msg);
		return;
	}
	document.getElementById('EIBSBTN').style.visibility = 'hidden';
	window.focus();
	window.print();
	document.getElementById('EIBSBTN').style.visibility = 'visible';
	return;
}

if(!EIBS.BrowserDetect.isFIREFOX()){
	addEventHandler(document, 'DOMContentLoaded', function() {
		function printWin(){
			if($('.wait-div').first().is(":visible")){
				setTimeout(printWin, '500');
			}else{
				document.getElementById('EIBSBTN').style.visibility = 'hidden';
				window.print();	
				document.getElementById('EIBSBTN').style.visibility = 'visible';
			}
		}
		printWin();
		window.onfocus=function(){ window.close();}
	});
}

</script>

</BODY>
</HTML>
