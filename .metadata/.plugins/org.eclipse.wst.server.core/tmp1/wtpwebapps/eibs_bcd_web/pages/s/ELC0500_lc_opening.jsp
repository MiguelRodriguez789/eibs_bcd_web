<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Letters of Credit Opening/Maintenance</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<jsp:useBean id="lcNew"  class="datapro.eibs.beans.ELC050001Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript">

<%if (!userPO.getPurpose().equals("NEW")) {%>

	builtNewMenu(lc_opening);

<%}%>

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</script>

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}

if (!userPO.getPurpose().equals("NEW")) {
	out.println("<SCRIPT> initMenu();  </SCRIPT>");
}
%>

</head>
<body>
<h3 align="center">Apertura de Carta de Credito
<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0500">
<input type="hidden" NAME="SCREEN" VALUE="2">
<input type="hidden" NAME="E01LCMATY" VALUE="<%=lcNew.getE01LCMATY().trim()%>">

<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
			<tbody><tr id="trdark">
				<td nowrap width="16%">
				<div align="right"><b>Banco :</b></div>
				</td>
				<td nowrap width="20%">
				<div align="left"><input type="text" name="E01LCMBNK" readonly size="4" maxlength="2" value="<%=lcNew.getE01LCMBNK().trim()%>">
				</div></td>
				<td nowrap width="16%">
				<div align="right"><b>N�mero de Carta de Credito :</b></div>
				</td>
				<td nowrap width="16%"><div align="left"><b> 
				<%if (lcNew.getE01LCMACC().trim().equals("999999999999"))
				{%>
					<input type="text" size="12" maxlength="12" value="Nuevo" readonly>
					<input type="hidden" name="E01LCMACC" value="<%=lcNew.getE01LCMACC().trim()%>">
				<%}
				else
				{%>
					<input type="text" name="E01LCMACC" size="12" maxlength="12" value="<%=lcNew.getE01LCMACC().trim()%>" readonly>
				<%}%>
				</b></div></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="16%">
				<div align="right"><b>Nuestra Referencia :</b></div>
				</td>
					<td nowrap width="20%">
					<div align="left"><input type="text" name="E01LCMORF" size="20" maxlength="16" value="<%=lcNew.getE01LCMORF().trim()%>"></div>
					</td>
					<td nowrap width="16%">
				<div align="right"><b>Producto :</b></div>
				</td><td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01LCMPRO" size="4" maxlength="4" value="<%=lcNew.getE01LCMPRO().trim()%>" readonly> </b>
				</div>
				</td>
				
			</tr>
			<tr id="trdark">
				<td nowrap width="16%">
				<div align="right"><b>Referencia  del Otro Banco :</b></div>
				</td><td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01LCMTRF" size="20" maxlength="16" value="<%=lcNew.getE01LCMTRF().trim()%>"> </b></div>
				</td>
					
					<td nowrap width="16%">
				<div align="right"><b>Descripcion de Producto :</b></div>
				</td><td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01DSCPRO" size="40"
						maxlength="40" value="<%=lcNew.getE01DSCPRO().trim()%>" readonly> </b>
				</div>
				</td>
				
			</tr></tbody></table>
		</td>
	</tr>
</table>
<br>

<h4>Aplicante</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%"><select name="E01LCMAF2">
							<option value=" "
								<%if (!(lcNew.getE01LCMAF2().equals("C") || lcNew.getE01LCMAF2().equals("A")))
	out.print("selected");%>
								selected></option>
							<option value="C"
								<%if (lcNew.getE01LCMAF2().equals("C"))
	out.print("selected");%>>Cliente</option>
							<option value="A"
								<%if (lcNew.getE01LCMAF2().equals("A"))
	out.print("selected");%>>Cuenta</option>
						</select><%if (!lcNew.getE01LCMTYP().trim().toUpperCase().equals("I"))
					{%><img src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" border="0"><%}%></td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left"><input type="text" name="E01LCMAPA" size="12"
							maxlength="12" value="<%=(!lcNew.getE01LCMAPA().trim().equals("0") ? lcNew.getE01LCMAPA() : "")%>"></td>
						<td><a
							href="javascript: GetCustomerDetails('E01LCMAPA','E01LCMAP1','','','E01LCMAP7','E01LCMAP2','E01LCMAP3','E01LCMAP4','','E01LCMAP5','','','E01LCMAP6','','','','','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
							onclick="javascript: document.forms[0].E01LCMAF2.selectedIndex = 1"
							border="0"></a> Cliente o <a
							href="javascript: GetAccByClient('E01LCMAPA','','RT','','E01LCMAP1')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
							onclick="javascript: document.forms[0].E01LCMAF2.selectedIndex = 2"  border="0"></a> Cuenta</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Nombre :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAP1" size="45"
					maxlength="35" value="<%=lcNew.getE01LCMAP1()%>">
					<%if (lcNew.getE01LCMTYP().trim().toUpperCase().equals("I"))
					{%><img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"> <%}%>
				</div></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Direcci�n :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAP2" size="45"
					maxlength="35" value="<%=lcNew.getE01LCMAP2()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAP3" size="45"
					maxlength="35" value="<%=lcNew.getE01LCMAP3()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAP4" size="45"
					maxlength="35" value="<%=lcNew.getE01LCMAP4()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Estado</div>
				</td>
				<td align="left">
				<table>
					<tr>
						<td><input type="text" name="E01LCMAP5" size="4" maxlength="4"
							value="<%=lcNew.getE01LCMAP5()%>"> C�digo Postal <input type="text"
							name="E01LCMAP6" size="16" maxlength="15"
							value="<%=lcNew.getE01LCMAP6()%>"> Pa�s <input type="text"
							name="E01LCMAP7" size="4" maxlength="4"
							value="<%=lcNew.getE01LCMAP7()%>"><a href="javascript:GetCodeCNOFC('E01LCMAP7','03')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Beneficiario</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%"><select name="E01LCMAF3">
							<option value=" "
								<%if (!(lcNew.getE01LCMAF3().equals("C") || lcNew.getE01LCMAF3().equals("A")))
	out.print("selected");%>
								selected></option>
							<option value="C"
								<%if (lcNew.getE01LCMAF3().equals("C"))
	out.print("selected");%>>Cliente</option>
							<option value="A"
								<%if (lcNew.getE01LCMAF3().equals("A"))
	out.print("selected");%>>Cuenta</option>
						</select></td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left"><input type="text" name="E01LCMBAC" size="12"
							maxlength="12" value="<%=(!lcNew.getE01LCMBAC().trim().equals("0") ? lcNew.getE01LCMBAC() : "")%>"></td>
						<td><a
							href="javascript: GetCustomerDetails('E01LCMBAC','E01LCMBN1','','','E01LCMBN7','E01LCMBN2','E01LCMBN3','E01LCMBN4','','E01LCMBN5','','','E01LCMBN6','','','','','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
							onclick="javascript: document.forms[0].E01LCMAF3.selectedIndex = 1"
							 border="0"></a> Cliente o <a
							href="javascript: GetAccByClient('E01LCMBAC','','RT','','E01LCMBN1')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
							onclick="javascript: document.forms[0].E01LCMAF3.selectedIndex = 2"
							 border="0"></a> Cuenta</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Nombre :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMBN1" size="45"
					maxlength="35" value="<%=lcNew.getE01LCMBN1()%>"><img
					src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio"  border="0"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Direcci�n :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMBN2" size="45"
					maxlength="35" value="<%=lcNew.getE01LCMBN2()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMBN3" size="45"
					maxlength="35" value="<%=lcNew.getE01LCMBN3()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMBN4" size="45"
					maxlength="35" value="<%=lcNew.getE01LCMBN4()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Estado</div>
				</td>
				<td align="left">
				<table>
					<tr>
						<td><input type="text" name="E01LCMBN5" size="4" maxlength="4"
							value="<%=lcNew.getE01LCMBN5()%>"> C�digo Postal <input type="text"
							name="E01LCMBN6" size="16" maxlength="15"
							value="<%=lcNew.getE01LCMBN6()%>"> Pa�s <input type="text"
							name="E01LCMBN7" size="4" maxlength="4"
							value="<%=lcNew.getE01LCMBN7()%>"><a href="javascript:GetCodeCNOFC('E01LCMBN7','03')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Banco 
<%//Incoming
if (lcNew.getE01LCMTYP().trim().toUpperCase().equals("I"))
{%>
Emisor</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tbody><tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tbody><tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%"><select name="E01LCMAF1">
							<option value=" "></option>
							<option value="C" <%if (lcNew.getE01LCMAF1().equals("C")) out.print("selected");%>>Cliente</option>
							<option value="A" <%if (lcNew.getE01LCMAF1().equals("A")) out.print("selected");%>>Cuenta</option>
						</select></td>
					</tr>
				</tbody></table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tbody><tr id="trdark">
						<td align="left"><input type="text" name="E01LCMIBA" size="12" maxlength="12"
						value="<%=(!lcNew.getE01LCMIBA().trim().equals("0") ? lcNew.getE01LCMIBA() : "")%>"></td>
						<td><a href="javascript: GetCustomerDetails('E01LCMIBA','E01LCMIB1','','','E01LCMIB7','E01LCMIB2','E01LCMIB3','E01LCMIB4','','E01LCMIB5','','','E01LCMIB6','','','','','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onClick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 1" border="0"></a> Cliente o <a href="javascript: GetAccByClient('E01LCMIBA','','RT','','E01LCMIB1')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onClick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 2" border="0"></a> Cuenta</td>
					</tr>
				</tbody></table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Codigo Swift :</div>
				</td><td>
				<div align="left"><input type="text" name="E01LCMIBI" size="14" maxlength="12" value="<%=lcNew.getE01LCMIBI()%>">
				 <a href="javascript:GetCorrespondentDescIdSwift('E01LCMIBI','','')">
				 <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" border="0"></a></div>
				</td>
				
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Nombre :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMIB1" size="45" maxlength="35" value="<%=lcNew.getE01LCMIB1()%>"><img
						src="<%=request.getContextPath()%>/images/Check.gif"
						title="campo obligatorio" border="0"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Direcci�n :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMIB2" size="45" maxlength="35" value="<%=lcNew.getE01LCMIB2()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMIB3" size="45" maxlength="35" value="<%=lcNew.getE01LCMIB3()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMIB4" size="45" maxlength="35" value="<%=lcNew.getE01LCMIB4()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Estado</div>
				</td>
				<td align="left">
				<table id="trdark">
					<tbody><tr>
						<td><input type="text" name="E01LCMIB5" size="4" maxlength="4" value="<%=lcNew.getE01LCMIB5()%>"> C�digo Postal <input type="text" name="E01LCMIB6" size="16" maxlength="15" value="<%=lcNew.getE01LCMIB6()%>"> Pa�s <input type="text" name="E01LCMIB7" size="4" maxlength="4" value="<%=lcNew.getE01LCMIB7()%>"><a href="javascript:GetCodeCNOFC('E01LCMIB7','03')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a></td>
					</tr>
				</tbody></table>
				</td>
			</tr>
		</tbody></table>
		</td>
	</tr>
</table>


<h4>Banco Corresponsal</h4>
<table class="tableinfo">
	<tr>
		<td align="center" width="100%">
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tbody><tr id="trdark">
				<td width="30%">
				<div align="right">Cliente :</div>
				</td>
				<td width="70%">
				<div align="left">
					<input type="text" name="E01LCMCBA" size="12" maxlength="12"
						value="<%=(!lcNew.getE01LCMCBA().trim().equals("0") ? lcNew.getE01LCMCBA() : "")%>">
					<a href="javascript: GetCustomerDetails('E01LCMCBA','E01LCMCB1','','','E01LCMCB7','E01LCMCB2','E01LCMCB3','E01LCMCB4','','E01LCMCB5','','','E01LCMCB6','','','','','')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." border="0"></a></div>
				</td>
			</tr>
			<tr id="trclear">
				<td><div align="right">Codigo Swift :</div></td>
				<td><div align="left"><input type="text" name="E01LCMCBI" size="14" maxlength="12" value="<%=lcNew.getE01LCMCBI()%>">
					 <a href="javascript:GetCorrespondentDescIdSwift('E01LCMCBI','','')">
					 <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" border="0"></a></div></td>
				
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Nombre :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMCB1" size="45" maxlength="35" value="<%=lcNew.getE01LCMCB1()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Direcci�n :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMCB2" size="45" maxlength="35" value="<%=lcNew.getE01LCMCB2()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMCB3" size="45" maxlength="35" value="<%=lcNew.getE01LCMCB3()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMCB4" size="45" maxlength="35" value="<%=lcNew.getE01LCMCB4()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Estado</div>
				</td>
				<td align="left">
				<table id="trdark">
					<tbody><tr>
						<td><input type="text" name="E01LCMCB5" size="4" maxlength="4" value="<%=lcNew.getE01LCMCB5()%>"> C�digo Postal <input type="text" name="E01LCMCB6" size="16" maxlength="15" value="<%=lcNew.getE01LCMCB6()%>"> Pa�s <input type="text" name="E01LCMCB7" size="4" maxlength="4" value="<%=lcNew.getE01LCMCB7()%>"><a href="javascript:GetCodeCNOFC('E01LCMCB7','03')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a></td>
					</tr>
				</tbody></table>
				</td>
			</tr></tbody></table>
		</td>
	</tr>
</table>

<%}//Outgoing A/C
else
{
out.print("Avisador / Confirmador </h4>");%>
 
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tbody><tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tbody><tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%"><select name="E01LCMAF1">
							<option value=" "></option>
							<option value="C" <%if (lcNew.getE01LCMAF1().equals("C")) out.print("selected");%>>Cliente</option>
							<option value="A" <%if (lcNew.getE01LCMAF1().equals("A")) out.print("selected");%>>Cuenta</option>
						</select></td>
					</tr>
				</tbody></table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tbody><tr id="trdark">
						<td align="left"><input type="text" name="E01LCMIBA" size="12" maxlength="12"
							value="<%=(!lcNew.getE01LCMIBA().trim().equals("0") ? lcNew.getE01LCMIBA() : "")%>"></td>
						<td><a href="javascript: GetCustomerDetails('E01LCMIBA','E01LCMAB1','','','E01LCMAB7','E01LCMAB2','E01LCMAB3','E01LCMAB4','','E01LCMAB5','','','E01LCMAB6','','','','','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" onClick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 1"  border="0"></a> Cliente o <a href="javascript: GetAccByClient('E01LCMABA','','RT','','E01LCMAB1')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onClick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 2"  border="0"></a> Cuenta</td>
					</tr>
				</tbody></table>
				</td>
			</tr>
			<tr>
				<td>
				<div align="right">Codigo Swift :</div>
				</td><td>
				<div align="left"><input type="text" name="E01LCMABI" size="12" maxlength="12" value="<%=lcNew.getE01LCMABI()%>"><a
						href="javascript:GetCorrespondentDescIdSwift('E01LCMABI','','')"><img
						src="<%=request.getContextPath()%>/images/1b.gif" title="help"
						border="0"></a></div>
				</td>
				
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Nombre :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAB1" size="45" maxlength="35" value="<%=lcNew.getE01LCMAB1()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Direcci�n :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAB2" size="45" maxlength="35" value="<%=lcNew.getE01LCMAB2()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAB3" size="45" maxlength="35" value="<%=lcNew.getE01LCMAB3()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMAB4" size="45" maxlength="35" value="<%=lcNew.getE01LCMAB4()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Estado</div>
				</td>
				<td align="left">
				<table>
					<tbody><tr>
						<td><input type="text" name="E01LCMAB5" size="4" maxlength="4" value="<%=lcNew.getE01LCMAB5()%>"> C�digo Postal <input type="text" name="E01LCMAB6" size="16" maxlength="15" value="<%=lcNew.getE01LCMAB6()%>"> Pa�s <input type="text" name="E01LCMAB7" size="4" maxlength="4" value="<%=lcNew.getE01LCMAB7()%>"><a href="javascript:GetCodeCNOFC('E01LCMAB7','03')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a></td>
					</tr>
				</tbody></table>
				</td>
			</tr>
		</tbody></table>
		</td>
	</tr>
</table>


<h4>Banco Corresponsal</h4>
<table class="tableinfo">
	<tr>
		<td align="center" width="100%">
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tbody><tr id="trdark">
					<td width="25%" colspan="2">
					<div align="right">Numero de Cliente o de Cuenta:</div>
					</td><td width="59%">
				<div align="left"><input type="text" name="E01LCMCBA" size="12" maxlength="12"
						value="<%=(!lcNew.getE01LCMCBC().trim().equals("0") ? lcNew.getE01LCMCBC() : "")%>">
					<a href="javascript: GetCustomerDetails('E01LCMCBA','E01LCMCA1','','','E01LCMCA7','E01LCMCA2','E01LCMCA3','E01LCMCA4','','E01LCMCA5','','','E01LCMCA6','','','','','')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
						align="bottom" border="0"></a> Cliente o
					<a href="javascript: GetAccByClient('E01LCMCBA','','RT','','E01LCMCB1')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." border="0"></a>Cuenta</div>
				</td>
			</tr>
			<tr id="trclear">
					<td width="216"></td>
					<td width="137">
				<div align="right">Codigo Swift :</div>
				</td><td width="507">
				<div align="left"><input type="text" name="E01LCMCAI" size="12" maxlength="12" value="<%=lcNew.getE01LCMCAI()%>"><a
						href="javascript:GetCorrespondentDescIdSwift('E01LCMCAI','','')"><img
						src="<%=request.getContextPath()%>/images/1b.gif" title="help"
						border="0"></a></div>
				</td>
				
			</tr>
			<tr id="trdark">
					<td width="216"></td>
					<td width="137">
				<div align="right">Nombre :</div>
				</td>
				<td width="507">
				<div align="left"><input type="text" name="E01LCMCA1" size="45" maxlength="35" value="<%=lcNew.getE01LCMCA1()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
					<td width="216"></td>
					<td width="137">
				<div align="right">Direcci�n :</div>
				</td>
				<td width="507">
				<div align="left"><input type="text" name="E01LCMCA2" size="45" maxlength="35" value="<%=lcNew.getE01LCMCA2()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
					<td width="216"></td>
					<td width="137">
				<div align="right"></div>
				</td>
				<td width="507">
				<div align="left"><input type="text" name="E01LCMCA3" size="45" maxlength="35" value="<%=lcNew.getE01LCMCA3()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
					<td width="216"></td>
					<td width="137">
				<div align="right"></div>
				</td>
				<td width="507">
				<div align="left"><input type="text" name="E01LCMCA4" size="45" maxlength="35" value="<%=lcNew.getE01LCMCA4()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
					<td width="216"></td>
					<td width="137">
				<div align="right">Estado</div>
				</td>
				<td align="left" width="507">
				<table>
					<tbody><tr>
						<td><input type="text" name="E01LCMCA5" size="4" maxlength="4" value="<%=lcNew.getE01LCMCA5()%>"> C�digo Postal <input type="text" name="E01LCMCA6" size="16" maxlength="15" value="<%=lcNew.getE01LCMCA6()%>"> Pa�s <input type="text" name="E01LCMCA7" size="4" maxlength="4" value="<%=lcNew.getE01LCMCA7()%>"><a href="javascript:GetCodeCNOFC('E01LCMCA7','03')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a></td>
					</tr>
				</tbody></table>
				</td>
			</tr></tbody></table>
		</td>
	</tr>
</table>

<%}%>

<h4>Banco Reembolsador</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tbody><tr id="trdark">
				<td align="right">Numero de Cliente o de Cuenta :</td>
				<td>
				<table border="0" cellspacing="0">
					<tbody><tr id="trdark">
						<td align="left"><input type="text" name="E01LCMRBA" size="12" maxlength="12"
								value="<%=(!lcNew.getE01LCMRBA().trim().equals("0") ? lcNew.getE01LCMRBA() : "")%>"></td>
						<td><a href="javascript: GetCustomerDetails('E01LCMRBA','E01LCMRB1','','','E01LCMRB7','E01LCMRB2','E01LCMRB3','E01LCMRB4','','E01LCMRB5','','','E01LCMRB6','','','','','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> Cliente o <a href="javascript: GetAccByClient('E01LCMRBA','','RT','','E01LCMRB1')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> Cuenta</td>
					</tr>
				</tbody></table>
				</td>
			</tr>
			<tr>
				<td>
				<div align="right">Codigo Swift :</div>
				</td><td>
				<div align="left"><input type="text" name="E01LCMRBI" size="14" maxlength="12" value="<%=lcNew.getE01LCMRBI()%>">
				 <a href="javascript:GetCorrespondentDescIdSwift('E01LCMRBI','','')">
				 <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" border="0"></a></div>
				</td>
				
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Nombre :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMRB1" size="45" maxlength="35" value="<%=lcNew.getE01LCMRB1()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Direcci�n :</div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMRB2" size="45" maxlength="35" value="<%=lcNew.getE01LCMRB2()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMRB3" size="45" maxlength="35" value="<%=lcNew.getE01LCMRB3()%>"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right"></div>
				</td>
				<td>
				<div align="left"><input type="text" name="E01LCMRB4" size="45" maxlength="35" value="<%=lcNew.getE01LCMRB4()%>"></div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Estado</div>
				</td>
				<td align="left">
				<table id="trdark">
					<tbody><tr>
						<td><input type="text" name="E01LCMRB5" size="4" maxlength="4" value="<%=lcNew.getE01LCMRB5()%>"> C�digo Postal <input type="text" name="E01LCMRB6" size="16" maxlength="15" value="<%=lcNew.getE01LCMRB6()%>"> Pa�s <input type="text" name="E01LCMRB7" size="4" maxlength="4" value="<%=lcNew.getE01LCMRB7()%>"><a href="javascript:GetCodeCNOFC('E01LCMRB7','03')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a></td>
					</tr>
				</tbody></table>
				</td>
			</tr>
		</tbody></table>
		</td>
	</tr>
</table>

<br>

<div align="center"><input id="EIBSBTN" type=submit name="Submit"
	value="Enviar"></div>

</form>
</body>
</html>
