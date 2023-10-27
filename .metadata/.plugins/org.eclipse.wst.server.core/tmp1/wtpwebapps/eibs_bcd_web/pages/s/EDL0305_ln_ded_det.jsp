<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>
<HTML>
<HEAD>
<TITLE>
Detalle de Cuota
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="lnDedDet" class="datapro.eibs.beans.EDL030503Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<BODY>

<form>
	<h3 align="center">Detalle de la Deducci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_ded_det.jsp,EDL0305"></h3>
	<hr size="4">
	<h4></h4>
	 
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="16%" > 
							<div align="right"><b>Cliente :</b></div>
						</td>
						<td nowrap width="20%" > 
							<div align="left"> 
								<input type="text" name="E02CUN2" size="14" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
							</div>
						</td>
						<td nowrap width="16%" > 
							<div align="right"><b>Nombre :</b> </div>
						</td>
						<td nowrap colspan="3" > 
							<div align="left"> 
								<input type="text" name="E02NA12" size="60" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
								</div>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="16%"> 
							<div align="right"><b>Cuenta :</b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left"> 
								<input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="16%"> 
							<div align="right"><b>Moneda : </b></div>
						</td>
						<td nowrap width="16%"> 
							<div align="left"><b> 
								<input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
								</b> </div>
						</td>
						<td nowrap width="16%"> 
							<div align="right"><b>Producto : </b></div>
						</td>
						<td nowrap width="16%"> 
							<div align="left"><b> 
								<input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
								</b> </div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<h4>&nbsp;</h4> <%int row = 1;%>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Deducci&oacute;n :</div>
						</td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%=lnDedDet.getE03DLICDE().trim()%>-<%=lnDedDet.getE03DLIRMK().trim()%></div>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Relaci&oacute;n Prestamo :</div>
						</td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%= lnDedDet.getE03DLIREF().trim()%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" >
							<div align="right">Plan de Seguro :</div>
						</td>
						<td nowrap width="25%" >
							<div align="left" style="color: black"><%= lnDedDet.getE03DLIPLN().trim()%>-<%= lnDedDet.getE03DSCPLN().trim()%></div>
						</td>
						<td nowrap width="25%" >
							<div align="right" >Poliza Numero :</div>
						</td>
						<td nowrap width="25%" >
							<div align="left" style="color: black"><%= lnDedDet.getE03DLIPLZ().trim()%></div>
						</td>            
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						 <td nowrap width="25%" > 
							<div align="right">Compa&ntilde;&iacute;a :</div>
						</td>
						<td nowrap width="25%" >  
							<div align="left" style="color: black"><%= lnDedDet.getE03DLICIA().trim()%>-<%= lnDedDet.getE03DSCCIA().trim()%></div>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Fecha Inicio :</div>
						</td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%= Util.formatCustomDate(currUser.getE01DTF(),
																		lnDedDet.getBigDecimalE03DLIPIM().intValue(),
																		lnDedDet.getBigDecimalE03DLIPID().intValue(),
																		lnDedDet.getBigDecimalE03DLIPIY().intValue())%></div>
						</td>
					</tr>
				 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" >
							<div align="right">Tabla Factor :</div>
						</td>
						<td nowrap width="25%" >
							<div align="left" style="color: black"><%= lnDedDet.getE03DLITBL().trim()%></div>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Fecha Vencimiento :</div>
						</td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%= Util.formatCustomDate(currUser.getE01DTF(),
																		lnDedDet.getBigDecimalE03DLIPFM().intValue(),
																		lnDedDet.getBigDecimalE03DLIPFD().intValue(),
																		lnDedDet.getBigDecimalE03DLIPFY().intValue())%></div>
						</td>          
					</tr>
					 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						 <td nowrap width="25%" > 
							<div align="right">Cobro de I.V.A :</div>
						</td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
								<%= lnDedDet.getE03DLIIVA().trim().equals("Y") ? "SI" : "NO" %>
							</div>
						</td>
						<td nowrap width="25%" >
							<div align="right">Numero de Meses :</div>
						</td>
						<td nowrap width="25%" >
							<div align="left" style="color: black"><%= lnDedDet.getE03DLINPM().trim()%></div>
						</td>            
					</tr>
					
	<% if ( lnDedDet.getH03FLGWK3().equals("3")) {%>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"> 
							<div align="right">Año Fabricación :</div>
						</td>
				<td width="25%" > 
					<div align="left" style="color: black"><%= lnDedDet.getE03DLIYOP().trim()%></div>
						</td>
						<td nowrap width="25%"> 
							<div align="right">Tabla Seguro :</div>
						</td>
			<td width="25%" >
				<div align="left" style="color: black"><%= lnDedDet.getE03DLITBL().trim()%></div> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"> 
							<div align="right">Meses de Seguro :</div>
						</td>
			<td width="25%" >
				<div align="left" style="color: black"><%= lnDedDet.getE03DLIINM().trim()%></div> 
						<td nowrap width="25%"> 
							<div align="right">Meses Incli.Princ.:</div>
						</td>
			<td width="25%" >
				<div align="left" style="color: black"><%= lnDedDet.getE03DLIDDY().trim()%></div> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"> 
							<div align="right">Pago 1er Año :</div>
						</td>
			<td width="25%" >
				<div align="left" style="color: black"><%= lnDedDet.getE03DLIBEG().trim()%></div>  
						</td>
						<td nowrap width="25%"> 
							<div align="right"></div>
						</td>
			<td width="25%" > 
						</td>
					</tr>
	<% } %>		  
					
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" >
							<div align="right">Cuenta Acreditar :</div>
						</td>
						<td nowrap width="25%" >
							<div align="left" style="color: black"><%= lnDedDet.getE03DLIBNK().trim()%>-<%= lnDedDet.getE03DLIBRN().trim()%>-<%= lnDedDet.getE03DLICCY().trim()%>-<%= lnDedDet.getE03DLIGLN().trim()%></div>
						</td>
						<td nowrap width="25%" >
							<div align="right">Cuenta Seguro :</div>
						</td>
						<td nowrap width="25%" >
							<div align="left" style="color: black"><%= lnDedDet.getE03DLIIAC().trim()%></div>
						</td>            
					</tr>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" >
							<div align="right">Monto Base Calculo :</div>
						</td>
						<td nowrap width="25%" >
							<div align="left" style="color: black">
							<%= lnDedDet.getE03DLIBSE().equals("O") ? "Monto Original" : "" %>
							<%= lnDedDet.getE03DLIBSE().equals("B") ? "Saldo Capital" : "" %>
							<%= lnDedDet.getE03DLIBSE().equals("I") ? "Saldo Teorico" : "" %>
							<%= lnDedDet.getE03DLIBSE().equals("S") ? "Saldo Insoluto" : "" %>
							<%= lnDedDet.getE03DLIBSE().equals("R") ? "Saldo Reestructurado" : "" %>
							<%= lnDedDet.getE03DLIBSE().equals("T") ? "Total Deuda" : "" %>
							<%= lnDedDet.getE03DLIBSE().equals("C") ? "Valor Cuota" : "" %>
							<%= lnDedDet.getE03DLIBSE().equals("A") ? "Valor Area Construida" : "" %>
							</div>
						</td>
						<td nowrap width="25%" >
							<div align="right">Valor de Compra :</div>
						</td>
						<td nowrap width="25%" >
							<div align="left" style="color: black"><%= Util.fcolorCCY(lnDedDet.getE03DLIPAM().trim())%></div>
						</td>            
					</tr>          
					 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Factor :</div>
						</td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"> 
								<%= lnDedDet.getE03DLIFAC().equals("F") ? "VALOR FIJO" : "" %>
								<%= lnDedDet.getE03DLIFAC().equals("P") ? "PORCENTAJE" : "" %>
								<%= lnDedDet.getE03DLIFAC().equals("1") ? "TASA/PERIODO" : "" %>   
								 <%= lnDedDet.getE03DLIFAC().equals("E") ? "ENDOSADO" : "" %>            
							</div>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Valor Deducci&oacute;n :</div>
						</td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%= lnDedDet.getE03DLIDPM().trim()%> </div>
						</td>         
					</tr>          
					 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Medio de Pago :</div>
						</td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"> 
								<%= lnDedDet.getE03DLIMPG().equals("L") ? "CON LAS CUOTAS" : "" %>
								<%= lnDedDet.getE03DLIMPG().equals("A") ? "CUENTA DE PAGO" : "" %>
								<%= lnDedDet.getE03DLIMPG().equals("N") ? "NUEVO CREDITO" : "" %>
								<%= lnDedDet.getE03DLIMPG().equals("P") ? "APERTURA PERIODICA" : "" %>
								<%= lnDedDet.getE03DLIMPG().equals("D") ? "APERTURA DIFERIDA" : "" %>
							</div>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tipo Deducci&oacute;n : </div>
						</td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%= lnDedDet.getE03DSCTYP().trim()%> </div>
						</td>         
					</tr>         

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
