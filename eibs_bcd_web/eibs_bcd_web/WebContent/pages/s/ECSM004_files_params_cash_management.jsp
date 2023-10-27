<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECSM00401Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function goAction(op) {

	document.forms[0].SCREEN.value="2";
	document.forms[0].submit();

}

</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

 	String read = " ";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		read = " readonly "; 
	}
%>

<h3 align="center">Parametros Consulta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="files_params_cash_management.jsp, ECSM004"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM004" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

<%int row = 0; %>
 
 <h4>Informaci&oacute;n para consulta</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Convenio : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01ILHAGR" size="16" maxlength="12" value="<%= msgRcd.getE01ILHAGR() %>">
				</td>
            	<td nowrap width=10% align="right">Tipo Archivo : </td>
            	<td nowrap width=40% align="left">
					<select name="E01ILHTIP">
						<option value=" " <%if (msgRcd.getE01ILHTIP().equals(" ")) { out.print("selected");}%>> </option>
						<option value="N" <%if (msgRcd.getE01ILHTIP().equals("N")) { out.print("selected");}%>>Nomina</option>
						<option value="A" <%if (msgRcd.getE01ILHTIP().equals("A")) { out.print("selected");}%>>Ahorro</option>
						<option value="P" <%if (msgRcd.getE01ILHTIP().equals("P")) { out.print("selected");}%>>Proveedor/Interno</option>
						<option value="Q" <%if (msgRcd.getE01ILHTIP().equals("Q")) { out.print("selected");}%>>Proveedor/Externo</option>
						<option value="D" <%if (msgRcd.getE01ILHTIP().equals("D")) { out.print("selected");}%>>Asociacion</option>
						<option value="C" <%if (msgRcd.getE01ILHTIP().equals("C")) { out.print("selected");}%>>Creacion</option>
						<option value="B" <%if (msgRcd.getE01ILHTIP().equals("B")) { out.print("selected");}%>>Codigo de Barras</option>
						<option value="I" <%if (msgRcd.getE01ILHTIP().equals("I")) { out.print("selected");}%>>Pin</option>
						<option value="R" <%if (msgRcd.getE01ILHTIP().equals("R")) { out.print("selected");}%>>Referencias</option>
						<option value="T" <%if (msgRcd.getE01ILHTIP().equals("T")) { out.print("selected");}%>>Respuesta Prenotificacion</option>
					</select>
       			</td>
	  		</tr>
   		</table> 
      </td>  
    </tr>
  </table>

  	
   	
<br>
	
	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction();">
     	  </div>	
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<a href="<%=request.getContextPath()%>/pages/background.jsp" class="botonrojo"><b>Salir</b></a>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
