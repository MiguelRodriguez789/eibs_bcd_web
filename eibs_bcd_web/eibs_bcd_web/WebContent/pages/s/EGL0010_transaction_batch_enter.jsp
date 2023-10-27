<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>

<head>
<title>Transacciones Contables</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
</head>

<jsp:useBean id="glBatch" class="datapro.eibs.beans.EGL001002Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>

<h3 align="center"> Transacciones Contables 
<%if (userPO.getSource().equals("1")){ %>
	- Sin Aprobacion
<%} else { %>
	- Pendiente de Aprobacion
<% } %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transaction_batch_enter,EGL0010"> </h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0010">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  
  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
	<tr >
      <td width="50%"> 
        <div align="right">N&uacute;mero de Lote : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
       	    <eibsinput:text name="glBatch" property="E02SELBTH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH %>" />    
        </div>
      </td>
    </tr>
	<tr>
      <td width="50%"> 
        <div align="right">Banco Origen : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
       	    <eibsinput:text name="glBatch" property="E02SELOBK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />    
        </div>
      </td>
    </tr>
	<tr>
      <td width="50%"> 
        <div align="right">Sucursal Origen : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
 			<eibsinput:help name="glBatch" property="E02SELOBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" fn_param_one="E02SELOBR" fn_param_two="document.forms[0].E02SELOBK.value"  />
        </div>
      </td>
    </tr>
	<tr>
		<td width="50%">
		<div align="right">Código de Moneda :</div>
		</td>
		<td width="50%">
		<div align="left">
 			<eibsinput:help name="glBatch" property="E02SELCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E02SELCCY" fn_param_two="document.forms[0].E02SELOBK.value"  />
		</div>
		</td>
	</tr>
	<tr>
		<td width="50%">
		<div align="right">Fecha Valor :</div>
		</td>
		<td width="50%">
		<div align="left">
			<eibsinput:date name="glBatch" fn_year="E02SELVDY" fn_month="E02SELVDM" fn_day="E02SELVDD" />
		</div>
		</td>
	</tr>
    
  </table>

  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>

<script type="text/javascript">
  document.forms[0].E02SELBTH.focus();
  document.forms[0].E02SELBTH.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
