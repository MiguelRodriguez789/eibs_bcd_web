<%@page import="datapro.eibs.beans.IdentificationData"%>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<html>
<head>
<title>Cambio de Identificación</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="msgClient" class= "datapro.eibs.beans.ESD008015Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/idTools.js"> </script>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<%
	//Define variables request
	IdentificationData idData = new IdentificationData(msgClient.getE15IDN(), msgClient.getE15GEC(), msgClient.getE15LGT());
	idData.setType(msgClient.getE15TID());
	request.setAttribute("idData", idData);
%>

</head>

<body bgcolor="#FFFFFF">

<h3 align="center">Cambio de Identificación<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_id_change.jsp, ESD0080"></h3>
<hr size="4">
<form name="forma" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="56">

<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"> 
			<tr id="trdark">
				<td nowrap align="right" valign="middle" width="49%">Pa&iacute;s :</td>
				<td colspan="3">
				<INPUT TYPE=HIDDEN NAME="INT" ID="INT" value=""> 
				<INPUT TYPE="text" NAME="E15GEC" ID="COUNTRY" value="<%= msgClient.getE15GEC() %>" size="3" maxlength="3" 
					onfocus="showIdFields(document.forms[0].E15GEC.value, getElementChecked('E15LGT').value);" 
					onblur="showIdFields(document.forms[0].E15GEC.value, getElementChecked('E15LGT').value);"> 
				<INPUT TYPE="text" NAME="D15GEC" ID="D15GEC" value="<%= msgClient.getD15GEC() %>" readonly="readonly"
					onfocus="showIdFields(document.forms[0].E15GEC.value, getElementChecked('E15LGT').value);"> 
				<a href="javascript:GetCodeDescCNOFC('E15GEC','D15GEC','03')"> 
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
				</a> 
				</td>
			</tr>

			<tr id="trclear">
				<td nowrap align="right" valign="middle" width="49%">Tipo de Cliente :</td>
				<td colspan="3">
				<label for="corp" >
				<input type="radio" id="corp" name="E15LGT" value="1" <% if (msgClient.getE15LGT().equals("1")) { out.print("checked"); } %>
					onclick="showIdFields(document.forms[0].E15GEC.value, getElementChecked('E15LGT').value);">Corporativo 
				</label>
				<label for="pers" >
				<input type="radio" id="pers" name="E15LGT" value="2" <% if (msgClient.getE15LGT().equals("2")) { out.print("checked"); } %>
					onclick="showIdFields(document.forms[0].E15GEC.value, getElementChecked('E15LGT').value);" >Físico 
				</label>
				<label for="other" >
				<input type="radio" id="other" name="E15LGT" value="3" <% if (msgClient.getE15LGT().equals("3")) { out.print("checked"); } %>
					onclick="showIdFields(document.forms[0].E15GEC.value, getElementChecked('E15LGT').value);" >Otro
				</label>
				</td>
			</tr>
			
			<tr id="trdark">
				<td nowrap align="right" valign="middle" width="49%">N&uacute;mero de Cliente :
				</td>
				<td nowrap align="left" valign="middle" colspan="3">
					<input type="text" name="E15CUN" value="<%= msgClient.getE15CUN() %>" maxlength="10" size="11" readonly>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap align="right" valign="middle" width="49%">Identificaci&oacute;n:
				</td>
				<td nowrap align="left" valign="middle" width="20%">

				<jsp:include page="ESD0080_client_id_template.jsp?country=${requestScope.idData.country}&legalType=${requestScope.idData.legalType}" flush="true"/>

				</td>
				
				<td nowrap align="right" width="5%">Tipo : </td> 
				<td nowrap align="left" width="30%">
					<input type="text" name="E15TID" value="<%= idData.getType() %>" maxlength="4" size="5" >
					<a href="javascript:GetCodeDescCNOFC('E15TID','','34')"> 
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="top" border="0"></a> 
				</td>
			</tr>
		</table>
		</td>
	</tr>

</table>
<p align="center"><input id="EIBSBTN" type=submit name="Submit"
	value="Enviar"></p>
</form>
<SCRIPT type="text/javascript">
<%if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");	
%>
            showErrors();
<% } %>
</SCRIPT>
</body>
</html>
