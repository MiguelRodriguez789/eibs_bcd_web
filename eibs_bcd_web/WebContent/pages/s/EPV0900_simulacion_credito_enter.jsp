<%@ page import = "datapro.eibs.master.*" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Simulaci&oacute;n de Creditos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="QuoteLoans" class="datapro.eibs.beans.EPV090001Message" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

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
<h3 align="center">Simulaci&oacute;n de Prestamos
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="simulacion_credito_enter.jsp, EPV0900"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0900" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="200">
  <input type=HIDDEN name="E01DEABNK" id="E01DEABNK" value="<%=QuoteLoans.getE01DEABNK() %>">
  <%int row = 0; %>
  
  <h4>Informaci&oacute;n Opcional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap width="60%" > 
            	<eibsinput:help fn_param_one="E01DEACUN" fn_param_two="E01CUSNA1" fn_param_three="" property="E01DEACUN" name="QuoteLoans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text property="E01CUSNA1" name="QuoteLoans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%"> 
              <div align="right">Producto :</div>
            </td>
            <td nowrap width="60%" > 
				<eibsinput:help name="datarec" property="E01DEAPRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" fn_param_one="E01DEAPRO" fn_param_two="10" fn_param_three="document.forms[0].E01DEABNK.value" fn_param_four="E01DSCPRD" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="40%"> 
              <div align="right">Convenio :</div>
            </td>
            <td nowrap width="60%" > 
              <input type="text" name="E01DEACNV" size="8" maxlength="6" value="<%=QuoteLoans.getE01DEACNV() %>">
              <a href="javascript:GetCodeDescCNOFC('E01DEACNV',' ','2D')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
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
