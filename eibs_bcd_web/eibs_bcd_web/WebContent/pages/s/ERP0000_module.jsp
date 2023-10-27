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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ERP000004Message"  scope="session" />
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

<h3 align="center">Módulo para Reportes / Procesos  
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="module.jsp, ERP0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSERP0000" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="35">
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
 			<tr id="trdark">
				<td nowrap width=10% align="right">Módulo : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E04MODRPT" size="4" maxlength="2" value="<%=msgRcd.getE04MODRPT()%>" <%=readNew %>>
				</td>
				<td nowrap width=10% align="right">Descripción : </td>
				<td  nowrap width=40% align="left">
					<input type="text" id="E04MODDSC" name="E04MODDSC" size="55" maxlength="50" value="<%= msgRcd.getE04MODDSC().trim()%>" style="text-transform: none" <%=read %>>
				</td>
			</tr>	  		
			<tr id="trclear">
				<td nowrap width=10% align="right">Idioma : </td>
				<td nowrap width=40% align="left">
					<select name="E04MODLIF" <%=disabledNew%>>
          	  		<option value="S" <% if (msgRcd.getE04MODLIF().equals("S")) out.print("selected"); %>>Español</option>
                	<option value="E" <% if (msgRcd.getE04MODLIF().equals("E")) out.print("selected"); %>>Ingles</option>
           			</select>	
				</td>
				<td nowrap width=10% align="right"></td>
				<td  nowrap width=40% align="left">
				</td>
			</tr>
	  		<tr id="trdark">
				<td nowrap width=10% align="right">Menú : </td>
				<td nowrap width=40% align="left">
					<eibsinput:text name="msgRcd" property="E04MODMNU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TEXT %>" size="7" maxlength="6" required="false" readonly="<%=isReadOnly %>" />
					<% if ( !isReadOnly) {%>
              		<a href="javascript:GetWebMnu('E04MODMNU',' ')" >
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            		<% } %>
				</td>
				<td nowrap width=10% align="right">Opción : </td>
				<td  nowrap width=40% align="left">
					<eibsinput:text name="msgRcd" property="E04MODDEN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" required="false" readonly="<%=isReadOnly %>" />
					<% if ( !isReadOnly) {%>
              		<a href="javascript:GetWebMnuOpt(document.forms[0].E04MODMNU.value,' ',' ')" >
                	<img src="<%=request.getContextPath()%>/images/1aquire.gif" title="Consulta" align="bottom" border="0" ></a>
            		<% } %>
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
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(35);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(31);" 
			<% } else { %>
				onClick="goAction(36);" 
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
            	<%= msgRcd.getE04CUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE04MUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left"> 
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE04CDM()),Integer.parseInt(msgRcd.getE04CDD()),Integer.parseInt(msgRcd.getE04CDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE04MDM()),Integer.parseInt(msgRcd.getE04MDD()),Integer.parseInt(msgRcd.getE04MDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE04CTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE04MTM()%>
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
