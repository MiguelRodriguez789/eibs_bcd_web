<html>
<head>
<title>Baja de Activos Fijos / Amortizaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX00001Message"  scope="session" />

<body>

<H3 align="center">Baja de Activos Fijos / Amortizaciones
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_enter_transaction,EFIX000"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX000">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="700">
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
        <input type="text" name="E01FIXBNK" size="3" maxlength="2" onKeypress="enterInteger(event)" value="<%= userPO.getBank().trim()%>">
        <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
      </td>
    </tr>
    <tr>
      <td nowrap width="50%">
        <div align="right">Agencia :</div>
      </td>
      <td nowrap width="50%">
        <input type="text" name="E01FIXBRN" size="5" maxlength="4" onKeyPress="enterInteger(event)" value="<%= userPO.getBranch().trim()%>">
		<a href="javascript:GetBranch('E01FIXBRN',document.forms[0].E01FIXBNK.value)">
			<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
        <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
      </td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">Activo Fijo / I.D Amortizaci&oacute;n : </div>
      </td>
      <td nowrap width="50%"> 
        <input type="text" name="E01FIXASN" size="17" maxlength="15" onKeypress="enterInteger(event)" value="<%= userPO.getAccNum()%>">
		<a href="javascript:GetAmortID('E01FIXASN',document.forms[0].E01FIXBNK.value,document.forms[0].E01FIXBRN.value)">
			<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
        <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
      </td>
    </tr>
  </table>
  <br>
          <p align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </p>
<script type="text/javascript">
  document.forms[0].E01FIXASN.focus();
  document.forms[0].E01FIXASN.select();
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
