<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Convenios - Motor de Pagos - Recaudos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.ECSM00204Message"  scope="session"  />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">

<% if(userPO.getPurpose().equals("MAINTENANCE")) {%>
	builtNewMenu(csm_cr_opt);
 <% } %>

<%int row = 0; %>

<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"));
 	boolean isReadOnly =isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
 	String disabledMnt = (userPO.getPurpose().equals("NEW")?"":" disabled");
 	if (isInquiry) {
 	  help = "";
 	}
%>

	
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	submitForm();
}

function CuentaRecaudo(){
  // FormaRecaudo: D=Detalle G=Contale
  if (getElement("E04COLTCR").value == ('D')) {
    getElement("r1").style.display = 'none';
    getElement("r2").style.display = 'none';
    getElement("r3").style.display = 'table-cell';
    getElement("r4").style.display = 'table-cell';
  } else if(getElement("E04COLTCR").value == ('G')) {
    getElement("r1").style.display = 'table-cell';
    getElement("r2").style.display = 'table-cell';
    getElement("r3").style.display = 'none';
    getElement("r4").style.display = 'none';
  }
    setRowColors("BASIC_TABLE");
}


function CuentaComision(){
  // CuentaComision: D=Detalle G=Contale
  if (getElement("E04COLTCC").value == ('D')) {
    getElement("c1").style.display = 'none';
    getElement("c2").style.display = 'none';
    getElement("c3").style.display = 'table-cell';
    getElement("c4").style.display = 'table-cell';
  } else if(getElement("E04COLTCC").value == ('G')) {
    getElement("c1").style.display = 'table-cell';
    getElement("c2").style.display = 'table-cell';
    getElement("c3").style.display = 'none';
    getElement("c4").style.display = 'none';
  }  setRowColors("BASIC_TABLE");
}

</SCRIPT>


</head>
<body>
	<%
		if (!error.getERRNUM().equals("0")) {
			error.setERRNUM("0");
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");
		}

  out.println("<SCRIPT> initMenu(); </SCRIPT>");				
		
	%>
	<div align="center">
		<h3>
			Convenio - Recaudos - Motor de Pagos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="collection_cash_management.jsp,ECSM002">
		</h3>
	</div>
	<hr size="4">
	<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM002">
	<input type="hidden" name="SCREEN" value="15">
	
	<h4>Información Básica</h4>
		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%">
								<DIV align="right">Convenio:</DIV>
							</TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E04COLNUM" size="12" maxlength="12" value="<%=userPO.getAccNum().trim()%>" readonly>
							</TD>
							<TD nowrap width="15%" align="right">
								<DIV >Cliente:</DIV>
							</TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E04COLBNK" size="3" maxlength="2" value="<%=userPO.getBank().trim()%>" readonly> / 
								<INPUT type="text" name="E04COLCUN" size="10" maxlength="9" value="<%=userPO.getCusNum().trim()%>" readonly>
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%">
								<DIV align="right">Canal:</DIV>
							</TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E04COLCNL" size="3" maxlength="2" value="<%=msgRcd.getE04COLCNL()%>"readonly></a>
 	           					<input type="text" name="D04COLCNL" size="35" maxlength="30"  value="<%=msgRcd.getD04COLCNL()%>" readonly>
							</TD>
							<TD nowrap width="15%" align="right">Numero de Recaudos al Mes :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E04COLQME" size="5" maxlength="5" value="<%=msgRcd.getE04COLQME()%>" /> 
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Periodo Envio Informacion :</TD>
							<TD nowrap width="35%">
								<select name="E04COLPER">
									<option value=" " <%if (msgRcd.getE04COLPER().equals(" ")) { out.print("selected");}%>> </option>
									<option value="D" <%if (msgRcd.getE04COLPER().equals("D")) { out.print("selected");}%>>Diario</option>
									<option value="S" <%if (msgRcd.getE04COLPER().equals("S")) { out.print("selected");}%>>Semanal</option>
									<option value="Q" <%if (msgRcd.getE04COLPER().equals("Q")) { out.print("selected");}%>>Quincenal</option>
									<option value="M" <%if (msgRcd.getE04COLPER().equals("M")) { out.print("selected");}%>>Mensual</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">Valor de los Recaudos :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E04COLVRA" size="15" maxlength="15" value="<%=msgRcd.getE04COLVRA()%>" /> 
							</TD>
						</TR>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Disponibilidad del Recaudo :</TD>
								<TD nowrap width="35%">
								<select name="E04COLDRE">
									<option value=" " <%if (msgRcd.getE04COLDRE().equals(" ")) { out.print("selected");}%>> </option>
									<option value="L" <%if (msgRcd.getE04COLDRE().equals("L")) { out.print("selected");}%>>En Linea </option>
									<option value="C" <%if (msgRcd.getE04COLDRE().equals("C")) { out.print("selected");}%>>Cierre Diario</option>
								</select>
								</TD>
							<TD nowrap width="15%" align="right">Dias de Retencion del Recaudo :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E04COLDIR" size="5" maxlength="5" value="<%=msgRcd.getE04COLDIR()%>" /> 
							</TD>
						</TR>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Permite Facturas Vencidas :</TD>
							<TD nowrap width="35%">
								<select name="E04COLPFV">
									<option value=" " <%if (msgRcd.getE04COLPFV().equals(" ")) { out.print("selected");}%>> </option>
									<option value="Y" <%if (msgRcd.getE04COLPFV().equals("Y")) { out.print("selected");}%>>Si</option>
									<option value="N" <%if (msgRcd.getE04COLPFV().equals("N")) { out.print("selected");}%>>No</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">Permite Modificar Valor de la Factura :</TD>
								<TD nowrap width="35%">
								<select name="E04COLPMV">
									<option value=" " <%if (msgRcd.getE04COLPMV().equals(" ")) { out.print("selected");}%>> </option>
									<option value="Y" <%if (msgRcd.getE04COLPMV().equals("Y")) { out.print("selected");}%>>Si</option>
									<option value="N" <%if (msgRcd.getE04COLPMV().equals("N")) { out.print("selected");}%>>No</option>
								</select>
							</TD>
						</TR>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Tipo de Recaudo :</TD>
							<TD nowrap width="35%">
								<INPUT type="radio" name="E04COLTIB" value="M" <%if (msgRcd.getE04COLTIB().equals("M")) out.print("checked");%>>Manual 
								<INPUT type="radio" name="E04COLTIB" value="Y" <%if (msgRcd.getE04COLTIB().equals("Y")) out.print("checked");%>>Base de datos
								<br>
								<INPUT type="radio" name="E04COLTIB" value="W" <%if (msgRcd.getE04COLTIB().equals("W")) out.print("checked");%>>Web Service
							</TD>
							<TD nowrap width="15%" align="right">Modalidad del Recaudo:</TD>
								<TD nowrap width="35%">
								<INPUT type="checkbox" name="E04COLMOC" value="Y" <%if (msgRcd.getE04COLMOC().equals("Y")) out.print("checked");%>>Codigo de Barras
								<br> 
								<INPUT type="checkbox" name="E04COLMOR" value="Y" <%if (msgRcd.getE04COLMOR().equals("Y")) out.print("checked");%>>Referencia 
								<INPUT type="checkbox" name="E04COLMOP" value="Y" <%if (msgRcd.getE04COLMOP().equals("Y")) out.print("checked");%>>PIN 
							</TD>
						</TR>
           				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Forma de Pago :</TD>
							<TD nowrap width="35%">
								<INPUT type="checkbox" name="E04COLFEF" value="Y" <%if (msgRcd.getE04COLFEF().equals("Y")) out.print("checked");%>>Efectivo 
								<INPUT type="checkbox" name="E04COLFCH" value="Y" <%if (msgRcd.getE04COLFCH().equals("Y")) out.print("checked");%>>Cheque 
								<br>
								<INPUT type="checkbox" name="E04COLFDC" value="Y" <%if (msgRcd.getE04COLFDC().equals("Y")) out.print("checked");%>>Debito a Cuenta 
							</TD>
							<TD nowrap width="15%" align="right">Tipo Cuenta Recaudadora:</TD>
								<TD nowrap width="35%">
								<select name="E04COLTCR" id="E04COLTCR" onchange="CuentaRecaudo();">
									<option value=" " <%if (msgRcd.getE04COLTCR().equals(" ")) { out.print("selected");}%>> </option>
									<option value="G" <%if (msgRcd.getE04COLTCR().equals("G")) { out.print("selected");}%>>Cuenta Contable</option>
									<option value="D" <%if (msgRcd.getE04COLTCR().equals("D")) { out.print("selected");}%>>Cuenta de Detalle</option>
								</select>
							</TD>
						</TR>
           				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Banco/Moneda/Cuenta Contable<br> Recaudadora :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E04COLRBK" size="2" maxlength="2" value="<%=msgRcd.getE04COLRBK()%>" />/ 
					            <input type="text" name="E04COLRCY" size="4" maxlength="4" value="<%=msgRcd.getE04COLRCY()%>"  />
            					<a href="javascript:GetCurrency('E04COLRCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absmiddle" border="0" ></a>/
                                <eibsinput:text name="msgRcd" property="E04COLRLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E04COLRLN',document.forms[0].E04COLRBK.value,document.forms[0].E04COLRCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
							<TD nowrap width="15%" align="right">Cuenta Detalle <br> Recaudadora:</TD>
								<TD nowrap width="35%">
								<input type="text" name="E04COLRAC" size="14" maxlength="12" value="<%=msgRcd.getE04COLRAC()%>" /> 
								<a href="javascript:GetAccountCustomer('E04COLRAC',document.forms[0].E04COLBNK.value,'RT',document.forms[0].E04COLCUN.value,'')">
								<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
							</TD>
						</TR>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Tabla Comision :</TD>
							<TD nowrap width="35%">
        	   					<input type="text" name="E04COLTBL" size="5" maxlength="4" value="<%= msgRcd.getE04COLTBL() %>">
							    <a href="javascript:GetCsmCommission('E04COLTBL','D04COLTBL','')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
 	           					<input type="text" name="D04COLTBL" size="35" maxlength="30"  value="<%=msgRcd.getD04COLTBL()%>" readonly>
        	  				</TD>
							<TD nowrap width="15%" align="right">Modalidad Cobro Comision :</TD>
							<TD nowrap width="35%">
								<select name="E04COLMCO">
									<option value=" " <%if (msgRcd.getE04COLMCO().equals(" ")) { out.print("selected");}%>> </option>
									<option value="C" <%if (msgRcd.getE04COLMCO().equals("C")) { out.print("selected");}%>>Cuenta por Cobrar</option>
									<option value="D" <%if (msgRcd.getE04COLMCO().equals("D")) { out.print("selected");}%>>Debito en Cuenta</option>
								</select>
							</TD>
						</TR>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Tipo Cuenta Cobro Comision :</TD>
									<TD nowrap width="35%">
								<select name="E04COLTCC" id="E04COLTCC" onchange="CuentaComision();">
									<option value=" " <%if (msgRcd.getE04COLTCC().equals(" ")) { out.print("selected");}%>> </option>
									<option value="G" <%if (msgRcd.getE04COLTCC().equals("G")) { out.print("selected");}%>>Cuenta Contable</option>
									<option value="D" <%if (msgRcd.getE04COLTCC().equals("D")) { out.print("selected");}%>>Cuenta de Detalle</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">Banco/Moneda/Cuenta Contable<br> Cobro Comision :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E04COLCBK" size="2" maxlength="2" value="<%=msgRcd.getE04COLCBK()%>" />/ 
					            <input type="text" name="E04COLCCY" size="4" maxlength="4" value="<%=msgRcd.getE04COLCCY()%>"  />
            					<a href="javascript:GetCurrency('E04COLCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absmiddle" border="0" ></a>/
                                <eibsinput:text name="msgRcd" property="E04COLCLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E04COLCLN',document.forms[0].E04COLCBK.value,document.forms[0].E04COLCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
						</TR>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Cuenta Detalle <br> Cobro Comision:</TD>
								<TD nowrap width="35%">
								<input type="text" name="E04COLCAC" size="12" maxlength="12" value="<%=msgRcd.getE04COLCAC()%>" /> 
								<a href="javascript:GetAccountCustomer('E04COLCAC',document.forms[0].E04COLBNK.value,'RT',document.forms[0].E04COLCUN.value,'')">
								<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
							</TD>
							<TD nowrap width="15%" align="right">Formato Archivo de Respuesta :</TD>
							<TD nowrap width="35%">
								<select name="E04COLFAR">
									<option value=" " <%if (msgRcd.getE04COLFAR().equals(" ")) { out.print("selected");}%>> </option>
									<option value="1" <%if (msgRcd.getE04COLFAR().equals("1")) { out.print("selected");}%>>Aso98</option>
									<option value="2" <%if (msgRcd.getE04COLFAR().equals("2")) { out.print("selected");}%>>Aso2001</option>
								</select>
							</TD>
						</TR>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Nivel de Aplicacion :</TD>
							<TD nowrap width="35%">
								<select name="E04COLNIV">
									<option value=" " <%if (msgRcd.getE04COLNIV().equals(" ")) { out.print("selected");}%>> </option>
									<option value="C" <%if (msgRcd.getE04COLNIV().equals("C")) { out.print("selected");}%>>Consolidado</option>
									<option value="D" <%if (msgRcd.getE04COLNIV().equals("D")) { out.print("selected");}%>>Detalle</option>
								</select>
							</TD>
							<% if (msgRcd.getE04COLMOP().equals("Y")) { %>
							<TD nowrap width="15%" align="right">Pagar el mismo PIN Varias Veces :</TD>
							<TD nowrap width="35%">
								<select name="E04COLPIV">
									<option value=" " <%if (msgRcd.getE04COLPIV().equals(" ")) { out.print("selected");}%>> </option>
									<option value="Y" <%if (msgRcd.getE04COLPIV().equals("Y")) { out.print("selected");}%>>Si</option>
									<option value="N" <%if (msgRcd.getE04COLPIV().equals("N")) { out.print("selected");}%>>No</option>
								</select>
							</TD>
							<% } %>
							<% if (!msgRcd.getE04COLMOP().equals("Y")) { %>
							<TD nowrap width="15%" align="right"></TD>
							<TD nowrap width="35%"></TD>
							<% } %>
						</TR>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Forma de Entrega :</TD>
							<TD nowrap width="35%">
								<INPUT type="checkbox" name="E04COLPRB" value="Y" <%if (msgRcd.getE04COLPRB().equals("Y")) out.print("checked");%>>Base de Datos 
								<INPUT type="checkbox" name="E04COLPRW" value="Y" <%if (msgRcd.getE04COLPRW().equals("Y")) out.print("checked");%>>WebService 
							</TD>
							<TD nowrap width="15%" align="right"></TD>
							<TD nowrap width="35%"></TD>
						</TR>
					</table>
				</td>
			</tr>
		</table>

<% if (msgRcd.getE04COLCNL().equals("01")) { %> 
	<h4>Caja</h4>
		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
				    	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Jornada Adicional :</TD>
							<TD nowrap width="35%">
								<select name="E04COLCJA">
									<option value=" " <%if (msgRcd.getE04COLCJA().equals(" ")) { out.print("selected");}%>> </option>
									<option value="Y" <%if (msgRcd.getE04COLCJA().equals("Y")) { out.print("selected");}%>>Si</option>
									<option value="N" <%if (msgRcd.getE04COLCJA().equals("N")) { out.print("selected");}%>>No</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">Valor minimo :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E04COLCVM" size="15" maxlength="15" value="<%=msgRcd.getE04COLCVM()%>" /> 
							</TD>
						</TR>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Valor maximo :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E04COLCVX" size="15" maxlength="15" value="<%=msgRcd.getE04COLCVX()%>" /> 
							</TD>
							<TD nowrap width="15%" align="right">Consulta Previa :</TD>
							<TD nowrap width="35%">
								<select name="E04COLINP">
									<option value=" " <%if (msgRcd.getE04COLINP().equals(" ")) { out.print("selected");}%>> </option>
									<option value="Y" <%if (msgRcd.getE04COLINP().equals("Y")) { out.print("selected");}%>>Si</option>
									<option value="N" <%if (msgRcd.getE04COLINP().equals("N")) { out.print("selected");}%>>No</option>
								</select>
							</TD>
						</TR>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<% if (msgRcd.getE04COLFCH().equals("Y")) { %>
								<TD nowrap width="15%" align="right">Cheques :</TD>
								<TD nowrap width="35%" >
									<INPUT type="checkbox" name="E04COLFHP" value="Y" <%if (msgRcd.getE04COLFHP().equals("Y")) out.print("checked");%>>Propio 
									<INPUT type="checkbox" name="E04COLFHO" value="Y" <%if (msgRcd.getE04COLFHO().equals("Y")) out.print("checked");%>>Otro Banco
									<br>
									<INPUT type="checkbox" name="E04COLFHE" value="Y" <%if (msgRcd.getE04COLFHE().equals("Y")) out.print("checked");%>>Banco Extranjero 
								</TD>
							<% } %> 
							<% if (!msgRcd.getE04COLFCH().equals("Y")) { %>
							<TD nowrap width="15%" align="right"></TD>
							<TD nowrap width="35%"></TD>
							<% } %>
							<TD nowrap width="15%" align="right"></TD>
							<TD nowrap width="35%"></TD>
						</TR>
					</table>
				</td>
			</tr>
		</table>
<% } %> 


	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(15);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(11);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	



		
	</form>
	
</body>
</html>
