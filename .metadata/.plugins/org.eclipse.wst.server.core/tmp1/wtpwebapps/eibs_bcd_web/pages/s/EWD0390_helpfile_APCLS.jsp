<html>
<head><title>Código de Aplicación</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "ewd0390Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code,desc) {
		var form = top.opener.document.forms[0];
  		if (isValidObject(form[top.opener.fieldName])) {
  			form[top.opener.fieldName].value = code;
  			form[top.opener.fieldName].focus();
  		}	
  		if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = desc;
  		top.close();
	}
</script>
</head>
<body>

<%
  if ( ewd0390Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b> No hay resultados para su criterio de busqueda  </b></font></div>
      </TD></TR>
   		</TABLE>
<%   		
		}
	else {
%>	

      <table class="tableinfo" style="width:95%" ALIGN=CENTER>
			 <tr id="trdark">
			  <th>Código de Aplicación</th>
			  <th>Descripción</th>
			 </tr>
		
<%		
	 ewd0390Help.initRow();
                while (ewd0390Help.getNextRow()) {
                    if (ewd0390Help.getFlag().equals("")) {
                    		out.println(ewd0390Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>					
		