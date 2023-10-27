<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script type="text/javascript">
	function enter(){
		if ( document.forms[0].TELLUSERID.value.length < 1) {
			alert("Introduzca un usuario Válido");
			document.forms[0].TELLUSERID.value='';
			document.forms[0].TELLUSERID.focus();
			return false;
		} else {
			document.forms[0].submit();
		}
		return true;
	}
</script>

</head>
<body>

 
<% 
if (!error.getERRNUM().equals("0")){
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>
<H3 align="center">Perfiles de Cajeros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Users_teller_search"></H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersTeller">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>

  <table class="tbenter"  width="100%" border="0">
    <tr> 
      <td nowrap ALIGN=CENTER> 
        Identif. de Usuario : 
        <INPUT type="text" name="TELLUSERID" size="16" maxlength="15" >
        <INPUT type="hidden" name="USERNAME" >
        <a href="javascript:GetUserRegistry('TELLUSERID', 'USERNAME', document.forms[0].TELLUSERID.value)">
        <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
      </td>
    </tr>       
  </table>
  <h4>Tipo Operacion</h4>
  <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0" >
   <tr> 
      <td > 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">      
          <tr> 
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap> 
              <input type="radio" name="purpose" value="MAINTENANCE" checked > Mantenimiento   
            </td>
            <td width="60%" nowrap> 
            </td>
          </tr>  
          <tr> 
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap> 
              <input type="radio" name="purpose" value="NEW" > Nuevo
            </td>
            <td width="60%" nowrap> 
            </td>
          </tr>                                     
        </table>      
      </td>
    </tr>  
  </table>  
	<p align="center">             
    <input id="EIBSBTN" type=button name="Submit" value="Enviar" onclick="enter()">
    </p>
      
</form>
</body>
</html>
