<html>
<head>

<jsp:useBean id="cifData" class="datapro.eibs.beans.ECIF21501Message" 
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />

<title>Saldos y Deuda Consolidada (M$) al <%=cifData.getE01FRF()%></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	 builtNewMenu(ecif10_i_opt);

</SCRIPT>


</head>

<BODY>

<SCRIPT> initMenu(); </SCRIPT>

<h3 align="center">Saldos y Deuda Consolidada (M$) al <%=cifData.getE01FRF()%><img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="cif_saldos_deuda_consolidada.jsp,ECIF010"></h3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010">
<INPUT TYPE=HIDDEN NAME="SCREEN" value="10"> <INPUT TYPE=HIDDEN
	NAME="opt" VALUE="1">

<h4>Informaci&oacute;n del Cliente</h4>
<table class="tableinfo">
	<tr id="trdark">
		<td nowrap>
		<table class=tbhead cellspacing="0" cellpadding="2" width="100%"
			align="center">
			<tr>
				<td nowrap width="15%" align="center">Cliente</td>
				<td nowrap width="15%" align="left"><input type="text"
					size="10" name="CUN" value="<%=cifData.getE01CUN()%>"></td>
				<td nowrap width="25%" align="left"><input type="text"
					size="35" name="DCUN" value="<%=cifData.getE01CUN()%>"></td>
				<td nowrap width="15%" align="left"><input type="text"
					size="10" name="EST" value="<%=cifData.getE01EST()%>"></td>
				<td nowrap width="15%" align="center">Rut</td>
				<td nowrap width="15%" align="left"><input type="text"
					size="10" name="RUT" value="<%=cifData.getE01RUT()%>"></td>
			</tr>
			<tr>
				<td nowrap width="15%" align="center">Convenio</td>
				<td nowrap width="15%" align="left"><input type="text"
					size="10" name="CVN" value="<%=cifData.getE01CVN()%>"></td>
				<td nowrap width="25%" align="left"><input type="text"
					size="35" name="DCVN" value="<%=cifData.getE01CVN()%>"></td>
				<td nowrap width="15%" align="left"><input type="text"
					size="10" name="FSC" value="<%=cifData.getE01FSC()%>"></td>
				<td nowrap width="15%" align="center">Oficina</td>
				<td nowrap width="15%" align="left"><input type="text"
					size="10" name="OFC" value="<%=cifData.getE01OFC()%>"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<br>
<br>

<!-- TABLA 1 -->
<TABLE class="tableinfo" ALIGN=CENTER>
	<TR>
		<TD>
		<TABLE id="headTable1" border=0 width=100% cellpadding=2 cellspacing=2>
			<TR id="trdark">
				<TH width="20%" align="center" nowrap>Sistema Financiero</TH>
				<TH width="20%" ALIGN=CENTER nowrap>Estado Deuda</TH>
				<TH width="15%" ALIGN=CENTER nowrap><%=cifData.getE01FRF01()%></TH>
				<TH width="15%" ALIGN=CENTER nowrap><%=cifData.getE01FRF02()%></TH>
				<TH width="15%" ALIGN=CENTER nowrap><%=cifData.getE01FRF03()%></TH>
				<TH width="15%" ALIGN=CENTER nowrap><%=cifData.getE01FRF04()%></TH>
			</TR>
			<TR id="trclear">
				<TH align="left" rowspan="6">Mora Deuda Directa</TH>
				<TD ALIGN=left nowrap>Al d&iacute;a</TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDADIA01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDADIA02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDADIA03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDADIA04()%></TD>
			</TR>
			<TR id="trclear">
				<TD ALIGN=left nowrap>Mora 30-90 ds</TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR101()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR102()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR103()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR104()%></TD>
			</TR>
			<TR id="trclear">
				<TD ALIGN=left nowrap>Mora 90 a 180 ds</TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR201()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR202()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR203()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR204()%></TD>
			</TR>
			<TR id="trclear">
				<TD ALIGN=left nowrap>Mora 180 ds a 3 a&ntilde;os</TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR301()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR302()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR303()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR304()%></TD>
			</TR>
			<TR id="trclear">
				<TD ALIGN=left nowrap>Mora &gt; 3 a&ntilde;os</TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR401()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR402()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR403()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDMOR404()%></TD>
			</TR>
			<TR id="trclear">
				<TD ALIGN=left nowrap>Total</TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDTOTL01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDTOTL02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDTOTL03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDTOTL04()%></TD>
			</TR>
			<tr>
				<td colspan="6">
				<hr>
				</td>
			</tr>
			<TR id="trclear">
				<TH align="left" rowspan="4" nowrap>Mora Deuda Indirecta</TH>
				<TD ALIGN="left" nowrap>Al d&iacute;a</TD>
				<TD align="right" nowrap><%=cifData.getEDIADIA01()%></TD>
				<TD align="right" nowrap><%=cifData.getEDIADIA02()%></TD>
				<TD align="right" nowrap><%=cifData.getEDIADIA03()%></TD>
				<TD align="right" nowrap><%=cifData.getEDIADIA04()%></TD>
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Mora 30 ds a 3 a&ntilde;os</td>
				<TD ALIGN=right nowrap><%=cifData.getEDIMOR101()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDIMOR102()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDIMOR103()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDIMOR104()%></TD>
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Mora &gt; 3 a&ntilde;os</td>
				<TD ALIGN=right nowrap><%=cifData.getEDIMOR201()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDIMOR202()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDIMOR203()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDIMOR204()%></TD>
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Total</td>
				<TD ALIGN=right nowrap><%=cifData.getEDITOTL01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDITOTL02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDITOTL03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDITOTL04()%></TD>
			</TR>
			<tr>
				<td colspan="6">
				<hr>
				</td>
			</tr>
			<TR id="trclear">
				<TH align="left" rowspan="5" nowrap>Tipo Deuda Directa</TH>
				<td ALIGN=left nowrap>Nro. Int. c/Consumo</td>
				<TD ALIGN=right nowrap><%=cifData.getEDDPNIN01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPNIN02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPNIN03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPNIN04()%></TD>
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Consumo</td>
				<TD ALIGN=right nowrap><%=cifData.getEDDPCON01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPCON02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPCON03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPCON04()%></TD>
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Comercial</td>
				<TD ALIGN=right nowrap><%=cifData.getEDDPCOM01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPCOM02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPCOM03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPCOM04()%></TD>
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Hipotecario Vivienda</td>
				<TD ALIGN=right nowrap><%=cifData.getEDDPHIP01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPHIP02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPHIP03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPHIP04()%></TD>
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Total</td>
				<TD ALIGN=right nowrap><%=cifData.getEDDPTOT01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPTOT02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPTOT03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEDDPTOT04()%></TD>
			</TR>
			<TR id="trclear">
				<TH align="left" rowspan="5" nowrap>Otras Deudas Directa</TH>
				<td ALIGN=left nowrap>Deuda Adquirida</td>
				<TD ALIGN=right nowrap><%=cifData.getEODDADQ01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDADQ02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDADQ03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDADQ04()%></TD>
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Op. Financieras</td>
				<TD ALIGN=right nowrap><%=cifData.getEODDOFI01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDOFI02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDOFI03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDOFI04()%></TD>
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Prest. Contingentes</td>
				<TD ALIGN=right nowrap><%=cifData.getEODDCTG01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDCTG02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDCTG03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDCTG04()%></TD>
			</TR>			
			<TR id="trclear">
				<td ALIGN=left nowrap>Leasing</td>
				<TD ALIGN=right nowrap><%=cifData.getEODDLSG01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDLSG02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDLSG03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDLSG04()%></TD>
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Total</td>
				<TD ALIGN=right nowrap><%=cifData.getEODDTOT01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDTOT02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDTOT03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEODDTOT04()%></TD>
			</TR>			
			<TR id="trdark">
				<TH ALIGN=left nowrap>Linea Cred Disp.</TH>
				<td ALIGN=left nowrap>Total</td>
				<TD ALIGN=right nowrap><%=cifData.getELCPTOT01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getELCPTOT02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getELCPTOT03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getELCPTOT04()%></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<!-- FIN TABLA 1 --> <br>
<br>
<!-- TABLA 2 -->
<TABLE class="tableinfo" ALIGN=CENTER>
	<TR>
		<TD>
		<TABLE id="headTable1" border=0 width=100% cellpadding=2 cellspacing=2>
			<TR id="trdark">
				<TH width="13%" align="center" nowrap>Deuda Coopeuch</TH>
				<TH width="15%" ALIGN=CENTER nowrap>Estado Deuda</TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF01()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF02()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF03()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF04()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF05()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF06()%></TH>				
			</TR>
			<TR id="trclear">
				<TH align="left" rowspan="6">Deuda Directa</TH>
				<TD ALIGN=left nowrap>Al d&iacute;a</TD>
				<TD ALIGN=right nowrap><%=cifData.getECDADIA01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDADIA02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDADIA03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDADIA04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDADIA05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDADIA06()%></TD>				
			</TR>
			<TR id="trclear">
				<TD ALIGN=left nowrap>Mora 30-90 ds</TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR101()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR102()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR103()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR104()%></TD>
			</TR>
			<TR id="trclear">
				<TD ALIGN=left nowrap>Mora 90 a 180 ds</TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR201()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR202()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR203()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR204()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR205()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR206()%></TD>				
			</TR>
			<TR id="trclear">
				<TD ALIGN=left nowrap>Mora 180 ds a 3 a&ntilde;os</TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR301()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR302()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR303()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR304()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR305()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR306()%></TD>				
			</TR>
			<TR id="trclear">
				<TD ALIGN=left nowrap>Mora &gt; 3 a&ntilde;os</TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR401()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR402()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR403()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR404()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR405()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDMOR406()%></TD>				
			</TR>
			<TR id="trclear">
				<TD ALIGN=left nowrap>Total</TD>
				<TD ALIGN=right nowrap><%=cifData.getECDTOTL01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDTOTL02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDTOTL03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDTOTL04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDTOTL05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDTOTL06()%></TD>				
			</TR>
			<tr>
				<td colspan="6">
				<hr>
				</td>
			</tr>
			<TR id="trclear">
				<TH align="left" rowspan="4" nowrap>Deuda Indirecta</TH>
				<TD ALIGN="left" nowrap>Al d&iacute;a</TD>
				<TD align="right" nowrap><%=cifData.getECIADIA01()%></TD>
				<TD align="right" nowrap><%=cifData.getECIADIA02()%></TD>
				<TD align="right" nowrap><%=cifData.getECIADIA03()%></TD>
				<TD align="right" nowrap><%=cifData.getECIADIA04()%></TD>
				<TD align="right" nowrap><%=cifData.getECIADIA05()%></TD>
				<TD align="right" nowrap><%=cifData.getECIADIA06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Mora 30 ds a 3 a&ntilde;os</td>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR101()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR102()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR103()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR104()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR105()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR106()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Mora &gt; 3 a&ntilde;os</td>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR201()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR202()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR203()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR204()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR205()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECIMOR206()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Total</td>
				<TD ALIGN=right nowrap><%=cifData.getECITOTL01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECITOTL02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECITOTL03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECITOTL04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECITOTL05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECITOTL06()%></TD>				
			</TR>
			<tr>
				<td colspan="6">
				<hr>
				</td>
			</tr>
			<TR id="trclear">
				<TH align="left" rowspan="4" nowrap>Deuda Directa</TH>
				<td ALIGN=left nowrap>Consumo</td>
				<TD ALIGN=right nowrap><%=cifData.getECDPCON01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPCON02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPCON03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPCON04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPCON05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPCON06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Comercial</td>
				<TD ALIGN=right nowrap><%=cifData.getECDPCOM01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPCOM02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPCOM03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPCOM04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPCOM05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPCOM06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Hipotecario Vivienda</td>
				<TD ALIGN=right nowrap><%=cifData.getECDPHIP01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPHIP02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPHIP03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPHIP04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPHIP05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPHIP06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Total</td>
				<TD ALIGN=right nowrap><%=cifData.getECDPTOT01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPTOT02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPTOT03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPTOT04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPTOT05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getECDPTOT06()%></TD>				
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<!-- FIN TABLA 2 --> <br>
<br>
<!--  TABLA 3 -->
<TABLE class="tableinfo" ALIGN=CENTER>
	<TR>
		<TD>
		<TABLE id="headTable1" border=0 width=100% cellpadding=2 cellspacing=2>
			<TR id="trdark">
				<TH width="13%" align="center" nowrap>Total General</TH>
				<TH width="15%" ALIGN=CENTER nowrap>Concepto</TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF01()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF02()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF03()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF04()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF05()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF06()%></TH>				
			</TR>
			<TR id="trclear">
				<TH align="left" rowspan="7" nowrap>Totales</TH>
				<td ALIGN=left nowrap>Consumo</td>
				<TD ALIGN=right nowrap><%=cifData.getETOTCON01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTCON02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTCON03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTCON04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTCON05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTCON06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Comercial</td>
				<TD ALIGN=right nowrap><%=cifData.getETOTCOM01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTCOM02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTCOM03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTCOM04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTCOM05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTCOM06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Hipotecario Vivienda</td>
				<TD ALIGN=right nowrap><%=cifData.getETOTHIP01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTHIP02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTHIP03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTHIP04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTHIP05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTHIP06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap><b>Total</b></td>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL101()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL102()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL103()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL104()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL105()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL106()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Deuda Directa</td>
				<TD ALIGN=right nowrap><%=cifData.getETOTDD001()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTDD002()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTDD003()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTDD004()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTDD005()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTDD006()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Deuda Indirecta</td>
				<TD ALIGN=right nowrap><%=cifData.getETOTDIM01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTDIM02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTDIM03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTDIM04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTDIM05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTDIM06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap><b>Total</b></td>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL201()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL202()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL203()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL204()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL205()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETOTAL206()%></TD>				
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<!-- FIN TABLA 3 --> <br>
<br>
<!--  TABLA 4 -->
<TABLE class="tableinfo" ALIGN=CENTER>
	<TR>
		<TD>
		<TABLE id="headTable1" border=0 width=100% cellpadding=2 cellspacing=2>
			<TR id="trdark">
				<TH width="13%" align="center" nowrap>Acreedores Coopeuch</TH>
				<TH width="15%" ALIGN=CENTER nowrap>Concepto</TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF01()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF02()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF03()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF04()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF05()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF06()%></TH>				
			</TR>
			<TR id="trclear">
				<TH align="left" rowspan="6" nowrap>&nbsp;</TH>
				<td ALIGN=left nowrap>Cuotas Participaci&oacute;n</td>
				<TD ALIGN=right nowrap><%=cifData.getEACRPAR01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRPAR02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRPAR03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRPAR04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRPAR05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRPAR06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Cuentas de Ahorro</td>
				<TD ALIGN=right nowrap><%=cifData.getEACRAHO01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRAHO02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRAHO03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRAHO04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRAHO05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRAHO06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Cuentas a la Vista</td>
				<TD ALIGN=right nowrap><%=cifData.getEACRCVI01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRCVI02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRCVI03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRCVI04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRCVI05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRCVI06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Captaciones</td>
				<TD ALIGN=right nowrap><%=cifData.getEACRCAP01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRCAP02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRCAP03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRCAP04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRCAP05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRCAP06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Varios Acreedores</td>
				<TD ALIGN=right nowrap><%=cifData.getEACRVAC01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRVAC02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRVAC03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRVAC04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRVAC05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRVAC06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap><b>Total</b></td>
				<TD ALIGN=right nowrap><%=cifData.getEACRTOT01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRTOT02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRTOT03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRTOT04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRTOT05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEACRTOT06()%></TD>				
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<!-- FIN TABLA 4 --> 
<br>
<br>
<TABLE class="tableinfo" ALIGN=CENTER>
	<TR>
		<TD>
		<TABLE id="headTable1" border=0 width=100% cellpadding=2 cellspacing=2>
			<TR id="trdark">
				<TH width="13%" align="center" nowrap>T. Cr&eacute;dito</TH>
				<TH width="15%" ALIGN=CENTER nowrap>Concepto</TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF01()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF02()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF03()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF04()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF05()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getE01FRF06()%></TH>				
			</TR>
			<TR id="trclear">
				<TH align="left" rowspan="3" nowrap>&nbsp;</TH>
				<td ALIGN=left nowrap>Otorgado</td>
				<TD ALIGN=right nowrap><%=cifData.getETCROTO01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCROTO02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCROTO03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCROTO04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCROTO05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCROTO06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Utilizado</td>
				<TD ALIGN=right nowrap><%=cifData.getETCRUTI01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCRUTI02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCRUTI03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCRUTI04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCRUTI05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCRUTI06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>~Disponible</td>
				<TD ALIGN=right nowrap><%=cifData.getETCRDIS01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCRDIS02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCRDIS03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCRDIS04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCRDIS05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getETCRDIS06()%></TD>				
			</TR>
			</TABLE>			
		</TD>
	</TR>
</TABLE>
<br>
<TABLE class="tableinfo" ALIGN=CENTER>
	<TR>
		<TD>
		<TABLE id="headTable1" border=0 width=100% cellpadding=2 cellspacing=2>
			<TR id="trdark">
				<TH width="13%" rowspan="3" nowrap>Garant&iacute;as</TH>
				<TH width="15%" ALIGN=CENTER nowrap>Generales</TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getEGARGNR01()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getEGARGNR02()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getEGARGNR03()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getEGARGNR04()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getEGARGNR05()%></TH>
				<TH width="12%" ALIGN=CENTER nowrap><%=cifData.getEGARGNR06()%></TH>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap>Espec&iacute;ficas</td>
				<TD ALIGN=right nowrap><%=cifData.getEGARESP01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEGARESP02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEGARESP03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEGARESP04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEGARESP05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEGARESP06()%></TD>				
			</TR>
			<TR id="trclear">
				<td ALIGN=left nowrap><b>Total</b></td>
				<TD ALIGN=right nowrap><%=cifData.getEGARTOT01()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEGARTOT02()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEGARTOT03()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEGARTOT04()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEGARTOT05()%></TD>
				<TD ALIGN=right nowrap><%=cifData.getEGARTOT06()%></TD>				
			</TR>
			</TABLE>			
		</TD>
	</TR>
</TABLE>
<br>
<br>
<br>

<SCRIPT type="text/javascript">
   function tableResize() {
     adjustDifTables('headTable1','dataTable1','dataDiv1',1,1);
     adjustDifTables('headTable2','dataTable2','dataDiv2',1,1);
   }
  tableResize();
  window.onresize=tableResize; 
</SCRIPT></form>
</body>
</html>
