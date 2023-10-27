<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ERP000001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		}
	submitForm();
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
 	String disabled = "";
 	Boolean isReadOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")) || (!currUser.getE01AUT().equals("A"))) {
		read = " readonly "; 
		disabled = " disabled";
		isReadOnly = true;
	}
	String readNew = " "; 
	String disabledNew = " ";
	Boolean isReadOnlyNew = false;
	if (!userPO.getPurpose().equals("NEW")) {
		readNew = " readonly ";
 		disabledNew = " disabled";
 		isReadOnlyNew = true;
	}
%>

<h3 align="center">Parámetros de Reportes y Procesos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="report_detail.jsp, ERP0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSERP0000" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="trdark">
				<td nowrap width=10% align="right">Nombre del reporte : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01IBSRPN" size="12" maxlength="10" value="<%= msgRcd.getE01IBSRPN() %>" <%= readNew %>><%=mandatory %>
				</td>
            	<td nowrap width=10% align="right">Descripción : </td>
            	<td nowrap width=40% align="left">
            		<input type="text" name="E01IBSDSC" size="50" maxlength="45" value="<%= msgRcd.getE01IBSDSC() %>" <%= read %>><%=mandatory %>
       			</td>
	  		</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Idioma : </td>
				<td nowrap width=40% align="left">
					<select name="E01IBSLIF" <%=disabledNew %>>
          	  		<option value="S" <% if (msgRcd.getE01IBSLIF().equals("S")) out.print("selected"); %>>Español</option>
                	<option value="E" <% if (msgRcd.getE01IBSLIF().equals("E")) out.print("selected"); %>>Ingles</option>
           			</select><%=mandatory %>	
				</td>
				<td nowrap width=10% align="right">Módulo : </td>
				<td  nowrap width=40% align="left">
					<input type="text" name="E01IBSMOD" size="4" maxlength="2" value="<%=msgRcd.getE01IBSMOD()%>" <%=read %>>
            		<input type="text" name="D01MODDSC" size="50" maxlength="45"  value="<%=msgRcd.getD01MODDSC()%>" readonly><%=mandatory %>
            		<% if ( !isReadOnly) {%>
              		<a href="javascript:GetModRpt('E01IBSMOD','D01MODDSC', document.forms[0]['E01IBSLIF'].value)" >
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            		<% } %>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width=10% align="right">Periodicidad : </td>
				<td  nowrap width=40% align="left">
					<select name="E01IBSPER" <%=disabled %>>
					    <option value="N" <% if (msgRcd.getE01IBSPER().equals("N")) out.print("selected"); %>>No Aplica</option>
	          	  		<option value="D" <% if (msgRcd.getE01IBSPER().equals("D")) out.print("selected"); %>>Diario</option>
	                	<option value="S" <% if (msgRcd.getE01IBSPER().equals("S")) out.print("selected"); %>>Semanal</option>
	                	<option value="Q" <% if (msgRcd.getE01IBSPER().equals("Q")) out.print("selected"); %>>Quincenal</option>
	                	<option value="M" <% if (msgRcd.getE01IBSPER().equals("M")) out.print("selected"); %>>Mensual</option>
	                	<option value="T" <% if (msgRcd.getE01IBSPER().equals("T")) out.print("selected"); %>>Trimestral</option>
	                	<option value="E" <% if (msgRcd.getE01IBSPER().equals("E")) out.print("selected"); %>>Semestral</option>
	                	<option value="T" <% if (msgRcd.getE01IBSPER().equals("Y")) out.print("selected"); %>>Anual</option>
	                	<option value="B" <% if (msgRcd.getE01IBSPER().equals("B")) out.print("selected"); %>>Por Demanda</option>
	                	<option value="O" <% if (msgRcd.getE01IBSPER().equals("O")) out.print("selected"); %>>Otro</option>
           			</select><%=mandatory %>
				</td>
            	<td nowrap width=10% align="right">Parámetros : </td>
            	<td  nowrap width=40% align="left">
            		<select name="E01IBSPRM" <%=disabled %>>
          	  		<option value="Y" <% if (msgRcd.getE01IBSPRM().equals("Y")) out.print("selected"); %> >SI</option>
                	<option value="N" <% if (msgRcd.getE01IBSPRM().equals("N")) out.print("selected"); %>>NO</option>
           			</select><%=mandatory %>
       			</td>
	  		</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Programa a ejecutar : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01IBSPRG" size="12" maxlength="10" value="<%=msgRcd.getE01IBSPRG()%>" <%= read %>>
				</td>
				<td nowrap width=10% align="right"></td>
				<td  nowrap width=40% align="left">
				</td>
			</tr>
   		</table> 
      </td>  
    </tr>
  </table>
   	
<br>
	
	<table width="100%">		
  	<tr>
  		<td width="50%">
  		<% if ((userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")) && (currUser.getE01AUT().equals("A")))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= msgRcd.getE01CUS()%>
			</td> 
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01MUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left"> 
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01CDM()),Integer.parseInt(msgRcd.getE01CDD()),Integer.parseInt(msgRcd.getE01CDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01MDM()),Integer.parseInt(msgRcd.getE01MDD()),Integer.parseInt(msgRcd.getE01MDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01CTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01MTM()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  
</form>
</body>

	<SCRIPT type="text/javascript">
		
	</SCRIPT>

</html>
