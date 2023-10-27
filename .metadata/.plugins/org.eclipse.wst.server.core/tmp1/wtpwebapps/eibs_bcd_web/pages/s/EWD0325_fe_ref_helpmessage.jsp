<html>
<head>
<title>Foreign Exchange</title>
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="EWD0325Help" class="datapro.eibs.beans.JBList"
	scope="session" />

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code1, code2, codea, desc) {
	  	if (top.opener.fieldName != null) top.opener.document.forms[0][top.opener.fieldName].value = code1;
	  	if (top.opener.fieldAux1 != null) top.opener.document.forms[0][top.opener.fieldAux1].value = code2;
	  	if (top.opener.fieldAux2 != null) top.opener.document.forms[0][top.opener.fieldAux2].value = codea;
	  	if (top.opener.fieldAux3 != null) {
	  		top.opener.document.forms[0][top.opener.fieldAux3].value = desc;
	  		top.opener.document.forms[0][top.opener.fieldAux3].focus();
	  	}	
  		top.close();
 	}
</script>
</head>
<body>
<%
	if ( EWD0325Help.getNoResult() ) {
 %>
<TABLE class="tbenter" width=100% height=100%>
	<TR>
		<TD>
		<div align="center"><b> No hay resultados para su criterio
		de busqueda </b></div>
		</TD>
	</TR>
</TABLE>
<%  
		}
	else {
%>

<TABLE class="tableinfo" align="center" style="width: '95%'">
	<TR id="trdark">
		<th>Número de<BR>
		Referencia</th>
		<th>Contraparte</th>
		<th>Tipo</th>
		<th>Mda</th>
		<th>Monto</th>
		<th>Tesorero</th>
	</tr>
	<%
                EWD0325Help.initRow();
                while (EWD0325Help.getNextRow()) {
                    if (EWD0325Help.getFlag().equals("")) {
                    		out.println(EWD0325Help.getRecord());
                    }
                }
    %>
</TABLE>
<%
   }  
%>
</body>
</html>