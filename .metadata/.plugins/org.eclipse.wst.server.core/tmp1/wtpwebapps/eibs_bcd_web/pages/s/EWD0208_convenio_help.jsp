<html>
<head><title>Convenio</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "help" class= "datapro.eibs.beans.JBList"   scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">

function enter(code, desc, flg1) {
	var oForm = top.opener.document.forms[0];
	if (top.opener.fieldName.trim() != "" && oForm[top.opener.fieldName]) {
		oForm[top.opener.fieldName].value = code;
	}
	if (top.opener.fieldDesc.trim() != "" && oForm[top.opener.fieldDesc]) {
		oForm[top.opener.fieldDesc].value = desc;
	}
	if (isValidObject(oForm[top.opener.fieldAux1])) {
		if (top.opener.fieldAux1.trim() != "" && oForm[top.opener.fieldAux1]) {
			oForm[top.opener.fieldAux1].value = flg1;
		}
	} 
	
	triggerOnchangeOpener(top.opener.fieldName);
	
	top.close();
 }

</script>
</head>
<body>

<%if ( help.getNoResult() ) {%>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b> No hay resultados para su criterio de busqueda  </b></font></div>
      </TD></TR>
   		</TABLE>
<% }else { %>	

      <table class="tableinfo" style="width:95%" ALIGN=CENTER>
			 <tr id="trdark">
			  <th align="center">C&oacute;digo</th>
			  <th align="center">Descripci&oacute;n</th>
			  <th align="center"> Vence</th>
			 </tr>
		
<%		
	 help.initRow();
                while (help.getNextRow()) {
                    if (help.getFlag().equals("")) {
                    		out.println(help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>					
		