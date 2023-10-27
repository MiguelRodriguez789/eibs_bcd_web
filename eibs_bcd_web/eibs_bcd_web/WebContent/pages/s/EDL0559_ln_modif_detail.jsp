<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.master.Util" %>
<html>
<head>
<title>Hist&oacute;rico Modificaciones / Reestructuraciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="datarec" class="datapro.eibs.beans.EDL055902Message"  scope="session" />
<jsp:useBean id="headInfo" class="datapro.eibs.beans.EDL055902Message" scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

</SCRIPT>  

<script type="text/javascript">

function goAction(op) {
	getElement("opt").value = op;
	document.forms[0].submit();
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
		 out.println("<SCRIPT Language=\"Javascript\">");
		 out.println("       showErrors()");
		 out.println("</SCRIPT>");
	 }
%>

<h3 align="center">Hist&oacute;rico Modificaciones / Reestructuraciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_monitor_detail.jsp, EDL0559"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0559" >
	<input type=HIDDEN name="SCREEN" id="SCREEN" value="101">
	<%int row = 0; %>
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="15%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="10%" > 
							<div align="left">
								<eibsinput:text property="E02HDICUN" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E02HDINA1" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Tipo : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E02HDITYP" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap width="15%"> <div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="10%"> 
							<div align="left"> 
								<eibsinput:text property="E02HDIACC" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E02HDICCY" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E02HDIPRO" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<br>
	<p></p>  

	<h4>Datos Basicos</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Monto Solicitado :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text name="datarec" property="E02DEAOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap width="25%" > 
							<div align="right">T&eacute;rmino :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E02DEATRM" size="5" maxlength="5" value="<%= datarec.getE02DEATRM().trim()%>" readonly>
							<input type="text" name="E02DEATRC" size="10" value="<% if (datarec.getE02DEATRC().equals("D")) out.print("D&iacute;a(s)");
							else if (datarec.getE02DEATRC().equals("M")) out.print("Mes(es)");
							else if (datarec.getE02DEATRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" readonly>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Clase de Cr&eacute;dito :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" readonly name="E02DEACLF" size="1" maxlength="1" value="<%=datarec.getE02DEACLF().trim()%>">
							<input type="text" readonly name="D02DEACLF" size="40" maxlength="40"  
							value="<% if (datarec.getE02DEACLF().equals("A")) out.print("Arrendamiento Financiero");
							else if (datarec.getE02DEACLF().equals("C")) out.print("Préstamos de Consumo");
							else if (datarec.getE02DEACLF().equals("D")) out.print("Préstamos sobre Saldo Disoluto");
							else if (datarec.getE02DEACLF().equals("F")) out.print("Préstamo de Fomento");
							else if (datarec.getE02DEACLF().equals("L")) out.print("Préstamo Regular");
							else if (datarec.getE02DEACLF().equals("H")) out.print("Hipotecarios");
							else if (datarec.getE02DEACLF().equals("K")) out.print("Relacionado");
							else if (datarec.getE02DEACLF().equals("M")) out.print("Microcredito");
							else if (datarec.getE02DEACLF().equals("P")) out.print("Politica Habitacional");
							else if (datarec.getE02DEACLF().equals("G")) out.print("Descuento Documentos(Factoring)");
							else if (datarec.getE02DEACLF().equals("V")) out.print("Valores al Cobro");
							else if (datarec.getE02DEACLF().equals("O")) out.print("Para Control de Sobregiros");
							else if (datarec.getE02DEACLF().equals("R")) out.print("Préstamo Reestructurado");
							else if (datarec.getE02DEACLF().equals("I")) out.print("Préstamo Credilinea");
							else if (datarec.getE02DEACLF().equals("S")) out.print("Préstamo Avalado");
							else if (datarec.getE02DEACLF().equals("T")) out.print("Deuda de Tarjeta en Recuperacion");
							else if (datarec.getE02DEACLF().equals("X")) out.print("Préstamo Regular Refinanciado");
							else out.print("Proyectos de Constructor");%>" >
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tasa Efectiva Anual :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text name="datarec" property="E02DEASPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Saldo Principal :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text name="datarec" property="E02DEAMEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap width="25%" > 
							<div align="right">Valor Cuota :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text name="datarec" property="E02DEAROA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Costo Total :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:text name="datarec" property="E02SALTOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
						</td>
						<td nowrap width="25%" > 
							<div align="right">Calificaci&oacute;n :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E02DLCALI" size="2" maxlength="1" value="<%= datarec.getE02DLCALI().trim()%>" readonly>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Saldos</h4>
	<table class="tableinfo">
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<%
						String seq = "";
						for (int i = 1; i <= 25; i++) {	
						  if (i < 10) seq = "0"+i; else seq = ""+i;
						  if(!datarec.getField("E02PNAR"+seq).getString().trim().equals("")) {
					%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  >
							<input type="hidden" name="E02PTYP<%= seq%>" value="<%=datarec.getField("E02PTYP"+seq).getString().trim()%>"><div align="left"><%=datarec.getField("E02PNAR"+seq).getString().trim()%> :</div>
						</td>
						<td nowrap width="25%" ><div align="right"><%=datarec.getField("E02PAMT"+seq).getString().trim()%></div></td>
						<td nowrap width="25%" ></td>
						<td nowrap width="25%" ></td>
					</tr>
					<%
					    }
					  }
					%> 
				</table>
			</td>
		</tr>
	</table>

	<br>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" OnClick="doPrint()" value="Imprimir">
		<input id="EIBSBTN" type=button name="Submit" OnClick="cerrarVentana()" value="Salir">
	</div>

</form>

<script type="text/javascript">
function doPrint(){
	if(!window.print){
		var msg ="Debe actualizar su navegador para imprimir";
		alert(msg);
		return;
	}
	document.getElementById('EIBSBTN').style.visibility = 'hidden';
	window.focus();
	window.print();
	document.getElementById('EIBSBTN').style.visibility = 'visible';
	return;
}

</script>

</body>
</html>
