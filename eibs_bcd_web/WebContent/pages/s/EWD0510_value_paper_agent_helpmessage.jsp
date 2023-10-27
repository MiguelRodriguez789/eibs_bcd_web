<html> 
<head>
<title>Busqueda de Cheque</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "EWD0510Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
function enter(sub,name,lot,ini,fin,bal,chk) {
	var form = top.opener.document.forms[0];
	if (isValidObject(form[top.opener.fieldSub])) form[top.opener.fieldSub].value = sub;
 	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = name;
 	if (isValidObject(form[top.opener.fieldLot])) form[top.opener.fieldLot].value = lot;
 	if (isValidObject(form[top.opener.fieldIni])) form[top.opener.fieldIni].value = ini;
 	if (isValidObject(form[top.opener.fieldFin])) form[top.opener.fieldFin].value = fin;
 	if (isValidObject(form[top.opener.fieldBal])) form[top.opener.fieldBal].value = bal;
 	if (isValidObject(form[top.opener.fieldChk])) form[top.opener.fieldChk].value = chk;
 	top.close();
}
</script>

</head>
<body>
<%if ( EWD0510Help.getNoResult() ) {%>
	<table class="tbenter" width=100% height=100%>
		<tr>
			<td> 
				<div align="center"> <font size="3"><b>No hay resultados para su criterio de busqueda </b></font></div>
	      	</td>
		</tr>
	</table>
<%}	else {%>	
	<table class="tableinfo" style="width:95%" ALIGN=CENTER>
		<tr id="trdark">
			<th align=center  nowrap width=40%>Denominacion</th>
			<th align=center  nowrap width=15%>Numero<br>Inicial</th>
			<th align=center  nowrap width=15%>Numero<br>Final</th>
			<th align=center  nowrap width=30%>Balance</th>
		</tr>
		<%
		EWD0510Help.initRow();
		while (EWD0510Help.getNextRow()) {
		    if (EWD0510Help.getFlag().equals("")) {
		    		out.println(EWD0510Help.getRecord());
		    }
		}
	    %> 
	</table>
<%}%>
</body>
</html>			
