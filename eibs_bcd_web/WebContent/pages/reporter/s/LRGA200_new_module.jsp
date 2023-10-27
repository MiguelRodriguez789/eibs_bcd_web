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
	function loadSchemaWindow() {
		page = "<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA210?SCREEN=10";
		CenterWindow(page,800,600,3);		
	}
	
	function setRelationshipsWindow() {
		page = "<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA210?SCREEN=20&tables=" + encodeURIComponent(document.forms[0].ENTSTR.value);
		CenterWindow(page,800,600,3);			
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
%>
<h3 class="h3title">Creaci&oacute;n de M&oacute;dulo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="new_module, LRGA200"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA200">

<input type="hidden" name="SCREEN">
<input type="hidden" name="MODCOD" value="">
<input type="hidden" name="PUBMOD" value="0">

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
                	<i>&lt;NUEVO&gt;</i> 
                  	<input type="hidden" name="ID_MOD" value="<%=module.getID_MOD()%>">
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
                  <div align="right">Tablas del IBS :</div>
                </td>
                <td nowrap colspan="3" valign="top"> 
                	<textarea id="idEntStr" name="ENTSTR" cols="50" rows="5" readonly><%= module.getENTSTR().trim()%></textarea>
	                <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
	                &nbsp;<input type="button" class="styled-button-Search" value="Ver Schema" onclick="loadSchemaWindow();">
                </td>
              </tr>
              <tr id="trclear">
                <td nowrap width="25%"> 
                  <div align="right">Relaciones :</div>
                </td>
                <td nowrap colspan="3" valign="top"> 
                	<textarea id="idRelStr" name="RELSTR" cols="50" rows="5" readonly><%= module.getRELSTR().trim()%></textarea>
                    &nbsp;<input type="button" class="styled-button-Search" value="Definir Relaciones" onclick="setRelationshipsWindow();">
                </td>
              </tr>
<%--           <tr id="trdark"> 
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
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
   </div>
<br>

<table border="0" cellspacing="0" cellpadding="0" class="actionButtons">		
  	<tr>
  		<td width="100%" align="center">
     		<input id="EIBSBTN" type="button" name="Submit0" value="Comprobar" onclick="javascript:goAction(36);">
     		&nbsp;&nbsp;&nbsp;&nbsp;  		
     		<input id="EIBSBTN" type="button" name="Submit1" value="Enviar" onclick="javascript:goAction(37);">
     		&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="EIBSBTN" type="button" name="Submit2" value="Retornar" onclick="javascript:goAction(10);">
  		</td>  		
  	</tr>	
</table>	
<br>
<input type="hidden" name="fieldList" value="*">
</form>
<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>