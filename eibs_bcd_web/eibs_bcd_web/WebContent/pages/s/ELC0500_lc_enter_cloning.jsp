<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Mantenimiento Carta de Credito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">



</SCRIPT>
</HEAD>
<BODY>

<H3 align="center">Apertura de Cartas de Crédito Comerciales<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF"></H3>
<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0500">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="110">
    <INPUT TYPE=HIDDEN NAME="E01LCMSWF" VALUE="">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK3" VALUE="1">
  <TABLE class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <TR>
      <TD nowrap width="50%" align="right">Tomar Informacion de Carta de Credito Nro. :</TD>
      <TD nowrap width="50%">
        <INPUT type="text" name="E01CPYNUM" size="13" maxlength="12" onkeypress="enterInteger(event)">
        <A href="javascript:GetAccount('E01CPYNUM','','CC','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></A>
      </TD>
    </TR>
    <TR>
			<TD nowrap align="right">
       </TD><TD align="left">
			</TD>

		</TR>
  </table>
  <br>
          <div align="center">
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">

          </div>
<script type="text/javascript">
  document.forms[0].E01CPYNUM.focus();
  document.forms[0].E01CPYNUM.select();
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
</FORM>
<P><BR>

</BODY>
</HTML>
