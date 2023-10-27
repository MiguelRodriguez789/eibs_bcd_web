<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Detalle Tabla ICA</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="ETX9030Record" class="datapro.eibs.beans.ETX903001Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar el registro seleccionado?")) {
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
	String read1 = "";
	String disabled = "";
	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
	Boolean isReadOnly = false;
 	 	
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  isReadOnly = true;
		}	
	
 	if (userPO.getPurpose().equals("MAINTENANCE")) 
		{ read1 = " readonly ";
		isReadOnly = true;
				  
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
				   %>Detalle ICA por Ciudad/Actividad Económica<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ica_table_details.jsp, ETX9030">
</H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSETX9030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

  
<table width="100%"> <tr> <td nowrap> 
  	<table  width="100%" > <tr bordercolor="#FFFFFF"> <td nowrap> 
        <table class="tableinfo" cellspacing="0" width="100%" border="0">
           <tr id="trdark">             
            	<td nowrap width="50%" align="right">Banco : </td>
            	<td nowrap width="50%" align="left">
                    <input type="text" name="E01TXIBNK" value="<%= ETX9030Record.getE01TXIBNK().trim()%>"  size="2" maxlength="2" <%=read%> <%=read1%> /> 
				</td> 
			</tr>
			<tr id="trdark"> 
            	<td nowrap width="50%" align="right">Departamento : </td>
            	  <td nowrap width="50%" align="left">            	
            		<input type="text" name="E01TXICST" size="5" maxlength="2" value="<%= ETX9030Record.getE01TXICST().trim()%>" <%=read%> <%=read1%>
            	 <%=(ETX9030Record.getE01TXICST().trim().equals("Y"))?"class=\"txtchanged\"":"" %>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01TXICST','D01TXICST','27', '','CO')" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01TXICST" size="20" value="<%= ETX9030Record.getD01TXICST().trim()%>" readonly><br>
            				</td>
			<tr id="trclear"> 			
            	<td nowrap width="50%" align="right">Ciudad : </td>
            	<td nowrap width="50%" align="left">
            	<input type="text" name="E01TXICTY" size="5" maxlength="4" value="<%= ETX9030Record.getE01TXICTY().trim()%>" <%=read%> <%=read1%>
            	 <%=(ETX9030Record.getE01TXICTY().trim().equals("Y"))?"class=\"txtchanged\"":"" %>> 
            		<% if ( !isReadOnly ){%>
            		<a href="javascript:Get2FilterCodes('E01TXICTY','D01TXICTY','84', '',document.forms[0]['E01TXICST'].value)" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01TXICTY" size="20" value="<%= ETX9030Record.getD01TXICTY().trim()%>" readonly> 
            	
				</td>
			</tr>
			<tr id="trdark"> 
				<td nowrap width="50%" align="right">Actividad Económica: </td>
				<td nowrap width="50%" align="left">
				<% if (read1.equals("")){%>
					<eibsinput:cnofc name="ETX9030Record" flag="12" property="E01TXICOD" fn_code="E01TXICOD" fn_description="D01TXICOD" required="true" />
				<% }else{ %>	
				    <input type="text" name="E01TXICOD" size="5" maxlength="4" value="<%= ETX9030Record.getE01TXICOD().trim()%>" <%=read%> readonly>
					<% }%>
					<eibsinput:text  name="ETX9030Record" property="D01TXICOD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>			
				</td>
			</tr>        
        	<tr id="trclear">
				<td nowrap width="50%" align="right">Tarifa ICA: </td>
				<td nowrap width="50%" align="left"> 
              		<eibsinput:text name="ETX9030Record" property="E01TXITAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" required="true"/>
                    <select name="D01EXP"   >
                		<option <%= ETX9030Record.getD01EXP().trim().equals(" ")?"selected":"" %> value=" "></option>    
						<option <%= ETX9030Record.getD01EXP().trim().equals("P")?"selected":"" %> value="P">PORCENTAJE / TASA</option>
						<option <%= ETX9030Record.getD01EXP().trim().equals("A")?"selected":"" %> value="A">MONTO</option>
						<option <%= ETX9030Record.getD01EXP().trim().equals("U")?"selected":"" %> value="U">UVT</option>
					</select>
				</td>
			</tr>
        	<tr id="trdark"> 
				<td nowrap width="50%" align="right">Valor Base ICA: </td>
				<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9030Record" property="E01TXIBAS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="true"/>
                    <select name="D01TBS"   >
                        <option <%= ETX9030Record.getD01TBS().trim().equals(" ")?"selected":"" %> value=" "></option>                
                        <option <%= ETX9030Record.getD01TBS().trim().equals("A")?"selected":"" %> value="A">MONTO</option>
						<option <%= ETX9030Record.getD01TBS().trim().equals("R")?"selected":"" %> value="R">PORCENTAJE / TASA</option>
						<option <%= ETX9030Record.getD01TBS().trim().equals("U")?"selected":"" %> value="U">UVT</option>
						<option <%= ETX9030Record.getD01TBS().trim().equals("D")?"selected":"" %> value="D">DOCUMENTO</option>
					</select>
				</td>
			</tr>
        	<tr id="trdark"> 
				<td nowrap width="50%" align="right">Aplica para tipo de Cliente: </td>
				<td nowrap width="50%" align="left">
					
                    <select name="E01ACT"   >
                        <OPTION value="1" <%if (ETX9030Record.getE01ACT().equals("1")) out.print("selected"); %>>Jurídico</OPTION>
						<OPTION value="2" <%if (ETX9030Record.getE01ACT().equals("2")) out.print("selected"); %>>Natural</OPTION>						
                        <OPTION value="0" <%if (ETX9030Record.getE01ACT().equals("0")) out.print("selected"); %>>Ambos</OPTION>
					</select>
				</td>
			</tr>				
		       <%--	</tr>
				<td nowrap width="50%" align="right">Activo para Autoretención: </td>
				<td nowrap width="50%" align="left"> 
              		<input type="radio" name="E01TXIAUT" value="Y" <%if (ETX9030Record.getE01TXIAUT().equals("Y")) out.print("checked"); %>>
                    Si 
                    <input type="radio" name="E01TXIAUT" value="N" <%if (!ETX9030Record.getE01TXIAUT().equals("Y")) out.print("checked"); %>>
                    No
				</td>
			</tr>
        	<tr id="trdark"> 
				<td nowrap width="50%" align="right">% Autoretención: </td>
				<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9030Record" property="E01TXIPAT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" required="false"/>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="50%" align="right">% Impuesto de Avisos y Tableros: </td>
				<td nowrap width="50%" align="left"> 
              		<eibsinput:text name="ETX9030Record" property="E01TXIPIA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" required="false"/>
				</td>
			</tr>
        	<tr id="trdark"> 
				<td nowrap width="50%" align="right">Unidades Adicionales: </td>
				<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9030Record" property="E01TXIUAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false"/>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="50%" align="right">% Sobretasa: </td>
				<td nowrap width="50%" align="left"> 
              		<eibsinput:text name="ETX9030Record" property="E01TXIPSB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" required="false"/>
				</td>
			</tr> --%>
			<tr id="trclear">
            	<td nowrap width="50%" align="right">Cuenta Contable de Retención por Pagar</td>
            	<td nowrap width="50%" align="left">
              		<eibsinput:text name="ETX9030Record" property="D01TXIGL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="true" readonly="true"/>
					<A href="javascript:GetLedger('D01TXIGL1',document.forms[0].E01TXIBNK.value,'','')"> 
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
					</A>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="50%" align="right">Cuenta Contable de Retención Pagada</td> 
				<td nowrap width="50%" align="left"> 
              		<eibsinput:text name="ETX9030Record" property="D01TXIGL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>"  readonly="false"/>
					<A href="javascript:GetLedger('D01TXIGL2',document.forms[0].E01TXIBNK.value,'','')"> 
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
					</A>						
     
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
