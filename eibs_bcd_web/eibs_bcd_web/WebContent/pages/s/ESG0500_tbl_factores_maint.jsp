<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESG050004Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="java.math.*" %>

<html>
<head>
<title>Factores</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="datarec" class="datapro.eibs.beans.ESG050001Message" scope="session" />
<jsp:useBean id="datarow" class="datapro.eibs.beans.ESG050002Message" scope="session" />
<jsp:useBean id="datacol" class="datapro.eibs.beans.ESG050003Message" scope="session" />
<jsp:useBean id="datafct" class="datapro.eibs.beans.JBObjList" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>



<script type="text/javascript">
function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

function sendInfo(){
	try {
		if (validateTable("DINTBLFAC")) {
			//document.forms[0].submit();
			return true ;
		}
	} catch(e) {
		alert("SendInfo: "+e);
	}
	
	return false;
}

function validateTable(tableName) {
	var val = 0; var ant = 0;
	var nrw = 0; var ncl = 0;
	var nmi = ""; var nmj = "";
	nrw = validateValue("E01FTTNRW");
	ncl = validateValue("E01FTTNCL");
	try {
		var tbl = getElement(tableName);
		for (i = 1; i <= nrw; i++) {
			for (j = 1; j <= ncl; j++) {
				nmi = (i<10) ? "00"+i: (i<100) ? "0"+i: ""+i;
				nmj = (j<10) ? "00"+j: (j<100) ? "0"+j: ""+j;
				nme = "E04FT1"+nmj+"_"+nmi;
				val = validateValue(nme);
				if (val == 0) {
					alert("Valor debe ser mayor a cero.");
					getElement(nme).focus();
					return false;
				}
			}
		}
		return true;
	} catch(e) {
		alert("validateTable: "+e);
	}
}

function validateValue(valamt) {
	try {
		valamt = getElement(valamt).value;
		valamt = valamt.replace(/\,/g,'');
		valamt = parseFloat(valamt);
		if (isNaN(valamt)) { 
			valamt = 0.00;
		}
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

</script>
</head>

<body>

<h3 align="center">Tabla Factores<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tbl_factores_maint.jsp, ESG0500"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESG0500"  onsubmit="return sendInfo()">
  <INPUT TYPE="hidden" NAME="H04FLGMAS" value="A">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="601">
  <INPUT TYPE=HIDDEN NAME="E01FTTNRW" VALUE="<%=datarec.getE01FTTNRW().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FTTNCL" VALUE="<%=datarec.getE01FTTNCL().trim()%>">
<%
	int i = 0; int j = 0;
	String nmi = ""; String nmj = "";
	int nrw = datarec.getBigDecimalE01FTTNRW().intValue();
	int ncl = datarec.getBigDecimalE01FTTNCL().intValue();
%> 

	<table class="tableinfo">
		<tr bordercolor="#FFFFFF">
			<td nowrap>
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td><div align="right">C&oacute;digo :</div></td>
						<td><eibsinput:text name="datarec" property="E01FTTCOD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true" /></td>
						<td><div align="right">Descripci&oacute;n :</div></td>
						<td><eibsinput:text name="datarec" property="E01FTTDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TEXT %>" size="60" maxlength="60" readonly="true" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>	  

	<br>
	<table class="tableinfo" id="DINTBLFAC" >
		<tr>
			<th id="trdark">
			</th>
			<th id="trdark" align="center" colspan="<%=ncl%>">
				<% if (datarec.getField("E01FTTTCL").getString().equals("M")) out.print("MONTO"); %>
				<% if (datarec.getField("E01FTTTCL").getString().equals("P")) out.print("PLAZO"); %>
				<% if (datarec.getField("E01FTTTCL").getString().equals("E")) out.print("EDAD");  %>
			</th>
		</tr>
		<tr>
			<th id="trdark" align="center">
				<% if (datarec.getField("E01FTTTRW").getString().equals("M")) out.print("MONTO"); %>
				<% if (datarec.getField("E01FTTTRW").getString().equals("P")) out.print("PLAZO"); %>
				<% if (datarec.getField("E01FTTTRW").getString().equals("E")) out.print("EDAD");  %>
			</th>
<%
		for (i=1; i<=ncl; i++) {
			nmi = (i<10) ? "00"+i: (i<100) ? "0"+i: ""+i;
%> 
			<th id="trdark" align="center">
				<% 
					if (datarec.getField("E01FTTTCL").getString().equals("M")) {
						out.print(Util.formatCCY(datacol.getField("E03FCV"+nmi).getString().trim()));
					} else {
						out.print(Util.formatCell(datacol.getField("E03FCV"+nmi).getString().trim()));
					} 
				%>
			</th>
<% 
		} 
%>
		</tr>
<%
	datafct.initRow();
	while (datafct.getNextRow()) {
		i = datafct.getCurrentRow() + 1;
		nmi = (i<10) ? "00"+i: (i<100) ? "0"+i: ""+i;
		ESG050004Message listFct = (ESG050004Message) datafct.getRecord();
%>
		<tr>
			<th id="trdark" align="center">
				<% 
					if (datarec.getField("E01FTTTRW").getString().equals("M")) {
						out.print(Util.formatCCY(datarow.getField("E02FRV"+nmi).getString().trim()));
					} else {
						out.print(Util.formatCell(datarow.getField("E02FRV"+nmi).getString().trim()));
					} 
				%>
			</th>
<%
		for (j=1; j<=ncl; j++) {
			nmj = (j<10) ? "00"+j: (j<100) ? "0"+j: ""+j;
%> 
			<td align="center">
				<input type="text" name="E04FT1<%=nmj%>_<%=nmi%>" size="14" maxlength="13" value="<%=listFct.getField("E04FT1"+nmj).getString().trim()%>" class="txtright" onKeypress="enterDecimal(event, 10);" >
			</td>
<% 
		} 
%>			
		</tr>
<% } %>

		
	</table>
	  	  
	<br>
	<table class=tbenter>
		<tr>
			<td align="center">         
				<input id="EIBSBTN" type="Submit" name="Submit" value="Enviar" >
			</td>
		</tr>
	</table>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESG0500?SCREEN=100&TYPE=<%=userPO.getType()%>';	   	   
	cerrarVentana();	  
</script>
<% } %>  

</form>
</body>
</html>
