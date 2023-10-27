<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Embargos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
</head>

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.EMB001002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
 
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">
<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
%>


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
Mantenimiento de Transacciones
<% } else {%>
Consulta de Transacciones
<% } %>
 de Embargos
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="embargos_accounts_detail.jsp, EMB0010"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEMB0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="15">
  <INPUT TYPE=HIDDEN NAME="E02EMDCTM" VALUE="<%= msgRcd.getE02EMDCTM()%>">
  <INPUT TYPE=HIDDEN NAME="E02EMDLUT" VALUE="<%= msgRcd.getE02EMDLUT()%>">
  
  
  <% int row = 0; %>  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Cliente : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E02EMDCUN" maxlength="9" size="10" readonly value="<%= msgRcd.getE02EMDCUN().trim()%>">
            	<INPUT type="text" name="D02CUN" maxlength="45" size="46" readonly value="<%= msgRcd.getD02CUN().trim()%>">
			</td>
            <td nowrap width="15%" align="right">Tipo de Embargo : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="D02TSE" size="47" readonly value="<%= msgRcd.getD02TSE().trim()%>">
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Embargo Número : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E02EMDNUM" maxlength="12" size="15" readonly value="<%= msgRcd.getE02EMDNUM().trim()%>" onkeypress="enterInteger(event)">
			</td>
            <td nowrap width="15%" align="right">Cuenta : </td>
			<td nowrap align="left" width="35%">
	           	<INPUT type="text" name="E02EMDACC" maxlength="12" size="15" readonly value="<%= msgRcd.getE02EMDACC().trim()%>" onkeypress="enterInteger(event)">
			</td>
          </tr>
                  <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
            <td nowrap width=10% align="right">Titularidad : </td>
            <td  nowrap width=40% align="left">
            	<% if (msgRcd.getE02EMDTIT().equals("R")) out.print("1er TITULAR - ");
			    else if (msgRcd.getE02EMDOPE().equals("S")) out.print("2do TITULAR - ");
			    else out.print("Otro - "); 
				%>
            	<INPUT type="text" name="E02EMDPTI" maxlength="12" size="15" readonly value="<%= msgRcd.getE02EMDPTI().trim()%>">
       		</td>
			<td nowrap width=10% align="right">Saldo a la Fecha : </td>
			<td  nowrap width=40% align="left">
				<eibsinput:text name="msgRcd" property="E02EMDAM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
	      </tr>	
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Ultima fecha de Retención : </td>
            <td nowrap align="left" width="35%">
            	<eibsinput:date name="msgRcd" required="false" fn_year="E02EMDHDY" fn_month="E02EMDHDM" fn_day="E02EMDHDD" readonly="true"/>
			</td>
            <td nowrap width="15%" align="right">Fecha de Liberación : </td>
			<td nowrap align="left" width="35%">
            	<eibsinput:date name="msgRcd" required="false" fn_year="E02EMDLDY" fn_month="E02EMDLDM" fn_day="E02EMDLDD" readonly="true"/>
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Monto Retenido por Embargo : </td>
			<td  nowrap width=40% align="left">
				<eibsinput:text name="msgRcd" property="E02EMDAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
      		</td>
            <td nowrap width=10% align="right">Monto Trasladado por Embargo : </td>
            <td  nowrap width=40% align="left">
            	<eibsinput:text name="msgRcd" property="E02EMDAM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
       		</td>
	      </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Operación : </td>
            <td nowrap align="left" width="35%">
				<select name="E02EMDOPE" <%=disabled%>>
				<option value=" " <% if (msgRcd.getE02EMDOPE().equals(" ")) out.print("selected"); %>> </option>
          		<option value="R" <% if (msgRcd.getE02EMDOPE().equals("R")) out.print("selected"); %>>RETENCION</option>
               	<option value="L" <% if (msgRcd.getE02EMDOPE().equals("L")) out.print("selected"); %>>LIBERACION</option>
               	<option value="T" <% if (msgRcd.getE02EMDOPE().equals("T")) out.print("selected"); %>>TRASLADO</option>
               	<option value="D" <% if (msgRcd.getE02EMDOPE().equals("D")) out.print("selected"); %>>BORRAR TRN PENDIENTE</option>
           		</select>
			</td>
            <td nowrap width="15%" align="right">Monto de la Operación : </td>
			<td nowrap align="left" width="35%">
            	<eibsinput:text name="msgRcd" property="E02EMDAM4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>"/>
			</td>
          </tr>
	   </table> 
      </td>  
    </tr>
  </table>
  
    <table width="100%">		
  	<tr>
  		<td width="33%" align="center"> 
  		  	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(15);" <%= disabled %>>
     		<% } %>
  		</td>
  		<td width="33%"  align="center"> 
  		  	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>  		
     		<input id="EIBSBTN" type="button" name="Delete" value="Borrar" onClick="goAction(14);" <%= disabled %>>
     		<% } %>
  		</td>
  		<td width="34%" align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(11);" 
			<% } else if (userPO.getPurpose().equals("APPROVAL")) { %>
				onClick="goAction(21);" 
			<% } else { %>
				onClick="goAction(16);"
			<% } %>>
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
            	<%= msgRcd.getE02EMDCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE02EMDLUU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE02EMDCDM()),Integer.parseInt(msgRcd.getE02EMDCDD()),Integer.parseInt(msgRcd.getE02EMDCDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE02EMDLUM()),Integer.parseInt(msgRcd.getE02EMDLUD()),Integer.parseInt(msgRcd.getE02EMDLUY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE02EMDCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE02EMDLUT()%>
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
