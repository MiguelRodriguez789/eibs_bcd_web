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

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.ECSM00301Message"  scope="session"  />
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
			Motor de Pagos - Mensajes Estandar<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="message_cash_management.jsp,ECSM003">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM003">
		<h4>Información Básica</h4>
		<input type="hidden" name="SCREEN" value="1">

		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%">
								<DIV align="right">Tipo:</DIV>
							</TD>
							<TD nowrap width="35%">
								<select name="E01MEGTIP">
									<option value=" " <%if (msgRcd.getE01MEGTIP().equals(" ")) { out.print("selected");}%>> 	</option>
									<option value="C" <%if (msgRcd.getE01MEGTIP().equals("C")) { out.print("selected");}%>>Crear/Asociar</option>
									<option value="R" <%if (msgRcd.getE01MEGTIP().equals("R")) { out.print("selected");}%>>Recaudo</option>
									<option value="N" <%if (msgRcd.getE01MEGTIP().equals("N")) { out.print("selected");}%>>Nomina</option>
									<option value="A" <%if (msgRcd.getE01MEGTIP().equals("A")) { out.print("selected");}%>>Ahorro</option>	
									<option value="P" <%if (msgRcd.getE01MEGTIP().equals("P")) { out.print("selected");}%>>Proveedor Interno</option>
									<option value="Q" <%if (msgRcd.getE01MEGTIP().equals("Q")) { out.print("selected");}%>>Proveedor Externo</option>
									<option value="X" <%if (msgRcd.getE01MEGTIP().equals("X")) { out.print("selected");}%>>Monitoreo</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">
								<DIV >Evento :</DIV>
							</TD>
							<TD nowrap width="35%">
								<select name="E01MEGEVT">
									<option value=" " <%if (msgRcd.getE01MEGEVT().equals(" ")) { out.print("selected");}%>> </option>
 										<option value="VA" <%if (msgRcd.getE01MEGEVT().equals("VA")) { out.print("selected");}%>>Validar</option>
										<option value="PA" <%if (msgRcd.getE01MEGEVT().equals("PA")) { out.print("selected");}%>>Proceso</option>
										<option value="AB" <%if (msgRcd.getE01MEGEVT().equals("AB")) { out.print("selected");}%>>Asobancaria</option>
										<option value="V1" <%if (msgRcd.getE01MEGEVT().equals("V1")) { out.print("selected");}%>>Validar Cantidad</option>
										<option value="V2" <%if (msgRcd.getE01MEGEVT().equals("V2")) { out.print("selected");}%>>Validar Monto</option>
								</select>
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Resultado :</TD>
							<TD nowrap width="35%" colspan ="3">
								<select name="E01MEGRES">
									<option value=" " <%if (msgRcd.getE01MEGRES().equals(" ")) { out.print("selected");}%>> </option>
									<option value="Y" <%if (msgRcd.getE01MEGRES().equals("Y")) { out.print("selected");}%>>Proceso SIN errores</option>
									<option value="N" <%if (msgRcd.getE01MEGRES().equals("N")) { out.print("selected");}%>>Proceso CON errores</option>
								</select>
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Asunto :</TD>
							<TD nowrap width="35%" colspan ="3">
								<input type="text" name="E01MEGASU" size="135" maxlength="132" value="<%=msgRcd.getE01MEGASU()%>" /> 
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Mensaje :</TD>
							<TD nowrap width="35%" colspan ="3">
								<input type="text" name="E01MEGME1" size="125" maxlength="120" value="<%=msgRcd.getE01MEGME1()%>" /> 
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right"></TD>
							<TD nowrap width="35%" colspan ="3">
								<input type="text" name="E01MEGME2" size="125" maxlength="120" value="<%=msgRcd.getE01MEGME2()%>" /> 
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Pie de Pagina :</TD>
							<TD nowrap width="35%" colspan ="3">
								<input type="text" name="E01MEGFOT" size="135" maxlength="132" value="<%=msgRcd.getE01MEGFOT()%>" /> 
							</TD>
						</tr>

					</table>
				</td>
			</tr>
		</table>

	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(1);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	


		
	</form>
	
</body>
</html>
