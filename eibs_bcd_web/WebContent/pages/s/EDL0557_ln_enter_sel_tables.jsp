<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tabla de Excepciones Ingreso de Creditos</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<META name="GENERATOR" content="IBM WebSphere Studio">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "RecData" class= "datapro.eibs.beans.EDL055701Message"  scope="session"/>

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
<h3 align="center">Tabla de Excepciones Ingreso de Creditos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_sel_tables.jsp, EDL0557"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0557" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  <INPUT TYPE=HIDDEN NAME="SEARCHC" VALUE="">

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
  <tr >
    <td align="right" width="50%" nowrap>Seleccione :&nbsp;</td>
    <td  width="50%" valign="top">
      <SELECT name="E01EXITYP">
						<OPTION value="01" <%if (RecData.getE01EXITYP().equals("01")) { out.print("selected"); }%>>Cliente </OPTION>
						<OPTION value="02" <%if (RecData.getE01EXITYP().equals("02")) { out.print("selected"); }%>>Producto </OPTION>
						<OPTION value="03" <%if (RecData.getE01EXITYP().equals("03")) { out.print("selected"); }%>>Cuenta </OPTION>						
					</SELECT>
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
