<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO016002Message"%>
<%@ page import = "datapro.eibs.master.Util" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Listado de Convenios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvListDetails" class="datapro.eibs.beans.JBObjList" scope="request" />
<jsp:useBean id="objHead" class="datapro.eibs.beans.ECO016001Message" scope="request" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

	function cerrarVentana() {
		window.open('', '_parent', '');
		window.close(); 
  	}
  	
  	function goExcel(conv, plan, curr) {
   		var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0160?SCREEN=400&CONV=" + conv + "&PLAN=" + plan + "&CURR=" + curr;
   		CenterWindow(pg, 600, 500, 2);
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

<h3 align="center">Detalle Planilla
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="covenant_list_details.jsp, ECO0160"></h3>
<hr size="4">

<%
	if (cnvListDetails.getNoResult()) {
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
				<td align="left" nowrap width="15%"><%=objHead.getE01PLHCDE() %></td>
				<td align="right" nowrap width="10%">Nro Planilla :</td>
				<td align="left" nowrap width="15%"><%=objHead.getE01PLHNUM() %></td>
				<td align="right" nowrap width="10%">Fecha Emisión :</td>
				<td align="left" nowrap width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),
																 objHead.getBigDecimalE01PLHFEM().intValue(),
																 objHead.getBigDecimalE01PLHFED().intValue(),
																 objHead.getBigDecimalE01PLHFEY().intValue())%></td>
				<td align="right" nowrap width="10%">Estado :</td>
				<td align="left" nowrap width="15%"><%=objHead.getE01DSCSTA() %></td>
			</tr>
			<tr id="trclear">
				<td align="right"  nowrap  width="10%">Empleador :</td>
				<td align="left" nowrap width="15%"><%=objHead.getE01PLHENM()%></td>
				<td align="right" nowrap width="10%">Identificacion :</td>
				<td align="left" nowrap width="15%"><%=objHead.getE01PLHEID()%></td>
				<td align="right" nowrap width="10%">Nro registros :</td>
				<td align="left" nowrap  width="15%"><%=cnvListDetails.size()%></td>
				<td align="right" nowrap width="10%">Vencimiento : </td>
				<td align="left" nowrap  width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),
																 objHead.getBigDecimalE01PLHFVM().intValue(),
																 objHead.getBigDecimalE01PLHFVD().intValue(),
																 objHead.getBigDecimalE01PLHFVY().intValue())%></td>
			</tr>
			<tr id="trdark">
				<td align="right"  nowrap  width="10%">Cliente Convenio :</td>
				<td align="left" nowrap width="15%"><%=objHead.getE01PLHCNM()%></td>
				<td align="right" nowrap width="10%">Identificacion :</td>
				<td align="left" nowrap width="15%"><%=objHead.getE01PLHCID()%></td>
				<td align="right" nowrap width="10%">Moneda :</td>
				<td align="left" nowrap  width="15%"><%=objHead.getE01PLHRCY() %></td>
				<td align="right" nowrap width="10%">Total Planilla :</td>
				<td align="left" nowrap  width="15%"><%=objHead.getE01PLHPAM() %></td>
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
				<td align="center" nowrap  width="14%"><%=objHead.getE01PLHPPG() %></td>
				<td align="center" nowrap  width="14%"><%=objHead.getE01PLHPAP() %></td>
				<td align="center" nowrap  width="14%"><%=objHead.getE01PLHPRE() %></td>
				<td align="center" nowrap  width="14%"><%=objHead.getE01PLHPPN() %></td>
				<td align="center" nowrap  width="14%"><%=objHead.getE01PLHNRP() %></td>
				<td align="center" nowrap  width="14%"><%=objHead.getE01PLHAAM() %></td>
				<td align="center" nowrap  width="14%"><%=objHead.getE01PLHRAM() %></td>
			</tr>
		</table>
      </td>
    </tr>
 </table>
	
	<TABLE class="tbenter">
	    <TR>     	      
	      <TD class=TDBKG width="50%"> 
	        <div align="center"><a href="javascript:goExcel('<%=objHead.getE01PLHCDE()%>', '<%=objHead.getE01PLHNUM()%>', '<%=objHead.getE01PLHRCY()%>')">Generar<br>EXCEL</a></div>
	      </TD>	    
	      <TD class=TDBKG width="50%"> 
	        <div align="center"><a href="javascript:cerrarVentana()"><b>Salir</b></a></div>
	      </TD>  	          
	    </TR>
	</TABLE>
<br>			
<table id="mainTable" class="tableinfo" align="center">
	<tr>
		<td nowrap valign="top" width="100%">
			<table id="headTable" width="100%">
				<tr id="trclear">			
					<th align="center" nowrap width="2%">Sec</th>
					<th align="center" nowrap width="5%">Cuenta</th>				
					<th align="center" nowrap width="5%">Rol</th>				
					<th align="center" nowrap width="15%">Nombre Cliente</th>
					<th align="center" nowrap width="5%">Identidad </th>
					<th align="center" nowrap width="5%">Producto</th>
					<th align="center" nowrap width="5%">Vencimiento</th>
					<th align="center" nowrap width="5%">Cuota</th>				
					<th align="center" nowrap width="6%">Valor <br> Cobrado</th>				
					<th align="center" nowrap width="6%">Monto <br> Recibido</th>				
					<th align="center" nowrap width="6%">Recibido <br> Aplicado</th>				
					<th align="center" nowrap width="6%">Recibido <br> Rechazado</th>				
					<th align="center" nowrap width="6%">Pagado de <br> menos</th>				
					<th align="center" nowrap width="6%">Monto <br> Inpago</th>				
					<th align="center" nowrap width="10%">Novedad</th>									
				</tr>
			</table>

		<div id="dataDiv1" class="scbarcolor" >
		<table id="dataTable">
			<% 			
				cnvListDetails.initRow();
					int cont =1;
					while (cnvListDetails.getNextRow()) {
						ECO016002Message convObj = (ECO016002Message) cnvListDetails.getRecord();
			%>
			<tr id="trdark">
				<td nowrap align="center" width="2%"> <%=cont%></td>		<!--Sec-->			
				<td nowrap align="right" width="5%"> <%=convObj.getE02PLDACC()%></td>		<!--Nro. cuenta-->
				<td nowrap align="right" width="5%"> <%=convObj.getE02PLDROC()%></td>		<!--Rol Cliente-->
				<td nowrap align="left" width="15%"> <%=convObj.getE02PLDNME()%></td>		<!--Nombre Empresa-->
				<td nowrap align="right" width="5%"> <%=convObj.getE02PLDIDE()%></td>		<!--Rut. empresa-->
				<td nowrap align="center" width="5%"> <%=convObj.getE02PLDPRD()%></td>		<!--Producto-->
				<td nowrap align="center" width="5%"> <%=Util.formatCustomDate(currUser.getE01DTF(),
																 convObj.getBigDecimalE02PLDFVM().intValue(),
																 convObj.getBigDecimalE02PLDFVD().intValue(),
																 convObj.getBigDecimalE02PLDFVY().intValue())%></td>	<!--Fecha Vencimiento-->
				<td nowrap align="center" width="5%"> <%=convObj.getE02PLDPNU()%></td>		<!--Nro vencimi-->
				<td nowrap align="right" width="6%"> <%=convObj.getE02PLDMCO()%></td>		<!--Valor Cuota-->
				<td nowrap align="right" width="6%"> <%=convObj.getE02PLDMPG()%></td>		<!--Monto Pagado -->
				<td nowrap align="right" width="6%"> <%=convObj.getE02PLDMAP()%></td>		<!--Recibido Aplicado -->
				<td nowrap align="right" width="6%"> <%=convObj.getE02PLDMRE()%></td>		<!--Recibido rechazado -->
				<td nowrap align="right" width="6%"> <%=convObj.getE02PLDMPE()%></td>		<!--Pagado de Menos -->
				<td nowrap align="right" width="6%"> <%=convObj.getE02PLDMNP()%></td>		<!--Monto Inpago -->
				<td nowrap align="right" width="10%"> 
						<%if ("1".equals(convObj.getE02PLDCNV())) {
							  out.print("EMPLEADO SIN ALCANCE");
						  }else if ("2".equals(convObj.getE02PLDCNV())) {
							  out.print("EMPLEADO FUE DESPEDIDO");						  
						  }else if ("3".equals(convObj.getE02PLDCNV())) {
							  out.print("EMPLEADO INCORPORADO");						  
						  }else if ("4".equals(convObj.getE02PLDCNV())) {
							  out.print("EMPLEADO NO EXISTE");						  
						  }else if ("9".equals(convObj.getE02PLDCNV())) {
							  out.print("NO SE DEBE PROCESAR");						  
						  }	%>	
				</td> <!--Codigo Novedad -->								
			</tr>
			<%
				cont++;
				}
			%>
		</table>
		</div>
		</td>
	</tr>
</table>
<script type="text/javascript">
	window.moveTo(0,0);
	window.resizeTo(screen.width,screen.height);	
     function resizeDoc() {
 	          	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
      }
     resizeDoc();
     window.onresize=resizeDoc;
	 
</script> 
<br>
<%
	}
%>

</body>
</html>
