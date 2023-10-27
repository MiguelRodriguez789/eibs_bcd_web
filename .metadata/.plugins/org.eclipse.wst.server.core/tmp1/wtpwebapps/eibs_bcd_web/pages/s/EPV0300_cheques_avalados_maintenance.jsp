<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Cheques Avalados</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV030001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
    document.forms[0].submit();		
 }

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

</script>

</head>

<%
	boolean readOnly = false;
	boolean maintenance = false;
	boolean newOnly = false;
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null) {
		if (request.getParameter("readOnly").toLowerCase().equals("true")) {
			readOnly = true;
		}
	}
	// Determina si es nuevo o mantencion
	if (userPO.getPurpose().equals("NEW")) {
		newOnly = true;
	}
%>

<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly) {%>
	CONSULTA DE CHEQUE
<%} else if (newOnly) {%>
	NUEVO CHEQUE 
<%} else {%>
	MANTENIMIENTO DE CHEQUE
<%}%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cheques_avalados__maintenance.jsp, EPV0300"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0300" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="600">
	<INPUT TYPE=HIDDEN NAME="E01UNCBNK" id="E01UNCBNK" VALUE="<%=datarec.getE01UNCBNK().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01UNCBRN" id="E01UNCBRN" VALUE="<%=datarec.getE01UNCBRN().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01UNCACC" id="E01UNCACC" VALUE="<%=datarec.getE01UNCACC().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FRMDTM" id="E01FRMDTM" VALUE="<%=datarec.getE01FRMDTM().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FRMDTD" id="E01FRMDTD" VALUE="<%=datarec.getE01FRMDTM().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FRMDTY" id="E01FRMDTY" VALUE="<%=datarec.getE01FRMDTM().trim()%>">
	
	<%int row = 0;%>
 
<% if (!userPO.getAccNum().equals("")) { %>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="10%" > 
							<div align="right"><b>Cliente :</b></div>
						</td>
						<td nowrap width="20%" > 
							<div align="left"><b> 
								<input type="text" readonly name="UNCCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
								</b>
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="right"><b>Nombre :</b> </div>
						</td>
						<td nowrap width="30%"  > 
							<div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
								<input type="text" name="UNCNA1" size="45" maxlength="45" value="<%= userPO.getCusName().trim()%>" readonly >
								</font></font></font>
							</div>
						</td>
						<td nowrap width="10%">
						</td>
						<td nowrap width="20%">
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="10%"> 
							<div align="right"><b>Cuenta :</b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left"> 
								<input type="text" name="UNCACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%"> 
							<div align="right"><b>Moneda : </b></div>
						</td>
						<td nowrap width="30%"> 
							<div align="left"><b> 
								<input type="text" name="UNCCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
								</b> </div>
						</td>
						<td nowrap width="10%"> 
							<div align="right"><b>Producto : </b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left"><b> 
								<input type="text" name="UNCPRO" size="4" maxlength="4" value="<%= userPO.getProdCode().trim()%>" readonly>
								</b> </div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br>
<% } %>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Número del Cheque :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
                <eibsinput:text name="datarec" property="E01UNCCKN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" value="<%= datarec.getE01UNCCKN().trim()%>" readonly="<%=!newOnly%>" />
              </div>
            </td>
          </tr>
					<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>
						<td width="30%"> 
							<div align="right">Banco / Localidad :</div>
						</td>
			            <td nowrap width="70%"> 
			              <div align="left" ><b> 
			                <input type="text" name="E01UNCKBK" size="4" maxlength="4" value="<%= datarec.getE01UNCKBK().trim() %>" >
			                <input type="text" name="E01UNCKBR" size="4" maxlength="4" value="<%= datarec.getE01UNCKBR().trim() %>" >
			                <A href="javascript:GetBanksSuc('E01UNCKBK','E01UNCKBR')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Banco" align="bottom" border="0"></A> 
			                </b> </div>
			            </td>
					</tr>
					<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
						<td> 
							<div align="right">Referencia :</div>
						</td>
						<td >
							<eibsinput:text name="datarec" property="E01UNCKAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" value="<%= datarec.getE01UNCKAC().trim()%>" readonly="<%=readOnly%>" />
						</td>
					</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap width="60%"> 
 		          <eibsinput:text name="datarec" property="E01UNCRSN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>" readonly="<%=readOnly%>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Fecha Proceso :</div>
            </td>
            <td nowrap width="60%"> 
    	        <eibsinput:date name="datarec" fn_month="E01UNCRDM" fn_day="E01UNCRDD" fn_year="E01UNCRDY" readonly="<%=readOnly%>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Fecha Vencimiento :</div>
            </td>
            <td nowrap width="60%"> 
    	        <eibsinput:date name="datarec" fn_month="E01UNCMDM" fn_day="E01UNCMDD" fn_year="E01UNCMDY" readonly="<%=readOnly%>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto del Cheque:</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
 		            <eibsinput:text name="datarec" property="E01UNCAMN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" readonly="<%=readOnly%>" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
								<select name="E01UNCSTA" <%=readOnly ? "disabled" : ""%> >
									<option value=" " <% if (datarec.getE01UNCSTA().equals(" ")) out.print("selected"); %>>Pendiente</option>
									<option value="P" <% if (datarec.getE01UNCSTA().equals("P")) out.print("selected"); %>>Cobrado</option>
									<option value="D" <% if (datarec.getE01UNCSTA().equals("D")) out.print("selected"); %>>Devuelto</option>
									<option value="A" <% if (datarec.getE01UNCSTA().equals("A")) out.print("selected"); %>>Anulado</option>
								</select>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

	<% if (!readOnly) { %>
	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
	</div>
	<% } else { %>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
	</div>     
	<% } %>
	  
</form>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
<% if (!userPO.getAccNum().equals("")) { %>
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0300?SCREEN=101&E01UNCACC=<%=userPO.getAccNum()%>';	   	   
<% } else { %>
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0300?SCREEN=2';	   	   
<% } %>
	cerrarVentana();
</script>
<% } %>  
   
</body>
</HTML>
