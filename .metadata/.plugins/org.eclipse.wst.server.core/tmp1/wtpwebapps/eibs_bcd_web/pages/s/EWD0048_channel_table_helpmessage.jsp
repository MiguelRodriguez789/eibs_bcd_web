<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><title>Busqueda de Canales</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0048Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code,name) {
		var form = top.opener.document.forms[0];
		form[top.opener.fieldName].value = code;
		form[top.opener.fieldDesc].value = name;
		top.close();
 	}
</script>

</head>

<body>
<%
	if ( ewd0048Help.getNoResult() ) {
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
			     <th width="30%">Canal</th>
				  <th width="70%">Descripción</th>
			  </TR>

    <%
                ewd0048Help.initRow();
                while (ewd0048Help.getNextRow()) {
                    if (ewd0048Help.getFlag().equals("")) {
                    		out.println(ewd0048Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>