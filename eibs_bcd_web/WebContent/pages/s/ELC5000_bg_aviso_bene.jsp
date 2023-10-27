<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Boleta de Garantia</title>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "bolgaran" class= "datapro.eibs.beans.ELC500001Message"  scope="session" />
<jsp:useBean id= "bolprga" class= "datapro.eibs.beans.ELC500004Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
   builtNewMenu(bg_m_opt);
   initMenu();
</SCRIPT>

</head>
<BODY>
<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>
<h3 align="center">Aviso Pago Beneficiario<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_aviso_bene.jsp,ELC5000"></h3>
<hr size="4">

<FORM  METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5000">

<input type="hidden" name="SCREEN" value="21">


<table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
 	     <td align=right nowrap>Boleta :</td>
	     <td>
	      <input size="15" type="text" name="E04LCMACC" value="<%= bolgaran.getE01LCMACC().trim() %>" readonly>
	     </td>
	     <td align=right nowrap>Sucursal :</td>
         <td><input size="5" type="text" name="E01LCMBRN" maxlength="4" value="<%=bolgaran.getE01LCMBRN()%>"></td>

	</tr>
    <tr id=trclear>
         <td align=right nowrap>Producto :</td>
         <td colspan= 3>
         	<input size="5" type="text" name="E01LCMPRO" readonly value="<%= bolgaran.getE01LCMPRO()%>">
            <input size="35" type="text" name="E01PRDNME" readonly value="<%= bolgaran.getE01PRDNME()%>">
         </td>
    </tr>
    <tr id=trdark>
	      <td align=right nowrap>Fecha Emisión :</td>
	      <td>
	      <eibsinput:date name="bolgaran" fn_year="E01LCMIDY" fn_month="E01LCMIDM" fn_day="E01LCMIDD" readonly="true" />
            
		  </td>
	      <td align=right nowrap>Fecha Vcto. :</td>
          <td>
            <eibsinput:date name="bolgaran" fn_year="E01LCMEXY" fn_month="E01LCMEXM" fn_day="E01LCMEXD" readonly="true" />
            
          </td>
    </tr>
  </table>
  </td>
  </tr>
</table>
<h4>Datos Beneficiario</h4>
<table class=tableinfo>
  <tr>
   <td>
	<table width="100%" cellspacing="0" cellpadding="0">
    <tr id=trdark>
       <td width=40% align=right> Fecha de Aviso. :</td>
       <td>
         <eibsinput:date name="bolprga" fn_year="E04LCMCNY" fn_month="E04LCMCNM" fn_day="E04LCMCND"/>
            
       </td>
   </table>
  </td>
  </tr>
</table>
<P align="center">
	<INPUT type="submit" value="enviar" id="EIBSBTN">
</P>

</FORM>
</BODY>
</html>
