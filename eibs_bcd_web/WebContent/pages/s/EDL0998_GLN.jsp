<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<html>
<head>
<title>Cuentas Cartera Vencida</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gln" class="datapro.eibs.beans.EDL099803Message" scope="session" /> 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
</head>

<body>


<SCRIPT type="text/javascript">

<%
 	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL");
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isDelete = userPO.getPurpose().equals("DELETE");
 	boolean isReadOnly = isApprovalInquiry || isInquiry || isDelete;
 	boolean isReadOnlyMnt = false;
 	String read = "";
	String readMnt = "";
 	String disabled = "";
 	String disabledMnt = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	
	if (!(userPO.getPurpose().equals("NEW"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		}
		
%>


 
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 15) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	submitForm();
}



</SCRIPT>  




<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
    
%>

<H3 align="center">Cuentas Cartera Vencida<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="GLN.jsp, EDL0998"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0998" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E03GLNCDE" VALUE="<%= gln.getE03GLNCDE().trim()%>">


<h4>&nbsp;</h4>
<table class="tbenter" cellspacing=0 cellpadding=2 width="100%"
	border="0">
	<tr>
		<td width="50%">
		<div align="right">Código de Banco :</div>
		</td>
		<td width="50%">
		<div align="left">
			<input type="text" name="E03GLNBNK" onKeypress="enterInteger(event)" size="3" maxlength="2" value="<%= gln.getE03GLNBNK().trim()%>">
		</div>
		</td>
	</tr>
	<tr>
		<td width="50%">
		<div align="right">Código de Moneda :</div>
		</td>
		<td width="50%">
		<div align="left">
 			<eibsinput:help name="gln" property="E03GLNCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>"fn_param_one="E03GLNCCY" fn_param_two="document.forms[0].E03GLNBNK.value" readonly="<%=isReadOnly %>" />
		</div>
		</td>
	</tr>
	<tr>
		<td width="50%">
		<div align="right">Número de Cuenta Contable :</div>
		</td>
		<td width="50%">
		<div align="left">
 			<eibsinput:help name="gln" property="E03GLNGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>"fn_param_one="E03GLNGLN" fn_param_two="document.forms[0].E03GLNBNK.value" fn_param_three="document.forms[0].E03GLNCCY.value"  readonly="<%=isReadOnly %>"/>
		</div>
		</td>
	</tr>
</table>

   <br> 

    <table width="100%">		
  	<tr>
  	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(11);" >
     	  </div>	
  		</td>
  		<td width="50%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(9);">
  		</td>
	<% } %>
  	<% if (userPO.getPurpose().equals("DELETE")) { %>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(15);" >
     	  </div>	
  		</td>
  		<td width="50%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(9);">
  		</td>
	<% } %>
  	<% if (!userPO.getPurpose().equals("DELETE") && !userPO.getPurpose().equals("NEW") && !userPO.getPurpose().equals("MAINTENANCE")) { %>
 		<td width="100%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(9);"> 
  		</td>
	<% } %>
  	</tr>	

  </table>	

  <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= gln.getE03GLNCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= gln.getE03GLNLMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(gln.getE03GLNCMM()),Integer.parseInt(gln.getE03GLNCMD()),Integer.parseInt(gln.getE03GLNCMY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(gln.getE03GLNLMM()),Integer.parseInt(gln.getE03GLNLMD()),Integer.parseInt(gln.getE03GLNLMY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= gln.getE03GLNCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= gln.getE03GLNLMT()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  </form>
</body>

<SCRIPT Language="Javascript">

	
</SCRIPT>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=gln"> </script>

</html>
