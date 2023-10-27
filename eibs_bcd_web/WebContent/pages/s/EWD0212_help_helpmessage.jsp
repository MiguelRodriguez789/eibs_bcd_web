<html>
<head>
<title>Tabla de Factores</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EWD0212Help" class="datapro.eibs.beans.JBList" scope="session" />

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
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
<% if ( EWD0212Help.getNoResult() ) { %>
<TABLE class="tbenter" width=100% height=100%>
	<TR>
		<TD>
		<div align="center">
			<font size="3"><b> No hay resultados para su criterio de busqueda </b></font>
		</div>
		</TD>
	</TR>
</TABLE>
<% } else { %>
<h3> Tabla de Factores </h3>
<div id="dataDiv1"; style="overflow:auto;" "> 
<TABLE id="mainTable" class="tableinfo" style="width: 95%" ALIGN=CENTER>
	<TR id="trdark">
		<th width="25%">Codigo</th>
		<th width="75%">Descripción</th>
	</TR>

	<%
                EWD0212Help.initRow();
                while (EWD0212Help.getNextRow()) {
                    if (EWD0212Help.getFlag().equals("")) {
                    		out.println(EWD0212Help.getRecord());
                    }
                }
    %>
</TABLE>
</div>
<% } %>
</body>
</html>