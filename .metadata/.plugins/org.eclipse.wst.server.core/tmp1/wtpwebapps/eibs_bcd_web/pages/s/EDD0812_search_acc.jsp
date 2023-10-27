<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Busqueda  de Doble Endoso</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function enviar(){

    var acc= document.forms[0].E01MDEACC.value
    if (acc.length > 0)
    {
        return true;
    }
    else
    {
        alert("Es requerido que se entre un valor al número de Cuenta Corriente.");
        document.forms[0].E01MDEACC.focus();
        return false;
    }
}
</script>




</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>
<%
    String title ="";
    if(userPO.getPurpose().equals("MAINTENANCE"))
    {
        title = "Mantenimiento";
    }
    if(userPO.getPurpose().equals("CONSULT"))
    {
        title = "Consulta";
    }
%>
<H3 align="center"><%=title %> Doble Endoso<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="search_acc.jsp,EDD0812"></H3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDD0812" onsubmit="return(enviar());">

<INPUT type="hidden" name="SCREEN" value="3">
  <h4>&nbsp;</h4>
  
  <table class="tbenter" cellspacing=0 cellpadding=2 border="0">
    <tr> 
      <td nowrap width="50%"><div align="right">N&uacute;mero de Cuenta : </div></td>
      <td nowrap width="50%"><input type="text" name="E01MDEACC" size="13" maxlength="12" onKeypress="enterInteger(event)"><a href="javascript:GetAccount('E01MDEACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></td>
    </tr>
</TABLE>


<p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
</p>

<script type="text/javascript">
  document.forms[0].E01MDEACC.focus();
  document.forms[0].E01MDEACC.select();
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
