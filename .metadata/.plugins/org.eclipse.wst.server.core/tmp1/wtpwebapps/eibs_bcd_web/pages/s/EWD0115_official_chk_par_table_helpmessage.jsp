<html>
<head><title>Busqueda de Formatos de Cheques Oficiales</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0115Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code) {
		var formLength= top.opener.document.forms[0].elements.length;
		for(n=0;n<formLength;n++){
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
<h3 align="center">Formato de Cheques Oficiales</h3>

<%
	if ( ewd0115Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b> No hay resultados para su criterio 
        de busqueda </b></font></div>
      </TD></TR>
   		</TABLE>
<%   		
		}
	else {
%>	

		<table class="tableinfo" style="width:95%" ALIGN=CENTER>
			<tr id="trdark" >
			 <th>Banco</th>
			 <th>Moneda</th>
			 <th>Formato Tipo</th>
			 <th>Descripcion</th>
			</tr>
<%
                ewd0115Help.initRow();
                while (ewd0115Help.getNextRow()) {
                    if (ewd0115Help.getFlag().equals("")) {
                    		out.println(ewd0115Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>	