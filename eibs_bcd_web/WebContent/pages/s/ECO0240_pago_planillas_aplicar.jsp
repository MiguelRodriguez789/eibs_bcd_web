<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO020001Message,datapro.eibs.beans.ECO020002Message"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.Entities"%> 

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Listado de Convenios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
 
<jsp:useBean id="apply" class="datapro.eibs.beans.ECO024004Message" scope="session" />
<jsp:useBean id="HClient" class="datapro.eibs.beans.ECO024001Message" scope="session" />
<jsp:useBean id="ECO024002ListFilter" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">
	function validar(){
		return true;
	}
	function goBack(){  
		document.forms[0].SCREEN.value=200; 
		document.forms[0].submit();
	} 	
</script>

</head>

<body onload="tableresize();">
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">Pago de Planilla<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pago_planillas_aplicar.jsp,ECO240"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0240" onsubmit="return validar();">
	<input type="hidden" name="SCREEN" value="500">
	<input type="hidden" name="E01SELECU" value="<%=HClient.getE01PLHECU()%>">
	
	<table class="tableinfo" align="center" width="100%">
		<tr>
			<td nowrap valign="top" width="100%">
				<table width="100%">
					<tr id="trdark">
						<th align="right"  nowrap  width="10%">Cliente Empresa :</th>
						<th align="left"   nowrap width="15%"><%=HClient.getE01PLHECU()%></th>
						<th align="right"  nowrap width="10%">Identificacion :</th>
						<th align="left"   nowrap width="15%"><%=HClient.getE01PLHEID()%></th>
						<th align="right"  nowrap width="10%">Nombre Empresa :</th>
						<th align="left"   nowrap  width="40%"><%=HClient.getE01PLHENM() %></th>				
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
						<td align="center" width="13%">Nro. Planillas</td>
						<td align="center" width="9%">Moneda</td>	
						<td align="center" width="13%">Total Planilla</td>				
						<td align="center" width="13%">Monto Recibido</td>				
						<td align="center" width="13%">Recibido Aplicado</td>				
						<td align="center" width="13%">Recibido Rechazado</td>				
						<td align="center" width="13%">Pagado de Menos</td>						
						<td align="center" width="13%">Monto Impago</td>				
					</tr>
					<tr id="trdark">		
						<td align="center" nowrap  >
							<%=ECO024002ListFilter.size()%>
						</td>	
						<td align="center" nowrap  >				
							<eibsinput:text name="apply" property="E04PLHRCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>	
						</td>							
						<td align="center" nowrap  >				
							<eibsinput:text name="apply" property="E04PLHPAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				
						</td>
						<td align="center" nowrap  >
							<eibsinput:text name="apply" property="E04PLHPPG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>					
						</td>
						<td align="center" nowrap  >
							<eibsinput:text name="apply" property="E04PLHPAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>									
						</td>
						<td align="center" nowrap  >
							<eibsinput:text name="apply" property="E04PLHPRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>										
						</td>
						<td align="center" nowrap  >
							<eibsinput:text name="apply" property="E04PLHPPN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td align="center" nowrap  >
							<eibsinput:text name="apply" property="E04PLHNRP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
					</tr>			
				</table>
			</td>
		</tr>
	</table>

	<h4>Informacion Del Pago</h4>
	<table class="tableinfo">
		<tr > 
			<td> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="trdark">
						<td width="40%"><div align="right">Fecha Valor :</div></td>
						<td width="60%"> 
							<eibsinput:date name="apply" fn_year="E04PLPVDY" fn_month="E04PLPVDM" fn_day="E04PLPVDD" />
						</td>
					</tr>
					<tr id="trclear">
						<td width="40%"><div align="right">Banco/Sucursal :</div></td>
						<td width="60%"> 
							<eibsinput:text name="apply" property="E04PLPBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" required="false" />
							<eibsinput:help name="apply" property="E04PLPBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" fn_param_one="E04PLPBRN" fn_param_two="document.forms[0].E04PLPBNK.value" required="false" />
						</td>
					</tr>
					<tr id="trdark">
						<td width="40%"><div align="right">Descripci&oacute;n :</div></td>
						<td width="60%"> 
							<eibsinput:text name="apply" property="E04PLPNAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>" />
						</td>
					</tr>
				</table>
				<h4>Origen de Fondos</h4>
				<TABLE id="mainTable" class="tableinfo">
					<TR>
	 					<TD>
							<table id="headTable" >
								<tr id="trdark"> 
									<td nowrap align="center" > Concepto</td>
									<td nowrap align="center" >Banco </td>
									<td nowrap align="center" >Sucursal</td>
									<td nowrap align="center" >Moneda</td>
									<td nowrap align="center" >Referencia</td>
									<td nowrap align="center" >Monto</td>
								</tr>
							</table> 
							<div id="dataDiv" style="height:60; overflow-y :scroll; z-index:0" >
		 						<table id="dataTable" >
								<%
									int amount = 9;
									String name;
									for ( int i=1; i<=amount; i++ ) {
										name = i + "";
								%> 
									<tr id="trclear"> 
										<td nowrap > 
											<div align="center" > 
												<%= name %>
												<input type="text" name="E04OFFOP<%= name %>" id="E04OFFOP<%= name %>" value="<%= apply.getField("E04OFFOP"+name).getString().trim()%>" size="3" maxlength="3">
												<input type="hidden" name="E04OFFGL<%= name %>" value="<%= apply.getField("E04OFFGL"+name).getString().trim()%>">
												<input type="text" name="E04OFFCO<%= name %>" size="45" maxlength="45" readonly value="<%= apply.getField("E04OFFCO"+name).getString().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E04PLPBNK.value,' ','E04OFFGL<%= name %>','E04OFFOP<%= name %>','10', 'PL')">
											</div>
										</td>
										<td nowrap > 
											<div align="center"> 
												<input type="text" name="E04OFFBK<%= name %>" size="2" maxlength="2" value="<%= apply.getField("E04OFFBK"+name).getString().trim()%>">
											</div>
										</td>
										<td nowrap > 
											<div align="center"> 
												<input type="text" name="E04OFFBR<%= name %>" size="4" maxlength="4" value="<%= apply.getField("E04OFFBR"+name).getString().trim()%>"
												class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E04PLPBNK.value,'','','','')">
											</div>
										</td>
										<td nowrap > 
											<div align="center"> 
												<input type="text" name="E04OFFCY<%= name %>" size="3" maxlength="3" value="<%= apply.getField("E04OFFCY"+name).getString().trim()%>"
												class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E04PLPBNK.value,'','','','')">
											</div>
										</td>
										<td nowrap > 
											<div align="center"> 
												<input type="text" name="E04OFFAC<%= name %>" id="E04OFFAC<%= name %>" size="12" maxlength="12"  value="<%= apply.getField("E04OFFAC"+name).getString().trim()%>"
												class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E04PLPBNK.value,'','','','RT')">
											</div>
										</td>
										<td nowrap> 
											<div align="center"> 
												<input type="text" name="E04OFFAM<%= name %>" size="23" maxlength="15"  value="<%= apply.getField("E04OFFAM"+name).getString().trim()%>" class="txtright"  onKeypress="enterDecimal(event, 2)">
											</div>
										</td>
									</tr>
								<%
									}
								%> 
								</table>
							</div>
							<table id="footTable" > 
								<tr id="trdark"> 
									<td nowrap  align="right"><b>Total Equivalente :</b></td>
									<td nowrap align="center"><b><i><strong> 
										<input type="text" name="E04OFFEQV" size="23" maxlength="17" readonly value="<%= apply.getE04OFFEQV().trim()%>" class="txtright" ></strong></i></b>
									</td>
								</tr>
							</table>
						</TD>  
					</TR>	
				</TABLE>  
			</td>
		</tr>
	</table>
 
	<table align="center" id="TBHELPN">
		<tr>
			<td>
				<div id="DIVSUBMIT" align="center">
					<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
					<!--	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="EIBSBTN" type="button" name="Regresar" value="Regresar" onclick="goBack();">
					-->
				</div>
			</td>
		</tr>
	</table>
	
</form>

<script type="text/javascript">
	function tableresize() {
		adjustEquTables( getElement('headTable'), getElement('dataTable'), getElement('dataDiv'),0,true);
	}
	//tableresize();
	window.onresize=tableresize;
</script>
	
</body>
</html>
