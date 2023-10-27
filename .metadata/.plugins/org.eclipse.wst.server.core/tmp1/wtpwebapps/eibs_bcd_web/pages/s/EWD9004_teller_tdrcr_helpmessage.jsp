<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><title>Busqueda de Transacciones</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD9004Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

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
	if ( EWD9004Help.getNoResult() ) {
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
			     <th width="10%">Host Id</th>
				  <th width="90%">Descripción</th>
			  </TR>

    <%
                EWD9004Help.initRow();
                while (EWD9004Help.getNextRow()) {
                    if (EWD9004Help.getFlag().equals("")) {
                    		out.println(EWD9004Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>