<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Bills Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EBP0160Record" class="datapro.eibs.beans.EBP016001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </SCRIPT>

<script type="text/javascript">

</SCRIPT>

</head>

<body>

<h3 align="center">Consulta - Facturas
	<% 
	if (userPO.getType().equals("V")) { 
		out.println(" Proveedor "); 
	} 
	else if (userPO.getType().equals("C")) {
			out.println("Cliente "); 
			}			  
	else { out.println("Documento Origen Obligación ");
	} 
	%>
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bills_inquiry_detail.jsp, EBP0160">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160" >
	<input TYPE=HIDDEN name="SCREEN" value="5">
 	<input TYPE=HIDDEN name="E01BPBNUM" value="<%= EBP0160Record.getE01BPBNUM()%>">
	<input TYPE=HIDDEN name="E01BPBTYP" value="<%= EBP0160Record.getE01BPBTYP()%>">
	<input TYPE=HIDDEN name="E01BPBSTS" value="<%= EBP0160Record.getE01BPBSTS()%>">
	<input TYPE=HIDDEN name="userpox" value="<%= userPO.getPurpose()%>"> 

	<table  class="tableinfo" width="100%">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<H5>Información Factura</H5>  
				<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
        			<tr id="trdark"> 
						<td nowrap width="25%" align="left"> <B>Número Interno : </B><%= EBP0160Record.getE01BPBNUM()%></td>
						<td nowrap width="35%" align="left"> <B>Proveedor : </B><%= EBP0160Record.getE01BPBCOD()%>  <%= EBP0160Record.getE01BPBVCN()%> </td>
						<td nowrap width="20%" align="left"> <B>Tipo : </B><%= EBP0160Record.getE01BPBTYPD()%> 
							<% if (userPO.getType().equals("C") )  { 	
								out.println(EBP0160Record.getE01BPBCUN().trim());
			  				}%>  
						</td>
							<% if (EBP0160Record.getE01BPBORD().equals("0"))  { %>
						<td nowrap width="25%" align="left"></td>
							<% } else { %>
						<td nowrap width="25%" align="left"><B> <%= EBP0160Record.getE01BPBKIND() %> </B> <%= EBP0160Record.getE01BPBORD()%></td>
							<% } %>
					</tr>	
					<tr id="trclear">
						<td nowrap width="25%" align="left"><B><U>Información Básica</U> </B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="25%" align="left"><B>Referencia Factura :</B> <%= EBP0160Record.getE01BPBBIL()%></td>
						<td nowrap width="25%" align="Left"><B>Descripcion Factura :</B> <%= EBP0160Record.getE01BPBDSC()%></td>
						<td nowrap width="30%" align="left"><B>Monto Total : </B><%= EBP0160Record.getE01BPBBAM()%></td>
						<td nowrap width="20%" align="left"></td>
					</tr>
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>Banco : </B><%= EBP0160Record.getE01BPBBNK()%> 
															<B>Agencia : </B><%= EBP0160Record.getE01BPBBRN()%>
															<B>Moneda : </B><%= EBP0160Record.getE01BPBCCY()%>
						</td>
						<td nowrap width="20%" align="left"><B>Fecha Factura :</B> <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), EBP0160Record.getE01BPBIVM(),EBP0160Record.getE01BPBIVD(),EBP0160Record.getE01BPBIVY())%></td>    
						<td nowrap width="55%" align="left"><B>Observaciones : </B><%= EBP0160Record.getE01BPBRM1()%><br><%= EBP0160Record.getE01BPBRM2()%></td>
					</tr>
					<tr id="trdark">
						<td nowrap width="25%" align="left"><B><U>Información de Pago</U></B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr  id="trclear"> 
						<td nowrap width="25%" align="left"><B>Fecha Vencimiento Pago : </B><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),EBP0160Record.getE01BPBPDM(),EBP0160Record.getE01BPBPDD(),EBP0160Record.getE01BPBPDY())%></td>
						<td nowrap width="25%" align="left"><B>Tipo de Pago : </B>
							<% if (EBP0160Record.getE01BPBPTY().equals("F")) out.print("Monto Fijo");%>		              
							<% if (EBP0160Record.getE01BPBPTY().equals("V")) out.print("Monto Variable");%>
						</td>
						<td nowrap width="25%" align="left"><B>Monto Mínimo de Pago : </B><%= EBP0160Record.getE01BPBMAM()%></td>
						<td nowrap width="25%" align="left"></td>
					</tr> 
					<tr id="trdark"> 
						<td nowrap width="25%" align="left"><B>Frecuencia : </B>
							<% if (EBP0160Record.getE01BPBPFR().equals("O")) out.print("Una Vez");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("W")) out.print("Semanal");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("B")) out.print("Bi-Semanal");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("M")) out.print("Mensual");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("Q")) out.print("Trimestral");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("P")) out.print("Plan de Pagos");%>
							<% if (EBP0160Record.getE01BPBPFR().equals("Y")) out.print("Anual");%></td> 
						<td nowrap width="25%" align="left"><B>Día de Pago : </B><%= EBP0160Record.getE01BPBDAY()%></td>
						<td nowrap width="25%" align="left"><B>Número de Pagos : </B><%= EBP0160Record.getE01BPBNOP()%></td>
						<td nowrap width="25%" align="left"><B>Fecha Inicio de Pago : </B><%= datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(), EBP0160Record.getE01BPBIDM(),EBP0160Record.getE01BPBIDD(),EBP0160Record.getE01BPBIDY())%></td>
					</tr>	
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>Límites de Pago : </B> 
							<% if (EBP0160Record.getE01BPBPLI().equals("T")) out.print("Total Factura");%>
							<% if (EBP0160Record.getE01BPBPLI().equals("F")) out.print("Monto Fijo");%>
							<% if (EBP0160Record.getE01BPBPLI().equals("P")) out.print("Porcentaje");%>
						</td>
						<td nowrap width="25%" align="left"><B>% Tolerancia  : </B><%= EBP0160Record.getE01BPBPER()%></td>
						<td nowrap width="25%" align="left"><B>Payment Via : </B> 
							<% if (EBP0160Record.getE01BPBPVI().equals("A")) out.print("ACH");%>
							<% if (EBP0160Record.getE01BPBPVI().equals("R")) out.print("Cta. Corriente");%>
							<% if (EBP0160Record.getE01BPBPVI().equals("G")) out.print("Cta. Contable");%>
							<% if (EBP0160Record.getE01BPBPVI().equals("C")) out.print("Cheque Gerencia");%>
							<% if (EBP0160Record.getE01BPBPVI().equals("S")) out.print("Swift");%>
							<% if (EBP0160Record.getE01BPBPVI().equals("F")) out.print("Transferencia");%>
						</td>
						<td nowrap width="25%" align="left"></td>
					</tr>	
					<tr id="trdark">
						<td nowrap width="25%" align="left"><B><U>Información Cuenta Contable</U></B></td> 
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trclear" > 
						<td nowrap width="10%" align="left"><B>Amortización : </B> 
							<% if (EBP0160Record.getE01BPBAMC().equals("Y")) out.print("Si"); %>
							<% if (EBP0160Record.getE01BPBAMC().equals("N")) out.print("No"); %>
						</td>
						<% if (EBP0160Record.getE01BPBAMC().equals("Y")) { %>    
						<td nowrap width="25%" align="left"><B>Iniciar Amortización	en: Año : </B> <%= EBP0160Record.getE01BPBAYY()%>
															<B>Mes : </B><%= EBP0160Record.getE01BPBAMM()%></td>
						<td nowrap width="25%" align="left"><B>Número de Meses : </B><%= EBP0160Record.getE01BPBAMS()%> </td>
						<td nowrap width="40%" align="left"></td>
						<% } else { %>
						<td nowrap width="90%" align="left"></td>
						<% }; %>
					</tr>
					<tr id="trdark">
						<td nowrap width="25%" align="left"><B><U>Información Fiscal</U> </B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>Tipo Bienes o Servicios Comprados :</B> <%= EBP0160Record.getE01BPBETY()%> <%= EBP0160Record.getE01BPBETYD()%></td>
						<td nowrap width="25%" align="Left"><B>Origen:</B> 
							<% if (EBP0160Record.getE01BPBLFS().equals("L")) out.print("Local");%>	
							<% if (EBP0160Record.getE01BPBLFS().equals("F")) out.print("Extranjero");%>
						</td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="25%" align="left"><B>Cantidad de Periodos : </B><%= EBP0160Record.getE01BPBPFN()%></td>
						<td nowrap width="25%" align="left"><B>Número de Pagos por Periodo :</B> <%= EBP0160Record.getE01BPBPFP()%> </td>
						<td nowrap width="25%" align="Left"><B>Año fiscal (aa):</B> <%= EBP0160Record.getE01BPBPFY()%></td>
						<td nowrap width="25%" align="left"><B>Monto Pago Por Periodo : </B><%= EBP0160Record.getE01BPBPYF()%></td>
						
					</tr>
					<tr id="trdark">
						<td nowrap width="25%" align="left"><B><U>Información Presupuesto</U> </B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>Identificación Presupuesto :</B> <%= EBP0160Record.getE01BPBBID()%> </td>
						<td nowrap width="25%" align="Left"><B>Código Presupuesto :</B> <%= EBP0160Record.getE01BPBBCD()%></td>
						<td nowrap width="30%" align="left"><B></B></td>
						<td nowrap width="20%" align="left"></td>
					</tr>
					<tr id="trdark">
						<td nowrap width="25%" align="left"><B><U>Información Penalización</U> </B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>% por Incumplimiento Fecha Entrega :</B> <%= EBP0160Record.getE01BPBPPF()%> </td>
						<td nowrap width="25%" align="Left"><B>% por Servicio No Conforme  :</B> <%= EBP0160Record.getE01BPBPPC()%></td>
						<td nowrap width="30%" align="left"><B></B></td>
						<td nowrap width="20%" align="left"></td>
					</tr>
					<% if (EBP0160Record.getE01BPBSTS().equals("S")) { %>
					<tr id="trclear">
						<td nowrap width="25%" align="left"><B><U>Información Suspensión </U></B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trdark" >
						<td nowrap width="25%" align="left"><B>Suspender en Fecha :</B> <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), EBP0160Record.getE01BPBSDM(),EBP0160Record.getE01BPBSDD(),EBP0160Record.getE01BPBSDY())%></td>
						<td nowrap width="25%" align="left"><B>Razón de Suspensión :</B> <%= EBP0160Record.getE01BPBSDS()%></td>
						<td nowrap width="50%" align="left"></td>
					</tr>
					<% } %>
				</table>
	<BR>	
    			<h5>Información Estadística</h5> 
				<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="trdark"> 
						<td nowrap width="25%" align="left"><B>Ultima Fecha de Pago : </B><%= datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(), EBP0160Record.getE01BPBLPM(),EBP0160Record.getE01BPBLPD(),EBP0160Record.getE01BPBLPY())%></td>
						<td nowrap width="25%" align="left"><B>Pagos realizados : </B><%= EBP0160Record.getE01BPBPMD()%> </td>
						<td nowrap width="25%" align="left"><B>Monto Retenido : </B><%= EBP0160Record.getE01BPBWAM()%> </td>
						<% if (EBP0160Record.getE01BPBTYP().equals("C")) { %>    
						<td nowrap width="25%" align="left"><B>Total Pagos por Comisiones : </B><%= EBP0160Record.getE01BPBTFE()%></td>
						<% } else { %>
						<td nowrap width="25%" align="left"></td>
						<% }; %>
					</tr>
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>Año Pagado : </B><%= EBP0160Record.getE01BPBPYT()%></td>
						<td nowrap width="25%" align="left"><B>Pago Ultimo Año : </B><%= EBP0160Record.getE01BPBPLT()%></td>
						<td nowrap width="50%" align="left"></td>
					</tr>	
					<% if (userPO.getHeader1().equals("C") )  { %>
					<tr id="trdark">
						<td nowrap width="25%" align="left"><B><U>Información de Comisiones</U></B></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"></td>
					</tr>
					<tr id="trclear"> 
						<td nowrap width="25%" align="left"><B>Tabla Comisión : </B><%= EBP0160Record.getE01BPBFCO()%></td>
						<td nowrap width="25%" align="left"><B>Monto Comisión : </B><%= EBP0160Record.getE01BPBFAM()%></td>
						<td nowrap width="50%" align="left"></td>
					</tr>
					<% } %>
				</table>
	<BR>
	
				<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="trdark"> 
						<td nowrap width="25%" align="left"><B>Estado : </B> <%= EBP0160Record.getE01BPBSTD()%> 
						</td>
						<td nowrap width="25%" align="left"><B>Fecha Aprobación/Rechazo : </B><%= datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(), EBP0160Record.getE01BPBADM(),EBP0160Record.getE01BPBADD(),EBP0160Record.getE01BPBADY())%></td>
						<td nowrap width="25%" align="left"></td>
						<td nowrap width="25%" align="left"><B>Fecha Creación : </B><%= datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(), EBP0160Record.getE01BPBRDM(),EBP0160Record.getE01BPBRDD(),EBP0160Record.getE01BPBRDY())%></td>			
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
