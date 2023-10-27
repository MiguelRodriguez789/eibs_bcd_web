<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><title>Tipo de Chequera</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "ewd0118Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

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
	if ( ewd0118Help.getNoResult() ) {
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
			<h4>Tipos de Chequera</h4>
			<table class="tableinfo" style="width:95%" ALIGN=CENTER> 
			 <tr id="trdark"> 
			  <th >Tipo</th>
			  <th >Clase</th> 
			  <th >Tipo Cta.</th>
			  <th >MDA</th>
			  <th >Descripción</th> 
			  <th >No. Chq.</th> 
			 </tr> 
<%
                ewd0118Help.initRow();
                while (ewd0118Help.getNextRow()) {
                    if (ewd0118Help.getFlag().equals("")) {
                    		out.println(ewd0118Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>	 
