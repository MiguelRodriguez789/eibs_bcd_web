<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA000002Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

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

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 	String read = " ";
 	Boolean isReadOnly = false;
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  isReadOnly = true;
		}
%>

<h3 align="center">Horario de Interfaces y Canales para <%= userPO.getIdentifier().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="interfaces_channels_schedule.jsp, ECA0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0000" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="15">
  <INPUT TYPE=HIDDEN NAME="E01ICANOI" VALUE="<%= msgRcd.getE02ISCNOI() %>">
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="trdark">
				<td nowrap width=10% align="right">Codigo : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02ISCNOI" size="12" maxlength="10" value="<%= userPO.getIdentifier().trim() %>" readonly>
				</td>
            	<td nowrap width=10% align="right">Descripción : </td>
            	<td nowrap width=40% align="left">
            		<input type="text" name="D02NOIDSC" size="50" maxlength="45" value="<%= msgRcd.getD02NOIDSC() %>" readonly>
       			</td>
	  		</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Tipo de Producto : </td>
				<td nowrap width=40% align="left">
					<eibsinput:cnofc name="msgRcd" property="E02ISCPTY" value="<%=msgRcd.getE02ISCPTY()%>" required="false" flag="04" fn_code="E02ISCPTY" fn_description="D02PTYDSC" readonly="<%=isReadOnly %>"/> 
					<input TYPE="text" NAME="D02PTYDSC" value="<%=msgRcd.getD02PTYDSC()%>" readonly>	
				</td>
				<td nowrap width=10% align="right">Cuenta : </td>
				<td  nowrap width=40% align="left">
					<INPUT type="text" name="E02ISCACC" size="13"  maxlength="12" <%= read %>  value="<%= msgRcd.getE02ISCACC().trim()%>">
					<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
					<A href="javascript:GetAccByClient('E02ISCACC','','','','');">
					<IMG src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" align="bottom" border="0">
					</A> 
					<% } %>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width=10% align="right">Sucursal : </td>
				<td  nowrap width=40% align="left">
	              <input type="text" name="E02ISCBRN" size="5" maxlength="4" value="<%= msgRcd.getE02ISCBRN().trim()%>">
	              <a href="javascript:GetBranch('E02ISCBRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a>
				</td>
            	<td nowrap width=10% align="right">Secuencia :  </td>
            	<td  nowrap width=40% align="left">
					<eibsinput:text name="msgRcd" property="E02ISCSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="2" required="true" readonly="<%=isReadOnly %>"/>
       			</td>
	  		</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Fecha Efectiva : </td>
				<td  nowrap width=40% align="left">
					<eibsinput:date name="msgRcd" fn_year="E02ISCEFY" fn_month="E02ISCEFM" fn_day="E02ISCEFD" required="true" readonly="<%=isReadOnly %>"/>
				</td>
            	<td nowrap width=10% align="right">Día : </td>
            	<td  nowrap width=40% align="left">
            		<select name="E02ISCDAY">
          	  		<option value="*ALL" <% if (msgRcd.getE02ISCDAY().equals("*ALL")) out.print("selected"); %> >TODOS</option>
          	  		<option value="*WRK" <% if (msgRcd.getE02ISCDAY().equals("*WRK")) out.print("selected"); %> >HABILES</option>
          	  		<option value="*MON" <% if (msgRcd.getE02ISCDAY().equals("*MON")) out.print("selected"); %> >LUNES</option>
                	<option value="*TUE" <% if (msgRcd.getE02ISCDAY().equals("*TUE")) out.print("selected"); %> >MARTES</option>
                	<option value="*WED" <% if (msgRcd.getE02ISCDAY().equals("*WED")) out.print("selected"); %> >MIERCOLES</option>
                	<option value="*THU" <% if (msgRcd.getE02ISCDAY().equals("*THU")) out.print("selected"); %> >JUEVES</option>
                	<option value="*FRI" <% if (msgRcd.getE02ISCDAY().equals("*FRI")) out.print("selected"); %> >VIERNES</option>
                	<option value="*SAT" <% if (msgRcd.getE02ISCDAY().equals("*SAT")) out.print("selected"); %> >SABADO</option>
                	<option value="*SUN" <% if (msgRcd.getE02ISCDAY().equals("*SUN")) out.print("selected"); %> >DOMINGO</option>
           			</select><%=mandatory %>
       			</td>
	  		</tr>
	  		<tr id="trdark">
				<td nowrap width=10% align="right">Desde Hora : </td>
				<td nowrap width=40% align="left">
					<eibsinput:text name="msgRcd" property="E02ISCFTH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="true" readonly="<%=isReadOnly %>"/>:
					<eibsinput:text name="msgRcd" property="E02ISCFTM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="true" readonly="<%=isReadOnly %>"/>
				</td>
				<td nowrap width=10% align="right">Hasta Hora : </td>
				<td  nowrap width=40% align="left">
					<eibsinput:text name="msgRcd" property="E02ISCTTH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="true" readonly="<%=isReadOnly %>"/>:
					<eibsinput:text name="msgRcd" property="E02ISCTTM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="true" readonly="<%=isReadOnly %>"/>
				</td>
			</tr>
   		</table> 
      </td>  
    </tr>
  </table>
	
   	
<br>
	
	<table width="100%">		
  	<tr>
  		<td width="50%">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(15);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(11);" 
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
            	<%= msgRcd.getE02CUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE02MUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left"> 
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE02CDM()),Integer.parseInt(msgRcd.getE02CDD()),Integer.parseInt(msgRcd.getE02CDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE02MDM()),Integer.parseInt(msgRcd.getE02MDD()),Integer.parseInt(msgRcd.getE02MDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE02CTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE02MTM()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  
</form>
</body>

	<SCRIPT type="text/javascript">
		
	</SCRIPT>

</html>
