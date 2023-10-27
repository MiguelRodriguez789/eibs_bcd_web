<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.Iterator"%>
<%@page import="datapro.eibs.master.Util"%>

<%@page import="com.datapro.eibs.teller.vo.ATSHIFTS"%><html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="tellerShifts" class="java.util.ArrayList"  scope="session" />

<script type="text/javascript">
function selectField(field){
	try {
		field.focus();
		field.select();
	} catch (e){
	}	
}

function setField(field, value){
	try {
		field.value = value;
		field.onchange();
	} catch(e) {
	}
}

function a(code, desc) {
	var form = top.opener.document.getElementById("formTeller");
	
	setField(form[top.opener.fieldAux1], desc);
	setField(form[top.opener.fieldName], code);
		
	if (form[top.opener.fieldName].type != "hidden") {
		selectField(form[top.opener.fieldName]);
	} else {
		selectField(form[top.opener.fieldAux1]);
	}  		
	top.close();
}
 
</script>

</head>

<body>
<form>
<%
	if (tellerShifts.isEmpty() ) {
%>
<TABLE class="tbenter" width="95%" ALIGN="CENTER">
	<TR>
		<TD>
		<div align="center"><b>La tabla de códigos está vacía</b></div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>
  <TABLE class="tableinfo" width="95%" ALIGN=CENTER>
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="20%">Código</TH>
      <TH ALIGN=CENTER  nowrap width="80%">Valor</TH>
    </TR>
     	<%
		Iterator iter = tellerShifts.listIterator();
        while (iter.hasNext()) {
			ATSHIFTS entry = (ATSHIFTS) iter.next();
		%>
        <TR>
			<td NOWRAP><a href="javascript:a('<%=entry.getCODESHIFT()%>','<%=entry.getDESCRIPTION()%>')"><%=Util.formatCell(entry.getCODESHIFT().toUpperCase())%></a></td>
			<td NOWRAP><a href="javascript:a('<%=entry.getCODESHIFT()%>','<%=entry.getDESCRIPTION()%>')"><%=Util.formatCell(entry.getDESCRIPTION().toUpperCase())%></a></td>
			</TR>   		
		<% } %>   
  </TABLE>
	<%}%>
</form>
</body>
</html>
