<html>
<head><title>Tipos de Producto para Tesoreria</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0301Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
function enter(code) {
	var formLength = top.opener.document.forms[0].elements.length;
	for (n=0;n<formLength;n++) {
		var elementName= top.opener.document.forms[0].elements[n].name;
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
	if ( ewd0301Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b> No hay resultados para su criterio 
        de busqueda   </b></font></div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
    <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
           <TR id="trdark"> 
			     <th width="30%">Codigo</th>
			     <th width="70%">Descripción</th>
			  </TR>

    <%
    			ewd0301Help.initRow();
                while (ewd0301Help.getNextRow()) {
                    if (ewd0301Help.getFlag().equals("")) {
                    		out.println(ewd0301Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>