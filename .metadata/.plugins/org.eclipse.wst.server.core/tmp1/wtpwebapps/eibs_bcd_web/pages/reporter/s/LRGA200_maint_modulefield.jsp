<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ page import = "java.util.Iterator, com.datapro.eibs.reporter.model.ModuleFieldDTO" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA20003" scope="request" />

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

</head>
<%
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
%>
<h3 class="h3title">Mantenimiento de M&oacute;dulos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="maint_modulefield, LRGA200"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA200">

<input type="hidden" name="SCREEN" value="40">
<input type="hidden" name="ID_MOD" value="<%= field.getID_MOD()%>">
<input type="hidden" name="ALSTNG" value="1">
<input type="hidden" name="MNDTRY" value="0">

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
                  <%= field.getID_MFL()%> 
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="25%"> 
                  <div align="right">Descripci&oacute;n :</div>
                </td>
                <td nowrap colspan=3>
                	<%= field.getFLDDSC().trim()%>
                  	<input type="hidden" name="FLDDSC" value="<%= field.getFLDDSC().trim()%>">
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="25%"> 
                  <div align="right">Etiqueta :</div>
                </td>
                <td nowrap colspan=3> 
                  <input type="text" name="FLDLBL" size="35" maxlength="30" value="<c:out value='${fn:trim(pageScope.field.FLDLBL)}'/>">
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="25%" > 
                  <div align="right">Formato de Dato :</div>
                </td>
                <td nowrap colspan=3>
                	<select name="DATTYP">
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
     		<input id="EIBSBTN" type="button" name="Submit1" value="Enviar" onclick="javascript:goAction(41);">
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