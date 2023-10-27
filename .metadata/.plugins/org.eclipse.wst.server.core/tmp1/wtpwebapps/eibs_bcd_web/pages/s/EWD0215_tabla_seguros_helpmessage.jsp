<html>
<head><title>Busqueda Planes de Seguros</title>
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0215Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code,desc,fact,tblf,pbse) {
		var form = top.opener.document.forms[0];
	 	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code;
		if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = desc;
		if (isValidObject(form[top.opener.fieldAux1])) form[top.opener.fieldAux1].value = fact;
		if (isValidObject(form[top.opener.fieldAux2])) form[top.opener.fieldAux2].value = tblf;
		if (isValidObject(form[top.opener.fieldAux3])) form[top.opener.fieldAux3].value = pbse;
		if(window.opener.jQuery){
			window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
		}
	 	top.close();
	}
</script>
</head>
<body>
<h3 align="center">Planes de Seguros</h3>

<%
if ( ewd0215Help.getNoResult() ) {
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
			  <th  ALIGN=CENTER nowrap width="30%">Meses <br> Minimo</th>
			  <th  ALIGN=CENTER nowrap width="30%">Meses <br> Maximo</th>
			 </tr>
		
<%		
	 ewd0215Help.initRow();
                while (ewd0215Help.getNextRow()) {
                    if (ewd0215Help.getFlag().equals("")) {
                    		out.println(ewd0215Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>

</body>
</html>			
		