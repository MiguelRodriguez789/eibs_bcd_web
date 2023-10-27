<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tablas de Cuentas de Revelacion</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<META name="GENERATOR" content="IBM WebSphere Studio">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "EDL0545msg" class= "datapro.eibs.beans.EDL054501Message"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

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
<h3 align="center">Parametros de Cartera Sustitutiva<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_sel_tables.jsp, EDL0545"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0545" >
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
      <eibsinput:text property="E01CSTBNK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" /><br>
    </td>
  </tr>  
  
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
