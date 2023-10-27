<html>
<head>
<title>Consulta de Cartas de Crédito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function redirect() {
	if (document.forms[0].E02LCLACC.value != "") {
		document.forms[0].submit();
	}
}

</SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body  bgcolor="#FFFFFF">

<h3 align="center">Historial de Cartas de Crédito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_enter_inquiry.jsp, ELC0460"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="425">
  <INPUT TYPE=HIDDEN NAME="H02OPECOD" VALUE="0015">

  <table class="tableinfo" align="center">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
            <td width="50%"> 
              <div align="right">Número de Carta de Crédito : </div>
            </td>
            <td width="50%"> 
              <div align="left"> 
	              <input type="text" name="E02LCLACC" size="13" maxlength="12" onkeypress="enterInteger(event)">
    	          <a href="javascript:GetAccount('E02LCLACC','','LC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
              </div>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
    <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onclick="redirect();">
  </div>

<script type="text/javascript">
  document.forms[0].E02LCLACC.focus();
  document.forms[0].E02LCLACC.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>;
 <%
 }
%>
</form>
</body>
</html>
