<html>
<head><title>Busqueda de Sucursales</title>
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "ewd0210Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code,desc) {
		var form = top.opener.document.forms[0];
	 	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code;
		if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = desc;
	 	top.close();
	}
</script>
</head>
<body>
<%
if ( ewd0210Help.getNoResult() ) {
 %>
   		<TABLE  id="mainTable" class="tbenter" width=100% height=100%>
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

			<table class="tableinfo" style="width:95%" ALIGN=CENTER>
			 <tr id="trdark">
			  <th  ALIGN=CENTER nowrap width="10%">Plan</th>
			  <th  ALIGN=CENTER nowrap width="30%">Nombre</th>
			  <th  ALIGN=CENTER nowrap width="20%">Termino <br> Meses</th>
			  <th  ALIGN=CENTER nowrap width="20%">Minimo</th>
			  <th  ALIGN=CENTER nowrap width="20%">Maximo</th>
			 </tr>
		
<%		
	 ewd0210Help.initRow();
                while (ewd0210Help.getNextRow()) {
                    if (ewd0210Help.getFlag().equals("")) {
                    		out.println(ewd0210Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>

</body>
</html>			
		