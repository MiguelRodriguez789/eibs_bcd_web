<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV030001Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Cheques Avalados</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV030001Message" scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript">

function enter(){
	document.forms[0].submit();
}
	
function setParams() {
	var yy = <%= currUser.getBigDecimalE01RDY().intValue() %>;
	var mm = <%= currUser.getBigDecimalE01RDM().subtract(new BigDecimal("1")).intValue() %>;
	var dd = <%= currUser.getBigDecimalE01RDD().intValue() %>;
	var frmDate = new Date(yy, mm, 1);
	var todDate = new Date(yy, mm+1, 0);
	getElement("E01FRMDTM").value = "" + (frmDate.getMonth() + 1);
	getElement("E01FRMDTD").value = "" + frmDate.getDate();
	getElement("E01FRMDTY").value = "" + frmDate.getFullYear();
	getElement("E01TODTEM").value = "" + (todDate.getMonth() + 1);
	getElement("E01TODTED").value = "" + todDate.getDate();
	getElement("E01TODTEY").value = "" + todDate.getFullYear();
}

</script>

</head>

<body>
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">Cheques Avalados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cheques_avalados_enter_params.jsp, EPV0300"></h3>
<hr size="4">

<form method="POST"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0300">
	<input type="hidden" name="SCREEN" id="SCREEN" value="2">
	<input type="hidden" name="H01FLGWK1" value="">
	
	<table class="tableinfo" align="center" width="85%" >
		<tr> 
			<td> 
				<table border="0" align="center" cellspacing="1" cellpadding="0">
					<tr>
						<td nowrap align="right">Fecha Inicial :</td>
						<td nowrap align="left">
							<eibsinput:date name="datarec" fn_month="E01FRMDTM" fn_day="E01FRMDTD" fn_year="E01FRMDTY"  /> 
						</td>
					</tr>
					<tr>
						<td nowrap align="right">Fecha Final :</td>
						<td nowrap  align="left"> 
							<eibsinput:date name="datarec" fn_month="E01TODTEM" fn_day="E01TODTED" fn_year="E01TODTEY"  /> 
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<p align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	</p>
			
</form>

<script type="text/javascript">
	setParams();
</script>

</body>
</html>
