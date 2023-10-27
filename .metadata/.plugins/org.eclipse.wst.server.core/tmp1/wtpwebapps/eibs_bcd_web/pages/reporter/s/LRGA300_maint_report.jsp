<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isELIgnored="false" %>
<%@ page import = "java.util.Iterator, com.datapro.eibs.reporter.model.ReportDTO" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRGA30003" scope="request" />

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

</head>

<%
	ReportDTO report = msg.getReport();
%>

<body onload="document.forms[0].RPTDSC.focus();">
<% 
if (!error.getERRNUM().equals("0")){
	error.setERRNUM("0");
	out.println("<script type=\"text/javascript\">");
    out.println("showErrors();");
	out.println("</script>");
}
if (error.getERWRNG() != null && error.getERWRNG().equals("K")) {
	error.setERWRNG("");
	out.println("<script type=\"text/javascript\">");
    out.println("alert('Actualización exitosa.');");
	out.println("</script>");
}
%>
<h3 class="h3title">Mantenimiento de Reportes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="maint_report, LRGA300"></h3>
<hr class="raya">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRGA300">

<input type="hidden" name="SCREEN" value="33">

<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo">
	<tr id="trdark">
		<TD nowrap width="16%" align="right"><B>C&oacute;digo del Reporte :</B></TD>
		<TD nowrap width="19%"><INPUT type="text" name="ID_REP" size="4" maxlength="4" value="<%= report.getID_REP()%>" readonly></TD>
		<TD nowrap align="right" width="18%"><B>M&oacute;dulo : </B></TD>
		<TD nowrap width="16%"><input type="text" name="ID_MOD" size="35" maxlength="30" value="<%= report.getID_MOD()%>" readonly>
		<TD nowrap width="16%" align="right"><B>Tipo de Reporte : </B></TD>
		<TD nowrap width="16%"><input type="text" name="RPTTYP" size="35" maxlength="30" value="<%= report.getRPTTYP().equals("agg") ? "CONSOLIDADO" : "REGULAR" %>" readonly></TD>
	</tr>
</table>	


  <h4>Datos del Reporte</h4>
    <div align="left">
      
    <table class="tableinfo" >
      <tr > 
          <td nowrap align="center">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="25%"> 
                  <div align="right">Descripci&oacute;n :</div>
                </td>
                <td nowrap colspan=3> 
                  <input type="text" name="RPTDSC" size="100" maxlength="90" value="<%= report.getRPTDSC().trim()%>">&nbsp;
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
                </td>
              </tr>
	          <tr id="trclear"> 
                <td nowrap width="25%" > 
                  <div align="right">Tipo de Acceso :</div>
                </td>
                <td nowrap colspan=3> 
                  <p> 
                    <input type="radio" name="PUBREP" value="0" <%if (report.getPUBREP().equals("0")) out.print("checked"); %>>
                    Privado 
                    <input type="radio" name="PUBREP" value="1" <%if (!report.getPUBREP().equals("0")) out.print("checked"); %>>
                    P&uacute;blico 
                    </p>
                </td>
              </tr>
              
              <tr id="trdark"> 
                <td nowrap width="25%"> 
                  <div align="right">Estado de Accesibilidad:</div>
                </td>
                <td nowrap colspan=3> 
                  <p> 
                    <input type="radio" name="ACTIVE" value="1" <%if (report.getACTIVE().equals("1")) out.print("checked"); %>>
                    Activo 
                    <input type="radio" name="ACTIVE" value="0" <%if (!report.getACTIVE().equals("1")) out.print("checked"); %>>
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

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color: #fff;">		
  	<tr>
  		<td width="100%" align="center">
     		<input id="EIBSBTN" type="button" name="Submit1" value="Enviar" onclick="javascript:goAction(33);">
     		&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="EIBSBTN" type="button" name="Submit2" value="Retornar" onclick="javascript:goAction(10);">
  		</td>  		
  	</tr>	
</table>	
<br>
</form>
<%@ include file = "LRG0001_include_common.jsp" %>
</body>
</html>