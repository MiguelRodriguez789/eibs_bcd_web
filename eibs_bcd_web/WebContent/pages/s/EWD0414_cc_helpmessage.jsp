<html>
<head>
<title>Tarjetas</title>
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="EWD0414Help" class="datapro.eibs.beans.JBList"
	scope="session" />

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code,desc) {
		var form = top.opener.document.forms[0];
	  	if (top.opener.fieldDesc.trim() != "") {form[top.opener.fieldDesc].value = desc;}
		form[top.opener.fieldName].value = code;
		if (form[top.opener.fieldName].type != "hidden") 
			form[top.opener.fieldName].focus();
		else 
			form[top.opener.fieldDesc].focus();
		form[top.opener.fieldName].select();
		top.close();
	}
</script>
</head>
<body>
<%
	if ( EWD0414Help.getNoResult() ) {
 %>

<h4 align="center">Estados de Tarjetas</h4>
<TABLE class="tbenter" width=100% height=100%>
	<TR>
		<TD>
		<div align="center"><b> No hay resultados para su criterio
		de B�squeda </b></div>
		</TD>
	</TR>
</TABLE>
<%  
	}
	else {
%>
<TABLE class="tableinfo" align="center" style="width: '95%'">
	<TR id="trdark">
		<th>C�digo</th>
		<th>
		<div align="center">Descripci�n</div>
		</th>
	</tr>
	<%
                EWD0414Help.initRow();
                while (EWD0414Help.getNextRow()) {
                    if (EWD0414Help.getFlag().equals("")) {
                    		out.println(EWD0414Help.getRecord());
                    }
                }
    %>
</TABLE>
<%
   }  
%>
</body>
</html>