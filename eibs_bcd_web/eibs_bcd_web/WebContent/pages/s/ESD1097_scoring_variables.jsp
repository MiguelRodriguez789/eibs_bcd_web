<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Variables Scoring Detail</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.ESD109701Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
   
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">
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
	if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("INQUIRY")) readMnt = " readonly ";
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
 de Variables Scoring LAFT
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="scoring_variables.jsp, ESD1097"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1097" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01LGT" VALUE="<%= msgRcd.getE01LGT().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01VAR" VALUE="<%= msgRcd.getE01VAR().trim()%>">
  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right"><b>Tipo Legal / Variable : </b></td>
            <td nowrap align="left" width="35%">
            	<% if (msgRcd.getE01LGT().equals("1")) out.print("Jurídico ");
				    else if (msgRcd.getE01LGT().equals("2")) out.print("Persona");
				%> / <%= msgRcd.getE01VAR().trim()%> - <%= msgRcd.getE01DSC().trim()%> 
			</td>
            <td nowrap width="15%" align="right"><b>Estado : </b></td>
            <td nowrap width="35%" align="left"> 
              	<SELECT name="E01STS" <%= disabled %>> 
					<OPTION <%= msgRcd.getE01STS().trim().equals("A")?"Selected":"" %> value="A">Activo</OPTION>
					<OPTION <%= msgRcd.getE01STS().trim().equals("I")?"Selected":"" %> value="I">Inactivo</OPTION>
				</SELECT>
				<%=mandatory %>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right"><b>Tipo : </b></td>
			<td nowrap width="35%" align="left">
                <% if (msgRcd.getE01TYP().equals("AMT")) out.print("RANGO MONTOS");
				    else if (msgRcd.getE01TYP().equals("FLG")) out.print("VALOR");
				    else if (msgRcd.getE01TYP().equals("CNO")) out.print("TABLA");
				    else if (msgRcd.getE01TYP().equals("BRN")) out.print("OFICINA");
				    else if (msgRcd.getE01TYP().equals("AGE")) out.print("EDAD"); 
				 %>
            </td>
            <td nowrap width="15%" align="right"><B>Peso en % : </B></td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="msgRcd" property="E01WGT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" size="10" required="true" readonly="<%=readOnly%>"/>
            </td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  
    <table width="100%">		
  	<tr>
  		<td width="50%">
  			<% if (!isInquiry)  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
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
            	<%= msgRcd.getE01CUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01LMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left"> 
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01CDM()),Integer.parseInt(msgRcd.getE01CDD()),Integer.parseInt(msgRcd.getE01CDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01LMM()),Integer.parseInt(msgRcd.getE01LMD()),Integer.parseInt(msgRcd.getE01LMY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01CTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01LMT()%>
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
