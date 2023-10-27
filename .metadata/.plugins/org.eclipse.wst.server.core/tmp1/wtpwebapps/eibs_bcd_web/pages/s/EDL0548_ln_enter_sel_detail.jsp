<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Reservas Contraparte</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<META name="GENERATOR" content="IBM WebSphere Studio">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="recData" class="datapro.eibs.beans.EDL054802Message" scope="session"/>

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
<h3 align="center">Reservas Contraparte<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_sel_detail.jsp, EDL0548"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0548" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="202">
  <INPUT TYPE=HIDDEN NAME="E02CTLCUN" id="E02CTLCUN" VALUE="0">
  
  <p>&nbsp;</p>
  <p>&nbsp;</p>

  <table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
    <tr >
      <td align="right" width="50%" nowrap> Ingrese el N&uacute;mero de Proyecto : &nbsp;</td>
      <td  width="50%" valign="top">
        <eibsinput:text name="recData" property="E02CTLNUM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" />
        <a href="javascript:GetContraparte('E02CTLNUM','',' ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a>
      </td>
    </tr>  
    <tr >
      <td ><p>&nbsp;</p></td>
      <td ><p>&nbsp;</p></td>
    </tr>    
    <tr >
      <td align="right" width="50%" nowrap> Ingrese el N&uacute;mero de Reserva : &nbsp;</td>
      <td  width="50%" valign="top">
         <eibsinput:text name="lnBasic" property="E02CTLSEQ" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" />&nbsp;(0 = Nuevo)
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
