<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>

<%@ page import="datapro.eibs.master.Util"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Codigos Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">
</head>

<jsp:useBean id="rtCodes" class="datapro.eibs.beans.ESD000002Message"
	scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp">
	 
</SCRIPT>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp">
	 
</SCRIPT>

<SCRIPT type="text/javascript">
	
<%if (userPO.getOption().equals("RT")) {%>
	builtNewMenu(rt_a_opt);
<%} else if (userPO.getOption().equals("SV")) {%>
	builtNewMenu(sv_a_opt);
<%} else if (userPO.getOption().equals("CP")) {%>
	builtNewMenu(cpar_a_opt);
<%}%>
	
</SCRIPT>

<body bgcolor="#FFFFFF">


	<%
		if (!error.getERRNUM().equals("0")) {
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");
		}
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	%>

	<h3 align="center">C&oacute;digos de Clasificaci&oacute;n</h3>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
		name="EIBS_GIF" title="rt_ap_codes.jsp,EDD1000">
	<hr size="4">
	<FORM METHOD="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000">
		<p>
			<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="14">
		</p>

		<%
			int row = 0;
		%>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF">
				<td nowrap>
					<table cellspacing="0" cellpadding="2" width="100%" border="0"
						class="tbhead">
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="16%">
								<div align="right">
									<b>Cliente :</b>
								</div>
							</td>
							<td nowrap width="20%">
								<div align="left">
									<input type="text" readonly name="E02CUN" size="10"
										maxlength="9" value="<%=userPO.getCusNum().trim()%>">
								</div>
							</td>
							<td nowrap width="16%">
								<div align="right">
									<b>Nombre :</b>
								</div>
							</td>
							<td nowrap colspan="3">
								<div align="left">
									<font face="Arial"><font face="Arial"><font
											size="2"> <input type="text" readonly name="E02NA1"
												size="45" maxlength="45"
												value="<%=userPO.getCusName().trim()%>">
										</font></font></font>
								</div>
							</td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="16%">
								<div align="right">
									<b>Cuenta :</b>
								</div>
							</td>
							<td nowrap width="20%">
								<div align="left">
									<input type="text" readonly name="E02ACC" size="13"
										maxlength="12" value="<%=userPO.getAccNum().trim()%>">
								</div>
							</td>
							<td nowrap width="16%">
								<div align="right">
									<b>Moneda : </b>
								</div>
							</td>
							<td nowrap width="16%">
								<div align="left">
									<b> <input type="text" readonly name="E02CCY" size="3"
										maxlength="3" value="<%=userPO.getCurrency().trim()%>">
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
									<b> <input type="text" readonly name="E02PRO" size="4"
										maxlength="4" value="<%=userPO.getProdCode().trim()%>">
									</b>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<h4>C&oacute;digos de Clasificaci&oacute;n</h4>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF">
				<td nowrap height="43">
					<table cellspacing=0 cellpadding=2 width="100%" border="0"
						height="118">
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Ejecutivo Principal :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02OFC"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02OFC"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%" height="37">
								<div align="right">Ejecutivo Secundario :</div>
							</td>
							<td nowrap width="70%" height="37"><eibsinput:text
									name="rtCodes" property="E02OF2"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02OF2"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Sector Econ&oacute;mico :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02INC"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02INC"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="3%">
								<div align="right">Linea de Negocio :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02BUC"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02BUC"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Pa&iacute;s de Residencia :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02GEC"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02GEC"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Pa&iacute;s de Riesgo :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02GRC"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02GRC"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>

						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Canal de Ventas :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02SCH"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02SCH"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<%
							if (!(currUser.getE01INT().trim().equals("18"))) {
						%>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Fuentes de Informacion :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02SST"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02SST"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<%
							}
						%>

						<%
							if (!(currUser.getE01INT().trim().equals("18"))) {
						%>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Código de Usuario 1 :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02UC1"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02UC1"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Código de Usuario 2 :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02UC2"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02UC2"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Código de Usuario 3 :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02UC3"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02UC3"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">C&oacute;digo de Planilla:</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02UC4"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02UC4"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<%
							} else {
						%>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Vendedor :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02UC1"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02UC1"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="30%">
								<div align="right">Supervisor Vendedor :</div>
							</td>
							<td nowrap width="70%"><eibsinput:text name="rtCodes"
									property="E02UC2"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"
									readonly="true" /> <eibsinput:text name="rtCodes"
									property="D02UC2"
									eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"
									readonly="true" /></td>
						</tr>
						<%
							}
						%>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

