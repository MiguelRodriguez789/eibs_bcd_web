<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message" 	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>

<script>

	function goAction(op) {
		document.forms[0].SCREEN.value = op;
		submitForm();
	}

	function updateTB(t, tb) {
		var x = [ 'E02CNATB' + tb, 'E02CNADE' + tb  ];
		if (t != 'T' || getElement("E02CNALB" + tb).value == "+") {
			cleanFields(x);
			readOnlyFields(x, true);
		} else {
			readOnlyFields(x, false);
		}
		if (t == 'F') {
			getElement("E02CNALN" + tb).value = '8';
			getElement("E02CNADE" + tb).value = '0';
		}
		if (t == 'S') {
			getElement("E02CNALN" + tb).value = '1';
			getElement("E02CNADE" + tb).value = '0';
		}
		if (t == 'C') {
			getElement("E02CNALN" + tb).value = '9';
			getElement("E02CNADE" + tb).value = '0';
		}
		if (t == 'B') {
			getElement("E02CNALN" + tb).value = '4';
			getElement("E02CNADE" + tb).value = '0';
		}
		if (t == 'T') {
			getElement("E02CNALN" + tb).value = '4';
			getElement("E02CNADE" + tb).value = '0';
		}
	}
</script>

</head>
<body>

	<%
		if (!error.getERRNUM().equals("0")) {
			out.println("<SCRIPT Language=\"Javascript\">");
			error.setERRNUM("0");
			out.println("       showErrors()");
			out.println("</SCRIPT>");
		}

		String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
		String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >";
		int nroVar = 11;
	%>

	<H3 align="center">
		Códigos de Referencia del Sistema - Campos Variables <br>
		<%=userPO.getHeader6()%>
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
			name="EIBS_GIF" title="cnof_generic_variable_fields.jsp, ESD0030">
	</H3>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030">

		<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600"> 
		<INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%=currUser.getE01UBK()%>">
		<input type=HIDDEN name="E01CNOFLD" id="E01CNOFLD" value="<%=refCodes.getE02CNORCD().trim()%>"> 
		<input type=HIDDEN name="TABLECODE" id="TABLECODE" value="<%=refCodes.getE02CNOCFL().trim()%>">

		<%
			int row = 0;
		%>
		<h4>Información Básica</h4>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF">
				<td nowrap>
					<table cellspacing="0" cellpadding="2" width="100%" border="0">
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="16%" align="right">Clasificación :</td>
							<td nowrap width="34%" align="left">
								<input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%=refCodes.getE02CNOCFL().trim()%>" readonly>
							</td>
							<td nowrap width="16%" align="right"></td>
							<td nowrap width="34%" align="left"></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="16%" align="right">Código :</td>
							<td nowrap width="34%" align="left">
								<% if (refCodes.getE02CNOCFL().trim().equals("C8")) { %> 
									<eibsinput:text name="refCodes" property="E02CNORCD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" maxlength="4" required="true" /> 
								<% } else {  %> 
 									<eibsinput:text name="refCodes" property="E02CNORCD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" /> 
 								<% } %> 
 								<eibsinput:text name="refCodes" property="E02CNODSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" required="true" />
							</td>
							<td nowrap width="16%" align="right">Estado :</td>
							<td nowrap width="34%" align="left">
								<select name="E02CNOIVA"> 
									<option value="A" <%if (refCodes.getE02CNOIVA().equals("A")) { out.print("selected");}%>>Activo</option>
									<option value="I" <%if (!refCodes.getE02CNOIVA().equals("A")) { out.print("selected");}%>>Inactivo</option>
								</select>
							</td>
						</tr>
						<%
							if (refCodes.getE02CNOCFL().trim().equals("FM")) {
								nroVar = 11;
						%>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="16%" height="19" align="right">Aplica a Causal:</td>
							<td nowrap height="19" align="left">
								<input type="text" name="E02CNOCPC" size="5" maxlength="4" value="<%=refCodes.getE02CNOCPC().trim()%>"> 
								<a href="javascript:GetCodeCNOFC('E02CNOCPC','FU')"> 
								<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
								</a>
							</td>
							<td nowrap width="16%" align="right"></td>
							<td nowrap width="34%" align="left"></td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="16%" height="19" align="right">Ajusta Intereses Moratorios :</td>
							<td nowrap height="19" align="left">
								<input type="radio" name="E02CNOADI" value="Y"
								<%if (refCodes.getE02CNOADI().equals("Y")) out.print("checked");%>>
								Si 
								<input type="radio" name="E02CNOADI" value="N" 
								<%if (!refCodes.getE02CNOADI().equals("Y")) out.print("checked");%>>
								No
							</td>
							<td nowrap width="16%" align="right">Bloquear Cupos :</td>
							<td nowrap width="34%" align="left">
								<input type="radio" name="E02CNOCPF" value="T" <%if (refCodes.getE02CNOCPF().equals("T")) out.print("checked");%>>
								Temporal 
								<input type="radio" name="E02CNOCPF" value="D" <%if (refCodes.getE02CNOCPF().equals("D")) out.print("checked");%>>
								Definitivo 
								<input type="radio" name="E02CNOCPF" value="N" <%if (refCodes.getE02CNOCPF().equals("N")) out.print("checked");%>>
								Desbloqueo
							</td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="16%" height="19" align="right">Bloquear Transacciones :</td>
							<td nowrap height="19" align="left">
							<input type="radio" name="E02CNOF01" value="D" <%if (refCodes.getE02CNOF01().equals("D")) out.print("checked");%>>
								Débito 
								<input type="radio" name="E02CNOF01" value="C" <%if (refCodes.getE02CNOF01().equals("C")) out.print("checked");%>>
								Crédito 
								<input type="radio" name="E02CNOF01" value="B" <%if (refCodes.getE02CNOF01().equals("B")) out.print("checked");%>>
								Ambos 
								<input type="radio" name="E02CNOF01" value="N" <%if (refCodes.getE02CNOF01().equals("N")) out.print("checked");%>>
								No Aplica
							</td>
							<td nowrap width="16%" align="right">Retener Fondos :</td>
							<td nowrap width="34%" align="left">
								<input type="radio" name="E02CNODCB" value="Y" <%if (refCodes.getE02CNODCB().equals("Y")) out.print("checked");%>>
								Si 
								<input type="radio" name="E02CNODCB" value="N" <%if (!refCodes.getE02CNODCB().equals("Y")) out.print("checked");%>>
								No
							</td>
						</tr>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="16%" height="19" align="right">Parar Generación días de Mora :</td>
							<td nowrap height="19" align="left">
								<input type="radio" name="E02CNOTCF" value="Y" <%if (refCodes.getE02CNOTCF().equals("Y")) out.print("checked");%>>
								Si 
								<input type="radio" name="E02CNOTCF" value="N" <%if (!refCodes.getE02CNOTCF().equals("Y")) out.print("checked");%>>
								No
							</td>
							<td nowrap width="16%" align="right"></td>
							<td nowrap width="34%" align="left"></td>
						</tr>
						<%
							}
						%>
						<%
							if (refCodes.getE02CNOCFL().trim().equals("C8")) {
								nroVar = 31;
						%>
						<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="16%" height="19" align="right">Obligatorio
								:</td>
							<td nowrap height="19" align="left">
							<input type="radio" name="E02CNOPAF" value="Y" <%if (refCodes.getE02CNOPAF().equals("Y")) out.print("checked");%>>
								Si 
							<input type="radio" name="E02CNOPAF" value="N" <%if (!refCodes.getE02CNOPAF().equals("Y")) 	out.print("checked");%>>
								No
							</td>
							<td nowrap width="16%" align="right">Tipo de Cliente :</td>
							<td nowrap width="34%" align="left">
								<input type="radio" name="E02CNOF01" value="1" <%if (refCodes.getE02CNOF01().equals("1")) out.print("checked");%>>
								JURIDICO 
								<input type="radio" name="E02CNOF01" value="2" <%if (refCodes.getE02CNOF01().equals("2")) out.print("checked");%>>
								PERSONA 
								<input type="radio" name="E02CNOF01" value="B" <%if (refCodes.getE02CNOF01().equals("B")) out.print("checked");%>>
								TODOS
							</td>
						</tr>
						<%
							}
						%>
					</table>
				</td>
			</tr>
		</table>

		<table width="100%">
			<tr>
				<td width="50%" align="center">
					<% if (!userPO.getPurpose().equals("INQUIRY")) { %> 
					<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(600);">
					<% } %>
				</td>
				<td width="50%" align="center">
					<input id="EIBSBTN" type=button name="Exit" value="Salir" onClick="goAction(400);">
				</td>
			</tr>
		</table>

		<H4>
			Información a Solicitar:<br> * Deje Etiqueta en Blanco para no solicitar un campo.<br> 
			* Signo + en Etiqueta significa continuación de la campo anterior (Solo Alfanuméricos).<br>
		</H4>

		<TABLE class="tableinfo" id="dataTable">

			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td NOWRAP align="center" width="10%"><b>SECUENCIA</b></td>
				<td NOWRAP align="center" width="40%"><b>ETIQUETA</b></td>
				<td NOWRAP align="center" width="20%"><b>TIPO</b></td>
				<td NOWRAP align="center" width="10%"><b>LONGITUD</b></td>
				<td NOWRAP align="center" width="10%"><b>DECIMALES</b></td>
				<td NOWRAP align="center" width="10%"><b>TABLA<BR>VALIDAR
				</b></td>
			</TR>

			<%
				String[] lbl = {refCodes.getE02CNALB1(), refCodes.getE02CNALB2(),
						refCodes.getE02CNALB3(), refCodes.getE02CNALB4(),
						refCodes.getE02CNALB5(), refCodes.getE02CNALB6(),
						refCodes.getE02CNALB7(), refCodes.getE02CNALB8(),
						refCodes.getE02CNALB9(), refCodes.getE02CNALB10(),
						refCodes.getE02CNALB11(), refCodes.getE02CNALB12(),
						refCodes.getE02CNALB13(), refCodes.getE02CNALB14(),
						refCodes.getE02CNALB15(), refCodes.getE02CNALB16(),
						refCodes.getE02CNALB17(), refCodes.getE02CNALB18(),
						refCodes.getE02CNALB19(), refCodes.getE02CNALB20(),
						refCodes.getE02CNALB21(), refCodes.getE02CNALB22(),
						refCodes.getE02CNALB23(), refCodes.getE02CNALB24(),
						refCodes.getE02CNALB25(), refCodes.getE02CNALB26(),
						refCodes.getE02CNALB27(), refCodes.getE02CNALB28(),
						refCodes.getE02CNALB29(), refCodes.getE02CNALB30()};
				String[] typ = {refCodes.getE02CNAPT1(), refCodes.getE02CNAPT2(),
						refCodes.getE02CNAPT3(), refCodes.getE02CNAPT4(),
						refCodes.getE02CNAPT5(), refCodes.getE02CNAPT6(),
						refCodes.getE02CNAPT7(), refCodes.getE02CNAPT8(),
						refCodes.getE02CNAPT9(), refCodes.getE02CNAPT10(),
						refCodes.getE02CNAPT11(), refCodes.getE02CNAPT12(),
						refCodes.getE02CNAPT13(), refCodes.getE02CNAPT14(),
						refCodes.getE02CNAPT15(), refCodes.getE02CNAPT16(),
						refCodes.getE02CNAPT17(), refCodes.getE02CNAPT18(),
						refCodes.getE02CNAPT19(), refCodes.getE02CNAPT20(),
						refCodes.getE02CNAPT21(), refCodes.getE02CNAPT22(),
						refCodes.getE02CNAPT23(), refCodes.getE02CNAPT24(),
						refCodes.getE02CNAPT25(), refCodes.getE02CNAPT26(),
						refCodes.getE02CNAPT27(), refCodes.getE02CNAPT28(),
						refCodes.getE02CNAPT29(), refCodes.getE02CNAPT30()};
				String[] lng = {refCodes.getE02CNALN1(), refCodes.getE02CNALN2(),
						refCodes.getE02CNALN3(), refCodes.getE02CNALN4(),
						refCodes.getE02CNALN5(), refCodes.getE02CNALN6(),
						refCodes.getE02CNALN7(), refCodes.getE02CNALN8(),
						refCodes.getE02CNALN9(), refCodes.getE02CNALN10(),
						refCodes.getE02CNALN11(), refCodes.getE02CNALN12(),
						refCodes.getE02CNALN13(), refCodes.getE02CNALN14(),
						refCodes.getE02CNALN15(), refCodes.getE02CNALN16(),
						refCodes.getE02CNALN17(), refCodes.getE02CNALN18(),
						refCodes.getE02CNALN19(), refCodes.getE02CNALN20(),
						refCodes.getE02CNALN21(), refCodes.getE02CNALN22(),
						refCodes.getE02CNALN23(), refCodes.getE02CNALN24(),
						refCodes.getE02CNALN25(), refCodes.getE02CNALN26(),
						refCodes.getE02CNALN27(), refCodes.getE02CNALN28(),
						refCodes.getE02CNALN29(), refCodes.getE02CNALN30()};
				String[] dec = {refCodes.getE02CNADE1(), refCodes.getE02CNADE2(),
						refCodes.getE02CNADE3(), refCodes.getE02CNADE4(),
						refCodes.getE02CNADE5(), refCodes.getE02CNADE6(),
						refCodes.getE02CNADE7(), refCodes.getE02CNADE8(),
						refCodes.getE02CNADE9(), refCodes.getE02CNADE10(),
						refCodes.getE02CNADE1(), refCodes.getE02CNADE2(),
						refCodes.getE02CNADE13(), refCodes.getE02CNADE14(),
						refCodes.getE02CNADE15(), refCodes.getE02CNADE6(),
						refCodes.getE02CNADE7(), refCodes.getE02CNADE18(),
						refCodes.getE02CNADE19(), refCodes.getE02CNADE20(),
						refCodes.getE02CNADE1(), refCodes.getE02CNADE2(),
						refCodes.getE02CNADE23(), refCodes.getE02CNADE24(),
						refCodes.getE02CNADE25(), refCodes.getE02CNADE6(),
						refCodes.getE02CNADE7(), refCodes.getE02CNADE28(),
						refCodes.getE02CNADE29(), refCodes.getE02CNADE30()};
				String[] tbl = {refCodes.getE02CNATB1(), refCodes.getE02CNATB2(),
						refCodes.getE02CNATB3(), refCodes.getE02CNATB4(),
						refCodes.getE02CNATB5(), refCodes.getE02CNATB6(),
						refCodes.getE02CNATB7(), refCodes.getE02CNATB8(),
						refCodes.getE02CNATB9(), refCodes.getE02CNATB10(),
						refCodes.getE02CNATB11(), refCodes.getE02CNATB12(),
						refCodes.getE02CNATB13(), refCodes.getE02CNATB14(),
						refCodes.getE02CNATB15(), refCodes.getE02CNATB16(),
						refCodes.getE02CNATB17(), refCodes.getE02CNATB18(),
						refCodes.getE02CNATB19(), refCodes.getE02CNATB20(),
						refCodes.getE02CNATB21(), refCodes.getE02CNATB22(),
						refCodes.getE02CNATB23(), refCodes.getE02CNATB24(),
						refCodes.getE02CNATB25(), refCodes.getE02CNATB26(),
						refCodes.getE02CNATB27(), refCodes.getE02CNATB28(),
						refCodes.getE02CNATB29(), refCodes.getE02CNATB30()};
				int x = 0;
				int y = 1;
				while (y < nroVar) {
					String v = String.valueOf(y).trim();
			%>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td NOWRAP align="center" width="10%" valign="top"><%=v%></td>
				<td NOWRAP align="center" width="40%" valign="top">
					<input type="text" id="E02CNALB<%=v%>" name="E02CNALB<%=v%>" maxlength="50" size="55" value="<%=lbl[x]%>" class="txtleft">
				</td>
				<TD nowrap align="center" width="20%" valign="top">
					<SELECT name="E02CNAPT<%=v%>" onchange="updateTB(this.value, '<%=v%>')">
						<option value=" " <%if (!(typ[x].equals("A") || typ[x].equals("N") || typ[x].equals("F") || typ[x].equals("B") ||  
												  typ[x].equals("S")  || typ[x].equals("C")  || typ[x].equals("T"))) out.print("selected");%>></option>
						<OPTION value="A" <%if (typ[x].trim().equals("A")) out.print("selected");%>>Alfanumérico - Max 35</OPTION>
						<OPTION value="N" <%if (typ[x].trim().equals("N")) out.print("selected");%>>Numérico - Max 20</OPTION>
						<OPTION value="F" <%if (typ[x].trim().equals("F")) out.print("selected");%>>Fecha - 8</OPTION>
						<OPTION value="S" <%if (typ[x].trim().equals("S")) out.print("selected");%>>SI / NO</OPTION>
						<OPTION value="C" <%if (typ[x].trim().equals("C")) out.print("selected");%>>Cliente / Prospecto / Entidad</OPTION>
						<OPTION value="B" <%if (typ[x].trim().equals("B")) out.print("selected");%>>Agencia</OPTION>
						<OPTION value="T" <%if (typ[x].trim().equals("T")) out.print("selected");%>>Tabla (Códigos Referencia)</OPTION>
					</SELECT></TD>
				<td NOWRAP align="center" width="10%" valign="top">
					<input type="text" id="E02CNALN<%=v%>" name="E02CNALN<%=v%>" maxlength="2" size="3" value="<%=lng[x]%>" class="txtright" onKeypress="enterInteger(event)">
				</td>
				<td NOWRAP align="center" width="10%" valign="top">
					<input type="text" id="E02CNADE<%=v%>" name="E02CNADE<%=v%>" maxlength="1" size="2" value="<%=dec[x]%>" class="txtright" onKeypress="enterInteger(event)">
				</td>
				<td NOWRAP align="center" width="10%" valign="top">
					<input type="text" id="E02CNATB<%=v%>" name="E02CNATB<%=v%>" maxlength="2" size="3" value="<%=tbl[x]%>" class="txtright"> 
					<a href="javascript:GetCNOFTables('E02CNATB<%=v%>','')"><%=help%></a>
				</td>
			</TR>
			<%
				x++;
				y++;
				}
			%>
		</TABLE>

	</form>

	<SCRIPT>
		
	</script>

</body>
</html>
