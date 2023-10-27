<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Detalle Clientes Exonerados del Reporte de Transacciones en Efectivo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="ESD9010Record" class="datapro.eibs.beans.ESD901001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">


function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Esta seguro que desea borrar este registro??")) {
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
	String read = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  mandatory = "";
		}	

%>

<H3 align="center"> 
					<% if (userPO.getPurpose().equals("NEW")) { 
										out.println("   Nuevo - "); 
					   } 
					   else if (userPO.getPurpose().equals("MAINTENANCE")) {
					                               out.println("  Mantenimiento - "); 
					   }			  
					   else { out.println("  Consulta - ");
					   } 
				   %>Cliente Exonerado del Reporte de Transacciones en Efectivo				
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="exonerated_clients_details.jsp, ESD9010">
</H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD9010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
<table width="100%"> <tr> <td nowrap> 
  	<table  width="100%" > <tr bordercolor="#FFFFFF"> <td nowrap> 
        <table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trclear">
				<td nowrap width="30%" align="right">Código Cliente:</td>
				<td NOWRAP align="left" width="70%" >
					<INPUT TYPE="text" name="E01CUECUN" value='<%=  ESD9010Record.getE01CUECUN()  %>' onKeyPress="enterInteger(event)" <%= read %>>
						<A href="javascript:GetCustomerDescId('E01CUECUN','D01CUECUN','')">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
					</A>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="30%" align="right">Nombre Cliente:</td>
				<td NOWRAP align="left" width="70%" >
					<INPUT type="text" name="D01CUECUN" size="40" value="<%= ESD9010Record.getD01CUECUN().trim()%>" readonly>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%" align="right">Fecha Exoneración:</td>
				<td NOWRAP align="left" width="70%" >
					<eibsinput:date name="ESD9010Record" fn_year="E01CUEEXY" fn_month="E01CUEEXM" fn_day="E01CUEEXD" required="true"/>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="30%" align="right">Estado Exoneración:</td>
				<td NOWRAP align="left" width="70%" >
					<SELECT name="E01CUESTS" <%= disabled %> >
						<OPTION <%= ESD9010Record.getE01CUESTS().trim().equals("A")?"Selected":"" %> value="A">Activo</OPTION>
						<OPTION <%= ESD9010Record.getE01CUESTS().trim().equals("S")?"Selected":"" %> value="S">Suspendido</OPTION>
			  		</SELECT>
			  		<%=mandatory %>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%" align="right">Fecha Finalizo Exoneración:<br>
						(si el estado es suspendido)</td>
				<td NOWRAP align="left" width="70%" >
					<eibsinput:date name="ESD9010Record" fn_year="E01CUEEEY" fn_month="E01CUEEEM" fn_day="E01CUEEED" required="false"/>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="30%" align="right">Observaciones :</td>
				<td NOWRAP align="left" width="70%" >
					<eibsinput:text name="ESD9010Record" property="E01CUENR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false" />
			</tr>
			<tr id="trdark">
				<td nowrap width="30%" align="right"></td>
				<td nowrap width="70%" align="left">
					<eibsinput:text name="ESD9010Record" property="E01CUENR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false" />
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%" align="right"></td>
				<td nowrap width="70%" align="left">
					<eibsinput:text name="ESD9010Record" property="E01CUENR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false" />
				</td>		
			</tr>
		</table> 
  </td> </tr> </table>

<table width="100%">		
		<tr>
			<td width="33%" align="center"> 
				<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
			</td>
			<td width="33%" align="center"> 
				<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
			</td>
			<td width="34%" align="center"> 
				<input id="EIBSBTN" type=submit name="Exit" value="Salir" 
				<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    	onClick="goAction(1);" 
				<% } else { %>
					onClick="goAction(6);" 
				<% } %>>
  			</td>
		</tr>	
	</table>	
</td> </tr> </table>
</form>
</body>

<SCRIPT Language="Javascript">

</SCRIPT>


</html>
