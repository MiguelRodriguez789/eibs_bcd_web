<!DOCTYPE HTML>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@page import="com.datapro.generic.beanutil.DynamicDTO"%>
<%@page import="datapro.eibs.reports.ReportsData"%>
<%@page import="com.datapro.eibs.constants.Reports"%>
<%@page import="com.datapro.eibs.constants.EOD"%>
<%@page import="datapro.eibs.reports.ReportsHeader"%>
<%@page import="datapro.eibs.reports.ReportsDetail"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.HashMap"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/plugins/DataTables/css/jquery.dataTables.min.css"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/jquery/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/jquery/plugins/DataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>


<TITLE>User Reports Details</TITLE>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "reportsHeader" class= "datapro.eibs.reports.ReportsHeader"  scope="session" />
<jsp:useBean id= "modulesList" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "reportsList" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "reportsSelection" class= "datapro.eibs.beans.JBObjList" scope="session" />

<%
	HashMap reportsModules = Reports.REPORTS_MODULES;
 	modulesList.initRow();
	while (modulesList.getNextRow()){
		ReportsDetail selectItem = (ReportsDetail)modulesList.getRecord();
		String description = (String)reportsModules.get(selectItem.getIBSMOD());
		selectItem.setIBSDSC(description != null ? description : selectItem.getIBSMOD()) ;
	}
	Collections.sort(modulesList);
%>

<script type="text/javascript">

function openFile(nameOfFile) {
	<%	if(JSEIBSProp.getEODDirectUrl()){ %>
	var pg = "<%=JSEIBSProp.getEODPDFURL()%>/" + nameOfFile;
	<% 	} else { %>
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSPDFParserSend?FORMAT=pdf&REPNAME=" + nameOfFile ;
	<% 	} %>
	CenterWindow(pg,600,500,2);
}

function openCSVFile(nameOfFile) {
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSPDFParserSend?REPNAME=" + nameOfFile;
	CenterWindow(pg,600,500,2);
}
 
function reqReports() {
<% if(reportsHeader.isHistory()){ %>
	if(activateReportsDiv()){
		var form = document.forms[0];
		GetXMLResponse(form.action+"?SCREEN=101&IBSMOD="+form.IBSMOD.value, selectCallback, false);
		//return;
	}
<%  } %>
	applyFilters();
}

function applyFilters() {
	document.forms[0].submit();
}

function activateReportsDiv(){
	if(document.forms[0].IBSMOD.value == '%'){
		var reportSelect = document.getElementById('EDPRPN');
		reportSelect.options.length = 0;
		
		var option = document.createElement("option");
		option.value = '%';
		reportSelect.add(option, 0);
		reportSelect.selectedIndex = 0;
		
		document.getElementById("reportsLabel").style.display='none';
		document.getElementById("reportsDiv").style.display='none';
		return false;
	} else {
		document.getElementById("reportsLabel").style.display='block';
		document.getElementById("reportsDiv").style.display='block';
		return true;
	}
}
$(document).ready(function() {
    	$('#dataTable').DataTable( {
    	"lengthMenu": [[100, 200, 300, -1], [100, 200, 300, "All"]],
    	"scrollY": 400,
        "language": {
        	"decimal":        "",
    		"emptyTable":     "No hay Datos Disponibles",
    		"info":           "Mostrando _START_ a _END_ de _TOTAL_ Registros",
    		"infoEmpty":      "Mostrando 0 a 0 de 0 Registros",
    		"infoFiltered":   "(filtrado desde _MAX_ Registros Totales)",
    		"infoPostFix":    "",
    		"thousands":      ",",
    		"lengthMenu":     "Mostrar _MENU_ Registros",
    		"loadingRecords": "Cargando...",
    		"processing":     "Procesando...",
    		"search":         "Buscar:",
    		"zeroRecords":    "No hay registros que coincidan con su busqueda",
    		"paginate": {
        		"first":      "Primero",
        		"last":       "Ultimo",
        		"next":       "Siguiente",
        		"previous":   "Anterior"
    			},
    		"aria": {
        		"sortAscending":  ": Activado ordenamiento de la columna Ascendente",
        		"sortDescending": ": Activate ordenamiento de la columna Descendente"
    			}
   			}
		});
	});

</script>

<%	
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>
</HEAD>
<BODY>
<h3 align="center">Reportes de Cierres<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="user_reports_list.jsp, EODPDF"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEODReports" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<%= reportsHeader.isHistory() ? "10" : "11"%>">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">

<table class="tbenter" >	
	<% if(reportsHeader.isHistory() || reportsHeader.isReprocess()){ %>
			   <tr id="trdark"> 
			            <th nowrap width="25%" align="right"><b>Desde :</b></th>
			            <th nowrap width="25%" align="left"> 
			              	<eibsinput:date name="reportsHeader" fn_year="FROMDTY" fn_month="FROMDTM" fn_day="FROMDTD" />
			            </th>
				        <th nowrap width="25%" align="right"><b>Hasta :</b></th>
			            <th nowrap width="25%" align="left"> 
							<eibsinput:date name="reportsHeader" fn_year="TODTY" fn_month="TODTM" fn_day="TODTD" />
			            </th>
			    </tr>
        		<%  } %>
				<tr id="trdark"> 
					<th align=right width="25%">Modulo : </th>
					<th align=left width="25%"> 
						<select id="IBSMOD" name="IBSMOD" onchange="reqReports()">
						<% modulesList.initRow();
			 				out.println("<option selected value=\"%\" >  </option>");
				            while (modulesList.getNextRow()){
								ReportsDetail selectItem = (ReportsDetail)modulesList.getRecord();
								out.println("<option " 
										+ (selectItem.getIBSMOD().equals(reportsHeader.getIBSMOD()) ? "selected " : "")
										+ "value=\"" + selectItem.getIBSMOD() + "\" " + " >"
										+ selectItem.getIBSDSC() 
										+ "</option>");

							}						
						%>
						</select>
					</th>
					<th align=right width="25%">Tipo de Proceso : </th>
					<th align=left width="25%">
		                <select name="IBSPER" onchange="document.forms[0].submit()">
							<% if(!reportsHeader.isReprocess()){ %>
							<option value="<%= EOD.END_OF_PROCESS %>" 
		                  			<% if (!(EOD.END_OF_DAY_PROCESS.equals(reportsHeader.getIBSPER()) 
		                  					|| EOD.END_OF_MONTH_PROCESS.equals(reportsHeader.getIBSPER())
		                  					|| EOD.END_OF_YEAR_PROCESS.equals(reportsHeader.getIBSPER())
		                  					|| EOD.END_OF_YEAR_REPROCESS.equals(reportsHeader.getIBSPER())
											|| EOD.END_OF_MONTH_REPROCESS.equals(reportsHeader.getIBSPER()))) 
		                  					out.print("selected");%>>
							</option>
							<option value="<%= EOD.END_OF_DAY_PROCESS %>" <% if (EOD.END_OF_DAY_PROCESS.equals(reportsHeader.getIBSPER())) 
		                  		out.print("selected"); %>>Fin de Dia</option>
							<option value="<%= EOD.END_OF_MONTH_PROCESS %>" <% if (EOD.END_OF_MONTH_PROCESS.equals(reportsHeader.getIBSPER())) 
		                  		out.print("selected"); %>>Fin de Mes</option>
							<% } else {%>
							<option value="<%= EOD.END_OF_MONTH_REPROCESS %>" <% if (EOD.END_OF_MONTH_REPROCESS.equals(reportsHeader.getIBSPER())) 
		                  		out.print("selected"); %>>Reproceso de Mes</option>
							<option value="<%= EOD.END_OF_YEAR_REPROCESS %>" <% if (EOD.END_OF_YEAR_REPROCESS.equals(reportsHeader.getIBSPER())) 
		                  		out.print("selected"); %>>Reproceso de Año</option>
		                  		<% } %>
		                </select>
					</th>
					</tr>
        		<% if(reportsHeader.isHistory()){ %>
 					<tr id="trdark"> 
					<th align=right width="25%">
						<div id="reportsLabel" style="position:relative; display:none;">Reporte :</div>
					</th>
					<th align=left width="25%">
						<div id="reportsDiv" style="position:relative; display:none;">
		                <select id="EDPRPN" name="EDPRPN" onchange="applyFilters()">
						<% reportsSelection.initRow();
			 				out.println("<option selected value=\"%\" ></option>");
				            while (reportsSelection.getNextRow()){
								ReportsDetail selectItem = (ReportsDetail)reportsSelection.getRecord();
								out.println("<option " 
										+ (selectItem.getIBSRPN().equals(reportsHeader.getEDPRPN()) ? "selected " : "")
										+ "value=\"" + selectItem.getIBSRPN() + "\" " + " >" 
										+ selectItem.getIBSRPN() + " - " + selectItem.getIBSDSC()
										+ "</option>");

							}						
						%>
		                </select>
		        		</div>
					</th>
					<th nowrap width="25%" align="center"></th>
					<th align=right width="25%"></th>
					</tr>
				<%  } %>
</table>
				
<table class="tbenter" >
    <tr> 
      <td class=TDBKG width="50%" align="center" style="cursor:hand"><a href="javascript:goRefresh()"><b>Refrescar</b></a></td>
      <td class=TDBKG width="50%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>				
	
  <TABLE  id="mainTable" class="tableinfo" >
	<tr>
	<TD NOWRAP valign=top> 
	<TABLE id="dataTable" class="display compact hover" >
	<thead>
		 <TR id="trdark">  
			<th align=center width="10%" NOWRAP>Agencia</th>
			<th align=center width="20%" NOWRAP>Reporte</th>
			<th align=center width="50%" NOWRAP>Descripción</th>
			<th align=center width="20%" NOWRAP>Excel</th>
		 </tr>
       </thead>
  	<tbody>	
<%
	boolean firstItem = true;
	String chk = "checked";
	reportsList.initRow();
	while (reportsList.getNextRow()) {
		ReportsData dtoItem = (ReportsData) reportsList.getRecord();
		String report = dtoItem.getEDPRPN() + "(" + Util.formatCustomDate(currUser.getE01DTF(), dtoItem.getEDPDTM(), dtoItem.getEDPDTD(), dtoItem.getEDPDTY()) + ")"; 
%>
		<tr id="dataTable<%= reportsList.getCurrentRow() %>">
			<td nowrap align=center width="10%">
				<a href="javascript:openFile('<%= dtoItem.getEDPPTH() %>')" title="<%= report %>"><%= dtoItem.getEDPBRN() %></a>
			</td>
			<td nowrap align=center width="20%">
				<a href="javascript:openFile('<%= dtoItem.getEDPPTH() %>')" title="<%= report %>"><%= report %></a>
			</td>
			<td nowrap align=center width="50%">
				<a href="javascript:openFile('<%= dtoItem.getEDPPTH() %>')" title="<%= report %>"><%= dtoItem.getIBSDSC() %></a>
			</td>
<%		if (dtoItem.getEDPEXT().toLowerCase().equals("pdf")) { %>
			<td nowrap align="center" width="20%">
				<a href="javascript:openCSVFile('<%= dtoItem.getEDPPTH() %>')">
				<img src="<%=request.getContextPath()%>/images/calendar.gif" align="middle" vspace="0" hspace="0" border="0"></a>
			</td>
<%		} else { %>
			<td nowrap align="center" width="20%"></td>
<% 		} %>
		</tr>
<%	} %>
	</tbody>
    </table>
</TD>
</tr>		
</TABLE>

<SCRIPT>
	document.forms[0].totalRow.value="<%=reportsList.size()%>";
<% if(reportsHeader.isHistory()){ %>
	activateReportsDiv();	
<% } %>
</SCRIPT>
<p> &nbsp;</p>
<p> &nbsp;</p>
<TABLE border="0" width="607" class="tbenter">
	<TBODY>
		<TR>
			<TD></TD>
			<TD align="center">NOTA : Para ver los reportes necesita <A
				href="http://www.acrobat.com" target="_blank">Acrobat Reader </A>instalado
			</TD>
			<TD></TD>
		</TR>
		<TR>
			<TD></TD>
			<TD valign="middle" align="center">
				<A href="http://www.acrobat.com" target="_blank">
				<IMG src="<%=request.getContextPath()%>/images/s/getacro.gif" width="88" height="31" border="0"></A>
			</TD>
			<TD></TD>
		</TR>
	</TBODY>
</TABLE>
</FORM>
</BODY>
</HTML>
