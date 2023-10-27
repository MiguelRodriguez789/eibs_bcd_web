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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ERP000003Message"  scope="session" />
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

<h3 align="center">Parámetro para Reportes / Procesos  
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="parameter.jsp, ERP0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSERP0000" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="25">
  <INPUT TYPE=HIDDEN NAME="D03PMSDDS" VALUE="">
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
 			<tr id="trdark">
				<td nowrap width=10% align="right">Parámetro : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03PMSCOD" size="4" maxlength="2" value="<%=msgRcd.getE03PMSCOD()%>" <%=readNew %>>
				</td>
				<td nowrap width=10% align="right">Descripción : </td>
				<td  nowrap width=40% align="left">
					<input type="text" name="E03PMSDSC" size="55" maxlength="50" value="<%=msgRcd.getE03PMSDSC()%>" <%= read %>>
				</td>
			</tr>	  		
			<tr id="trclear">
				<td nowrap width=10% align="right">Idioma : </td>
				<td nowrap width=40% align="left">
					<select name="E03PMSLIF" <%=disabledNew%>>
          	  		<option value="S" <% if (msgRcd.getE03PMSLIF().equals("S")) out.print("selected"); %>>Español</option>
                	<option value="E" <% if (msgRcd.getE03PMSLIF().equals("E")) out.print("selected"); %>>Ingles</option>
           			</select>	
				</td>
				<td nowrap width=10% align="right">Tipo : </td>
				<td  nowrap width=40% align="left">
					<select name="E03PMSPTY" <%=disabled%>>
          	  		<option value="A" <% if (msgRcd.getE03PMSPTY().equals("A")) out.print("selected"); %>>Alfanúmerico</option>
                	<option value="N" <% if (msgRcd.getE03PMSPTY().equals("N")) out.print("selected"); %>>Númerico</option>
                	<option value="Z" <% if (msgRcd.getE03PMSPTY().equals("Z")) out.print("selected"); %>>Númerico con decimales</option>
                	<option value="D" <% if (msgRcd.getE03PMSPTY().equals("D")) out.print("selected"); %>>Fecha</option>
           			</select>	
				</td>
			</tr>
	  		<tr id="trdark">
				<td nowrap width=10% align="right">Longitud : </td>
				<td nowrap width=40% align="left">
					<eibsinput:text name="msgRcd" property="E03PMSPLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" required="true" readonly="<%=isReadOnly %>" />
				</td>
				<td nowrap width=10% align="right">Decimales : </td>
				<td  nowrap width=40% align="left">
					<eibsinput:text name="msgRcd" property="E03PMSNDC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="false" readonly="<%=isReadOnly %>" />
				</td>
			</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Script de Ayuda : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03PMSDDS" size="66" maxlength="64" value="<%=msgRcd.getE03PMSDDS()%>" <%= read %> style="text-transform: none">
					<% if ( !isReadOnly) {%>
              		<a href="javascript:GetWebUrl('E03PMSDDS','D03PMSDDS')" >
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            		<% } %>
				</td>
				<td nowrap width=10% align="right"></td>
				<td nowrap width=40% align="left">
					* El Script debe ser general, es decir solo devuelve un valor a este parámetro sin<BR>
					  enviar filtros/selección al Script. <BR>
					* Si necesita una ayuda específica con parámetros, debe ingresarla en la pantalla de<BR>
					  definición del reporte especifico. <BR>
					* Si existe una Script específico en los parámetros del reporte, el script que se<BR>
					  defina aquí no será utilizado. <BR>
					* Los parámetros tipo fecha no llevan Script, ya que se utilizará el estándar en<BR>
					  formato de la institución.
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
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(25);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(21);" 
			<% } else { %>
				onClick="goAction(26);" 
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
            	<%= msgRcd.getE03CUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE03MUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left"> 
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE03CDM()),Integer.parseInt(msgRcd.getE03CDD()),Integer.parseInt(msgRcd.getE03CDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE03MDM()),Integer.parseInt(msgRcd.getE03MDD()),Integer.parseInt(msgRcd.getE03MDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE03CTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE03MTM()%>
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
