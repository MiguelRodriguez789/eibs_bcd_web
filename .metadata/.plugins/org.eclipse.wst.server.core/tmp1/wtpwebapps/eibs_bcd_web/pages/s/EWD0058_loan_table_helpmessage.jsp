<html>
<head>
<title>Busqueda de Cargos para Prestamos</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EWD0058Help" class="datapro.eibs.beans.JBList" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


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

	if(window.opener.jQuery){
		window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
	}	 

	top.close();
}
</script>
</head>
<body>
<h3 align="center">Tabla de Cargos para Prestamos</h3>

<%
	if ( EWD0058Help.getNoResult() ) {
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
		<th width="10%">Codigo</th>
		<th width="10%">Banco</th>
		<th width="30%">Tipo</th>
		<th width="50%">Descripcion</th>
	</TR>

	<%
                EWD0058Help.initRow();
                while (EWD0058Help.getNextRow()) {
                    if (EWD0058Help.getFlag().equals("")) {
                    		out.println(EWD0058Help.getRecord());
                    }
                }
    %>

</TABLE>

<%
   }
%>
</body>
</html>