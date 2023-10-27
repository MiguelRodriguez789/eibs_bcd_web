<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/plugins/DataTables/css/jquery.dataTables.min.css"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/jquery/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/jquery/plugins/DataTables/js/jquery.dataTables.min.js"></script>


<jsp:useBean id= "EWD0900Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<title>User Spool</title>

<script>

function goAction(op) {

	getElement("opt").value = op;
	if (op == 1) {
	    var row = getElement("selRow").value;
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.general.JSEWD0900?SCREEN=2&ROW=" + row + "&opt=" + op;
		CenterNamedWindow(page,'PDF',500,500,7);		
		//document.forms[0].target="PDF"
	} else {
		document.forms[0].target="";
		var ok = false;
		switch (op) {
			case 2:
				ok = confirm("El documento seleccionado será borrado");
				break;
			case 3:
				ok = confirm("Todos los documentos de esta página serán borrados");
				break;
	
			default:
				break;
		}
		if (!ok) return;
		document.forms[0].submit();
	}
}

function  selectRow(table, row) {
	getElement("selRow").value = row;
	highlightRow(table, row);
}

function openCSVFile(nameOfFile, row) {
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSPDFParserSend?source=S&REPNAME="+nameOfFile+"&ROW="+row;
   	CenterWindow(pg, 600, 500, 2);
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

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Bandeja de Impresión<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sel_spool.jsp, EWD0900"></h3>
<hr size="4">
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.general.JSEWD0900" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="2">
  <input type=HIDDEN name="opt" id="opt" value="1">
  <input type=HIDDEN name="totalRow" id="totalRow" value="0">
  <input type=HIDDEN name="selRow" id="selRow" value="0">
  <%
	if ( EWD0900Help.getNoResult() ) {
 %> 
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>Lista Vacia por el momento</b></p>
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center" style="cursor:hand"> <a href="javascript:goAction(1)"><b>Consulta</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center" style="cursor:hand"><a href="javascript:goAction(2)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center" style="cursor:hand"><a href="javascript:goAction(3)"><b>Limpiar<br>Bandeja</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
<TABLE  id="mainTable" class="tableinfo" >
<tr>
<TD NOWRAP valign=top> 
	<TABLE id="dataTable" class="display compact hover" >
	<thead>
		<tr id="trdark">
	        <th align=CENTER nowrap width="10%">&nbsp;</th>
	        <th align=CENTER nowrap width="10%">Archivo</th>
	        <th align=CENTER nowrap width="10%">Número</th>
	        <th align=CENTER nowrap width="25%">Cola</th>
	        <th align=CENTER nowrap width="10%">Estado</th>
	        <th align=CENTER nowrap width="10%">Páginas</th>
	        <th align=CENTER nowrap width="10%">Fecha</th>
	        <th align=CENTER nowrap width="10%">Hora</th>
   			<th align=CENTER nowrap width="5%"><div align="center">Excel</div></th>
		</tr>
        </thead>
  	<tbody>	         
			<%
                EWD0900Help.initRow();
				boolean firstTime = true;
				String chk = "";
				int k=1;
                while (EWD0900Help.getNextRow()) {                 
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  datapro.eibs.beans.EWD0900DSMessage msgList = (datapro.eibs.beans.EWD0900DSMessage) EWD0900Help.getRecord();
                  %>                  
          			<tr id="dataTable<%= EWD0900Help.getCurrentRow() %>"> 
			            <td NOWRAP  align=CENTER width="10%"><input type="radio" name="ROW" value="<%= EWD0900Help.getCurrentRow() %>" <%=chk%> class="highlight" onClick="selectRow('dataTable', <%= EWD0900Help.getCurrentRow() %>)" ></td>
						<TD NOWRAP ALIGN=CENTER width="10%"><%=msgList.getSWDFIL()%></TD>
						<TD NOWRAP ALIGN=CENTER width="10%"><%=msgList.getSWDPLN()%></TD>
						<TD NOWRAP ALIGN=LEFT width="25%"><%=msgList.getSWDOUT()%></TD>
						<TD NOWRAP ALIGN=CENTER width="10%"><%=msgList.getSWDSTS()%></TD>
						<TD NOWRAP ALIGN=CENTER width="10%"><%=msgList.getSWDPAG()%></TD>
						<TD NOWRAP ALIGN=CENTER width="10%"><%=msgList.getSWDDAT()%></TD>
						<TD NOWRAP ALIGN=CENTER width="10%"><%=msgList.getSWDTIM()%></TD>
						<TD nowrap align="center" width="5%">
							<% if (msgList.getSWDSTS().indexOf("pdf") > -1 || msgList.getSWDSTS().indexOf("txt") > -1) { %>
							<a href="javascript:openCSVFile('<%=msgList.getSWDFIL() %>', <%=k %>)">
								<img src="<%=request.getContextPath()%>/images/calendar.gif" align="bottom" vspace="0" hspace="0" border="0">
							</a>
							<% } %>
						</TD>
					</TR>
				<% k++; } %> 
</tbody>
    </table>
</TD>
</tr>		
</TABLE>

<SCRIPT type="text/javascript">
	showChecked("ROW");
     getElement("totalRow").value="<%= k %>";
     try {
	     document.forms[0].ROW[0].click();
	 } catch (e) {
	     document.forms[0].ROW.click();
	 }
     
</SCRIPT>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EWD0900Help.getShowPrev() ) {
      			int pos = EWD0900Help.getFirstRec() - 1001;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.general.JSEWD0900?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( EWD0900Help.getShowNext() ) {
      			int pos = EWD0900Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.general.JSEWD0900?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
  %> 
   </TD>
 	</TR>
 	</TABLE>
<%}%>


  </form>

</body>
</html>
