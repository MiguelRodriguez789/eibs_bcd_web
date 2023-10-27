<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>
<HTML>
<HEAD>
<TITLE>Detalle de Cuota</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="lnComDet" class="datapro.eibs.beans.EDL030504Message"  scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<BODY>

<form>
	<h3 align="center">Detalle de la Comisi&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_com_det.jsp,EDL0305"></h3>
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
							<div align="left">
								<b><input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly></b>
							</div>
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
	
	<h4>&nbsp;</h4> <%int row = 1;%>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Comisi&oacute;n :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black"><%=lnComDet.getE04DCOCDE().trim()%>-<%= lnComDet.getE04DCONAR().trim()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Tipo Cargo :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
								<%= lnComDet.getE04DCOAPC().equals("1") ? "IMPUESTO" : "" %>
								<%= lnComDet.getE04DCOAPC().equals("2") ? "COMISION" : "" %>
								<%= lnComDet.getE04DCOAPC().equals("6") ? "NOTARIOS" : "" %>
								<%= lnComDet.getE04DCOAPC().equals("7") ? "OTROS" : "" %>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Fecha Inicial :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
								<%= Util.formatCustomDate(currUser.getE01DTF(),
										lnComDet.getBigDecimalE04DCOODM().intValue(),
										lnComDet.getBigDecimalE04DCOODD().intValue(),
										lnComDet.getBigDecimalE04DCOODY().intValue()) %>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha Final :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
								<%= Util.formatCustomDate(currUser.getE01DTF(),
										lnComDet.getBigDecimalE04DCODTM().intValue(),
										lnComDet.getBigDecimalE04DCODTD().intValue(),
										lnComDet.getBigDecimalE04DCODTY().intValue()) %>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Base Calculo :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
								<%= lnComDet.getE04DCOBSC().equals("O") ? "MONTO ORIGINAL" : "" %>
								<%= lnComDet.getE04DCOBSC().equals("B") ? "SALDO CAPITAL" : "" %>
								<%= lnComDet.getE04DCOBSC().equals("I") ? "SALDO TEORICO" : "" %>
								<%= lnComDet.getE04DCOBSC().equals("T") ? "TOTAL DEUDA" : "" %>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Factor Calculo :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
								<%= lnComDet.getE04DCOTVA().equals("F") ? "MONTO FIJO" : "" %>
								<%= lnComDet.getE04DCOTVA().equals("P") ? "PORCENTAJE" : "" %>
								<%= lnComDet.getE04DCOTVA().equals("1") ? "TASA/PERIODO" : "" %>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Valor Cargo :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
								<%= Util.fcolorCCY(lnComDet.getE04DCOFVA().trim())%>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Valor Comision :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
								<%= Util.fcolorCCY(lnComDet.getE04DCOAMT().trim())%>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Forma de pago :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
								<%= lnComDet.getE04DCOPVI().equals("1") ? "APERTURA" : "" %>
								<%= lnComDet.getE04DCOPVI().equals("2") ? "EN CUOTAS" : "" %>
								<%= lnComDet.getE04DCOPVI().equals("3") ? "TODAS LAS CUOTAS" : "" %>
								<%= lnComDet.getE04DCOPVI().equals("4") ? "APERTURA Y CUOTAS" : "" %>
								<%= lnComDet.getE04DCOPVI().equals("5") ? "APERTURA PERIODICA" : "" %>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Numero de Cuotas :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
								<%= lnComDet.getE04DCONCU().trim()%>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Medio de Pago :</div></td>
						<td nowrap width="25%" > 
							<div align="left" style="color: black">
									<%= lnComDet.getE04DCOMPG().equals("D") ? "DESEMBOLSO" : "" %>
									<%= lnComDet.getE04DCOMPG().equals("A") ? "CUENTA CLIENTE" : "" %>
									<%= lnComDet.getE04DCOMPG().equals("G") ? "CUENTA COTABLE" : "" %>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right"></div></td>
						<td nowrap width="25%" ><div align="left" style="color: black"></div></td>
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
