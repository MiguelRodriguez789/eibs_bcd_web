<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>

<title>Solicitud de Entrega</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX00001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>
<%  if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<H3 align="center">Mantenimiento de Activos Fijos y Amortizaciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_enter_maintenance,EFIX000"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX000">
  <p> 
    <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="400">
  </p>
  
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">Banco :
      </div>
      </td>
      <td nowrap width="50%"> 
	       <eibsinput:text name="fix" property="E01FIXBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />
      </td>
    </tr>
    <tr>
      <td nowrap width="50%">
        <div align="right">Agencia :</div>
      </td>
      <td nowrap width="50%">
       <eibsinput:help name="fix" property="E01FIXBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"
               	    	fn_param_one="E01FIXBRN" fn_param_two="document.forms[0].E01FIXBNK.value"/>
      </td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">Activo Fijo / I.D Amortizaci&oacute;n : </div>
      </td>
      <td nowrap width="50%"> 
        <input type="text" id="E01FIXASN" name="E01FIXASN" size="17" maxlength="15" onKeypress="enterInteger(event)">
		<a href="javascript:GetAmortID('E01FIXASN',document.forms[0].E01FIXBNK.value,document.forms[0].E01FIXBRN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
      </td>
    </tr>
  </table>
  <br>
          <p align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </p>
<script type="text/javascript">
  document.getElementById("E01FIXASN").focus();
  document.getElementById("E01FIXASN").select();
</script>

</form>
</body>
</html>
