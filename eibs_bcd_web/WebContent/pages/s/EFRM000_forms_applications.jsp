<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Forms</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function GetHelp(){
  	GetProduct('ACCOUNT', '', '', '', '');
}

</SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body bgcolor="#FFFFFF">


<h3 align="center">Aplicaciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="forms_applications,EFRM000"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000">
    
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
    <INPUT TYPE=HIDDEN NAME="OPE_CODE" VALUE="AA">
    <INPUT TYPE=HIDDEN NAME="APP_CODE" VALUE="XX">

  </p>
  <p>&nbsp;</p>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr> 
            <td nowrap colspan="2"> 
              <div align="right">C�digo de Producto :</div>
            </td>
            <td nowrap width="47%"> 
              <INPUT type="text" name="ACCOUNT" size="5" maxlength="4">
              <a href="javascript:GetHelp()"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"  ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>

<script type="text/javascript">
  document.forms[0].ACCOUNT.focus();
  document.forms[0].ACCOUNT.select();
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
