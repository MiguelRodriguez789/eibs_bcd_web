<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util"%>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>Tablas de Cuentas de Revelacion</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<META name="GENERATOR" content="IBM WebSphere Studio">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="EDL0540msg" class="datapro.eibs.beans.EDL054001Message" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%> 
<h3 align="center">Tablas de Cuentas de Revelacion
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_sel_tables.jsp, EDL0540"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0540" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  <INPUT TYPE=HIDDEN NAME="SEARCHC" VALUE="">

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
  <tr >
    <td align="right" width="50%" nowrap>Banco :&nbsp;</td>
    <td  width="50%" valign="top">
      <eibsinput:text property="E01DLVBNK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" /><br>
    </td>
  </tr>  
  <%--
  <tr >
    <td align="right" width="50%" nowrap><br>Tipo de Producto :&nbsp;<br>&nbsp;</td>
    <td  width="50%" >
      <input type="text" name="E01DLVTYP" size=5 maxlength="4" value="<%=EDL0540msg.getE01DLVTYP()%>">
      <a href="javascript:GetProductRates('E01DLVTYP','10')"> 
      <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
    </td>
  </tr>
  --%>
  <tr align="center" >
    <td nowrap colspan="2" align="center">
    <div id="DIVSUBMIT" align="center">
      <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
    </div>
    </td>
  </tr>
</table>

</form>
</body>
</html>
