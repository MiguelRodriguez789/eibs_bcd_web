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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ERP000002Message"  scope="session" />
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
	submitForm();
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
 	String disabled = "";
 	Boolean isReadOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")) || (!currUser.getE01AUT().equals("A"))) {
		read = " readonly "; 
		disabled = " disabled";
		isReadOnly = true;
	}
	String readNew = " "; 
	String disabledNew = " ";
	Boolean isReadOnlyNew = false;
	if (!userPO.getPurpose().equals("NEW")) {
		readNew = " readonly ";
 		disabledNew = " disabled";
 		isReadOnlyNew = true;
	}
%>

<h3 align="center">Parámetro para Reporte / Proceso <%= userPO.getHeader2().trim() %> 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="report_parameter.jsp, ERP0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSERP0000" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="15">
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="trdark">
				<td nowrap width=10% align="right">Nombre del reporte : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02RPTRPN" size="12" maxlength="10" value="<%= msgRcd.getE02RPTRPN() %>" readonly>
					<input type="text" name="D02IBSDSC" size="50" maxlength="45" value="<%= msgRcd.getD02IBSDSC() %>" readonly>
				</td>
            	<td nowrap width=10% align="right"></td>
            	<td nowrap width=40% align="left">
            		
       			</td>
	  		</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Idioma : </td>
				<td nowrap width=40% align="left">
					<select name="E02RPTLIF" disabled>
          	  		<option value="S" <% if (msgRcd.getE02RPTLIF().equals("S")) out.print("selected"); %>>Español</option>
                	<option value="E" <% if (msgRcd.getE02RPTLIF().equals("E")) out.print("selected"); %>>Ingles</option>
           			</select>	
				</td>
				<td nowrap width=10% align="right"></td>
				<td  nowrap width=40% align="left">
				</td>
			</tr>
	  		<tr id="trdark">
				<td nowrap width=10% align="right">Secuencia : </td>
				<td nowrap width=40% align="left">
					<eibsinput:text name="msgRcd" property="E02RPTSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="2" required="true" readonly="<%=isReadOnly %>" />
				</td>
				<td nowrap width=10% align="right">Ocultar : </td>
				<td  nowrap width=40% align="left">
					<select name="E02RPTHID" <%=disabled %>>
          	  		<option value="Y" <% if (msgRcd.getE02RPTHID().equals("Y")) out.print("selected"); %>>SI</option>
                	<option value="N" <% if (!msgRcd.getE02RPTHID().equals("Y")) out.print("selected"); %>>NO</option>
           			</select><%=mandatory %>
				</td>
			</tr>
			
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Parámetro : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02RPTCOD" size="4" maxlength="2" value="<%=msgRcd.getE02RPTCOD()%>" <%=readNew %>>
            		<input type="text" name="D02CODDSC" size="50" maxlength="45"  value="<%=msgRcd.getD02CODDSC()%>" readonly><%=mandatory %>
            		<% if ( !isReadOnlyNew) {%>
              		<a href="javascript:GetFieldRpt('E02RPTCOD','D02CODDSC', document.forms[0]['E02RPTLIF'].value)" >
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            		<% } %>
				</td>
				<td nowrap width=10% align="right"> Tipo : </td>
				<td  nowrap width=40% align="left">
					<% if (msgRcd.getE02RPTPTY().equals("A")) out.print("ALFANUMERICO - ");%>
          			<% if (msgRcd.getE02RPTPTY().equals("N")) out.print("NUMERICO - "); %>
          			<% if (msgRcd.getE02RPTPTY().equals("Z")) out.print("NUMERICO - "); %>
            		<% if (msgRcd.getE02RPTPTY().equals("D")) out.print("FECHA - "); %>
            		<% if (msgRcd.getE02RPTPTY().equals("Z")) { 
            				out.print(msgRcd.getE02RPTPLN() + "," + msgRcd.getE02RPTNDC());
            			} else {
            				out.print(msgRcd.getE02RPTPLN());
            			}
            		%>		
				</td>
			</tr>
	  		<tr id="trdark">
				<td nowrap width=10% align="right">Instrucciones : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02RPTINS" size="120" maxlength="256" value="<%=msgRcd.getE02RPTINS()%>" <%= read %>>
				</td>
				<td nowrap width=10% align="right"></td>
				<td  nowrap width=40% align="left">
				</td>
			</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Valor por Defecto : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02RPTDFT" size="120" maxlength="256" value="<%=msgRcd.getE02RPTDFT()%>" <%= read %> style="text-transform: none">
				</td>
				<td nowrap width=10% align="right"></td>
				<td  nowrap width=40% align="left">
				</td>
			</tr>
	  		<tr id="trdark">
				<td nowrap width=10% align="right">Script de Ayuda : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02RPTHLP" size="120" maxlength="256" value="<%=msgRcd.getE02RPTHLP()%>" <%= read %> style="text-transform: none">
				</td>
				<td nowrap width=10% align="right"></td>
				<td  nowrap width=40% align="left">
				</td>
			</tr>
	  		<tr id="trdark">
				<td nowrap width=10% align="right"></td>
				<td nowrap width=40% align="left">
					El Script debe llevar el nombre de la variable que recibe y los filtos de la ayuda como se indica en el ejemplo : <BR>
					Ej.<BR>
						GetCodeDescCNOFC('E01PMSVAL_1', ' ' , '34')
						<BR><BR>
						Este ayuda traerá el valor de la tabla 34 del CNOFC a la variable E01PMSVAL_1 (Siempre E01PMSVAL_...)<BR>
						En esta caso el numero l corrsponde al parametro en secuencia 2 (debe ser la secuencia menos 1).
				</td>
				<td nowrap width=10% align="right"></td>
				<td  nowrap width=40% align="left">
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
  		<% if ((userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")) && (currUser.getE01AUT().equals("A")))  { %>
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
</html>
