<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO024002Message,datapro.eibs.beans.ECO024001Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Listado de PLanillas</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="HClient" class="datapro.eibs.beans.ECO024001Message" scope="session" />
<jsp:useBean id="ECO024002ListFilter" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">
	function goBack(){  
		document.forms[0].SCREEN.value=101; 
		document.forms[0].submit();
	}
	function validar(){   
		return true;
	}
</script>

</head>

<body onload="resizeDoc();">
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">Planillas Propendientes a pagar En Proceso de Cuadre<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pago_planillas_lista_filter.jsp, ECO0240"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0240" onsubmit="return validar();">
	<input type="hidden" name="SCREEN" value="300">
	<input type="hidden" name="Type" value="1">
	<input type="hidden" name="E01SELNUM" value="">
	<input type="hidden" name="E01SELRCY" value="">
	<input type="hidden" name="E01SELECU" value="">
	<%
		if (ECO024002ListFilter.getNoResult()) {
	%>
	<TABLE class="tbenter" width=100% height=90%>
		<TR>
			<TD>
				<div align="center"><font size="3"><b> No hay resultados que correspondan a su criterio de Seleccion. </b></font></div>
			</TD>
		</TR>
	</TABLE>
	<%
		} else {
	%>	
	<br>
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

	<br>
	<table id="mainTable" class="tableinfo" align="center">
		<tr>
			<td nowrap valign="top" width="100%">
				<table id="headTable" width="100%">
					<tr id="trdark">			
						<th align="center" nowrap width="10%">Convenio</th>				
						<th align="center" nowrap width="10%">Planilla</th>				
						<th align="center" nowrap width="10%">Moneda</th>
						<!-- 					
						<th align="left" nowrap width="30%">Nombre Convenio</th>
						<th align="left" nowrap width="10%">RUT</th>
 						-->					
						<th align="center" nowrap width="10%">Fecha</th>					
						<th align="center" nowrap width="10%">Estatus</th>
						<th align="center" nowrap width="10%">Total Planilla</th>
						<th align="center" nowrap width="10%">Monto Recibido</th>
						<th align="center" nowrap width="10%">Recibido Aplicado</th>					
						<th align="center" nowrap width="10%">Recibido Rechazado</th>
						<th align="center" nowrap width="10%">Pagado de Menos</th>
						<th align="center" nowrap width="10%">Monto Impago</th>					
					</tr>
				</table>
				<div id="dataDiv1" class="scbarcolor">
					<table id="dataTable">
					<% 
						int ix = 0;
						ECO024002ListFilter.initRow();
						while (ECO024002ListFilter.getNextRow()) {
							ECO024002Message convObj = (ECO024002Message) ECO024002ListFilter.getRecord();
					%>
						<tr>
							<td nowrap align="center"><%=Util.formatCell(convObj.getE02PLHCDE())%></td>
							<td nowrap align="center"><%=Util.formatCell(convObj.getE02PLHNUM())%></td>
							<td nowrap align="center"><%=convObj.getE02PLHRCY()%> <input type="hidden" name="CCY<%=ix++%>" value="<%=convObj.getE02PLHRCY() %>"></td>				
							<td nowrap align="center"><%=(convObj.getE02PLHFED().length()>1?"":"0")+convObj.getE02PLHFED()+"/"+(convObj.getE02PLHFEM().length()>1?"":"0")+convObj.getE02PLHFEM()+"/"+convObj.getE02PLHFEY()%></td>
							<td nowrap align="left"><%=convObj.getE02DSCSTA().trim()%></td>
							<td nowrap align="right"><%=Util.formatCCY(convObj.getE02PLHPAM())%></td>				
							<td nowrap align="right"><%=Util.formatCCY(convObj.getE02PLHPPG())%></td>
							<td nowrap align="right"><%=Util.formatCCY(convObj.getE02PLHPAP())%></td>									
							<td nowrap align="right"><%=Util.formatCCY(convObj.getE02PLHPRE())%></td>	
							<td nowrap align="right"><%=Util.formatCCY(convObj.getE02PLHPPN())%></td>				
							<td nowrap align="right"><%=Util.formatCCY(convObj.getE02PLHNRP())%></td>				
						</tr>
					<%
						}
					%>
					</table>
				</div>
			</td>
		</tr>
	</table>
 
	<table align="center" id="TBHELPN">
		<tr>
			<td>
				<div id="DIVSUBMIT" align="center">
					<input id="EIBSBTN" type="submit" name="Submit" value="Procesar">
					<!-- 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="EIBSBTN" type="button" name="Regresar" value="Regresar" onclick="goBack();">
					-->						
				</div>
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">
		function resizeDoc() {
			adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
		}
		//resizeDoc();
		window.onresize=resizeDoc; 
	</script> 	 
	<%
		}
	%>
</form>

</body>
</html>
