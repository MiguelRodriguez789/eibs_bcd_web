<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Detalle Bases UVT</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="ETX9020Record" class="datapro.eibs.beans.ETX902001Message"  scope="session" />  
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
				   %>Bases UVT<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="uvt_table_details.jsp, ETX9020">
</H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSETX9020" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

  
<table width="100%"> <tr> <td nowrap> 
  	<table  width="100%" > <tr bordercolor="#FFFFFF"> <td nowrap> 
        <table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr id="trclear"> 
            	<td nowrap width="50%" align="right">A�o Vencimiento : </td>
            	<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9020Record" property="E01TXUVDY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_YEAR %>" required="true"/>
				</td>
			</tr>
			<tr id="trdark"> 
				<td nowrap width="50%" align="right">Mes Vencimiento : </td>
				<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9020Record" property="E01TXUVDM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_MONTH %>" required="true"/>
				</td>
			</tr>        
        	<tr id="trclear">
				<td nowrap width="50%" align="right">Dia Vencimiento : </td>
				<td nowrap width="50%" align="left"> 
              		<eibsinput:text name="ETX9020Record" property="E01TXUVDD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAY %>" required="true"/>
				</td>
			</tr>
        	<tr id="trdark"> 
				<td nowrap width="50%" align="right">Valor Base UVT: </td>
				<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9020Record" property="E01TXUBAS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="true"/>
				</td>
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
