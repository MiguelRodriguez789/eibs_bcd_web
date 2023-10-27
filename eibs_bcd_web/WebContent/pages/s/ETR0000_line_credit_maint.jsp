<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Treasury - Credit Lines</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.ELN000001Message" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<h3 align="center">Tesorería - Líneas de Crédito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="line_credit_maint.jsp,ETR0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSETR0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="45">
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="8%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="17%" align="left">
            	<input type="text" name="E01WLNCUN" size="10" maxlength="9" value="<%= msg.getE01WLNCUN().trim()%>" readonly >
            </td>
            <td nowrap width="8%" > 
              <div align="right"><b>Línea : </b></div>
            </td>
            <td nowrap width="7%" >
            <input type="text" name="E01WLNNUM" size="5" maxlength="4" value="<%= msg.getE01WLNNUM().trim()%>" readonly >
             </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="4" width="48%" > 
              <div align="left"> <%= msg.getE01CUSNA1().trim()%> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Información Básica </h4>
    <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%" > 
              <div align="right">Tipo de Línea : </div>
            </td>
            <td nowrap width="26%" > 
              <input type="text" readonly name="E01WLNTYL" size="4" maxlength="3" value="TRS">
            </td>
            <td nowrap width="23%" > 
              <div align="right">Monto Aprobado :</div>
            </td>
            <td nowrap width="22%" > 
              <input type="text" name="E01WLNAMN" size="15" maxlength="15" value="<%= msg.getE01WLNAMN().trim()%>"  onKeyPress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="26%" > 
  				<eibsinput:date name="msg" fn_year="E01WLNOPY" fn_month="E01WLNOPM" fn_day="E01WLNOPD" required="true"/>
            </td>
            <td nowrap width="23%" > 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="22%" > 
  				<eibsinput:date name="msg" fn_year="E01WLNMTY" fn_month="E01WLNMTM" fn_day="E01WLNMTD" required="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" > 
              <div align="right">Autorizado por :</div>
            </td>
            <td nowrap width="26%" > 
              <input type="text" name="E01WLNABY" size="26" maxlength="25" value="<%= msg.getE01WLNABY().trim()%>" >
            </td>
            <td nowrap width="23%" > 
              <div align="right">Fecha de Autorización :</div>
            </td>
            <td nowrap width="22%" > 
  				<eibsinput:date name="msg" fn_year="E01WLNAUY" fn_month="E01WLNAUM" fn_day="E01WLNAUD" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" >
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap colspan="3" >
            	<input type="text" name="E01WLNDC1" size="45" maxlength="45" value="<%= msg.getE01WLNDC1().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
</body>
</html>
