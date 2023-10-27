<html>
<head><title>Busqueda de Comisiones Extendido</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0047Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code,name,min,max,per) {
		var form = top.opener.document.forms[0];
		form[top.opener.fieldName].value = code;
		form[top.opener.fieldDesc].value = name;
		form[top.opener.fieldAux1].value = min;
		form[top.opener.fieldAux2].value = max;
		form[top.opener.fieldAux3].value = per;	
		form[top.opener.fieldAux3].focus();	
		if(window.opener.jQuery){
			window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
		}
		top.close();
 	}
</script>

</head>

<body>
<%
	if ( ewd0047Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"><b> No hay resultados para su criterio de busqueda </b></div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
    <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
			      <th width="15%">Comision</th>
				  <th width="40%">Descripción</th>
				  <th width="15%">Valor Mínimo</th>
				  <th width="15%">Valor Máximo</th>
				  <th width="15%">Periodo</th>
			  </TR>

    <%
                ewd0047Help.initRow();
                while (ewd0047Help.getNextRow()) {
                    if (ewd0047Help.getFlag().equals("")) {
                    		out.println(ewd0047Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>

</html>