<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Entidades Asociadas a Clientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="ESD0086Record" class="datapro.eibs.beans.ESD008601Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
<%
 	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL");
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isApprovalInquiry || isInquiry;
 	boolean isReadOnlyMnt = false;
 	String legtyp = (ESD0086Record.getH01LGT().equals("1")?"JURIDICO":"PERSONA");  
	String read = "";
	String readMnt = "";
 	String disabled = "";
 	String disabledMnt = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		}
	if (!(userPO.getPurpose().equals("NEW"))) 
		{ readMnt = " readonly ";
		  disabledMnt = " disabled";
		  isReadOnlyMnt = true;
		}		
    if (isApprovalInquiry) {%>
		<% if (!ESD0086Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_ap_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_ap_corp_opt);
         <% } %>
   <% } else { %>

   <% if (isInquiry) { %>
	    <% if (!ESD0086Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_inq_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_inq_corp_opt);
         <% } %>	 
   <%} else {%>
         <% if (!ESD0086Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_corp_opt);
         <% } %>
   <% } %> 
   <% } %>  

 
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	submitForm();
}

function goInquiry() {
     pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=10&ACCNUM=<%= ESD0086Record.getE01PHN().trim()%>&opt=1";
     CenterWindow(pg,600,400,2);
     return;	
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

<H3 align="center">Usos de Domicilio<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_usos_domicilio.jsp, ESD0086"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0086" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="RECTYP" VALUE="<%=userPO.getHeader10() %>">
  <INPUT TYPE=HIDDEN NAME="H01CUN" VALUE="<%= ESD0086Record.getH01CUN().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01IAD" VALUE="<%= ESD0086Record.getE01IAD().trim()%>">

 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
        <tr id="trdark"> 
            <td nowrap width="10%" align="right">Tipo Legal : </td>
            <td nowrap width="20%" align="left" > <%=legtyp%></td>
            <td nowrap width="10%" align="right">Estado : </td>
			<td nowrap width="60%" align="left" style="color:red;font-size:12;">
				<b><%= ESD0086Record.getD01STS().trim()%></b>		
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">Código :</td>
            <td nowrap width="20%" align="left"><b><%= ESD0086Record.getH01CUN().trim()%></b></td>
            <td nowrap width="10%" align="right">Nombre Legal :</td>
			<td nowrap width="60%" align="left"><b><%= ESD0086Record.getH01NA1().trim()%></b></td>
		</tr>
		<tr id="trdark"> 
            <td nowrap width="10%" align="right">ID : </td>
            <td nowrap width="20%" align="left">
            	<b><%=ESD0086Record.getH01PID().trim()%> - <%=ESD0086Record.getH01TID().trim()%> - <%= ESD0086Record.getH01IDN().trim()%></b> 
			</td>
            <td nowrap width="10%" align="right"></td>
			<td nowrap width="60%" align="left"></td>
		</tr>
        </table>
	</td>
  </tr>
</table>  

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		<tr id="trdark"> 
            <td nowrap width="5%" align="right">Consecutivo :</td>
            <td nowrap width="5%" align="left"> 
                <INPUT type="text" name="E01MAN" size="6" readonly value="<%= ESD0086Record.getE01MAN().trim()%>">
			</td>
            <td nowrap width="5%" align="right">Estado :</td>
			<td nowrap width="35%" align="left">
				<select name="E01FL2" <%=disabled%>
            	<% if (isApprovalInquiry || isInquiry) { 
               		if (ESD0086Record.getF01FL2().equals("Y")) out.print("id=\"txtchanged\""); 
               	 } 
              	%>
              	>
                <option value="A" <% if (ESD0086Record.getE01FL2().equals("A")) out.print("selected"); %>>ACTIVO</option>
                <option value="C" <% if (ESD0086Record.getE01FL2().equals("C")) out.print("selected"); %>>INACTIVO</option>
                <option value=" " <% if ( (!ESD0086Record.getE01FL2().equals("A") && !ESD0086Record.getE01FL2().equals("C"))) out.print("selected"); %>></option>
              </select> 
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="20%" align="left">
			</td>
			<td nowrap width="5%" align="right"></td>
			<td nowrap width="20%" align="left">
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="5%" align="right">Cuenta :</td>
            <td nowrap width="5%" align="left"> 
				<input type="text" name="E01PHN" size="15" maxlength="12" value="<%= ESD0086Record.getE01PHN().trim()%>" readonly>
			</td>
            <td nowrap width="5%" align="right">Envío de Correspondencia : </td>
			<td nowrap width="35%" align="left">
				<select name="E01ADT" >
			      <option value=" " <% if (!(ESD0086Record.getE01ADT().equals("R") || ESD0086Record.getE01ADT().equals("C") ||
			                                 ESD0086Record.getE01ADT().equals("O")))out.print("selected"); %>>
			      </option>
			      <option value="C" <%if (ESD0086Record.getE01ADT().equals("C")) out.print("selected"); %>>Correo Electronico</option>
			      <option value="R" <%if (ESD0086Record.getE01ADT().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
			      <option value="O" <%if (ESD0086Record.getE01ADT().equals("O")) out.print("selected"); %>>Oficina del Banco</option>
                </select>
				<input type="text" name="E01CO1" size="3" maxlength="2" value="<%= ESD0086Record.getE01CO1().trim()%>">
                <a href="javascript:GetMailing('E01CO1',document.forms[0].H01CUN.value,document.forms[0].E01ADT.value)">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a>  
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="20%" align="left">
			</td>
			<td nowrap width="5%" align="right"></td>
			<td nowrap width="20%" align="left">
			</td>
		</tr>

       </table>
      </td>
    </tr>
  </table>

   <br> 

	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1" >Aceptar con Avisos</td>
    	</tr>
  	</table>    
    <table width="100%">		
  	<tr>
  		<%  int screen = 1;
		if (userPO.getPurpose().equals("INQUIRY")) {
			screen = 8;
		}
		if (userPO.getPurpose().equals("APPROVAL")){
			screen = 6;
		} 
	%>
  	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		<td width="25%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="25%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="25%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(<%=screen%>);">
  		</td>
  		<td width="25%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Inquiry" value="Consultar" onClick="goInquiry();" >
     	  </div>	
  		</td>
	<% } else { %>
		<td width="50%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(<%=screen%>);"> 
  		</td>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Inquiry" value="Consultar" onClick="goInquiry();" >
     	  </div>	
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
            	<%= ESD0086Record.getE01CTU()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= ESD0086Record.getE01LMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(ESD0086Record.getE01CDM()),Integer.parseInt(ESD0086Record.getE01CDD()),Integer.parseInt(ESD0086Record.getE01CDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(ESD0086Record.getE01LMM()),Integer.parseInt(ESD0086Record.getE01LMD()),Integer.parseInt(ESD0086Record.getE01LMY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= ESD0086Record.getE01CTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= ESD0086Record.getE01LMT()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  </form>
</body>

<SCRIPT Language="Javascript">
	principal('<%=ESD0086Record.getE01FL1()%>');
</SCRIPT>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=ESD0086Record"> </script>
</html>
