<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Cambio de sucursal y/o cuenta contable</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "fix" class= "datapro.eibs.beans.EFIX00501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>

<%  if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<H3 align="center">Cambio de Sucursal y Cuenta Contable
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_enter_change_reference, EFIX005"></H3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX005">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="200">
  </p>
  
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">Activo Fijo : </div>
      </td>
      <td nowrap width="50%"> 
        <input type="text" id="E01CHGACC" name="E01CHGACC" size="13" maxlength="12" onKeypress="enterInteger(event)" value="<%=fix.getE01CHGACC()%>">
        <a href="javascript:GetAmortID('E01CHGACC','01','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
      </td>
    </tr>
    <tr>
      <td nowrap width="50%">
        <div align="right">Nueva Sucursal :</div>
      </td>
      <td nowrap width="50%">
        <input type="text" id="E01CHGNBR" name="E01CHGNBR" size="5" maxlength="4" value="<%=fix.getE01CHGNBR()%>"> 
         <a href="javascript:GetBranch('E01CHGNBR','01','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
       
      </td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">Nueva Cuenta Contable : </div>
      </td>
      <td nowrap width="50%"> 
        <input type="text" id="E01CHGNGL" name="E01CHGNGL" size="17" maxlength="16" onKeypress="enterInteger(event)" value="<%=fix.getE01CHGNGL()%>">
        <a href="javascript:GetLedger('E01CHGNGL','01','','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
      </td> 
    </tr>
  </table>
  <br>
          <p align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </p>
<script type="text/javascript">
  
</script>

</form>
</body>
</html>
