<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Solicitud de Entrega</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "fix" class= "datapro.eibs.beans.EFIX03001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<H3 align="center">Tabla de Referencias Cruzadas de Cuentas de Activos Fijos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_enter_cross_reference, EFIX030"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX030">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="200">
  </p>
  
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">Banco : </div>
      </td>
      <td nowrap width="50%"> 
         <eibsinput:text name="fix" property="E01FIXBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />
      </td>
    </tr>
    <tr>
      <td nowrap width="50%">
        <div align="right">Moneda :</div>
      </td>
      <td nowrap width="50%">
        <eibsinput:help name="fix" property="E01FIXCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" 
               	    	fn_param_one="E01FIXCCY" fn_param_two="document.forms[0].E01FIXCCY.value"/>
 	  </td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">Cuenta Contable : </div>
      </td>
      <td nowrap width="50%"> 
         <eibsinput:help name="fix" property="E01FIXGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" 
               		fn_param_one="E01FIXGLN" fn_param_two="document.forms[0].E01FIXBNK.value" fn_param_three="document.forms[0].E01FIXCCY.value" />
	</td>	
    </tr>
  </table>
  <br>
          <p align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </p>
<script type="text/javascript">
  document.getElementById("E01FIXGLN").focus();
  document.getElementById("E01FIXGLN").select();
</script>

</form>
</body>
</html>
