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
 
<jsp:useBean id="cnvList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="apply" class="datapro.eibs.beans.ECO020004Message" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">
	function validar(){
		return true;
	}
	function cerrarVentana(){  	
		window.open('','_parent','');
		window.close(); 
	}
</script>

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

<h3 align="center">Pago de Planilla<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="covenant_pay_apply.jsp, ECO0200"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0200" onsubmit="return validar();">
	<input type="hidden" name="SCREEN" value="500">
	<br>
	<table id="mainTable" class="tableinfo" align="center">
		<tr>
			<td nowrap valign="top" width="100%">
				<table width="100%">
					<tr id="trdark">
						<td align="right" nowrap width="10%">Codigo Convenio :</td>				
						<td align="left" nowrap width="15%"><%=apply.getE04PLHCDE() %><input type="hidden" name="E04PLHCDE" value="<%=apply.getE04PLHCDE() %>"></td>
						<td align="right" nowrap width="10%">Nro Planilla :</td>
						<td align="left" nowrap width="15%"><%=apply.getE04PLHNUM() %><input type="hidden" name="E04PLHNUM" value="<%=apply.getE04PLHNUM() %>"></td>
						<td align="right" nowrap width="10%">Fecha Emisión :</td>
						<td align="left" nowrap width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),apply.getBigDecimalE04PLHFED().intValue(),apply.getBigDecimalE04PLHFEM().intValue(),apply.getBigDecimalE04PLHFEY().intValue())%></td>
						<td align="right" nowrap width="10%">Estado :</td>
						<td align="left" nowrap width="15%"><%=apply.getE04DSCSTA() %></td>
					</tr>
					<tr id="trclear">
						<td align="right"  nowrap  width="10%">Empleador :</td>
						<td align="left" nowrap width="15%"><%=apply.getE04PLHENM()%></td>
						<td align="right" nowrap width="10%">Identificacion :</td>
						<td align="left" nowrap width="15%"><%=apply.getE04PLHEID()%></td>
						<td align="right" nowrap width="10%">Vencimiento : </td>
						<td align="left" nowrap  width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),apply.getBigDecimalE04PLHFVD().intValue(),apply.getBigDecimalE04PLHFVM().intValue(),apply.getBigDecimalE04PLHFVY().intValue())%></td>
						<td align="right" nowrap width="10%">Oficina Pago :</td>
						<td align="left" nowrap width="15%"><%=apply.getE04PLHBRN()%></td>
					</tr>
					<tr id="trdark">
						<td align="right"  nowrap  width="10%">Cliente Convenio :</td>
						<td align="left" nowrap width="15%"><%=apply.getE04PLHCNM()%></td>
						<td align="right" nowrap width="10%">Identificacion :</td>
						<td align="left" nowrap width="15%"><%=apply.getE04PLHCID()%></td>
						<td align="right" nowrap width="10%">Moneda :</td>
						<td align="left" nowrap  width="15%"><%=apply.getE04PLHRCY() %><input type="hidden" name="E04PLHRCY" value="<%=apply.getE04PLHRCY() %>"></td>
						<td align="right" nowrap width="10%">Total Planilla :</td>
						<td align="left" nowrap  width="15%"><%=apply.getE04PLHPAM() %></td>
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
						<td align="center" nowrap  width="14%"><%=apply.getE04PLHPPG() %></td>
						<td align="center" nowrap  width="14%"><%=apply.getE04PLHPAP() %></td>
						<td align="center" nowrap  width="14%"><%=apply.getE04PLHPRE() %></td>
						<td align="center" nowrap  width="14%"><%=apply.getE04PLHPPN() %></td>
						<td align="center" nowrap  width="14%"><%=apply.getE04PLHNRP() %></td>
						<td align="center" nowrap  width="14%"><%=apply.getE04PLHAAM() %></td>
						<td align="center" nowrap  width="14%"><%=apply.getE04PLHRAM() %></td>
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
												<input type="text" name="E04OFFCO<%= name %>" size="45" maxlength="40" readonly value="<%= apply.getField("E04OFFCO"+name).getString().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E04PLPBNK.value,document.forms[0].E04OFFCY<%= name %>.value,'E04OFFGL<%= name %>','E04OFFOP<%= name %>','10', 'PL')">
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
												<input type="text" name="E04OFFAM<%= name %>" size="23" maxlength="15"  value="<%= apply.getField("E04OFFAM"+name).getString().trim()%>" class="txtright" onKeypress="enterDecimal(event, 2)">
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
				</div>
			</td>
		</tr>
	</table>
	
</form>

<% if ("OK".equals((String)request.getAttribute("upp"))) { %>	
<script type="text/javascript">
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0200?SCREEN=100';	   	   
	cerrarVentana();	  
</script>
<% } %>  

<script type="text/javascript">
	function tableresize() {
		adjustEquTables( getElement('headTable'), getElement('dataTable'), getElement('dataDiv'),0,true);
	}
	tableresize();
	window.onresize=tableresize;
</script>

</body>
</html>
