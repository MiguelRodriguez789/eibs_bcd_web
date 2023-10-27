<html>
<head>
<title>Tablas de Tasa Variable</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ewd0100Help" class="datapro.eibs.beans.JBList" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<script type="text/javascript">
function enter(code, typ, dsc, prmrte, secrte) {
	var form = top.opener.document.forms[0];
	if (form[top.opener.fieldName] != null) {
		form[top.opener.fieldName].value = code;
  		if (form[top.opener.fieldType] != null) {

			if (form[top.opener.fieldPrrte] != null) {
				form[top.opener.fieldPrrte].value = prmrte;
			}	
			
			if (form[top.opener.fieldSrrte] != null) {
				form[top.opener.fieldSrrte].value = secrte;
			}	

			form[top.opener.fieldType].value = typ;
			form[top.opener.fieldName].onchange();
  		}
	}
	
	if (form[top.opener.fieldDscr] != null) {
		form[top.opener.fieldDscr].value = dsc;
	}
	
	if(window.opener.jQuery){
		window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
	}	
	
	top.close();
}
</script>
</head>
<body>
<h3 align="center">Tablas de Tasa Variable</h3>

<%
	if ( ewd0100Help.getNoResult() ) {
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
<table class="tableinfoList" style="width: 95%" ALIGN=CENTER>
	<tr id="trdark">
		<th>Tabla</th>
		<th>Descripcion</th>
		<th>Tasa Primaria</th>
		<th>Tasa Secundaria</th>
		<th>TIPO</th>
		<th>Fecha</th>
	</tr>
	<%
                ewd0100Help.initRow();
                while (ewd0100Help.getNextRow()) {
                    if (ewd0100Help.getFlag().equals("")) {
                    		out.println(ewd0100Help.getRecord());
                    }
                }
    %>

</TABLE>

<%
   }
%>
</body>
</html>