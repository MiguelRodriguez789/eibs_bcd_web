<html> 
<head>
<title>Tablas Perdida Dado el Imcumplimiento</title>
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="EWD0117Help" class="datapro.eibs.beans.JBList"
	scope="session" />

<SCRIPT language="JavaScript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>
<script language="javascript">
function enter(code) {
	var formLength = top.opener.document.forms[0].elements.length;
	for (n=0;n<formLength;n++) {
	var elementName = top.opener.document.forms[0].elements[n].name;
		if(elementName == top.opener.fieldName){
	  		top.opener.document.forms[0].elements[n].value = code;
	  		break;
		}
	 }
	top.close();
}
</script>
</head>
<body>
<%
	if ( EWD0117Help.getNoResult() ) {
 %>
<TABLE class="tbenter" width=100% height=100%>
	<TR>
		<TD>
		<div align="center"><font size="3"><b> No hay
		resultados para su criterio de busqueda </b></font></div>
		</TD>
	</TR>
</TABLE>
<%   		
	}
	else {
%>

<TABLE class="tableinfo" style="width: 95%" ALIGN=CENTER>
	<TR id="trdark">
		<th width="10%">Garantia</th>
		<th width="10%">Descripci&oacute;n</th>
		<th width="30%">Tipo Credito </th>
		
	</TR>

	<%
                EWD0117Help.initRow();
                while (EWD0117Help.getNextRow()) {
                    if (EWD0117Help.getFlag().equals("")) {
                    		out.println(EWD0117Help.getRecord());
                    }
                }
    %>

</TABLE>

<%
   }
%>
</body>
</html>