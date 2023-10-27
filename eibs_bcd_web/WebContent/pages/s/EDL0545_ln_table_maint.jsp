<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Cartera Sustitutiva</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL054501Message" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

<SCRIPT type="text/javascript">

function ShowMunicipio(TypeSel) {
	if (TypeSel == 'Y') {  
		divMunicipio.style.display = "";
	} else {
		divMunicipio.style.display = "none";
	}
}  

function ShowRecursos(TypeSel) {
	if (TypeSel == 'Y') {  
		divRecursos.style.display = "";
	} else {
		divRecursos.style.display = "none";
	}
}

function ShowPlan(TypeSel) {
	if (TypeSel == 'Y') {  
		divPlan.style.display = "";
	} else {
		divPlan.style.display = "none";
	}
}

</SCRIPT>

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

<h3 align="center">Parametros de Cartera Sustitutiva<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_table_maint.jsp, EDL0545"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0545" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
	<INPUT TYPE=HIDDEN NAME="H01FLGMAS" >
	
	<%int row = 0; %>
	<table class="tableinfo" >
		<tr> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="20%" align=right><b>Banco :&nbsp;</b></td>
						<td nowrap width="30%">                
							<eibsinput:text name="lnParam" property="E01CSTBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
						</td>
						<td nowrap width="20%" align=right><b>Codigo de Tabla :&nbsp;</b></td>
						<td nowrap width="30%">
							<eibsinput:text name="lnParam" property="E01CSTRCD"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>"  readonly="true" />
						</td>
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
						<td nowrap width="20%"><div align="right">Descripci&oacute;n :</div></td>
						<td nowrap width="30%"> 
							<eibsinput:text name="lnParam" property="E01CSTDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="true"/>
						</td>
						<td nowrap width="20%"></td>
						<td nowrap width="30%"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Informaci&oacute;n para Marcacion </h4>
	<table class="tableinfo" >
		<tr>
			<td>
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Valor del Cupo :</div></td>
						<td width="25%">
							<eibsinput:text name="lnParam" property="E01CSTGLB" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" /> &nbsp;(COP)
						</td>
						<td width="25%"><div align="right">Saldo :</div></td>
						<td width="25%">
							<eibsinput:text name="lnParam" property="E01CSTFIN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" /> &nbsp;(COP)
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Monto Maximo Desembolsado :</div></td>
						<td width="25%">
							<input type="text" name="E01CSTMAX" size="17" maxlength="15" value="<%= lnParam.getE01CSTMAX() %>" onKeypress="enterDecimal(event, 2)">&nbsp;(SMMLV) 
						</td>
						<td width="25%"><div align="right">Plazo Maximo :</div></td>
						<td width="25%">
							<input type="text" name="E01CSTPLZ" size="6" maxlength="5" value="<%= lnParam.getE01CSTPLZ() %>">&nbsp;(Dias)
						</td>
					</tr>
					 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Municipios :</div></td>
						<td width="25%">
							<input type="radio" name="E01CSTMUN" value="Y" onClick="ShowMunicipio('Y')" <%if (lnParam.getE01CSTMUN().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01CSTMUN" value="N" onClick="ShowMunicipio('N')" <%if (lnParam.getE01CSTMUN().equals("N")) out.print("checked"); %>> No
						</td>
						<td width="25%"><div align="right">Fuentes de Recursos :</div></td>
						<td width="25%">
							<input type="radio" name="E01CSTREC" value="Y" onClick="ShowRecursos('Y')" <%if (lnParam.getE01CSTREC().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01CSTREC" value="N" onClick="ShowRecursos('N')" <%if (lnParam.getE01CSTREC().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Plan Inversion :</div></td>
						<td width="25%" >
							<table cellspacing="0" cellpadding="2" border="0">
								<tr id="<%= (row-1 % 2 == 1) ? "trdark" : "trclear" %>">
									<td>
										<input type="radio" name="E01CSTFL2" value="Y" onClick="ShowPlan('Y')" <%if (lnParam.getE01CSTFL2().equals("Y")) out.print("checked"); %>> Si 
										<input type="radio" name="E01CSTFL2" value="N" onClick="ShowPlan('N')" <%if (lnParam.getE01CSTFL2().equals("N")) out.print("checked"); %>> No
									</td>
									<td align="left">
										<div id="divPlan" style="display: <%= lnParam.getE01CSTFL2().equals("Y") ? "" : "none"%>">
											&nbsp;&nbsp;<eibsinput:cnofc name="lnParam" flag="DF" property="E01CSTUC2" fn_code="E01CSTUC2" fn_description="" />
										</div>
									</td>
								</tr>
							</table>
						</td>
						<td width="25%"><div align="right">Creditos Reestructurados :</div></td>
						<td width="25%">
							<input type="radio" name="E01CSTFL1" value="Y" <%if (lnParam.getE01CSTFL1().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01CSTFL1" value="N" <%if (lnParam.getE01CSTFL1().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Microcredito :</div></td>
						<td width="25%">
							<input type="radio" name="E01CSTMD1" value="Y" <%if (lnParam.getE01CSTMD1().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01CSTMD1" value="N" <%if (lnParam.getE01CSTMD1().equals("N")) out.print("checked"); %>> No
						</td>
						<td width="25%"><div align="right">Vivienda :</div></td>
						<td width="25%">
							<input type="radio" name="E01CSTMD2" value="Y" <%if (lnParam.getE01CSTMD2().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01CSTMD2" value="N" <%if (lnParam.getE01CSTMD2().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Consumo :</div></td>
						<td width="25%">
							<input type="radio" name="E01CSTMD3" value="Y" <%if (lnParam.getE01CSTMD3().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01CSTMD3" value="N" <%if (lnParam.getE01CSTMD3().equals("N")) out.print("checked"); %>> No
						</td>
						<td width="25%"><div align="right">Comercial :</div></td>
						<td width="25%">
							<input type="radio" name="E01CSTMD4" value="Y" <%if (lnParam.getE01CSTMD4().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" name="E01CSTMD4" value="N" <%if (lnParam.getE01CSTMD4().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Linea Finagro :</div></td>
						<td width="25%">
							 <input type="text" name="E01CSTUC1" size="5" maxlength="4" value="<%= lnParam.getE01CSTUC1() %>">
						</td>
						<td width="25%"><div align="right"></div></td>
						<td width="25%">
						 
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<!-- Municipios -->
	<div id="divMunicipio" style="display: <%= lnParam.getE01CSTMUN().equals("Y") ? "" : "none"%>">
		<% session.setAttribute("ATRMU","S"); %>
		<iframe id="ifrMU" frameborder="0" scrolling="no" height="180" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0545?SCREEN=1101&ACT=N&E02CSTREG=MU&E02CSTTYP=<%=lnParam.getE01CSTRCD().trim()%>"></iframe>
	</div>
	
	<!-- Fuente de Recursos -->
	<div id="divRecursos" style="display: <%= lnParam.getE01CSTREC().equals("Y") ? "" : "none"%>">
		<% session.setAttribute("ATRRE","S"); %>
	 <iframe id="ifrRE" frameborder="0" scrolling="no" height="180" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0545?SCREEN=1101&ACT=N&E02CSTREG=RE&E02CSTTYP=<%=lnParam.getE01CSTRCD().trim()%>"></iframe>
	</div>

<!-- 
	<h4>Municipios</h4>
	<table  id="mainTable" class="tableinfo" style="height: 90px;">
		<tr height="5%"> 
			<TD NOWRAP width="100%" >
					<TABLE id="headTable" width="100%" >
								<TR id="trdark"> 
									<th nowrap  width="15%"></th>
									<th nowrap  width="10%">Codigo</th>
									<th nowrap  width="30%">Descripcion</th>
												<th nowrap  width="15%"></th>
								</TR>
						 </TABLE>
					</td>
			</tr>    
		<tr height="95%">    
			<td NOWRAP width="100%">       
						 <div id="dataDiv1" class="scbarcolor" style="height:90px;  overflow:auto;">
						<table id="dataTable" width="100%" > 
					<%
						 int limite = 9;
						String seq;            
						for ( int i=1; i<=limite; i++ ) {
							seq = i + "";
				 %> 
					<tr id="trclear"> 
						<td nowrap width="15%"> </td>
						<td nowrap width="10%"> 
							<div align="center" > 
							<%= seq %>
						<input type=text name="E01CSTMUN<%= seq %>" value="<%= lnParam.getField("E01CSTMUN"+seq).getString() %>" size="5" maxlength="4">
						
						 <a href="javascript:Get2FilterCodes('E01CSTMUN<%= seq %>','D01CSTMUN<%= seq %>','84', '','')" >
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
							</div>
						</td>
										
						<td nowrap width="30%"> 
							<div align="center"> 
								<input type="text" name="D01CSTMUN<%= seq %>" value="<%= lnParam.getField("D01CSTMUN"+seq).getString()%>" size="45" maxlength="45" readonly>
							</div>
						</td>
										
						 <td nowrap width="15%"> </td>
					</tr>
				 <% } %> 
				</table>
			</div>
		</TD>
	</TR>  
	</TABLE>
-->

<!--  
	<h4>Fuentes de Recursos</h4>
	<table  id="mainTable" class="tableinfo" style="height: 90px;">
			<tr height="5%"> 
				<TD NOWRAP width="100%" >
					<TABLE id="headTable" width="100%" >
								<TR id="trdark"> 
									<th nowrap  width="15%"></th>
									<th nowrap  width="10%">Codigo</th>
									<th nowrap  width="30%">Descripcion</th>
									<th nowrap  width="15%"></th>
								</TR>
						 </TABLE>
					</td>
			</tr>    
		<tr height="95%">    
			<td NOWRAP width="100%">       
	
						 <div id="dataDiv1" class="scbarcolor" style="height:90px;  overflow:auto;">
						<table id="dataTable" width="100%" > 
					<%
						 int limit = 9;
						String seq1;            
						for ( int i=1; i<=limit; i++ ) {
							seq1 = i + "";
				 %> 
					<tr id="trclear"> 
						<td nowrap width="15%"> </td>
						<td nowrap width="10%"> 
							<div align="center" > 
							<%= seq1 %>
						<input type=text name="E01CSTREC<%= seq1 %>" value="<%= lnParam.getField("E01CSTREC"+seq1).getString() %>" size="5" maxlength="4">
						 <a href="javascript:GetCodeDescCNOFC('E01CSTREC<%= seq1 %>','D01CSTREC<%= seq1 %>','RS')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
							</div>
						</td>
									 
						<td nowrap width="30%"> 
							<div align="center"> 
								<input type="text" name="D01CSTREC<%= seq1 %>" value="<%= lnParam.getField("D01CSTREC"+seq1).getString()%>" size="45" maxlength="45" readonly>
							</div>
						</td>
					 
					
						 <td nowrap width="15%"> </td>
					</tr>
				 <% } %> 
				</table>
			</div>
		</TD>
	</TR>  
	</TABLE>
 -->
 
	<h4>Informaci&oacute;n para Desmarcacion </h4>
	<table class="tableinfo" >
		<tr>
			<td>
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Edad de Mora :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01CSTMOR"  size="6" maxlength="5" value="<%=lnParam.getE01CSTMOR()%>" >&nbsp;(Dias) 
				</td>
				<td width="25%">
					<div align="right">Prestamos reciban Pagos Extras :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01CSTFL4" value="Y" <%if (lnParam.getE01CSTFL4().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01CSTFL4" value="N" <%if (lnParam.getE01CSTFL4().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Realiza Reversion de Pagos :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01CSTFL5" value="Y" <%if (lnParam.getE01CSTFL5().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01CSTFL5" value="N" <%if (lnParam.getE01CSTFL5().equals("N")) out.print("checked"); %>> No
				</td>
				<td width="25%">
					<div align="right">Realiza Cambio de Tasa :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01CSTFL6"  value="Y"  <%if (lnParam.getE01CSTFL6().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01CSTFL6"  value="N"  <%if (lnParam.getE01CSTFL6().equals("N")) out.print("checked"); %>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Modifico el Plazo :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01CSTFL7" value="Y" <%if (lnParam.getE01CSTFL7().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01CSTFL7" value="N" <%if (lnParam.getE01CSTFL7().equals("N")) out.print("checked"); %>> No
				</td>
				<td width="25%">
					<div align="right">Cambio de Fecha de Pago :</div>
				</td>
				<td width="25%">
					<input type="radio" name="E01CSTFL8" value="Y" <%if (lnParam.getE01CSTFL8().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01CSTFL8" value="N" <%if (lnParam.getE01CSTFL8().equals("N")) out.print("checked"); %>> No
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
