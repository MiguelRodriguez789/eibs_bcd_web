
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@page import="com.datapro.constants.Entities"%> 
<%@ page import = "datapro.eibs.master.Util" %>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Listado de Convenios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id="cnvList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="header" class="datapro.eibs.beans.ECO012001Message" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Pago de Planilla<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cancelar_planilla_apply.jsp,ECO120"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0120" onsubmit="return validar();">
<input type="hidden" name="SCREEN" value="500">

<INPUT TYPE=HIDDEN NAME="E01SELNUM" value="<%= header.getE01SELNUM().trim()%>">
<INPUT TYPE=HIDDEN NAME="E01SELRCY" value="<%= header.getE01SELRCY().trim()%>">

<br>
<table id="mainTable" class="tableinfo" align="center">
	<tr>
	<td nowrap valign="top" width="100%">
		<table width="100%">
			<tr id="trdark">
				<td align="right" nowrap width="10%">Codigo Convenio :</td>				
				<td align="left" nowrap width="15%"><%=header.getE01PLHCDE() %><input type="hidden" name="E01PLHCDE" value="<%=header.getE01PLHCDE() %>"></td>
				<td align="right" nowrap width="10%">Nro Planilla :</td>
				<td align="left" nowrap width="15%"><%=header.getE01PLHNUM() %><input type="hidden" name="E01PLHNUM" value="<%=header.getE01PLHNUM() %>"></td>
				<td align="right" nowrap width="10%">Fecha Emisión :</td>
				<td align="left" nowrap width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),
																 header.getBigDecimalE01PLHFEM().intValue(),
																 header.getBigDecimalE01PLHFED().intValue(),
																 header.getBigDecimalE01PLHFEY().intValue())%></td>
				<td align="right" nowrap width="10%">Estado :</td>
				<td align="left" nowrap width="15%"><%=header.getE01DSCSTA() %></td>
			</tr>
			<tr id="trclear">
				<td align="right"  nowrap  width="10%">Empleador :</td>
				<td align="left" nowrap width="15%"><%=header.getE01PLHENM()%></td>
				<td align="right" nowrap width="10%">Identificacion :</td>
				<td align="left" nowrap width="15%"><%=header.getE01PLHEID()%></td>
				<td align="right" nowrap width="10%">Vencimiento : </td>
				<td align="left" nowrap  width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),
																 header.getBigDecimalE01PLHFVM().intValue(),
																 header.getBigDecimalE01PLHFVD().intValue(),
																 header.getBigDecimalE01PLHFVY().intValue())%></td>				
				<td align="right" nowrap width="10%">Oficina Pago :</td>
				<td align="left" nowrap width="15%"><%=header.getE01PLHBRN()%></td>
			</tr>
			<tr id="trdark">
				<td align="right"  nowrap  width="10%">Cliente Convenio :</td>
				<td align="left" nowrap width="15%"><%=header.getE01PLHCNM()%></td>
				<td align="right" nowrap width="10%">Identificacion :</td>
				<td align="left" nowrap width="15%"><%=header.getE01PLHCID()%></td>
				<td align="right" nowrap width="10%">Moneda :</td>
				<td align="left" nowrap  width="15%"><%=header.getE01PLHRCY() %><input type="hidden" name="E01PLHRCY" value="<%=header.getE01PLHRCY() %>"></td>
				<td align="right" nowrap width="10%">Total Planilla :</td>
				<td align="left" nowrap  width="15%"><%=header.getE01PLHPAM() %></td>
			</tr>
		</table>
	</td>
  </tr>
</table>
 
<table id="mainTable" class="tableinfo" align="center">
  <tr>
	<td nowrap valign="top" width="100%">
		<table width="100%">
			<tr id="trclear">
				<td align="center" width="14%">Monto Recibido</td>				
				<td align="center" width="14%">Recibido Aplicado</td>				
				<td align="center" width="14%">Recibido Rechazado</td>				
				<td align="center" width="14%">Pagado de menos</td>				
				<td align="center" width="14%">Monto Impago</td>				
				<td align="center" width="14%">Aportes Pagados</td>				
				<td align="center" width="14%">Pagado por Caja </td>				
			</tr>
			<tr id="trdark">
				<td align="center" nowrap  width="14%"><%=header.getE01PLHPPG() %></td>
				<td align="center" nowrap  width="14%"><%=header.getE01PLHPAP() %></td>
				<td align="center" nowrap  width="14%"><%=header.getE01PLHPRE() %></td>
				<td align="center" nowrap  width="14%"><%=header.getE01PLHPPN() %></td>
				<td align="center" nowrap  width="14%"><%=header.getE01PLHNRP() %></td>
				<td align="center" nowrap  width="14%"><%=header.getE01PLHAAM() %></td>
				<td align="center" nowrap  width="14%"><%=header.getE01PLHRAM() %></td>
			</tr>
		</table>
      </td>
    </tr>
 </table>


<table align="center" id="TBHELPN">
	<tr>
	<td>
	<div id="DIVSUBMIT" align="center">
		<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
	</div>
	</td>
	</tr>
</table>
	
</form>
</body>
</html>
