<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ page import = "java.util.Iterator, com.datapro.eibs.reporter.model.ModuleDTO, com.datapro.eibs.reporter.model.ModuleFieldDTO" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA20002" scope="request" />

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

<script type="text/javascript">
	function editRecord(id) {
		location.href='<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=40&idmfl=' + id; 
	}	
</script>

</head>

<%
	ModuleDTO module = msg.getModule();
%>

<body onload="document.forms[0].MODDSC.focus();">
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
if (error.getERWRNG() != null && error.getERWRNG().equals("K")) {
	error.setERWRNG("");
	out.println("<script type=\"text/javascript\">");
    out.println("alert('Operación exitosa.');");
	out.println("</script>");
}
%>
<h3 class="h3title">Mantenimiento de M&oacute;dulos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="maint_module, LRGA200"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA200">

<input type="hidden" name="SCREEN" value="20">

  <h4>Datos del M&oacute;dulo</h4>
    <div align="left">
      
    <table class="tableinfo" >
      <tr > 
          <td nowrap align="center">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="25%"> 
                  <div align="right">C&oacute;digo del M&oacute;dulo :</div>
                </td>
                <td nowrap colspan="4">
                  <input type="hidden" name="ID_MOD" value="<%= module.getID_MOD()%>">
                  <%= module.getID_MOD()%> </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="25%"> 
                  <div align="right">Descripci&oacute;n :</div>
                </td>
                <td nowrap colspan=3> 
                  <input type="text" name="MODDSC" size="35" maxlength="30" value="<%= module.getMODDSC().trim()%>">&nbsp;
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="25%"> 
                  <div align="right">Archivos :</div>
                </td>
                <td nowrap colspan=3> 
                	<textarea name="ENTSTR" cols="50" rows="5" readonly="readonly"><%= module.getENTSTR().trim()%></textarea>
                </td>
              </tr>
              <tr id="trclear">
                <td nowrap width="25%"> 
                  <div align="right">Relaciones :</div>
                </td>
                <td nowrap colspan=3> 
                	<textarea name="RELSTR" cols="50" rows="5" readonly="readonly"><%= module.getRELSTR().trim()%></textarea>
                </td>
              </tr>
<%--          <tr id="trdark"> 
                <td nowrap width="25%" > 
                  <div align="right">Tipo de Acceso :</div>
                </td>
                <td nowrap colspan=3> 
                  <p> 
                    <input type="radio" name="PUBMOD" value="0" <%if (module.getPUBMOD().equals("0")) out.print("checked"); %>>
                    Privado 
                    <input type="radio" name="PUBMOD" value="1" <%if (!module.getPUBMOD().equals("0")) out.print("checked"); %>>
                    P&uacute;blico 
                    </p>
                </td>
              </tr>
--%>              
              <tr id="trdark"> 
                <td nowrap width="25%"> 
                  <div align="right">Estado de Accesibilidad:</div>
                </td>
                <td nowrap colspan=3> 
                  <p> 
                    <input type="radio" name="ACTIVE" value="1" <%if (module.getACTIVE().equals("1")) out.print("checked"); %>>
                    Activo 
                    <input type="radio" name="ACTIVE" value="0" <%if (!module.getACTIVE().equals("1")) out.print("checked"); %>>
                    Inactivo 
                    </p>
                    <input type="hidden" name="PUBMOD" value="0">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
   </div>
<br>

<table border="0" cellspacing="0" cellpadding="0"  class="actionButtons">		
  	<tr>
  		<td width="100%" align="center">
     		<input id="EIBSBTN" type="button" name="Submit0" value="Comprobar" onclick="javascript:goAction(31);">
     		&nbsp;&nbsp;&nbsp;&nbsp;  		
     		<input id="EIBSBTN" type="button" name="Submit1" value="Enviar" onclick="javascript:goAction(32);">
     		&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="EIBSBTN" type="button" name="Submit2" value="Retornar" onclick="javascript:goAction(20);">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="EIBSBTN" type="button" name="Submit3" value="Nuevo Campo" onclick="javascript:goAction(42);">
  		</td>  		
  	</tr>	
</table>	
<br>
<h4>Campos disponibles</h4>

<%
	String val = "";
	String fieldList = "";
	if (msg.getModuleFieldList()!=null && msg.getModuleFieldList().size() > 0)
	{
		int ix = 0;
	%>
	<div style="width: 100%;" align="center" class="dataContent">
		<display:table name="requestScope.msg.moduleFieldList" uid="result" pagesize="30"
		requestURI="" style="width:100%;" class="dataTable" export="false" >
			<display:column title="C&oacute;digo" class="r" >
			<a href="#" onclick="editRecord('${result.ID_MFL}');return false;">
				<c:out value="${result.ID_MFL}"/>
			</a>
			</display:column>
			<display:column title="Descripci&oacute;n" class="l">
			<a href="#" onclick="editRecord('${result.ID_MFL}');return false;">
				<%= ( (ModuleFieldDTO) pageContext.getAttribute("result")).getFLDDSC() %>			
			</a>
			</display:column>
			<display:column title="Etiqueta" class="l">
			<a href="#" onclick="editRecord('${result.ID_MFL}');return false;">
				<%= ( (ModuleFieldDTO) pageContext.getAttribute("result")).getFLDLBL() %>			
			</a>
			</display:column>			
			<display:column title="Formato de Dato" class="l">
			<a href="#" onclick="editRecord('${result.ID_MFL}');return false;">
				<%= ( (ModuleFieldDTO) pageContext.getAttribute("result")).getDATTYP() %>
			</a>
			</display:column>
			<display:column title="Activo" class="c">
			<a href="#" onclick="editRecord('${result.ID_MFL}');return false;">
				<c:if test="${result.ACTIVE=='0'}">No</c:if>
				<c:if test="${result.ACTIVE=='1'}">Si</c:if>
			</a>
			</display:column>
			<%
				ix++;
				fieldList = fieldList.concat(( (ModuleFieldDTO) pageContext.getAttribute("result")).getFLDDSC());
				if (ix < msg.getModuleFieldListSize())
					fieldList = fieldList.concat(", ");
			%>						
	</display:table></div>
	<% } else { %>
	<p><b>No hay campos creados para este M&oacute;dulo.</b></p>
	<% }  %>
<input type="hidden" name="fieldList" value="<%= fieldList%>">
</form>
<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>