<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Sistema Bancario: Mantenedor Convenios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "deal" class= "datapro.eibs.beans.ESD079001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
 function enterCode(){
	
	if (trim(getElement("E01COTCDE").value).length > 0) {
	    return true;
	}else{
		alert("Es requerido que se entre un valor");
		getElement("E01COTCDE").focus();
		return false;
	}
 }
</script>
</head>

<body>
 
<H3 align="center">Mantenimiento de Convenios
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="deal_new_enter.jsp, ESD0790">
</H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0790" onsubmit="return(enterCode());">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">

<table id="TBHELPN" width="100%" border="0" cellspacing="0"
	cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
  		<td nowrap width="50%"> 
           <div align="right">Número Cliente Empleador : </div>
        </td>
        <td nowrap width="50%" colspan="3"> 
 			<eibsinput:help name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01COTECU" 
			fn_param_one="E01COTECU" />
        </td>
    </tr>

    <tr >
      <td width="50%"> 
        <div align="right">Número de Solicitud : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
 			<eibsinput:help name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" 
 				help="<%= HelpTypes.CONVENANT_REQUEST %>" 
 				property="E01COTNUM" fn_param_one="E01COTNUM" fn_param_two="document.forms[0].E01COTECU.value"/>
        </div>
      </td>
    </tr>
    
    <tr style="height: 30px">
      <td width="50%"> 
        <div align="right">Número de Convenio : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
          <input type="text" name="E01COTCDE" id="E01COTCDE" size="5" maxlength="4" value="<%= deal.getE01COTCDE().trim()%>">
        </div>
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

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
 <% } %>
</form>
</body>
</html>
