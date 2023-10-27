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

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.EMB001001Message"  scope="session" />
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
Mantenimiento
<% } else {%>
Consulta
<% } %>
 de Embargos
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="embargos_detail.jsp, EMB0010"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEMB0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01EMBCTM" VALUE="<%= msgRcd.getE01EMBCTM()%>">
  <INPUT TYPE=HIDDEN NAME="E01EMBLUT" VALUE="<%= msgRcd.getE01EMBLUT()%>">
  
  
  <% int row = 0; %>  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Cliente : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01EMBCUN" maxlength="9" size="10" <%= readMnt %> value="<%= msgRcd.getE01EMBCUN().trim()%>">
				<% if (userPO.getPurpose().equals("NEW"))  { %>
					<A href="javascript:GetCustomerDescId('E01EMBCUN','D01CUN','')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
					</A>
				<% } %>
            	<INPUT type="text" name="D01CUN" maxlength="45" size="46" readonly value="<%= msgRcd.getD01CUN().trim()%>">
            	<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Tipo de Embargo : </td>
			<td nowrap align="left" width="35%">
				<eibsinput:cnofc name="msgRcd" property="E01EMBTSE" value="<%=msgRcd.getE01EMBTSE()%>" required="true" flag="EB" fn_code="E01EMBTSE" fn_description="D01TSE" readonly="<%=isReadOnly%>" />
            	<INPUT type="text" name="D01TSE" size="47" readonly value="<%= msgRcd.getD01TSE().trim()%>">
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Embargo Número : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01EMBNUM" maxlength="12" size="15" <%=readMnt%> value="<%= msgRcd.getE01EMBNUM().trim()%>" onkeypress="enterInteger(event)">
            	<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Solicitado Por : </td>
			<td nowrap align="left" width="35%">
            	<eibsinput:help name="msgRcd" property="E01EMBCOU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" fn_param_one="E01EMBCOU" fn_param_two="D01COU" fn_param_three="B" readonly="<%=isReadOnly%>" />
            	<INPUT type="text" name="D01COU" size="47" readonly value="<%= msgRcd.getD01COU().trim()%>">
			</td>
          </tr>
                  <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
            <td nowrap width=10% align="right">Estado : </td>
            <td  nowrap width=40% align="left">
            	<select name="E01EMBSTS" disabled>
          		<option value="P" <% if (msgRcd.getE01EMBSTS().equals("P")) out.print("selected"); %>>PENDIENTE</option>
               	<option value="A" <% if (msgRcd.getE01EMBSTS().equals("A")) out.print("selected"); %>>ACTIVO</option>
               	<option value="C" <% if (msgRcd.getE01EMBSTS().equals("C")) out.print("selected"); %>>CANCELADO/INACTIVO</option>
           		</select>
       		</td>
			<td nowrap width=10% align="right">Documento  Número : </td>
			<td  nowrap width=40% align="left">
				<INPUT type="text" name="E01EMBNDC" maxlength="25" size="30" value="<%= msgRcd.getE01EMBNDC().trim()%>" <%=read%>>
            </td>
	      </tr>	
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Comunicación Número : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01EMBNOF" maxlength="25" size="30" value="<%= msgRcd.getE01EMBNOF().trim()%>" <%=read%>>
			</td>
            <td nowrap width="15%" align="right">Fecha de Documento : </td>
			<td nowrap align="left" width="35%">
            	<eibsinput:date name="msgRcd" required="false" fn_year="E01EMBNDY" fn_month="E01EMBNDM" fn_day="E01EMBNDD" readonly="<%=isReadOnly%>"/>
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Monto : </td>
			<td  nowrap width=40% align="left">
				<eibsinput:text name="msgRcd" property="E01EMBAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=isReadOnly%>"/>
      		</td>
            <td nowrap width=10% align="right">Porcentaje : </td>
            <td  nowrap width=40% align="left">
            	<eibsinput:text name="msgRcd" property="E01EMBPOR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" readonly="<%=isReadOnly%>" />
       		</td>
	      </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Fecha / Hora Recepción : </td>
            <td nowrap align="left" width="35%">
            	<eibsinput:date name="msgRcd" required="false" fn_year="E01EMBRDY" fn_month="E01EMBRDM" fn_day="E01EMBRDD" readonly="<%=isReadOnly%>"/> /
            	<eibsinput:text name="msgRcd" property="E01EMBRDT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="false" readonly="<%=isReadOnly %>"/>
			</td>
            <td nowrap width="15%" align="right">Fecha / Hora  de Retención : </td>
			<td nowrap align="left" width="35%">
            	<eibsinput:date name="msgRcd" required="false" fn_year="E01EMBHDY" fn_month="E01EMBHDM" fn_day="E01EMBHDD" readonly="true"/> / 
            	<eibsinput:text name="msgRcd" property="E01EMBHDT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="false" readonly="true"/>
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right"></td>
            <td nowrap align="left" width="35%">
			</td>
            <td nowrap width="15%" align="right">Fecha / Hora Liberación : </td>
			<td nowrap align="left" width="35%">
            	<eibsinput:date name="msgRcd" required="false" fn_year="E01EMBLDY" fn_month="E01EMBLDM" fn_day="E01EMBLDD" readonly="true"/> /
            	<eibsinput:text name="msgRcd" property="E01EMBLDT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="false" readonly="true"/>
			</td>
          </tr>
	      <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Monto Retenido : </td>
			<td  nowrap width=40% align="left">
				<eibsinput:text name="msgRcd" property="E01EMBAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
      		</td>
            <td nowrap width=10% align="right">Monto Trasladado : </td>
            <td  nowrap width=40% align="left">
            	<eibsinput:text name="msgRcd" property="E01EMBAM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
       		</td>
	      </tr> 
	      <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Comentarios : </td>
			<td  nowrap width=40% align="left">
          		<eibsinput:text name="msgRcd" property="E01EMBRM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" maxlength="80" required="false" readonly="<%=isReadOnly %>" /><br>
          		<eibsinput:text name="msgRcd" property="E01EMBRM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" maxlength="80" required="false" readonly="<%=isReadOnly %>" /><br>
          		<eibsinput:text name="msgRcd" property="E01EMBRM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" maxlength="80" required="false" readonly="<%=isReadOnly %>" /><br>
          		<eibsinput:text name="msgRcd" property="E01EMBRM4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" maxlength="80" required="false" readonly="<%=isReadOnly %>" />
			</td>
			<td nowrap width=10% align="right"></td>
			<td nowrap width=40% align="left">
			</td>
	      </tr>	   

	   </table> 
      </td>  
    </tr>
  </table>
  
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
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
            	<%= msgRcd.getE01EMBCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01EMBLUU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01EMBCDM()),Integer.parseInt(msgRcd.getE01EMBCDD()),Integer.parseInt(msgRcd.getE01EMBCDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01EMBLUM()),Integer.parseInt(msgRcd.getE01EMBLUD()),Integer.parseInt(msgRcd.getE01EMBLUY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01EMBCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01EMBLUT()%>
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
