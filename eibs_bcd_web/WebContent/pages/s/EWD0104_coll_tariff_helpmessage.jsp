<html>
<head><title>Tablas de Tarifas para Cobranzas</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0104Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>
<script type="text/javascript">
	function enter(code) {
		var formLength = top.opener.document.forms[0].elements.length;
		for (n=0;n<formLength;n++) {
			var elementName = top.opener.document.forms[0].elements[n].name;
			if (elementName == top.opener.fieldName) {
	  			top.opener.document.forms[0].elements[n].value = code;
	  			break;
			}
	 	}
		top.close();
	}
</script>
</head>
<body>

<h3 align="center">Tablas de Cargos de Cobranzas</h3>

<%
	if ( ewd0104Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b> No hay resultados para su criterio 
        de busqueda  </b></font></div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
    <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
           <TR id="trdark"> 
			     <th width="10%">Codigo</th>
			     <th width="10%">Banco</th>
				  <th width="10%">Moneda</th>
			     <th width="20%">Tipo</th>
			     <th width="50%">Descripcion</th>
			  </TR>

    <%
                ewd0104Help.initRow();
                while (ewd0104Help.getNextRow()) {
                    if (ewd0104Help.getFlag().equals("")) {
                    		out.println(ewd0104Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>

</body>
</html>