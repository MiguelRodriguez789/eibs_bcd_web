<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<!DOCTYPE html>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/plugins/DataTables-1.10.20/css/jquery.dataTables.min.css"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/jquery/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/jquery/plugins/DataTables/js/jquery.dataTables.min.js"></script>

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgHelp" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<SCRIPT>setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);</SCRIPT>

<script>
	function enter(ctr, ste, cty, ctg, ctgd, sct, sctd) {
		var form = top.opener.document.forms[0];
  			
  		if (isValidObject(form[top.opener.fieldCtr])) form[top.opener.fieldCtr].value = ctr;
  		if (isValidObject(form[top.opener.fieldSte])) form[top.opener.fieldSte].value = ste;
  		if (isValidObject(form[top.opener.fieldCty])) form[top.opener.fieldCty].value = cty;
  		if (isValidObject(form[top.opener.fieldCtg])) form[top.opener.fieldCtg].value = ctg;
  		if (isValidObject(form[top.opener.fieldCtgd])) form[top.opener.fieldCtgd].value = ctgd;
  		if (isValidObject(form[top.opener.fieldSct])) form[top.opener.fieldSct].value = sct;
  		if (isValidObject(form[top.opener.fieldSctd])) form[top.opener.fieldSctd].value = sctd;
  		if (isValidObject(form[top.opener.fieldSct])) {
  			form[top.opener.fieldSct].focus();
  		}
  		top.close();
	}

	
	$(document).ready(function() {
    	$('#dataTable').DataTable( {
    	"lengthMenu": [[50, 100, 150, -1], [100, 200, 300, "All"]],
        "language": {
        	"decimal":        "",
    		"emptyTable":     "No hay Datos Dsiponibles",
    		"info":           "Mostrando_START_ a _END_ de _TOTAL_ Registros",
    		"infoEmpty":      "mostrando 0 a 0 de 0 Registros",
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

<title>City Categories Help</title>
</head>
<%@ page import="datapro.eibs.master.Util" %>

<body>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0675">

<input type="hidden" name="FromRecord" value="0">
<%
	if ( msgHelp.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height="100%">
	<TR>
      <TD> 
      	<div align="center">
		 	<b>No hay resultados para su criterio de busqueda </b>
		</div>
      </TD>
    </TR>
</TABLE>
<%   
		}
	else { 
%>	
<TABLE  id="mainTable" class="tableinfo" width="100%">
<tr>
<TD NOWRAP valign=top> 
	<TABLE id="dataTable" class="display compact hover" width="100%">
		<thead>
		<TR id="trdark"> 
    		<th>País</th>
    		<th>Estado</th>
    		<th>Ciudad</th>
    		<th>Categoría</th>
    		<th>Descripción</th>
    		<th>SubCategoría</th>
    		<th>Descripción</th>
    		<th>Tipo</th>
  		</tr>
  		</thead>
  		<tbody>
  <%
		msgHelp.initRow();
        while (msgHelp.getNextRow()) {
			datapro.eibs.beans.EWD0605DSMessage msg = (datapro.eibs.beans.EWD0605DSMessage) msgHelp.getRecord();
     	%>    
    <TR id="dataTable<%= msgHelp.getCurrentRow() %>">
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCTR()%>','<%= msg.getSWDSTE()%>','<%= msg.getSWDCTY()%>','<%= msg.getSWDCTG()%>','<%= msg.getSWDCTGD()%>','<%= msg.getSWDSCT()%>','<%= msg.getSWDSCTD()%>')">
			<%= Util.formatCell(msg.getSWDCTR())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCTR()%>','<%= msg.getSWDSTE()%>','<%= msg.getSWDCTY()%>','<%= msg.getSWDCTG()%>','<%= msg.getSWDCTGD()%>','<%= msg.getSWDSCT()%>','<%= msg.getSWDSCTD()%>')">
			<%= Util.formatCell(msg.getSWDSTE())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCTR()%>','<%= msg.getSWDSTE()%>','<%= msg.getSWDCTY()%>','<%= msg.getSWDCTG()%>','<%= msg.getSWDCTGD()%>','<%= msg.getSWDSCT()%>','<%= msg.getSWDSCTD()%>')">
			<%= Util.formatCell(msg.getSWDCTY())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCTR()%>','<%= msg.getSWDSTE()%>','<%= msg.getSWDCTY()%>','<%= msg.getSWDCTG()%>','<%= msg.getSWDCTGD()%>','<%= msg.getSWDSCT()%>','<%= msg.getSWDSCTD()%>')">
			<%= Util.formatCell(msg.getSWDCTG())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCTR()%>','<%= msg.getSWDSTE()%>','<%= msg.getSWDCTY()%>','<%= msg.getSWDCTG()%>','<%= msg.getSWDCTGD()%>','<%= msg.getSWDSCT()%>','<%= msg.getSWDSCTD()%>')">
			<%= Util.formatCell(msg.getSWDCTGD())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCTR()%>','<%= msg.getSWDSTE()%>','<%= msg.getSWDCTY()%>','<%= msg.getSWDCTG()%>','<%= msg.getSWDCTGD()%>','<%= msg.getSWDSCT()%>','<%= msg.getSWDSCTD()%>')">
			<%= Util.formatCell(msg.getSWDSCT())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCTR()%>','<%= msg.getSWDSTE()%>','<%= msg.getSWDCTY()%>','<%= msg.getSWDCTG()%>','<%= msg.getSWDCTGD()%>','<%= msg.getSWDSCT()%>','<%= msg.getSWDSCTD()%>')">
			<%= Util.formatCell(msg.getSWDSCTD())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCTR()%>','<%= msg.getSWDSTE()%>','<%= msg.getSWDCTY()%>','<%= msg.getSWDCTG()%>','<%= msg.getSWDCTGD()%>','<%= msg.getSWDSCT()%>','<%= msg.getSWDSCTD()%>')">
			<%= Util.formatCell(msg.getSWDTYP())%></a>
		</td>
	</TR>   	
		<%} %>	
	</tbody>
    </table>
</TD>
<tr>		
</TABLE>


<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% 	String parm = "&ctrfilter=" + userPO.getHeader20() + "&stefilter=" + userPO.getHeader21() + "&ctyfilter=" + userPO.getHeader22() + "&ctgfilter=" + userPO.getHeader23()+ "&typfilter=" + userPO.getHeader19();
       		if ( msgHelp.getShowPrev() ) {
       		int pos = msgHelp.getFirstRec() - 1000;
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0605?FromRecord=" + pos + parm + "\" > <img src=\""+request.getContextPath()+ "/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( msgHelp.getShowNext() ) {
      		int pos = msgHelp.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0605?FromRecord=" + pos + parm + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
	 
<%
   }  
%>
</form>
</body>
</html>