<%@ page import="datapro.eibs.beans.ESG010001Message"%>
<%@ page import="datapro.eibs.master.Util"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Polizas de seguros - Aprobacion</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="ESG010001List" class="datapro.eibs.beans.JBObjList"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">


function goAction(op) {
	document.forms[0].SCREEN.value = op;
	document.forms[0].submit();
}
  
 function showAddInfo(idxRow){
   //tbAddInfo.rows[0].cells[1].style.color="#d0122c";   
   //tbAddInfo.rows[0].cells[1].innerHTML=extraInfo(getElement("TXTDATA"+idxRow).value,4);
 } 
   
 function extraInfo(textfields,noField) {
	 var pos=0
	 var s= textfields;
	 for ( var i=0; i<noField ; i++ ) {
	   pos=textfields.indexOf("<br>",pos+1);
	  }
	 s=textfields.substring(0,pos);
	 return(s);
 }  
function showInqApprovalSG(num) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESG0100?SCREEN=901&PACNUM=" + num;
	CenterWindow(page,600,500,2);
}
</script>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Polizas de Seguros - Aprobacion<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="PAC_seguros_approval_list.jsp,ESG0100"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESG0100">
<input type="hidden" name="SCREEN" value="201"> 
<input type="hidden" name="selected_customer">
<input type="hidden" name="customer_number" value="<%=(String) request.getAttribute("customer_number") %>">	

<%
	if (ESG010001List.getNoResult()) {
%>
<TABLE class="tbenter" width=100% height=90%>
	<TR>
		<TD>
		<div align="center"><font size="3"><b> No hay
		resultados que correspondan a su criterio de búsqueda. </b></font></div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>
<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="35%">
			<div align="center"><a href="javascript:goAction(200)" id="linkApproval"><b>Aprobar</b></a></div>
		</td>
		<td class=TDBKG width="35%">
			<div align="center"><a href="javascript:goAction(300)" id="linkReject"><b>Rechazar</b></a></div>
		</td>
		<td class=TDBKG width="30%">
		<div align="center"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</td>
	</tr>
</table>
<table id="mainTable" class="tableinfo" align="center">
	<tr>
		<td nowrap valign="top">
		<table id="dataTable" width="100%">
			<tr id="trclear">
				<th align="center" nowrap></th>
				<th align="center" nowrap>N&uacute;mero</th>
				<th align="center" nowrap>Cliente</th>
				<th align="center" nowrap>Nombre</th>
				<th align="center" nowrap>Seguro</th>
			</tr>
			<%
				ESG010001List.initRow();
					boolean firstTime = true;
					String chk = "";
					while (ESG010001List.getNextRow()) {
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = "";
						}
						ESG010001Message convObj = (ESG010001Message) ESG010001List
								.getRecord();
			%>
			<tr id="trdark">
				<td nowrap><input type="radio" name="key"
					value="<%=ESG010001List.getCurrentRow()%>" onclick="showAddInfo(<%=ESG010001List.getCurrentRow()%>);"
					<%=chk%>></td>
				<td nowrap align="center"><a href="javascript:showInqApprovalSG('<%= ESG010001List.getCurrentRow()%>');"><%= Util.formatCell(convObj.getE01PACNUM())%></a></td>
				<td nowrap align="center"><a href="javascript:showInqApprovalSG('<%= ESG010001List.getCurrentRow()%>');"><%= Util.formatCell(convObj.getE01PACCUN())%></a></td>
				<td nowrap align="left"><a href="javascript:showInqApprovalSG('<%= ESG010001List.getCurrentRow()%>');"><%= Util.formatCell(convObj.getE01CUSNA1())%></a></td>
				<td nowrap align="left"><a href="javascript:showInqApprovalSG('<%= ESG010001List.getCurrentRow()%>');"><%= Util.formatCell(convObj.getE01DESPAC())%></a></td>
				<td nowrap align="center"><a href="javascript:showInqApprovalSG('<%= ESG010001List.getCurrentRow()%>');"><%= Util.formatCell(convObj.getE01DESCIA())%></a></td>
			</tr>
			<%
				}
			%>
		</table>
		</td>
	</tr>
</table>

<script type="text/javascript">
     showAddInfo(0);     
     
</script> <br>
<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (ESG010001List.getShowPrev()) {
					int pos = ESG010001List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch="
									//+ ESG010001List.getSearchText() + "&Type="
									//+ ESG010001List.getSearchType() + "&Pos=" + pos
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ESG010001List.getShowNext()) {
					int pos = ESG010001List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch="
									//	+ cifList.getSearchText() + "&Type="
									//	+ cifList.getSearchType() + "&Pos=" + pos
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/next_records.gif\" ></A>");
				}
		%>
		</td>
	</tr>
</table>
<%
	}
%>
</form>

</body>
</html>
