<%@ page import="com.datapro.constants.EibsFields" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Payment Schedule Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />


<SCRIPT type="text/javascript">

function CheckNum(){
 if(isNaN(document.forms[0].E01DEAACC.value)||(document.forms[0].E01DEAACC.value.length < 1)){
  alert("Debe entrar una cuenta v�lida");
  document.forms[0].E01DEAACC.value='';
  document.forms[0].E01DEAACC.focus();
 } else {
  document.forms[0].submit();
 }
}

</SCRIPT>

</head>

<body>

<h3 align="center">Mantenimiento Cuadro Manual<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_account, EPV0155"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0155" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
 <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr><td>&nbsp;</td></tr>
			  <tr><td>&nbsp;</td></tr>
			    <tr><td>&nbsp;</td></tr>
				  <tr><td>&nbsp;</td></tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Numero de Prestamo :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
              <a href="javascript:GetAccount('E01DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center"> 
    <input id="EIBSBTN" type=button name="Submit" OnClick="CheckNum()" value="Enviar">
  </div>

<script type="text/javascript">
  document.forms[0].E01DEAACC.focus();
  document.forms[0].E01DEAACC.select();
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
