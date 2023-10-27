<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ page import = "java.util.Iterator, com.datapro.eibs.reporter.model.ModuleDTO, com.datapro.eibs.reporter.model.ModuleFieldDTO" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA20003" scope="request" />

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

<script type="text/javascript">
	function loadAvailableFieldsWindow() {
		page = "<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA210?SCREEN=30&tables=" + encodeURIComponent(document.forms[0].ENTSTR.value);
		CenterWindow(page,800,600,3);		
	}
</script>

</head>
<%
	ModuleDTO module = msg.getModule();
	ModuleFieldDTO field = msg.getModuleField();
	pageContext.setAttribute("field", field);
%>
<body>
<% 
if (!error.getERRNUM().equals("0")){
	error.setERRNUM("0");
	out.println("<script type=\"text/javascript\">");
    out.println("showErrors();");
	out.println("</script>");
}
if (error.getERWRNG() != null && error.getERWRNG().equals("T")) {
	error.setERWRNG("");
	out.println("<script type=\"text/javascript\">");
    out.println("alert('La Sintaxis es correcta.');");
	out.println("</script>");
}
%>
<h3 class="h3title">Creaci&oacute;n de Campos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="new_modulefield, LRGA200"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA200">

<input type="hidden" name="SCREEN">
<input type="hidden" name="ID_MOD" value="<%= field.getID_MOD()%>">
<input type="hidden" name="ALSTNG" value="1">
<input type="hidden" name="MNDTRY" value="0">

  <table class="tableinfo" cellspacing="0" cellpadding="4" width="100%" border="0">
  	<tr id="trdark">
  		<td nowrap align="right" width="10%"><b>M&oacute;dulo :</b></Td>
  		<td nowrap align="left" width="90%">
  			<input type="text" name="ID_MOD" size="5" value="<%=module.getID_MOD()%>" readonly>
  			<input type="text" name="MODDSC" size="35" value="<%=module.getMODDSC()%>" readonly>
  		</td>
  	</tr>
  	<tr id="trdark">
  		<td nowrap align="right" width="10%"><b>Tablas :</b></td>
  		<td nowrap align="left" width="90%">
  			<input type="text" name="ENTSTR" size="100" value="<%=module.getENTSTR().trim()%>" readonly>
  			<input type="hidden" name="RELSTR" value="<%=module.getRELSTR().trim()%>">
  		</td>
  	</tr>
  </table>

  <h4>Datos del Campo</h4>
    <div align="left">
      
    <table class="tableinfo" >
      <tr > 
          <td nowrap align="center"> 
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="25%"> 
                  <div align="right">C&oacute;digo del Campo :</div>
                </td>
                <td nowrap colspan="4">
                  <input type="hidden" name="ID_MFL" value="<%= field.getID_MFL()%>">
                  <i>&lt;NUEVO&gt;</i> 
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="25%"> 
                  <div align="right">Descripci&oacute;n :</div>
                </td>
                <td nowrap colspan=3>
                  	<input type="text" id="idFldDsc" name="FLDDSC" size="37" maxlength="35" value="<%= field.getFLDDSC().trim()%>" readonly>
                  	&nbsp;
                  	<input type="button" value="Ver campos disponibles" onclick="loadAvailableFieldsWindow();">
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="25%"> 
                  <div align="right">Etiqueta :</div>
                </td>
                <td nowrap colspan=3> 
                  <input type="text" id="idFldLbl" name="FLDLBL" size="35" maxlength="30" value="<c:out value='${pageScope.field.FLDLBL}'/>">
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="25%" > 
                  <div align="right">Formato de Presentaci&oacute;n :</div>
                </td>
                <td nowrap colspan=3>
                	<select name="DATTYP" id="idDatTyp">
                		<option value="">Seleccione</option>
                		<option value="CHAR" <%= field.getDATTYP().equals("CHAR") ? "selected" : "" %>>Caracter</option>
                		<option value="PLAIN_NUMBER" <%= field.getDATTYP().equals("PLAIN_NUMBER") ? "selected" : "" %>>N&uacute;mero Gen&eacute;rico</option>
                		<option value="DECIMAL" <%= field.getDATTYP().equals("DECIMAL") ? "selected" : "" %>>Decimal</option>
                	</select> 
					<input type="hidden" name="XDATTYP" value="<%= field.getDATTYP().trim()%>">
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="25%" > 
                  <div align="right">Disponible para Filtrar :</div>
                </td>
                <td nowrap colspan=3> 
                  <p> 
                    <input type="radio" name="AWHERE" value="1" <%if (field.getAWHERE().equals("1")) out.print("checked"); %>>
                    Si 
                    <input type="radio" name="AWHERE" value="0" <%if (!field.getAWHERE().equals("1")) out.print("checked"); %>>
                    No 
                    </p>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="25%" > 
                  <div align="right">Disponible para Agrupar :</div>
                </td>
                <td nowrap colspan=3> 
                  <p> 
                    <input type="radio" name="AGRPBY" value="1" <%if (field.getAGRPBY().equals("1")) out.print("checked"); %>>
                    Si 
                    <input type="radio" name="AGRPBY" value="0" <%if (!field.getAGRPBY().equals("1")) out.print("checked"); %>>
                    No 
                    </p>
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="25%" > 
                  <div align="right">Disponible para Funci&oacute;n de Grupo :</div>
                </td>
                <td nowrap colspan=3> 
                  <p> 
                    <input type="radio" name="AGRFUN" value="1" <%if (field.getAGRFUN().equals("1")) out.print("checked"); %>>
                    Si 
                    <input type="radio" name="AGRFUN" value="0" <%if (!field.getAGRFUN().equals("1")) out.print("checked"); %>>
                    No 
                    </p>
                </td>
              </tr>              
              <tr id="trclear"> 
                <td nowrap width="25%"> 
                  <div align="right">Estado de Accesibilidad:</div>
                </td>
                <td nowrap colspan=3> 
                  <p> 
                    <input type="radio" name="ACTIVE" value="1" <%if (field.getACTIVE().equals("1")) out.print("checked"); %>>
                    Activo 
                    <input type="radio" name="ACTIVE" value="0" <%if (!field.getACTIVE().equals("1")) out.print("checked"); %>>
                    Inactivo 
                    </p>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
   </div>
<br>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="actionButtons">		
  	<tr>
  		<td width="100%" align="center">
			<input id="EIBSBTN" type="button" name="Submit0" value="Comprobar" onclick="javascript:goAction(43);">
     		&nbsp;&nbsp;&nbsp;&nbsp;
     		<input id="EIBSBTN" type="button" name="Submit1" value="Enviar" onclick="javascript:goAction(44);">
     		&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="EIBSBTN" type="button" name="Submit2" value="Retornar" onclick="javascript:goAction(30);">
  		</td>  		
  	</tr>	
</table>	

<br>

</form>
<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>