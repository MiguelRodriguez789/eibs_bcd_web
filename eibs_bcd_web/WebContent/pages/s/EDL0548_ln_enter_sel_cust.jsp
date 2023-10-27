<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Cupos Contraparte</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<META name="GENERATOR" content="IBM WebSphere Studio">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="recData" class="datapro.eibs.beans.EDL054801Message" scope="session"/>

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
<h3 align="center">Cupos Contraparte<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_sel_cust.jsp, EDL0548"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0548" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="115">
  
  <p>&nbsp;</p>
  <p>&nbsp;</p>

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
  <tr >
    <td align="right" width="50%" ><div align="right">Ingrese el Convenio :&nbsp;</div></td>
    <td width="50%" valign="top">
      <input type="text" name="E01CTPCNV" id="E01CTPCNV" size="5" maxlength="4" value="" >
      <a href="javascript:GetCodeDescDeal('E01CTPCNV','','')"><img id="HELP" src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
    </td>
  </tr>  
  <tr >
    <td ><p>&nbsp;</p></td>
    <td ><p>&nbsp;</p></td>
  </tr>    
  <tr >
    <td ><p>&nbsp;</p></td>
    <td ><p>&nbsp;</p></td>
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
