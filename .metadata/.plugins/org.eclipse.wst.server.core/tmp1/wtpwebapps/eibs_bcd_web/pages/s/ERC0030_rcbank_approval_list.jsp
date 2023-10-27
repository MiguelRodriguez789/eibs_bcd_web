<%@ page import="datapro.eibs.beans.ERC003001Message"%>
<%@ page import="datapro.eibs.master.Util"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Conciliacion Bancaria</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="ERC003001List" class="datapro.eibs.beans.JBObjList"
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

function goDelete(op) {
	if (confirm("Esta seguro que desea borrar esta Cartola?")) {
		goAction(op);
	}
}
  
 function showAddInfo(idxRow){
   tbAddInfo.rows[0].cells[1].style.color="#d0122c";   
   tbAddInfo.rows[0].cells[1].innerHTML=extraInfo(getElement("TXTDATA"+idxRow).value,4);
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
function showInqApproval() {

// modify in 02-10-2013 by  :  	Alonso Arana            	    DATAPRO     

	var valor_key = getElementChecked("key").value;//valor selección checkbox

	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSERC0030?SCREEN=901&key="+valor_key;

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

<h3 align="center">Conciliacion  Automatica de Cartolas<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="rcbank_approval_list.jsp,ERC0030"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0030">
<input type="hidden" name="SCREEN" value="201"> 
<input type="hidden" name="selected_customer">
<input type="hidden" name="customer_number" value="<%=(String) request.getAttribute("customer_number") %>">	


<% if (ERC003001List.getNoResult()) { %>
<TABLE class="tbenter" width=100% height=90%>
	<TR>
		<TD>
		<div align="center"><font size="3"><b> No hay resultados que correspondan a su criterio de búsqueda. </b></font></div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>
<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="35%">
			<div align="center"><a href="javascript:goAction(200)" id="linkApproval"><b>Conciliar</b></a></div>
		</td>
		<td class=TDBKG width="35%">
			<div align="center"><a href="javascript:goDelete(300)" id="linkReject"><b>Borrar</b></a></div>
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
				<th align="center" nowrap>Banco</th>
				<th align="center" nowrap>Cuenta Banco</th>
				<th align="center" nowrap>Cliente</th>
				<th align="center" nowrap>Cuenta IBS</th>
				<th align="center" nowrap>Cartola</th>
				<th align="center" nowrap>Fecha</th>
			</tr>
			<%
				ERC003001List.initRow();
					boolean firstTime = true;
					String chk = "";
					while (ERC003001List.getNextRow()) {
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = "";
						}
						ERC003001Message convObj = (ERC003001Message) ERC003001List
								.getRecord();
			%>
			<tr id="trdark">
				<td nowrap><input type="radio" name="key"
					value="<%=ERC003001List.getCurrentRow()%>" onclick="showAddInfo(<%=ERC003001List.getCurrentRow()%>);" <%=chk%>></td>
				<td nowrap align="center"><a href="javascript:showInqApproval();"><%= Util.formatCell(convObj.getE01RCIRBK())%></a></td>
				<td nowrap align="center"><a href="javascript:showInqApproval();"><%= Util.formatCell(convObj.getE01RCICTA())%></a></td>
				<td nowrap align="left"><a href="javascript:showInqApproval();"><%= Util.formatCell(convObj.getE01CUSNA1())%></a></td>
				<td nowrap align="left"><a href="javascript:showInqApproval();"><%= Util.formatCell(convObj.getE01RCIACC())%></a></td>
				<td nowrap align="center"><a href="javascript:showInqApproval();"><%= Util.formatCell(convObj.getE01RCISTN())%></a></td>
				<td nowrap align="center"><a href="javascript:showInqApproval();"><%= Util.formatDate(convObj.getE01RCISDD(),convObj.getE01RCISDM(),convObj.getE01RCISDY())%></a></td>
			</tr>
			<% } %>
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
			if (ERC003001List.getShowPrev()) {
					int pos = ERC003001List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch="
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ERC003001List.getShowNext()) {
					int pos = ERC003001List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch="
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/next_records.gif\" ></A>");
				}
		%>
		</td>
	</tr>
</table>
<% } %>
</form>

</body>
</html>
