<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tabla de Monitoreo</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL055801Message" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

<SCRIPT type="text/javascript">

</SCRIPT>

</head>

<%
	boolean newOnly = false;
	// Determina si es nuevo
	if (userPO.getPurpose().equals("NEW")) {
		newOnly = true;
	} else {
		newOnly = false;
	}
%>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
		 error.setERRNUM("0");
		 out.println("<SCRIPT Language=\"Javascript\">");
		 out.println("       showErrors()");
		 out.println("</SCRIPT>");
 }       
%>

<h3 align="center">Tabla de Monitoreo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_table_maint.jsp,EDL0558"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0558" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" value="105">
	<INPUT TYPE=HIDDEN NAME="H01FLGMAS" >
	
	<%int row = 0; %>
	<table class="tableinfo" >
		<tr> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap width="25%" align=right><b>Condici&oacute;n :&nbsp;</b></td>
						<td nowrap width="25%">                
							<SELECT name="E01MNPCON" disabled>
								<OPTION value="C" <%if (lnParam.getE01MNPCON().equals("C")) { out.print("selected"); }%>>Consumo </OPTION>
								<OPTION value="L" <%if (lnParam.getE01MNPCON().equals("L")) { out.print("selected"); }%>>Comercial </OPTION>
								<OPTION value="H" <%if (lnParam.getE01MNPCON().equals("H")) { out.print("selected"); }%>>Vivienda </OPTION>
								<OPTION value="M" <%if (lnParam.getE01MNPCON().equals("M")) { out.print("selected"); }%>>Microcredito </OPTION>
							</SELECT>
						</td>
						<td nowrap width="25%" align=right></td>
						<td nowrap width="25%" align=right></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<H4>Datos B&aacute;sicos</H4>
	<table  class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width="30%" ><div align="right"><b>Validar Modificaci&oacute;n:</b></div></td>
						<td nowrap width="10%" ></td>
						<td nowrap width="30%" >
							<div align="left">
								<eibsinput:text property="E01MNPMDT" name="lnParam" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TERM %>" />
								Nro. de Meses 
							</div>
						</td>
						<td nowrap width="30%" >
							<div align="left">
								<eibsinput:text property="E01MNPMDD" name="lnParam" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TERM %>" />
								D&iacute;as de Mora Consecutivos
							</div>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width="30%" ><div align="right"><b>Monitorear Modificaci&oacute;n:</b></div></td>
						<td nowrap width="10%" ></td>
						<td nowrap width="30%" >
							<div align="left">
								<eibsinput:text property="E01MNPMDC" name="lnParam" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TERM %>" />
								Nro. de Cuotas o Meses Ininterrumpidos
							</div>
						</td>
						<td nowrap width="30%" >
							<div align="left">
								<eibsinput:text property="E01MNPMDM" name="lnParam" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TERM %>" />
								D&iacute;as de Mora M&aacute;ximo
							</div>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width="30%" ><div align="right"><b>Monitorear Reestructuracion:</b></div></td>
						<td nowrap width="10%" ></td>
						<td nowrap width="30%" >
							<div align="left">
								<eibsinput:text property="E01MNPREC" name="lnParam" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TERM %>" />
								Nro. de Cuotas o Meses Ininterrumpidos
							</div>
						</td>
						<td nowrap width="30%" >
							<div align="left">
								<eibsinput:text property="E01MNPREM" name="lnParam" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TERM %>" />
								D&iacute;as de Mora M&aacute;ximo
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<p align="center"> 
		<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
	</p>

</form>

<script type="text/javascript">

</script>

</body>
</html>
