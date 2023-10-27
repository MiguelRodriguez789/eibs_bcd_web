<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css"	rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="balance" class="datapro.eibs.beans.EGL075001Message" scope="session" />
</head>
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		out.println("<SCRIPT Language=\"Javascript\">");
		error.setERRNUM("0");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0755">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<h3 align="center">Saldos de cuentas Contables
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"	name="EIBS_GIF" title="inq_enter1.jsp,EGL0750">
</h3>
<hr size="4">
<p></p>
<table id="display" class="TABLEINFO" align="center">
	<tr id="trclear">
		<td align="right">Banco:</td>
		<td>	
			<input type="text" name="E01GLBBNK" size="3" maxlength="2">
		</td>
	</tr>
	<tr>
		<td align="right">Moneda: </td>
		<td>
			<input type="text" name="E01GLBCCY" size="4" maxlength="3"> 
			<a href="javascript:GetCurrency('E01GLBCCY','')"> 
			<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"> </a>
		</td>
		</tr>
	<tr>
		<td align="right">Código Contable: </td>
		<td>
			<input type="text" name="E01GLBGLN" size="17" maxlength="16"> 
			<a href="javascript:GetLedger('E01GLBGLN',document.forms[0].E01GLBBNK.value,document.forms[0].E01GLBCCY.value,'')">
			<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."	align="bottom" border="0"> </a>
		</td>
		</tr>
	<tr>
		<td align="right"> Nivel:</td>
		<td>
			<select name="E01GLBNIV">
				<option value=" " <%if (balance.getE01GLBNIV().equals(" ")) out.print("selected");%>>Ninguno</option>
				<option value="1" <%if (balance.getE01GLBNIV().equals("1")) out.print("selected");%>>Nivel 1</option>
				<option value="2" <%if (balance.getE01GLBNIV().equals("2")) out.print("selected");%>>Nivel 2</option>
				<option value="3" <%if (balance.getE01GLBNIV().equals("3")) out.print("selected");%>>Nivel 3</option>
				<option value="4" <%if (balance.getE01GLBNIV().equals("4")) out.print("selected");%>>Nivel 4</option>
				<option value="5" <%if (balance.getE01GLBNIV().equals("5")) out.print("selected");%>>Nivel 5</option>
				<option value="6" <%if (balance.getE01GLBNIV().equals("6"))	out.print("selected");%>>Nivel 6</option>
				<option value="7" <%if (balance.getE01GLBNIV().equals("7")) out.print("selected");%>>Nivel 7</option>
				<option value="8" <%if (balance.getE01GLBNIV().equals("8"))	out.print("selected");%>>Nivel 8</option>
			</select>
		</td>
	</tr>
</table>

<p align="center">
	<input id="EIBSBTN" type=submit name="Submit"	value="Enviar">
</p>
</form>
</body>
</html>
