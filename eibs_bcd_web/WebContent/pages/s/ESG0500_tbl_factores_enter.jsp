<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.*" %>
<%@ page import="datapro.eibs.beans.*" %>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>


<script type="text/javascript">

function updateTable(tableName) {  
	var tableRows = 0;
	if (tableName == "DINTBLROW") {
		tableRows = getElement("E01FTTNRW").value;
	}
	if (tableName == "DINTBLCOL") {
		tableRows = getElement("E01FTTNCL").value;
	}
	try {
		var tbl = getElement(tableName);
		var maxRow = tbl.rows.length;
		if (tableRows < maxRow) {
			for (i=maxRow-1; i>0; i--) {
				if (i > tableRows - 1) {
					tbl.deleteRow(i);
				}
			}
		} else {
			if ((tableRows - maxRow) > 0) {
				AddRow(tableName, tableRows - maxRow); 
			}	
		}     	
  } catch(e) {
    alert("updateRows: "+e);
  }
}

function AddRow(tableName, nRow) {
	var nrw;
	var idx = ""; var nme = "";
	try {
		var tbl = getElement(tableName);
		if (tbl.rows.length < 201) {
			tbl.insertRow();
			nrw = tbl.rows.length;
			idx = (nrw<10) ? "0"+nrw: ""+nrw;   
			nme = getName(tableName, nrw);
			tbl.rows[nrw-1].insertCell();
			tbl.rows[nrw-1].cells[0].align = "center";
			tbl.rows[nrw-1].cells[0].innerHTML = idx + ":";
			tbl.rows[nrw-1].insertCell();
			tbl.rows[nrw-1].cells[1].align = "center";
			tbl.rows[nrw-1].cells[1].innerHTML = "<input type='text' size='15' maxlength='14' name='" + nme + "' value='0' >";
			if (nRow > 1) {
				AddRow(tableName, nRow - 1); 
			}
		}      
	} catch(e) {
		alert("AddRow: "+e);
	}
}

function SendInfo(){
	try {
		if ((validateTable("DINTBLROW")) && (validateTable("DINTBLCOL"))) {
			//document.forms[0].submit();
			return true ;
		}
	} catch(e) {
		alert("SendInfo: "+e);
	}
	return false ;
}

function validateTable(tableName) {
	var val = 0;
	var ant = 0;
	try {
		var tbl = getElement(tableName);
		for (i = 1; i <= tbl.rows.length; i++) {
			nme = getName(tableName, i); 
			val = validateValue(nme);
			if (val == 0) {
				alert("Valor debe ser mayor a cero.");
				getElement(nme).focus();
				return false;
			}
			if ((ant > 0) && (ant > val)) {
				alert("Valor debe ser mayor al anterior");
				getElement(nme).focus();
				return false;
			} 
			ant = val;
		}
		return true;
	} catch(e) {
		alert("validateTable: "+e);
	}
}

function getName(tableName, index) {
	var nme = "";
	var nmk = "";
	var idx = (index<10) ? "0"+index: ""+index; 
	nmk = (index<100) ? "0" : ""; 
	if (tableName == "DINTBLROW") {
		nme = "E02FRV" + nmk + idx;
	}
	if (tableName == "DINTBLCOL") {
		nme ="E03FCV" + nmk + idx;
	}
	return nme;
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

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

</script>




</head>

<%
	boolean readOnly = false;
	boolean newOnly = false;
	if (userPO.getPurpose().equals("INQUIRY")) {
		readOnly = true;
	}
	if (!userPO.getPurpose().equals("NEW")) {
		newOnly = true;
	}
%>

<body >

<h3 align="center">Tabla Factores<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tbl_factores_enter, EGS0500"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESG0500"  onsubmit="return sendInfo()">
  <INPUT TYPE="hidden" NAME="H01FLGMAS" value="A">
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="600">
  <input type=HIDDEN name="E01FTTSFL" id="E01FTTSFL" value="<%=userPO.getType()%>">
<%
	String nme = "";
	String nmk = "";
	int nrw = 0;
	int row = 0;
%> 

	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td><div align="right">C&oacute;digo de Tabla : </div></td>
						<td><eibsinput:text name="datarec" property="E01FTTCOD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE%>" required="true" readonly="<%=newOnly%>" /></td>
						<td><div align="right">Descripci&oacute;n : </div></td>
						<td><eibsinput:text name="datarec" property="E01FTTDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TEXT %>" size="60" maxlength="60" required="true" readonly="<%=readOnly%>" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
  
  <h4>Filas</h4>
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trclear" > 
						<td width="15%" valign="top"><div align="right">Tipo Filas : </div></td>
						<td width="15%" valign="top">
							<select name="E01FTTTRW" <% if (readOnly) out.print("disabled"); %> >
							  <option value=" " <% if (!(datarec.getE01FTTTRW().equals("M") && datarec.getE01FTTTRW().equals("P") && datarec.getE01FTTTRW().equals("E"))) out.print("selected"); %> <%if (userPO.getPurpose().equals("READONLY")) {%>disabled="disabled"<%}%>></option>
								<option value="M" <% if (datarec.getE01FTTTRW().equals("M")) out.print("selected"); %>>Monto</option>
								<option value="P" <% if (datarec.getE01FTTTRW().equals("P")) out.print("selected"); %>>Plazo</option>
								<option value="E" <% if (datarec.getE01FTTTRW().equals("E")) out.print("selected"); %>>Edad </option>
							</select>
						</td>
						<td width="15%" valign="top"><div align="right">Nro. Filas : </div></td>
						<td width="15%" valign="top"><eibsinput:text name="datarec" property="E01FTTNRW" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" onchange="updateTable('DINTBLROW');" readonly="<%=readOnly%>" /></td>
						<td width="40%" valign="top">
							<div id="dataDiv1" style="height:120px; overflow:auto;"> 
								<table id="DINTBLROW">
<%
	nme = "";
	nrw = datarec.getBigDecimalE01FTTNRW().intValue();
	for (int i=1; i<=nrw; i++) {
		nme = (i<10) ? "0"+i: ""+i;    
		nmk = (i<100) ? "0": "";    
%> 
									<tr>
										<td><%=nme%>: </td>
										<td>
											<input type="text" name="E02FRV<%=nmk%><%=nme%>" size="15" maxlength="14" value="<%= datarow.getField("E02FRV"+nmk+nme).getString().trim()%>" <% if (readOnly) out.print("readonly"); %> >   
										</td>
									</tr>
<% 
	} 
%>
								</table>		
							</div>	
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
					
  <h4>Columnas</h4>
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trclear"> 
						<td width="15%" valign="top"><div align="right">Tipo Columnas : </div></td>
						<td width="15%" valign="top">
							<select name="E01FTTTCL" <% if (readOnly) out.print("disabled"); %> >
							  <option value=" " <% if (!(datarec.getE01FTTTCL().equals("M") && datarec.getE01FTTTCL().equals("P") && datarec.getE01FTTTCL().equals("E"))) out.print("selected"); %> <%if (userPO.getPurpose().equals("READONLY")) {%>disabled="disabled"<%}%>></option>
								<option value="M" <% if (datarec.getE01FTTTCL().equals("M")) out.print("selected"); %>>Monto</option>
								<option value="P" <% if (datarec.getE01FTTTCL().equals("P")) out.print("selected"); %>>Plazo</option>
								<option value="E" <% if (datarec.getE01FTTTCL().equals("E")) out.print("selected"); %>>Edad </option>
							</select>
						</td>
						<td width="15%" valign="top"><div align="right">Nro. Columnas : </div></td>
						<td width="15%" valign="top"><eibsinput:text name="datarec" property="E01FTTNCL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" onchange="updateTable('DINTBLCOL');" readonly="<%=readOnly%>" /></td>
						<td width="40%" valign="top">
							<div id="dataDiv2" style="height:120px; overflow:auto;">
								<table id="DINTBLCOL">
<%
	nme = "";
	nrw = datarec.getBigDecimalE01FTTNCL().intValue();
	for (int i=1; i<=nrw; i++) {
		nme = (i<10) ? "0"+i: ""+i; 
		nmk = (i<100) ? "0": "";    
%> 
									<tr>
										<td><%=nme%>: </td>
										<td>
											<input type="text" name="E03FCV<%=nmk%><%=nme%>" size="15" maxlength="14" value="<%= datacol.getField("E03FCV"+nmk+nme).getString().trim()%>" <% if (readOnly) out.print("readonly"); %> >   
										</td>
									</tr>
<% 
	} 
%>
								</table>
							</div>	
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
  
	<% if (!readOnly) { %>
		<table class="TBENTER">
			<tr >
				<td><div align="center"><input id="EIBSBTN" type="Submit" name="Submit" value="Enviar" ></div></td>
				<td><div align="center"><input class="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();"></div></td>
			</tr>
		</table>
	<% } else { %>
  <p align="center">         
		<input class="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
  </p>
	<% } %>
  
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	showErrors()");
		out.println("</SCRIPT>");
	}
%>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESG0500?SCREEN=100&TYPE=<%=userPO.getType()%>';	   	   
	cerrarVentana();	  
</script>
<% } %>  

</form>
</body>

</html>



