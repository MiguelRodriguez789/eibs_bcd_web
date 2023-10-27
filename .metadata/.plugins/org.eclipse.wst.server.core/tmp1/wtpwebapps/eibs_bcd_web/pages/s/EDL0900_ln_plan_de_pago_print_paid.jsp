<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="datapro.eibs.beans.EDL090002Message"%>
<%@ page import="datapro.eibs.beans.EDL090003Message"%>
<%@ page import="datapro.eibs.beans.EDL090008Message"%>
<%@ page import="datapro.eibs.beans.EDL016001Message"%>

<HTML>
<HEAD>
<TITLE>Cronograma de Plan de Pagos</TITLE>

<jsp:useBean id="header" class="datapro.eibs.beans.EDL090001Message"  scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="listUF" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="edl090008List" class="datapro.eibs.beans.JBObjList" scope="session" />
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

<style type="text/css">

@page {
    margin: 0.50in 2% 0.75in 2%;
}

</style>
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
	<h4>Pagado</h4>
	
<div id="tab3">  <!-- Pagados  -->
	<table class="tableinfo">
		<tr  height="5%"> 
			<td NOWRAP> 
				<TABLE NOWRAP style="width: 100%">
					<tr id="trdark"> 
						<TH ALIGN=CENTER rowspan="2" width="3%" style="font-size: 5pt">Nro<br>Cuota</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">Fecha <br>a Pagar</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" style="font-size: 5pt">Principal</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" style="font-size: 5pt">Inter&eacute;s <br>Cte. Balance</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" style="font-size: 5pt">Inter&eacute;s <br>Cte. Conting.</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" style="font-size: 5pt">Inter&eacute;s <br>Mora Balance</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" style="font-size: 5pt">Inter&eacute;s <br>Mora Conting.</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">Seguro<br>Vida</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">Seguro<br>Adicional</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" style="font-size: 5pt">Ley <br>MiPyme</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">Ley MiPyme<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" style="font-size: 5pt">Comision</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">Comision<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">GAC</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">GAC<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" style="font-size: 5pt">Gasto Extra<br>Judicial</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">Gasto Extra<br>Judicial IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">Gasto Extra Dif.</TH>
						<TH ALIGN=CENTER rowspan="2" width="3%" style="font-size: 5pt">Gasto Extra Dif.<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">Otros Gastos </TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">Otros Gastos<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="2%" style="font-size: 5pt">Est</TH>
						<TH ALIGN=CENTER rowspan="2" width="2%" style="font-size: 5pt">Dias<br>Ven.</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" style="font-size: 5pt">Fecha<br>Pago</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" style="font-size: 5pt">Total<br>Cuota</TH>							
					</TR>
				</TABLE>
			</td>
		</tr>
		<tr  height="95%">    
			<td nowrap="nowrap"> 
				<div id="dataDiv1"  style="overflow:auto; border: 0px;"> 
					<table id="dataTable" class="tableinfoList" style="border: 0; font-size: 5pt" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
						double sum01 = 0;
					 	double sum02 = 0;
					 	double sum03 = 0;
					 	double sum04 = 0;
					 	double sum05 = 0;
					 	double sum06 = 0;
					 	double sum07 = 0;
					 	double sum08 = 0;
					 	double sum09 = 0;
					 	double sum10 = 0;
					 	double sum11 = 0;
					 	double sum12 = 0;
					 	double sum13 = 0;
					 	double sum14 = 0;
					 	double sum15 = 0;
					 	double sum16 = 0;
					 	double sum17 = 0;
					 	double sum18 = 0;
					 	double sum19 = 0;
					 	double sumpnu = 0;
					 	double sumtot = 0;
						 
						 list = edl090008List;
						 list.initRow();
						 while (list.getNextRow()) {
						   EDL090008Message plan = (EDL090008Message) list.getRecord();
						   if(!plan.getH08FLGWK2().equals("P"))
						     continue;
						   sum01 += plan.getBigDecimalE08PAID01().doubleValue();
						   sum02 += plan.getBigDecimalE08PAID02().doubleValue();
						   sum03 += plan.getBigDecimalE08PAID03().doubleValue();
						   sum04 += plan.getBigDecimalE08PAID04().doubleValue();
						   sum05 += plan.getBigDecimalE08PAID05().doubleValue();
						   sum06 += plan.getBigDecimalE08PAID06().doubleValue();
						   sum07 += plan.getBigDecimalE08PAID07().doubleValue();
						   sum08 += plan.getBigDecimalE08PAID08().doubleValue();
						   sum09 += plan.getBigDecimalE08PAID09().doubleValue();
						   sum10 += plan.getBigDecimalE08PAID10().doubleValue();
						   sum11 += plan.getBigDecimalE08PAID11().doubleValue();
						   sum12 += plan.getBigDecimalE08PAID12().doubleValue();
						   sum13 += plan.getBigDecimalE08PAID13().doubleValue();
						   sum14 += plan.getBigDecimalE08PAID14().doubleValue();
						   sum15 += plan.getBigDecimalE08PAID15().doubleValue();
						   sum16 += plan.getBigDecimalE08PAID16().doubleValue();
						   sum17 += plan.getBigDecimalE08PAID17().doubleValue();
						   sum18 += plan.getBigDecimalE08PAID18().doubleValue();
						   sum19 += plan.getBigDecimalE08PAID19().doubleValue();
						  
						   sumpnu = 0;
						   sumpnu += plan.getBigDecimalE08PAID01().doubleValue() + plan.getBigDecimalE08PAID02().doubleValue()
								   +plan.getBigDecimalE08PAID03().doubleValue() + plan.getBigDecimalE08PAID04().doubleValue()
								   +plan.getBigDecimalE08PAID05().doubleValue() + plan.getBigDecimalE08PAID06().doubleValue()
								   +plan.getBigDecimalE08PAID07().doubleValue() + plan.getBigDecimalE08PAID08().doubleValue()
								   +plan.getBigDecimalE08PAID09().doubleValue() + plan.getBigDecimalE08PAID10().doubleValue()
								   +plan.getBigDecimalE08PAID11().doubleValue() + plan.getBigDecimalE08PAID12().doubleValue()
								   +plan.getBigDecimalE08PAID13().doubleValue() + plan.getBigDecimalE08PAID14().doubleValue()
								   +plan.getBigDecimalE08PAID15().doubleValue() + plan.getBigDecimalE08PAID16().doubleValue()
								   +plan.getBigDecimalE08PAID17().doubleValue() + plan.getBigDecimalE08PAID18().doubleValue()
								   +plan.getBigDecimalE08PAID19().doubleValue();
						   
						   sumtot = sum01 + sum02 + sum03 + sum04 + sum05 +sum06 +sum07 +sum08 + sum09
						   			+sum10 + sum11 + sum12 + sum13 + sum14 +sum15 +sum16 +sum17 + sum18 + sum19;
					%> 
						<tr id="dataTable<%= list.getCurrentRow() %>">
							<td nowrap align="right" width="3%">
								<% if   (plan.getE08DLPPNU().equals("77777")) out.print("Aceler.");
								else if (plan.getE08DLPPNU().equals("88888")) out.print("Abono");
								else if (plan.getE08DLPPNU().equals("88999")) out.print("Cargo");
								else if (plan.getE08DLPPNU().equals("96666")) out.print("Reest.");
								else if (plan.getE08DLPPNU().equals("96667")) out.print("Modif.");
								else if (plan.getE08DLPPNU().equals("99999")) out.print("Prepago");
								else out.print(plan.getE08DLPPNU());%>
							</td>
							<td nowrap align="center" width="4%">
								<%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE08DLPPDM().intValue(),plan.getBigDecimalE08DLPPDD().intValue(),plan.getBigDecimalE08DLPPDY().intValue())%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID01()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID02()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID03()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID04()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID05()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID06()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID07()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID08()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08PAID09()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID10()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08PAID11()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID12()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08PAID13()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID14()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08PAID15()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID16()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08PAID17()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID18()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08PAID19()%>
							</td>
							<td nowrap align="right" width="2%">
								<%=plan.getE08DLPSTS()%>
							</td>
							<td nowrap align="right" width="2%">
								<%=plan.getE08DLPVEN()%>
							</td>
							<td nowrap align="center" width="4%">
								<%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE08DLPDTM().intValue(),plan.getBigDecimalE08DLPDTD().intValue(),plan.getBigDecimalE08DLPDTY().intValue())%>
							</td>
								<td nowrap align="right" width="5%">
								<%=Util.formatCCY(sumpnu)%>
							</td>
						</tr>
					<% } %>
					</TABLE>
				</div>
			</td>
		</tr>
	</Table>  

	<h4>Totales Pagado</h4>
	<TABLE class="tableinfo"  cellpadding=2 cellspacing=3 >
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>PRINCIPAL : </b><%= Util.formatCCY(sum01) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES CTE BALANCE : </b><%= Util.formatCCY(sum02) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES CTE CONTING.: </b><%= Util.formatCCY(sum03) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES MORA BALANCE : </b><%= Util.formatCCY(sum04) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES MORA CONTING. : </b><%= Util.formatCCY(sum05) %></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>SEGURO VIDA : </b><%= Util.formatCCY(sum06) %></TD>
			<TD ALIGN=CENTER  nowrap><b>SEGURO ADICIONAL : </b><%= Util.formatCCY(sum07) %></TD>
			<TD ALIGN=CENTER  nowrap><b>LEY MIPYME: </b><%= Util.formatCCY(sum08) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE LEY MIPYME : </b><%= Util.formatCCY(sum09) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>COMISION : </b><%= Util.formatCCY(sum10) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE COMISION : </b><%= Util.formatCCY(sum11) %></TD>
			<TD ALIGN=CENTER  nowrap><b>GAC: </b><%= Util.formatCCY(sum12) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GAC : </b><%= Util.formatCCY(sum13) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>GASTO EXTRA JUDICIAL : </b><%= Util.formatCCY(sum14) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GASTO EXTRA JUDICIAL : </b><%= Util.formatCCY(sum15) %></TD>
			<TD ALIGN=CENTER  nowrap><b>GASTO EXTRA DIFERIDO : </b><%= Util.formatCCY(sum16) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GASTO EXTRA DIFERIDO : </b><%= Util.formatCCY(sum17) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>OTROS GASTOS: </b><%= Util.formatCCY(sum18) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE OTROS GASTOS : </b><%= Util.formatCCY(sum19) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
			<TD ALIGN=CENTER  nowrap></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3" >__________________________________________________________________________</TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3"><b>TOTAL PAGADO : </b><%= Util.formatCCY(sumtot) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
	</TABLE>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" OnClick="PrintPreview(3)" value="Imprimir">
		<input id="EIBSBTN" type=button name="Submit" OnClick="goExcel(3)" value="Excel">
		<input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Salir">
	</div>
	
</div> <!-- fin div tab3 -->

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
