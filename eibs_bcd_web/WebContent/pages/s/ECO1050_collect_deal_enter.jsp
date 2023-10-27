<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sistema Bancario: Mantenedor Convenios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "deal" class= "datapro.eibs.beans.ECO105001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
 function enterCode(){
	
	if (trim(document.forms[0].E01COMCUN.value).length > 0 ||  
		 (trim(document.forms[0].E01COMCUN.value).length > 0 && trim(document.forms[0].E01COMNUM.value).length > 0 )
		) {
	    return true;
	}else{
		alert("Es requerido que coloque un Cliente o un Cliente/Convenio para continuar...");
		document.forms[0].E01COMCUN.focus();
		return false;
	}
 }
</script>

</head>

<body>
 
<H3 align="center"> Convenios de Recaudos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="collect_deal_enter.jsp, ECO1050"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050" onsubmit="return(enterCode());">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
     <INPUT TYPE=HIDDEN NAME="ENTER_DEAL" VALUE="Y">
  </p>
  <h4>&nbsp;</h4>
<table id="TBHELPN" width="100%" border="0" cellspacing="0"
	cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
  		<td nowrap width="50%"> 
           <div align="right">Número Cliente  : </div>
        </td>
        <td nowrap width="50%" colspan="3"> 
 			<eibsinput:help name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01COMCUN" fn_param_one="E01COMCUN" />
        </td>
    </tr>

    <tr >
      <td width="50%"> 
        <div align="right">Codigo de Convenio : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
 			<eibsinput:help name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" 
 				help="<%= HelpTypes.COLLECT_DEAL_REQUEST %>"  
 				property="E01COMNUM" fn_param_one="E01COMNUM" fn_param_two="document.forms[0].E01COMCUN.value"/>
        </div>
      </td>
    </tr>
    
  </table>
  <p align="center">
      <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
<script type="text/javascript">
  document.forms[0].E01COMCUN.focus();
  document.forms[0].E01COMCUN.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
