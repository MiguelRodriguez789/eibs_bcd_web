<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Productos para incluir en el Reporte de Productos Ofrecidos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="ESD9020Record" class="datapro.eibs.beans.ESD902001Message"  scope="session" />
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
function GetProduct08(name,desc,app,bank)
{
	page= "${pageContext.request.contextPath}/pages/s/EWD0008_client_help_container.jsp"
	fieldName=name;
	fieldAux1 = desc; 
	AppCode = app;
	ProductBank = bank;				
	CenterWindow(page,600,400,1);
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
				   %>Productos Ofrecidos				
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_details.jsp, ESD9020">
</H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD9020" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
<table width="100%"> <tr> <td nowrap> 
  	<table  width="100%" > <tr bordercolor="#FFFFFF"> <td nowrap> 
        <table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="30%" align="right">Banco:</td>
				<td NOWRAP align="left" width="70%" >
					<eibsinput:text name="ESD9020Record" property="E01APRBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" required="true" />
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%" align="right">Código Producto:</td>
				<td NOWRAP align="left" width="70%" >
					<input type="text" name="E01APRCDE" size="5" maxlength="4" value="<%= ESD9020Record.getE01APRCDE()%>">
					<a href="javascript:GetProduct08('E01APRCDE','D01APRCDE','',document.forms[0].E01APRBNK.value)">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 				
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="30%" align="right">Nombre del Producto:</td>
				<td NOWRAP align="left" width="70%" >
					<input type="text" name="D01APRCDE" size="45" readonly value="<%= ESD9020Record.getD01APRCDE()%>">		
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
