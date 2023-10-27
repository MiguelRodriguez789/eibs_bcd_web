<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Matenimiento Tablas de Opciones</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="refCodes" class="datapro.eibs.beans.EUT011502Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
</head>

<body>

<SCRIPT type="text/javascript">

	function goSubmit() {
		var url = document.forms[0].E02COTGAD.value;
		url = url.replace(/javascript/gi, "jvscrpt");
		document.forms[0].E02COTGAD.value = url; 
		document.forms[0].submit();
	}

	function cancel() {
		document.forms[0].SCREEN.value = 8;
		document.forms[0].submit();
	}
   
</SCRIPT>

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	
	String readonly = "NEW".equals(userPO.getPurpose()) ? "" : "readonly";
%>

<h3 align="center"> Tabla de Opciones <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="eibs_paginas_option_maintenance.jsp, EUT0115"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEUT0115" >
  <input type=HIDDEN id="SCREEN" name="SCREEN" value="14">
  <input type=HIDDEN id="E02COILIF" name="E02COILIF" value="<%= refCodes.getE02COILIF().trim()%>">


	<% int row = 0;%>
	
  <table  class="tableinfo" height="10%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="10%" align="right"> Menu : 
              </td>
             <td nowrap width="10%" align="left">
                <input type="text" id="menu" name="menu" size="8" maxlength="3" value="<%= userPO.getHeader10().trim()%>" readonly>
             </td>
             <td nowrap width="10%" align="right"> Descripci&oacute;n : 
               </td>
             <td nowrap width="70%"align="left">
                <input type="text"  id="descri" name="descri" size="45" maxlength="40" value="<%= userPO.getHeader11().trim()%>" readonly>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
    <p>&nbsp;</p>
 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
             <td nowrap width="20%"> 
              	<div align="right">Numero de Opcion :</div>
             </td>
             
             <td nowrap width="80%">
                <div align="left"> 
                <input type="text" id="E02COIDEN" name="E02COIDEN" size="4" maxlength="3" value="<%= refCodes.getE02COIDEN().trim()%>" readonly onKeypress="enterInteger(event)">
              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="20%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
                <input type="text" id="E02COENDS" name="E02COENDS" size="100" maxlength="80" value="<%= refCodes.getE02COENDS().trim()%>" 
                	style="text-transform: none" >
              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="20%"> 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
              	<% 	if (userPO.getOption().trim().equals("Y") ){ %>
	                <select name="E02COIMFL">
          			<option value="I" <%if (refCodes.getE02COIMFL().equals("I")) { out.print("selected"); }%>>Consulta</option>
          			<option value="M" <%if (refCodes.getE02COIMFL().equals("M")) { out.print("selected"); }%>>Mantenimiento</option>
          			<option value="N" <%if (refCodes.getE02COIMFL().equals("N")) { out.print("selected"); }%>>Creación</option>
          			<option value="A" <%if (refCodes.getE02COIMFL().equals("A")) { out.print("selected"); }%>>Aprobación</option>
          			<option value="R" <%if (refCodes.getE02COIMFL().equals("R")) { out.print("selected"); }%>>Reporte</option>
          			<option value="P" <%if (refCodes.getE02COIMFL().equals("P")) { out.print("selected"); }%>>Proceso</option>
          			<option value="D" <%if (refCodes.getE02COIMFL().equals("D")) { out.print("selected"); }%>>Administración</option>
					</select> 
                <% 	} else {
    	            		if (refCodes.getE02COIMFL().equals("I")) out.print("Consulta");
    	            		if (refCodes.getE02COIMFL().equals("M")) out.print("Mantenimiento");
    	            		if (refCodes.getE02COIMFL().equals("N")) out.print("Creación");
    	            		if (refCodes.getE02COIMFL().equals("A")) out.print("Aprobación");
    	            		if (refCodes.getE02COIMFL().equals("R")) out.print("Reporte");
    	            		if (refCodes.getE02COIMFL().equals("P")) out.print("Proceso");
    	            		if (refCodes.getE02COIMFL().equals("D")) out.print("Administración"); 
                	} %>               
              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="20%"> 
              <div align="right">Direccion Destino :</div>
            </td>
            <td nowrap width="80%"> 
             <div align="left"> 
            <% 	if (userPO.getOption().trim().equals("Y") ){ %>
	                 <textarea id="E02COTGAD" name="E02COTGAD" rows="3" cols="80" style="text-transform: none"> <%= refCodes.getE02COTGAD().trim()%> </textarea>
			<% } else {%>
    	             <textarea id="E02COTGAD" name="E02COTGAD" rows="3" cols="80" style="text-transform: none" readonly> <%= refCodes.getE02COTGAD().trim()%> </textarea>
			<% } %>
             </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="20%"> 
              <div align="right">Posici&oacute;n Destino :</div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
                <% 	if (userPO.getOption().trim().equals("Y") ){ %>
	                 <input type="text" id="E02COTGPO" name="E02COTGPO" size="50" maxlength="50" value="<%= refCodes.getE02COTGPO().trim()%>"
                	style="text-transform: none" >
				<% } else {%>
    	             <input type="text" id="E02COTGPO" name="E02COTGPO" size="50" maxlength="50" value="<%= refCodes.getE02COTGPO().trim()%>"
                	style="text-transform: none" readonly>
				<% } %>
                
              </div>
            </td>
          </tr>
  </table>
 
</td>
</tr>
</table>
<div align="center">
    <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="goSubmit()">
    <input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="cancel()">
</div>
</form>
</body>
</html>