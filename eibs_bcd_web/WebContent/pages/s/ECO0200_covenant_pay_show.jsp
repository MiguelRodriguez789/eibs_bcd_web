<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO020001Message,datapro.eibs.beans.ECO020002Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Listado de Convenios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id="cnvList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="header" class="datapro.eibs.beans.ECO020001Message" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">
	function showDetail(PLHNUM,PLHRCY,PLHCDE) {
		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSECO0200?SCREEN=400&PLHNUM=" + PLHNUM + "&PLHRCY=" + PLHRCY + "&PLHCDE=" + PLHCDE;
		CenterWindow(page,800,600,2);
	}
	function validar(){
		entro = "no";
		for (j = 1; j <= <%=cnvList.size()%>; j++) {
			conv = "document.forms[0].C"+j+".value";
			monto = "document.forms[0].M"+j+".value";
			montoOrig = "document.forms[0].V"+j+".value";
			//if (parseFloat(eval(monto))!=parseFloat(eval(montoOrig))){
			if (eval(monto)!= eval(montoOrig)){
				if (eval(conv)==""){
					alert("Debe Seleccionar Una Novedad para continuar");
					conv1 = "document.forms[0].C"+j+".focus()";
					eval(conv1);
					return false;
				}else{
					entro="si";					
				}
			}
			if (eval(conv)!=""){
				if (eval(monto)==eval(montoOrig) || eval(monto)=="" ){
					alert("Debe colocar un monto Distinto al Valor Cobrado o eliminar la Novedad para continuar");
					monto1 = "document.forms[0].M"+j+".focus()";
					eval(monto1);
					return false;
				}else{
					entro="si";					
				}
			}
		}
<%--
	if (entro=="no"){
		alert("Debe Modificar al menos un Monto Recibido distinto del Valor cobrado para enviar el pago de la cuadratura!");
		return false;
	}
--%>				
		return true;
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

<h3 align="center">Cuadre y Pago de Planilla<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="covenant_pay_show.jsp, ECO0200"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0200" onsubmit="return validar();">
	<input type="hidden" name="SCREEN" value="300">
<%
	if (cnvList.getNoResult()) {
%>
	<TABLE class="tbenter" width=100% height=90%>
		<TR>
			<TD>
				<div align="center"><font size="3"><b> NO existe detalle para su planilla. </b></font></div>
			</TD>
		</TR>
	</TABLE>
<%
	} else {	
%>
	<br>
	<table id="mainTable" class="tableinfo" align="center">
		<tr>
			<td nowrap valign="top" width="100%">
				<table width="100%">
					<tr id="trdark">
						<td align="right" nowrap width="10%">Codigo Convenio :</td>				
						<td align="left" nowrap width="15%"><%=header.getE01PLHCDE() %><input type="hidden" name="PLDCDE" value="<%=header.getE01PLHCDE() %>"></td>
						<td align="right" nowrap width="10%">Nro Planilla :</td>
						<td align="left" nowrap width="15%"><%=header.getE01PLHNUM() %>
							<input type="hidden" name="PLDNUM" value="<%=header.getE01PLHNUM() %>">
							<input type="hidden" name="E01SELNUM" value="<%=header.getE01PLHNUM() %>">
						</td>
						<td align="right" nowrap width="10%">Fecha Emisión :</td>
						<td align="left" nowrap width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),header.getBigDecimalE01PLHFEM().intValue(),header.getBigDecimalE01PLHFED().intValue(),header.getBigDecimalE01PLHFEY().intValue())%></td>
						<td align="right" nowrap width="10%">Estado :</td>
						<td align="left" nowrap width="15%"><%=header.getE01DSCSTA() %></td>
					</tr>
					<tr id="trclear">
						<td align="right"  nowrap  width="10%">Empleador :</td>
						<td align="left" nowrap width="15%"><%=header.getE01PLHENM()%></td>
						<td align="right" nowrap width="10%">Identificacion :</td>
						<td align="left" nowrap width="15%"><%=header.getE01PLHEID()%></td>
						<td align="right" nowrap width="10%">Vencimiento : </td>
						<td align="left" nowrap  width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),header.getBigDecimalE01PLHFVM().intValue(),header.getBigDecimalE01PLHFVD().intValue(),header.getBigDecimalE01PLHFVY().intValue())%></td>
						<td align="right" nowrap width="10%">Oficina Pago :</td>
						<td align="left" nowrap width="15%"><%=header.getE01PLHPBR()%></td>
					</tr>
					<tr id="trdark">
						<td align="right"  nowrap  width="10%">Cliente Convenio :</td>
						<td align="left" nowrap width="15%"><%=header.getE01PLHCNM()%></td>
						<td align="right" nowrap width="10%">Identificacion :</td>
						<td align="left" nowrap width="15%"><%=header.getE01PLHCID()%></td>
						<td align="right" nowrap width="10%">Moneda :</td>
						<td align="left" nowrap  width="15%"><%=header.getE01PLHRCY() %>
							<input type="hidden" name="PLDRCY" value="<%=header.getE01PLHRCY() %>">
							<input type="hidden" name="E01SELRCY" value="<%=header.getE01PLHRCY() %>">
						</td>
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

	<br>			
	<table id="mainTable" class="tableinfo" align="center">
		<tr>
			<td nowrap valign="top" width="100%">
				<table id="headTable" width="100%">
					<tr id="trclear">			
						<th align="center" nowrap width="5%">Sec</th>
						<th align="center" nowrap width="10%">Cuenta</th>				
						<th align="center" nowrap width="30%">Nombre Cliente</th>
						<th align="center" nowrap width="10%">Identidad </th>
						<th align="center" nowrap width="5%">Producto</th>
						<th align="center" nowrap width="10%">Vencimiento</th>
						<th align="center" nowrap width="5%">Cuota</th>				
						<th align="center" nowrap width="5%">Valor Cobrado</th>				
						<th align="center" nowrap width="5%">Monto Recibido</th>				
						<th align="center" nowrap width="15%">Codigo Novedad</th>									
					</tr>
				</table>
				<div id="dataDiv1" class="scbarcolor">
					<table id="dataTable">
					<% 			
						cnvList.initRow();
						int cont =0;
						while (cnvList.getNextRow()) {
							cont++;
							ECO020002Message convObj = (ECO020002Message) cnvList.getRecord();
					%>
						<tr id="trdark">
							<td nowrap align="center"> <%=cont%></td>		<!--Sec-->			
							<td nowrap align="right"> <%=convObj.getE02PLDACC()%><input type="hidden" name="ACC<%=cont%>" value="<%=convObj.getE02PLDACC()%>"></td>		<!--Nro. cuenta-->
							<td nowrap align="left"> <%=convObj.getE02PLDNME()%></td>		<!--Nombre Empresa-->
							<td nowrap align="right"> <%=convObj.getE02PLDIDE()%></td>		<!--Rut. empresa-->
							<td nowrap align="center"> <%=convObj.getE02PLDPRD()%></td>		<!--Producto-->
							<td nowrap align="center"> <%=Util.formatCustomDate(currUser.getE01DTF(),convObj.getBigDecimalE02PLDFVM().intValue(),convObj.getBigDecimalE02PLDFVD().intValue(),convObj.getBigDecimalE02PLDFVY().intValue())%></td>	<!--Fecha Vencimiento-->
							<td nowrap align="center"> <%=convObj.getE02PLDPNU()%></td>		<!--Nro vencimi-->
							<td nowrap align="right"> <%=datapro.eibs.master.Util.formatCCY(convObj.getE02PLDMCO())%><input type="hidden" name="V<%=cont%>" value="<%=datapro.eibs.master.Util.formatCCY(convObj.getE02PLDMCO())%>"></td>		<!--Valor Cuota-->
							<td nowrap align="right"> <input type="text" name="M<%=cont%>" value="<%= datapro.eibs.master.Util.formatCCY(convObj.getE02PLDMPG())%>" size="16" maxlength="15" onKeypress="enterDecimal(event, 2)" > </td><!--  Monto Pagado --> <%//=convObj.getE02PLDMPG()%>
							<td nowrap align="right"> 
								<select  name="C<%=cont%>">
									<option value=""> </option>					
									<option value="1" <%=("1".equals(convObj.getE02PLDCNV())?"selected":"")%> >EMPLEADO SIN ALCANCE</option>
									<option value="3" <%=("3".equals(convObj.getE02PLDCNV())?"selected":"")%> >EMPLEADO INCORPORADO</option>						
									<option value="9" <%=("9".equals(convObj.getE02PLDCNV())?"selected":"")%> >NO SE DEBE PROCESAR	</option>						  
								</select>
							</td><!--Codigo Novedad--> <%//=convObj.getE02PLDCNV()%>								
						</tr>
					<%
						}
					%>
						<tr>
							<td>
								<input type="hidden" name="nro_reg" value="<%=cont%>">			
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>

	<table align="center" id="TBHELPN"  width="50%">
		<tr>
			<td>
				<div id="DIVSUBMIT" align="center">
					<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">		
				</div>	
			</td>
			<td>
				<div id="DIVSUBMIT" align="center">
					<input id="EIBSBTN" type="button" name="button1" value="Aplicar Pago" onclick="showDetail('<%=header.getE01PLHNUM() %>','<%=header.getE01PLHRCY() %>','<%=header.getE01PLHCDE() %>')">
				</div>	
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">
		function resizeDoc() {
			adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
		}
		resizeDoc();
		//window.onresize=resizeDoc;    	
	</script> 
	
	<%if ("OK".equals((String)request.getAttribute("upp"))){ %>	
	<script type="text/javascript">
		alert("Actualización Exitosa!!");
	</script> 
	<%} %>
	
<br>

<%
	}
%>

</form>
</body>
</html>
