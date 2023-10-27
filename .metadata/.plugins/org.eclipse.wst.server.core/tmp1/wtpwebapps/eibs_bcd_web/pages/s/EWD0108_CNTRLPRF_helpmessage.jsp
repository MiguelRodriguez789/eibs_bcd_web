<html>
<head>
<title>Busqueda cargos de Transferencias</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "ewd0108Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code, amt) {
		var form= top.opener.document.forms[0];
  		if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code;
  		if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = amt; 
		top.close();
 	}
</script>
</head>

<body>
<h3 align="center">Tabla de Cargos de transferencias</h3>

<%
	if ( ewd0108Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"><b> No hay resultados para su b&uacute;squeda</b></div>
      </TD></TR>
   		</TABLE>
<%   		
		}
	else {
%>	

		
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th>C&oacute;digo</th>
    <th>Descripci&oacute;n</th>
  </tr>
  <%
                ewd0108Help.initRow();
                while (ewd0108Help.getNextRow()) {
                    if (ewd0108Help.getFlag().equals("")) {
                    		out.println(ewd0108Help.getRecord());
                    }
                }
    %> 
</TABLE>

<%
   }
%>
</body>
</html>	