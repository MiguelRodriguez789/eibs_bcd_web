
<%@ page import = "datapro.eibs.master.Util" %>

<%@page import="datapro.eibs.beans.EDI001002Message"%>
<%@page import="datapro.eibs.beans.EDI011002Message"%>
<HTML>
<HEAD>
<title>Documentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/cnofc.js"> </SCRIPT>

<%@ taglib uri="/WEB-INF/datapro-dyntable.tld" prefix="dyntable" %>
<jsp:useBean id="scanDoc" class="datapro.eibs.beans.EDI011002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<style type="text/css">
.defaultLabel_off {color: #CCC;}
</style>
</HEAD>
<BODY>
<%	if (!error.getERRNUM().equals("0")){
     error.setERRNUM("0");
%> 
	<SCRIPT type="text/javascript">
		showErrors();
	</SCRIPT>
<%	} %> 
<h3 align="center">Documentos Relacionados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="doc_add.jsp,EDI0110"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E02DIDNDR" VALUE="<%= scanDoc.getE02DIDNDR() %>">
  <INPUT TYPE=HIDDEN NAME="E02DIDIS1" VALUE="<%= scanDoc.getE02DIDIS1() %>">
  <INPUT TYPE=HIDDEN NAME="E02DIDIS2" VALUE="<%= scanDoc.getE02DIDIS2() %>">
  <INPUT TYPE=HIDDEN NAME="E02DIDIS3" VALUE="<%= scanDoc.getE02DIDIS3() %>">
  
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <INPUT type="text" name="E02DIDCUN" size="9" maxlength="9" value="<%= userPO.getCusNum()%>" readonly>
                </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <INPUT type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= userPO.getCusName() %>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <INPUT type="text" name="E02DIDACC" size="12" maxlength="12" value="<%= scanDoc.getE02DIDACC() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <INPUT type="text" name="E02DIDCCY" size="4" maxlength="3" value="<%= userPO.getCurrency() %>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <INPUT type="text" name="E02DIDPRO" size="4" maxlength="4" value="<%= userPO.getProdCode() %>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  
  
  <h4>Información Básica</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap>
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="33%">
				<div align="right">Tipo :</div>
				</td>
				<td nowrap width="33%">
					<select name="E02DIDTYP" style="min-width: 160px; width: 180px;" onfocus="CNOFCSelect('FD').getFilters(this)">
					</select>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="33%">
				<div align="right">Descripción :</div>
				</td>
				<td nowrap width="33%">
					<INPUT type="text" name="E02DIDDES" size="17" maxlength="15" value="<%=scanDoc.getE02DIDDES()%>">
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="33%">
				<div align="right">Estado :</div>
				</td>
				<td nowrap width="33%">
					<select name="E02DIDSTA" style="min-width: 160px; width: 180px;" onfocus="CNOFCSelect('17').getFilters(this)">
						<option value="CO">ESCANEADO</option>
						<option value=""  >INCOMPLETO</option>
						<option value="NA">NO APLICABLE</option>
						<option value="NP">NO PRESENTADO</option>
						<option value="PR">PRESENTADO</option>
						<option value="PD">VENCIDO</option> 
					</select>
				</td>
			</tr>
		</table>
		</td>
    </tr>
	</table>
	
	<SCRIPT type="text/javascript">
		addCNOFCHandler('E02DIDTYP');
		//I'm cleaning the status options because now we are using the table 17 of CNOFC
		document.getElementById('E02DIDSTA').options.length=0;
		addCNOFCHandler('E02DIDSTA');
	</SCRIPT>

	<% if("true".equals(request.getParameter("ADD"))){ %>
		<div align="center"> 
			<p>
			<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
			</p>
		</div>
	<% } else { %>
		<dyntable:button name="scanDoc" styleClass="EIBSBTN" beanToValidate="scanDoc">Enviar</dyntable:button>
	<% } %>  
</form>
</body>
</html>
