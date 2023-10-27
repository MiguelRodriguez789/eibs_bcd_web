<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Mantenimiento de Incumplimientos</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "Main_Incum" class= "datapro.eibs.beans.EDL052002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="Javascript">
function cancel(){
	document.forms[0].SCREEN.value = 6;
	document.forms[0].submit();
}
</script>
</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %> 
 
 <h3 align="center">Mantenimiento  de Calificaci&oacute;n para Main_Incumci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_calificacion_proceso, EDL0520" ></h3>
 <hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0520">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="7">
  <%int row = 0; %>
  <table class="tableinfo">
  <tr >
    <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
      <tr id="trdark">
        <td nowrap><div align="right">Producto :</div></td>
        <td nowrap><input type="text" readonly name="PRODU" size="13" maxlength="12" value="<%= userPO.getHeader1()%>">
        </td>
        <td nowrap><div align="right">Numero de Cliente :</div></td>
        <td nowrap><input type="text" readonly name="CLIEN" size="10" maxlength="9" value="<%= userPO.getHeader2()%>"></td>
        
      </tr>
      <tr id="trclear">
        <td nowrap><div align="right">Pr&eacute;stamo :</div></td>
        <td nowrap><input type="text" readonly name="E02DEAACC" size="10" maxlength="9" value="<%= Main_Incum.getE02DEAACC()%>">
        </td>
        <td nowrap><div align="right"></div></td>
        <td nowrap></td>
        
      </tr>	  
     </table></td>
  </tr>
</table>
	<h4>Informaci&oacute;n</h4> 
	<table class="tableinfo">
      <tr > 
        <td nowrap> 
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="40%"><div align="right">Calificaci&oacute;n   :</div></td>
              <td nowrap width="20%" align=left>
			   <input type="text" maxlength="2" size="3" value="<%= Main_Incum.getE02CYPCAL().trim()%>" name="E02CYPCAL" >
               <a href="javascript:GetCodeCNOFC('E02CYPCAL','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
			  
			  </td>
			  <td nowrap width="40%"><div align="center"></div></td>
              <td nowrap width="20%" align=left>			  </td>
			</tr>
          </table>
        </td>
      </tr>
    </table>
  <div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
		<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onClick="javascript:cancel()">
  </div>

</form>
</body>
</html>
