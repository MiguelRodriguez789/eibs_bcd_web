<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Confirmación de Anulación </title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="cdAnula" class="datapro.eibs.beans.EDL205001Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="javascript">
 function goBack(){
 	document.forms[0].SCREEN.value = "960";
	document.forms[0].submit();
}
setTimeout("document.forms[0].submit();", 7000);
</script>


</head>
<%
	String txtch = !userPO.getApplicationCode().equals("12")?" Certificado de Depósito":" Bono";
	String txacd = !userPO.getApplicationCode().equals("12")?"11":"12";
%>
<body>

 
<h3 align="center">Confirmación<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="print_time_deposit_annulment_confirm, EDL2050" ></h3>
<hr size="4">
<FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.timedeposits.JSEDL2050">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="960">
<INPUT TYPE=HIDDEN NAME="OPE" VALUE="A">
<INPUT TYPE=HIDDEN NAME="appcode" VALUE="<%=txacd%>">
 
        <table class="tableinfo">
          <tr>       
          <td align=center> El formulario <%= cdAnula.getR01REF().trim()%> 
            , del <%=txtch %> <%= cdAnula.getR01ACC().trim()%> ha sido satisfactoriamente
            anulado. 
          </td>
          </tr>
          <tr>
            <td width="100%">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%"> 
<!--               <div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="goBack()" ></div> -->
            </td>
          </tr>
    
          
        </table>
 
</FORM>
</body>
</html>
