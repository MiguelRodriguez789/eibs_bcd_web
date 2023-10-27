<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="datapro.eibs.beans.EPV015801Message"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="java.util.ArrayList"%>
<HTML>
<HEAD>
<TITLE>Fechas para Desplazar</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="newDate" class="java.util.ArrayList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </SCRIPT>

<SCRIPT type="text/javascript">

function trHistory(tableID, first_time_trhistory ){
	var table = document.getElementById(tableID);
	var rowCount = table.rows.length;
	
	if(true == first_time_trhistory){
		element_counter = rowCount;
	}else{
		element_counter++;	
	} 	

	return element_counter;
	
}

var element_counter;


</SCRIPT>

</HEAD>
<BODY onload="trHistory('dataTable', true);">

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	
%>



<h3 align="center" style="width: 95%">Futuro Tasa/Spread <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="future_rate.jsp,EPV0158"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0158" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="TABLESIZE" id="TABLESIZE" value="" >

<%int row = 0; %>
<h4>&nbsp;Auditor&iacute;a de Tasa/Spread</h4> 
	<table class="tableinfoList" style="max-height:200px; width: 100%;" align="center">
	<tr height="5%"> 
		<td NOWRAP valign="top" width="100%"> 
			<table id="headTable" width="100%">
				<tr id="trdark">
					<th ALIGN="center" nowrap width="10%">
						<input type="button" name="addRow1" class="add" value='+' onclick="addRow('dataTable')"/>
						<input type="button" name="rmoveRow" class="removeRow" value='-' onclick="removeRow('dataTable')"/>
					</th>
					<th ALIGN="center" nowrap width="45%"><b>Fecha Actualizaci&oacute;n</b></th>
					<th ALIGN="center" nowrap width="45%"><b>Nueva Tasa </b></th>
				</tr>
		</table>
		</td>
	</tr>
	<tr height="100%">
		<td nowrap="nowrap" colspan="3">
		<div id="dataDiv1" style="max-height: 200px ; overflow: auto; border: 0px;">
		<table id="dataTable"  cellspacing="0" cellpadding="1" border="0" width="100%">
         <%
                list.initRow();
                int i = 0;
        		while (list.getNextRow()) {
                  	datapro.eibs.beans.EPV015801Message msgList = (datapro.eibs.beans.EPV015801Message) list.getRecord();
					i++;
		 %>
			<tr id='<%=i%>'>
				<%if(msgList.getE01FTRFLG().equals("*")){%>
					<td width="10%" align="center">
						<input type="checkbox" name="chk" value="true" disabled="disabled" >
						<INPUT TYPE=HIDDEN NAME="FLAG<%=i%>" id="FLAG<%=i%>" value="*">
					</td>
					<td nowrap align="CENTER" width="45%" >
					<%if(currUser.getE01DTF().equals("YMD")) { %>
						<input type="text" id="E01FTRPRY_<%=i%>" name="E01FTRPRY_<%=i%>" size="5" maxlength="4" value="<%=msgList.getE01FTRPRY()%>"  class="TXTRIGHT" readonly/>
						<input type="text" id="E01FTRPRM_<%=i%>" name="E01FTRPRM_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRM()%>"  class="TXTRIGHT" readonly/>
						<input type="text" id="E01FTRPRD_<%=i%>" name="E01FTRPRD_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRD()%>"  class="TXTRIGHT" readonly />
					<% } else if(currUser.getE01DTF().equals("MDY")) { %>
						<input type="text" id="E01FTRPRM_<%=i%>" name="E01FTRPRM_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRM()%>"  class="TXTRIGHT" readonly/>
						<input type="text" id="E01FTRPRD_<%=i%>" name="E01FTRPRD_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRD()%>"  class="TXTRIGHT" readonly />
						<input type="text" id="E01FTRPRY_<%=i%>" name="E01FTRPRY_<%=i%>" size="5" maxlength="4" value="<%=msgList.getE01FTRPRY()%>"  class="TXTRIGHT" readonly/>
					<% } else {%>
						<input type="text" id="E01FTRPRD_<%=i%>" name="E01FTRPRD_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRD()%>"  class="TXTRIGHT" readonly />
						<input type="text" id="E01FTRPRM_<%=i%>" name="E01FTRPRM_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRM()%>"  class="TXTRIGHT" readonly/>
						<input type="text" id="E01FTRPRY_<%=i%>" name="E01FTRPRY_<%=i%>" size="5" maxlength="4" value="<%=msgList.getE01FTRPRY()%>"  class="TXTRIGHT" readonly/>
					<% } %>
					</td>
					<td nowrap align="CENTER" width="45%" >
						<input type="text" name="E01FTRRTE<%=i%>" maxlength="10" size="12" value="<%=msgList.getE01FTRRTE()%>" readonly class="TXTRIGHT"> 
					</td>	
				<%}else{%>
					<td width="10%" align="center">
						<input type="checkbox" name="chk" value="true" >
						<INPUT TYPE=HIDDEN NAME="FLAG<%=i%>" id="FLAG<%=i%>" value=" ">
					</td>
					<td nowrap align="RIGHT" width="45%">
					<%if(currUser.getE01DTF().equals("YMD")) { %>
						<input type="text" id="E01FTRPRY_" name="E01FTRPRY_<%=i%>" size="5" maxlength="4" value="<%=msgList.getE01FTRPRY() %>"  class="TXTRIGHT" onkeypress=" enterInteger(event)"/>
						<input type="text" id="E01FTRPRM_<%=i%>" name="E01FTRPRM_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRM()%>"  class="TXTRIGHT" onkeypress=" enterInteger(event)"/>
						<input type="text" id="E01FTRPRD_<%=i%>" name="E01FTRPRD_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRD()%>"  class="TXTRIGHT" onkeypress=" enterInteger(event)"/>
						<a id="linkHelp" href="javascript:DatePicker(document.forms[0].E01FTRPRY_<%=i%>,document.forms[0].E01FTRPRM_<%=i%>,document.forms[0].E01FTRPRD_<%=i%>)">
						<img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" align="bottom" border="0"/></a>
					<% } else if(currUser.getE01DTF().equals("MDY")) { %>
						<input type="text" id="E01FTRPRM_<%=i%>" name="E01FTRPRM_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRM()%>"  class="TXTRIGHT" onkeypress=" enterInteger(event)"/>
						<input type="text" id="E01FTRPRD_<%=i%>" name="E01FTRPRD_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRD()%>"  class="TXTRIGHT" onkeypress=" enterInteger(event)"/>
						<input type="text" id="E01FTRPRY_" name="E01FTRPRY_<%=i%>" size="5" maxlength="4" value="<%=msgList.getE01FTRPRY() %>"  class="TXTRIGHT" onkeypress=" enterInteger(event)"/>
						<a id="linkHelp" href="javascript:DatePicker(document.forms[0].E01FTRPRM_<%=i%>,document.forms[0].E01FTRPRD_<%=i%>,document.forms[0].E01FTRPRY_<%=i%>)">
						<img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" align="bottom" border="0"/></a>
					<% } else {%>
						<input type="text" id="E01FTRPRD_<%=i%>" name="E01FTRPRD_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRD()%>"  class="TXTRIGHT" onkeypress=" enterInteger(event)"/>
						<input type="text" id="E01FTRPRM_<%=i%>" name="E01FTRPRM_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRM()%>"  class="TXTRIGHT" onkeypress=" enterInteger(event)"/>
						<input type="text" id="E01FTRPRY_" name="E01FTRPRY_<%=i%>" size="5" maxlength="4" value="<%=msgList.getE01FTRPRY() %>"  class="TXTRIGHT" onkeypress=" enterInteger(event)"/>
						<a id="linkHelp" href="javascript:DatePicker(document.forms[0].E01FTRPRD_<%=i%>,document.forms[0].E01FTRPRM_<%=i%>,document.forms[0].E01FTRPRY_<%=i%>)">
						<img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" align="bottom" border="0"/></a>
					<% } %>
					</td>
					<td nowrap align="CENTER" width="45%" >
						<input type="text" name="E01FTRRTE<%=i%>" maxlength="10" size="12" value="<%=msgList.getE01FTRRTE()%>" onkeypress=" enterSignDecimal(event, 6) " class="TXTRIGHT"> 
					</td>
				<%}%>		
			</tr>		 
		 <%}%>
		</table>
		</div>
		</td>
	</tr>
</table>
<br>
<div align="center">
	<input id="EIBSBTN" type="button" name="Submit" OnClick="goSend()" value="Enviar"> 
	<input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana()">
</div>

<script type="text/javascript">
function goSend() {
	getElement('TABLESIZE').value = String(element_counter);
	document.forms[0].submit();		
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

function addRow(tableID){
	var table = document.getElementById(tableID);
	var rowCount = table.rows.length;
	var row = table.insertRow(rowCount);
	var colCount = table.rows[0].cells.length; 
	var width = ["10%", "45%","45%"];
	var align = ["center", "RIGHT", "CENTER"];
	
	var table_creation_counter = trHistory(tableID, false); //updates counter
	row.setAttribute("id", String(table_creation_counter));
	
	for(var i=0;i<colCount;i++){
		var newcell = row.insertCell(i);
		newcell.innerHTML = writeInnerHtml(i,table_creation_counter);
		newcell.setAttribute("width",width[i]);
		newcell.setAttribute("align",align[i]);
	}
}
function removeRow(tableID){
	try {
		var table = document.getElementById(tableID);
		var rowCount = table.rows.length;
		var chkbox = document.getElementsByName("chk");
		var anychkd = false;
		var id;
		for(var i=0;i<rowCount;i++){
			var row = table.rows[i];
			id = row.id;
			if(null!=chkbox[i] && true == chkbox[i].checked){
				if(rowCount<=1){
					alert("No se puede eliminar todas las filas.");
					break;
				}
				anychkd = true;
				table.deleteRow(i);
				addHidden(id);				
				rowCount--;
				i--;
			}
		}
		if(true != anychkd){ //If no checked boxes, then delete last row.
			if(rowCount<=1){
				alert("No se puede eliminar todas las filas.");
			}else{
				id = table.rows[rowCount-1].id;				
				table.deleteRow(rowCount-1);
				addHidden(id);
			}
		}
	}catch(e){
		alert(e);
	}
}

function writeInnerHtml(index,length){
	var calendarRef = "${pageContext.request.contextPath}/images/calendar.gif";

	var result;
	if (0 == index) {
		result = "\n\t\t\t\t\t<input name=\"chk\" type=\"checkbox\" value=\"true\"><INPUT TYPE=HIDDEN NAME=\"FLAG"+length+"\" id=\"FLAG"+length+"\" value=\" \">";
	}else if (1 == index){
		result = "\n\t\t\t\t\t";
		<%if(currUser.getE01DTF().equals("YMD")) { %>
		result = result.concat("<input name=\"E01FTRPRY_"+length+"\" class=\"TXTRIGHT\" id=\"E01FTRPRY_"+length+"\" onkeypress=\" enterInteger(event)\" type=\"text\" size=\"5\" maxlength=\"4\" value=\"0\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<input name=\"E01FTRPRM_"+length+"\" class=\"TXTRIGHT\" id=\"E01FTRPRM_"+length+"\" onkeypress=\" enterInteger(event)\" type=\"text\" size=\"3\" maxlength=\"2\" value=\"0\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<input name=\"E01FTRPRD_"+length+"\" class=\"TXTRIGHT\" id=\"E01FTRPRD_"+length+"\" onkeypress=\" enterInteger(event)\" type=\"text\" size=\"3\" maxlength=\"2\" value=\"0\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<a id=\"linkHelp\" href=\"javascript:DatePicker(document.forms[0].E01FTRPRY_"+length+",document.forms[0].E01FTRPRM_"+length+",document.forms[0].E01FTRPRD_"+length+")\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<img title=\"Calendario\" align=\"bottom\" src=\"" + calendarRef + "\" border=\"0\">");
		<% } else if(currUser.getE01DTF().equals("MDY")) { %>
		result = result.concat("<input name=\"E01FTRPRM_"+length+"\" class=\"TXTRIGHT\" id=\"E01FTRPRM_"+length+"\" onkeypress=\" enterInteger(event)\" type=\"text\" size=\"3\" maxlength=\"2\" value=\"0\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<input name=\"E01FTRPRD_"+length+"\" class=\"TXTRIGHT\" id=\"E01FTRPRD_"+length+"\" onkeypress=\" enterInteger(event)\" type=\"text\" size=\"3\" maxlength=\"2\" value=\"0\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<input name=\"E01FTRPRY_"+length+"\" class=\"TXTRIGHT\" id=\"E01FTRPRY_"+length+"\" onkeypress=\" enterInteger(event)\" type=\"text\" size=\"5\" maxlength=\"4\" value=\"0\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<a id=\"linkHelp\" href=\"javascript:DatePicker(document.forms[0].E01FTRPRM_"+length+",document.forms[0].E01FTRPRD_"+length+",document.forms[0].E01FTRPRY_"+length+")\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<img title=\"Calendario\" align=\"bottom\" src=\"" + calendarRef + "\" border=\"0\">");
		<% } else {%>
		result = result.concat("<input name=\"E01FTRPRD_"+length+"\" class=\"TXTRIGHT\" id=\"E01FTRPRD_"+length+"\" onkeypress=\" enterInteger(event)\" type=\"text\" size=\"3\" maxlength=\"2\" value=\"0\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<input name=\"E01FTRPRM_"+length+"\" class=\"TXTRIGHT\" id=\"E01FTRPRM_"+length+"\" onkeypress=\" enterInteger(event)\" type=\"text\" size=\"3\" maxlength=\"2\" value=\"0\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<input name=\"E01FTRPRY_"+length+"\" class=\"TXTRIGHT\" id=\"E01FTRPRY_"+length+"\" onkeypress=\" enterInteger(event)\" type=\"text\" size=\"5\" maxlength=\"4\" value=\"0\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<a id=\"linkHelp\" href=\"javascript:DatePicker(document.forms[0].E01FTRPRD_"+length+",document.forms[0].E01FTRPRM_"+length+",document.forms[0].E01FTRPRY_"+length+")\">");
		result = result.concat("\n\t\t\t\t\t");
		result = result.concat("<img title=\"Calendario\" align=\"bottom\" src=\"" + calendarRef + "\" border=\"0\">");
		<% } %>		
	}else if(2 == index){
		result = "\n\t\t\t\t\t<input type=\"text\" name=\"E01FTRRTE"+length+"\" maxlength=\"10\" size=\"12\" value=\"0.000000\" onkeypress=\" enterSignDecimal(event, 6) \" class=\"TXTRIGHT\" value=\"0\">"; 
	}else{
		result = "\n";
	}
	return result;
}

function addHidden(id) {
    // Create a hidden input element, and append it to the form:
    var names = ["E01FTRPRD_"+id,"E01FTRPRM_"+id,"E01FTRPRY_"+id,"E01FTRRTE"+id];
    var values = ["0","0","0","0.000"];
    
	for(var i=0;i<names.length;i++){
	    var input = document.createElement('input');
	    input.type = 'hidden';
	    input.name = names[i];
	    input.value = values[i];
	    document.forms[0].appendChild(input);
	}
}
</script>

</form>
</BODY>
</HTML>
