<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Grupos Economicos Filial</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
</head>

<jsp:useBean id="ESD0092Record" class="datapro.eibs.beans.ESD009201Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
 
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<script >
<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String readMnt = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
	if (userPO.getPurpose().equals("MAINTENANCE")) readMnt = " readonly ";
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isInquiry;
 	
%>


function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		}
	document.forms[0].submit();
}

</SCRIPT>  

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>  

<H3 align="center">
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
Mantenimiento
<% } else {%>
Consulta
<% } %>
 de Filiales de Relaciones de Clientes
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_group_filial.jsp, ESD0092"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0092" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="15">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
      	<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
   			<td nowrap width="15%" align="right">Secuencia :</td>
			<td nowrap width="35%">
				<INPUT type="text" name="E01GEMMST" size="10" readonly value="<%= ESD0092Record.getE01GEMMST().trim()%>">
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left"> 
			</td>
        </tr>
        <tr id="trclear"> 
   			<td nowrap width="15%" align="right">Cliente / Nombre :</td>
			<td nowrap width="35%">
				<INPUT type="text" name="E01GEMCUM" size="10" readonly value="<%= ESD0092Record.getE01GEMCUM().trim()%>">
				<INPUT type="text" name="E01GEMNA1" size="46" readonly value="<%= ESD0092Record.getE01GEMNA1().trim()%>">
            </td>
            <td nowrap width="15%" align="right">Tipo Relación :</td>
            <td nowrap width="35%" align="left"> 
                <INPUT type="text" name="E01GEMGRP" size="5" readonly value="<%= ESD0092Record.getE01GEMGRP().trim()%>">
                <INPUT type="text" name="D01GRP" size="45" readonly value="<%= ESD0092Record.getD01GRP().trim()%>">
			</td>
        </tr> 
		<tr id="trdark">  
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
            <td nowrap width="15%" align="right">Estado de la relación :</td>
			<td nowrap width="35%" align="left">
				<% if (ESD0092Record.getE01GEMSTM().equals("A")) out.print("Activo");
				    else if (ESD0092Record.getE01GEMSTM().equals("I")) out.print("Inactivo");
				 %>
			</td>
		</tr>
		</table>
	</td>
	</tr>		
  </table>
  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Filial / Nombre : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01GEMCUN" maxlength="9" size="10" <%= readMnt %> value="<%= ESD0092Record.getE01GEMCUN().trim()%>">
				<% if (userPO.getPurpose().equals("NEW"))  { %>
					<A href="javascript:GetCustomerDescId('E01GEMCUN','E01GEMNA2','')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
					</A>
				<% } %>
            	<INPUT type="text" name="E01GEMNA2" maxlength="45" size="46" <%= readMnt %> value="<%= ESD0092Record.getE01GEMNA2().trim()%>">
            	<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Estado de la Filial: </td>
            <td nowrap width="35%" align="left"> 
              	<SELECT name="E01GEMSTS" <%= disabled %>>
					<OPTION <%= ESD0092Record.getE01GEMSTS().trim().equals("A")?"Selected":"" %> value="A">Activo</OPTION>
					<OPTION <%= ESD0092Record.getE01GEMSTS().trim().equals("I")?"Selected":"" %> value="I">Inactivo</OPTION>
				</SELECT>
				<%=mandatory %>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Identificación : </td>
			<td nowrap width="35%" align="left">
                <INPUT type="text" name="E01GEMPID" size="5" readonly value="<%= ESD0092Record.getE01GEMPID().trim()%>">
                <INPUT type="text" name="E01GEMTID" size="5" readonly value="<%= ESD0092Record.getE01GEMTID().trim()%>">
                <INPUT type="text" name="E01GEMIDN" size="26" readonly value="<%= ESD0092Record.getE01GEMIDN().trim()%>">
            </td>
            <td nowrap width="15%" align="right">Fecha de Inclusión : </td>
			<td nowrap width="35%" align="left">
                <eibsinput:date name="ESD0092Record" required="false" fn_year="E01GEMRLY" fn_month="E01GEMRLM" fn_day="E01GEMRLD" readonly="true" /> 
            </td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  
    <table width="100%">		
  	<tr>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(15);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(10);" 
			<% } else { %>
				onClick="goAction(16);" 
			<% } %>>
     	  </div>	
  		</td>
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
            	<%= ESD0092Record.getE01GEMCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= ESD0092Record.getE01GEMMUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(ESD0092Record.getE01GEMCDM()),Integer.parseInt(ESD0092Record.getE01GEMCDD()),Integer.parseInt(ESD0092Record.getE01GEMCDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(ESD0092Record.getE01GEMRDM()),Integer.parseInt(ESD0092Record.getE01GEMRDD()),Integer.parseInt(ESD0092Record.getE01GEMRDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= ESD0092Record.getE01GEMCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= ESD0092Record.getE01GEMMTM()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  </form>
</body>

	<SCRIPT language="JavaScript">
		
	</SCRIPT>


</html>
