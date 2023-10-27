<!-- Created by Saif Mazhar 8/25/07 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Interest Rates Inquiry - CAL</title>
	<meta http-equiv="Content-Style-Type" content="text/css">
	<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
	<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
	<jsp:useBean id="msg02" class="datapro.eibs.beans.ESD095202Message"  scope="session" />
</head>

<body>
	<h3 align="center"> Consulta de Tasa de Cambio para Moneda Extranjera
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ESD0952_fx_rate_inq_info.jsp"></h3><%int i = 0;%>
	<hr size="4">
	  <h4>Información Básica</h4>
	<table class="tableinfo" cellpadding="2" cellspacing="0" width="100%" border="0">
		<tr id="trdark">
			<td align="right" nowrap>Banco</td>
			<td nowrap><input type="text" name="E02RTRBNK" value="<%=msg02.getE02RTRBNK().trim()%>" maxlength="<%=msg02.getField("E02RTRBNK").getLength()%>" size="<%=msg02.getField("E02RTRBNK").getLength()%>" ></td>
			<td align="right" nowrap>Moneda</td>
			<td nowrap><input type="text" name="E02RTRCCY" value="<%=msg02.getE02RTRCCY().trim()%>" maxlength="<%=msg02.getField("E02RTRCCY").getLength()%>" size="<%=msg02.getField("E02RTRCCY").getLength()%>" ></td>
			<td align="right" nowrap>Fecha</td>
			<td nowrap><input type="text" name="E02RTRRDM" value="<%=msg02.getE02RTRRDM().trim()%>" maxlength="<%=msg02.getField("E02RTRRDM").getLength()%>" size="<%=msg02.getField("E02RTRRDM").getLength()%>" > 
			/  <input type="text" name="E02RTRRDD" value="<%=msg02.getE02RTRRDD().trim()%>" maxlength="<%=msg02.getField("E02RTRRDD").getLength()%>" size="<%=msg02.getField("E02RTRRDD").getLength()%>" > 
			/ <input type="text" name="E02RTRRDY" value="<%=msg02.getE02RTRRDY().trim()%>" maxlength="<%=msg02.getField("E02RTRRDY").getLength()%>" size="<%=msg02.getField("E02RTRRDY").getLength() + 1%>" ></td>
			<td align="right" nowrap>Tasa de Cambio</td>
			<td nowrap><input type="text" name="E02RTREXR" value="<%=msg02.getE02RTREXR().trim()%>" maxlength="<%=msg02.getField("E02RTREXR").getLength()%>" size="<%=msg02.getField("E02RTREXR").getLength() + 1%>" ></td>
		</tr>
</table>


<h4>Tasas de Cambios Futuras</h4>
<table class="tableinfo" cellpadding="2" cellspacing="0" width="100%" border="0"> 
  <%i = 0;%>
	<tr id="<%=i++ %2 == 0 ? "trdark" : "trclear"%>">
		<td align="right" nowrap>7 Días</td>
		<td nowrap><input type="text" name="E02RTRFR1" value="<%=msg02.getE02RTRFR1().trim()%>" maxlength="<%=msg02.getField("E02RTRFR1").getLength()%>" size="<%=msg02.getField("E02RTRFR1").getLength()%>" ></td>
		<td align="right" nowrap>30 Días </td>
		<td nowrap><input type="text" name="E02RTRFR2" value="<%=msg02.getE02RTRFR2().trim()%>" maxlength="<%=msg02.getField("E02RTRFR2").getLength()%>" size="<%=msg02.getField("E02RTRFR2").getLength()%>" ></td>
		<td align="right" nowrap>30 Días </td>
		<td nowrap><input type="text" name="E02RTRFR3" value="<%=msg02.getE02RTRFR3().trim()%>" maxlength="<%=msg02.getField("E02RTRFR3").getLength()%>" size="<%=msg02.getField("E02RTRFR3").getLength()%>" ></td>
	</tr>
	<tr id="<%=i++ %2 == 0 ? "trdark" : "trclear"%>">
		<td align="right" nowrap>60 Días </td>
		<td nowrap><input type="text" name="E02RTRFR4" value="<%=msg02.getE02RTRFR4().trim()%>" maxlength="<%=msg02.getField("E02RTRFR4").getLength()%>" size="<%=msg02.getField("E02RTRFR4").getLength()%>" ></td>
		<td align="right" nowrap>90 Días </td>
		<td nowrap><input type="text" name="E02RTRFR5" value="<%=msg02.getE02RTRFR5().trim()%>" maxlength="<%=msg02.getField("E02RTRFR5").getLength()%>" size="<%=msg02.getField("E02RTRFR5").getLength()%>" ></td>
		<td align="right" nowrap>120 Días</td>
		<td nowrap><input type="text" name="E02RTRFR6" value="<%=msg02.getE02RTRFR6().trim()%>" maxlength="<%=msg02.getField("E02RTRFR6").getLength()%>" size="<%=msg02.getField("E02RTRFR6").getLength()%>" ></td>
	</tr>
	<tr id="<%=i++ %2 == 0 ? "trdark" : "trclear"%>">
		<td align="right" nowrap>150 Días</td>
		<td nowrap><input type="text" name="E02RTRFR7" value="<%=msg02.getE02RTRFR7().trim()%>" maxlength="<%=msg02.getField("E02RTRFR7").getLength()%>" size="<%=msg02.getField("E02RTRFR7").getLength()%>" ></td>
		<td align="right" nowrap>180 Días</td>
		<td nowrap><input type="text" name="E02RTRFR8" value="<%=msg02.getE02RTRFR8().trim()%>" maxlength="<%=msg02.getField("E02RTRFR8").getLength()%>" size="<%=msg02.getField("E02RTRFR8").getLength()%>" ></td>
		<td align="right" nowrap>360  Días</td>
		<td nowrap><input type="text" name="E02RTRFR9" value="<%=msg02.getE02RTRFR9().trim()%>" maxlength="<%=msg02.getField("E02RTRFR9").getLength()%>" size="<%=msg02.getField("E02RTRFR9").getLength()%>" ></td>
	</tr>
	<tr id="<%=i++ %2 == 0 ? "trdark" : "trclear"%>">
		<td align="right" nowrap>720 Días</td>
		<td nowrap><input type="text" name="E02RTRF10" value="<%=msg02.getE02RTRF10().trim()%>" maxlength="<%=msg02.getField("E02RTRF10").getLength()%>" size="<%=msg02.getField("E02RTRF10").getLength()%>" ></td>
		<td align="right" nowrap>OPCOD</td>
		<td nowrap><input type="text" name="E02RTRMUD" value="<%=msg02.getE02RTRMUD().trim()%>" maxlength="<%=msg02.getField("E02RTRMUD").getLength()%>" size="<%=msg02.getField("E02RTRMUD").getLength() + 1%>" ></td>
		<td nowrap></td>
		<td nowrap></td>
	</tr>
</table>
<h4>Información Adicional</h4>
<table class="tableinfo" cellpadding="2" cellspacing="0" width="100%" border="0"> 
  <%i = 0;%>
	<tr id="<%=i++ %2 == 0 ? "trdark" : "trclear"%>">
		<td align="right" nowrap>Balance Actual : </td>
	  <td nowrap><input type="text" name="E02RTRPAD" value="<%=msg02.getE02RTRPAD().trim()%>" maxlength="<%=msg02.getField("E02RTRPAD").getLength()%>" size="<%=msg02.getField("E02RTRPAD").getLength()%>" ></td>
		<td align="right" nowrap>Sales Rate : </td>
		<td nowrap><input type="text" name="E02RTRCVB" value="<%=msg02.getE02RTRCVB().trim()%>" maxlength="<%=msg02.getField("E02RTRCVB").getLength()%>" size="<%=msg02.getField("E02RTRCVB").getLength()%>" ></td>
		<td align="right" nowrap>Foreing Check Purchase Rate : </td>
		<td nowrap><input type="text" name="E02RTRKPR" value="<%=msg02.getE02RTRKPR().trim()%>" maxlength="<%=msg02.getField("E02RTRKPR").getLength()%>" size="<%=msg02.getField("E02RTRKPR").getLength()%>" ></td>
	</tr>
	<tr id="<%=i++ %2 == 0 ? "trdark" : "trclear"%>">
		<td align="right" nowrap>Foreing Check : </td>
		<td nowrap><input type="text" name="E02RTRKSR" value="<%=msg02.getE02RTRKSR().trim()%>" maxlength="<%=msg02.getField("E02RTRKSR").getLength()%>" size="<%=msg02.getField("E02RTRKSR").getLength()%>" ></td>
		<td align="right" nowrap>Rate Tolerance : </td>
		<td nowrap><input type="text" name="E02RTRTLR" value="<%=msg02.getE02RTRTLR().trim()%>" maxlength="<%=msg02.getField("E02RTRTLR").getLength()%>" size="<%=msg02.getField("E02RTRTLR").getLength()%>" ></td>
		<td align="right" nowrap></td>
		<td nowrap></td>
	</tr>
</table>
</body>
</html>
