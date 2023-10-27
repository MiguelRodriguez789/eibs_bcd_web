<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Detalle Conceptos Retención</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="ETX9010Record" class="datapro.eibs.beans.ETX901001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar el registro seleccionado??")) {
			return;
		}
	}
	document.forms[0].submit();
}

function stopRKey(evt) {
  var evt = (evt) ? evt : ((event) ? event : null);
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;}
}

document.onkeypress = stopRKey; 
 
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
				   %>Concepto				
		de Retención<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="table_withholding_tax_details.jsp, ETX9010">
</H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSETX9010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN name="E01TXRBNK" value="<%= currUser.getE01UBK()%> "> 
  
  
<table width="100%"> <tr> <td nowrap> 
  	<table  width="100%" > <tr bordercolor="#FFFFFF"> <td nowrap> 
        <table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trclear"> 
            	<td nowrap width="50%" align="right">Código Concepto: </td>
            	<td nowrap width="50%" align="left">
            	<input type="text" name="E01TXRCOD" size="6" maxlength="4" value="<%= ETX9010Record.getE01TXRCOD()%>">
					<B><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></B>
				</td>
			</tr>
			<tr id="trdark"> 
				<td nowrap width="50%" align="right">Descripción Concepto : </td>
				<td nowrap width="50%" align="left">
				<eibsinput:text name="ETX9010Record" property="E01TXRDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true"/></td>
			</tr>        
        	<tr id="trclear">
				<td nowrap width="50%" align="right">Tipo Base : </td>
				<td nowrap width="50%" align="left"> 
              		<SELECT name="E01TXRTBS" <%= disabled %> >
						<OPTION <%= ETX9010Record.getE01TXRTBS().trim().equals("P")?"Selected":"" %> value="P">%</OPTION>
						<OPTION <%= ETX9010Record.getE01TXRTBS().trim().equals("U")?"Selected":"" %> value="U">UVT</OPTION>
			  		</SELECT>
			  		<%=mandatory %>
				</td>
			</tr>
        	<tr id="trdark"> 
				<td nowrap width="50%" align="right">Valor Base : </td>
				<td nowrap width="50%" align="left">
				<eibsinput:text name="ETX9010Record" property="E01TXRBAS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="true"/></td>
			</tr>
			<tr id="trclear"> 
				<td nowrap width="50%" align="right">Tarifa : </td>
				<td nowrap width="50%" align="left">
				<eibsinput:text name="ETX9010Record" property="E01TXRTAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" required="true"/></td>
			</tr>
			<tr id="trdark"> 
				<td nowrap width="50%" align="right">Cuenta Gl Retención Practicada Por el Banco : </td>
				<td nowrap width="25%" align="left">
				<input type="text" name="E01TXRRPP" size="20" maxlength="16" value="<%= ETX9010Record.getE01TXRRPP()%>" onkeypress="enterInteger(event)">
					<A href="javascript:GetLedger('E01TXRRPP',document.forms[0].E01TXRBNK.value,'','')"> 
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
					</A>
					<B><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></B>
				<%= ETX9010Record.getD01TXRRPP() %>
				</td>
			</tr>
			<tr id="trclear"> 
				<td nowrap width="50%" align="right">Cuenta Gl Retención Practicada Al Banco : </td>
				<td nowrap width="50%" align="left">
				<input type="text" name="E01TXRRPA" size="20" maxlength="16" value="<%= ETX9010Record.getE01TXRRPA()%>" onkeypress="enterInteger(event)">
					<A href="javascript:GetLedger('E01TXRRPA',document.forms[0].E01TXRBNK.value,'','')"> 
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
					</A>
					
				<%= ETX9010Record.getD01TXRRPA() %>
				</td>
			</tr>
			<tr id="trdark"> 
				<td nowrap width="50%" align="right">Tarifa del IVA Descontable para Régimen Simplificado : </td>
				<td nowrap width="50%" align="left">
				<eibsinput:text name="ETX9010Record" property="E01TXRPID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" required="flase" readonly="true" /></td>
			</tr>
		</table>
	</td> </tr></table>

    
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

<SCRIPT type="text/javascript">

</SCRIPT>


</html>
