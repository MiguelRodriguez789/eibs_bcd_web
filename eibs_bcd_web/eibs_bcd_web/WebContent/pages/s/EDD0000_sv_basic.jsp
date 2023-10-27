<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page
	import="java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<html>
<head>
<title>Cuentas de Ahorro</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css"
	rel="stylesheet" type="text/css" />

<jsp:useBean id="svBasic" class="datapro.eibs.beans.EDD000001Message"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />
<jsp:useBean id="userPO"
	beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>"
	type="datapro.eibs.beans.UserPos" scope="session" />

<script
	src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp">
	
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp">
	
</SCRIPT>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp">
	
</SCRIPT>


</head>
<body>
	<SCRIPT type="text/javascript">
		builtNewMenu(sv_m_opt);
		//  Process according with user selection
		function goAction(op) {

			switch (op) {
			// Validate & Write 
			case 1: {
				document.getElementById("APPROVAL").value = 'N';
				break;
			}
				// Validate and Approve
			case 2: {
				document.getElementById("APPROVAL").value = 'Y';
				break;
			}
			}
			document.forms[0].submit();
		}
	</SCRIPT>

	<%
		if (!error.getERRNUM().equals("0")) {
			error.setERRNUM("0");
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");
		}
		out.println("<SCRIPT> initMenu(); </SCRIPT>");

		boolean protect = JSEIBSProp.getProtectedBNKBRN();
		
	%>
	<H3 align="center">
		Mantenimiento de Cuentas de Ahorro<img
			src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
			name="EIBS_GIF" title="sv_basic.jsp, EDD0000">
	</H3>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000">
		<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="30"> <INPUT
			TYPE=HIDDEN NAME="E01ACMATY" id="E01ACMATY"
			VALUE="<%=svBasic.getE01ACMATY().trim()%>"> <INPUT
			TYPE=HIDDEN NAME="E01ACMACD" id="E01ACMACD"
			VALUE="<%=svBasic.getE01ACMACD().trim()%>"> <INPUT
			TYPE=HIDDEN NAME="APPROVAL" id="APPROVAL" VALUE="N">

		<table class="tableinfo">
			<tr bordercolor="#FFFFFF">
				<td nowrap>
					<table cellspacing="0" cellpadding="2" width="100%" border="0"
						class="tbhead">
						<tr id="trdark">
							<td nowrap width="16%">
								<div align="right">
									<b>Cliente :</b>
								</div>
							</td>
							<td nowrap width="20%">
								<div align="left">
									<input type="text" name="E01ACMCUN" id="E01ACMCUN" size="10"
										maxlength="9" value="<%=svBasic.getE01ACMCUN().trim()%>">
									<a href="javascript:GetCustomer('E01ACMCUN')"><img
										src="<%=request.getContextPath()%>/images/1b.gif"
										title="Ayuda" align="bottom" border="0"></a>
								</div>
							</td>
							<td nowrap width="16%">
								<div align="right">
									<b>Nombre :</b>
								</div>
							</td>
							<td nowrap colspan="3">
								<div align="left">
									<font face="Arial"><font face="Arial"><fontsize="2">
											<input type="text" name="E01CUSNA1" id="E01CUSNA1" size="45"
												maxlength="45" readonly="readonly"
												value="<%=svBasic.getE01CUSNA1().trim()%>"></font></font></font>
								</div>
							</td>
						</tr>
						<tr id="trdark">
							<td nowrap width="16%">
								<div align="right">
									<b>Cuenta :</b>
								</div>
							</td>
							<td nowrap width="20%">
								<div align="left">
									<input type="text" name="E01ACMACC" id="E01ACMACC" size="13"
										maxlength="12" value="<%=svBasic.getE01ACMACC().trim()%>"
										readonly>
								</div>
							</td>
							<td nowrap width="16%">
								<div align="right">
									<b>Moneda : </b>
								</div>
							</td>
							<td nowrap width="16%">
								<div align="left">
									<b> <input type="text" name="E01DEACCY" id="E01DEACCY"
										size="3" maxlength="3"
										value="<%=svBasic.getE01ACMCCY().trim()%>" readonly>
									</b>
								</div>
							</td>
							<td nowrap width="16%">
								<div align="right">
									<b>Producto : </b>
								</div>
							</td>
							<td nowrap width="16%">
								<div align="left">
									<b> <input type="text" name="E01ACMPRO" id="E01ACMPRO"
										readonly="readonly" size="4" maxlength="4"
										value="<%=svBasic.getE01ACMPRO().trim()%>">
									</b>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<%
			int row = 0;
		%>
		<H4>Datos B&aacute;sicos de la Operaci&oacute;n</H4>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF">
				<td nowrap>
					<table cellspacing="0" cellpadding="2" width="100%" border="0">
						<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="29%">
								<div align="right">Nombre de la Cuenta:</div>
							</td>
							<td nowrap width="19%"><input type="text" name="E01ACMNME"
								id="E01ACMNME" size="60" maxlength="80"
								value="<%=svBasic.getE01ACMNME().trim()%>"></td>
							<td nowrap width="26%">
							</td>
							<td nowrap width="19%">
							</td>
						</tr>
						<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="29%">
								<div align="right">Fecha de Apertura:</div>
							</td>
							<td nowrap width="19%"><eibsinput:date name="svBasic"
									fn_year="E01ACMOPY" fn_month="E01ACMOPM" fn_day="E01ACMOPD"
									readonly="true" /></td>
							<td nowrap width="26%">
								<div align="right">Fecha de Ingreso:</div>
							</td>
							<td nowrap width="26%"><eibsinput:date name="svBasic"
									fn_year="E01ACMSUY" fn_month="E01ACMSUM" fn_day="E01ACMSUD"
									readonly="true" /></td>
						</tr>
						<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="29%" height="19">
								<div align="right">Banco/Sucursal :</div>
							</td>
							<td nowrap>
								<%
									if (!protect && svBasic.getH01FLGMAS().equals("N")) {
								%> <input
								type="text" name="E01ACMBNK" id="E01ACMBNK" size="2"
								maxlength="2" value="<%=svBasic.getE01ACMBNK().trim()%>">
								<input type="text" name="E01ACMBRN" id="E01ACMBRN" size="5"
								maxlength="4" value="<%=svBasic.getE01ACMBRN().trim()%>">
								<a href="javascript:GetBranch('E01ACMBRN','')"> <img
									src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
									align="bottom" border="0"></a> <%
						 	} else {
 								%> <input
								type="text" name="E01ACMBNK" id="E01ACMBNK" size="2"
								maxlength="2" value="<%=svBasic.getE01ACMBNK().trim()%>"
								readonly> <input type="text" name="E01ACMBRN"
								id="E01ACMBRN" size="5" maxlength="4"
								value="<%=svBasic.getE01ACMBRN().trim()%>" readonly> <%
 							}
 							%>
							</td>
							<td nowrap width="26%" height="19">
								<div align="right">Centro de Costo:</div>
							</td>
							<td nowrap width="26%" height="19"><input type="text"
								name="E01ACMCCN" id="E01ACMCCN" size="8" maxlength="8"
								value="<%=svBasic.getE01ACMCCN().trim()%>"> <a
								href="javascript:GetCostCenter('E01ACMCCN','01')"><img
									src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
									align="middle" border="0"></a> <img
								src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0"></td>
						</tr>
						<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="29%" height="19">
								<div align="right">Uso de domicilio :</div>
							</td>
							<td nowrap width="19%" height="19">
               				<select name="E01ACMWHF" >             
                 				<option value=" " <% if (!(svBasic.getE01ACMWHF().equals("R") ||
			                                svBasic.getE01ACMWHF().equals("C") ||  svBasic.getE01ACMWHF().equals("O")))out.print("selected"); %>>
			      				</option>
			      				<option value="C" <%if (svBasic.getE01ACMWHF().equals("C")) out.print("selected"); %>>Correo Electrónico</option>
			      				<option value="R" <%if (svBasic.getE01ACMWHF().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
			      				<option value="O" <%if (svBasic.getE01ACMWHF().equals("R")) out.print("selected"); %>>Oficina del Banco</option>
               				</select>
				
							<input type="text"name="E01ACMMLA" size="2" maxlength="2"
									value="<%=svBasic.getE01ACMMLA().trim()%>"> 
							<a href="javascript:GetMailing('E01ACMMLA',document.forms[0].E01ACMCUN.value,document.forms[0].E01ACMWHF.value)">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a>
							</td>
							<td nowrap width="26%">
								<div align="right">Tipo de Cuenta:</div>
							</td>
							<td nowrap width="26%"><select name="E01ACMPEC"
								id="E01ACMPEC">
									<option value=" "
										<%if (!(svBasic.getE01ACMPEC().equals("1")
					|| svBasic.getE01ACMPEC().equals("2")
					|| svBasic.getE01ACMPEC().equals("3")
					|| svBasic.getE01ACMPEC().equals("4") || svBasic
					.getE01ACMPEC().equals("5")))
				out.print("selected");%>></option>
									<option value="1"
										<%if (svBasic.getE01ACMPEC().equals("1"))
				out.print("selected");%>>Individual</option>
									<option value="2"
										<%if (svBasic.getE01ACMPEC().equals("2"))
				out.print("selected");%>>Mancomunada</option>
									<option value="3"
										<%if (svBasic.getE01ACMPEC().equals("3"))
				out.print("selected");%>>Solidaria</option>
									<option value="4"
										<%if (svBasic.getE01ACMPEC().equals("4"))
				out.print("selected");%>>Menor</option>
									<option value="5"
										<%if (svBasic.getE01ACMPEC().equals("5"))
				out.print("selected");%>>Juridica</option>
							</select>
							</td>
							
						</tr>
						<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="29%" height="19">
								<div align="right">Diferidos Locales:</div>
							</td>
							<td nowrap width="19%" height="19"><input type="text"
								size="2" maxlength="1"
								value="<%=svBasic.getE01ACMWLF().trim()%>" name="E01ACMWLF"
								id="E01ACMWLF" > 
				 <a href="javascript:GetCode('E01ACMWLF','STATIC_rt_delay.jsp')"><img
									src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
									align="bottom" border="0"></a> 
 							</td>
							<td nowrap width="26%" height="19">
								<div align="right">Diferidos No Locales:</div>
							</td>
							<td nowrap width="26%" height="19"><input type="text"
								size="2" maxlength="1"
								value="<%=svBasic.getE01ACMWNF().trim()%>" name="E01ACMWNF"
								id="E01ACMWNF" >  <a href="javascript:GetCode('E01ACMWNF','STATIC_rt_delay.jsp')"><img
									src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
									align="bottom" border="0"></a> 
 							</td>
						</tr>
						<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="29%" height="19">
								<div align="right">Tabla de Documentos:</div>
							</td>
							<td nowrap width="19%" height="19"><input type="text"
								name="E01APCTNU" id="E01APCTNU" size="3" readonly maxlength="2"
								value="<%=svBasic.getE01APCTNU().trim()%>"></td>
							<td nowrap width="26%" height="19">
								<div align="right">Referido Por:</div>
							</td>
							<td nowrap width="26%" height="19">
							 <input type="text" name="E01CMOREF" size="12" maxlength="10" value="<%= svBasic.getE01CMOREF().trim()%>" onkeypress="enterInteger(event)">
              	             <a href="javascript:GetCustomer('E01CMOREF')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<H4>Informaci&oacute;n para Cargos por Servicios</H4>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF">
				<td nowrap>
					<table cellspacing="0" cellpadding="2" width="100%" border="0">
						<tr
							class="<%row = 0;%><%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Cargos por Servicios:</div>
							</td>
							<td nowrap width="18%"><input type="hidden" name="E01ACMSCF"
								id="E01ACMSCF" value="<%=svBasic.getE01ACMSCF()%>"> <input
								type="radio" name="CE01ACMSCF" id="CE01ACMSCF" value="Y"
								onClick="document.getElementById('E01ACMSCF').value='Y'"
								<%if (svBasic.getE01ACMSCF().equals("Y"))
				out.print("checked");%>
								> S&iacute; <input type="radio"
								name="CE01ACMSCF" id="CE01ACMSCF" value="N"
								onClick="document.getElementById('E01ACMSCF').value='N'"
								<%if (svBasic.getE01ACMSCF().equals("N"))
				out.print("checked");%>
								> No <img
								src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0"></td>
							<td nowrap width="28%">
								<div align="right">Frecuencia Cobro Cargos:</div>
							</td>
							<td nowrap width="24%"><select name="E01ACMSHF"
								id="E01ACMSHF">
									<option value=" "
										<%if (!(svBasic.getE01ACMSHF().equals("D")
					|| svBasic.getE01ACMSHF().equals("W")
					|| svBasic.getE01ACMSHF().equals("B")
					|| svBasic.getE01ACMSHF().equals("M") || svBasic
					.getE01ACMSHF().equals("Q")))
				out.print("selected");%>></option>
									<option value="D"
										<%if (svBasic.getE01ACMSHF().equals("D"))
				out.print("selected");%>>Diario</option>
									<option value="W"
										<%if (svBasic.getE01ACMSHF().equals("W"))
				out.print("selected");%>>Semanal</option>
									<option value="B"
										<%if (svBasic.getE01ACMSHF().equals("B"))
				out.print("selected");%>>Quincenal</option>
									<option value="M"
										<%if (svBasic.getE01ACMSHF().equals("M"))
				out.print("selected");%>>Mensual</option>
									<option value="Q"
										<%if (svBasic.getE01ACMSHF().equals("Q"))
				out.print("selected");%>>Trimestral</option>
							</select> <img src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0"></td>
						</tr>
						<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">C&oacute;digos Tabla de Cargos:</div>
							</td>
							<td nowrap width="18%"><input type="text" name="E01ACMACL"
								id="E01ACMACL" size="2" maxlength="2"
								value="<%=svBasic.getE01ACMACL().trim()%>" >
								 <a
								href="javascript:GetRetCod('E01ACMACL',document.getElementById('E01ACMATY').value)"><img
									src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
									align="middle" border="0"></a> <img
								src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0">
							</td>
							<td nowrap width="28%">
								<div align="right">Ciclo/D&iacute;a de Cobro de Cargos:</div>
							</td>
							<td nowrap width="24%"><input type="text" name="E01ACMSHY"
								id="E01ACMSHY" size="3" maxlength="2"
								value="<%=svBasic.getE01ACMSHY().trim()%>">
								 <a href="javascript:GetCode('E01ACMSHY','STATIC_rt_ciclo.jsp')"><img
									src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
									align="bottom" border="0"></a> <img
								src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<H4>Informaci&oacute;n Estado de Cuenta</H4>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF">
				<td nowrap>
					<table cellspacing="0" cellpadding="2" width="100%" border="0">
						<tr
							class="<%row = 0;%><%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Frecuencia :</div>
							</td>
							<td nowrap width="18%"><select name="E01ACMSTF"
								id="E01ACMSTF">
									<option value=" "
										<%if (!(svBasic.getE01ACMSTF().equals("D")
					|| svBasic.getE01ACMSTF().equals("W")
					|| svBasic.getE01ACMSTF().equals("B")
					|| svBasic.getE01ACMSTF().equals("M") || svBasic
					.getE01ACMSTF().equals("Q")))
				out.print("selected");%>></option>
									<option value="D"
										<%if (svBasic.getE01ACMSTF().equals("D"))
				out.print("selected");%>>Diario</option>
									<option value="W"
										<%if (svBasic.getE01ACMSTF().equals("W"))
				out.print("selected");%>>Semanal</option>
									<option value="B"
										<%if (svBasic.getE01ACMSTF().equals("B"))
				out.print("selected");%>>Quincenal</option>
									<option value="M"
										<%if (svBasic.getE01ACMSTF().equals("M"))
				out.print("selected");%>>Mensual</option>
									<option value="Q"
										<%if (svBasic.getE01ACMSTF().equals("Q"))
				out.print("selected");%>>Trimestral</option>
							</select> <img src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0"></td>
							<td nowrap width="28%">
								<div align="right">Retenci&oacute;n de Correos :</div>
							</td>
							<td nowrap width="24%"><font face="Arial" size="2"> <input
									type="hidden" name="E01ACMHSF" id="E01ACMHSF"
									value="<%=svBasic.getE01ACMHSF()%>"> <input
									type="radio" name="CE01ACMHSF" id="CE01ACMHSF" value="H"
									onClick="document.getElementById('E01ACMHSF').value='H'"
									<%if (svBasic.getE01ACMHSF().equals("H"))
				out.print("checked");%>>
									S&iacute; <input type="radio" name="CE01ACMHSF" value=""
									onClick="document.getElementById('E01ACMHSF').value=''"
									<%if (svBasic.getE01ACMHSF().equals(""))
				out.print("checked");%>>
									No
							</font></td>
						</tr>
						<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Ciclo/D&iacute;a Impresi&oacute;n :</div>
							</td>
							<td nowrap width="18%"><input type="text" name="E01ACMSDY"
								id="E01ACMSDY" size="3" maxlength="2"
								value="<%=svBasic.getE01ACMSDY().trim()%>"> <a
								href="javascript:GetCode('E01ACMSDY','STATIC_rt_ciclo.jsp')"><img
									src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
									align="bottom" border="0"></a> <img
								src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0"></td>
							<td nowrap width="28%">
								<div align="right">Estado Consolidado :</div>
							</td>
							<td nowrap width="24%"><font face="Arial" size="2"> <input
									type="hidden" name="E01ACMCSF" id="E01ACMCSF"
									value="<%=svBasic.getE01ACMCSF()%>"> <input
									type="radio" name="CE01ACMCSF" id="CE01ACMCSF" value="Y"
									onClick="document.getElementById('E01ACMCSF').value='Y'"
									<%if (svBasic.getE01ACMCSF().equals("Y"))
				out.print("checked");%>>
									S&iacute; <input type="radio" name="CE01ACMCSF" id="CE01ACMCSF"
									value="N"
									onClick="document.getElementById('E01ACMCSF').value='N'"
									<%if (svBasic.getE01ACMCSF().equals("N"))
				out.print("checked");%>>
									No
							</font></td>
						</tr>
						<tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%" height="23">
								<div align="right">Tipo de Estado de Cuenta :</div>
							</td>
							<td nowrap width="18%" height="23"><select name="E01ACMSTY"
								id="E01ACMSTY">
									<option value=" "
										<%if (!(svBasic.getE01ACMSTY().equals("P")
					|| svBasic.getE01ACMSTY().equals("C") || svBasic
					.getE01ACMSTY().equals("N")))
				out.print("selected");%>></option>
									<option value="P"
										<%if (svBasic.getE01ACMSTY().equals("P"))
				out.print("selected");%>>Personal</option>
									<option value="C"
										<%if (svBasic.getE01ACMSTY().equals("C"))
				out.print("selected");%>>Corporativa</option>
									<option value="N"
										<%if (svBasic.getE01ACMSTY().equals("N"))
				out.print("selected");%>>Ninguna</option>
							</select> <img src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0"></td>
							<td nowrap width="28%" height="23">
								<div align="right">Forma de Env&iacute;o :</div>
							</td>
							<td nowrap width="24%" height="23"><select name="E01ACMSTE" id="E01ACMSTE" >
									<option value="N"
										<%if (!(svBasic.getE01ACMSTE().equals("T")
					|| svBasic.getE01ACMSTE().equals("P")
					|| svBasic.getE01ACMSTE().equals("F") || svBasic
					.getE01ACMSTE().equals("E")))
				out.print("selected");%>>Ninguno</option>
									<option value="T"
										<%if (svBasic.getE01ACMSTE().equals("T"))
				out.print("selected");%>>Telex</option>
									<option value="P"
										<%if (svBasic.getE01ACMSTE().equals("P"))
				out.print("selected");%>>Impresora</option>
									<option value="F"
										<%if (svBasic.getE01ACMSTE().equals("F"))
				out.print("selected");%>>Facsimil</option>
									<option value="E"
										<%if (svBasic.getE01ACMSTE().equals("E"))
				out.print("selected");%>>Email</option>
							</select> <img src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
	<H4>Asignaci&oacute;n de Talonario</H4>
<table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap><div align="right">Nombre en Talonario:</div></td>
            <td nowrap colspan=3>
            <INPUT type="text" name="E01ACMCK1" size="46" maxlength="45" value="<%= svBasic.getE01ACMCK1().trim()%>"></td>
            
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">
              <SELECT name="E01ACMRE1">
              	<OPTION value="Y" <%if (!svBasic.getE01ACMRE1().equals("O")) out.print("selected"); %>="">Y</OPTION>
              <% if (currUser.getE01INT().equals("07")) { %>
                <OPTION value="O" <%if (svBasic.getE01ACMRE1().equals("O")) out.print("selected"); %>="">O</OPTION>
                <%} else { %>              	
                <OPTION value="O" <%if (svBasic.getE01ACMRE1().equals("O")) out.print("selected"); %>="">Y/O</OPTION>
               <% } %>
              </SELECT></div>
            </td>
            <td nowrap colspan=3>
              <INPUT type="text" name="E01ACMCK2" size="46" maxlength="45" value="<%= svBasic.getE01ACMCK2().trim()%>" >
                          <!--    <a href="javascript:GetCustomerDescId('','E01ACMCK2','')">
              <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></A> -->
            </td>
            
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Tipo de Taloranio :</div>
            </td>
            <td nowrap <% if (!svBasic.getH01FLGMAS().equals("N")) out.print("colspan=3");%>>
            <INPUT type="text" name="E01ACMTBK" size="3" maxlength="2" value="<%= svBasic.getE01ACMTBK().trim()%>">
              <A href="javascript:GetTypCHK('E01ACMTBK','','<%= svBasic.getE01ACMATY().trim()%>','<%= svBasic.getE01ACMCCY().trim()%>','','')">
              <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></A> 
            </td>
            <td nowrap> 
              <div align="right">Cobro de Cargos  :</div>
            </td>
            <td nowrap ><INPUT type="radio" name="E01ACMCBC" value="Y" <% if(!svBasic.getE01ACMCBC().equals("N")) out.print("checked");%>="">
              S&iacute; 
              <INPUT type="radio" name="E01ACMCBC" value="N" <% if(svBasic.getE01ACMCBC().equals("N")) out.print("checked");%>="">
               No
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Restricción de Entregas :</div>
            </td>
            <td nowrap ><INPUT type="radio" name="E01ACMCON" value="Y" <% if(svBasic.getE01ACMCON().equals("Y")) out.print("checked");%>="">
              S&iacute; 
              <INPUT type="radio" name="E01ACMCON" value="N" <% if(!svBasic.getE01ACMCON().equals("Y")) out.print("checked");%>="">
              No
            </td>
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
		
		
		<%
			if (!svBasic.getE01ACATYH().equals("")) {
		%>

		<H4>Plan de Ahorro/Proposito</H4>
		<%
			if (svBasic.getE01ACATYH().equals("4")) {
		%>
		<p>
			<b>Ver Plan</b><a href="javascript:showSavingsPlan()"><img
				src="<%=request.getContextPath()%>/images/eibs_deducciones.gif"
				title="Plan de Pagos" align="middle" border="0"></a>
		</p>
		<%
			}
		%>
		<table id="mainTable" class="tableinfo">
			<tr bordercolor="#FFFFFF">
				<td nowrap>
					<table cellspacing="0" cellpadding="2" width="100%" border="0">

						<tr id="trdark">
							<td nowrap width="24%">
								<div align="right">Tipo del Ahorro :</div>
							</td>
							<td nowrap width="21%"><input type="hidden" name="E01ACATYH"
								value="<%=svBasic.getE01ACATYH()%>"> <input
								type="text" size="35" readonly
								value='<%if (svBasic.getE01ACATYH().equals(""))
					out.print("Ahorro Tradicional");
				else if (svBasic.getE01ACATYH().equals("1"))
					out.print("Ahorro Vivienda");
				else if (svBasic.getE01ACATYH().equals("2"))
					out.print("Ahorro para Menores");
				else if (svBasic.getE01ACATYH().equals("3"))
					out.print("Cuota de Participación");
				else if (svBasic.getE01ACATYH().equals("4"))
					out.print("Ahorro Programado/Proposito");
				else
					out.print("No Aplica");%>'>
							</td>
							<td nowrap width="25%">
								<div align="right">Estado :</div>
							</td>
							<td nowrap width="22%"><select name="E01ACASTS">
									<option value="1"
										<%if (svBasic.getE01ACASTS().equals("1"))
					out.print("selected");%>>Vigente</option>
									<option value="2"
										<%if (svBasic.getE01ACASTS().equals("2"))
					out.print("selected");%>>No
										Vigente</option>
							</select></td>
							<td nowrap width="25%">
								<div align="right"></div>
							</td>

						</tr>
						<tr id="trclear">
							<td nowrap width="25%">
								<div align="right">Monto Pactado:</div>
							</td>
							<td nowrap width="25%">
								<%-- 					<input type="text" name="E01ACAAX1" size="17" maxlength="15" value="<%=svBasic.getE01ACAAX1().trim()%>"  onKeypress="enterDecimal(event, 2)"> --%>
								<eibsinput:text name="svBasic" property="E01ACAMMO"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"
									required="false" />
							</td>
							<td nowrap width="25%">
								<div align="right">Plazo en meses :</div>
							</td>
							<td nowrap width="25%"><input type="text" name="E01ACAPLO"
								size="6" maxlength="5"
								value="<%=svBasic.getE01ACAPLO().trim()%>"
								onKeypress="enterInteger(event)"></td>
						</tr>

						<tr id="trdark">
							<td nowrap width="25%">
								<div align="right">Frecuencia :</div>
							</td>
							<td nowrap width="25%"><select name="E01ACAFRE">
									<option></option>
									<option value="B"
										<%if (svBasic.getE01ACAFRE().equals("B"))
					out.print("selected");%>>Quincenal</option>
									<option value="M"
										<%if (svBasic.getE01ACAFRE().equals("M"))
					out.print("selected");%>>Mensual</option>
									<option value="Q"
										<%if (svBasic.getE01ACAFRE().equals("Q"))
					out.print("selected");%>>Trimestral</option>
									<option value="S"
										<%if (svBasic.getE01ACAFRE().equals("S"))
					out.print("selected");%>>Semestral</option>
									<option value="Y"
										<%if (svBasic.getE01ACAFRE().equals("Y"))
					out.print("selected");%>>Anual</option>
							</select></td>
							<td nowrap width="25%">
								<div align="right">Fecha de Inicio :</div>
							</td>
							<td nowrap width="24%"><eibsinput:date name="svBasic"
									fn_year="E01ACASTY" fn_month="E01ACASTM" fn_day="E01ACASTD"
									required="false" /></td>
						</tr>

						<tr id="trclear">
						<td nowrap width="25%">
								<div align="right">Cuenta a Debitar:</div>
							</td>
							<td nowrap width="25%"><input type="hidden" name="E01ACATYR"
								size="1" maxlength="1"
								value="<%=svBasic.getE01ACATYR().trim()%>"> <input
								type="text" name="E01ACAPAC" size="14" maxlength="12"
								value="<%=svBasic.getE01ACAPAC().trim()%>"> <a
								href="javascript:GetAccountCustomer('E01ACAPAC',document.forms[0].E01ACMBNK.value,'RT','N',document.forms[0].E01ACMCUN.value)"><img
									src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
									border="0"></a></td>
							<td nowrap width="25%">
								<div align="right">Día de aplicación :</div>
							</td>
							<td nowrap width="25%"><input type="text" size="2"
								maxlength="3" name="E01ACADMP"
								value="<%=svBasic.getE01ACADMP().trim()%>">
							</td>
						</tr>

						<tr id="trdark">
							<td nowrap width="25%">
								<div align="right">Monto del Ahorro:</div>
							</td>
							<td nowrap width="21%"><eibsinput:text name="svBasic"
									property="E01ACAAUG"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"
									required="false" />
							</td>
							<td nowrap width="25%">
								<div align="right">Cuotas Pactadas :</div>
							</td>
							<td nowrap width="25%"><input type="text" name="E01ACACON"
								size="6" maxlength="5"
								value="<%=svBasic.getE01ACACON().trim()%>"
								onKeypress="enterInteger(event)" readonly>
							</td>
							
						</tr>
						<tr id="trclear">
							<td nowrap width="24%">
								<div align="right">Fecha de Vencimiento :</div>
							</td>
							<td nowrap width="24%"><eibsinput:date name="svBasic"
									fn_year="E01ACAENY" fn_month="E01ACAENM" fn_day="E01ACAEND"
									required="false" readonly="true" /></td>
							<td nowrap width="24%"></td>
							<td nowrap width="26%" height="19"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<%
			}
		%>

<H4>Información  Impuestos</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
       <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr id="trdark"> 
            <% if (currUser.getE01INT().equals("05")) {%> 
              <td nowrap width="30%" align="right">Exenta del Gravamen a Movimientos Financieros (GMF): 
              </td>
              <td nowrap width="22%"> 
              	<input type="radio"  value="Y"  onClick="document.forms[0].E01ACMTX1.value='Y'"   
			  		<%if(svBasic.getE01ACMTX1().equals("Y")) out.print("checked");%> disabled="disabled">
              		S&iacute; 
              	<input type="radio" id="myCheck"  value="N" onClick="document.forms[0].E01ACMTX1.value='N'"
			  		<%if(svBasic.getE01ACMTX1().equals("N")) out.print("checked");%> disabled="disabled">
              		No <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" >
              </td>
            <td nowrap width="26%"><div align="right">Clase de Cuenta :</div></td>
            <td nowrap width="22%">
				<input type="text" name="E01ACMTX9" size="2" maxlength="1" value="<%= svBasic.getE01ACMTX9().trim()%>">
            	<a href="javascript:GetCodeCNOFC('E01ACMTX9','CQ')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0" ></a>
            </td>
            <% } else {%>
              <td nowrap width="30%"></td>
              <td nowrap width="22%"></td>
              <td nowrap width="26%"></td>
              <td nowrap width="22%"></td>
            <%}%> 
           </tr>
        </table>
      </td>
    </tr>
</table>


		<%
			if (svBasic.getH01FLGMAS().equals("N")) {
		%>
		<H4>Origen de Fondos</H4>
		<TABLE id="mainTable" class="tableinfo" width="80%">
			<TR>
				<TD>

					<table id="headTable">
						<tr id="trdark">
							<td nowrap align="center">Concepto</td>
							<td nowrap align="center">Banco</td>
							<td nowrap align="center">Sucursal</td>
							<td nowrap align="center">Moneda</td>
							<td nowrap align="center">Referencia</td>
							<td nowrap align="center">Monto</td>
						</tr>
					</table>

					<div id="dataDiv" style="height: 60; overflow: auto;">
						<table id="dataTable" width="100%">
							<%
								int amount = 9;
									String name;
									for (int i = 1; i <= amount; i++) {
										name = i + "";
							%>
							<tr id="trclear">
								<td nowrap>
									<div align="center">
										<%=i%>
										<input type="text" name="E01OFFOP<%=name%>"
											id="E01OFFOP<%=name%>"
											value="<%=svBasic.getField("E01OFFOP" + name).getString()
							.trim()%>"
											size="3" maxlength="3"> <input type="hidden"
											name="E01OFFGL<%=name%>" id="E01OFFGL<%=name%>"
											value="<%=svBasic.getField("E01OFFGL" + name).getString()
							.trim()%>">
										<input type="text" name="E01OFFCO<%=name%>"
											id="E01OFFCO<%=name%>" size="25" maxlength="25" readonly
											value="<%=svBasic.getField("E01OFFCO" + name).getString()
							.trim()%>"
											class="context-menu-help"
											onmousedown="init(conceptHelp,this.name,document.getElementById('E01ACMBNK').value, document.getElementById('E01OFFCY<%=name%>').value,'E01OFFGL<%=name%>','E01OFFOP<%=name%>',document.getElementById('E01ACMACD').value, '01')">
									</div>
								</td>
								<td nowrap>
									<div align="center">
										<input type="text" name="E01OFFBK<%=name%>"
											id="E01OFFBK<%=name%>" size="2" maxlength="2"
											value="<%=svBasic.getField("E01OFFBK" + name).getString()
							.trim()%>">
									</div>
								</td>
								<td nowrap>
									<div align="center">
										<input type="text" name="E01OFFBR<%=name%>"
											id="E01OFFBR<%=name%>" size="5" maxlength="4"
											value="<%=svBasic.getField("E01OFFBR" + name).getString()
							.trim()%>"
											class="context-menu-help"
											onmousedown="init(branchHelp,this.name,document.getElementById('E01ACMBNK').value,'','','','')">
									</div>
								</td>
								<td nowrap>
									<div align="center">
										<input type="text" name="E01OFFCY<%=name%>"
											id="E01OFFCY<%=name%>" size="3" maxlength="3"
											value="<%=svBasic.getField("E01OFFCY" + name).getString()
							.trim()%>"
											class="context-menu-help"
											onmousedown="init(currencyHelp,this.name,document.getElementById('E01ACMBNK').value,'','','','')">
									</div>
								</td>
								<td nowrap>
									<div align="center">
										<input type="text" name="E01OFFAC<%=name%>"
											id="E01OFFAC<%=name%>" size="13" maxlength="12"
											value="<%=svBasic.getField("E01OFFAC" + name).getString()
							.trim()%>"
											class="context-menu-help"
											onmousedown="init(accountHelp,this.name,document.getElementById('E01ACMBNK').value,'','','','RT')">
									</div>
								</td>
								<td nowrap>
									<div align="center">
										<input class="txtright" type="text" name="E01OFFAM<%=name%>"
											id="E01OFFAM<%=name%>" size="15" maxlength="15"
											value="<%=svBasic.getField("E01OFFAM" + name).getString()
							.trim()%>"
											onKeypress="enterDecimal()">
									</div>
								</td>
							</tr>
							<%
								}
							%>
						</table>
					</div>


					<table id="footTable">
						<tr id="trdark">
							<td nowrap align="right"><b>Equivalente Moneda de la
									Cuenta:</b></td>
							<td nowrap align="center"><input type="text"
								name="E01OFFEQV" id="E01OFFEQV" size="15" maxlength="15"
								readonly value="<%=svBasic.getE01OFFEQV().trim()%>"></td>
						</tr>
					</table>

				</TD>
			</TR>
		</TABLE>
		<SCRIPT type="text/javascript">
			function tableresize() {
				adjustEquTables(getElement('headTable'),
						getElement('dataTable'), getElement('dataDiv'), 0, true);
			}
			tableresize();
			window.onresize = tableresize;
		</SCRIPT>

		<%
			}
		%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
   	<tr bgcolor="#FFFFFF"> 
   		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="A" >Aceptar con Avisos</td>
   	</tr>
 	</table>  
<table width="100%">		
  	<tr>
		<td width="100%" align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="javascript:goAction(1);">
  		</td>
  	</tr>	
</table>


		<script type="text/javascript">
			var savingsType = $('#E01ACATYH');
			var formPay = $('#E01ACATYR');
			var savingsTypeDiv = $('#ahrPrgmDiv');
			var convenioElems = $('.convenioElms');
			var accountElems = $('.accountElms');

			function dsplySavingsTypSec() {
				if (savingsType.val().trim() !== '') {
					savingsTypeDiv.show();
				} else {
					savingsTypeDiv.hide();
				}
			}

			function dsplyPayMethods() {
				if (formPay.val().trim() === '1') {
		<%--Convenio--%>
			convenioElems.show();
					accountElems.hide();
					clearAccountPayFields();
				} else if (formPay.val().trim() === '2') {
		<%-- Accounts --%>
			accountElems.show();
					convenioElems.hide();
					clearConvenioFields();
				} else {
					accountElems.hide();
					convenioElems.hide();
					clearAccountPayFields();
					clearConvenioFields();
				}
			}

			function clearConvenioFields() {
				convenioElems.find('input:text').each(function() {
					$(this).val('');
				});
			}

			function clearAccountPayFields() {
				accountElems.find('input:text').each(function() {
					$(this).val('');
				});
			}

			function registerEventHandlers() {
		<%-- Type of Savings/Shows Saving Applications Table--%>
			savingsType.on('change', function() {
					dsplySavingsTypSec();
				});
		<%-- Ahorro Programdo Section/Shows different payment options--%>
			formPay.on('change', function() {
					dsplyPayMethods();
				});
			}

			function goAsign() {
		<%-- Server call to assign "convenio" to customer --%>
			var url = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=700";
				CenterWindow(url, 30, 30, 2);
			}

			$('document').ready(function() {
				registerEventHandlers();
				dsplyPayMethods();
			});

			function showSavingsPlan() {
				var url = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDD0000?SCREEN=900";
				CenterWindow(url, 1070, 660, 2);
			}
		</script>

	</form>
</body>
</html>
