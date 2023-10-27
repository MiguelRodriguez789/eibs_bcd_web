<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Variables Scoring LAFT</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
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
 Valores para Variables Scoring LAFT
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="scoring_variables_values.jsp, ESD1097"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1097" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="15">
  <INPUT TYPE=HIDDEN NAME="E01LGT" VALUE="<%= msgRcd.getE01LGT().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01VAR" VALUE="<%= msgRcd.getE01VAR().trim()%>">
  <INPUT TYPE=HIDDEN id="E01SEQ" NAME="E01SEQ" VALUE="<%= msgRcd.getE01SEQ().trim()%>">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
      	<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
   			<td nowrap width="15%" align="right"><b>Tipo Legal / Variable : </b></td>
			<td nowrap width="35%">
				<% if (msgRcd.getE01LGT().equals("1")) out.print("Jurídico ");
				    else if (msgRcd.getE01LGT().equals("2")) out.print("Persona");
				%> / <%= msgRcd.getE01VAR().trim()%> - <%= msgRcd.getE01DSC().trim()%> 
            </td>
            <td nowrap width="15%" align="right"><b>Estado : </b></td>
            <td nowrap width="35%" align="left"> 
                <% if (msgRcd.getE01STS().equals("I")) out.print("<FONT color=\"red\"> INACTIVO");
				    else if (msgRcd.getE01STS().equals("A")) out.print("<FONT color=\"#d0122c\"> ACTIVO");
				 %>
			</td>
        </tr> 
		<tr id="trclear">  
            <td nowrap width="15%" align="right"><b>Peso en % : </b></td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01WGT().trim()%>
			</td>
            <td nowrap width="15%" align="right"><b>Tipo : </b></td>
			<td nowrap width="35%" align="left">
				<% if (msgRcd.getE01TYP().equals("AMT")) out.print("RANGO MONTOS");
				    else if (msgRcd.getE01TYP().equals("FLG")) out.print("VALOR");
				    else if (msgRcd.getE01TYP().equals("CNO")) out.print("TABLA");
				    else if (msgRcd.getE01TYP().equals("BRN")) out.print("OFICINA");
				    else if (msgRcd.getE01TYP().equals("AGE")) out.print("EDAD"); 
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
            <td nowrap width="15%" align="right">Secuencia : </td>
            <td nowrap align="left" width="35%"><%= msgRcd.getE01SEQ().trim()%></td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left"></td>
          </tr>
          <tr id="trclear"> 
          	<% if (msgRcd.getE01TYP().equals("AMT")) { %>
            <td nowrap width="15%" align="right">Rango Inicial : </td>
			<td nowrap width="35%" align="left">
                <eibsinput:text name="msgRcd" property="E01RAI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" size="18" required="true" readonly="<%=readOnly%>"/>
            </td>
            <td nowrap width="15%" align="right">Rango Final : </td>
			<td nowrap width="35%" align="left">
                <eibsinput:text name="msgRcd" property="E01RAF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" size="18" required="true" readonly="<%=readOnly%>"/> 
            </td>
            <% } else if (msgRcd.getE01TYP().equals("FLG")) { %>
			<td nowrap width="15%" align="right">Valor : </td>
			<td nowrap width="35%" align="left">
                <SELECT class="inputs" name="E01FLG" size="1"></SELECT>
            </td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left"></td>
			<% } else if (msgRcd.getE01TYP().equals("CNO")) { %>
			<td nowrap width="15%" align="right">Valor : </td>
			<td nowrap width="35%" align="left">
                <eibsinput:cnofc name="msgRcd" property="E01CNO" value="<%=msgRcd.getE01CNO()%>" required="true" flag="<%= msgRcd.getE01TBL()%>" fn_code="E01CNO" fn_description="D01RCD" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01RCD" value="<%=msgRcd.getD01RCD()%>" size=45 readonly>
            </td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left"></td>
			<% } else if (msgRcd.getE01TYP().equals("BRN")) { %>
			<td nowrap width="15%" align="right">Valor : </td>
			<td nowrap width="35%" align="left">
				<eibsinput:help name="msgRcd" property="E01BRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true" fn_param_one="E01BRN" fn_param_two="" fn_param_three="D01RCD" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01RCD" value="<%=msgRcd.getD01RCD()%>" size=45 readonly>
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left"></td>	
			<% } else if (msgRcd.getE01TYP().equals("AGE")) { %>
			<td nowrap width="15%" align="right">Edad Inicial : </td>
			<td nowrap width="35%" align="left">
                <eibsinput:text name="msgRcd" property="E01RAI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" required="true" readonly="<%=readOnly%>"/>
            </td>
            <td nowrap width="15%" align="right">Edad Final : </td>
			<td nowrap width="35%" align="left">
                <eibsinput:text name="msgRcd" property="E01RAF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" required="true" readonly="<%=readOnly%>"/> 
            </td>
            <% } %>
          </tr>
          <% if (msgRcd.getE01TYP().equals("AMT") && msgRcd.getE01SEQ().equals("1")) { %>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Tipo de Reporte Financiero : </td>
            <td nowrap align="left" width="35%">
            	<SELECT class="inputs" name="E01FLG" size="1"></SELECT>
            </td>
            <td nowrap width="15%" align="right">Nro. de Reporte Financiero : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="msgRcd" property="E01CNO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" required="true" readonly="<%=readOnly%>"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Linea de Reporte Financiero : </td>
            <td nowrap align="left" width="35%">
            	<eibsinput:text name="msgRcd" property="E01BRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" required="true" readonly="<%=readOnly%>"/>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
          </tr>
          <% } %>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Porcentaje : </td>
            <td nowrap align="left" width="35%">
            	<eibsinput:text name="msgRcd" property="E01WGTD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" size="10" required="true" readonly="<%=readOnly%>"/>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left"></td>
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

<SCRIPT Language="Javascript">

  // Flag Combos
  <% if (msgRcd.getE01TYP().equals("FLG") || msgRcd.getE01TYP().equals("AMT")) { %>
  	tobox = document.forms[0].E01FLG;
  	tobox.options.length = 0;
  	tobox.options[tobox.options.length] = new Option(' ',' ',true,'selected');
  	<% if (msgRcd.getE01VAR().equals("CUSMST") && msgRcd.getE01LGT().equals("1")) { %>
  		tobox.options[tobox.options.length] = new Option('PRINCIPAL','P');
  		tobox.options[tobox.options.length] = new Option('AGENCIA','A');
  		tobox.options[tobox.options.length] = new Option('SUCURSAL','S');
  	<% } else if (msgRcd.getE01VAR().equals("CUSMST") && msgRcd.getE01LGT().equals("2")) { %>
  		tobox.options[tobox.options.length] = new Option('SOLTERO(A)','1');
  		tobox.options[tobox.options.length] = new Option('CASADO(A)','2');
  		tobox.options[tobox.options.length] = new Option('DIVORCIADO(A)','3');
  		tobox.options[tobox.options.length] = new Option('VIUDO(A)','4');
  		tobox.options[tobox.options.length] = new Option('UNION LIBRE','5');
  		tobox.options[tobox.options.length] = new Option('OTRO','6');
	<% } else if (msgRcd.getE01VAR().substring(0, 5).equals("CUSAM")) { %>
		tobox.options[tobox.options.length] = new Option('GENERAL','G');
  		tobox.options[tobox.options.length] = new Option('DETALLADO','D');
  		tobox.options[tobox.options.length] = new Option('FISCAL','F');
  	<% } else { %>
  		tobox.options[tobox.options.length] = new Option('SI','Y');
  		tobox.options[tobox.options.length] = new Option('NO','N');
  	<% } %>
  	for (m = 0; m < tobox.options.length; m++) {
  		if (tobox.options[m].value == '<%=msgRcd.getE01FLG()%>') tobox.options[m].selected = true;
  }
  <% } %>		
  //
  
</SCRIPT>


</html>
