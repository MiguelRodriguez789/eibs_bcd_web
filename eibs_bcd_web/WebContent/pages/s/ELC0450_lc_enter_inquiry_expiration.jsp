<%@page isELIgnored="false" %>
<html>
<head>
<title>Cartas de Crédito y Aceptaciones por Vencer</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<%-- CSS/JS --%>
<jsp:include page="include/header.jsp"></jsp:include>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />

<body  bgcolor="#FFFFFF">

<h3 align="center">Cartas de Crédito y Aceptaciones por Vencer<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_enter_inquiry_expiration.jsp, ELC0450"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="410">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Tipo de Cuenta : </div>
            </td>
            <td width="70%" nowrap>
				<SELECT name="E01SCHACD">
					<OPTION value="">Todas</OPTION>
					<OPTION value="40">Carta de Crédito</OPTION>
					<OPTION value="41">Aceptación</OPTION>
					<OPTION value="42">Pago Diferido</OPTION>
					<OPTION value="43">Boleta de Garantía</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Número de Días : </div>
            </td>
            <td width="70%" nowrap>
				<SELECT name="E01SCHDYS">
					<OPTION value="2">Dos (2)</OPTION>
					<OPTION value="3">Tres (3)</OPTION>
					<OPTION value="4">Cuatro (4)</OPTION>
					<OPTION value="5">Cinco (5)</OPTION>
					<OPTION value="6">Seis (6)</OPTION>
					<OPTION value="7">Siete (7)</OPTION>
				</SELECT>
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

<script type="text/javascript">
  document.forms[0].E01LCMACC.focus();
  document.forms[0].E01LCMACC.select();
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
