<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Convenios - Mensajes Estandar</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.ECSM00201Message"  scope="session"  />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">

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
 	boolean isReadOnly = isInquiry;
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

function GetProduct08(name,desc,app,bank)
{
	page= "${pageContext.request.contextPath}/pages/s/EWD0008_client_help_container.jsp"
	fieldName=name;
	fieldAux1 = desc; 
	AppCode = app;
	ProductBank = bank;				
	CenterWindow(page,600,400,1);
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

  out.println("<SCRIPT> initMenu(); </SCRIPT>");				
		
		}
	%>
	<div align="center">
		<h3>
			Convenio - Dispersion<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="distribution_cash_management.jsp,ECSM002">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM002">
		<h4>Información Básica</h4>
		<input type="hidden" name="SCREEN" value="1">

		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="16%">
								<DIV align="right">Convenio:</DIV>
							</TD>
							<TD nowrap >
								<INPUT type="text" name="E01DISNUM" size="12" maxlength="12" value="<%=userPO.getAccNum().trim()%>" readonly>
							</TD>
							<TD nowrap width="15%" align="right">
								<DIV >Cliente:</DIV>
							</TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E01DISBNK" size="3" maxlength="2" value="<%=userPO.getBank().trim()%>" readonly> / 
								<INPUT type="text" name="E01DISCUN" size="10" maxlength="9" value="<%=userPO.getCusNum().trim()%>" readonly>
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Tipos de Dispersion :</TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E01DISTIP" size="1" maxlength="1" value="<%=msgRcd.getE01DISTIP()%>" readonly> / 
								<INPUT type="text" name="D01DISTIP" size="62" maxlength="60" value="<%=msgRcd.getD01DISTIP()%>" readonly>
							</TD>
							<TD nowrap width="15%">
							</TD>
							<TD nowrap width="35%">
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Periodo :</TD>
							<TD nowrap width="35%">
								<select name="E01DISPER">
									<option value=" " <%if (msgRcd.getE01DISPER().equals(" ")) { out.print("selected");}%>> </option>
									<option value="W" <%if (msgRcd.getE01DISPER().equals("W")) { out.print("selected");}%>>Semanal</option>
									<option value="B" <%if (msgRcd.getE01DISPER().equals("B")) { out.print("selected");}%>>Quincenal</option>
									<option value="M" <%if (msgRcd.getE01DISPER().equals("M")) { out.print("selected");}%>>Mensual</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">Numero Empleados/Proveedores :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E01DISQEM" size="5" maxlength="5" value="<%=msgRcd.getE01DISQEM()%>" /> 
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Valor :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E01DISVRA" size="15" maxlength="15" value="<%=msgRcd.getE01DISVRA()%>" /> 
							</TD>
							<TD nowrap width="15%" align="right">Tipo Cuenta Matriz:</TD>
								<TD nowrap width="35%">
								<select name="E01DISTCR">
									<option value=" " <%if (msgRcd.getE01DISTCR().equals(" ")) { out.print("selected");}%>> </option>
									<option value="G" <%if (msgRcd.getE01DISTCR().equals("G")) { out.print("selected");}%>>Cuenta Contable</option>
									<option value="D" <%if (msgRcd.getE01DISTCR().equals("D")) { out.print("selected");}%>>Cuenta de Detalle</option>
								</select>
							</TD>
						</TR>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Banco/Moneda/Cuenta Contable<br> Matriz :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E01DISRBK" size="2" maxlength="2" value="<%=msgRcd.getE01DISRBK()%>" />/ 
					            <input type="text" name="E01DISRCY" size="4" maxlength="4" value="<%=msgRcd.getE01DISRCY()%>"  />
            					<a href="javascript:GetCurrency('E01DISRCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absmiddle" border="0" ></a>/
                                <eibsinput:text name="msgRcd" property="E01DISRLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01DISRLN',document.forms[0].E01DISRBK.value,document.forms[0].E01DISRCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
							<TD nowrap width="15%" align="right">Cuenta Detalle <br> Matriz:</TD>
								<TD nowrap width="35%">
								<input type="text" name="E01DISRAC" size="12" maxlength="12" value="<%=msgRcd.getE01DISRAC()%>" /> 
								<a href="javascript:GetAccountCustomer('E01DISRAC',document.forms[0].E01DISBNK.value,'RT',document.forms[0].E01DISCUN.value,'')">
								<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
							</TD>
						</TR>
           				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Tabla Comision :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E01DISTBL" size="5" maxlength="4" value="<%= msgRcd.getE01DISTBL() %>">
							    <a href="javascript:GetCsmCommission('E01DISTBL','D01DISTBL','')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
 	           					<input type="text" name="D01DISTBL" size="35" maxlength="30"  value="<%=msgRcd.getD01DISTBL()%>" readonly>
        	  			</TD>
							<TD nowrap width="15%" align="right">Modalidad Cobro Comision :</TD>
							<TD nowrap width="35%">
								<select name="E01DISMCO">
									<option value=" " <%if (msgRcd.getE01DISMCO().equals(" ")) { out.print("selected");}%>> </option>
									<option value="C" <%if (msgRcd.getE01DISMCO().equals("C")) { out.print("selected");}%>>Cuenta por Cobrar</option>
									<option value="D" <%if (msgRcd.getE01DISMCO().equals("D")) { out.print("selected");}%>>Debito en Cuenta</option>
								</select>
							</TD>
						</TR>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Tipo Cuenta Cobro Comision :</TD>
									<TD nowrap width="35%">
								<select name="E01DISTCC">
									<option value=" " <%if (msgRcd.getE01DISTCC().equals(" ")) { out.print("selected");}%>> </option>
									<option value="G" <%if (msgRcd.getE01DISTCC().equals("G")) { out.print("selected");}%>>Cuenta Contable</option>
									<option value="D" <%if (msgRcd.getE01DISTCC().equals("D")) { out.print("selected");}%>>Cuenta de Detalle</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">Banco/Moneda/Cuenta Contable<br> Cobro Comision :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E01DISCBK" size="2" maxlength="2" value="<%=msgRcd.getE01DISCBK()%>" />/ 
					            <input type="text" name="E01DISCCY" size="4" maxlength="4" value="<%=msgRcd.getE01DISCCY()%>"  />
            					<a href="javascript:GetCurrency('E01DISCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absmiddle" border="0" ></a>/
                                <eibsinput:text name="msgRcd" property="E01DISCLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01DISCLN',document.forms[0].E01DISCBK.value,document.forms[0].E01DISCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
						</TR>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Cuenta Detalle <br> Cobro Comision:</TD>
								<TD nowrap width="35%">
								<input type="text" name="E01DISCAC" size="12" maxlength="12" value="<%=msgRcd.getE01DISCAC()%>" /> 
								<a href="javascript:GetAccountCustomer('E01DISCAC',document.forms[0].E01DISBNK.value,'RT',document.forms[0].E01DISCUN.value,'')">
								<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
							</TD>
							<TD nowrap width="15%" align="right">Cantidad de Pagos :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E01DISQPA" size="7" maxlength="5" value="<%=msgRcd.getE01DISQPA()%>" /> 
							</TD>
						</TR>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Nivel de Aplicacion :</TD>
							<TD nowrap width="35%">
								<select name="E01DISNIV">
									<option value=" " <%if (msgRcd.getE01DISNIV().equals(" ")) { out.print("selected");}%>> </option>
									<option value="C" <%if (msgRcd.getE01DISNIV().equals("C")) { out.print("selected");}%>>Consolidado</option>
									<option value="D" <%if (msgRcd.getE01DISNIV().equals("D")) { out.print("selected");}%>>Detalle</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">Dispersion Parcial :</TD>
									<TD nowrap width="35%">
								<select name="E01DISPAR">
									<option value=" " <%if (msgRcd.getE01DISPAR().equals(" ")) { out.print("selected");}%>> </option>
									<option value="Y" <%if (msgRcd.getE01DISPAR().equals("Y")) { out.print("selected");}%>>Si</option>
									<option value="N" <%if (msgRcd.getE01DISPAR().equals("N")) { out.print("selected");}%>>No</option>
								</select>
							</TD>
						</TR>
					</table>
				</td>
			</tr>
		</table>

<% if (msgRcd.getE01DISTIP().equals("N")) { %> 
	<h4>Nomina</h4>
		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
				    	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Producto :</TD>
							<TD nowrap width="35%">
								<input type="text" name="E01DISCDE" size="5" maxlength="4" value="<%=msgRcd.getE01DISCDE()%>" readonly/> 
								<a href="javascript:GetProduct('E01DISCDE','RT','01','D01DISCDE','E01DISBTY')">
								<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
								<input type="text" name="D01DISCDE" id="D01DISCDE" size="45" readonly value="<%=msgRcd.getD01DISCDE()%>">
							</TD>
							<td nowrap width="25%">
								<div align="right">Tabla de Cargos Cuentas Beneficiarias :</div>
							</td>
							<td nowrap width="25%">
								<INPUT type="text" name="E01DISBTY" maxlength="4" size="5" value="<%= msgRcd.getE01DISBTY().trim()%>" readonly >
            					<a href="javascript:GetProductRates('E01DISBTY','RT')"> <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> /
			    				<input type="text" name="E01DISBBL" size="5" maxlength="4" value="<%= msgRcd.getE01DISBBL().trim() %>">
								<a href="javascript:GetRetCod('E01DISBBL',document.forms[0].E01DISBTY.value)"> <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
							</td>
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
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(25);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(21);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	


		
	</form>
	
</body>
</html>
