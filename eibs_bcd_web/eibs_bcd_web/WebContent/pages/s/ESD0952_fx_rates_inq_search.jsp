<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<title>Conexión</title>
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript">

	function enterSearch(firsTime){
		var E01PRMBNK = document.forms[0].E01PRMBNK.value;
		var E01PRMCCY = document.forms[0].E01PRMCCY.value;
		var E01PRMDFM = document.forms[0].E01PRMDFM.value;
		var E01PRMDFD = document.forms[0].E01PRMDFD.value;
		var E01PRMDFY = document.forms[0].E01PRMDFY.value;
		var E01PRMDTM = document.forms[0].E01PRMDTM.value;
		var E01PRMDTD = document.forms[0].E01PRMDTD.value;
		var E01PRMDTY = document.forms[0].E01PRMDTY.value;
		var FromRecord = 0;
    	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0952?SCREEN=2@E01PRMBNK=" + E01PRMBNK + "@E01PRMCCY=" + E01PRMCCY  + "@E01PRMDFM=" + E01PRMDFM  + "@E01PRMDFD=" + E01PRMDFD  + "@E01PRMDFY=" + E01PRMDFY + "@E01PRMDTM=" +  E01PRMDTM + "@E01PRMDTD=" +  E01PRMDTD + "@E01PRMDTY=" + E01PRMDTY + "'";
	}

</script>

</head>


<body>

<h3 align="center">Consulta de Tasa de Cambio para Moneda Extranjera
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ESD0952_fx_rates_inq_search.jsp"></h3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDEN000"
	target="_parent"><input type=HIDDEN name="SCREEN" value="200">
<table class="tableinfo" cellspacing="2" cellpadding="2" width="100%"
	border="0" id="trdark">
	<tr>
		<td width="0%" align="right" nowrap>Banco :</td>
		<td width="0%" nowrap><input type="text" name="E01PRMBNK"
			maxlength="2" size="2"></td>
		<td width="0%" align="right" nowrap>Moneda :</td>
		<td width="0%" nowrap><input type="text" name="E01PRMCCY"
			maxlength="3" size="3"> <a
			href="javascript:GetCurrency('E01PRMCCY','')"> <img
			src="<%=request.getContextPath()%>/images/1b.gif" title="help"
			align="middle" border="0"></a></td>
	</tr>
	<tr>
		<td width="0%" align="right" nowrap>Fecha de Inicio :</td>
		<td width="0%" nowrap>
			<eibsinput:date fn_year="E01PRMDFY" fn_month="E01PRMDFM" fn_day="E01PRMDFD"/>		
		</td>
		<td width="0%" align="right" nowrap>Fecha Final :</td>
		<td width="0%" nowrap>
			<eibsinput:date fn_year="E01PRMDTY" fn_month="E01PRMDTM" fn_day="E01PRMDTD"/>		
		</td>
	</tr>
</table>

<div align=center><input id="EIBSBTN" type=button name="Submit"
	value="Search" onClick="javascript:enterSearch(false)"></div>
</form>

<%
 	if (!error.getERRNUM().equals("0")) {
    	error.setERRNUM("0");
%>
<script type="text/javascript">
            showErrors();
     	</script>
<%
 	}
%>
</body>
</html>
